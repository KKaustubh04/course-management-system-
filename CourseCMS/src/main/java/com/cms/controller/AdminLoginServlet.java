package com.cms.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class AdminLoginServlet extends HttpServlet {

    private final String ADMIN_USERNAME = "admin";   // your actual admin username
    private final String ADMIN_PASSWORD = "admin123"; // your actual admin password

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // Check credentials
        if (ADMIN_USERNAME.equals(username) && ADMIN_PASSWORD.equals(password)) {

            HttpSession session = req.getSession(true);
            session.setAttribute("isAdmin", true);       // Important for access control
            session.setAttribute("adminUser", username); // Store admin username

            resp.sendRedirect("admin-dashboard.jsp");

        } else {
            resp.sendRedirect("login.jsp?error=invalid_admin");
        }
    }
}
