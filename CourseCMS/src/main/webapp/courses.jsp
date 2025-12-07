<%@ page import="java.sql.*" %>
<%@ page import="com.cms.dao.DBConnect" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Explore Courses | CMS</title>

  <!-- Bootstrap & Core CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

  <!-- External Libraries -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

  <!-- Your CSS files (kept untouched) -->
  <link href="css/style.css" rel="stylesheet">
  <link href="css/courses.css" rel="stylesheet">
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/courses.css">
</head>

<body>

<!-- NAVBAR (UNCHANGED) -->
<nav class="navbar navbar-expand-lg fixed-top py-3">
  <div class="container">

    <a class="navbar-brand fw-bold" href="index.jsp">
      <img src="https://dummyimage.com/140x40/cccccc/000000.png&text=LOGO" alt="Logo" height="40">
    </a>

    <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#mainNav" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div id="mainNav" class="collapse navbar-collapse">
      <ul class="navbar-nav ms-auto mb-2 mb-lg-0 align-items-lg-center">

        <li class="nav-item"><a class="nav-link active" href="index.jsp">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="courses.jsp">Courses</a></li>

        <li class="nav-item" id="login">
          <a href="login.jsp" class="btn btn-login btn-sm px-3">
            <i class="fa-solid fa-right-to-bracket me-2"></i>Login
          </a>
        </li>

        <li class="nav-item" id="register">
          <a href="register.jsp" class="btn btn-register btn-sm px-3">
            Register<i class="fa-solid fa-arrow-right-long ms-2"></i>
          </a>
        </li>

      </ul>
    </div>
  </div>
</nav>


<!-- HERO SECTION (UNCHANGED) -->
<header class="courses-hero text-center">
  <h1 class="display-5 fw-semibold">Explore Our Courses</h1>
  <p class="lead mb-0">Pick the program that best fits your goals.</p>
</header>

<!-- ================= DYNAMIC COURSES SECTION ================= -->
<section class="courses-grid py-5">
  <div class="container">
    <div class="row g-4 justify-content-center">

      <%
        Connection con = DBConnect.getConn();
        PreparedStatement ps = con.prepareStatement(
          "SELECT * FROM courses WHERE status='ACTIVE' ORDER BY id ASC"
        );
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {

            String level = rs.getString("level").toLowerCase();  // n5, n4, n3, etc.
            String title = rs.getString("title");
            String desc = rs.getString("description");
            String duration = rs.getString("duration");
            Double originalFee = rs.getDouble("original_fee");
            Double discountedFee = rs.getDouble("discounted_fee");
      %>

      <!-- COURSE CARD (Dynamic but UI preserved) -->
      <div class="col-12 col-md-6 col-lg-4">
        <article class="course-card card-<%= level %> h-100 d-flex flex-column">

          <h3 class="course-title"><%= title %></h3>
          <p class="course-tagline"><%= desc %></p>

          <ul class="course-features list-unstyled flex-grow-1">
            <li><i class="fa-solid fa-circle-check"></i>Professional Training Content</li>
            <li><i class="fa-solid fa-circle-check"></i>High Quality Study Material</li>
            <li><i class="fa-solid fa-circle-check"></i>Expert Trainers</li>
            <li><i class="fa-solid fa-circle-check"></i>Flexible Learning</li>
            <li><i class="fa-solid fa-circle-check"></i>Duration <strong><%= duration %></strong></li>
          </ul>

          <p class="mb-1 fw-bold">
            <span class="text-muted text-decoration-line-through">Rs.<%= originalFee %></span>
            <span class="ms-2 text-success">Rs.<%= discountedFee %></span>
          </p>

          <!-- ENROLL FORM -->
       
          <form action="<%= request.getContextPath() %>/PurchaseServlet" method="post" class="mt-auto">
          
            <input type="hidden" name="courseName" value="<%= title %>">
            <input type="hidden" name="duration" value="<%= duration %>">
            <input type="hidden" name="originalFee" value="<%= originalFee %>">
            <input type="hidden" name="paidFee" value="<%= discountedFee %>">

            <button class="btn course-btn w-100">Enroll Now</button>
          </form>

        </article>
      </div>

      <% } %>

    </div>
  </div>
</section>
<!-- =========================================================== -->


<!-- FOOTER (UNCHANGED) -->
<footer class="pt-5 text-light">
  <div class="container">
    <div class="row gy-4">

      <div class="col-md-4">
        <h5 class="fw-bold mb-3">
          <img src="https://dummyimage.com/140x40/cccccc/000000.png&text=LOGO" alt="Logo" height="40">
        </h5>
        <p class="small-para">Your one-stop platform for up-skilling and career growth.</p>
      </div>

      <div class="col-md-4">
        <h5 class="fw-bold mb-3">Quick Links</h5>
        <ul class="list-unstyled footer-links">
          <li><a href="index.jsp">Home</a></li>
          <li><a href="courses.jsp">Courses</a></li>
          <li><a href="login.jsp">Login</a></li>
          <li><a href="register.jsp">Register</a></li>
        </ul>
      </div>

      <div class="col-md-4">
        <h5 class="fw-bold mb-3">Get in Touch</h5>
        <p class="mb-1"><i class="fa-solid fa-phone me-2"></i>+00 0000000000</p>
        <p class="mb-3"><i class="fa-solid fa-location-dot me-2"></i>That Road, That City.</p>

        <a class="text-light me-3 fs-5" href="#"><i class="fab fa-facebook-f"></i></a>
        <a class="text-light me-3 fs-5" href="#"><i class="fab fa-twitter"></i></a>
        <a class="text-light me-3 fs-5" href="#"><i class="fab fa-linkedin-in"></i></a>
        <a class="text-light fs-5" href="#"><i class="fab fa-instagram"></i></a>
      </div>

    </div>

    <hr class="border-secondary mt-5">
    <div class="text-center pb-3 small">&copy; 2025 Course CMS. All rights reserved.</div>
  </div>
</footer>

<!-- JS (UNCHANGED) -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script src="js/script.js"></script>

</body>
</html>
