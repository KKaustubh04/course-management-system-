/* NAVBAR background toggle */
$(window).on("scroll", () => {
  $(".navbar").toggleClass("scrolled", $(window).scrollTop() > 50);
});

/* Simple rotating headline */
$(function () {
  const words = ["Build Your Future", "Learn In-Demand Skills", "Upgrade Today"];
  let i = 0;
  setInterval(() => {
    $("#heroTitle").fadeOut(200, function () {
      $(this).text(words[i = (i + 1) % words.length]).fadeIn(400);
    });
  }, 3500);
});



/* ---------- COUNTER ---------- */
(function(){
  let fired = false;

  function inView(el){
    const rect = el.getBoundingClientRect();
    return rect.top < window.innerHeight && rect.bottom > 0;
  }

  function startCounters(){
    if (fired) return;
    const section = document.getElementById("stats");
    if (!inView(section)) return;

    $(".counter").each(function(){
      const $this = $(this);
      const target = +$this.data("target");
      const duration = 3000;
      const stepTime = Math.max(Math.floor(duration / target), 20);
      let count = 0;

      const timer = setInterval(() => {
        count += Math.ceil(target / (duration / stepTime));
        if(count >= target){
          $this.text(target.toLocaleString());
          clearInterval(timer);
        }else{
          $this.text(count.toLocaleString());
        }
      }, stepTime);
    });

    fired = true; // run once
  }

  $(window).on("scroll load", startCounters);
})();


/* ---------- FLASH-DEAL COUNTDOWN ---------- */
(function(){
  // Build four boxes inside #offerTimer
  const units = ["Days","Hours","Minutes","Seconds"];
  const $wrap = $("#offerTimer");
  units.forEach(u=>{
    $wrap.append(`
      <div class="timer-box">
        <span class="timer-number" id="${u.toLowerCase()}">00</span>
        <span class="timer-label">${u}</span>
      </div>
    `);
  });

  // Target: 3 days from first visit (adjust if you prefer a calendar date)
  const target = Date.now() + 3*24*60*60*1000;

  function updateTimer(){
    const now   = Date.now();
    const diff  = Math.max(target - now, 0);

    const d = Math.floor(diff / 86400000);            // days
    const h = Math.floor(diff % 86400000 / 3600000);   // hours
    const m = Math.floor(diff % 3600000  / 60000);     // minutes
    const s = Math.floor(diff % 60000    / 1000);      // seconds

    $("#days").text(String(d).padStart(2,"0"));
    $("#hours").text(String(h).padStart(2,"0"));
    $("#minutes").text(String(m).padStart(2,"0"));
    $("#seconds").text(String(s).padStart(2,"0"));

    if(diff === 0) clearInterval(timer); // stop at zero
  }

  const timer = setInterval(updateTimer, 1000);
  updateTimer(); // run once immediately
})();


/* ---------- TESTIMONIAL OWL CAROUSEL ---------- */
$(function () {                                      // DOM ready
  $("#testiCarousel").owlCarousel({
    items:1,
    loop:true,
    smartSpeed:600,
    autoplay:true,
    autoplayTimeout:7000,
    nav:true,
    dots:true,
    navText:[
      "<i class='fa-solid fa-angle-left'></i>",
      "<i class='fa-solid fa-angle-right'></i>"
    ],
    responsive:{
      0:{margin:0},
      768:{margin:40}
    }
  });
});


// ---------- LOGIN FORM TABS ----------
const userBtn = document.getElementById("userTab");
const adminBtn = document.getElementById("adminTab");

const userForm = document.getElementById("userLoginForm");
const adminForm = document.getElementById("adminLoginForm");

userBtn.addEventListener("click", () => {
  userBtn.classList.add("active");
  adminBtn.classList.remove("active");

  userForm.style.display = "block";
  adminForm.style.display = "none";
});

adminBtn.addEventListener("click", () => {
  adminBtn.classList.add("active");
  userBtn.classList.remove("active");

  adminForm.style.display = "block";
  userForm.style.display = "none";
});



