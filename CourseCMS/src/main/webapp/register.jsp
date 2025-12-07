<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Register – Course CMS</title>

  <!-- Bootstrap  -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

  <!--  CSS  -->
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

  <!-- Icons & Fonts -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>


<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg fixed-top py-3">
  <div class="container">
    <a class="navbar-brand fw-bold" href="index.jsp">
      <img src="https://dummyimage.com/140x40/cccccc/000000.png&text=LOGO" height="40" alt="">
    </a>

    <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#mainNav">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div id="mainNav" class="collapse navbar-collapse">
      <ul class="navbar-nav ms-auto align-items-lg-center">

        <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
        <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
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

<!-- REGISTER FORM SECTION -->
<section class="py-5" style="margin-top: 90px;">
  <div class="container d-flex justify-content-center">
    <div class="col-md-6 col-lg-5">

      <div class="card shadow p-4" style="border-radius: 14px;">
        <h2 class="text-center fw-bold mb-3">Create Account</h2>
        <p class="text-center text-muted mb-4">Join thousands of learners worldwide</p>

        <!-- FORM STARTS HERE -->
        <form action="RegisterServlet" method="post">

          <div class="mb-3">
            <label class="form-label fw-semibold">Full Name</label>
            <input type="text" class="form-control" name="name" placeholder="Enter your full name" required>
          </div>

          <div class="mb-3">
            <label class="form-label fw-semibold">Email</label>
            <input type="email" class="form-control" name="email" placeholder="Enter your email" required>
          </div>

          <div class="mb-3">
            <label class="form-label fw-semibold">Password</label>
            <input type="password" class="form-control" name="password" placeholder="Create a password" required>
          </div>

          <div class="mb-3">
            <label class="form-label fw-semibold">Confirm Password</label>
            <input type="password" class="form-control" name="confirmPassword" placeholder="Confirm password" required>
          </div>

          <!-- COURSE DROPDOWN -->
          <div class="mb-3">
            <label class="form-label fw-semibold">Select Interested Course</label>
            <select class="form-select" name="course" required>
              <option value="" disabled selected>Select a course</option>
              <option value="JLPT N5">JLPT N5 – Beginner</option>
              <option value="JLPT N4">JLPT N4 – Elementary</option>
              <option value="JLPT N3">JLPT N3 – Intermediate</option>
              <option value="JLPT N2">JLPT N2 – Upper Intermediate</option>
              <option value="JLPT N1">JLPT N1 – Advanced</option>
              <option value="Corporate Training">Corporate Japanese Training</option>
              <option value="Interpretation">Japanese Interpretation Training</option>
              <option value="University Courses">University Japanese Courses</option>
            </select>
          </div>

          <button class="btn btn-register w-100 py-2 mb-3">
            <i class="fa-solid fa-user-plus me-2"></i>Create Account
          </button>

          <p class="text-center mb-0">
            Already registered?
            <a href="login.jsp" class="fw-semibold" style="color: var(--clr-primary);">Login here</a>
          </p>

        </form>
        <!-- FORM ENDED HERE -->

      </div>

    </div>
  </div>
</section>

<!-- FOOTER -->
<footer class="pt-5 text-light">
  <div class="container">
    <div class="row gy-4">
      <div class="col-md-4">
        <h5 class="fw-bold mb-3">
          <img src="https://dummyimage.com/140x40/cccccc/000000.png&text=LOGO" alt="Logo" height="40">
        </h5>
        <p class="small-para">
          Your one-stop platform for up-skilling and career growth. Join thousands of learners worldwide.
        </p>
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

<!-- Bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!--  JS  -->
<script src="<%= request.getContextPath() %>/js/script.js"></script>

</body>
</html>
