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

    if(isset($_POST['adddryfishcharges'])){
      $date = $_POST['date'];
      $ite = $_POST['ite'];
      $kg = $_POST['kg'];
      $drycoldstorerate = $_POST['drycoldstorerate'];
      $labourrate = $_POST['labourrate'];
      $damagekg = $_POST['damagekg'];
      $query->adddryfishcharges($date, $ite, $kg, $drycoldstorerate, $labourrate, $damagekg);
    }

    if(isset($_POST['addrepackingoutbtn'])){
      $date = $_POST['date'];
      $outkg = $_POST['outkg'];
      $rate = $_POST['rate'];

      $query->addrepackingout($date, $outkg, $rate);
    }

    if(isset($_POST['addtotalbtn'])){
      $date = $_POST['date'];
      $plugoncharges = $_POST['plugoncharges'];
      $payment_date = $_POST['payment_date'];
      $payment_amount = $_POST['payment_amount'];

      $query->addtotal($date, $plugoncharges, $payment_date, $payment_amount);
    }

    if(isset($_POST['addpaymentbtn'])){
      $payment_date = $_POST['payment_date'];
      $payment_amount = $_POST['payment_amount'];
      $id = $_POST['id'];
      $query->addpayment($payment_date, $payment_amount, $id);
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
          <div class="card-header bg-info text-light">
            <h4 class="d-inline">Monthly Cold Store Charges</h4>
            <button type="submit" class="btn btn-success float-end addfishcharges" data-bs-toggle="modal" data-bs-target="#addfishcharges">Add Fish Charges</button>
            <button type="submit" class="btn btn-success float-end hide adddryfishcharges" data-bs-toggle="modal" data-bs-target="#adddryfishcharges">Add Dry Fish Charges</button>
            <button type="submit" class="btn btn-success float-end hide addrepackingout" data-bs-toggle="modal" data-bs-target="#addrepackingout">Add Repacking Out</button>
            <button type="submit" class="btn btn-success float-end hide addtotal" data-bs-toggle="modal" data-bs-target="#addtotal">Add Total Balance</button>
          </div>
          <div class="card-body">
            <div class="text-center">
              <button class="pb-2 pt-2 ps-4 pe-4 text-dark fishcoldstorelink" style="text-decoration:none; border:none;" onclick="showfishcoldstore()">Fish C-S</button>
              <button class="pb-2 pt-2 ps-4 pe-4 text-dark fishlabourlink" style="text-decoration:none; border:none;" onclick="showfishlabour()">Fish L-B</button>
              <button class="pb-2 pt-2 ps-4 pe-4 text-dark dryfishcoldstorelink" style="text-decoration:none; border:none;" onclick="showdryfishcoldstore()">Dry Fish C-S</button>
              <button class="pb-2 pt-2 ps-4 pe-4 text-dark dryfishlabourlink" style="text-decoration:none; border:none;" onclick="showdryfishlabour()">Dry Fish L-B</button>
              <button class="pb-2 pt-2 ps-4 pe-4 text-dark repackingoutlink" style="text-decoration:none; border:none;" onclick="showrepackingout()">RP Out</button>
              <button class="pb-2 pt-2 ps-4 pe-4 text-dark totalamountlink" style="text-decoration:none; border:none;" onclick="showtotal()">Total Amount Balance</button>
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
                $fishcoldstoredatas = $query->selectall('gfcfishcoldstore');
                foreach ($fishcoldstoredatas as $fishcoldstoredata) {
                 ?>
                <tr>
                  <td><?php echo $fishcoldstoredata['id']; ?></td>
                  <td><?php echo date('d-m-Y', strtotime($fishcoldstoredata['date'])); ?></td>
                  <td><?php echo $fishcoldstoredata['ite']; ?></td>
                  <td><?php if($fishcoldstoredata['mc'] == '0'){ echo "";}else{ echo $fishcoldstoredata['mc']; }; ?></td>
                  <td><?php echo $fishcoldstoredata['total_mc']; ?></td>
                  <td><?php echo $fishcoldstoredata['kg']; ?></td>
                  <td><?php echo $fishcoldstoredata['total_kg']; ?></td>
                  <td><?php echo $fishcoldstoredata['rate']; ?></td>
                  <td><?php if ($fishcoldstoredata['charges'] == '0'){echo "";}else{ echo $fishcoldstoredata['charges'];}; ?></td>
                  <td><?php if ($fishcoldstoredata['total_charges'] == '0'){echo "";}else{ echo $fishcoldstoredata['total_charges'];}; ?></td>
                </tr>
                <?php
                }
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
                <?php
                $fishlabourdatas = $query->selectall("gfcfishlabour");
                foreach ($fishlabourdatas as $fishlabourdata) {
                 ?>
                <tr>
                  <td><?php echo $fishlabourdata['id']; ?></td>
                  <td><?php echo date('d-m-Y', strtotime($fishlabourdata['date'])); ?></td>
                  <td><?php echo $fishlabourdata['ite']; ?></td>
                  <td><?php echo $fishlabourdata['kg']; ?></td>
                  <td><?php echo $fishlabourdata['rate']; ?></td>
                  <td><?php echo $fishlabourdata['charges']; ?></td>
                  <td><?php echo $fishlabourdata['total_charges']; ?></td>
                </tr>
                <?php
                }
                 ?>
              </table>
            </div>
            <div class="dryfishcoldstore hide">
              <table class="table table-striped table-bordered table-hover">
                <tr>
                  <th class="text-center">Id</th>
                  <th class="text-center">Date</th>
                  <th class="text-center">I.T.E</th>
                  <th class="text-center">Kg</th>
                  <th class="text-center">Total Kg</th>
                  <th class="text-center">Rate</th>
                  <th class="text-center">Charges</th>
                  <th class="text-center">Total Charges</th>
                </tr>
                <?php
                $dryfishcoldstoredatas = $query->selectall("gfcdryfishcoldstore");
                foreach ($dryfishcoldstoredatas as $dryfishcoldstoredata) {
                 ?>
                <tr>
                  <td><?php echo $dryfishcoldstoredata['id']; ?></td>
                  <td><?php echo date('d-m-Y', strtotime($dryfishcoldstoredata['date'])); ?></td>
                  <td><?php echo $dryfishcoldstoredata['ite']; ?></td>
                  <td><?php echo $dryfishcoldstoredata['kg']; ?></td>
                  <td><?php echo $dryfishcoldstoredata['total_kg']; ?></td>
                  <td><?php echo $dryfishcoldstoredata['rate']; ?></td>
                  <td><?php echo $dryfishcoldstoredata['charges']; ?></td>
                  <td><?php echo $dryfishcoldstoredata['total_charges']; ?></td>
                </tr>
                <?php
                }
                 ?>
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
                <?php
                $dryfishlabourdatas = $query->selectall("gfcdryfishlabour");
                foreach ($dryfishlabourdatas as $dryfishlabourdata) {
                 ?>
                <tr>
                  <td><?php echo $dryfishlabourdata['id']; ?></td>
                  <td><?php echo date('d-m-Y', strtotime($dryfishlabourdata['date'])); ?></td>
                  <td><?php echo $dryfishlabourdata['ite']; ?></td>
                  <td><?php echo $dryfishlabourdata['kg']; ?></td>
                  <td><?php echo $dryfishlabourdata['rate']; ?></td>
                  <td><?php echo $dryfishlabourdata['charges']; ?></td>
                  <td><?php echo $dryfishlabourdata['total_charges']; ?></td>
                </tr>
                <?php
                }
                 ?>
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
                <?php
                $repackingoutdatas = $query->selectall('repackingout');
                foreach ($repackingoutdatas as $repackingoutdata) {
                 ?>
                <tr>
                  <td><?php echo $repackingoutdata['id']; ?></td>
                  <td><?php echo date('d-m-Y', strtotime($repackingoutdata['date'])); ?></td>
                  <td><?php echo $repackingoutdata['outkg']; ?></td>
                  <td><?php echo $repackingoutdata['rate']; ?></td>
                  <td><?php echo $repackingoutdata['charges']; ?></td>
                  <td><?php echo $repackingoutdata['total_charges']; ?></td>
                </tr>
                <?php
                }
                 ?>
              </table>
            </div>
            <div class="totalamount hide">
              <table class="table table-striped table-bordered table-hover">
                <tr>
                  <th style="font-size:13px; padding-top: 17px;" class="text-center">Id</th>
                  <th style="font-size:13px; padding-top: 17px;" class="text-center">Date</th>
                  <th style="font-size:13px;" class="text-center">Total Cold Store Charges</th>
                  <th style="font-size:13px;" class="text-center">Total Labour Charges</th>
                  <th style="font-size:13px;" class="text-center">Total Repacking Charges</th>
                  <th style="font-size:13px;" class="text-center">Total Dry Fish CS Charges</th>
                  <th style="font-size:13px;" class="text-center">Total Dry FIsh LB Charges</th>
                  <th style="font-size:13px;" class="text-center">Plug On Charges</th>
                  <th style="font-size:13px;" class="text-center">Total Charges</th>
                  <th style="font-size:13px;" class="text-center">Payment Date</th>
                  <th style="font-size:13px;" class="text-center">Payment Amount</th>
                  <th style="font-size:13px;" class="text-center">Balance Amount</th>
                </tr>
                <?php
                $totaldatas = $query->selectall('gfctotal');
                foreach ($totaldatas as $totaldata) {
                  ?>
                  <tr data-bs-toggle="modal" data-bs-target="#addpayment<?php echo $totaldata['id']; ?>">
                    <td style="font-size:13px;"><?php if($totaldata['date'] != '0000-00-00'){echo $totaldata['id'];} ?></td>
                    <td style="font-size:13px;"><?php if($totaldata['date'] != '0000-00-00'){echo date('d-m-Y', strtotime($totaldata['date']));} ?></td>
                    <td style="font-size:13px;"><?php if($totaldata['totalfishcoldstorecharges'] != '0'){echo $totaldata['totalfishcoldstorecharges'];} ?></td>
                    <td style="font-size:13px;"><?php if($totaldata['totalfishlabourcharges'] != '0'){echo $totaldata['totalfishlabourcharges'];} ?></td>
                    <td style="font-size:13px;"><?php if($totaldata['totalrepackingcharges'] != '0'){echo $totaldata['totalrepackingcharges'];} ?></td>
                    <td style="font-size:13px;"><?php if($totaldata['totaldryfishcoldstorecharges'] != '0'){echo $totaldata['totaldryfishcoldstorecharges'];} ?></td>
                    <td style="font-size:13px;"><?php if($totaldata['totaldryfishlabourcharges'] != '0'){echo $totaldata['totaldryfishlabourcharges'];} ?></td>
                    <td style="font-size:13px;"><?php if($totaldata['plugoncharges'] != '0'){echo $totaldata['plugoncharges'];} ?></td>
                    <td style="font-size:13px;"><?php if($totaldata['total_charges'] != '0'){echo $totaldata['total_charges'];} ?></td>
                    <td style="font-size:13px;"><?php if($totaldata['payment_date'] != "0000-00-00"){ echo date('d-m-Y', strtotime($totaldata['payment_date'])); }; ?></td>
                    <td style="font-size:13px;"><?php if($totaldata['payment_amount'] != "0"){ echo $totaldata['payment_amount']; }; ?></td>
                    <td style="font-size:13px;"><?php echo $totaldata['balance_amount']; ?></td>
                  </tr>
                <?php
                include 'updatemodals.php';
                }
                 ?>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    <?php
    include 'addmodals.php';
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
