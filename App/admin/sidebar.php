<div class="d-flex flex-column flex-shrink-0 p-1 text-white bg-secondary" style="width: 112%; height:109%;">
      <div class="text-center bg-light text-dark pt-3 pb-3">
        <b class="fs-4">Link Mark System</b>
        <br>
        <b class="text-warning">Version 1.0.0</b>
      </div>
    <hr>
    <p class=" h6 pb-2 text-center">
      <?php
      echo $_SESSION['username'];
      ?>
    </p>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item  rounded" style=" border: 2px solid black; ">
        <a href="../admin/" class="nav-link text-light" aria-current="page">
          <svg class="bi" width="16" height="16"><i class="bi bi-speedometer2"></i></svg>
          Home
        </a>
      </li>
      <li style=" border: 2px solid black; " class="rounded">
        <a href="#" class="nav-link text-white" data-bs-toggle="collapse" data-bs-target="#system-collapse" aria-expanded="false">
          <svg class="bi" width="16" height="16"><i class="bi bi-card-list"></i></svg>
          System >
        </a>
        <div class="collapse" id="system-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal ms-2">
            <li class="nav-item  rounded">
              <a href="manageaccounts.php" class="nav-link h text-light show" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-tags"></i></svg>
                - Manage Accounts
              </a>
            </li>
            <li class="nav-item  rounded">
              <a href="backupandrestore.php" class="nav-link h text-light show" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-tags"></i></svg>
                - Backup And Restore
              </a>
            </li>
          </ul>
        </div>
      </li>
      <li style=" border: 2px solid black; " class="rounded">
        <a href="#" class="nav-link text-white" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
          <svg class="bi" width="16" height="16"><i class="bi bi-card-list"></i></svg>
          Account >
        </a>
        <div class="collapse" id="account-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal">
            <li class="nav-item  rounded" style="cursor: not-allowed !important;">
              <a href="sales.php" class="nav-link h text-light show disabled"  aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-tags"></i></svg>
                - Sales
              </a>
            </li>
            <li class="nav-item  rounded">
              <a href="purchase.php" class="nav-link h text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - Purchase
              </a>
            </li>
            <li class="nav-item  rounded" style="cursor: not-allowed !important;">
              <a href="cashbook.php" class="nav-link  h text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - Cash Book
              </a>
            </li>
            <li class="nav-item  rounded">
              <a href="accountpayable.php" class="nav-link h text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - Account Payable
              </a>
            </li>
            <li class="nav-item  rounded" style="cursor: not-allowed !important;">
              <a href="accountreceivable.php" class="nav-link h text-light disabled" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - Account Receivable
              </a>
            </li>
          </ul>
        </div>
      </li>
      <li style=" border: 2px solid black; " class="rounded">
        <a href="#" class="nav-link text-white" data-bs-toggle="collapse" data-bs-target="#config-collapse" aria-expanded="false">
          <svg class="bi" width="16" height="16"><i class="bi bi-card-list"></i></svg>
          Configration >
        </a>
        <div class="collapse" id="config-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal ms-2">
            <li class="nav-item  rounded">
              <a href="customer.php" class="nav-link h text-light show" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-tags"></i></svg>
                - Customers
              </a>
            </li>
            <li class="nav-item  rounded">
              <a href="supplier.php" class="nav-link h suppliers text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - Suppliers
              </a>
            </li>
            <li class="nav-item  rounded">
              <a href="category.php" class="nav-link h text-light show" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-tags"></i></svg>
                - Category
              </a>
            </li>
            <li class="nav-item  rounded">
              <a href="item.php" class="nav-link h text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - Items
              </a>
            </li>
            <li class="nav-item  rounded" style="cursor: not-allowed !important;">
              <a href="unit.php" class="nav-link h text-light disabled" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - Unit
              </a>
            </li>
          </ul>
        </div>
      </li>
      <li style=" border: 2px solid black; " class="rounded">
        <a href="#" class="nav-link text-white" data-bs-toggle="collapse" data-bs-target="#production-collapse" aria-expanded="false">
          <svg class="bi" width="16" height="16"><i class="bi bi-card-list"></i></svg>
          Production >
        </a>
        <div class="collapse" id="production-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal ms-2">
            <li class="nav-item  rounded">
              <a href="coldstorecharges.php" class="nav-link h text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - Cold Store Charges
              </a>
            </li>
            <li class="nav-item  rounded">
              <a href="container.php" class="nav-link h text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - Container
              </a>
            </li>
            <li class="nav-item  rounded">
              <a href="packingmeterial.php" class="nav-link h text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - PM Cost
              </a>
            </li>
            <li class="nav-item rounded">
              <a href="stockcontrol.php" class="nav-link h text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - Stock Control
              </a>
            </li>
          </ul>
        </div>
      </li>
      <li style=" border: 2px solid black; " class="rounded">
        <a href="#" class="nav-link text-white report" data-bs-toggle="collapse" data-bs-target="#report-collapse" aria-expanded="false">
          <svg class="bi" width="16" height="16"><i class="bi bi-card-list"></i></svg>
          Reports >
        </a>
        <div class="collapse" id="report-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal ms-2">
            <li class="nav-item  rounded" style="cursor: not-allowed !important;">
              <a href="salereport.php" class="nav-link h text-light disabled" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - Sale Report
              </a>
            </li>
            <li class="nav-item  rounded">
              <a href="purchase_report.php" class="nav-link h text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - Purchase Report
              </a>
            </li>
          </ul>
        </div>
      </li>
      <li class="nav-item  rounded" style=" border: 2px solid black; ">
        <a href="logout.php" class="nav-link text-light" aria-current="page">
          <svg class="bi" width="16" height="16"><i class="bi bi-card-list"></i></svg>
          Logout
        </a>
      </li>
    </ul>
    <hr>
    <h5>Time:</h5>
    <div class="bg-light text-dark text-center pt-3 pb-3">
      <script type="text/javascript">
      setInterval(function() {
      var currentTime = new Date ( );
      var currentHours = currentTime.getHours ( );
      var currentMinutes = currentTime.getMinutes ( );
      var currentSeconds = currentTime.getSeconds ( );
      currentMinutes = ( currentMinutes < 10 ? "0" : "" ) + currentMinutes;
      currentSeconds = ( currentSeconds < 10 ? "0" : "" ) + currentSeconds;
      var timeOfDay = ( currentHours < 12 ) ? "AM" : "PM";
      currentHours = ( currentHours > 12 ) ? currentHours - 12 : currentHours;
      currentHours = ( currentHours == 0 ) ? 12 : currentHours;
      var currentTimeString = currentHours + ":" + currentMinutes + ":" + currentSeconds + " " + timeOfDay;
      document.getElementById("timer").innerHTML = currentTimeString;
      }, 100);
      </script>
      <div id="timer"></div>
    </div>
  </div>
