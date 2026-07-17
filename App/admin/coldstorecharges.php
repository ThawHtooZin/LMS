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
            <a href="choosedaterange.php" class="nav-card">
              <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" width="76px">
                <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                <g id="SVGRepo_iconCarrier">
                  <path d="M8 2V5M16 2V5M3.5 9.09H20.5M21 8.5V17C21 20 19.5 22 16 22H8C4.5 22 3 20 3 17V8.5C3 5.5 4.5 3.5 8 3.5H16C19.5 3.5 21 5.5 21 8.5Z" stroke="#00e1ff" stroke-width="2" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path>
                  <path d="M15.6947 13.7002H15.7037M15.6947 16.7002H15.7037M11.9947 13.7002H12.0047M11.9947 16.7002H12.0047M8.29474 13.7002H8.30474M8.29474 16.7002H8.30474" stroke="#00e1ff" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                </g>
              </svg>
              <div class="nav-card-title">Date Range<br>Cold Store Charge</div>
            </a>
          </div>

          <div class="col-12 col-md-5 col-lg-4 mb-4">
            <a href="monthlycharges.php" class="nav-card">
              <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" width="76px">
                <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                <g id="SVGRepo_iconCarrier">
                  <path d="M8 2V5M16 2V5M3.5 9.09H20.5M21 8.5V17C21 20 19.5 22 16 22H8C4.5 22 3 20 3 17V8.5C3 5.5 4.5 3.5 8 3.5H16C19.5 3.5 21 5.5 21 8.5Z" stroke="#ffee00" stroke-width="2" stroke-miterlimit="10" stroke-linecap="round" stroke-linejoin="round"></path>
                  <path d="M11.9955 13.75V19.25M11.9955 13.75C11.2635 13.75 10.5965 13.882 10.0125 14.116C9.53946 14.305 9.24846 14.774 9.35146 15.275C9.48946 15.945 10.1555 16.353 10.8225 16.486L12.5645 16.836C13.5785 17.039 14.4755 17.568 14.6545 18.435C14.7935 19.11 14.3645 19.78 13.7295 20.061C13.1895 20.301 12.5485 20.45 11.8345 20.45C10.9855 20.45 10.2175 20.264 9.54446 19.957M11.9955 13.75C12.7535 13.75 13.4425 13.896 14.0415 14.152C14.5245 14.357 14.8185 14.847 14.6975 15.358C14.5365 16.037 13.8345 16.425 13.1495 16.273L12.8055 16.196" stroke="#ffee00" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                </g>
              </svg>
              <div class="nav-card-title">Monthly<br>Cold Store Charge</div>
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