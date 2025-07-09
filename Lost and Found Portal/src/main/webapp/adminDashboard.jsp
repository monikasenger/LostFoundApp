<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("adminUser") == null) {
        response.sendRedirect("adminLogin.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>👨‍💼 Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #f3e5f5, #e1f5fe);
            margin: 0;
            padding: 40px 20px;
        }

        .dashboard-container {
            max-width: 900px;
            margin: auto;
            background: #fff;
            padding: 35px;
            border-radius: 14px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
            animation: fadeIn 0.6s ease-in-out;
        }

        h2, h3 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
        }

        .item-card {
            background-color: #f9f9f9;
            padding: 25px;
            margin: 20px 0;
            border-left: 6px solid #00bcd4;
            border-radius: 10px;
            box-shadow: 0 8px 18px rgba(0, 0, 0, 0.05);
        }

        .item-card p {
            margin: 8px 0;
            font-size: 15px;
        }

        form {
            display: inline-block;
            margin-right: 8px;
        }

        .approve-btn, .reject-btn {
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            color: #fff;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .approve-btn {
            background: linear-gradient(to right, #4caf50, #2e7d32);
        }

        .reject-btn {
            background: linear-gradient(to right, #e53935, #b71c1c);
        }

        .approve-btn:hover {
            transform: scale(1.05);
            background: linear-gradient(to right, #43a047, #1b5e20);
        }

        .reject-btn:hover {
            transform: scale(1.05);
            background: linear-gradient(to right, #d32f2f, #880e4f);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 768px) {
            .dashboard-container {
                padding: 25px;
            }

            form {
                display: block;
                margin: 8px 0;
            }
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <h2>👨‍💼 Admin Dashboard</h2>
        <h3>📩 All Claims</h3>

        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/lost_found_db", "root", "Mona@2618");

                String sql = "SELECT claims.id AS claimId, users.name AS userName, items.title AS itemTitle, claims.message, claims.status " +
                             "FROM claims INNER JOIN users ON claims.user_id = users.id " +
                             "INNER JOIN items ON claims.item_id = items.id";
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql);

                while (rs.next()) {
        %>
        <div class="item-card">
            <p><strong>Item:</strong> <%= rs.getString("itemTitle") %></p>
            <p><strong>Claimed By:</strong> <%= rs.getString("userName") %></p>
            <p><strong>Message:</strong> <%= rs.getString("message") %></p>
            <p><strong>Status:</strong> <%= rs.getString("status") %></p>

            <% if ("Pending".equals(rs.getString("status"))) { %>
                <form action="VerifyClaimServlet" method="post">
                    <input type="hidden" name="claimId" value="<%= rs.getInt("claimId") %>">
                    <input type="hidden" name="action" value="approve">
                    <input type="submit" class="approve-btn" value="✅ Approve">
                </form>
                <form action="VerifyClaimServlet" method="post">
                    <input type="hidden" name="claimId" value="<%= rs.getInt("claimId") %>">
                    <input type="hidden" name="action" value="reject">
                    <input type="submit" class="reject-btn" value="❌ Reject">
                </form>
            <% } %>
        </div>
        <%
                }
                conn.close();
            } catch (Exception e) {
                out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
            }
        %>
    </div>
</body>
</html>
