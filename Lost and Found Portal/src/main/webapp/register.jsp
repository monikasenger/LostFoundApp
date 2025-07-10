<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>📝 Student Registration</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <link rel="stylesheet" href="style.css"> 
</head>
<body >
    <div class="register-wrapper">
        <div class="register-box">
            <h2>📝 Student Registration</h2>

            <form action="RegisterServlet" method="post">
                <label>Full Name:</label>
                <input type="text" name="name" required>

                <label>Email:</label>
                <input type="email" name="email" required>

                <label>Password:</label>
                <input type="password" name="password" required>

                <input type="submit" value="Register">
            </form>

            <p>Already registered? <a href="login.jsp">Login here</a></p>
        </div>
    </div>
</body>
</html>