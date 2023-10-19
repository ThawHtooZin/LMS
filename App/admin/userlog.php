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
                <td><?php echo date("d:m:Y", strtotime($userlogdata['login_date'])); ?></td>
                <td><?php echo $userlogdata['login_username']; ?></td>
                <td><?php echo $userlogdata['login_password']; ?></td>
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
