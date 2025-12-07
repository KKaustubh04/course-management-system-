<%@ page import="java.sql.*" %>
<%@ page import="com.cms.dao.DBConnect" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    // Admin access protection
    Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
    if (isAdmin == null || !isAdmin) {
        response.sendRedirect("login.jsp?error=unauthorized");
        return;
    }

    Connection con = DBConnect.getConn();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM courses ORDER BY id ASC");
    ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin – Manage Courses</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="p-4">

<!-- 🔥 Admin Navigation Buttons (same style as admin-orders.jsp) -->
<div class="d-flex justify-content-end mb-3">
    <a href="admin-dashboard.jsp" class="btn btn-info me-2">Dashboard</a>
    <a href="admin-courses.jsp" class="btn btn-primary me-2">Manage Courses</a>
    <a href="admin-orders.jsp" class="btn btn-warning me-2">Orders</a>
    <a href="admin-logout.jsp" class="btn btn-danger">Logout</a>
</div>

<h2 class="mb-4 fw-bold">Admin – Manage Courses</h2>

<!-- 🔔 SUCCESS / ERROR MESSAGES -->
<%
    String success = request.getParameter("success");
    String error = request.getParameter("error");

    if ("updated".equals(success)) {
%>
    <div class="alert alert-success fw-semibold" style="border-radius:10px;">
        Course updated successfully!
    </div>
<%
    } else if ("failed".equals(error)) {
%>
    <div class="alert alert-danger fw-semibold" style="border-radius:10px;">
        Failed to update course.
    </div>
<%
    } else if ("exception".equals(error)) {
%>
    <div class="alert alert-warning fw-semibold" style="border-radius:10px;">
        An unexpected error occurred.
    </div>
    
    <% } else if ("status_toggled".equals(success)) { %>
    <div class="alert alert-success fw-semibold" style="border-radius:10px;">
        Course status updated.
    </div>
<% } %>
    




<!-- COURSE TABLE -->
<table class="table table-bordered table-hover">
    <thead class="table-dark">
        <tr>
            <th>ID</th>
            <th>Title</th>
            <th>Level</th>
            <th>Original Fee</th>
            <th>Discounted Fee</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
    </thead>

    <tbody>
    <% while (rs.next()) { %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getString("level") %></td>
            <td>₹<%= rs.getDouble("original_fee") %></td>
            <td>₹<%= rs.getDouble("discounted_fee") %></td>
            <td><%= rs.getString("status") %></td>

            <td>
                <!-- EDIT BUTTON -->
                <a class="btn btn-warning btn-sm"
                   href="edit-course.jsp?id=<%= rs.getInt("id") %>">
                   Edit
                </a>

                <!-- STATUS TOGGLE BUTTONS -->
                <% if ("ACTIVE".equals(rs.getString("status"))) { %>

                    <a class="btn btn-secondary btn-sm"
                       href="ToggleStatusServlet?id=<%= rs.getInt("id") %>&action=deactivate"
                       onclick="return confirm('Deactivate this course?');">
                       Deactivate
                    </a>

                <% } else { %>

                    <a class="btn btn-success btn-sm"
                       href="ToggleStatusServlet?id=<%= rs.getInt("id") %>&action=activate"
                       onclick="return confirm('Activate this course?');">
                       Activate
                    </a>

                <% } %>

            </td>
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
