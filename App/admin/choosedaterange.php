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
    <div class="contentcol">
      <?php require 'navbar.php'; ?>
      <div class="row" style="padding-top: 200px;">
        <div class="col text-center">
          <a href="daterangecharges.php" class="btn btn-default border border-3" style="padding: 100px !important;">Hlaing Htate Khaung Cold Store Charge</a>
        </div>
        <div class="col text-center">
          <a href="msldaterangecharges.php" class="btn btn-default border border-3" style="padding: 100px !important;">MSL Cold Store Charge</a>
        </div>
      </div>
    </div>
  </div>
  <?php
  $bootstrap->javascript();
  ?>
</body>

</html>