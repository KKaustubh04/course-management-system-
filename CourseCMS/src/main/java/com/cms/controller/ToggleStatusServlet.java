package com.cms.controller;

import com.cms.dao.DBConnect;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class ToggleStatusServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String id = req.getParameter("id");
        String action = req.getParameter("action");

        if (id == null || action == null) {
            resp.sendRedirect("admin-courses.jsp?error=invalid");
            return;
        }

        String newStatus = action.equals("deactivate") ? "INACTIVE" : "ACTIVE";

        try (Connection con = DBConnect.getConn()) {

            PreparedStatement ps = con.prepareStatement(
                "UPDATE courses SET status=? WHERE id=?"
            );

            ps.setString(1, newStatus);
            ps.setInt(2, Integer.parseInt(id));
            ps.executeUpdate();

            resp.sendRedirect("admin-courses.jsp?success=status_toggled");

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("admin-courses.jsp?error=exception");
        }
    }
}
