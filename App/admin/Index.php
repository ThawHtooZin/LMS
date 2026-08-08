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
<!-- Font Awesome CDN added here specifically for icons on this page -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Caprasimo&family=Cormorant+Garamond:wght@300&family=Teko:wght@700&display=swap" rel="stylesheet">

<body>
  <?php
  $_SESSION['startdate'] = '2012-01-01';
  $_SESSION['enddate'] = date('Y-m-d');
  $_SESSION['stock_to'] = 'hhk';
  $_SESSION['rate'] = 0;
  $_SESSION['tabs'] = '';
  ?>
  <div class="row">
    <div class="sidebarcol" id="sidebar">
      <?php
      include 'sidebar.php';
      ?>
    </div>
    <div class="col p-4">
      <!-- Top Navbar Placeholder -->
      <!-- <?php require 'navbar.php'; ?> -->

      <!-- Welcome Back Hero Section -->
      <div class="welcome-card mb-5">
        <h1 class="card-title">Welcome back, <?= isset($_SESSION['username']) ? $_SESSION['username'] : 'Administrator'; ?>.</h1>
        <p class="card-subtitle mt-3">The system is currently operating at optimal efficiency. All protocols are active and monitoring status is green.</p>
        <i class="fas fa-shield-alt shield-icon"></i>
      </div>

      <!-- Summary Info Cards -->
      <div class="row g-4 mb-4">
        <!-- Authenticated User Card -->
        <div class="col-md-4">
          <div class="card info-card h-100 text-center">
            <div class="card-body">
              <div class="info-icon-wrapper">
                <i class="fas fa-id-card info-icon"></i>
              </div>
              <p class="card-label">Authenticated User</p>
              <h2 class="card-value"><?= isset($_SESSION['username']) ? $_SESSION['username'] : 'Administrator'; ?></h2>
              <p class="card-sub-value"><?= isset($_SESSION['user_email']) ? $_SESSION['user_email'] : 'admin@linkmark.system'; ?></p>
            </div>
          </div>
        </div>

        <!-- System Version Card -->
        <div class="col-md-4">
          <div class="card info-card h-100 text-center">
            <div class="card-body">
              <div class="info-icon-wrapper">
                <i class="fas fa-terminal info-icon"></i>
              </div>
              <p class="card-label">System Version</p>
              <h2 class="card-value">v1.0.1 Stable</h2>
              <div class="mt-2">
                <span class="badge-connected">
                  <span class="dot"></span>
                  Connected
                </span>
              </div>
            </div>
          </div>
        </div>

        <!-- Current System Time Card -->
        <div class="col-md-4">
          <div class="card info-card h-100 text-center">
            <div class="card-body">
              <div class="info-icon-wrapper">
                <i class="fas fa-clock info-icon"></i>
              </div>
              <p class="card-label">Current System Time</p>
              <h2 class="card-value" id="timer"><?= date('H:i:s'); ?></h2>
              <p class="card-sub-value"><?= date('l, F j, Y'); ?></p>
            </div>
          </div>
        </div>
      </div>

      <!-- Global Status Summary Section -->
      <div class="status-summary-header text-center">
        <div class="line"></div>
        <span>GLOBAL STATUS SUMMARY</span>
      </div>

      <div class="row justify-content-center text-center">
        <div class="col-6 col-sm-3 mb-3 mb-sm-0">
          <i class="fas fa-check-circle status-footer-icon"></i>
          <span class="status-text">Core Engine Active</span>
        </div>
        <div class="col-6 col-sm-3 mb-3 mb-sm-0">
          <i class="fas fa-check-circle status-footer-icon"></i>
          <span class="status-text">Node Integrity Validated</span>
        </div>
        <div class="col-6 col-sm-3">
          <i class="fas fa-check-circle status-footer-icon"></i>
          <span class="status-text">Secure Tunnel Established</span>
        </div>
        <div class="col-6 col-sm-3">
          <i class="fas fa-check-circle status-footer-icon"></i>
          <span class="status-text">Database Sync Optimal</span>
        </div>
      </div>

    </div>
  </div>
  <?php
  $bootstrap->javascript();
  ?>
</body>

</html>