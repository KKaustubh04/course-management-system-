<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
 
    String name = (String) session.getAttribute("userName");
    String email = (String) session.getAttribute("userEmail");
    String course = (String) session.getAttribute("userCourse");

    
    if (name == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Dashboard</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>

<body>

<nav class="navbar navbar-expand-lg fixed-top py-3 bg-light shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="index.jsp">Course CMS</a>
        <div class="ms-auto">
            <a class="btn btn-danger btn-sm" href="logout.jsp">Logout</a>
        </div>
    </div>
</nav>

<div class="container" style="margin-top:120px;">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow p-4" style="border-radius:14px;">

                <h3 class="fw-bold text-center mb-3">Welcome, <span class="text-primary"><%= name %></span>!</h3>

                <p class="text-center text-muted mb-4">
                    Here's your basic account overview.
                </p>

                <hr>

                <h5>User Details</h5>
                <p><strong>Name:</strong> <%= name %></p>
                <p><strong>Email:</strong> <%= email %></p>
                <p><strong>Course you are interested in:</strong> <%= course %></p>

                <hr>

                <div class="text-center mt-3">
                   <a href="<%= request.getContextPath() %>/courses.jsp" 
   class="btn btn-primary px-4">
   Explore Courses
</a>

                </div>

            </div>
        </div>
    </div>
</div>

<%@ page import="java.sql.*" %>
<%
    String userEmail = (String) session.getAttribute("userEmail");
    if (userEmail != null) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = com.cms.dao.DBConnect.getConn();
            ps = con.prepareStatement("SELECT id, course_name, paid_fee, status, created_at FROM orders WHERE user_email=? ORDER BY created_at DESC");
            ps.setString(1, userEmail);
            rs = ps.executeQuery();
%>
<h5>Your Orders</h5>
<table class="table">
  <thead><tr><th>Order</th><th>Course</th><th>Paid</th><th>Status</th><th>Date</th></tr></thead>
  <tbody>
<%
            while (rs.next()) {
%>
  <tr>
    <td>#<%= rs.getInt("id") %></td>
    <td><%= rs.getString("course_name") %></td>
    <td>₹<%= rs.getDouble("paid_fee") %></td>
    <td><%= rs.getString("status") %></td>
    <td><%= rs.getTimestamp("created_at") %></td>
  </tr>
<%
            }
%>
  </tbody>
</table>
<%
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception ignored) {}
            try { if (ps != null) ps.close(); } catch (Exception ignored) {}
            try { if (con != null) con.close(); } catch (Exception ignored) {}
        }
    }
%>



</body>
</html>
