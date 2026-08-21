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
        }

        .nav-card:hover {
          transform: translateY(-8px);
          box-shadow: 0 15px 40px rgba(0, 0, 0, 0.12);
          /* Info color border on hover */
          color: #333;
        }

        .nav-card-title {
          font-family: 'Teko', sans-serif;
          font-size: 3rem;
          font-weight: 700;
          margin-top: 15px;
          letter-spacing: 1px;
        }
      </style>

      <div class="container-fluid d-flex justify-content-center align-items-center" style="min-height: 75vh;">
        <div class="row w-100 justify-content-evenly">

          <div class="col-12 col-md-5 col-lg-4">
            <a href="form_10_frozen.php" class="nav-card">
              <svg fill="#00e1ff" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 52 52" enable-background="new 0 0 52 52" xml:space="preserve" width="76px">
                <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                <g id="SVGRepo_iconCarrier">
                  <path d="M27,3c0.6,0,1,0.4,1,1v45.9c0,0.6-0.4,1-1,1h-2c-0.6,0-1-0.4-1-1V4c0-0.6,0.4-1,1-1H27z"></path>
                  <path d="M26,17.2l-8.1-8.1c-0.4-0.4-0.4-1,0-1.4l1.4-1.4c0.4-0.4,1-0.4,1.4,0l5.3,5.3l5.3-5.3c0.4-0.4,1-0.4,1.4,0 l1.4,1.4c0.4,0.4,0.4,1,0,1.4L26,17.2"></path>
                  <path d="M26,36.7l8.1,8.1c0.4,0.4,0.4,1,0,1.4l-1.4,1.4c-0.4,0.4-1,0.4-1.4,0L26,42.3l-5.3,5.3c-0.4,0.4-1,0.4-1.4,0 l-1.4-1.4c-0.4-0.4-0.4-1,0-1.4L26,36.7"></path>
                  <path d="M47.1,15.6c0.3,0.5,0.2,1.1-0.4,1.4L7.2,40.3c-0.5,0.3-1.1,0.2-1.4-0.4l-1-1.7c-0.3-0.5-0.2-1.1,0.4-1.4 l39.5-23.4c0.5-0.3,1.1-0.2,1.4,0.4L47.1,15.6z"></path>
                  <path d="M34.4,22l2.8-11.1c0.1-0.6,0.6-0.9,1.2-0.7l1.9,0.5c0.6,0.1,0.9,0.6,0.7,1.2l-1.9,7.3l7.3,1.9 c0.6,0.1,0.9,0.6,0.7,1.2l-0.5,1.9c-0.1,0.6-0.6,0.9-1.2,0.7L34.4,22"></path>
                  <path d="M17.6,31.9L14.8,43c-0.1,0.6-0.6,0.9-1.2,0.7l-1.9-0.5c-0.6-0.1-0.9-0.6-0.7-1.2l1.9-7.3l-7.3-1.9 c-0.6-0.1-0.9-0.6-0.7-1.2l0.5-1.9C5.5,29.1,6,28.8,6.6,29L17.6,31.9"></path>
                  <path d="M5.9,13.9c0.3-0.5,0.9-0.7,1.4-0.4l39.5,23.4c0.5,0.3,0.7,0.9,0.4,1.4l-1,1.7c-0.3,0.5-0.9,0.7-1.4,0.4 L5.2,17c-0.5-0.3-0.7-0.9-0.4-1.4L5.9,13.9z"></path>
                  <path d="M17.6,22L6.5,24.9c-0.6,0.1-1.1-0.1-1.2-0.7l-0.5-1.9c-0.1-0.6,0.1-1.1,0.7-1.2l7.3-1.9l-1.9-7.3 c-0.1-0.6,0.1-1.1,0.7-1.2l1.9-0.5c0.6-0.1,1.1,0.1,1.2,0.7L17.6,22"></path>
                  <path d="M34.3,31.9L45.4,29c0.6-0.1,1.1,0.1,1.2,0.7l0.5,1.9c0.1,0.6-0.1,1.1-0.7,1.2l-7.3,1.9L41,42 c0.1,0.6-0.1,1.1-0.7,1.2l-1.9,0.5c-0.6,0.1-1.1-0.1-1.2-0.7L34.3,31.9"></path>
                </g>
              </svg>
              <div class="nav-card-title">Form-10 (Frozen)</div>
            </a>
          </div>

          <div class="col-12 col-md-5 col-lg-4">
            <a href="form_10_tcl.php" class="nav-card">
              <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" fill="#ffee00" width="76px">
                <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
                <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
                <g id="SVGRepo_iconCarrier">
                  <path d="M20.3873 7.1575L11.9999 12L3.60913 7.14978" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                  <path d="M12 12V21" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                  <path d="M11 2.57735C11.6188 2.22008 12.3812 2.22008 13 2.57735L19.6603 6.42265C20.2791 6.77992 20.6603 7.44017 20.6603 8.1547V15.8453C20.6603 16.5598 20.2791 17.2201 19.6603 17.5774L13 21.4226C12.3812 21.7799 11.6188 21.7799 11 21.4226L4.33975 17.5774C3.72094 17.2201 3.33975 16.5598 3.33975 15.8453V8.1547C3.33975 7.44017 3.72094 6.77992 4.33975 6.42265L11 2.57735Z" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                  <path d="M8.5 4.5L16 9" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                </g>
              </svg>
              <div class="nav-card-title">Form-10 (TCL)</div>
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