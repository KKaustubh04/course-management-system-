package com.cms.controller;

import com.cms.dao.DBConnect;
import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class EditCourseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String title = req.getParameter("title");
            String description = req.getParameter("description");
            double originalFee = Double.parseDouble(req.getParameter("original_fee"));
            double discountedFee = Double.parseDouble(req.getParameter("discounted_fee"));
            String duration = req.getParameter("duration");
            String level = req.getParameter("level");

            // DB Update
            try (Connection con = DBConnect.getConn()) {
                String sql = "UPDATE courses SET title=?, description=?, original_fee=?, discounted_fee=?, duration=?, level=? WHERE id=?";
                PreparedStatement ps = con.prepareStatement(sql);
                
                ps.setString(1, title);
                ps.setString(2, description);
                ps.setDouble(3, originalFee);
                ps.setDouble(4, discountedFee);
                ps.setString(5, duration);
                ps.setString(6, level);
                ps.setInt(7, id);

                int rows = ps.executeUpdate();

                if (rows > 0) {
                    resp.sendRedirect("admin-courses.jsp?success=updated");
                } else {
                    resp.sendRedirect("edit-course.jsp?id=" + id + "&error=failed");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("admin-courses.jsp?error=exception");
        }
    }
}
