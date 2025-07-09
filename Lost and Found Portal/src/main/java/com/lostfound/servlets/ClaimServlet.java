package com.lostfound.servlets;

import java.io.*;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



@WebServlet("/ClaimServlet")
public class ClaimServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int userId = (int) request.getSession().getAttribute("userId");
        int itemId = Integer.parseInt(request.getParameter("itemId"));
        String message = request.getParameter("message");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/lost_found_db", "root", "Mona@2618");

            String sql = "INSERT INTO claims(item_id, user_id, message, status) VALUES (?, ?, ?, 'Pending')";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, itemId);
            ps.setInt(2, userId);
            ps.setString(3, message);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("viewItems.jsp?msg=claim_sent");
            } else {
                response.sendRedirect("claimItem.jsp?itemId=" + itemId + "&msg=fail");
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("claimItem.jsp?itemId=" + itemId + "&msg=error");
        }
    }
}
