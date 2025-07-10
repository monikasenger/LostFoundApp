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
</head>
<body class="report-body">
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
