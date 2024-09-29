<?php
session_start();

include 'Resources/resource.boot.php';
include 'Controllers/query.ctr.php';

$bootstrap = new Bootstrap();
$query = new Query();
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Login To Access</title>
  </head>
  <style>
    button:hover{
      color: black !important;
    }
  </style>
  <?php
    $bootstrap->cssindex();
  ?>
  <style media="screen">
    button:hover{
        color:white !important;
    }
    button{
      transition: 0.5s !important;
    }
  </style>
  <body class="hold-transition login-page">
    <?php
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
    <div class="login-box" style="box-shadow: 0px 8px 16px 0px gray;">
      <!-- /.login-logo -->
      <div class="card">
        <div class="card-body login-card-body">
          <div class="login-logo">
            <a href="login.php"><b>Link Mark</b> Login</a>
          </div>
          <?php
          if(!empty($error)){
            echo '
            <div class="alert alert-warning text-danger alert-dismissible fade show" role="alert" style="background: orange !important;">
              <strong><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-exclamation-triangle-fill" viewBox="0 0 16 16"><path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/></svg>'. $error .'</strong>
              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            ';
          }
          ?>
          <form action="login.php" method="post">
            <div class="input-group mb-3">
              <input type="text" class="form-control" name="username" placeholder="Username">
              <div class="input-group-append">
                <div class="input-group-text">
                  <span class="fas fa-user"></span>
                </div>
              </div>
            </div>
            <div class="input-group mb-3">
              <input type="password" class="form-control" name="password" id="passwordinp" placeholder="Password">
              <div class="input-group-append">
                <div class="input-group-text">
                <button type="button" id="eye" style="border: none; background:transparent; padding: 0px;">
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
              </div>
              <script>
                document.getElementById('eye').addEventListener('click', function() {
                  let passwordField = document.getElementById('passwordinp');

                  let eyeOpen = document.getElementById('eyeopen');
                  let eyeClose = document.getElementById('eyeclose');

                  if (passwordField.type === 'password') {
                      // Change the type to text
                      passwordField.type = 'text';
                      eyeOpen.style.display = 'none';
                      eyeClose.style.display = 'inline';
                  } else {
                      // Change the type back to password
                      passwordField.type = 'password';
                      eyeOpen.style.display = 'inline';
                      eyeClose.style.display = 'none';
                  }
              });

              </script>
            </div>
            <div class="row">
              <!-- /.col -->
              <div class="container">
                <button type="submit" class="btn btn-primary btn-block">Log In</button>
              </div>
              <!-- /.col -->
            </div>
          </form>


          <!-- <p class="mb-1">
            <a href="forgot-password.html">I forgot my password</a>
          </p>
          <p class="mb-0">
            <a href="register.html" class="text-center">Register a new membership</a>
          </p> -->
        </div>
        <!-- /.login-card-body -->
      </div>
    </div>
    <!-- /.login-box -->
    <?php
    $bootstrap->javascriptindex();
    ?>
  </body>
</html>
