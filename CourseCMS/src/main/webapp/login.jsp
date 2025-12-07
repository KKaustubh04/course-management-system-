<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>Login | Course CMS</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">


  <style>
    .btn-toggle {
      background: #f1f3f5;
      border: none;
      padding: 8px 18px;
      font-weight: 700;
      border-radius: 10px;
      margin: 0 6px;
      transition: .22s ease;
      color: #333;
    }

    .btn-toggle.active {
      background: var(--clr-primary);
      color: var(--clr-text-light);
      box-shadow: 0 6px 16px rgba(0, 0, 0, .12);
    }

  
    .toggle-group {
      display: inline-flex;
      border-radius: 12px;
      padding: 4px;
      background: rgba(0,0,0,0.02);
    }

    
    @media (max-width: 420px) {
      .btn-toggle { padding: 8px 12px; font-size: .9rem; }
    }
  </style>
</head>

<body>

 
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
  
 
  <%
  String msg = request.getParameter("msg");
  if ("loggedout".equals(msg)) {
%>
<div class="alert alert-info text-center fw-semibold mb-3" style="border-radius:10px;">
    You have logged out successfully.
</div>
<%
  }
%>


  

  <!-- LOGIN CARD -->
  <section class="py-5" style="margin-top: 90px;">
    <div class="container d-flex justify-content-center">
      <div class="col-md-5">
        <div class="card shadow p-4" style="border-radius: 14px;">

          <h2 class="text-center fw-bold mb-2" id="loginHeading">Login</h2>
          <p class="text-center text-muted mb-4" id="loginSubtitle">Few clicks away from learning Japanese</p>

          <!-- Toggle buttons -->
          <div class="d-flex justify-content-center mb-3">
            <div class="toggle-group" role="tablist" aria-label="Login type">
              <button type="button" class="btn-toggle active" id="userTab" role="tab" aria-selected="true"
                aria-controls="userLoginForm">User</button>
              <button type="button" class="btn-toggle" id="adminTab" role="tab" aria-selected="false"
                aria-controls="adminLoginForm">Admin</button>
            </div>
          </div>

         
          <div id="formsWrap">
            
            
            
            <%
    String success = request.getParameter("success");
    if ("registered".equals(success)) {
%>
<div class="alert alert-success text-center fw-semibold mb-3" style="border-radius: 10px;">
    Registration successful! Please login.
</div>
<%
    }
%>
            
            
            
          <form id="userLoginForm" action="UserLoginServlet" method="post">

  <div class="mb-3">
    <label class="form-label fw-semibold">Email</label>
    <input type="email" class="form-control" name="email" placeholder="Enter your email" required>
  </div>

  <div class="mb-3">
    <label class="form-label fw-semibold">Password</label>
    <input type="password" class="form-control" name="password" placeholder="Enter your password" required>
  </div>

  <button type="submit" class="btn btn-cta w-100 py-2 mb-3">
    <i class="fa-solid fa-sign-in-alt me-2"></i>Login as User
  </button>
  
   <p class="text-center mb-0">Need an account?
          <a href="register.jsp" class="fw-semibold" style="color: var(--clr-primary);">Register</a>
          </p>

</form>




           
         
         <form id="adminLoginForm" method="post" action="AdminLoginServlet" autocomplete="on">

  <div class="mb-3">
    <label class="form-label fw-semibold">Admin Username</label>
    <input type="text" class="form-control" name="username" placeholder="Enter admin username" required>
  </div>

  <div class="mb-3">
    <label class="form-label fw-semibold">Password</label>
    <input type="password" class="form-control" name="password" placeholder="Enter admin password" required>
  </div>

  <button type="submit" class="btn btn-register w-100 py-2 mb-3">
    <i class="fa-solid fa-user-shield me-2"></i>Login as Admin
  </button>

</form>
         
         
         
          </div>

         

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

  <!-- JS -->
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
  <script src="js/script.js"></script>

 
  <script>
    (function () {
      const userTab = document.getElementById('userTab');
      const adminTab = document.getElementById('adminTab');
      const userForm = document.getElementById('userLoginForm');
      const adminForm = document.getElementById('adminLoginForm');
      const heading = document.getElementById('loginHeading');
      const subtitle = document.getElementById('loginSubtitle');

      function showUser() {
        userTab.classList.add('active');
        adminTab.classList.remove('active');
        userTab.setAttribute('aria-selected', 'true');
        adminTab.setAttribute('aria-selected', 'false');
        userForm.style.display = 'block';
        adminForm.style.display = 'none';
        heading.textContent = 'Login';
        subtitle.textContent = 'Few clicks away from learning Japanese';
      }

      function showAdmin() {
        adminTab.classList.add('active');
        userTab.classList.remove('active');
        adminTab.setAttribute('aria-selected', 'true');
        userTab.setAttribute('aria-selected', 'false');
        adminForm.style.display = 'block';
        userForm.style.display = 'none';
        heading.textContent = 'Admin Login';
        subtitle.textContent = 'Portal for admins';
      }

      userTab.addEventListener('click', showUser);
      adminTab.addEventListener('click', showAdmin);

    
      userTab.addEventListener('keydown', (e) => { if (e.key === 'Enter' || e.key === ' ') { e.preventDefault(); showUser(); }});
      adminTab.addEventListener('keydown', (e) => { if (e.key === 'Enter' || e.key === ' ') { e.preventDefault(); showAdmin(); }});

       showUser();
    })();
  </script>
</body>

</html>
