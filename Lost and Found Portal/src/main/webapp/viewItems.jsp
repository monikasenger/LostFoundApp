<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>📋 View Items</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #e3f2fd, #fce4ec);
            margin: 0;
            padding: 40px 20px;
        }

        .container {
            max-width: 900px;
            margin: auto;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        form {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 12px;
            flex-wrap: wrap;
            margin-bottom: 25px;
        }

        label {
            font-weight: 500;
            color: #37474f;
        }

        select {
            padding: 10px 14px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 15px;
        }

        input[type="submit"] {
            background: linear-gradient(to right, #00bcd4, #0097a7);
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            font-size: 15px;
            cursor: pointer;
            transition: 0.3s ease;
        }

        input[type="submit"]:hover {
            background: linear-gradient(to right, #0097a7, #00796b);
        }

        .item-card {
            background: #fff;
            padding: 25px;
            margin: 20px 0;
            border-radius: 12px;
            border-left: 5px solid #00bcd4;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.06);
            transition: transform 0.3s;
        }

        .item-card:hover {
            transform: translateY(-5px);
        }

        .item-card h3 {
            color: #333;
            margin-bottom: 12px;
        }

        .item-card p {
            margin: 5px 0;
            font-size: 15px;
        }

        .item-card .locked-message {
            font-style: italic;
            color: #b71c1c;
            font-size: 14px;
            margin-top: 10px;
        }

        .item-card img {
            margin-top: 12px;
            max-width: 120px;
            border-radius: 10px;
            border: 1px solid #ccc;
        }

        .claim-btn {
            display: inline-block;
            margin-top: 14px;
            padding: 10px 18px;
            background: linear-gradient(to right, #ff9800, #fb8c00);
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-weight: bold;
            transition: 0.3s ease-in-out;
        }

        .claim-btn:hover {
            background: linear-gradient(to right, #fb8c00, #ef6c00);
            transform: scale(1.05);
        }

        @media (max-width: 600px) {
            form {
                flex-direction: column;
                align-items: stretch;
            }

            .item-card {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>📋 All Reported Items</h2>

        <form method="get" action="">
            <label>Filter by Type:</label>
            <select name="type">
                <option value="">All</option>
                <option value="Lost">Lost</option>
                <option value="Found">Found</option>
            </select>
            <input type="submit" value="Filter">
        </form>

        <%
            String typeFilter = request.getParameter("type");
            String query = "SELECT * FROM items";
            if (typeFilter != null && !typeFilter.isEmpty()) {
                query += " WHERE type='" + typeFilter + "'";
            }

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/lost_found_db", "root", "Mona@2618");

                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query);

                while (rs.next()) {
                    String type = rs.getString("type");
                    String status = rs.getString("status");
        %>
            <div class="item-card">
                <h3><%= rs.getString("title") %> (<%= type %>)</h3>
                <p><strong>Description:</strong> <%= rs.getString("description") %></p>
                <p><strong>Location:</strong> <%= rs.getString("location") %></p>
                <p><strong>Date:</strong> <%= rs.getString("date") %></p>
                <p><strong>Status:</strong> <%= status %></p>

                <%-- Privacy logic for image --%>
                <% if ("Lost".equals(type) || "Resolved".equals(status)) { %>
                    <img src="<%= rs.getString("image_path") %>" alt="Item Image">
                <% } else { %>
                    <p class="locked-message">🔒 Image is hidden for privacy. Claim the item to view after admin approval.</p>
                <% } %>

                <% if (!"Resolved".equals(status)) { %>
                    <a href="claimItem.jsp?itemId=<%= rs.getInt("id") %>" class="claim-btn">Claim This Item</a>
                <% } %>
            </div>
        <%
                }
                conn.close();
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        %>
    </div>
</body>
</html>
