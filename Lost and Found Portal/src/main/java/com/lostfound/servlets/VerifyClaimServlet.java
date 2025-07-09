package com.lostfound.servlets;

import java.io.*;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/VerifyClaimServlet")
public class VerifyClaimServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int claimId = Integer.parseInt(request.getParameter("claimId"));
        String action = request.getParameter("action"); // approve or reject

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/lost_found_db", "root", "Mona@2618");

            if ("approve".equals(action)) {
                // Update claim and item status
                String getItemId = "SELECT item_id FROM claims WHERE id = ?";
                PreparedStatement ps1 = conn.prepareStatement(getItemId);
                ps1.setInt(1, claimId);
                ResultSet rs = ps1.executeQuery();
                int itemId = 0;
                if (rs.next()) itemId = rs.getInt("item_id");

                PreparedStatement ps2 = conn.prepareStatement("UPDATE claims SET status='Approved' WHERE id=?");
                ps2.setInt(1, claimId);
                ps2.executeUpdate();

                PreparedStatement ps3 = conn.prepareStatement("UPDATE items SET status='Resolved' WHERE id=?");
                ps3.setInt(1, itemId);
                ps3.executeUpdate();

            } else {
                PreparedStatement ps = conn.prepareStatement("UPDATE claims SET status='Rejected' WHERE id=?");
                ps.setInt(1, claimId);
                ps.executeUpdate();
            }

            conn.close();
            response.sendRedirect("adminDashboard.jsp?msg=verified");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("adminDashboard.jsp?msg=error");
        }
    }
}
