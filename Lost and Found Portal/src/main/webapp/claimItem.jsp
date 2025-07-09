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
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(to right, #e0f2f1, #e1f5fe);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
            animation: fadeIn 0.6s ease-in-out;
        }

        .claim-container {
            background: #ffffff;
            padding: 40px 35px;
            border-radius: 14px;
            max-width: 500px;
            width: 100%;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            border-left: 6px solid #00bcd4;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
            font-size: 26px;
        }

        label {
            font-size: 15px;
            font-weight: 500;
            color: #37474f;
            display: block;
            margin-bottom: 8px;
        }

        textarea {
            width: 100%;
            padding: 12px;
            font-size: 15px;
            border-radius: 8px;
            border: 1px solid #ccc;
            background-color: #fafafa;
            resize: vertical;
            min-height: 100px;
            margin-bottom: 20px;
            transition: 0.3s;
        }

        textarea:focus {
            border-color: #00bcd4;
            box-shadow: 0 0 5px rgba(0, 188, 212, 0.3);
            outline: none;
        }

        input[type="submit"] {
            width: 100%;
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
            transform: scale(1.03);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media screen and (max-width: 480px) {
            .claim-container {
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
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
