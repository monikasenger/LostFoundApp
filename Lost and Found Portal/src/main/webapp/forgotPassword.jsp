<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>🔑 Forgot Password</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css"/>
   
</head>
<body class="forgot-wrapper">
 
    <div class="forgot-box">
        <h2>🔑 Forgot Password</h2>
        <form action="ForgetPasswordServlet" method="post">
            <label>Enter your registered email:</label>
            <input type="email" name="email" required>

            <input type="submit" value="Send Reset Link">
        </form>

        <div class="back-link">
            <p><a href="login.jsp">⬅ Back to Login</a></p>
        </div>
    </div>
    
</body>

</html>
