<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>📋 View Items</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css"/>
</head>
<body class="view-items-body">
   
        <h2 class="view-heading">📋 All Reported Items</h2>

        <form method="get" action="" class="view-filter-form">
            <label>Filter by Type:</label>
            <select name="type">
                <option value="">All</option>
                <option value="Lost">Lost</option>
                <option value="Found">Found</option>
            </select>
            <input type="submit" value="Filter">
        </form>
 <div class="container">
 
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
