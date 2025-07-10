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
   
</head>
<body class="admin-dashboard-body">
    <div class="admin-dashboard-container">
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
       <div class="admin-claim-card">
    <p><strong>Item:</strong> <%= rs.getString("itemTitle") %></p>
    <p><strong>Claimed By:</strong> <%= rs.getString("userName") %></p>
    <p><strong>Message:</strong> <%= rs.getString("message") %></p>
    <p><strong>Status:</strong> 
        <span class="status-badge status-<%= rs.getString("status") %>">
            <%= rs.getString("status") %>
        </span>
    </p>

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
