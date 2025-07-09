<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>🔑 Admin Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #cfd9df, #e2ebf0);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            animation: fadeIn 0.6s ease-in-out;
        }

        .login-box {
            background: #ffffff;
            padding: 40px 35px;
            border-radius: 14px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            border-left: 6px solid #00bcd4;
        }

        .login-box h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
            font-size: 26px;
            font-weight: 600;
        }

        label {
            font-size: 15px;
            font-weight: 500;
            color: #37474f;
            display: block;
            margin-bottom: 8px;
            margin-top: 18px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #f9f9f9;
            font-size: 15px;
            transition: 0.3s;
        }

        input:focus {
            border-color: #00bcd4;
            box-shadow: 0 0 6px rgba(0, 188, 212, 0.3);
            outline: none;
        }

        input[type="submit"] {
            width: 100%;
            margin-top: 25px;
            padding: 12px;
            background: linear-gradient(to right, #00bcd4, #0097a7);
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s ease-in-out;
        }

        input[type="submit"]:hover {
            background: linear-gradient(to right, #0097a7, #00796b);
            transform: scale(1.02);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media screen and (max-width: 480px) {
            .login-box {
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
    <div class="login-box">
        <h2>🔑 Admin Login</h2>

        <form action="AdminLoginServlet" method="post">
            <label>Username:</label>
            <input type="text" name="username" required>

            <label>Password:</label>
            <input type="password" name="password" required>

            <input type="submit" value="Login">
        </form>
    </div>
</body>
</html>
