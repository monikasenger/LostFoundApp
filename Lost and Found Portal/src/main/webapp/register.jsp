<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>📝 Student Registration</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f3e5f5, #e3f2fd);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
            animation: fadeIn 0.5s ease;
        }

        .form-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.08);
            max-width: 480px;
            width: 100%;
            border-left: 6px solid #00bcd4;
        }

        h2 {
            font-size: 26px;
            font-weight: 600;
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        label {
            font-weight: 500;
            margin-bottom: 8px;
            display: block;
            font-size: 15px;
            color: #37474f;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-color: #fafafa;
            font-size: 15px;
            transition: 0.3s ease;
        }

        input:focus {
            border-color: #00bcd4;
            box-shadow: 0 0 6px rgba(0, 188, 212, 0.3);
            outline: none;
        }

        input[type="submit"] {
            width: 100%;
            background: linear-gradient(to right, #00bcd4, #0097a7);
            color: #fff;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s ease-in-out;
        }

        input[type="submit"]:hover {
            background: linear-gradient(to right, #0097a7, #00796b);
            transform: scale(1.02);
        }

        p {
            margin-top: 20px;
            text-align: center;
            font-size: 14px;
            color: #555;
        }

        p a {
            color: #512da8;
            text-decoration: none;
            font-weight: 500;
        }

        p a:hover {
            text-decoration: underline;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 480px) {
            .form-container {
                padding: 30px 20px;
            }

            h2 {
                font-size: 22px;
            }

            input[type="submit"] {
                font-size: 15px;
            }
        }
    </style>
</head>
<body>
    <div class="form-container">
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
</body>
</html>
