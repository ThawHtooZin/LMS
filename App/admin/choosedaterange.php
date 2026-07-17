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

      <style>
        .nav-card {
          transition: transform 0.3s ease, box-shadow 0.3s ease;
          border-radius: 20px;
          background: #ffffff;
          box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
          border: 2px solid transparent;
          text-decoration: none;
          color: #333;
          border-color: #0dcaf0;
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          min-height: 250px;
          padding: 20px;
          text-align: center;
        }

        .nav-card:hover {
          transform: translateY(-8px);
          box-shadow: 0 15px 40px rgba(0, 0, 0, 0.12);
          color: #333;
        }

        .nav-card-title {
          font-family: 'Teko', sans-serif;
          font-size: 2.2rem;
          font-weight: 700;
          margin-top: 15px;
          letter-spacing: 1px;
          line-height: 1.1;
        }
      </style>

      <div class="container-fluid d-flex justify-content-center align-items-center" style="min-height: 75vh;">
        <div class="row w-100 justify-content-evenly">

          <div class="col-12 col-md-5 col-lg-4 mb-4">
            <a href="daterangecharges.php" class="nav-card">
              <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" width="76px">
                <g stroke="#00e1ff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M3 21h18"></path>
                  <path d="M5 21V7l7-4 7 4v14"></path>
                  <path d="M9 21v-5a2 2 0 0 1 2-2h2a2 2 0 0 1 2 2v5"></path>
                </g>
              </svg>
              <div class="nav-card-title">Hlaing Htate Khaung<br>Cold Store Charge</div>
            </a>
          </div>

          <div class="col-12 col-md-5 col-lg-4 mb-4">
            <a href="msldaterangecharges.php" class="nav-card">
              <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" width="76px">
                <g stroke="#ffee00" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M3 21h18"></path>
                  <path d="M4 21V8l8-5 8 5v13"></path>
                  <path d="M10 21v-4a2 2 0 0 1 4 0v4"></path>
                  <path d="M10 11h4"></path>
                </g>
              </svg>
              <div class="nav-card-title">MSL<br>Cold Store Charge</div>
            </a>
          </div>

        </div>
      </div>
    </div>
  </div>
  <?php
  $bootstrap->javascript();
  ?>
</body>

</html>