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
    if(isset($_POST['addfishcharges'])){
      $date = $_POST['date'];
      $ite = $_POST['ite'];
      $mc = $_POST['mc'];
      $kg = $_POST['kg'];
      $coldstorerate = $_POST['coldstorerate'];
      $labourrate = $_POST['labourrate'];
      $inkg = $_POST['inkg'];
      $outkg = $_POST['outkg'];
      $query->addfishcharges($date, $ite, $mc, $kg, $coldstorerate, $labourrate, $inkg, $outkg);
    }

    if(isset($_POST['adddryfishcharges'])){
      $date = $_POST['date'];
      $ite = $_POST['ite'];
      $kg = $_POST['kg'];
      $drycoldstorerate = $_POST['drycoldstorerate'];
      $labourrate = $_POST['labourrate'];
      $outkg = $_POST['outkg'];
      $query->adddryfishcharges($date, $ite, $kg, $drycoldstorerate, $labourrate, $outkg);
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
      // $payment_date = $_POST['payment_date'];
      // $payment_amount = $_POST['payment_amount'];

      $query->addtotal($date, $plugoncharges);
    }

    if(isset($_POST['addpaymentbtn'])){
      $payment_date = $_POST['payment_date'];
      $payment_amount = $_POST['payment_amount'];
      $id = $_POST['id'];
      $query->addpayment($payment_date, $payment_amount, $id);
    }

    if (isset($_POST['addopeningamountbtn'])) {
      $openingamount = $_POST['openingamount'];

      $query->addopeningamount($openingamount);
    }

    // Remark Adding Query
    if(isset($_POST['remarkfishcoldstorebtn'])){
      $updateid = $_POST['fishcoldstoreid'];
      $remarkfishcoldstore = $_POST['remarkfishcoldstore'];

      $query->addremarkmonthly('gfcfishcoldstore', $remarkfishcoldstore, $updateid);
    }

    if(isset($_POST['remarkfishlabourbtn'])){
      $updateid = $_POST['fishlabourid'];
      $remarkfishlabour = $_POST['remarkfishlabour'];

      $query->addremarkmonthly('gfcfishlabour', $remarkfishlabour, $updateid);
    }

    if(isset($_POST['remarkdryfishcoldstorebtn'])){
      $updateid = $_POST['dryfishcoldstoreid'];
      $remarkdryfishcoldstore = $_POST['remarkdryfishcoldstore'];

      $query->addremarkmonthly('gfcdryfishcoldstore', $remarkdryfishcoldstore, $updateid);
    }

    if(isset($_POST['remarkdryfishlabourbtn'])){
      $updateid = $_POST['dryfishlabourid'];
      $remarkdryfishlabour = $_POST['remarkdryfishlabour'];

      $query->addremarkmonthly('gfcdryfishlabour', $remarkdryfishlabour, $updateid);
    }

    if (isset($_POST['updatefishcoldstorebtn'])) {
      $newdate = $_POST['updatefishcoldstore'];
      $upite = $_POST['upfishite'];
      $upmc = $_POST['upmcfishcoldstore'];
      $upkg = $_POST['upkgfishcoldstore'];
      $upcoldstorerate = $_POST['upratefishcoldstore'];
      $uplabourrate = $_POST['upratefishlabour'];
      $upid = $_POST['upfishcoldstoreid'];

      $query->updatefishcoldstore($newdate, $upite, $upmc, $upkg, $upcoldstorerate, $uplabourrate, $upid);
    }

    if (isset($_POST['updatedryfishcoldstorebtn'])) {
      $newdate = $_POST['updatedryfishcoldstore'];
      $upite = $_POST['updryfishite'];
      $upkg = $_POST['upkgdryfishcoldstore'];
      $upcoldstorerate = $_POST['upratedryfishcoldstore'];
      $uplabourrate = $_POST['upratedryfishlabour'];
      $upid = $_POST['updryfishcoldstoreid'];

      $query->updatedryfishcoldstore($newdate, $upite, $upkg, $upcoldstorerate, $uplabourrate, $upid);
    }

    if(isset($_POST['deletefishbtn'])){
      $deletedate = $_POST['deletedatefish'];
      $query->deletefish($deletedate);
    }

    if(isset($_POST['deletedryfishbtn'])){
      $deletedate = $_POST['deletedatedryfish'];
      $query->deletedryfish($deletedate);
    }
     ?>
    <div class="row">
      <div class="sidebarcol" id="sidebar">
        <?php
        include 'sidebar.php';
        ?>
      </div>
      <?php
      if(isset($_POST['fishcoldstore'])){
        $_SESSION['tabs'] = "fishcoldstore";
      }elseif(isset($_POST['fishlabour'])){
        $_SESSION['tabs'] = "fishlabour";
      }elseif(isset($_POST['dryfishcoldstoer'])){
        $_SESSION['tabs'] = "dryfishcoldstoer";
      }elseif(isset($_POST['dryfishlabour'])){
        $_SESSION['tabs'] = "dryfishlabour";
      }elseif(isset($_POST['repackingout'])){
        $_SESSION['tabs'] = "repackingout";
      }elseif(isset($_POST['totalamountbalance'])){
        $_SESSION['tabs'] = "totalamountbalance";
      }
       ?>
      <div class="contentcol" id="content">
        <?php require 'navbar.php'; ?>
        <div class="card">
          <div class="card-header bg-info text-light">

            <h4 class="d-inline">Monthly Cold Store Charges</h4>
            <button type="submit" class="btn btn-success float-end addfishcharges" data-bs-toggle="modal" data-bs-target="#addfishcharges" name="fishcoldstorebtn">Add Fish Charges</button>
            <button type="submit" class="btn btn-success float-end hide adddryfishcharges" data-bs-toggle="modal" data-bs-target="#adddryfishcharges" name="dryfishcoldstorebtn">Add Dry Fish Charges</button>
            <button type="submit" class="btn btn-success float-end hide addrepackingout" data-bs-toggle="modal" data-bs-target="#addrepackingout" name="repackingbtn">Add Repacking Out</button>
            <button type="submit" class="btn btn-secondary ms-2 float-end hide addopening" data-bs-toggle="modal" data-bs-target="#addopening" name="addopening">Add Opening Balance</button>
            <button type="submit" class="btn btn-success float-end hide addtotal ms-2" data-bs-toggle="modal" data-bs-target="#addtotal" name="addtotalbtn">Add Total Amount</button>
            <a href="export.php?table_name=monthlycharges" class="btn btn-success text-light export float-end">Export to Excel</a>
          </div>
          <div class="card-body">
            <div class="text-center">
              <form class="" action="" method="post">
                <button type="submit" class="pb-2 pt-2 ps-4 pe-4 text-dark fishcoldstorelink" style="text-decoration:none; border:none;" name="fishcoldstore">Fish C-S</button>
                <button type="submit" class="pb-2 pt-2 ps-4 pe-4 text-dark fishlabourlink" style="text-decoration:none; border:none;" name="fishlabour">Fish L-B</button>
                <button type="submit" class="pb-2 pt-2 ps-4 pe-4 text-dark dryfishcoldstorelink" style="text-decoration:none; border:none;" name="dryfishcoldstoer">Dry Fish C-S</button>
                <button type="submit" class="pb-2 pt-2 ps-4 pe-4 text-dark dryfishlabourlink" style="text-decoration:none; border:none;" name="dryfishlabour">Dry Fish L-B</button>
                <button type="submit" class="pb-2 pt-2 ps-4 pe-4 text-dark repackingoutlink" style="text-decoration:none; border:none;" name="repackingout">RP Out</button>
                <button type="submit" class="pb-2 pt-2 ps-4 pe-4 text-dark totalamountlink" style="text-decoration:none; border:none;" name="totalamountbalance">Total Amount Balance</button>
              </form>
            </div>
            <hr>
            <!-- GFC FISH COLDSTORE -->
            <div class="fishcoldstore hide">
              <table class="table table-striped table-bordered table-hover">
                <tr>
                  <th>Date</th>
                  <th>I.T.E</th>
                  <th>Mc</th>
                  <th>Total Mc</th>
                  <th>Kg</th>
                  <th>Total Kg</th>
                  <th>Rate</th>
                  <th>Charges</th>
                  <th>Total Charges</th>
                  <th>Remark</th>
                  <th>Action</th>
                </tr>
                <?php
                $fishcoldstoredatas = $query->selectall('gfcfishcoldstore');
                $idd = 0;
                $gfcdatecoldstore = $query->selectdesc('gfcfishcoldstore');
                foreach ($fishcoldstoredatas as $fishcoldstoredata) {
                  $idd++;
                  $date = $fishcoldstoredata['date'];
                  $checkitestmt = $pdo->prepare("SELECT COUNT(ite) FROM gfcfishcoldstore WHERE date='$date'");
                  $checkitestmt->execute();
                  $checkitedata = $checkitestmt->fetchColumn();

                  $fishcoldstoremaxstmt = $pdo->prepare("SELECT MAX(charges) AS charges FROM gfcfishcoldstore WHERE date='$date'");
                  $fishcoldstoremaxstmt->execute();
                  $fishcoldstoremaxdata = $fishcoldstoremaxstmt->fetch(PDO::FETCH_ASSOC);

                  $exportstmt = $pdo->prepare("SELECT COUNT(*) FROM gfcfishcoldstore WHERE date='$date'");
                  $exportstmt->execute();
                  $exportcount = $exportstmt->fetchColumn();

                  $istakeoutstmt =$pdo->prepare("SELECT COUNT(*) FROM gfcfishcoldstore WHERE date='$date' AND ite='takeout' AND ite='import' OR ite='export'");
                  $istakeoutstmt->execute();
                  $istakeout = $istakeoutstmt->fetchColumn();

                  $nowid = $fishcoldstoredata['id'];
                  $lastrowdatastmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore WHERE id<'$nowid' ORDER BY id DESC");
                  $lastrowdatastmt->execute();
                  $lastrowdata = $lastrowdatastmt->fetch(PDO::FETCH_ASSOC);

                  if (!empty($lastrowdata)) {
                    $lastyearmonth = date("Y-m", strtotime($lastrowdata['date']));
                    $nowyearmonth = date("Y-m", strtotime($fishcoldstoredata['date']));
                    if ($lastyearmonth != $nowyearmonth) {
                      ?>
                      <tr>

                        <td style="font-weight:bold;"><?=$monthName = date("F", mktime(0, 0, 0, date('m', strtotime($fishcoldstoredata['date'])), 1)); ?></td>
                        <td colspan="10"></td>
                      </tr>
                      <?php
                    }
                  }

                  // Update Queries
                  $lastrowdatastmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore WHERE id<'$nowid' ORDER BY id DESC");
                  $lastrowdatastmt->execute();
                  $lastrowdata = $lastrowdatastmt->fetch(PDO::FETCH_ASSOC);

                  if (!empty($lastrowdata)) {
                     $lastdate = $lastrowdata['date'];
                  }else{
                    $lastdate = '0000-00-00';
                  }


                  $nowtimestamp = strtotime($fishcoldstoredata['date']);
                  $nowyearmonth = date("Y-m", $nowtimestamp);

                  $lasttimestamp = strtotime($lastdate);
                  $lastyearmonth = date("Y-m", $lasttimestamp);

                  if ($nowyearmonth == $lastyearmonth) {
                    $monthsameornot = true;
                  }else{
                    $monthsameornot = false;
                  }

                  if($monthsameornot === true){
                    if(!empty($lastrowdata)){
                      if($fishcoldstoredata['ite'] == 'balance'){
                        if($fishcoldstoredata['charges'] != $fishcoldstoredata['total_charges']){
                          $total_mc = $lastrowdata['total_mc'];
                          $total_kg = $lastrowdata['total_kg'];
                          $charges = $total_kg * $fishcoldstoredata['rate'];
                          $updatestmt = $pdo->prepare("UPDATE gfcfishcoldstore SET total_mc='$total_mc', total_kg='$total_kg', charges='$charges' WHERE id='$nowid' AND total_mc!='0'");
                          $updatestmt->execute();
                        }
                      }else{
                        if(strtolower($fishcoldstoredata['ite']) == 'import'){
                          if($fishcoldstoredata['total_mc'] != $lastrowdata['total_mc'] + $fishcoldstoredata['mc']){
                            $total_mc = $lastrowdata['total_mc'] + $fishcoldstoredata['mc'];
                            $updatestmt = $pdo->prepare("UPDATE gfcfishcoldstore SET total_mc='$total_mc' WHERE id='$nowid' AND total_mc!='0'");
                            $updatestmt->execute();
                          }
                          if($fishcoldstoredata['total_kg'] != $lastrowdata['total_kg'] + $fishcoldstoredata['kg']){
                            $total_kg = $lastrowdata['total_kg'] + $fishcoldstoredata['kg'];
                            $updatestmt = $pdo->prepare("UPDATE gfcfishcoldstore SET total_kg='$total_kg' WHERE id='$nowid' AND total_kg!='0'");
                            $updatestmt->execute();
                          }

                          $coldstorecharges2 = $fishcoldstoredata['total_kg'] * $fishcoldstoredata['rate'];
                          $updatestmt = $pdo->prepare("UPDATE gfcfishcoldstore SET charges='$coldstorecharges2' WHERE id='$nowid'");
                            $updatestmt->execute();
                        }else{
                          if(strtolower($fishcoldstoredata['ite']) == 'export'){
                            if($fishcoldstoredata['total_mc'] != $lastrowdata['total_mc'] - $fishcoldstoredata['mc']){
                              $total_mc = $lastrowdata['total_mc'] - $fishcoldstoredata['mc'];
                              $updatestmt = $pdo->prepare("UPDATE gfcfishcoldstore SET total_mc='$total_mc' WHERE id='$nowid' AND ite='export' AND date='$date'");
                              $updatestmt->execute();
                            }

                            if($fishcoldstoredata['total_kg'] != $lastrowdata['total_kg'] - $fishcoldstoredata['kg']){
                              $total_kg = $lastrowdata['total_kg'] - $fishcoldstoredata['kg'];
                              $updatestmt = $pdo->prepare("UPDATE gfcfishcoldstore SET total_kg='$total_kg' WHERE id='$nowid'");
                              $updatestmt->execute();
                            }
                          }

                          if(strtolower($fishcoldstoredata['ite']) == 'takeout'){
                            if($fishcoldstoredata['total_mc'] != $lastrowdata['total_mc'] - $fishcoldstoredata['mc']){
                              $total_mc = $lastrowdata['total_mc'] - $fishcoldstoredata['mc'];
                              $updatestmt = $pdo->prepare("UPDATE gfcfishcoldstore SET total_mc='$total_mc' WHERE id='$nowid' AND ite='takeout' AND date='$date' AND total_mc!='0'");
                              $updatestmt->execute();
                            }

                            if($fishcoldstoredata['total_kg'] != $lastrowdata['total_kg'] - $fishcoldstoredata['kg']){
                              $total_kg = $lastrowdata['total_kg'] - $fishcoldstoredata['kg'];
                              $updatestmt = $pdo->prepare("UPDATE gfcfishcoldstore SET total_kg='$total_kg' WHERE id='$nowid' AND total_kg!='0'");
                              $updatestmt->execute();
                            }
                          }

                          if(strtolower($fishcoldstoredata['ite']) == 'takeout'){
                            $chargeslastrowstmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore WHERE id<'$nowid' ORDER BY id DESC");
                            $chargeslastrowstmt->execute();
                            $chargeslastrowdata = $chargeslastrowstmt->fetch(PDO::FETCH_ASSOC);
                            if(!empty($chargeslastrowdata)){
                              $coldstorecharges2 = $chargeslastrowdata['total_kg'] * $fishcoldstoredata['rate'];
                            }else{
                              $coldstorecharges2 = $fishcoldstoredata['total_kg'] * $fishcoldstoredata['rate'];
                            }
                            $updatestmt = $pdo->prepare("UPDATE gfcfishcoldstore SET charges='$coldstorecharges2' WHERE id='$nowid' AND
                              ite='takeout' && charges!='0'");
                              $updatestmt->execute();
                          }elseif($fishcoldstoredata['ite'] == 'export'){
                            $chargeslastrowstmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore WHERE id<'$nowid' ORDER BY id DESC");
                            $chargeslastrowstmt->execute();
                            $chargeslastrowdata = $chargeslastrowstmt->fetch(PDO::FETCH_ASSOC);
                            if(!empty($chargeslastrowdata)){
                              $coldstorecharges2 = $chargeslastrowdata['total_kg'] * $fishcoldstoredata['rate'];
                            }else{
                              $coldstorecharges2 = $fishcoldstoredata['total_kg'] * $fishcoldstoredata['rate'];
                            }
                            $updatestmt = $pdo->prepare("UPDATE gfcfishcoldstore SET charges='$coldstorecharges2' WHERE id='$nowid' AND
                              ite='export' && charges!='0'");
                              $updatestmt->execute();
                          }


                        }
                      }


                      $totalchargeslastrowdatastmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore WHERE id<'$nowid' AND total_charges!='0' ORDER BY id DESC");
                      $totalchargeslastrowdatastmt->execute();
                      $totalchargeslastrowdata = $totalchargeslastrowdatastmt->fetch(PDO::FETCH_ASSOC);
                      if(!empty($totalchargeslastrowdata['total_charges'])){
                        $fishtotal_charges = $totalchargeslastrowdata['total_charges'] + $fishcoldstoredata['charges'];
                      }else{
                        $fishtotal_charges = $fishcoldstoredata['charges'];
                      }

                      if($fishcoldstoredata['total_charges'] != $fishtotal_charges){
                        if(!empty($totalchargeslastrowdata['total_charges'])){
                          $total_charges = $totalchargeslastrowdata['total_charges'] + $fishcoldstoredata['charges'];
                        }else{
                          $total_charges = 0 + $fishcoldstoredata['charges'];
                        }
                        $updatestmt = $pdo->prepare("UPDATE gfcfishcoldstore SET total_charges='$total_charges' WHERE id='$nowid' AND total_charges!='0'");
                        $updatestmt->execute();
                      }
                    }
                  }else{

                  }

                 ?>
                <tr>
                  <td><?php echo date('d-m-Y', strtotime($fishcoldstoredata['date'])); ?></td>
                  <td><?php echo $fishcoldstoredata['ite']; ?></td>
                  <td><?php if($fishcoldstoredata['mc'] == '0'){ echo "";}else{ echo $fishcoldstoredata['mc']; }; ?></td>
                  <td><?php echo $fishcoldstoredata['total_mc']; ?></td>
                  <td><?php echo $fishcoldstoredata['kg']; ?></td>
                  <td><?php echo $fishcoldstoredata['total_kg']; ?></td>
                  <td><?php echo $fishcoldstoredata['rate']; ?></td>
                  <td><?php  if($fishcoldstoredata['charges'] != 0){echo $fishcoldstoredata['charges'];} ?></td>
                  <td><?php  if($fishcoldstoredata['total_charges'] != 0){echo $fishcoldstoredata['total_charges'];} ?></td>
                  <td data-bs-toggle="modal" data-bs-target="#editremarkfishcoldstore<?= $fishcoldstoredata['id'];  ?>"><?php echo $fishcoldstoredata['remark']; ?></td>
                  <?php //if ($checkitedata == 1): ?>
                    <td>
                      <button type="submit" class="btn btn-warning btn-sm text-light d-inline"
                      <?php if(date('Y-m', strtotime($fishcoldstoredata['date'])) == date('Y-m', strtotime($gfcdatecoldstore[0]['date']))){echo 'data-bs-toggle="modal"';}else{ echo 'onclick="swal(\'Sorry!\', \'You cannot edit from last month.\', \'warning\');"'; };  ?>
                       data-bs-target="#updatemodal<?= $fishcoldstoredata['id']; ?>"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                          <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                          <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                        </svg>
                      </button>
                    </td>
                  <?php //endif; ?>
                </tr>
                <div class="modal fade" id="updatemodal<?= $fishcoldstoredata['id']; ?>">
                  <div class="modal-dialog">
                    <div class="modal-content" style="width: 650px;">
                      <div class="modal-header bg-secondary text-light">
                        <h1 class="modal-title fs-5">Edit Fish ColdStore Remark</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                    <form action="monthlycharges.php" method="post">
                      <input type="hidden" name="upfishcoldstoreid" value="<?php echo $fishcoldstoredata['id']; ?>">
                      <div class="modal-body">
                        <div class="row">
                          <div class="col">
                            <label>Date</label>
                            <input type="date" name="updatefishcoldstore" class="form-control inpv2" value="<?php if(!empty($fishcoldstoredata['date'])){ echo $fishcoldstoredata['date']; } ?>">
                          </div>
                          <div class="col">
                            <label>I.T.E</label>
                            <select class="form-control inpv2 mb-2" name="upfishite" id='ite<?= $fishcoldstoredata['id']; ?>'>
                              <option <?php if($fishcoldstoredata['ite'] == 'import'){ echo "selected"; } ?> value="import">Import</option>
                              <option <?php if($fishcoldstoredata['ite'] == 'export'){ echo "selected"; } ?> value="export">Export</option>
                              <option <?php if($fishcoldstoredata['ite'] == 'takeout'){ echo "selected"; } ?> value="takeout">TakeOut</option>
                              <option <?php if($fishcoldstoredata['ite'] == 'balance'){ echo "selected"; } ?> value="balance">Balance</option>
                            </select>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <label>Mc</label>
                            <input type="number" name="upmcfishcoldstore" class="form-control inpv2" value="<?php if(!empty($fishcoldstoredata['mc'])){ echo $fishcoldstoredata['mc']; } ?>">
                          </div>
                          <div class="col">
                            <label>Kg</label>
                            <input type="text" name="upkgfishcoldstore" class="form-control inpv2" value="<?php if(!empty($fishcoldstoredata['kg'])){ echo $fishcoldstoredata['kg']; } ?>">
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <label>Coldstore Rate</label>
                            <input type="text" name="upratefishcoldstore" class="form-control inpv2" value="<?php if(!empty($fishcoldstoredata['rate'])){ echo $fishcoldstoredata['rate']; } ?>">
                          </div>
                          <div class="col">
                            <?php
                            $coldstoredate = $fishcoldstoredata['date'];
                            $coldstoreite = $fishcoldstoredata['ite'];

                            $labourratestmt = $pdo->prepare("SELECT rate FROM gfcfishlabour WHERE date='$coldstoredate' AND ite ='$coldstoreite'");
                            $labourratestmt->execute();
                            $labourrate = $labourratestmt->fetch(PDO::FETCH_ASSOC);
                            ?>
                            <div id="labour<?= $fishcoldstoredata['id']; ?>" style="<?php if(empty($labourrate)){echo "display:none;";}; ?>">
                              <label>Labour Rate</label>
                              <input type="text" name="upratefishlabour" class="form-control inpv2" value="<?php if(!empty($labourrate)){echo $labourrate['rate'];}; ?>">

                            </div>
                            <input type="hidden" name="deletedatefish" value="<?= $fishcoldstoredata['date']; ?>">
                          <div class="modal-footer mt-3">
                            <?php if ($checkitedata == 1 && $fishcoldstoredata['ite'] != 'balance'): ?>
                              <button type="button" data-bs-toggle="modal" class="btn btn-secondary">Cancel</button>
                              <!-- <button type="submit" name="deletefishbtn" class="btn btn-danger">Delete</button> -->
                              <button type="submit" name="updatefishcoldstorebtn" class="btn btn-success">Update</button>
                            <?php else: ?>
                            <button type="button" data-bs-toggle="modal" class="btn btn-success">Cancel</button>
                            <button type="submit" name="deletefishbtn" class="btn btn-danger">Delete</button>
                          <?php endif; ?>
                          </div>
                        </div>
                      </div>
                    </form>
                    </div>
                  </div>
                </div>
              </div>
                <script>
                      $('#ite<?= $fishcoldstoredata['id']; ?>').change(()=>{
                        var value = $('#ite<?= $fishcoldstoredata['id']; ?>').val();

                        if(value == 'balance'){
                          $('#labour<?= $fishcoldstoredata['id']; ?>').hide();
                        }else{
                          $('#labour<?= $fishcoldstoredata['id']; ?>').show();
                        }
                      });
                      var value = $('#ite<?= $fishcoldstoredata['id']; ?>').val();

                      if(value == 'balance'){
                        $('#labour<?= $fishcoldstoredata['id']; ?>').hide();
                      }else{
                        $('#labour<?= $fishcoldstoredata['id']; ?>').show();
                      }
                </script>
                  <div class="modal fade" id="editremarkfishcoldstore<?= $fishcoldstoredata['id'];  ?>">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header bg-secondary text-light">
                          <h1 class="modal-title fs-5">Edit Fish ColdStore Remark</h1>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                      <form action="monthlycharges.php" method="post">
                        <input type="hidden" name="fishcoldstoreid" value="<?php echo $fishcoldstoredata['id']; ?>">
                        <div class="modal-body">
                          <label>Remark</label>
                          <input type="text" name="remarkfishcoldstore" class="form-control inpv2" value="<?php if(!empty($fishcoldstoredata['remark'])){ echo $fishcoldstoredata['remark']; } ?>">
                        </div>
                        <div class="modal-footer">
                          <button type="button" name="button" class="btn btn-secondary" data-bs-toggle="modal">Cancel</button>
                          <button type="submit" name="remarkfishcoldstorebtn" class="btn btn-success">Update</button>
                        </div>
                      </form>
                      </div>
                    </div>
                  </div>
                <?php
                }
                 ?>
              </table>
            </div>
            <div class="fishlabour hide">
              <table class="table table-striped table-bordered table-hover">
                <tr>
                  <th>Date</th>
                  <th>I.T.E</th>
                  <th>Kg</th>
                  <th>Rate</th>
                  <th>Charges</th>
                  <th>Total Charges</th>
                  <th>Remark</th>
                </tr>
                <?php
                $fishlabourdatas = $query->selectall('gfcfishlabour');
                foreach ($fishlabourdatas as $fishlabourdata) {

                  $nowid = $fishlabourdata['id'];
                  $lastrowdatastmt = $pdo->prepare("SELECT * FROM gfcfishlabour WHERE id<'$nowid' ORDER BY id DESC");
                  $lastrowdatastmt->execute();
                  $lastrowdata = $lastrowdatastmt->fetch(PDO::FETCH_ASSOC);

                  if (!empty($lastrowdata)) {
                    $lastyearmonth = date("Y-m", strtotime($lastrowdata['date']));
                    $nowyearmonth = date("Y-m", strtotime($fishlabourdata['date']));
                    if ($lastyearmonth != $nowyearmonth) {
                      ?>
                      <tr>

                        <td style="font-weight:bold;"><?=$monthName = date("F", mktime(0, 0, 0, date('m', strtotime($fishlabourdata['date'])), 1)); ?></td>
                        <td colspan="10"></td>
                      </tr>
                      <?php
                    }
                  }
                 ?>
                <tr>
                  <td><?php echo date('d-m-Y', strtotime($fishlabourdata['date'])); ?></td>
                  <td><?php echo $fishlabourdata['ite']; ?></td>
                  <td><?php echo $fishlabourdata['kg']; ?></td>
                  <td><?php echo $fishlabourdata['rate']; ?></td>
                  <td><?php echo $fishlabourdata['charges']; ?></td>
                  <td><?php echo $fishlabourdata['total_charges']; ?></td>
                  <td data-bs-toggle="modal" data-bs-target="#editremarkfishlabour<?= $fishlabourdata['id'];  ?>"><?php echo $fishlabourdata['remark']; ?></td>
                </tr>
                <div class="modal fade" id="editremarkfishlabour<?= $fishlabourdata['id'];  ?>">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header bg-secondary text-light">
                        <h1 class="modal-title fs-5">Edit Fish Labour Remark</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                    <form action="monthlycharges.php" method="post">
                      <input type="hidden" name="fishlabourid" value="<?= $fishlabourdata['id']; ?>">
                      <div class="modal-body">
                        <label>Remark</label>
                        <input type="text" name="remarkfishlabour" class="form-control inpv2" value="<?php if(!empty($fishlabourdata['remark'])){ echo $fishlabourdata['remark']; } ?>">
                      </div>
                      <div class="modal-footer">
                        <button type="button" name="button" class="btn btn-secondary" data-bs-toggle="modal">Cancel</button>
                        <button type="submit" name="remarkfishlabourbtn" class="btn btn-success">Update</button>
                      </div>
                    </form>
                    </div>
                  </div>
                </div>
                <?php
                }
                 ?>
              </table>
            </div>
            <div class="dryfishcoldstore hide">
              <table class="table table-striped table-bordered table-hover">
                <tr>
                  <th>Date</th>
                  <th>I.T.E</th>
                  <th>Kg</th>
                  <th>Total Kg</th>
                  <th>Rate</th>
                  <th>Charges</th>
                  <th>Total Charges</th>
                  <th>Remark</th>
                  <th>Action</th>
                </tr>
                <?php
                $dryfishcoldstoredatas = $query->selectall('gfcdryfishcoldstore');

                $gfcdatedrycoldstore = $query->selectdesc('gfcdryfishcoldstore');
                foreach ($dryfishcoldstoredatas as $dryfishcoldstoredata) {


                  $date = $dryfishcoldstoredata['date'];
                  $checkitestmt = $pdo->prepare("SELECT COUNT(ite) FROM gfcdryfishcoldstore WHERE date='$date'");
                  $checkitestmt->execute();
                  $checkitedata = $checkitestmt->fetchColumn();

                  $fishcoldstoremaxstmt = $pdo->prepare("SELECT MAX(charges) AS charges FROM gfcdryfishcoldstore WHERE date='$date'");
                  $fishcoldstoremaxstmt->execute();
                  $fishcoldstoremaxdata = $fishcoldstoremaxstmt->fetch(PDO::FETCH_ASSOC);

                  $exportstmt = $pdo->prepare("SELECT COUNT(*) FROM gfcdryfishcoldstore WHERE date='$date'");
                  $exportstmt->execute();
                  $exportcount = $exportstmt->fetchColumn();

                  $istakeoutstmt =$pdo->prepare("SELECT COUNT(*) FROM gfcdryfishcoldstore WHERE date='$date' AND ite='takeout' AND ite='import' OR ite='export'");
                  $istakeoutstmt->execute();
                  $istakeout = $istakeoutstmt->fetchColumn();

                  $nowid = $dryfishcoldstoredata['id'];
                  $lastrowdatastmt = $pdo->prepare("SELECT * FROM gfcdryfishcoldstore WHERE id<'$nowid' ORDER BY id DESC");
                  $lastrowdatastmt->execute();
                  $lastrowdata = $lastrowdatastmt->fetch(PDO::FETCH_ASSOC);

                  if (!empty($lastrowdata)) {
                    $lastyearmonth = date("Y-m", strtotime($lastrowdata['date']));
                    $nowyearmonth = date("Y-m", strtotime($dryfishcoldstoredata['date']));
                    if ($lastyearmonth != $nowyearmonth) {
                      ?>
                      <tr>

                        <td style="font-weight:bold;"><?=$monthName = date("F", mktime(0, 0, 0, date('m', strtotime($dryfishcoldstoredata['date'])), 1)); ?></td>
                        <td colspan="10"></td>
                      </tr>
                      <?php
                    }
                  }

                  // Update Queries
                  $lastrowdatastmt = $pdo->prepare("SELECT * FROM gfcdryfishcoldstore WHERE id<'$nowid' ORDER BY id DESC");
                  $lastrowdatastmt->execute();
                  $lastrowdata = $lastrowdatastmt->fetch(PDO::FETCH_ASSOC);

                  if (!empty($dryfishcoldstoredata)) {
                    $lastdate = $dryfishcoldstoredata['date'];
                  }else{
                    $lastdate = '0000-00-00';
                  }

                  $nowtimestamp = strtotime($date);
                  $nowyearmonth = date("Y-m", $nowtimestamp);

                  $lasttimestamp = strtotime($lastdate);
                  $lastyearmonth = date("Y-m", $lasttimestamp);

                  if ($nowyearmonth == $lastyearmonth) {
                    $monthsameornot = true;
                  }else{
                    $monthsameornot = false;
                  }

                  if($monthsameornot === true){
                    if(!empty($lastrowdata)){
                      if($dryfishcoldstoredata['ite'] == 'balance'){
                        $total_kg = $lastrowdata['total_kg'];
                        $charges = $total_kg * $dryfishcoldstoredata['rate'];
                        $updatestmt = $pdo->prepare("UPDATE gfcdryfishcoldstore SET total_kg='$total_kg', charges='$charges' WHERE id='$nowid'");
                        $updatestmt->execute();
                      }else{
                        if(strtolower($dryfishcoldstoredata['ite']) == 'import'){
                          if($dryfishcoldstoredata['total_kg'] != $lastrowdata['total_kg'] + $dryfishcoldstoredata['kg']){
                            $total_kg = $lastrowdata['total_kg'] + $dryfishcoldstoredata['kg'];
                            $updatestmt = $pdo->prepare("UPDATE gfcdryfishcoldstore SET total_kg='$total_kg' WHERE id='$nowid' AND total_kg!='0'");
                            $updatestmt->execute();
                          }

                          $coldstorecharges2 = $dryfishcoldstoredata['total_kg'] * $dryfishcoldstoredata['rate'];
                          $updatestmt = $pdo->prepare("UPDATE gfcdryfishcoldstore SET charges='$coldstorecharges2' WHERE id='$nowid'");
                            $updatestmt->execute();
                        }else{
                          if(strtolower($dryfishcoldstoredata['ite']) == 'export'){

                            if($dryfishcoldstoredata['total_kg'] != $lastrowdata['total_kg'] - $dryfishcoldstoredata['kg']){
                              $total_kg = $lastrowdata['total_kg'] - $dryfishcoldstoredata['kg'];
                              $updatestmt = $pdo->prepare("UPDATE gfcdryfishcoldstore SET total_kg='$total_kg' WHERE id='$nowid' AND total_kg!='0'");
                              $updatestmt->execute();
                            }
                          }

                          if(strtolower($dryfishcoldstoredata['ite']) == 'takeout'){
                            if($dryfishcoldstoredata['total_kg'] != $lastrowdata['total_kg'] - $dryfishcoldstoredata['kg']){
                              $total_kg = $lastrowdata['total_kg'] - $dryfishcoldstoredata['kg'];
                              $updatestmt = $pdo->prepare("UPDATE gfcdryfishcoldstore SET total_kg='$total_kg' WHERE id='$nowid' AND total_kg!='0'");
                              $updatestmt->execute();
                            }
                          }

                          if(strtolower($dryfishcoldstoredata['ite']) == 'takeout'){
                            $chargeslastrowstmt = $pdo->prepare("SELECT * FROM gfcdryfishcoldstore WHERE id<'$nowid' AND date='$date' AND ite='takeout' ORDER BY id DESC");
                            $chargeslastrowstmt->execute();
                            $chargeslastrowdata = $chargeslastrowstmt->fetch(PDO::FETCH_ASSOC);
                            if(!empty($chargeslastrowdata)){
                              $coldstorecharges2 = $chargeslastrowdata['total_kg'] * $dryfishcoldstoredata['rate'];
                            }else{
                              $coldstorecharges2 = $dryfishcoldstoredata['total_kg'] * $dryfishcoldstoredata['rate'];
                            }
                            $updatestmt = $pdo->prepare("UPDATE gfcdryfishcoldstore SET charges='$coldstorecharges2' WHERE id='$nowid' AND
                              ite='takeout' && charges!='0'");
                              $updatestmt->execute();
                          }elseif($dryfishcoldstoredata['ite'] == 'export'){
                            $chargeslastrowstmt = $pdo->prepare("SELECT * FROM gfcdryfishcoldstore WHERE id<'$nowid' AND date='$date' AND ite='export' ORDER BY id DESC");
                            $chargeslastrowstmt->execute();
                            $chargeslastrowdata = $chargeslastrowstmt->fetch(PDO::FETCH_ASSOC);
                            if(!empty($chargeslastrowdata)){
                              $coldstorecharges2 = $chargeslastrowdata['total_kg'] * $dryfishcoldstoredata['rate'];
                            }else{
                              $coldstorecharges2 = $dryfishcoldstoredata['total_kg'] * $dryfishcoldstoredata['rate'];
                            }
                            $updatestmt = $pdo->prepare("UPDATE gfcdryfishcoldstore SET charges='$coldstorecharges2' WHERE id='$nowid' AND
                              ite='export' && charges!='0'");
                              $updatestmt->execute();
                          }


                        }
                      }


                      $totalchargeslastrowdatastmt = $pdo->prepare("SELECT * FROM gfcdryfishcoldstore WHERE id<'$nowid' AND total_charges!='0' ORDER BY id DESC");
                      $totalchargeslastrowdatastmt->execute();
                      $totalchargeslastrowdata = $totalchargeslastrowdatastmt->fetch(PDO::FETCH_ASSOC);
                      if(!empty($totalchargeslastrowdata['total_charges'])){
                        $fishtotal_charges = $totalchargeslastrowdata['total_charges'] + $dryfishcoldstoredata['charges'];
                      }else{
                        $fishtotal_charges = $dryfishcoldstoredata['charges'];
                      }

                      if($dryfishcoldstoredata['total_charges'] != $fishtotal_charges){
                        $total_charges = $totalchargeslastrowdata['total_charges'] + $dryfishcoldstoredata['charges'];
                        $updatestmt = $pdo->prepare("UPDATE gfcdryfishcoldstore SET total_charges='$total_charges' WHERE id='$nowid' AND total_charges!='0'");
                        $updatestmt->execute();
                      }
                    }
                  }else{

                  }
                 ?>
                <tr>
                  <td><?php echo date('d-m-Y', strtotime($dryfishcoldstoredata['date'])); ?></td>
                  <td><?php echo $dryfishcoldstoredata['ite']; ?></td>
                  <td><?php echo $dryfishcoldstoredata['kg']; ?></td>
                  <td><?php echo $dryfishcoldstoredata['total_kg']; ?></td>
                  <td><?php echo $dryfishcoldstoredata['rate']; ?></td>
                  <td><?php if($dryfishcoldstoredata['charges'] != 0){ echo $dryfishcoldstoredata['charges']; } ?></td>
                  <td><?php if($dryfishcoldstoredata['total_charges'] != 0){ echo $dryfishcoldstoredata['total_charges']; } ?></td>
                  <td data-bs-toggle="modal" data-bs-target="#editremarkdryfishcoldstore<?= $dryfishcoldstoredata['id'];  ?>"><?php echo $dryfishcoldstoredata['remark']; ?></td>
                  <?php //if ($checkitedata == 1): ?>
                    <td>
                      <button type="submit" class="btn btn-warning btn-sm text-light d-inline"
                      <?php if(date('Y-m', strtotime($dryfishcoldstoredata['date'])) == date('Y-m', strtotime($gfcdatedrycoldstore[0]['date']))){echo 'data-bs-toggle="modal"';}else{ echo 'onclick="swal(\'Sorry!\', \'You cannot edit from last month.\', \'warning\');"'; };  ?>
                       data-bs-target="#updatemodaldryfish<?= $dryfishcoldstoredata['id']; ?>"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                          <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                          <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                        </svg>
                      </button>
                    </td>
                </tr>
                <div class="modal fade" id="updatemodaldryfish<?= $dryfishcoldstoredata['id']; ?>">
                  <div class="modal-dialog">
                    <div class="modal-content" style="width: 650px;">
                      <div class="modal-header bg-secondary text-light">
                        <h1 class="modal-title fs-5">Edit Fish ColdStore Remark</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                    <form action="monthlycharges.php" method="post">
                      <input type="hidden" name="updryfishcoldstoreid" value="<?php echo $dryfishcoldstoredata['id']; ?>">
                      <div class="modal-body">
                        <div class="row">
                          <div class="col">
                            <label>Date</label>
                            <input type="date" name="updatedryfishcoldstore" class="form-control inpv2" value="<?php if(!empty($dryfishcoldstoredata['date'])){ echo $dryfishcoldstoredata['date']; } ?>">
                          </div>
                          <div class="col">
                            <label>I.T.E</label>
                            <select class="form-control inpv2 mb-2" name="updryfishite" id='ite<?= $dryfishcoldstoredata['id']; ?>'>
                              <option <?php if($dryfishcoldstoredata['ite'] == 'import'){ echo "selected"; } ?> value="import">Import</option>
                              <option <?php if($dryfishcoldstoredata['ite'] == 'export'){ echo "selected"; } ?> value="export">Export</option>
                              <option <?php if($dryfishcoldstoredata['ite'] == 'takeout'){ echo "selected"; } ?> value="takeout">TakeOut</option>
                              <option <?php if($dryfishcoldstoredata['ite'] == 'balance'){ echo "selected"; } ?> value="balance">Balance</option>
                            </select>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <label>Kg</label>
                            <input type="text" name="upkgdryfishcoldstore" class="form-control inpv2" value="<?php if(!empty($dryfishcoldstoredata['kg'])){ echo $dryfishcoldstoredata['kg']; } ?>">
                          </div>
                          <div class="col">
                            <label>Coldstore Rate</label>
                            <input type="text" name="upratedryfishcoldstore" class="form-control inpv2" value="<?php if(!empty($dryfishcoldstoredata['rate'])){ echo $dryfishcoldstoredata['rate']; } ?>">
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <?php
                            $coldstoredate = $dryfishcoldstoredata['date'];
                            $coldstoreite = $dryfishcoldstoredata['ite'];

                            $labourratestmt = $pdo->prepare("SELECT rate FROM gfcdryfishlabour WHERE date='$coldstoredate' AND ite ='$coldstoreite'");
                            $labourratestmt->execute();
                            $labourrate = $labourratestmt->fetch(PDO::FETCH_ASSOC);
                            ?>
                            <div id="labour<?= $dryfishcoldstoredata['id']; ?>" style="<?php if(empty($labourrate)){echo "display:none;";}; ?>">
                              <label>Labour Rate</label>
                              <input type="text" name="upratedryfishlabour" class="form-control inpv2" value="<?php if(!empty($labourrate)){echo $labourrate['rate'];}; ?>">

                            </div>
                            <input type="hidden" name="deletedatedryfish" value="<?= $dryfishcoldstoredata['date']; ?>">
                          <div class="modal-footer mt-3">
                            <?php if ($checkitedata == 1 && $dryfishcoldstoredata['ite'] != 'balance'): ?>
                              <button type="submit" name="deletedryfishbtn" class="btn btn-danger">Delete</button>
                              <button type="submit" name="updatedryfishcoldstorebtn" class="btn btn-success">Update</button>
                            <?php else: ?>
                            <button type="button" data-bs-toggle="modal" class="btn btn-success">Cancel</button>
                            <button type="submit" name="deletedryfishbtn" class="btn btn-danger">Delete</button>
                          <?php endif; ?>
                          </div>
                        </div>
                      </div>
                    </form>
                    </div>
                  </div>
                </div>
              </div>
                <script>
                      $('#ite<?= $dryfishcoldstoredata['id']; ?>').change(()=>{
                        var value = $('#ite<?= $dryfishcoldstoredata['id']; ?>').val();

                        if(value == 'balance'){
                          $('#labour<?= $dryfishcoldstoredata['id']; ?>').hide();
                        }else{
                          $('#labour<?= $dryfishcoldstoredata['id']; ?>').show();
                        }
                      });
                      var value = $('#ite<?= $dryfishcoldstoredata['id']; ?>').val();

                      if(value == 'balance'){
                        $('#labour<?= $dryfishcoldstoredata['id']; ?>').hide();
                      }else{
                        $('#labour<?= $dryfishcoldstoredata['id']; ?>').show();
                      }
                </script>
                <div class="modal fade" id="editremarkdryfishcoldstore<?= $dryfishcoldstoredata['id'];  ?>">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header bg-secondary text-light">
                        <h1 class="modal-title fs-5">Edit Dry Fish Cold Store Remark</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                    <form action="monthlycharges.php" method="post">
                      <input type="hidden" name="dryfishcoldstoreid" value="<?= $dryfishcoldstoredata['id']; ?>">
                      <div class="modal-body">
                        <label>Remark</label>
                        <input type="text" name="remarkdryfishcoldstore" class="form-control inpv2" value="<?php if(!empty($dryfishcoldstoredata['remark'])){ echo $dryfishcoldstoredata['remark']; } ?>">
                      </div>
                      <div class="modal-footer">
                        <button type="button" name="button" class="btn btn-secondary" data-bs-toggle="modal">Cancel</button>
                        <button type="submit" name="remarkdryfishcoldstorebtn" class="btn btn-success">Update</button>
                      </div>
                    </form>
                    </div>
                  </div>
                </div>
                <?php
                }
                 ?>
              </table>
            </div>
            <div class="dryfishlabour hide">
              <table class="table table-striped table-bordered table-hover">
                <tr>
                  <th>Date</th>
                  <th>I.T.E</th>
                  <th>Kg</th>
                  <th>Rate</th>
                  <th>Charges</th>
                  <th>Total Charges</th>
                  <th>Remark</th>
                </tr>
                <?php
                $dryfishlabourdatas = $query->selectall('gfcdryfishlabour');
                foreach ($dryfishlabourdatas as $dryfishlabourdata) {
                  $nowid = $dryfishlabourdata['id'];
                  $lastrowdatastmt = $pdo->prepare("SELECT * FROM gfcdryfishlabour WHERE id<'$nowid' ORDER BY id DESC");
                  $lastrowdatastmt->execute();
                  $lastrowdata = $lastrowdatastmt->fetch(PDO::FETCH_ASSOC);

                  if (!empty($lastrowdata)) {
                    $lastyearmonth = date("Y-m", strtotime($lastrowdata['date']));
                    $nowyearmonth = date("Y-m", strtotime($dryfishlabourdata['date']));
                    if ($lastyearmonth != $nowyearmonth) {
                      ?>
                      <tr>

                        <td style="font-weight:bold;"><?=$monthName = date("F", mktime(0, 0, 0, date('m', strtotime($dryfishlabourdata['date'])), 1)); ?></td>
                        <td colspan="10"></td>
                      </tr>
                      <?php
                    }
                  }
                 ?>
                <tr>
                  <td><?php echo date('d-m-Y', strtotime($dryfishlabourdata['date'])); ?></td>
                  <td><?php echo $dryfishlabourdata['ite']; ?></td>
                  <td><?php echo $dryfishlabourdata['kg']; ?></td>
                  <td><?php echo $dryfishlabourdata['rate']; ?></td>
                  <td><?php echo $dryfishlabourdata['charges']; ?></td>
                  <td><?php echo $dryfishlabourdata['total_charges']; ?></td>
                  <td data-bs-toggle="modal" data-bs-target="#editremarkdryfishlabour<?= $dryfishlabourdata['id'];  ?>"><?php echo $dryfishlabourdata['remark']; ?></td>
                </tr>
                <div class="modal fade" id="editremarkdryfishlabour<?= $dryfishlabourdata['id'];  ?>">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header bg-secondary text-light">
                        <h1 class="modal-title fs-5">Edit Dry Fish Labour Remark</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                    <form action="monthlycharges.php" method="post">
                      <input type="hidden" name="dryfishlabourid" value="<?= $dryfishlabourdata['id']; ?>">
                      <div class="modal-body">
                        <label>Remark</label>
                        <input type="text" name="remarkdryfishlabour" class="form-control inpv2" value="<?php if(!empty($dryfishlabourdata['remark'])){ echo $dryfishlabourdata['remark']; } ?>">
                      </div>
                      <div class="modal-footer">
                        <button type="button" name="button" class="btn btn-secondary" data-bs-toggle="modal">Cancel</button>
                        <button type="submit" name="remarkdryfishlabourbtn" class="btn btn-success">Update</button>
                      </div>
                    </form>
                    </div>
                  </div>
                </div>
                <?php
                }
                 ?>
              </table>
            </div>
            <div class="repackingout hide">
              <table class="table table-striped table-bordered table-hover">
                <tr>
                  <th>Id</th>
                  <th>Date</th>
                  <th>Out Kg</th>
                  <th>Rate</th>
                  <th>Charges</th>
                  <th>Total Charges</th>
                </tr>
                <?php
                $repackingoutdatas = $query->selectall('repackingout');
                $idd = 0;
                foreach ($repackingoutdatas as $repackingoutdata) {
                  $idd++;
                 ?>
                <tr>
                  <td><?php echo $idd; ?></td>
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

                  $idd++;
                  ?>
                  <tr <?php if($totaldata['payment_date'] != '0000-00-00' || $totaldata['total_charges'] != 0){ ?>data-bs-toggle="modal" data-bs-target="#addpayment<?php echo $totaldata['id']; ?>"<?php } ?>>
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
    <?php
      if($_SESSION['tabs'] == "fishcoldstore"){
        echo "showfishcoldstore();";
      }elseif($_SESSION['tabs'] == "fishlabour"){
        echo "showfishlabour();";
      }elseif($_SESSION['tabs'] == "dryfishcoldstoer"){
        echo "showdryfishcoldstore();";
      }elseif($_SESSION['tabs'] == "dryfishlabour"){
        echo "showdryfishlabour();";
      }elseif($_SESSION['tabs'] == "repackingout"){
        echo "showrepackingout();";
      }elseif($_SESSION['tabs'] == "totalamountbalance"){
        echo "showtotal();";
      }else{
        echo "showfishcoldstore();";
      }
    ?>
    function showfishcoldstore(){
      document.querySelector(".export").classList.add('hide');
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
      document.querySelector(".export").classList.add('hide');
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
      document.querySelector(".export").classList.add('hide');
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
      document.querySelector(".export").classList.add('hide');
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
      document.querySelector(".export").classList.add('hide');
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
      document.querySelector(".export").classList.remove('hide');
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
      document.querySelector(".addopening").classList.remove('hide');
    }
    </script>
    <script type="text/javascript">
       console.log('<?php echo $_SESSION['reloadtime']; ?>');
    </script>
    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
