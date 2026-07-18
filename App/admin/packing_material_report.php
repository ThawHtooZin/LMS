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
  <?php $bootstrap->css(); ?>
  <style>
    .nav-card {
      transition: transform 0.2s ease, box-shadow 0.2s ease;
      border-radius: 15px;
      background: #ffffff;
      border: 2px solid #0dcaf0;
      text-decoration: none;
      color: #333;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      min-height: 200px;
      padding: 20px;
      text-align: center;
    }

    .nav-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }

    .nav-card-title {
      font-family: 'Teko', sans-serif;
      font-size: 1.8rem;
      margin-top: 15px;
    }

    .icon-box {
      border: 2px solid #0dcaf0;
      padding: 15px;
      border-radius: 8px;
      margin-bottom: 10px;
      display: inline-block;
    }
  </style>
</head>

<body>
  <div class="row">
    <div class="sidebarcol" id="sidebar"><?php include 'sidebar.php'; ?></div>
    <div class="contentcol">
      <?php require 'navbar.php'; ?>

      <div class="container-fluid d-flex flex-column justify-content-center" style="min-height: 80vh;">
        <div class="row justify-content-evenly g-4">
          <!-- Warehouse Report -->
          <div class="col-lg-3">
            <a href="warehousereport.php" class="nav-card">
              <div class="icon-box">
                <svg width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="#0dcaf0" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M3 3h18v18H3zM3 9h18M9 21V9"></path>
                </svg>
              </div>
              <div class="nav-card-title">LM WareHouse Report</div>
            </a>
          </div>
          <!-- Gate Pass Report -->
          <div class="col-lg-3">
            <a href="gatepassreport.php" class="nav-card">
              <div class="icon-box">
                <svg width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="#0dcaf0" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M15 3h6v6M10 14L21 3M18 13v6a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h6"></path>
                </svg>
              </div>
              <div class="nav-card-title">Gate Pass Report</div>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <?php $bootstrap->javascript(); ?>
</body>

</html>