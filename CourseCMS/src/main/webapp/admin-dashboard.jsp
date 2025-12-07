<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="p-4">

<%
    Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
    if (isAdmin == null || !isAdmin) {
        response.sendRedirect("login.jsp?error=unauthorized");
        return;
    }
%>

<h1 class="fw-bold mb-4">Welcome Admin</h1>

<div class="d-flex gap-3 mb-4">
    <a href="admin-courses.jsp" class="btn btn-primary btn-lg">Manage Courses</a>
    <a href="admin-orders.jsp" class="btn btn-success btn-lg">View Orders</a>
</div>

<p class="text-muted">More admin features will appear here.</p>

</body>
</html>
