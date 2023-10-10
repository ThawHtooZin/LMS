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
      $item_id = $_POST['item_id'];
      $mc = $_POST['mc'];
      $kg = $_POST['kg'];
      $coldstorerate = $_POST['coldstorerate'];
      $freezingrate = $_POST['freezingrate'];
      $exportrate = $_POST['exportrate'];
      $loose_mc = $_POST['loose_mc'];
      $loose_kg = $_POST['loose_kg'];
      $query->addmslcoldstore($indate, $outdate, $item_id, $mc, $kg, $coldstorerate, $freezingrate, $exportrate, $loose_mc, $loose_kg);
    }

    if(isset($_POST['updatetotalcharges'])){
      $id = $_POST['id'];
      $repacking_charges = $_POST['repacking_charges'];
      $ice_charges = $_POST['ice_charges'];
      $query->updatemslcoldstoretotal($id, $repacking_charges, $ice_charges);
    }

    if(isset($_POST['paymentbtn'])){
      $payment_date = $_POST['payment_date'];
      $payment_amount = $_POST['payment_amount'];

      $query->paymsltotalcharges($payment_date, $payment_amount);
    }

    if(isset($_POST['repackingadd'])){
      $date = $_POST['date'];
      $description = $_POST['description'];
      $sheet = $_POST['sheet'];
      $plastic = $_POST['plastic'];
      $price = $_POST['price'];

      $query->addmslrepacking($date, $description, $sheet, $plastic, $price);
    }

    if(isset($_POST['addstockbtn'])){
      $indate = $_POST['indate'];
      $item_id = $_POST['item_id'];
      $mc = $_POST['mc'];
      $kg = $_POST['kg'];

      $query->addmslnewstock($indate, $item_id, $mc, $kg);
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
      $query->updatemslcoldstore($indate, $outdate, $mc, $kg, $coldstorerate, $labourrate, $processingrate, $updateid);
    }

     ?>
    <div class="row">
      <div class="sidebarcol" id="sidebar">
        <?php
        include 'sidebar.php';
        ?>
      </div>
      <div class="contentcol" style="">
        <?php require 'navbar.php'; ?>
        <div class="card">
          <div class="card-header bg-info text-light">

            <h4 class="d-inline">MSL Date Range Cold Store Charges</h4>
            <button type="submit" class="btn btn-success float-end addnewstock" data-bs-toggle="modal" data-bs-target="#newstock">Add New Stock</button>
            <button type="submit" class="btn btn-success float-end addnewcharges" data-bs-toggle="modal" data-bs-target="#newcharges">Add New Charges</button>
            <button type="submit" class="btn btn-success float-end hide addrepackingcharges" data-bs-toggle="modal" data-bs-target="#repackingcharges">Add Repacking Charges</button>
            <button type="submit" class="btn btn-dark text-light float-end hide addtotalcharges" data-bs-toggle="modal" data-bs-target="#addpayment">Add Payment</button>
          </div>
          <div class="card-body">
            <div class="text-center">
              <?php
              if(isset($_POST['coldstorebtn'])){
                $_SESSION['tabs'] = "coldstore";
              }elseif(isset($_POST['labourbtn'])){
                $_SESSION['tabs'] = "labour";
              }elseif(isset($_POST['processingbtn'])){
                $_SESSION['tabs'] = "processing";
              }elseif(isset($_POST['repackingbtn'])){
                $_SESSION['tabs'] = "repacking";
              }elseif(isset($_POST['totalchargesbtn'])){
                $_SESSION['tabs'] = "totalcharges";
              }elseif(isset($_POST['remainingstockbtn'])){
                $_SESSION['tabs'] = "remainingstock";
              }
               ?>
              <form action="" method="post">
                <button type="submit" class="pb-2 pt-2 text-dark remainingstocklink" style="padding-left:20px; padding-right: 20px; text-decoration:none; border:none;" name="remainingstockbtn">Remaining Stock</button>
                <button type="submit" class="pb-2 pt-2 text-dark coldstorelink" style="padding-left:20px; padding-right: 20px; text-decoration:none; border:none;" name="coldstorebtn">Cold Store Charges</button>
                <button type="submit" class="pb-2 pt-2 text-dark labourlink" style="padding-left:20px; padding-right: 20px; text-decoration:none; border:none;" name="labourbtn">Freezing Charges</button>
                <button type="submit" class="pb-2 pt-2 text-dark processinglink" style="padding-left:20px; padding-right: 20px; text-decoration:none; border:none;" name="processingbtn">Export Handling Charges</button>
                <button type="submit" class="pb-2 pt-2 text-dark repackinglink" style="padding-left:20px; padding-right: 20px; text-decoration:none; border:none;" name="repackingbtn">Repacking Charges</button>
                <button type="submit" class="pb-2 pt-2 text-dark totallink" style="padding-left:20px; padding-right: 20px; text-decoration:none; border:none;" name="totalchargesbtn">Total Charges</button>
              </form>
            </div>
            <hr>
            <div class="coldstorecharges hide">
                <table class="table table-striped table-bordered table-hover">
                  <tr>
                    <th class="text-center">Id</th>
                    <th class="text-center">In Date</th>
                    <th class="text-center">Out Date</th>
                    <th class="text-center">Fish Name</th>
                    <th class="text-center">Mc</th>
                    <th class="text-center">Total Mc</th>
                    <th class="text-center">Kg</th>
                    <th class="text-center">Total Kg</th>
                    <th class="text-center">Day</th>
                    <th class="text-center">Rate</th>
                    <th class="text-center">Charges</th>
                    <th class="text-center">Total Charges</th>
                    <th class="text-center">Action</th>
                  </tr>
                  <?php

                  $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT item_id) FROM mslcoldstore");
                  $commonditycountstmt->execute();
                  $commonditycountdatas = $commonditycountstmt->fetchColumn();
                  for ($i=0; $i < $commonditycountdatas; $i++) {
                    $commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM mslcoldstore");
                    $commonditystmt->execute();
                    $commonditydata = $commonditystmt->fetchall();
                    $commondity_id = $commonditydata[$i]['item_id'];

                  $stmt = $pdo->prepare("SELECT * FROM mslcoldstore WHERE item_id='$commondity_id'");
                  $stmt->execute();
                  $datas = $stmt->fetchall();
                  foreach ($datas as $data) {
                    $item_id = $data['item_id'];
                    $commonditydata = $query->select('item', $item_id, 'item_id');
                  ?>
                  <!-- <tr style="<?php //if($commonditydata['category_name'] == "IQF"){echo "background-color: #6ef757 !important;";}elseif($commonditydata['category_name'] == "Block"){echo "background-color: #f5764c !important;";}elseif($commonditydata['category_name'] == "Pujanut"){echo "background-color: lightblue !important;";} ?>"> -->
                  <tr>
                    <td><?php echo $data['id']; ?></td>
                    <td><?php echo date("d-m-Y", strtotime($data['indate'])); ?></td>
                    <td><?php if($data['outdate'] != '0000-00-00'){ echo date("d-m-Y", strtotime($data['outdate']));}else{echo "Loose";}; ?></td>
                    <td><?php echo $commonditydata['item_name']; ?></td>
                    <td><?php echo $data['mc']; ?></td>
                    <td><?php echo $data['total_mc']; ?></td>
                    <td><?php echo $data['kg']; ?></td>
                    <td><?php echo $data['total_kg']; ?></td>
                    <td><?php echo $data['day']; ?></td>
                    <td><?php echo $data['rate']; ?></td>
                    <td><?php echo $data['charges']; ?></td>
                    <td><?php echo $data['total_charges']; ?></td>
                    <td><a href="msldaterangecharges.php" class="btn btn-warning text-light btn-sm" data-bs-toggle="modal" data-bs-target="#coldstoreupdatemodal<?php echo $data['id']; ?>">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
    <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
  </svg></a>
                    <!-- <button type="submit" name="deletebutton" class="btn btn-danger">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16"><path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/></svg>
                    </button> -->
                    </td>
                  </tr>
                  <div class="modal fade" id="coldstoreupdatemodal<?php echo $data['id']; ?>">
                    <div class="modal-dialog" role="document">
                      <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
                        <div class="modal-header bg-warning text-light">
                          <h1 class="modal-title fs-5">Update Charges</h1>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                          <form action="msldaterangecharges.php" method="post">
                          <div class="modal-body">
                            <div class="row" style="margin-bottom: 10px !important;">
                              <input type="hidden" name="updateid" value="<?php echo $data['id']; ?>">
                              <?php
                                $id = $data['id'];
                                $coldstoredataup = $query->select('coldstore', $id, 'id');
                                $labourdataup = $query->select('labour', $id, 'id');
                                $processingdataup = $query->select('processing', $id, 'id');
                               ?>
                              <div class="col">
                                <label style="font-weight: bold;">In Date</label>
                                <input type="date" name="indate" class="form-control inpv2" value="<?php echo $coldstoredataup['indate'];  ?>">
                              </div>
                              <div class="col">
                                <label style="font-weight: bold;">Out Date</label>
                                <input type="date" name="outdate" class="form-control inpv2" value="<?php echo $coldstoredataup['outdate'];  ?>">
                              </div>
                            </div>
                            <div class="row" style="margin-bottom: 10px !important;">
                              <div class="col">
                                <label style="font-weight: bold;">Mc</label>
                                <input type="number" name="mc" class="form-control inpv2" value="<?php echo $coldstoredataup['mc'];  ?>">
                              </div>
                              <div class="col">
                                <label style="font-weight: bold;">Kg</label>
                                <input type="text" name="kg" class="form-control inpv2" value="<?php echo $coldstoredataup['kg'];  ?>">
                              </div>
                            </div>
                            <div class="row" style="margin-bottom: 10px !important;">
                              <div class="col">
                                <label style="font-weight: bold;">Cold Store Rate</label>
                                <input type="text" name="coldstorerate" class="form-control inpv2" value="<?php echo $coldstoredataup['rate'];  ?>">
                              </div>
                              <div class="col">
                                <label style="font-weight: bold;">Labour Rate</label>
                                <input type="text" name="labourrate" class="form-control inpv2" value="<?php echo $labourdataup['rate'];  ?>">
                              </div>
                            </div>
                            <div class="row">
                              <div class="col">
                                <label style="font-weight: bold;">Processing Rate</label>
                                <input type="text" name="processingrate" class="form-control inpv2" value="<?php echo $processingdataup['rate'];  ?>">
                              </div>
                            <div class="col mt-4">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-warning" name="update">Update</button>
                              </div>
                            </div>
                          </div>
                        </form>
                        </div>
                      </div>
                    </div>
                  </div>
                  <?php
                  }
                }
                 ?>
                </table>
            </div>
            <div class="labourcharges hide">
              <table class="table table-striped table-bordered table-hover">
                <tr>
                  <th class="text-center">Id</th>
                  <th class="text-center">In Date</th>
                  <th class="text-center">Out Date</th>
                  <th class="text-center">Fish Name</th>
                  <th class="text-center">Mc</th>
                  <th class="text-center">Total Mc</th>
                  <th class="text-center">Kg</th>
                  <th class="text-center">Total Kg</th>
                  <th class="text-center">Rate</th>
                  <th class="text-center">Charges</th>
                  <th class="text-center">Total Charges</th>
                  <th class="text-center">Action</th>
                </tr>
                <?php
                $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT item_id) FROM mslfreezing");
                $commonditycountstmt->execute();
                $commonditycountdatas = $commonditycountstmt->fetchColumn();
                for ($i=0; $i < $commonditycountdatas; $i++) {
                  $commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM mslfreezing");
                  $commonditystmt->execute();
                  $commonditydata = $commonditystmt->fetchall();
                  $commondity_id = $commonditydata[$i]['item_id'];

                $labourstmt = $pdo->prepare("SELECT * FROM mslfreezing WHERE item_id='$commondity_id'");
                $labourstmt->execute();
                $labourdatas = $labourstmt->fetchall();
                foreach ($labourdatas as $labourdata) {
                  $item_id = $labourdata['item_id'];
                  $commonditydata = $query->select('item', $item_id, 'item_id');
                ?>
                <tr>
                  <td><?php echo $labourdata['id']; ?></td>
                  <td><?php echo date('d-m-Y', strtotime($labourdata['indate'])); ?></td>
                  <td><?php echo date('d-m-Y', strtotime($labourdata['outdate'])); ?></td>
                  <td><?php echo $commonditydata['item_name']; ?></td>
                  <td><?php echo $labourdata['mc']; ?></td>
                  <td><?php echo $labourdata['total_mc']; ?></td>
                  <td><?php echo $labourdata['kg']; ?></td>
                  <td><?php echo $labourdata['total_kg']; ?></td>
                  <td><?php echo $labourdata['rate']; ?></td>
                  <td><?php echo $labourdata['charges']; ?></td>
                  <td><?php echo $labourdata['total_charges']; ?></td>
                  <td><a href="msldaterangecharges.php" class="btn btn-warning text-light btn-sm" data-bs-toggle="modal" data-bs-target="#coldstoreupdatemodal<?php echo $data['id']; ?>">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
</svg></a>
                  <!-- <button type="submit" name="deletebutton" class="btn btn-danger">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16"><path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/></svg>
                  </button> -->
                  </td>
                </tr>
                <?php
                }
              }
                 ?>
              </table>
            </div>
            <div class="processingcharges hide">
              <table class="table table-striped table-bordered table-hover">
                <tr>
                  <th class="text-center">Id</th>
                  <th class="text-center">In Date</th>
                  <th class="text-center">Out Date</th>
                  <th class="text-center">Fish Name</th>
                  <th class="text-center">Mc</th>
                  <th class="text-center">Total Mc</th>
                  <th class="text-center">Kg</th>
                  <th class="text-center">Total Kg</th>
                  <th class="text-center">Rate</th>
                  <th class="text-center">Charges</th>
                  <th class="text-center">Total Charges</th>
                  <th class="text-center">Action</th>
                </tr>
                <?php
                $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT item_id) FROM mslexportcharges");
                $commonditycountstmt->execute();
                $commonditycountdatas = $commonditycountstmt->fetchColumn();
                for ($i=0; $i < $commonditycountdatas; $i++) {
                  $commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM mslexportcharges");
                  $commonditystmt->execute();
                  $commonditydata = $commonditystmt->fetchall();
                  $commondity_id = $commonditydata[$i]['item_id'];

                $processingstmt = $pdo->prepare("SELECT * FROM mslexportcharges WHERE item_id='$commondity_id'");
                $processingstmt->execute();
                $processingdatas = $processingstmt->fetchall();
                foreach ($processingdatas as $processingdata) {
                  $item_id = $processingdata['item_id'];
                  $commonditydata = $query->select('item', $item_id, 'item_id');
                ?>
                <tr>
                  <td><?php echo $processingdata['id']; ?></td>
                  <td><?php echo date('d-m-Y', strtotime($processingdata['indate'])); ?></td>
                  <td><?php echo date('d-m-Y', strtotime($processingdata['outdate'])); ?></td>
                  <td><?php echo $commonditydata['item_name']; ?></td>
                  <td><?php echo $processingdata['mc']; ?></td>
                  <td><?php echo $processingdata['total_mc']; ?></td>
                  <td><?php echo $processingdata['kg']; ?></td>
                  <td><?php echo $processingdata['total_kg']; ?></td>
                  <td><?php echo $processingdata['rate']; ?></td>
                  <td><?php echo $processingdata['charges']; ?></td>
                  <td><?php echo $processingdata['total_charges']; ?></td>
                  <td><a href="msldaterangecharges.php" class="btn btn-warning text-light btn-sm" data-bs-toggle="modal" data-bs-target="#coldstoreupdatemodal<?php echo $data['id']; ?>">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
</svg></a>
                  <!-- <button type="submit" name="deletebutton" class="btn btn-danger">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16"><path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/></svg>
                  </button> -->
                  </td>
                </tr>
                <?php
                }
                }
                 ?>
              </table>
            </div>
            <div class="totalcharges hide">
              <table class="table table-striped table-bordered table-hover">
                <tr style="font-size:13px;">
                  <th class="text-center">Id</th>
                  <th class="text-center">Fish Name</th>
                  <th class="text-center">Total Cold Store Charges</th>
                  <th class="text-center">Total Freezing Charges</th>
                  <th class="text-center">Total Export Charges</th>
                  <th class="text-center">Repacking Charges</th>
                  <th class="text-center">Ice Charges</th>
                  <th class="text-center">Total Charges</th>
                  <th class="text-center">Grand Total Charges</th>
                  <th class="text-center">Payment Date</th>
                  <th class="text-center">Payment Amount</th>
                  <th class="text-center">Balance Amount</th>
                  <th class="text-center">Remark</th>
                </tr>
                <?php
                $totalstmt = $pdo->prepare("SELECT * FROM msl_total_charges");
                $totalstmt->execute();
                $totaldatas = $totalstmt->fetchall();
                $no = 1;
                foreach ($totaldatas as $total_charges_data) {
                  $item_id = $total_charges_data['item_id'];
                  $commonditydata = $query->select('item', $item_id, 'item_id');
                ?>
                <tr data-bs-toggle="modal" data-bs-target="#updatetotalcharges<?php echo $total_charges_data['id']; ?>">
                  <td><?php echo $no; ?></td>
                  <td><?php if(!empty($commonditydata['item_name'])){ echo $commonditydata['item_name'];} ; ?></td>
                  <td><?php if($total_charges_data['total_coldstore_charges'] != "0"){ echo $total_charges_data['total_coldstore_charges'];} ; ?></td>
                  <td><?php if($total_charges_data['total_freezing_charges'] != "0"){ echo $total_charges_data['total_freezing_charges'];} ; ?></td>
                  <td><?php if($total_charges_data['total_export_charges'] != "0"){ echo $total_charges_data['total_export_charges'];} ; ?></td>
                  <td><?php if($total_charges_data['repacking_charges'] != "0"){ echo $total_charges_data['repacking_charges'];} ; ?></td>
                  <td><?php if($total_charges_data['ice_charges'] != "0"){ echo $total_charges_data['ice_charges'];} ; ?></td>
                  <td><?php if($total_charges_data['total_charges'] != "0"){ echo $total_charges_data['total_charges'];} ; ?></td>
                  <td><?php if($total_charges_data['grand_total_charges'] != "0"){ echo $total_charges_data['grand_total_charges'];} ; ?></td>
                  <td><?php if($total_charges_data['payment_date'] != "0000-00-00"){ echo date('d-m-Y', strtotime($total_charges_data['payment_date'])); } ; ?></td>
                  <td><?php if($total_charges_data['payment_amount'] != "0"){ echo $total_charges_data['payment_amount']; }; ?></td>
                  <td><?php if($total_charges_data['balance_amount'] != "0"){ echo $total_charges_data['balance_amount'];}; ?></td>
                  <td><?php if($total_charges_data['remark'] != "0"){ echo $total_charges_data['remark'];}; ?></td>
                </tr>
                <!-- Add Modal -->
                <div class="modal fade" id="updatetotalcharges<?php echo $total_charges_data['id']; ?>">
                  <div class="modal-dialog">
                    <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
                      <div class="modal-header bg-secondary text-light">
                        <h1 class="modal-title fs-5">Edit Total Charges</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <form action="msldaterangecharges.php" method="post">
                      <div class="modal-body">
                        <input type="hidden" name="id" value="<?php echo $total_charges_data['id']; ?>">
                        <?php
                        $updateid = $total_charges_data['id'];

                        $updatestmt = $pdo->prepare("SELECT * FROM total_charges WHERE id='$updateid'");
                        $updatestmt->execute();
                        $updatedata = $updatestmt->fetch(PDO::FETCH_ASSOC);
                        ?>
                        <div class="row">
                          <div class="col">
                            <label>Repacking Charges</label>
                            <input type="number" name="repacking_charges" class="form-control inpv2 mb-2" value="<?php if(!empty($updatedata['repacking_charges'])){ echo $updatedata['repacking_charges']; } ?>">
                          </div>
                          <div class="col">
                            <label>Ice Charges</label>
                            <input type="number" name="ice_charges" class="form-control inpv2 mb-2" value="<?php if(!empty($updatedata['ice_charges'])){ echo $updatedata['ice_charges']; } ?>">
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                          </div>
                          <div class="col mt-4">
                            <button type="button" class="btn btn-secondary" data-bs-toggle="modal">Cancel</button>
                            <button type="submit" name="updatetotalcharges" class="btn btn-warning">Update</button>
                          </div>
                        </div>
                      </div>
                    </form>
                    </div>
                  </div>
                </div>
                <!-- Add Modal -->
                <?php
                $no++;
                }
                 ?>
              </table>
            </div>
            <div class="repackingcharges hide">
              <table class="table table-striped table-bordered table-hover">
                <tr>
                  <th>Id</th>
                  <th>Date</th>
                  <th>Description</th>
                  <th>Sheet</th>
                  <th>Plastic</th>
                  <th>Price</th>
                  <th>Amount</th>
                  <th>Total Charges</th>
                </tr>
                <?php
                $repackingdatas = $query->selectall('mslrepacking');
                foreach ($repackingdatas as $repackingdata) {
                 ?>
                 <tr>
                   <td><?php echo $repackingdata['id']; ?></td>
                   <td><?php echo date('d-m-Y', strtotime($repackingdata['date'])); ?></td>
                   <td><?php echo $repackingdata['description']; ?></td>
                   <td><?php if($repackingdata['sheet'] != '0'){ echo $repackingdata['sheet']; }; ?></td>
                   <td><?php if($repackingdata['plastic'] != '0'){ echo $repackingdata['plastic']; }; ?></td>
                   <td><?php echo $repackingdata['price']; ?></td>
                   <td><?php echo $repackingdata['amount']; ?></td>
                   <td><?php echo $repackingdata['total_charges']; ?></td>
                 </tr>
                <?php
                }
                ?>
              </table>
            </div>
            <div class="remainingstock hide">
              <table class="table table-hover table-striped table-bordered">
                <tr>
                  <th>In Date</th>
                  <th>Out Date</th>
                  <th>Fish Name</th>
                  <th>Mc</th>
                  <th>Total Mc</th>
                  <th>Kg</th>
                  <th>Balance Kg</th>
                </tr>
                <?php
                $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT item_id) FROM mslstock");
                $commonditycountstmt->execute();
                $commonditycountdatas = $commonditycountstmt->fetchColumn();
                for ($i=0; $i < $commonditycountdatas; $i++) {
                  $commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM mslstock");
                  $commonditystmt->execute();
                  $commonditydata = $commonditystmt->fetchall();
                  $commondity_id = $commonditydata[$i]['item_id'];

                $hhkstockstmt = $pdo->prepare("SELECT * FROM mslstock WHERE item_id='$commondity_id'");
                $hhkstockstmt->execute();
                $hhkstockdatas = $hhkstockstmt->fetchall();
                foreach ($hhkstockdatas as $hhkstockdata) {
                  $item_id = $hhkstockdata['item_id'];
                  $commonditydata = $query->select('item', $item_id, 'item_id');
                  ?>
                <tr>
                  <td><?php if($hhkstockdata['indate'] != "0000-00-00"){ echo date('d-m-Y', strtotime($hhkstockdata['indate'])); }; ?></td>
                  <td><?php if($hhkstockdata['outdate'] != "0000-00-00"){ echo date('d-m-Y', strtotime($hhkstockdata['outdate'])); }; ?></td>
                  <td><?php echo $commonditydata['item_name']; ?></td>
                  <td><?php echo $hhkstockdata['mc']; ?></td>
                  <td><?php echo $hhkstockdata['total_mc']; ?></td>
                  <td><?php echo $hhkstockdata['kg']; ?></td>
                  <td><?php echo $hhkstockdata['total_kg']; ?></td>
                </tr>
                <?php
                  }
                }
                 ?>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Add Modal -->
    <div class="modal fade" id="newcharges" aria-labelledby="newcharges">
      <div class="modal-dialog">
        <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
          <div class="modal-header bg-secondary text-light">
            <h1 class="modal-title fs-5">New Charges</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <form action="msldaterangecharges.php" method="post">
            <div class="modal-body">
              <div class="row" style="margin-bottom: 10px !important;">
                <div class="col">
                  <label style="font-weight: bold;">In Date</label>
                  <input type="date" name="indate" class="form-control inpv2">
                </div>
                <div class="col">
                  <label style="font-weight: bold;">Out Date</label>
                  <input type="date" name="outdate" class="form-control inpv2">
                </div>
              </div>
              <div class="row" style="margin-bottom: 10px !important;">
                <div class="col">
                  <label>Fish Name</label>
                  <select class="form-control inpv2" name="item_id">
                    <?php
                    $commonditydatas = $query->selectall('item');
                    foreach ($commonditydatas as $commonditydata) {
                      ?>
                      <option value="<?php echo $commonditydata['item_id']; ?>"><?php echo $commonditydata['item_name']; ?></option>
                      <?php
                      }
                     ?>
                  </select>
                </div>
                <div class="col">
                  <label style="font-weight: bold;">Mc</label>
                  <input type="number" name="mc" class="form-control inpv2">
                </div>
              </div>
              <div class="row" style="margin-bottom: 10px !important;">
                <div class="col">
                  <label style="font-weight: bold;">Kg</label>
                  <input type="text" name="kg" class="form-control inpv2">
                </div>
                <div class="col">
                  <label style="font-weight: bold;">Cold Store Rate</label>
                  <input type="text" name="coldstorerate" class="form-control inpv2">
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <label style="font-weight: bold;">Freezing Rate</label>
                  <input type="text" name="freezingrate" class="form-control inpv2">
                </div>
                <div class="col">
                  <label style="font-weight: bold;">Export Handling Rate</label>
                  <input type="text" name="exportrate" class="form-control inpv2">
                </div>
              </div>
              <div class="row">
                <div class="col mt-2">
                  <label>Loose Mc</label>
                  <input type="number" name="loose_mc" class="form-control inpv2">
                </div>
                <div class="col mt-2">
                  <label>Loose Kg</label>
                  <input type="text" name="loose_kg" class="form-control inpv2">
                </div>
              </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-success" name="add">Add</button>
          </div>
        </form>
        </div>
      </div>
    </div>
    <!-- Add Modal -->
    <!-- Add Modal -->
    <div class="modal fade" id="addpayment">
      <div class="modal-dialog">
        <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
          <div class="modal-header bg-secondary text-light">
            <h1 class="modal-title fs-5">Add Payment</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <form action="msldaterangecharges.php" method="post">
          <div class="modal-body">
            <div class="row">
              <div class="col">
                <label>Payment Date</label>
                <input type="date" name="payment_date" class="form-control inpv2 mb-2">
              </div>
              <div class="col">
                <label>Payment Amount</label>
                <input type="number" name="payment_amount" class="form-control inpv2 mb-2">
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-toggle="modal">Cancel</button>
            <button type="submit" name="paymentbtn" class="btn btn-success">Add</button>
          </div>
        </form>
        </div>
      </div>
    </div>
    <!-- Add Modal -->
    <!-- Add Modal -->
    <div class="modal fade" id="repackingcharges">
      <div class="modal-dialog">
        <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
          <div class="modal-header bg-secondary text-light">
            <h1 class="modal-title fs-5">Repacking Charges</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <form action="msldaterangecharges.php" method="post">
          <div class="modal-body">
            <div class="row">
              <div class="col">
                <label>Date</label>
                <input type="date" name="date" class="form-control inpv2 mb-2">
              </div>
              <div class="col">
                <label>Description</label>
                <input type="text" name="description" class="form-control inpv2 mb-2">
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label>Plastic</label>
                <input type="text" name="plastic" class="form-control inpv2 mb-2">
              </div>
              <div class="col">
                <label>Sheet</label>
                <input type="number" name="sheet" class="form-control inpv2 mb-2">
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label>Price</label>
                <input type="number" name="price" class="form-control inpv2 mb-2">
              </div>
              <div class="col mt-4">
                <button type="button" class="btn btn-secondary" data-bs-toggle="modal">Cancel</button>
                <button type="submit" name="repackingadd" class="btn btn-success">Add</button>
              </div>
            </div>
          </div>
        </form>
        </div>
      </div>
    </div>
    <!-- Add Modal -->
    <!-- Add Modal -->
    <div class="modal fade" id="newstock">
      <div class="modal-dialog">
        <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
          <div class="modal-header bg-secondary text-light">
            <h1 class="modal-title fs-5">Add New Stock</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <form action="msldaterangecharges.php" method="post">
          <div class="modal-body">
            <div class="row">
              <div class="col">
                <label>In Date</label>
                <input type="date" name="indate" class="form-control inpv2 mb-2">
              </div>
              <div class="col">
                <label>Fish Name</label>
                <select class="form-control inpv2" name="item_id">
                  <?php
                  $commonditydatas = $query->selectall('item');
                  foreach ($commonditydatas as $commonditydata) {
                    ?>
                    <option value="<?php echo $commonditydata['item_id']; ?>"><?php echo $commonditydata['item_name']; ?></option>
                    <?php
                    }
                   ?>
                </select>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label>Mc</label>
                <input type="number" name="mc" class="form-control inpv2 mb-2">
              </div>
              <div class="col">
                <label>Kg</label>
                <input type="text" name="kg" class="form-control inpv2 mb-2">
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-toggle="modal">Cancel</button>
            <button type="submit" name="addstockbtn" class="btn btn-success">Add</button>
          </div>
        </form>
        </div>
      </div>
    </div>
    <!-- Add Modal -->
    <script type="text/javascript">
    <?php
      if($_SESSION['tabs'] == "coldstore"){
        echo "showcoldstore();";
      }elseif($_SESSION['tabs'] == "labour"){
        echo "showlabour();";
      }elseif($_SESSION['tabs'] == "processing"){
        echo "showprocessing();";
      }elseif($_SESSION['tabs'] == "repacking"){
        echo "showrepacking();";
      }elseif($_SESSION['tabs'] == "totalcharges"){
        echo "showtotal();";
      }elseif($_SESSION['tabs'] == "remainingstock"){
        echo "showstock();";
      }
    ?>
    function showtotal(){
      document.querySelector(".addtotalcharges").classList.remove("hide");
      document.querySelector(".addnewcharges").classList.add("hide");
      document.querySelector(".addrepackingcharges").classList.add('hide');
      document.querySelector(".addnewstock").classList.add("hide");
      document.querySelector(".totallink").classList.add('color');
      document.querySelector(".totalcharges").classList.remove('hide');
      document.querySelector(".coldstorelink").classList.remove('color');
      document.querySelector(".coldstorecharges").classList.add('hide');
      document.querySelector(".labourlink").classList.remove('color');
      document.querySelector(".labourcharges").classList.add('hide');
      document.querySelector(".processinglink").classList.remove('color');
      document.querySelector(".processingcharges").classList.add('hide');
      document.querySelector(".repackinglink").classList.remove('color');
      document.querySelector(".repackingcharges").classList.add('hide');
    }
    function showcoldstore(){
      document.querySelector(".addtotalcharges").classList.add("hide");
      document.querySelector(".addnewcharges").classList.remove("hide");
      document.querySelector(".addrepackingcharges").classList.add('hide');
      document.querySelector(".addnewstock").classList.add("hide");
      document.querySelector(".coldstorelink").classList.add('color');
      document.querySelector(".coldstorecharges").classList.remove('hide');
      document.querySelector(".labourlink").classList.remove('color');
      document.querySelector(".labourcharges").classList.add('hide');
      document.querySelector(".processinglink").classList.remove('color');
      document.querySelector(".processingcharges").classList.add('hide');
      document.querySelector(".totallink").classList.remove('color');
      document.querySelector(".totalcharges").classList.add('hide');
      document.querySelector(".repackinglink").classList.remove('color');
      document.querySelector(".repackingcharges").classList.add('hide');
    }
    function showlabour(){
      document.querySelector(".addtotalcharges").classList.add("hide");
      document.querySelector(".addnewcharges").classList.remove("hide");
      document.querySelector(".addrepackingcharges").classList.add('hide');
      document.querySelector(".addnewstock").classList.add("hide");
      document.querySelector(".coldstorelink").classList.remove('color');
      document.querySelector(".coldstorecharges").classList.add('hide');
      document.querySelector(".labourlink").classList.add('color');
      document.querySelector(".labourcharges").classList.remove('hide');
      document.querySelector(".processinglink").classList.remove('color');
      document.querySelector(".processingcharges").classList.add('hide');
      document.querySelector(".totallink").classList.remove('color');
      document.querySelector(".totalcharges").classList.add('hide');
      document.querySelector(".repackinglink").classList.remove('color');
      document.querySelector(".repackingcharges").classList.add('hide');
    }
    function showprocessing(){
      document.querySelector(".addtotalcharges").classList.add("hide");
      document.querySelector(".addnewcharges").classList.remove("hide");
      document.querySelector(".addrepackingcharges").classList.add('hide');
      document.querySelector(".addnewstock").classList.add("hide");
      document.querySelector(".coldstorelink").classList.remove('color');
      document.querySelector(".coldstorecharges").classList.add('hide');
      document.querySelector(".labourlink").classList.remove('color');
      document.querySelector(".labourcharges").classList.add('hide');
      document.querySelector(".processinglink").classList.add('color');
      document.querySelector(".processingcharges").classList.remove('hide');
      document.querySelector(".totallink").classList.remove('color');
      document.querySelector(".totalcharges").classList.add('hide');
      document.querySelector(".repackinglink").classList.remove('color');
      document.querySelector(".repackingcharges").classList.add('hide');
    }
    function showrepacking(){
      document.querySelector(".addtotalcharges").classList.add("hide");
      document.querySelector(".addnewcharges").classList.add("hide");
      document.querySelector(".addrepackingcharges").classList.remove('hide');
      document.querySelector(".addnewstock").classList.add("hide");
      document.querySelector(".coldstorelink").classList.remove('color');
      document.querySelector(".coldstorecharges").classList.add('hide');
      document.querySelector(".labourlink").classList.remove('color');
      document.querySelector(".labourcharges").classList.add('hide');
      document.querySelector(".processinglink").classList.remove('color');
      document.querySelector(".processingcharges").classList.add('hide');
      document.querySelector(".totallink").classList.remove('color');
      document.querySelector(".totalcharges").classList.add('hide');
      document.querySelector(".repackinglink").classList.add('color');
      document.querySelector(".repackingcharges").classList.remove('hide');
    }
    function showstock(){
      document.querySelector(".addtotalcharges").classList.add("hide");
      document.querySelector(".addnewcharges").classList.add("hide");
      document.querySelector(".addrepackingcharges").classList.add('hide');
      document.querySelector(".addnewstock").classList.remove("hide");
      document.querySelector(".coldstorelink").classList.remove('color');
      document.querySelector(".coldstorecharges").classList.add('hide');
      document.querySelector(".labourlink").classList.remove('color');
      document.querySelector(".labourcharges").classList.add('hide');
      document.querySelector(".processinglink").classList.remove('color');
      document.querySelector(".processingcharges").classList.add('hide');
      document.querySelector(".totallink").classList.remove('color');
      document.querySelector(".totalcharges").classList.add('hide');
      document.querySelector(".repackinglink").classList.remove('color');
      document.querySelector(".repackingcharges").classList.add('hide');
      document.querySelector(".remainingstocklink").classList.add('color');
      document.querySelector(".remainingstock").classList.remove('hide');
    }
    </script>
    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
