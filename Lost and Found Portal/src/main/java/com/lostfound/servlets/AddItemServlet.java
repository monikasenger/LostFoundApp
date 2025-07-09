package com.lostfound.servlets;

import java.io.*;
import java.nio.file.*;
import java.sql.*;
import java.time.LocalDate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;



@WebServlet("/AddItemServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1MB
                 maxFileSize = 5 * 1024 * 1024,   // 5MB
                 maxRequestSize = 10 * 1024 * 1024)
public class AddItemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String UPLOAD_DIR = "images";  // Inside WebContent

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int userId = (int) request.getSession().getAttribute("userId");
        String type = request.getParameter("type");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String location = request.getParameter("location");
        LocalDate date = LocalDate.now();

        // Image handling
        Part filePart = request.getPart("image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        String filePath = uploadPath + File.separator + fileName;
        filePart.write(filePath);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/lost_found_db", "root", "Mona@2618");

            String sql = "INSERT INTO items (user_id, type, title, description, image_path, location, date, status) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setString(2, type);
            ps.setString(3, title);
            ps.setString(4, description);
            ps.setString(5, UPLOAD_DIR + "/" + fileName); // relative path for display
            ps.setString(6, location);
            ps.setString(7, date.toString());
            ps.setString(8, "Pending");

            int rows = ps.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("dashboard.jsp?msg=item_added");
            } else {
                response.sendRedirect("addItem.jsp?msg=fail");
            }

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("addItem.jsp?msg=error");
        }
    }
}
