<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>Course CMS | Home</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">
</head>
</head>
<body>

<!-- NAVBAR ”€ -->
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
        

        <!--  buttons -->
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

<!-- ”€ HERO SECTION”€ -->
<header class="hero-section d-flex align-items-center text-center text-white">
  <div class="container">
    <h1 id="heroTitle" class="display-4 fw-bold mb-3">Build Your Future</h1>
    <p class="lead mx-auto mb-4" style="max-width:620px;">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium, excepturi.
    </p>
    <a href="courses.jsp" class="btn btn-cta btn-lg px-5">
      Explore Courses <i class="fa-solid fa-arrow-right-long ms-2"></i>
    </a>
  </div>
</header>


<!-- ”€ ABOUT ”€ -->
<section id="about" class="about-section py-5">
  <div class="container">
    <h2 class="section-title text-center mb-3">About&nbsp;Us</h2>
    <p class="section-subtitle text-center mb-5 mx-auto" style="max-width:640px;">
      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vitae turpis
      id elit dignissim aliquam a sit amet nisl. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras vitae turpis
      id elit dignissim aliquam a sit amet nisl.
    </p>

    <div class="row align-items-center g-4">
      <!-- Image -->
      <div class="col-md-6">
        <img class="img-fluid rounded shadow-sm"
             src="images/about2.jpg"
             alt="About image">
      </div>

      <!-- Text & Pointers -->
      <div class="col-md-6">
        <ul class="about-list list-unstyled">
          <li>
            <i class="fa-solid fa-graduation-cap about-icon"></i>
            <strong>Expert Mentors</strong><br>
            Two-line blurb explaining how seasoned instructors guide learners.
          </li>
          <li>
            <i class="fa-solid fa-laptop-code about-icon"></i>
            <strong>Hands-on Projects</strong><br>
            Practical assignments ensure skills are job-ready.
          </li>
          <li>
            <i class="fa-solid fa-globe about-icon"></i>
            <strong>Global Community</strong><br>
            Connect with peers across 50+ countries.
          </li>
          <li>
            <i class="fa-solid fa-certificate about-icon"></i>
            <strong>Certified Courses</strong><br>
            Earn industry-recognized certificates on completion.
          </li>

          <li>
            Lorem ipsum, dolor sit amet consectetur adipisicing elit. Explicabo, consequuntur quas, voluptas corporis tenetur veniam iusto atque omnis earum suscipit aliquam repudiandae odit sint molestias at expedita maiores quasi laboriosam!
            Ut nostrum, consequuntur nihil sequi, labore voluptates blanditiis, optio ullam assumenda impedit cupiditate omnis cum sunt nesciunt aperiam aliquid. Aut dolor hic maiores neque asperiores dolorum veritatis omnis labore sapiente?
          </li>
        </ul>
      </div>
    </div>
  </div>
</section>


<!-- ACHIVEMENTS”€ -->
<section id="stats" class="counter-section py-5">
  <div class="container">
    <div class="row text-center gy-4">
    
      <!-- Years -->
      <div class="col-6 col-md-3">
        <i class="fa-solid fa-calendar-alt counter-icon mb-2"></i>
        <h3 class="counter" data-target="12">0</h3>
        <p class="counter-label mb-0">Years in Training</p>
      </div>
      
      <!-- Students -->
      <div class="col-6 col-md-3">
        <i class="fa-solid fa-user-graduate counter-icon mb-2"></i>
        <h3 class="counter" data-target="8500">0</h3>
        <p class="counter-label mb-0">Students Enrolled</p>
      </div>
      
      <!-- Trainers -->
      <div class="col-6 col-md-3">
        <i class="fa-solid fa-chalkboard-teacher counter-icon mb-2"></i>
        <h3 class="counter" data-target="45">0</h3>
        <p class="counter-label mb-0">Expert Trainers</p>
      </div>
      
      <!-- Awards -->
      <div class="col-6 col-md-3">
        <i class="fa-solid fa-award counter-icon mb-2"></i>
        <h3 class="counter" data-target="18">0</h3>
        <p class="counter-label mb-0">Awards Won</p>
      </div>
    </div>
  </div>
</section>



<!-- COURSES -->
<section id="courses" class="courses-section py-5">
  <div class="container">

    <!-- heading -->
    <h2 class="section-title text-center mb-3">Courses&nbsp;We&nbsp;Offer</h2>
    <p class="section-subtitle text-center mb-5 mx-auto" style="max-width:640px;">
      Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nulla, perspiciatis?
    </p>

    <!-- Japanese -->
<h3 class="course-group-title mb-4">Japanese Language Courses</h3>
<div class="row g-4 mb-5">

  <div class="col-md-4 col-xl-2-4">
    <div class="course-card card h-100">
      <img src="images/n5.png" class="card-img-top" alt="JLPT N5 Starter">
      <div class="card-body">
        <h5 class="card-title mb-2">JLPT N5 Starter</h5>
        <p class="course-meta mb-1"><i class="fa-solid fa-tag me-1"></i>Rs.5,999</p>
      
        <a href="courses.jsp" class="btn btn-cta w-100 mt-2">Enroll Now</a>
      </div>
    </div>
  </div>

  <div class="col-md-4 col-xl-2-4">
    <div class="course-card card h-100">
      <img src="images/n4.png" class="card-img-top" alt="JLPT N4 Builder">
      <div class="card-body">
        <h5 class="card-title mb-2">JLPT N4 Builder</h5>
        <p class="course-meta mb-1"><i class="fa-solid fa-tag me-1"></i>Rs.7,499</p>
       
        <a href="courses.jsp" class="btn btn-cta w-100 mt-2">Enroll Now</a>
      </div>
    </div>
  </div>

  <div class="col-md-4 col-xl-2-4">
    <div class="course-card card h-100">
      <img src="images/n3.png" class="card-img-top" alt="JLPT N3 Intermediate">
      <div class="card-body">
        <h5 class="card-title mb-2">JLPT N3 Intermediate</h5>
        <p class="course-meta mb-1"><i class="fa-solid fa-tag me-1"></i>Rs.8,999</p>
    
        <a href="courses.jsp" class="btn btn-cta w-100 mt-2">Enroll Now</a>
      </div>
    </div>
  </div>

  <div class="col-md-4 col-xl-2-4">
    <div class="course-card card h-100">
      <img src="images/n2.png" class="card-img-top" alt="JLPT N2 Advanced">
      <div class="card-body">
        <h5 class="card-title mb-2">JLPT N2 Advanced</h5>
        <p class="course-meta mb-1"><i class="fa-solid fa-tag me-1"></i>Rs.11,499</p>
        
        <a href="courses.jsp" class="btn btn-cta w-100 mt-2">Enroll Now</a>
      </div>
    </div>
  </div>

  <div class="col-md-4 col-xl-2-4">
    <div class="course-card card h-100">
      <img src="images/n1.png" class="card-img-top" alt="JLPT N1 Mastery">
      <div class="card-body">
        <h5 class="card-title mb-2">JLPT N1 Mastery</h5>
        <p class="course-meta mb-1"><i class="fa-solid fa-tag me-1"></i>Rs.13,999</p>
     
        <a href="courses.jsp" class="btn btn-cta w-100 mt-2">Enroll Now</a>
      </div>
    </div>
  </div>

</div>

    </div>

  </div>
</section>


<!-- FLASH-DEAL  -->
<section id="offer" class="offer-section py-5 text-center">
  <div class="container">

    <h2 class="offer-tagline mb-2">Flash Deal 25% OFF</h2>
    <p class="offer-copy mb-4">
      Use coupon <strong>LANG25</strong> on any course. Offer vanishes in:
    </p>

    <div id="offerTimer" class="d-flex justify-content-center gap-4 mb-4">
      <!-- timer boxes injected by JS -->
    </div>

    <a href="#courses" class="btn btn-cta btn-lg px-4">Grab Offer Now</a>
  </div>
</section>


<!--  TESTIMONIALS ”€ -->

<section id="testimonials" class="testi-section py-5">
  <div class="container">

    <h2 class="section-title text-center mb-5">What Our Learners Say</h2>

    <div id="testiCarousel" class="owl-carousel owl-theme">

      <!-- slide 1 -->
      <div class="item d-md-flex align-items-center gap-4 px-2 px-md-4">
        <img src="images/testimonial - 1.jpg"
             class="testi-img flex-shrink-0 mb-3 mb-md-0" alt="Aarav">
        <div>
          <p class="testi-quote mb-3">
            €œThe interactive sessions and real-world projects helped me clear
            JLPT with confidence. Highly recommended to every language lover.</p>
          <h5 class="mb-0">Aarav Singh</h5>
          <small class="text-muted">JLPT N3</small>
        </div>
      </div>

      <!-- slide 2 -->
      <div class="item d-md-flex align-items-center gap-4 px-2 px-md-4">
        <img src="images/testimonial - 1.jpg"
             class="testi-img flex-shrink-0 mb-3 mb-md-0" alt="Mira">
        <div>
          <p class="testi-quote mb-3">
            €œFrench grammar finally made sense! The tutors kept every lesson
            lively, and I aced JLPT on my first attempt.</p>
          <h5 class="mb-0">Mira Dubois</h5>
          <small class="text-muted">DELF B2</small>
        </div>
      </div>

      <!-- slide 3 -->
      <div class="item d-md-flex align-items-center gap-4 px-2 px-md-4">
        <img src="images/testimonial - 1.jpg"
             class="testi-img flex-shrink-0 mb-3 mb-md-0" alt="Ken">
        <div>
          <p class="testi-quote mb-3">
            €œFrom vocab drills to mock tests, everything was structured
            perfectly. I felt ready for JLPT N2 in record time.</p>
          <h5 class="mb-0">Ken Yamamoto</h5>
          <small class="text-muted">JLPT N2</small>
        </div>
      </div>

          <!-- slide 3 -->
      <div class="item d-md-flex align-items-center gap-4 px-2 px-md-4">
        <img src="images/testimonial - 2.jpg"
             class="testi-img flex-shrink-0 mb-3 mb-md-0" alt="Ken">
        <div>
          <p class="testi-quote mb-3">
           €œFrom vocab drills to mock tests, everything was structured
            perfectly. I felt ready for JLPT N2 in record time.</p>
          <h5 class="mb-0">Ken Yamamoto</h5>
          <small class="text-muted">JLPT N2</small>
        </div>
      </div>

          <!-- slide 3 -->
      <div class="item d-md-flex align-items-center gap-4 px-2 px-md-4">
        <img src="images/testimonial - 3.jpg"
             class="testi-img flex-shrink-0 mb-3 mb-md-0" alt="Ken">
        <div>
          <p class="testi-quote mb-3">
            From vocab drills to mock tests, everything was structured
            perfectly. I felt ready for JLPT N2 in record time.</p>
          <h5 class="mb-0">Ken Yamamoto</h5>
          <small class="text-muted">JLPT N2</small>
        </div>
      </div>

    </div>
    <!-- /owl-carousel -->

  </div>
</section>



<!-- FOOTER”€ -->
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

<!-- ---------- JS ---------- -->
  <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
  <script src="js/script.js"></script>
</body>
</html>
