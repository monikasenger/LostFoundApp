<%@ page language="java" contentType="text/html; charset=UTF-8" session="true"%>

<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
    }
    String itemId = request.getParameter("itemId");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>📝 Claim Item</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <link rel="stylesheet" href="style.css"/>
</head>
<body>
<body class="claim-body">
    <div class="claim-container">
        <h2>📝 Claim Item</h2>

        <form action="ClaimServlet" method="post">
            <input type="hidden" name="itemId" value="<%= itemId %>">
            <label>Your Claim Message:</label>
            <textarea name="message" placeholder="Describe how this item belongs to you..." required></textarea>

            <input type="submit" value="Submit Claim">
        </form>
    </div>
</body>

</html>
