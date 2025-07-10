<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String email = (String) session.getAttribute("resetEmail");
    if (email == null) {
        response.sendRedirect("forgotPassword.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>🔐 Reset Password</title>
    <link rel="stylesheet" href="style.css"> 
</head>
<body class="reset-wrapper">
 
        <div class="reset-box">
            <h2>🔐 Set New Password</h2>
            <form action="ResetPasswordServlet" method="post">
                <input type="password" name="newPassword" placeholder="Enter new password" required>
                <input type="submit" value="Update Password">
            </form>
        
    </div>
</body>
</html>
