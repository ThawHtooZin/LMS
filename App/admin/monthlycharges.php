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
  <style media="screen">
    .hide{
      display:none;
    }
    .color{
      border-radius: 5px;
      background-color:grey;
      color:white !important;
    }
  </style>
  <body>
    <?php
    if(isset($_POST['add'])){
      $indate = $_POST['indate'];
      $outdate = $_POST['outdate'];
      $mc = $_POST['mc'];
      $kg = $_POST['kg'];
      $coldstorerate = $_POST['coldstorerate'];
      $labourrate = $_POST['labourrate'];
      $processingrate = $_POST['processingrate'];
      $query->addcoldstore($indate, $outdate, $mc, $kg, $coldstorerate, $labourrate, $processingrate);
    }

    if(isset($_POST['addfishcharges'])){
      $date = $_POST['date'];
      $ite = $_POST['ite'];
      $mc = $_POST['mc'];
      $kg = $_POST['kg'];
      $coldstorerate = $_POST['coldstorerate'];
      $labourrate = $_POST['labourrate'];
      $damagekg = $_POST['damagekg'];
      $query->addfishcharges($date, $ite, $mc, $kg, $coldstorerate, $labourrate, $damagekg);
    }

    if(isset($_POST['update'])){
      $indate = $_POST['indate'];
      $outdate = $_POST['outdate'];
      $mc = $_POST['mc'];
      $kg = $_POST['kg'];
      $coldstorerate = $_POST['coldstorerate'];
      $labourrate = $_POST['labourrate'];
      $processingrate = $_POST['processingrate'];
      $updateid = $_POST['updateid'];
      $query->updatecoldstore($indate, $outdate, $mc, $kg, $coldstorerate, $labourrate, $processingrate, $updateid);
    }

     ?>
    <div class="row">
      <div class="col-2">
        <?php
        include 'sidebar.php';
        ?>
      </div>
      <div class="col-10">
        <div class="card">
          <div class="card-header bg-warning text-light">
            <h4 class="d-inline">Monthly Cold Store Charges</h4>
            <button type="submit" class="btn btn-success float-end addfishcharges" data-bs-toggle="modal" data-bs-target="#addfishcharges">Add Fish Charges</button>
            <button type="submit" class="btn btn-success float-end hide adddryfishcharges" data-bs-toggle="modal" data-bs-target="#adddryfishcharges">Add Dry Fish Charges</button>
            <button type="submit" class="btn btn-success float-end hide addrepackingout" data-bs-toggle="modal" data-bs-target="#addrepackingout">Add Repacking Out</button>
            <button type="submit" class="btn btn-success float-end hide addtotal" data-bs-toggle="modal" data-bs-target="#addtotal">Add Total Balance</button>
          </div>
          <div class="card-body">
            <div class="text-center">
              <button class="pb-2 pt-2 ps-5 pe-5 text-dark fishcoldstorelink" style="text-decoration:none; border:none;" onclick="showfishcoldstore()">Fish C-S</button>
              <button class="pb-2 pt-2 ps-5 pe-5 text-dark fishlabourlink" style="text-decoration:none; border:none;" onclick="showfishlabour()">Fish L-B</button>
              <button class="pb-2 pt-2 ps-5 pe-5 text-dark dryfishcoldstorelink" style="text-decoration:none; border:none;" onclick="showdryfishcoldstore()">Dry Fish C-S</button>
              <button class="pb-2 pt-2 ps-5 pe-5 text-dark dryfishlabourlink" style="text-decoration:none; border:none;" onclick="showdryfishlabour()">Dry Fish L-B</button>
              <button class="pb-2 pt-2 ps-5 pe-5 text-dark repackingoutlink" style="text-decoration:none; border:none;" onclick="showrepackingout()">RP Out</button>
              <button class="pb-2 pt-2 ps-5 pe-5 text-dark totalamountlink" style="text-decoration:none; border:none;" onclick="showtotal()">Total Amount Balance</button>
            </div>
            <hr>
            <div class="fishcoldstore hide">
              <table class="table table-striped table-bordered table-hover">
                <tr>
                  <th class="text-center">Id</th>
                  <th class="text-center">Date</th>
                  <th class="text-center">I.T.E</th>
                  <th class="text-center">Mc</th>
                  <th class="text-center">Total Mc</th>
                  <th class="text-center">Kg</th>
                  <th class="text-center">Total Kg</th>
                  <th class="text-center">Rate</th>
                  <th class="text-center">Charges</th>
                  <th class="text-center">Total Charges</th>
                </tr>
                <?php
                // foreach ($fishcoldstoredatas as $fishcoldstoredata) {
                 ?>
                <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
                <?php
                // }
                 ?>
              </table>
            </div>
            <div class="fishlabour hide">
              <table class="table table-striped table-bordered table-hover">
                <tr>
                  <th class="text-center">Id</th>
                  <th class="text-center">Date</th>
                  <th class="text-center">I.T.E</th>
                  <th class="text-center">Kg</th>
                  <th class="text-center">Rate</th>
                  <th class="text-center">Charges</th>
                  <th class="text-center">Total Charges</th>
                </tr>
                <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
              </table>
            </div>
            <div class="dryfishcoldstore hide">
              <table class="table table-striped table-bordered table-hover">
                <tr>
                  <th class="text-center">Id</th>
                  <th class="text-center">Date</th>
                  <th class="text-center">Kg</th>
                  <th class="text-center">Total Kg</th>
                  <th class="text-center">Rate</th>
                  <th class="text-center">Charges</th>
                  <th class="text-center">Total Charges</th>
                </tr>
                <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
              </table>
            </div>
            <div class="dryfishlabour hide">
              <table class="table table-striped table-bordered table-hover">
                <tr>
                  <th class="text-center">Id</th>
                  <th class="text-center">Date</th>
                  <th class="text-center">I.T.E</th>
                  <th class="text-center">Kg</th>
                  <th class="text-center">Rate</th>
                  <th class="text-center">Charges</th>
                  <th class="text-center">Total Charges</th>
                </tr>
                <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
              </table>
            </div>
            <div class="repackingout hide">
              <table class="table table-striped table-bordered table-hover">
                <tr>
                  <th class="text-center">Id</th>
                  <th class="text-center">Date</th>
                  <th class="text-center">Out Kg</th>
                  <th class="text-center">Rate</th>
                  <th class="text-center">Charges</th>
                  <th class="text-center">Total Charges</th>
                </tr>
                <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
              </table>
            </div>
            <div class="totalamount hide">
              <table class="table table-striped table-bordered table-hover">
                <tr>
                  <th style="font-size:11px;" class="text-center">Id</th>
                  <th style="font-size:11px;" class="text-center">Date</th>
                  <th style="font-size:11px;" class="text-center">Total Cold Store Charges</th>
                  <th style="font-size:11px;" class="text-center">Total Labour Charges</th>
                  <th style="font-size:11px;" class="text-center">Total Repacking Charges</th>
                  <th style="font-size:11px;" class="text-center">Total Dry Fish CS Charges</th>
                  <th style="font-size:11px;" class="text-center">Total Dry FIsh LB Charges</th>
                  <th style="font-size:11px;" class="text-center">Total Charges</th>
                  <th style="font-size:11px;" class="text-center">Plugon Charges</th>
                  <th style="font-size:11px;" class="text-center">Total Charges</th>
                  <th style="font-size:11px;" class="text-center">Payment Date</th>
                  <th style="font-size:11px;" class="text-center">Payment Amount</th>
                  <th style="font-size:11px;" class="text-center">Balance Amount</th>
                </tr>
                <tr>
                  <td style="font-size:13px;">asdfasdf</td>
                  <td style="font-size:13px;">asdfasdf</td>
                  <td style="font-size:13px;">asdfasdf</td>
                  <td style="font-size:13px;">asdfasdf</td>
                  <td style="font-size:13px;">asdfasdf</td>
                  <td style="font-size:13px;">asdfasdf</td>
                  <td style="font-size:13px;">asdfasdf</td>
                  <td style="font-size:13px;">asdfasdf</td>
                  <td style="font-size:13px;">asdfasdf</td>
                  <td style="font-size:13px;">asdfasdf</td>
                  <td style="font-size:13px;">asdfasdf</td>
                  <td style="font-size:13px;">asdfasdf</td>
                  <td style="font-size:13px;">asdfasdf</td>
                </tr>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    <?php
    include 'modals.php';
     ?>
    <script type="text/javascript">
    showfishcoldstore();
    function showfishcoldstore(){
      document.querySelector(".fishcoldstore").classList.remove('hide');
      document.querySelector(".fishcoldstorelink").classList.add('color');
      document.querySelector(".fishlabour").classList.add('hide');
      document.querySelector(".fishlabourlink").classList.remove('color');
      document.querySelector(".dryfishcoldstore").classList.add('hide');
      document.querySelector(".dryfishcoldstorelink").classList.remove('color');
      document.querySelector(".dryfishlabour").classList.add('hide');
      document.querySelector(".dryfishlabourlink").classList.remove('color');
      document.querySelector(".repackingout").classList.add('hide');
      document.querySelector(".repackingoutlink").classList.remove('color');
      document.querySelector(".totalamount").classList.add('hide');
      document.querySelector(".totalamountlink").classList.remove('color');
      document.querySelector(".addfishcharges").classList.remove('hide');
      document.querySelector(".adddryfishcharges").classList.add('hide');
      document.querySelector(".addrepackingout").classList.add('hide');
      document.querySelector(".addtotal").classList.add('hide');

    }
    function showfishlabour(){
      document.querySelector(".fishlabour").classList.remove('hide');
      document.querySelector(".fishlabourlink").classList.add('color');
      document.querySelector(".fishcoldstore").classList.add('hide');
      document.querySelector(".fishcoldstorelink").classList.remove('color');
      document.querySelector(".dryfishcoldstore").classList.add('hide');
      document.querySelector(".dryfishcoldstorelink").classList.remove('color');
      document.querySelector(".dryfishlabour").classList.add('hide');
      document.querySelector(".dryfishlabourlink").classList.remove('color');
      document.querySelector(".repackingout").classList.add('hide');
      document.querySelector(".repackingoutlink").classList.remove('color');
      document.querySelector(".totalamount").classList.add('hide');
      document.querySelector(".totalamountlink").classList.remove('color');
      document.querySelector(".addfishcharges").classList.remove('hide');
      document.querySelector(".adddryfishcharges").classList.add('hide');
      document.querySelector(".addrepackingout").classList.add('hide');
      document.querySelector(".addtotal").classList.add('hide');
    }
    function showdryfishcoldstore(){
      document.querySelector(".dryfishcoldstore").classList.remove('hide');
      document.querySelector(".dryfishcoldstorelink").classList.add('color');
      document.querySelector(".fishcoldstore").classList.add('hide');
      document.querySelector(".fishcoldstorelink").classList.remove('color');
      document.querySelector(".fishlabour").classList.add('hide');
      document.querySelector(".fishlabourlink").classList.remove('color');
      document.querySelector(".dryfishlabour").classList.add('hide');
      document.querySelector(".dryfishlabourlink").classList.remove('color');
      document.querySelector(".repackingout").classList.add('hide');
      document.querySelector(".repackingoutlink").classList.remove('color');
      document.querySelector(".totalamount").classList.add('hide');
      document.querySelector(".totalamountlink").classList.remove('color');
      document.querySelector(".addfishcharges").classList.add('hide');
      document.querySelector(".adddryfishcharges").classList.remove('hide');
      document.querySelector(".addrepackingout").classList.add('hide');
      document.querySelector(".addtotal").classList.add('hide');
    }
    function showdryfishlabour(){
      document.querySelector(".dryfishlabour").classList.remove('hide');
      document.querySelector(".dryfishlabourlink").classList.add('color');
      document.querySelector(".fishcoldstore").classList.add('hide');
      document.querySelector(".fishcoldstorelink").classList.remove('color');
      document.querySelector(".fishlabour").classList.add('hide');
      document.querySelector(".fishlabourlink").classList.remove('color');
      document.querySelector(".dryfishcoldstore").classList.add('hide');
      document.querySelector(".dryfishcoldstorelink").classList.remove('color');
      document.querySelector(".repackingout").classList.add('hide');
      document.querySelector(".repackingoutlink").classList.remove('color');
      document.querySelector(".totalamount").classList.add('hide');
      document.querySelector(".totalamountlink").classList.remove('color');
      document.querySelector(".addfishcharges").classList.add('hide');
      document.querySelector(".adddryfishcharges").classList.remove('hide');
      document.querySelector(".addrepackingout").classList.add('hide');
      document.querySelector(".addtotal").classList.add('hide');
    }
    function showrepackingout(){
      document.querySelector(".repackingout").classList.remove('hide');
      document.querySelector(".repackingoutlink").classList.add('color');
      document.querySelector(".fishcoldstore").classList.add('hide');
      document.querySelector(".fishcoldstorelink").classList.remove('color');
      document.querySelector(".fishlabour").classList.add('hide');
      document.querySelector(".fishlabourlink").classList.remove('color');
      document.querySelector(".dryfishcoldstore").classList.add('hide');
      document.querySelector(".dryfishcoldstorelink").classList.remove('color');
      document.querySelector(".dryfishlabour").classList.add('hide');
      document.querySelector(".dryfishlabourlink").classList.remove('color');
      document.querySelector(".totalamount").classList.add('hide');
      document.querySelector(".totalamountlink").classList.remove('color');
      document.querySelector(".addfishcharges").classList.add('hide');
      document.querySelector(".adddryfishcharges").classList.add('hide');
      document.querySelector(".addrepackingout").classList.remove('hide');
      document.querySelector(".addtotal").classList.add('hide');
    }
    function showtotal(){
      document.querySelector(".totalamount").classList.remove('hide');
      document.querySelector(".totalamountlink").classList.add('color');
      document.querySelector(".fishcoldstore").classList.add('hide');
      document.querySelector(".fishcoldstorelink").classList.remove('color');
      document.querySelector(".fishlabour").classList.add('hide');
      document.querySelector(".fishlabourlink").classList.remove('color');
      document.querySelector(".dryfishcoldstore").classList.add('hide');
      document.querySelector(".dryfishcoldstorelink").classList.remove('color');
      document.querySelector(".dryfishlabour").classList.add('hide');
      document.querySelector(".dryfishlabourlink").classList.remove('color');
      document.querySelector(".repackingout").classList.add('hide');
      document.querySelector(".repackingoutlink").classList.remove('color');
      document.querySelector(".addfishcharges").classList.add('hide');
      document.querySelector(".adddryfishcharges").classList.add('hide');
      document.querySelector(".addrepackingout").classList.add('hide');
      document.querySelector(".addtotal").classList.remove('hide');
    }
    </script>
    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
