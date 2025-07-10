<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>🔐 Student Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style.css"/>
</head>
<body >
    <div class="login-wrapper">
        <div class="login-box">
            <h2>🔐 Student Login</h2>

            <form action="LoginServlet" method="post">
                <label>Email:</label>
                <input type="email" name="email" required>

                <label>Password:</label>
                <input type="password" name="password" required>

                <div class="options">
                    <label><input type="checkbox" name="remember"> Remember Me</label>
                    <a href="forgotPassword.jsp">Forgot Password?</a>
                </div>

                <input type="submit" value="Login">
            </form>

            <p>Don't have an account? <a href="register.jsp">Register here</a></p>
        </div>
    </div>
</body>

</html>
