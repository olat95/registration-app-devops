<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>DevOps Registration</title>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<div class="wrapper">
  <h1 class="main-title">Register for DevOps Learning!!!</h1>
  <h1 class="main-title">DevOps Instructor - Moyo Obafemi</h1> 
  <h2 class="sub-title">Virtual TechBox YouTube Channel — 2025</h2>

  <form id="registerForm">
    <div class="form-container">
      <div class="form-column">
        <label for="Name"><b>Full Name</b></label>
        <input type="text" placeholder="Enter Full Name" name="Name" id="Name" required>

        <label for="mobile"><b>Mobile</b></label>
        <input type="text" placeholder="Enter Mobile Number" name="mobile" id="mobile" required>

        <label for="email"><b>Email</b></label>
        <input type="email" placeholder="Enter Email" name="email" id="email" required>
      </div>

      <div class="form-column">
        <label for="psw"><b>Password</b></label>
        <input type="password" placeholder="Enter Password" name="psw" id="psw" required>

        <label for="psw-repeat"><b>Repeat Password</b></label>
        <input type="password" placeholder="Repeat Password" name="psw-repeat" id="psw-repeat" required>

        <p class="terms">By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>
        <button type="submit" class="registerbtn">Register Now</button>
      </div>
    </div>
  </form>

  <div class="signin-note">
    <p>Already have an account? <a href="#">Sign in</a>.</p>
  </div>

  <footer>
    <h3>Thank You, Happy Learning</h3>
    <h4>See You Again — Pelumi</h4>
  </footer>
</div>

<!-- Success Modal -->
<div id="successModal" class="modal">
  <div class="modal-content">
    <span class="close-btn" id="closeModal">&times;</span>
    <h2>✅ Registration Successful!</h2>
    <p>Welcome to my world, <span id="userName"></span> 👋</p>
  </div>
</div>

<script>
  const form = document.getElementById('registerForm');
  const modal = document.getElementById('successModal');
  const closeModal = document.getElementById('closeModal');
  const userNameSpan = document.getElementById('userName');

  form.addEventListener('submit', function(e) {
    e.preventDefault();
    const name = document.getElementById('Name').value;
    userNameSpan.textContent = name || "User";
    modal.style.display = 'block';
  });

  closeModal.onclick = function() {
    modal.style.display = 'none';
  };

  window.onclick = function(e) {
    if (e.target == modal) {
      modal.style.display = 'none';
    }
  };
</script>

</body>
</html>
