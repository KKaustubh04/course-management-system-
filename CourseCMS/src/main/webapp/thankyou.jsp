<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.cms.dao.DBConnect" %>
<%
    String orderIdParam = request.getParameter("orderId");
    if (orderIdParam == null) {
        response.sendRedirect("courses.jsp");
        return;
    }

    int orderId = -1;
    try { orderId = Integer.parseInt(orderIdParam); } catch (Exception ex) { response.sendRedirect("courses.jsp"); return; }

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String courseName = "";
    String userEmail = "";
    double paidFee = 0;
    String status = "";

    try {
        con = DBConnect.getConn();
        ps = con.prepareStatement("SELECT * FROM orders WHERE id = ?");
        ps.setInt(1, orderId);
        rs = ps.executeQuery();
        if (rs.next()) {
            courseName = rs.getString("course_name");
            userEmail = rs.getString("user_email");
            paidFee = rs.getDouble("paid_fee");
            status = rs.getString("status");
        } else {
            response.sendRedirect("courses.jsp");
            return;
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("courses.jsp");
        return;
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception ignore) {}
        try { if (ps != null) ps.close(); } catch (Exception ignore) {}
        try { if (con != null) con.close(); } catch (Exception ignore) {}
    }
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Thank you — Order #<%= orderId %></title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>
  <div class="container" style="margin-top:100px; max-width:720px;">
    <div class="card shadow p-4">
      <h3 class="mb-3">Thank you for your purchase!</h3>
      <p>Order ID: <strong>#<%= orderId %></strong></p>
      <p>Course: <strong><%= courseName %></strong></p>
      <p>Paid: <strong>₹<%= String.format("%.2f", paidFee) %></strong></p>
      <p>Status: <span class="badge bg-success"><%= status %></span></p>
      <hr>
      <p>An email confirmation was sent to: <strong><%= userEmail %></strong> (simulated)</p>
      <div class="text-end">
        <a href="user-dashboard.jsp" class="btn btn-primary">Go to Dashboard</a>
        <a href="courses.jsp" class="btn btn-outline-secondary">Back to Courses</a>
      </div>
    </div>
  </div>
</body>
</html>
