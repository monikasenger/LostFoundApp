<%@ page language="java" contentType="text/html; charset=UTF-8" session="true"%>

<%
    String userName = (String) session.getAttribute("userName");
    if (userName == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <link rel="stylesheet" href="style.css"/>
</head>
<body class="dashboard-body">
    <div class="dashboard-container">
        <h2>Welcome, <%= userName %> 👋</h2>

        <div class="nav-buttons">
            <a href="addItem.jsp">📤 Report Lost/Found Item</a>
            <a href="viewItems.jsp">📋 View All Items</a>
            <a href="logout.jsp">🚪 Logout</a>
        </div>
    </div>
</body>

</html>
