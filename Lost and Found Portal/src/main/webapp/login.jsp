<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>🔐 Student Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <style>
        .login-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: linear-gradient(135deg, #e1f5fe, #e8f5e9);
            padding: 20px;
        }

        .login-box {
            background: #ffffff;
            padding: 40px 30px;
            border-radius: 14px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            animation: slideIn 0.5s ease-in-out;
        }

        .login-box h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #2c3e50;
            font-weight: 600;
        }

        form label {
            font-weight: 500;
            display: block;
            margin-bottom: 8px;
            color: #37474f;
        }

        form input[type="email"],
        form input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            background-color: #fafafa;
            transition: all 0.3s ease-in-out;
        }

        form input:focus {
            border-color: #00acc1;
            box-shadow: 0 0 5px rgba(0, 188, 212, 0.3);
            outline: none;
        }

        form input[type="submit"] {
            background: linear-gradient(to right, #00bcd4, #0097a7);
            color: #fff;
            border: none;
            padding: 12px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
        }

        form input[type="submit"]:hover {
            background: linear-gradient(to right, #0097a7, #00796b);
            transform: scale(1.03);
        }

        .login-box p {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
        }

        .login-box a {
            color: #00796b;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        .login-box a:hover {
            color: #004d40;
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="login-wrapper">
        <div class="login-box">
            <h2>🔐 Student Login</h2>

            <form action="LoginServlet" method="post">
                <label>Email:</label>
                <input type="email" name="email" required>

                <label>Password:</label>
                <input type="password" name="password" required>

                <input type="submit" value="Login">
            </form>

            <p>Don't have an account? <a href="register.jsp">Register here</a></p>
        </div>
    </div>
</body>
</html>
