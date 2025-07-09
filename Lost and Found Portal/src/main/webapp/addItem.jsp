<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>📤 Report Item</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #e3f2fd, #e8f5e9);
            margin: 0;
            padding: 40px 20px;
        }

        .report-wrapper {
            max-width: 600px;
            margin: auto;
            background: #fff;
            padding: 40px 30px;
            border-radius: 16px;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.6s ease-in-out;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
            font-size: 26px;
            font-weight: 600;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: #37474f;
        }

        input[type="text"],
        input[type="file"],
        select,
        textarea {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            background-color: #f9f9f9;
            transition: border-color 0.3s ease;
        }

        textarea {
            min-height: 100px;
            resize: vertical;
        }

        input:focus, select:focus, textarea:focus {
            border-color: #00bcd4;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 188, 212, 0.3);
        }

        input[type="submit"] {
            background: linear-gradient(to right, #00bcd4, #0097a7);
            color: white;
            border: none;
            padding: 12px;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.3s ease, background 0.3s ease;
        }

        input[type="submit"]:hover {
            background: linear-gradient(to right, #0097a7, #00796b);
            transform: scale(1.03);
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 600px) {
            .report-wrapper {
                padding: 25px 20px;
            }
        }
    </style>
</head>
<body>
    <div class="report-wrapper">
        <h2>📤 Report Lost or Found Item</h2>

        <form action="AddItemServlet" method="post" enctype="multipart/form-data">
            <label>Item Type:</label>
            <select name="type" required>
                <option value="">-- Select Type --</option>
                <option value="Lost">Lost</option>
                <option value="Found">Found</option>
            </select>

            <label>Item Title:</label>
            <input type="text" name="title" placeholder="e.g. Black Wallet" required>

            <label>Description:</label>
            <textarea name="description" placeholder="Describe the item..." required></textarea>

            <label>Location:</label>
            <input type="text" name="location" placeholder="e.g. Hostel Gate, Library" required>

            <label>Upload Image:</label>
            <input type="file" name="image" accept="image/*" required>

            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>
