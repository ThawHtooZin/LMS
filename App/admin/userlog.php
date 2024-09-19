<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Admin | Dashboard</title>
  </head>
  <?php
  $bootstrap->css();
  ?>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Caprasimo&family=Cormorant+Garamond:wght@300&family=Teko:wght@700&display=swap" rel="stylesheet">
  <body>
    <?php
    
    $nowdate = new DateTime();
    $nowdate->modify('-6 months');
    $sixmonthago = $nowdate->format('Y-m-d');

    $stmt = $pdo->prepare("DELETE FROM userlogs WHERE login_date < '$sixmonthago' ");
    $stmt->execute();

    ?>
    <div class="row">
      <div class="sidebarcol" id="sidebar">
        <?php
        include 'sidebar.php';
        ?>
      </div>
      <div class="contentcol" id="content">
        <?php require 'navbar.php'; ?>
        <div class="card">
          <div class="card-header bg-info">

            <b class="text-light">User Logs</b>

            <a href=""></a>
          </div>
          <div class="card-body">
            <table class="table table-hover table-bordered">
              <tr>
                <th>Id</th>
                <th>Login Time</th>
                <th>Login Date</th>
                <th>Login Username</th>
                <th>Login Password</th>
                <th>Status</th>
              </tr>
              <?php
              $userlogdatas = $query->selectall('userlogs');
              $idd = 0;
              foreach ($userlogdatas as $userlogdata) {
                $idd++;
              ?>
              <tr>
                <td><?php echo $idd; ?></td>
                <td><?php echo date('h:m:s', strtotime($userlogdata['login_time'])); ?></td>
                <td><?php echo date("d-m-Y", strtotime($userlogdata['login_date'])); ?></td>
                <td><?php echo $userlogdata['login_username']; ?></td>
                <td><input type="password" id="passwordinp<?= $idd ?>" value="<?php echo $userlogdata['login_password']; ?>" readonly style="border: none; outline: none; background:transparent; width:90%;">
                  <button id="eye<?= $idd ?>" style="border: none; background:transparent;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-slash-fill" viewBox="0 0 16 16" id="eyeclose<?= $idd ?>">
                      <path d="m10.79 12.912-1.614-1.615a3.5 3.5 0 0 1-4.474-4.474l-2.06-2.06C.938 6.278 0 8 0 8s3 5.5 8 5.5a7 7 0 0 0 2.79-.588M5.21 3.088A7 7 0 0 1 8 2.5c5 0 8 5.5 8 5.5s-.939 1.721-2.641 3.238l-2.062-2.062a3.5 3.5 0 0 0-4.474-4.474z"/>
                      <path d="M5.525 7.646a2.5 2.5 0 0 0 2.829 2.829zm4.95.708-2.829-2.83a2.5 2.5 0 0 1 2.829 2.829zm3.171 6-12-12 .708-.708 12 12z"/></svg>
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16" id="eyeopen<?= $idd ?>" style="display:none;">
                        <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0"/>
                        <path d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7"/>
                      </svg>
                </button>
                </td>
                <script>
                  $('#eye<?= $idd ?>').on('click', function() {
                      let passwordField = $('#passwordinp<?= $idd ?>');
                      let eyeOpen = $('#eyeopen<?= $idd ?>');
                      let eyeClose = $('#eyeclose<?= $idd ?>');

                      if (passwordField.attr('type') === 'password') {
                          // Create a new input field with the type set to text
                          let newField = passwordField.clone().attr('type', 'text');
                          passwordField.replaceWith(newField);
                          eyeOpen.show();
                          eyeClose.hide();
                      } else {
                          // Create a new input field with the type set to password
                          let newField = passwordField.clone().attr('type', 'password');
                          passwordField.replaceWith(newField);
                          eyeOpen.hide();
                          eyeClose.show();
                      }
                  });

                </script>
                <td><?php echo $userlogdata['status']; ?></td>
              </tr>
              <?php
              }
               ?>
            </table>
          </div>
        </div>
      </div>
    </div>
    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
