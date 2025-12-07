package com.cms.controller;

import com.cms.dao.DBConnect;
import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String pass = req.getParameter("password");
        String confirmPass = req.getParameter("confirmPassword");
        String course = req.getParameter("course");

       
        if (!pass.equals(confirmPass)) {
            resp.sendRedirect("register.jsp?error=password_mismatch");
            return;
        }

        try {
            Connection con = DBConnect.getConn();

            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO users(name, email, password, course) VALUES (?, ?, ?, ?)"
            );

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, pass);
            ps.setString(4, course);

            int rows = ps.executeUpdate();

            
            if (rows > 0) {
                resp.sendRedirect("login.jsp?success=registered");
            } else {
                resp.sendRedirect("register.jsp?error=failed");
            }

        } catch (SQLException e) {
            e.printStackTrace();

        
            if (e.getErrorCode() == 1062) {
                resp.sendRedirect("register.jsp?error=email_exists");
            } else {
                resp.sendRedirect("register.jsp?error=exception");
            }
        }
    }
}
