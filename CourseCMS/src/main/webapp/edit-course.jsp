<%@ page import="java.sql.*" %>
<%@ page import="com.cms.dao.DBConnect" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    // Admin authentication
    Boolean isAdmin = (Boolean) session.getAttribute("isAdmin");
    if (isAdmin == null || !isAdmin) {
        response.sendRedirect("login.jsp?error=unauthorized");
        return;
    }

    int courseId = Integer.parseInt(request.getParameter("id"));
    Connection con = DBConnect.getConn();

    PreparedStatement ps = con.prepareStatement("SELECT * FROM courses WHERE id=?");
    ps.setInt(1, courseId);
    ResultSet rs = ps.executeQuery();

    rs.next();  // move to row
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Course</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="p-4">

<h2 class="mb-3">Edit Course</h2>

<a href="admin-courses.jsp" class="btn btn-secondary mb-3">Back</a>

<form action="EditCourseServlet" method="post" class="border p-4 rounded shadow">

    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">

    <div class="mb-3">
        <label class="form-label">Course Title</label>
        <input type="text" class="form-control" name="title" value="<%= rs.getString("title") %>" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Description</label>
        <textarea class="form-control" name="description" required><%= rs.getString("description") %></textarea>
    </div>

    <div class="mb-3">
        <label class="form-label">Original Fee</label>
        <input type="number" class="form-control" name="original_fee" value="<%= rs.getDouble("original_fee") %>" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Discounted Fee</label>
        <input type="number" class="form-control" name="discounted_fee" value="<%= rs.getDouble("discounted_fee") %>" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Duration</label>
        <input type="text" class="form-control" name="duration" value="<%= rs.getString("duration") %>" required>
    </div>

    <div class="mb-3">
        <label class="form-label">Level</label>
        <select class="form-select" name="level" required>
            <option value="n5"  <%= rs.getString("level").equals("n5") ? "selected" : "" %>>N5</option>
            <option value="n4"  <%= rs.getString("level").equals("n4") ? "selected" : "" %>>N4</option>
            <option value="n3"  <%= rs.getString("level").equals("n3") ? "selected" : "" %>>N3</option>
            <option value="n2"  <%= rs.getString("level").equals("n2") ? "selected" : "" %>>N2</option>
            <option value="n1"  <%= rs.getString("level").equals("n1") ? "selected" : "" %>>N1</option>
            <option value="corp" <%= rs.getString("level").equals("corp") ? "selected" : "" %>>Corporate</option>
            <option value="int"  <%= rs.getString("level").equals("int") ? "selected" : "" %>>Interpretation</option>
            <option value="uni"  <%= rs.getString("level").equals("uni") ? "selected" : "" %>>University</option>
        </select>
    </div>

    <button class="btn btn-primary w-100 mt-3">Save Changes</button>

</form>

</body>
</html>

<%
rs.close();
ps.close();
con.close();
%>
