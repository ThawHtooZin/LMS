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
      <div class="col-2" id="sidebar">
        <?php
        include 'sidebar.php';
        ?>
      </div>
      <div class="col-10" id="content">
        <button type="button" class="btn btn-default btn-sm" id="menu">
          <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
          </svg>
        </button>
        <h1 class="p-3 pt-4 text-center text-primary" style="font-family: 'Caprasimo', cursive;font-family: 'Cormorant Garamond', serif;font-family: 'Teko', sans-serif; font-size: 65px; text-shadow:-7px 7px 10px gray;"> <span style="font-size:70px;">LINK MARK </span> <br> COMPANY LIMITED</h1>
        <div class="container text-center w-50" style="margin-top:50px; margin-left:auto; margin-right:auto;">
          <img src="../../Images/Personal-computer.jpg" alt="" width="50%">
          <br><br><br>
          <h3 data-num="1">LINK MARK SYSTEM</h3>
        </div>
      </div>
    </div>
    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
