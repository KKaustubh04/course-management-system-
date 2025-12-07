package com.cms.controller;

import com.cms.dao.DBConnect;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class ToggleStatusServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {

        
        HttpSession session = req.getSession(false);
        Boolean isAdmin = (session != null) ? (Boolean) session.getAttribute("isAdmin") : null;
        if (isAdmin == null || !isAdmin) {
            resp.sendRedirect("login.jsp?error=unauthorized");
            return;
        }

        String idStr = req.getParameter("id");
        String action = req.getParameter("action"); // expected values: activate / deactivate

        if (idStr == null || action == null) {
            resp.sendRedirect("admin-courses.jsp?error=invalid_request");
            return;
        }

        int courseId;
        try {
            courseId = Integer.parseInt(idStr);
        } catch (NumberFormatException e) {
            resp.sendRedirect("admin-courses.jsp?error=invalid_id");
            return;
        }

        String newStatus;
        if ("activate".equalsIgnoreCase(action)) {
            newStatus = "ACTIVE";
        } else if ("deactivate".equalsIgnoreCase(action)) {
            newStatus = "INACTIVE";
        } else {
            resp.sendRedirect("admin-courses.jsp?error=invalid_action");
            return;
        }

        Connection con = null;
        PreparedStatement ps = null;
        try {
            con = DBConnect.getConn();
            ps = con.prepareStatement("UPDATE courses SET status = ? WHERE id = ?");
            ps.setString(1, newStatus);
            ps.setInt(2, courseId);

            int updated = ps.executeUpdate();
            if (updated > 0) {
                resp.sendRedirect("admin-courses.jsp?success=status_toggled");
            } else {
                resp.sendRedirect("admin-courses.jsp?error=not_found");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("admin-courses.jsp?error=exception");
        } finally {
            try { if (ps != null) ps.close(); } catch (Exception ignored) {}
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
    }

    // Optionally support POST as well
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doGet(req, resp);
    }
}
