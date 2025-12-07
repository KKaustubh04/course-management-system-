package com.cms.controller;

import com.cms.dao.DBConnect;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class PurchaseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("userEmail") == null) {
            resp.sendRedirect("login.jsp?error=login_required");
            return;
        }

        String userEmail = (String) session.getAttribute("userEmail");

        String courseName = req.getParameter("courseName");
        String originalFeeStr = req.getParameter("originalFee");
        String paidFeeStr = req.getParameter("paidFee");
        String duration = req.getParameter("duration");

        double originalFee = Double.parseDouble(originalFeeStr);
        double paidFee = Double.parseDouble(paidFeeStr);

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DBConnect.getConn();

            // Fetch user_id
            int userId = -1;
            ps = con.prepareStatement("SELECT id FROM users WHERE email=?");
            ps.setString(1, userEmail);
            rs = ps.executeQuery();
            if (rs.next()) userId = rs.getInt("id");
            rs.close();
            ps.close();

            // INSERT (NO user_name!)
            ps = con.prepareStatement(
                "INSERT INTO orders (user_id, user_email, course_name, original_fee, paid_fee, duration, status) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)",
                Statement.RETURN_GENERATED_KEYS
            );

            ps.setInt(1, userId);
            ps.setString(2, userEmail);
            ps.setString(3, courseName);
            ps.setDouble(4, originalFee);
            ps.setDouble(5, paidFee);
            ps.setString(6, duration);
            ps.setString(7, "PAID");

            int affected = ps.executeUpdate();

            if (affected > 0) {
                rs = ps.getGeneratedKeys();
                int orderId = rs.next() ? rs.getInt(1) : 0;
                resp.sendRedirect("thankyou.jsp?orderId=" + orderId);
            } else {
                resp.sendRedirect("courses.jsp?error=order_failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("courses.jsp?error=exception");

        } finally {
            try { if (rs != null) rs.close(); } catch (Exception ignored) {}
            try { if (ps != null) ps.close(); } catch (Exception ignored) {}
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
    }
}
