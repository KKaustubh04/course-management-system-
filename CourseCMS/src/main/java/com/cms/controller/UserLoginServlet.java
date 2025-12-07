package com.cms.controller;

import com.cms.dao.DBConnect;
import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class UserLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        
        System.out.println("UserLoginServlet CALLED");

        String email = req.getParameter("email");
        String pass = req.getParameter("password");

        try {
            Connection con = DBConnect.getConn();

            PreparedStatement ps = con.prepareStatement(
                "SELECT name, course FROM users WHERE email=? AND password=?"
            );

            ps.setString(1, email);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

               
                System.out.println("Login success for: " + email);

                HttpSession session = req.getSession();
                session.setAttribute("userName", rs.getString("name"));
                session.setAttribute("userEmail", email);
                session.setAttribute("userCourse", rs.getString("course"));

               
                resp.sendRedirect("user-dashboard.jsp");

            } else {

                System.out.println("Invalid login for: " + email);

                resp.sendRedirect("login.jsp?error=invalid");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("login.jsp?error=exception");
        }
    }
}
