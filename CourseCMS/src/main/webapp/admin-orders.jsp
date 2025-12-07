<%@ page import="java.sql.*" %>
<%@ page import="com.cms.dao.DBConnect" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    // Admin protection
    Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
    if (isAdmin == null || !isAdmin) {
        response.sendRedirect("login.jsp?error=unauthorized");
        return;
    }

    Connection con = DBConnect.getConn();

    // FINAL SQL USING YOUR EXACT COLUMNS
    String sql = "SELECT id, user_id, user_email, course_name, original_fee, paid_fee, duration, status, created_at "
               + "FROM orders ORDER BY created_at DESC";

    PreparedStatement ps = con.prepareStatement(sql);
    ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin – Orders</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="p-4">

<h2 class="mb-4 fw-bold">Admin – All Orders</h2>

<div class="d-flex justify-content-end mb-3">
    <a href="admin-dashboard.jsp" class="btn btn-info me-2">Dashboard</a>
    <a href="admin-courses.jsp" class="btn btn-primary me-2">Manage Courses</a>
    <a href="admin-logout.jsp" class="btn btn-danger">Logout</a>
</div>

<table class="table table-bordered table-striped table-hover">
    <thead class="table-dark">
        <tr>
            <th>Order ID</th>
            <th>User ID</th>
            <th>User Email</th>
            <th>Course Name</th>
            <th>Original Fee</th>
            <th>Paid Fee</th>
            <th>Duration</th>
            <th>Status</th>
            <th>Created At</th>
        </tr>
    </thead>

    <tbody>
        <% while (rs.next()) { %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getInt("user_id") %></td>
            <td><%= rs.getString("user_email") %></td>
            <td><%= rs.getString("course_name") %></td>

            <td>
                <del class="text-muted">₹<%= rs.getDouble("original_fee") %></del>
            </td>

            <td class="text-success fw-bold">₹<%= rs.getDouble("paid_fee") %></td>

            <td><%= rs.getString("duration") %></td>

            <td>
                <% String st = rs.getString("status"); %>
                <% if ("PAID".equalsIgnoreCase(st)) { %>
                    <span class="badge bg-success">PAID</span>
                <% } else { %>
                    <span class="badge bg-secondary"><%= st %></span>
                <% } %>
            </td>

            <td><%= rs.getTimestamp("created_at") %></td>
        </tr>
        <% } %>
    </tbody>
</table>

</body>
</html>

<%
rs.close();
ps.close();
con.close();
%>
