<?php
$permission = $query->select('permission', $_SESSION['role'], 'role_id');
$permissions = $permission['permission'];
 ?>
<div class="d-flex flex-column flex-shrink-0 p-1 text-white" style="width: 112%; height:100%; background-color:gray !important;">
      <div class="text-center bg-light text-dark pt-3 pb-3">
        <b class="fs-4 text-primary">Link Mark System</b>
        <br>
        <span class="text-success">Version 1.0.0</span>
      </div>
      <b class="text-center mt-3" style="margin-bottom: 12px; text-transform:uppercase;"><?php echo $_SESSION['username']; ?></b>
    <ul class="nav nav-pills flex-column">
      <li class="nav-item" style=" border-bottom: 2px solid black; ">
        <a href="../admin/" class="nav-link text-light" aria-current="page">
          <svg class="bi" width="16" height="16"><i class="bi bi-speedometer2"></i></svg>
          Home
        </a>
      </li>
      <?php
      if(str_contains($permissions, 'manage_accounts')== 1 || str_contains($permissions, 'manage_role') == 1){
      ?>
      <li style=" border-bottom: 2px solid black; " >
        <a href="#" class="nav-link text-white" data-bs-toggle="collapse" data-bs-target="#system-collapse" aria-expanded="false">
          <svg class="bi" width="16" height="16"><i class="bi bi-card-list"></i></svg>
          System >
        </a>
        <div class="collapse" id="system-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal ms-2">
            <?php
            if(str_contains($permissions, 'manage_accounts')){
              ?>
              <li class="nav-item">
                <a href="manageaccounts.php" class="nav-link h text-light show" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                  <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-tags"></i></svg>
                  - Manage Accounts
                </a>
              </li>
              <?php
            }
             ?>
             <?php
             if(str_contains($permissions, 'manage_role')){
               ?>
            <li class="nav-item">
              <a href="managerole.php" class="nav-link h text-light show" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-tags"></i></svg>
                - Manage Role
              </a>
            </li>
            <?php
            }
            ?>
            <?php
            if($_SESSION['role'] == 1){
              ?>
            <li class="nav-item">
              <a href="backupandrestore.php" class="nav-link h text-light show" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-tags"></i></svg>
                - Backup And Restore
              </a>
            </li>
            <?php
          }
           ?>
           <?php
           if($_SESSION['role'] == 1){
             ?>
           <li class="nav-item">
             <a href="userlog.php" class="nav-link h text-light show" aria-current="page" style="font-size:14px !important; font-weight:bold;">
               <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-tags"></i></svg>
               - User Log
             </a>
           </li>
           <?php
         }
          ?>
          </ul>
        </div>
      </li>
      <?php
      }
       ?>
      <?php
      if(str_contains($permissions, 'manage_sale') == 1 || str_contains($permissions, 'manage_purchase') == 1 ||str_contains($permissions, 'manage_cashbook') == 1 ||str_contains($permissions, 'manage_accountpayable') == 1 ||str_contains($permissions, 'manage_accountreceivable') == 1 ||str_contains($permissions, 'manage_general_ledger') == 1){
      ?>
      <li style=" border-bottom: 2px solid black; " >
        <a href="#" class="nav-link text-white" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
          <svg class="bi" width="16" height="16"><i class="bi bi-card-list"></i></svg>
          Account >
        </a>
        <div class="collapse" id="account-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal">
            <?php
            if(str_contains($permissions, 'manage_sale')){
              ?>
            <li class="nav-item" style="cursor: not-allowed !important;">
              <a href="sales.php" class="nav-link h text-light show disabled"  aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-tags"></i></svg>
                - Sales
              </a>
            </li>
            <?php
            }
            ?>
            <?php
            if(str_contains($permissions, 'manage_purchase')){
              ?>
            <li class="nav-item">
              <a href="purchase.php" class="nav-link h text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - Purchase
              </a>
            </li>
            <?php
            }
            ?>
            <?php
            if(str_contains($permissions, 'manage_cashbook')){
              ?>
            <li class="nav-item" style="cursor: not-allowed !important;">
              <a href="cashbook.php" class="nav-link  h text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - Cash Book
              </a>
            </li>
            <?php
            }
            ?>
            <?php
            if(str_contains($permissions, 'manage_accountpayable')){
              ?>
            <li class="nav-item">
              <a href="accountpayable.php" class="nav-link h text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - Account Payable
              </a>
            </li>
            <?php
            }
            ?>
            <?php
            if(str_contains($permissions, 'manage_accountreceivable')){
              ?>
            <li class="nav-item">
              <a href="accountreceivable.php" class="nav-link h text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - Account Receivable
              </a>
            </li>
            <?php
            }
            ?>
            <?php
            if(str_contains($permissions, 'manage_transaction')){
              ?>
            <li class="nav-item">
              <a href="transaction.php" class="nav-link h text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - Transaction
              </a>
            </li>
            <?php
            }
            ?>
            <?php
            if(str_contains($permissions, 'manage_general_ledger')){
              ?>
            <li class="nav-item">
              <a href="general_ledger.php" class="nav-link h text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - General Ledger
              </a>
            </li>
            <?php
            }
            ?>
          </ul>
        </div>
      </li>
      <?php
    }
       ?>

      <?php
      if(str_contains($permissions, 'manage_customer') == 1 || str_contains($permissions, 'manage_supplier') == 1 ||str_contains($permissions, 'manage_category') == 1 ||str_contains($permissions, 'manage_item') == 1 ||str_contains($permissions, 'manage_unit') == 1){
      ?>
      <li style=" border-bottom: 2px solid black; " >
        <a href="#" class="nav-link text-white" data-bs-toggle="collapse" data-bs-target="#config-collapse" aria-expanded="false">
          <svg class="bi" width="16" height="16"><i class="bi bi-card-list"></i></svg>
          Configration >
        </a>
        <div class="collapse" id="config-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal ms-2">
            <?php
            if(str_contains($permissions, 'manage_customer')){
              ?>
            <li class="nav-item">
              <a href="customer.php" class="nav-link h text-light show" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-tags"></i></svg>
                - Customers
              </a>
            </li>
            <?php
            }
            ?>
            <?php
            if(str_contains($permissions, 'manage_supplier')){
              ?>
            <li class="nav-item">
              <a href="supplier.php" class="nav-link h suppliers text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - Suppliers
              </a>
            </li>
            <?php
            }
            ?>
            <?php
            if(str_contains($permissions, 'manage_category')){
              ?>
            <li class="nav-item">
              <a href="category.php" class="nav-link h text-light show" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-tags"></i></svg>
                - Category
              </a>
            </li>
            <?php
            }
            ?>
            <?php
            if(str_contains($permissions, 'manage_item')){
              ?>
            <li class="nav-item">
              <a href="item.php" class="nav-link h text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - Items
              </a>
            </li>
            <?php
            }
            ?>
            <?php
            if(str_contains($permissions, 'actype')){
              ?>
            <li class="nav-item">
              <a href="actype.php" class="nav-link h text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - A/C Type
              </a>
            </li>
            <?php
            }
            ?>
            <?php
            if(str_contains($permissions, 'acname')){
              ?>
            <li class="nav-item">
              <a href="acname.php" class="nav-link h text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - A/C Name
              </a>
            </li>
            <?php
            }
            ?>
            <?php
            if(str_contains($permissions, 'manage_unit')){
              ?>
            <li class="nav-item" style="cursor: not-allowed !important;">
              <a href="unit.php" class="nav-link h text-light disabled" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - Unit
              </a>
            </li>
            <?php
            }
            ?>
          </ul>
        </div>
      </li>
      <?php
      }
      if(str_contains($permissions, 'manage_coldstorecharges') == 1){
       ?>
      <li style=" border-bottom: 2px solid black; " >
        <a href="#" class="nav-link text-white" data-bs-toggle="collapse" data-bs-target="#production-collapse" aria-expanded="false">
          <svg class="bi" width="16" height="16"><i class="bi bi-card-list"></i></svg>
          Production >
        </a>
        <div class="collapse" id="production-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal ms-2">
            <?php
            if(str_contains($permissions, 'manage_coldstorecharges')){
              ?>
            <li class="nav-item">
              <a href="coldstorecharges.php" class="nav-link h text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - Cold Store Charges
              </a>
            </li>
            <?php
            }
            ?>
            <!-- <li class="nav-item">
              <a href="container.php" class="nav-link h text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - Container
              </a>
            </li> -->
          </ul>
        </div>
      </li>
      <?php
      }
      if(str_contains($permissions, 'manage_form7') == 1 || str_contains($permissions, 'manage_form10') == 1 ||str_contains($permissions, 'hhkmcstock') == 1 ||str_contains($permissions, 'manage_gfcmcstock') == 1 ||str_contains($permissions, 'manage_stockreport') == 1){
       ?>
      <li style=" border-bottom: 2px solid black; " >
        <a href="#" class="nav-link text-white report" data-bs-toggle="collapse" data-bs-target="#stock-collapse" aria-expanded="false">
          <svg class="bi" width="16" height="16"><i class="bi bi-card-list"></i></svg>
          Stock Control >
        </a>
        <div class="collapse" id="stock-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal ms-2">
            <?php
            if(str_contains($permissions, 'manage_form7')){
              ?>
            <li class="nav-item">
              <a href="form_7.php" class="nav-link h text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - Form-7
              </a>
            </li>
            <?php
            }
            ?>
            <?php
            if(str_contains($permissions, 'manage_form10')){
              ?>
            <li class="nav-item">
              <a href="form_10.php" class="nav-link h text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - Form-10
              </a>
            </li>
            <?php
            }
            ?>
            <?php
            if(str_contains($permissions, 'manage_hhkmcstock')){
              ?>
            <li class="nav-item">
              <a href="hhkmcstock.php" class="nav-link h text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - HKK Mc Stock
              </a>
            </li>
            <?php
            }
            ?>
            <?php
            if(str_contains($permissions, 'manage_gfcmcstock')){
              ?>
            <li class="nav-item">
              <a href="gfcmcstock.php" class="nav-link h text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - GFC Mc Stock
              </a>
            </li>
            <?php
            }
            ?>
            <?php
            if(str_contains($permissions, ',')){
              ?>
            <li class="nav-item">
              <a href="tclmcstock.php" class="nav-link h text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - TCL Mc Stock
              </a>
            </li>
            <?php
            }
            ?>
            <?php
            if(str_contains($permissions, 'manage_stockreport')){
              ?>
            <li class="nav-item">
              <a href="stockreport.php" class="nav-link h text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - Stock Report
              </a>
            </li>
            <?php
            }
            ?>
          </ul>
        </div>
      </li>
      <?php
      }
      if(str_contains($permissions, 'manage_packingmaterial') == 1 || str_contains($permissions, 'manage_shippmentexport') == 1){
       ?>
      <li style=" border-bottom: 2px solid black; " >
        <a href="#" class="nav-link text-white report" data-bs-toggle="collapse" data-bs-target="#logestic-collapse" aria-expanded="false">
          <svg class="bi" width="16" height="16"><i class="bi bi-card-list"></i></svg>
          Logestic >
        </a>
        <div class="collapse" id="logestic-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal ms-2">
            <?php
            if(str_contains($permissions, 'manage_shippmentexport')){
              ?>
            <li class="nav-item">
              <a href="packing_stock.php" class="nav-link h text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - Shippment Export
              </a>
            </li>
            <?php
            }
            ?>
            <?php
            if(str_contains($permissions, 'manage_truckexport')){
              ?>
            <li class="nav-item">
              <a href="truck_packing_stock.php" class="nav-link h text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - Truck Export
              </a>
            </li>
            <?php
            }
            ?>
            <?php
            if(str_contains($permissions, 'manage_packingmaterial')){
              ?>
            <li class="nav-item">
              <a href="packingmeterial.php" class="nav-link h text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - Packing Material
              </a>
            </li>
            <?php
            }
            ?>
          </ul>
        </div>
      </li>
      <?php
      }
      if(str_contains($permissions, 'sale_report') == 1 || str_contains($permissions, 'purchase_report') == 1){
       ?>
      <li style=" border-bottom: 2px solid black; " >
        <a href="#" class="nav-link text-white report" data-bs-toggle="collapse" data-bs-target="#report-collapse" aria-expanded="false">
          <svg class="bi" width="16" height="16"><i class="bi bi-card-list"></i></svg>
          Reports >
        </a>
        <div class="collapse" id="report-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal ms-2">
            <?php
            if(str_contains($permissions, 'sale_report')){
              ?>
            <li class="nav-item" style="cursor: not-allowed !important;">
              <a href="salereport.php" class="nav-link h text-light disabled" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - Sale Report
              </a>
            </li>
            <?php
            }
            ?>
            <?php
            if(str_contains($permissions, 'purchase_report')){
              ?>
            <li class="nav-item">
              <a href="purchase_report.php" class="nav-link h text-light" aria-current="page" style="font-size:14px !important; font-weight:bold;">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - Purchase Report
              </a>
            </li>
            <?php
            }
            ?>
          </ul>
        </div>
      </li>
      <?php
    }

       ?>
      <li class="nav-item" style=" border-bottom: 2px solid black; ">
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
