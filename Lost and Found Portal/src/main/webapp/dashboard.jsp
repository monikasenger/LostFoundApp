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
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #fce4ec, #e3f2fd);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
            animation: fadeIn 0.5s ease;
        }

        .dashboard-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.08);
            max-width: 500px;
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

        .nav-buttons {
            display: flex;
            flex-direction: column;
            gap: 18px;
        }

        .nav-buttons a {
            text-align: center;
            padding: 14px;
            font-size: 16px;
            font-weight: 500;
            background: linear-gradient(to right, #7b1fa2, #512da8);
            color: white;
            text-decoration: none;
            border-radius: 10px;
            transition: 0.3s ease-in-out;
        }

        .nav-buttons a:hover {
            background: linear-gradient(to right, #6a1b9a, #4527a0);
            transform: translateY(-3px);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 480px) {
            .dashboard-container {
                padding: 30px 20px;
            }

            h2 {
                font-size: 22px;
            }

            .nav-buttons a {
                font-size: 15px;
                padding: 12px;
            }
        }
    </style>
</head>
<body>
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
