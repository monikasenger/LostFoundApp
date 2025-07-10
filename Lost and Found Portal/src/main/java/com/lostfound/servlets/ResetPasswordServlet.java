package com.lostfound.servlets;

import java.io.*;

import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String newPassword = request.getParameter("newPassword");
        String email = (String) request.getSession().getAttribute("resetEmail");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/lost_found_db", "root", "Mona@2618");

            PreparedStatement ps = con.prepareStatement("UPDATE users SET password=? WHERE email=?");
            ps.setString(1, newPassword);
            ps.setString(2, email);

            int i = ps.executeUpdate();

            if (i > 0) {
                request.getSession().removeAttribute("resetEmail");
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println("<script>alert('Password updated successfully!');window.location='login.jsp';</script>");
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
