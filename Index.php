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
  <body class="bg-secondary">
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
        $error = $query->login($username, $password);
      }
    }
    ?>
    <div class="container mt-5">
      <div class="card ms-auto me-auto bg-primary text-light" style="width:35%;">
        <div class="card-header">
          <h3 class="text-center">Login To Access</h3>
        </div>
        <form action="index.php" method="post" autocomplete="off">
        <div class="card-body">
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
            <label>Username</label>
            <input type="text" name="username" class="form-control" placeholder="Username">
            <p class="text-warning"><?php if(!empty($usererror)){echo $usererror;} ?></p>
            <label>Password</label>
            <input type="password" name="password" class="form-control" placeholder="Password">
            <p class="text-warning"><?php if(!empty($passerror)){echo $passerror;} ?></p>
        </div>
        <div class="card-footer text-center">
          <button type="submit" class="btn btn-outline-info w-50">Login</button>
        </div>
      </form>
      </div>
    </div>
    <?php
    $bootstrap->javascriptindex();
    ?>
  </body>
</html>
