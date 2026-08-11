<?php
session_start();

include 'Resources/resource.boot.php';
include 'Controllers/query.ctr.php';

$bootstrap = new Bootstrap();
$query = new Query();

if($_POST){
  if(empty($_POST['username']) || empty($_POST['password'])){
    if(empty($_POST['username'])){
      $usererror = "The Username field is required";
    }
    if(empty($_POST['password'])){
      $passerror = "The Password field is required";
    }
  }else{
    $username = $_POST['username'];
    $password = $_POST['password'];
    $query->login($username, $password);
  }
}
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login To Access</title>

  <!-- Google Fonts & Material Icons -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Hanken+Grotesk:wght@400;500;600;700&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1" rel="stylesheet">

  <?php $bootstrap->cssindex(); ?>

  <style>
    :root {
      --bg-color: #f8fafc;
      --card-bg: rgba(255, 255, 255, 0.75);
      --primary: #1e40af;
      --primary-hover: #00288e;
      --text-main: #131b2e;
      --text-muted: #444653;
      --text-light: #757684;
      --border-color: #e2e8f0;
      --error-bg: #ffdad6;
      --error-text: #93000a;
      --error-border: rgba(186, 26, 26, 0.2);
    }

    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Hanken Grotesk', sans-serif;
      background-color: var(--bg-color);
      background-image: 
        radial-gradient(at 40% 20%, hsla(220,100%,94%,1) 0px, transparent 50%),
        radial-gradient(at 80% 0%, hsla(210,100%,96%,1) 0px, transparent 50%),
        radial-gradient(at 0% 50%, hsla(220,100%,96%,1) 0px, transparent 50%),
        radial-gradient(at 80% 50%, hsla(210,100%,94%,1) 0px, transparent 50%),
        radial-gradient(at 0% 100%, hsla(220,100%,96%,1) 0px, transparent 50%),
        radial-gradient(at 80% 100%, hsla(210,100%,94%,1) 0px, transparent 50%),
        radial-gradient(at 0% 0%, hsla(220,100%,98%,1) 0px, transparent 50%);
      min-height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 16px;
      color: var(--text-main);
    }

    .login-container {
      width: 100%;
      max-width: 420px;
    }

    .glass-card {
      background: var(--card-bg);
      backdrop-filter: blur(16px);
      -webkit-backdrop-filter: blur(16px);
      box-shadow: 0px 8px 32px rgba(15, 23, 42, 0.08);
      border-radius: 12px;
      padding: 40px 32px;
    }

    /* Header Styling */
    .brand-header {
      text-align: center;
      margin-bottom: 32px;
    }

    .brand-icon {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      width: 48px;
      height: 48px;
      background-color: var(--primary);
      color: #ffffff;
      border-radius: 12px;
      margin-bottom: 16px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.05);
    }

    .brand-title {
      font-size: 28px;
      font-weight: 700;
      line-height: 1.2;
    }

    .brand-title a {
      color: var(--primary);
      text-decoration: none;
    }

    .brand-subtitle {
      font-size: 14px;
      color: var(--text-muted);
      margin-top: 6px;
    }

    /* Form Fields */
    .form-group {
      margin-bottom: 24px;
      position: relative;
    }

    .input-wrapper {
      display: flex;
      align-items: center;
      border-bottom: 1px solid var(--border-color);
      transition: border-color 0.2s ease;
      position: relative;
    }

    .input-wrapper:focus-within {
      border-bottom-color: var(--primary);
    }

    .input-wrapper .material-symbols-outlined {
      color: var(--text-light);
      margin-right: 12px;
      font-size: 20px;
      transition: color 0.2s ease;
    }

    .input-wrapper:focus-within .material-symbols-outlined {
      color: var(--primary);
    }

    .form-input {
      width: 100%;
      border: none;
      background: transparent;
      padding: 10px 0;
      font-size: 16px;
      font-family: inherit;
      color: var(--text-main);
      outline: none;
    }

    .form-input::placeholder {
      color: var(--text-light);
    }

    /* Eye Toggle Button */
    .eye-toggle-btn {
      position: absolute;
      right: 0;
      background: transparent;
      border: none;
      cursor: pointer;
      color: var(--text-light);
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 4px;
      transition: color 0.2s ease, transform 0.2s ease !important;
    }

    .eye-toggle-btn:hover {
      color: var(--primary) !important;
    }

    /* Submit Button */
    .btn-submit {
      width: 100%;
      padding: 12px 16px;
      background-color: var(--primary);
      color: #ffffff;
      border: none;
      border-radius: 9999px;
      font-size: 14px;
      font-weight: 600;
      letter-spacing: 0.05em;
      cursor: pointer;
      transition: background-color 0.2s ease, transform 0.1s ease !important;
      margin-top: 8px;
    }

    .btn-submit:hover {
      background-color: var(--primary-hover) !important;
      color: #ffffff !important;
    }

    /* Alerts */
    .custom-alert {
      background-color: var(--error-bg);
      color: var(--error-text);
      border: 1px solid var(--error-border);
      padding: 12px 16px;
      border-radius: 8px;
      font-size: 14px;
      display: flex;
      align-items: center;
      gap: 10px;
      margin-bottom: 24px;
    }

    .field-error {
      color: #ba1a1a;
      font-size: 12px;
      margin-top: 6px;
    }

    /* Footer */
    .login-footer {
      text-align: center;
      margin-top: 24px;
      font-size: 12px;
      color: var(--text-light);
    }

    .login-footer a {
      color: var(--primary);
      text-decoration: none;
    }

    .login-footer a:hover {
      text-decoration: underline;
    }
  </style>
</head>

<body>
  <main class="login-container">
    <div class="glass-card">
      
      <!-- Logo & Header -->
      <div class="brand-header">
        <div class="brand-icon">
          <span class="material-symbols-outlined">corporate_fare</span>
        </div>
        <h1 class="brand-title">
          <a href="login.php">Link Mark</a>
        </h1>
        <p class="brand-subtitle">Enterprise System Login</p>
      </div>

      <!-- PHP Login Alert -->
      <?php if(!empty($error)): ?>
        <div class="custom-alert">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-triangle-fill" viewBox="0 0 16 16">
            <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
          </svg>
          <span><?= htmlspecialchars($error); ?></span>
        </div>
      <?php endif; ?>

      <!-- Form -->
      <form action="login.php" method="post">
        
        <!-- Username Field -->
        <div class="form-group">
          <div class="input-wrapper">
            <span class="material-symbols-outlined">person</span>
            <input type="text" class="form-input" name="username" placeholder="Username">
          </div>
          <?php if(!empty($usererror)): ?>
            <p class="field-error"><?= $usererror; ?></p>
          <?php endif; ?>
        </div>

        <!-- Password Field -->
        <div class="form-group">
          <div class="input-wrapper">
            <span class="material-symbols-outlined">lock</span>
            <input type="password" class="form-input" name="password" id="passwordinp" placeholder="Password" style="padding-right: 30px;">
            
            <button type="button" id="eye" class="eye-toggle-btn">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-slash-fill" viewBox="0 0 16 16" id="eyeclose" style="display:none;">
                <path d="m10.79 12.912-1.614-1.615a3.5 3.5 0 0 1-4.474-4.474l-2.06-2.06C.938 6.278 0 8 0 8s3 5.5 8 5.5a7 7 0 0 0 2.79-.588M5.21 3.088A7 7 0 0 1 8 2.5c5 0 8 5.5 8 5.5s-.939 1.721-2.641 3.238l-2.062-2.062a3.5 3.5 0 0 0-4.474-4.474z"/>
                <path d="M5.525 7.646a2.5 2.5 0 0 0 2.829 2.829zm4.95.708-2.829-2.83a2.5 2.5 0 0 1 2.829 2.829zm3.171 6-12-12 .708-.708 12 12z"/>
              </svg>
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16" id="eyeopen">
                <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"/>
                <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7"/>
              </svg>
            </button>
          </div>
          <?php if(!empty($passerror)): ?>
            <p class="field-error"><?= $passerror; ?></p>
          <?php endif; ?>
        </div>

        <!-- Submit Button -->
        <button type="submit" class="btn-submit">Log In</button>

      </form>

      <!-- Footer Subtext -->
      <div class="login-footer">
        <p>Protected by Link Mark Security · <a href="#">Privacy</a></p>
      </div>

    </div>
  </main>

  <script>
    document.getElementById('eye').addEventListener('click', function() {
      let passwordField = document.getElementById('passwordinp');
      let eyeOpen = document.getElementById('eyeopen');
      let eyeClose = document.getElementById('eyeclose');

      if (passwordField.type === 'password') {
        passwordField.type = 'text';
        eyeOpen.style.display = 'none';
        eyeClose.style.display = 'inline';
      } else {
        passwordField.type = 'password';
        eyeOpen.style.display = 'inline';
        eyeClose.style.display = 'none';
      }
    });
  </script>

  <?php $bootstrap->javascriptindex(); ?>
</body>
</html>