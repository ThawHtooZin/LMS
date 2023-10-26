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
    <?php
    if(isset($_POST['add'])){
      $indate = $_POST['indate'];
      $outdate = $_POST['outdate'];
      $commondity_id = $_POST['commondity_id'];
      $mc = $_POST['mc'];
      $kg = $_POST['kg'];
      $coldstorerate = $_POST['coldstorerate'];
      $labourrate = $_POST['labourrate'];
      $processingrate = $_POST['processingrate'];
      $pcharges = $_POST['processingcharges'];
      $query->addcoldstore($indate, $outdate, $commondity_id, $mc, $kg, $coldstorerate, $labourrate, $processingrate, $pcharges);
    }

    if(isset($_POST['updatetotalcharges'])){
      $id = $_POST['id'];
      $repacking_charges = $_POST['repacking_charges'];
      $ice_charges = $_POST['ice_charges'];
      $ot_charges = $_POST['ot_charges'];
      $query->updatecoldstoretotal($id, $repacking_charges, $ice_charges, $ot_charges);
    }

    if(isset($_POST['paymentbtn'])){
      $payment_date = $_POST['payment_date'];
      $payment_amount = $_POST['payment_amount'];

      $query->paytotalcharges($payment_date, $payment_amount);
    }

    if(isset($_POST['repackingadd'])){
      $date = $_POST['date'];
      $in_mc = $_POST['in_mc'];
      $in_kg = $_POST['in_kg'];
      $out_mc = $_POST['out_mc'];
      $out_kg = $_POST['out_kg'];
      $rate = $_POST['rate'];

      $query->addrepacking($date, $in_mc, $in_kg, $out_mc, $out_kg, $rate);
    }

    if(isset($_POST['addstockbtn'])){
      $indate = $_POST['indate'];
      $commondity_id = $_POST['commondity_id'];
      $mc = $_POST['mc'];
      $kg = $_POST['kg'];

      $query->addnewstock($indate, $commondity_id, $mc, $kg);
    }

    if(isset($_POST['update'])){
      $indate = $_POST['indate'];
      $outdate = $_POST['outdate'];
      $commondity_id = $_POST['commondity_id'];
      $mc = $_POST['mc'];
      $kg = $_POST['kg'];
      $coldstorerate = $_POST['coldstorerate'];
      $labourrate = $_POST['labourrate'];
      $processingrate = $_POST['processingrate'];
      $updateid = $_POST['updateid'];
      $query->updatecoldstore($indate, $outdate, $commondity_id,  $mc, $kg, $coldstorerate, $labourrate, $processingrate, $updateid);
    }

     ?>
    <div class="row">
      <div class="sidebarcol" id="sidebar">
        <?php
        include 'sidebar.php';
        ?>
      </div>
      <div class="contentcol" id="content">
        <?php require 'navbar.php'; ?>
        <div class="card">
          <div class="card-header bg-info text-light">
            <h4 class="d-inline">HHK Date Range Cold Store Charges</h4>
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
                <button type="submit" class="pb-2 pt-2 ps-4 pe-4 text-dark remainingstocklink" style="text-decoration:none; border:none;" name="remainingstockbtn">Remaining Stock</button>
                <button type="submit" class="pb-2 pt-2 ps-4 pe-4 text-dark coldstorelink" style="text-decoration:none; border:none;" name="coldstorebtn">Cold Store Charges</button>
                <button type="submit" class="pb-2 pt-2 ps-4 pe-4 text-dark labourlink" style="text-decoration:none; border:none;" name="labourbtn">Labour Charges</button>
                <button type="submit" class="pb-2 pt-2 ps-4 pe-4 text-dark processinglink" style="text-decoration:none; border:none;" name="processingbtn">Processing Charges</button>
                <button type="submit" class="pb-2 pt-2 ps-4 pe-4 text-dark repackinglink" style="text-decoration:none; border:none;" name="repackingbtn">Repacking Charges</button>
                <button type="submit" class="pb-2 pt-2 ps-4 pe-4 text-dark totallink" style="text-decoration:none; border:none;" name="totalchargesbtn">Total Charges</button>
              </form>
            </div>
            <hr>
            <div class="coldstorecharges hide">
                <table class="table table-striped table-bordered table-hover">
                  <tr>
                    <th class="text-center">Id</th>
                    <th class="text-center">In Date</th>
                    <th class="text-center">Out Date</th>
                    <th class="text-center">Commondity</th>
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

                  $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT commondity_id) FROM coldstore");
                  $commonditycountstmt->execute();
                  $commonditycountdatas = $commonditycountstmt->fetchColumn();
                  $idd = 0;
                  for ($i=0; $i < $commonditycountdatas; $i++) {
                    $commonditystmt = $pdo->prepare("SELECT DISTINCT commondity_id FROM coldstore");
                    $commonditystmt->execute();
                    $commonditydata = $commonditystmt->fetchall();
                    $commondity_id = $commonditydata[$i]['commondity_id'];

                  $stmt = $pdo->prepare("SELECT * FROM coldstore WHERE commondity_id='$commondity_id'");
                  $stmt->execute();
                  $datas = $stmt->fetchall();
                  foreach ($datas as $data) {
                    $idd++;
                    $item_id = $data['commondity_id'];
                    $commonditydata = $query->select('category', $item_id, 'category_id');

                    $comstmt = $pdo->prepare("SELECT * FROM coldstore WHERE commondity_id='$commondity_id' GROUP BY commondity_id");
                    $comstmt->execute();
                    $comdatas = $comstmt->fetch(PDO::FETCH_ASSOC);
                    $item_id = $comdatas['commondity_id'];
                    $commonstmt = $pdo->prepare("SELECT id FROM coldstore WHERE commondity_id='$item_id'");
                    $commonstmt->execute();
                    $commondata = $commonstmt->fetch(PDO::FETCH_ASSOC);
                  ?>
                  <!-- <tr style="<?php //if($commonditydata['category_name'] == "IQF"){echo "background-color: #6ef757 !important;";}elseif($commonditydata['category_name'] == "Block"){echo "background-color: #f5764c !important;";}elseif($commonditydata['category_name'] == "Pujanut"){echo "background-color: lightblue !important;";} ?>"> -->
                  <tr>
                    <td><?php echo $idd; ?></td>
                    <td><?php echo date('d-m-Y', strtotime($data['indate'])); ?></td>
                    <td><?php echo date('d-m-Y', strtotime($data['outdate'])); ?></td>
                    <td><?php echo $commonditydata['category_name']; ?></td>
                    <td><?php echo $data['mc']; ?></td>
                    <td><?php echo $data['total_mc']; ?></td>
                    <td><?php echo $data['kg']; ?></td>
                    <td><?php echo $data['total_kg']; ?></td>
                    <td><?php echo $data['day']; ?></td>
                    <td><?php echo $data['rate']; ?></td>
                    <td><?php echo $data['charges']; ?></td>
                    <td><?php echo $data['total_charges']; ?></td>
                    <td><a href="daterangecharges.php" style="<?php if($data['id'] == $commondata['id']){ echo "display:none;"; } ?>" class="btn btn-warning text-light btn-sm" data-bs-toggle="modal" data-bs-target="#coldstoreupdatemodal<?php echo $data['id']; ?>">
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
                          <form action="daterangecharges.php" method="post">
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
                                <label>Commondity</label>
                                <select class="form-control inpv2" name="commondity_id">
                                  <?php
                                  $commonditydatas = $query->selectall('category');
                                  foreach ($commonditydatas as $commonditydata) {
                                    ?>
                                    <option value="<?php echo $commonditydata['category_id']; ?>"><?php echo $commonditydata['category_name']; ?></option>
                                    <?php
                                  }
                                  ?>
                                </select>
                              </div>
                              <div class="col">
                                <label style="font-weight: bold;">Cold Store Rate</label>
                                <input type="text" name="coldstorerate" class="form-control inpv2" value="<?php echo $coldstoredataup['rate'];  ?>">
                              </div>
                            </div>
                            <div class="row">
                              <div class="col">
                                <label style="font-weight: bold;">Labour Rate</label>
                                <input type="text" name="labourrate" class="form-control inpv2" value="<?php echo $labourdataup['rate'];  ?>">
                              </div>
                            <div class="col">
                              <label style="font-weight: bold;">Processing Rate</label>
                              <input type="text" name="processingrate" class="form-control inpv2" value="<?php echo $processingdataup['rate'];  ?>">
                            </div>
                            </div>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-warning" name="update">Update</button>
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
                  <th class="text-center">Commondity</th>
                  <th class="text-center">Mc</th>
                  <th class="text-center">Total Mc</th>
                  <th class="text-center">Kg</th>
                  <th class="text-center">Total Kg</th>
                  <th class="text-center">Rate</th>
                  <th class="text-center">Charges</th>
                  <th class="text-center">Total Charges</th>
                </tr>
                <?php
                $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT commondity_id) FROM labour");
                $commonditycountstmt->execute();
                $commonditycountdatas = $commonditycountstmt->fetchColumn();
                $idd = 0;
                for ($i=0; $i < $commonditycountdatas; $i++) {
                  $commonditystmt = $pdo->prepare("SELECT DISTINCT commondity_id FROM labour");
                  $commonditystmt->execute();
                  $commonditydata = $commonditystmt->fetchall();
                  $commondity_id = $commonditydata[$i]['commondity_id'];

                $labourstmt = $pdo->prepare("SELECT * FROM labour WHERE commondity_id='$commondity_id'");
                $labourstmt->execute();
                $labourdatas = $labourstmt->fetchall();
                foreach ($labourdatas as $labourdata) {
                  $idd++;
                  $item_id = $labourdata['commondity_id'];
                  $commonditydata = $query->select('category', $item_id, 'category_id');
                ?>
                <tr>
                  <td><?php echo $idd; ?></td>
                  <td><?php echo date('d-m-Y', strtotime($labourdata['indate']));  ?></td>
                  <td><?php echo date('d-m-Y', strtotime($labourdata['outdate'])); ?></td>
                  <td><?php echo $commonditydata['category_name']; ?></td>
                  <td><?php echo $labourdata['mc']; ?></td>
                  <td><?php echo $labourdata['total_mc']; ?></td>
                  <td><?php echo $labourdata['kg']; ?></td>
                  <td><?php echo $labourdata['total_kg']; ?></td>
                  <td><?php echo $labourdata['rate']; ?></td>
                  <td><?php echo $labourdata['charges']; ?></td>
                  <td><?php echo $labourdata['total_charges']; ?></td>
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
                  <th class="text-center">Commondity</th>
                  <th class="text-center">Mc</th>
                  <th class="text-center">Total Mc</th>
                  <th class="text-center">Kg</th>
                  <th class="text-center">Total Kg</th>
                  <th class="text-center">Rate</th>
                  <th class="text-center">Charges</th>
                  <th class="text-center">Total Charges</th>
                </tr>
                <?php
                $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT commondity_id) FROM processing");
                $commonditycountstmt->execute();
                $commonditycountdatas = $commonditycountstmt->fetchColumn();
                $idd = 0;
                for ($i=0; $i < $commonditycountdatas; $i++) {
                  $commonditystmt = $pdo->prepare("SELECT DISTINCT commondity_id FROM processing");
                  $commonditystmt->execute();
                  $commonditydata = $commonditystmt->fetchall();
                  $commondity_id = $commonditydata[$i]['commondity_id'];

                $processingstmt = $pdo->prepare("SELECT * FROM processing WHERE commondity_id='$commondity_id'");
                $processingstmt->execute();
                $processingdatas = $processingstmt->fetchall();
                foreach ($processingdatas as $processingdata) {
                  $idd++;
                  $item_id = $processingdata['commondity_id'];
                  $commonditydata = $query->select('category', $item_id, 'category_id');
                ?>
                <tr>
                  <td><?php echo $idd; ?></td>
                  <td><?php echo date('d-m-Y', strtotime($processingdata['indate']));  ?></td>
                  <td><?php echo date('d-m-Y', strtotime($processingdata['outdate'])); ?></td>
                  <td><?php echo $commonditydata['category_name']; ?></td>
                  <td><?php echo $processingdata['mc']; ?></td>
                  <td><?php echo $processingdata['total_mc']; ?></td>
                  <td><?php echo $processingdata['kg']; ?></td>
                  <td><?php echo $processingdata['total_kg']; ?></td>
                  <td><?php echo $processingdata['rate']; ?></td>
                  <td><?php echo $processingdata['charges']; ?></td>
                  <td><?php echo $processingdata['total_charges']; ?></td>

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
                  <th class="text-center">Commondity</th>
                  <th class="text-center">Total Cold Store Charges</th>
                  <th class="text-center">Total Labour Charges</th>
                  <th class="text-center">Total Processing Charges</th>
                  <th class="text-center">Repacking Charges</th>
                  <th class="text-center">Ice Charges</th>
                  <th class="text-center">OT Charges</th>
                  <th class="text-center">Total Charges</th>
                  <th class="text-center">Grand Total Charges</th>
                  <th class="text-center">Payment Date</th>
                  <th class="text-center">Payment Amount</th>
                  <th class="text-center">Balance Amount</th>
                  <th class="text-center">Remark</th>
                </tr>
                <?php
                $totalstmt = $pdo->prepare("SELECT * FROM total_charges");
                $totalstmt->execute();
                $totaldatas = $totalstmt->fetchall();
                $idd = 0;
                foreach ($totaldatas as $total_charges_data) {
                  $idd++;
                  $item_id = $total_charges_data['commondity_id'];
                  $commonditydata = $query->select('category', $item_id, 'category_id');
                ?>
                <tr data-bs-toggle="modal" data-bs-target="#updatetotalcharges<?php echo $total_charges_data['id']; ?>">
                  <td><?php echo $idd; ?></td>
                  <td><?php if(!empty($commonditydata['category_name'])){ echo $commonditydata['category_name'];} ; ?></td>
                  <td><?php if($total_charges_data['total_coldstore_charges'] != "0"){ echo $total_charges_data['total_coldstore_charges'];} ; ?></td>
                  <td><?php if($total_charges_data['total_labour_charges'] != "0"){ echo $total_charges_data['total_labour_charges'];} ; ?></td>
                  <td><?php if($total_charges_data['total_processing_charges'] != "0"){ echo $total_charges_data['total_processing_charges'];} ; ?></td>
                  <td><?php if($total_charges_data['repacking_charges'] != "0"){ echo $total_charges_data['repacking_charges'];} ; ?></td>
                  <td><?php if($total_charges_data['ice_charges'] != "0"){ echo $total_charges_data['ice_charges'];} ; ?></td>
                  <td><?php if($total_charges_data['ot_charges'] != "0"){ echo $total_charges_data['ot_charges'];} ; ?></td>
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
                      <form action="daterangecharges.php" method="post">
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
                            <label>Ot Charges</label>
                            <input type="number" name="ot_charges" class="form-control inpv2 mb-2" value="<?php if(!empty($updatedata['ot_charges'])){ echo $updatedata['ot_charges']; } ?>">
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
                }
                 ?>
              </table>
            </div>
            <div class="repackingcharges hide">
              <table class="table table-striped table-bordered table-hover">
                <tr>
                  <th>Id</th>
                  <th>Date</th>
                  <th>In MC</th>
                  <th>In Kg</th>
                  <th>Out MC</th>
                  <th>Out Kg</th>
                  <th>Diff MC</th>
                  <th>Diff Kg</th>
                  <th>Rate</th>
                  <th>Charges</th>
                  <th>Total Charges</th>
                </tr>
                <?php
                $repackingdatas = $query->selectall('repacking');
                $idd = 0;
                foreach ($repackingdatas as $repackingdata) {
                  $idd++;
                 ?>
                 <tr>
                   <td><?php echo $idd; ?></td>
                   <td><?php echo date('d-m-Y', strtotime($repackingdata['date'])); ?></td>
                   <td><?php echo $repackingdata['in_mc']; ?></td>
                   <td><?php echo $repackingdata['in_kg']; ?></td>
                   <td><?php echo $repackingdata['out_mc']; ?></td>
                   <td><?php echo $repackingdata['out_kg']; ?></td>
                   <td><?php echo $repackingdata['diff_mc']; ?></td>
                   <td><?php echo $repackingdata['diff_kg']; ?></td>
                   <td><?php echo $repackingdata['rate']; ?></td>
                   <td><?php echo $repackingdata['charges']; ?></td>
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
                  <th>Commondity</th>
                  <th>Mc</th>
                  <th>Total Mc</th>
                  <th>Kg</th>
                  <th>Balance Kg</th>
                </tr>
                <?php
                $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT commondity_id) FROM hhkstock");
                $commonditycountstmt->execute();
                $commonditycountdatas = $commonditycountstmt->fetchColumn();
                $idd = 0;
                for ($i=0; $i < $commonditycountdatas; $i++) {
                  $commonditystmt = $pdo->prepare("SELECT DISTINCT commondity_id FROM hhkstock");
                  $commonditystmt->execute();
                  $commonditydata = $commonditystmt->fetchall();
                  $commondity_id = $commonditydata[$i]['commondity_id'];

                $hhkstockstmt = $pdo->prepare("SELECT * FROM hhkstock WHERE commondity_id='$commondity_id'");
                $hhkstockstmt->execute();
                $hhkstockdatas = $hhkstockstmt->fetchall();
                foreach ($hhkstockdatas as $hhkstockdata) {
                  $idd++;
                  $item_id = $hhkstockdata['commondity_id'];
                  $commonditydata = $query->select('category', $item_id, 'category_id');
                  ?>
                <tr>
                  <td><?php if($hhkstockdata['indate'] != "0000-00-00"){ echo date('d-m-Y', strtotime($hhkstockdata['indate'])); }; ?></td>
                  <td><?php if($hhkstockdata['outdate'] != "0000-00-00"){ echo date('d-m-Y', strtotime($hhkstockdata['outdate'])); }; ?></td>
                  <td><?php echo $commonditydata['category_name']; ?></td>
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
          <form action="daterangecharges.php" method="post">
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
                <label>Commondity</label>
                <select class="form-control inpv2" name="commondity_id" id="commondity">
                  <?php
                  $commonditydatas = $query->selectall('category');
                  foreach ($commonditydatas as $commonditydata) {
                    ?>
                    <option value="<?php echo $commonditydata['category_id']; ?>"><?php echo $commonditydata['category_name']; ?></option>
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
                <label style="font-weight: bold;">Labour Rate</label>
                <input type="text" name="labourrate" class="form-control inpv2">
              </div>
            <div class="col">
              <div class="processingratediv">
                <label style="font-weight: bold;">Processing Rate</label>
                <input type="text" name="processingrate" class="form-control inpv2">
              </div>
              <div class="processingchargesdiv hide">
                <label style="font-weight: bold;">Processing Charges</label>
                <input type="number" name="processingcharges" class="form-control inpv2">
              </div>
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
          <form action="daterangecharges.php" method="post">
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
          <form action="daterangecharges.php" method="post">
          <div class="modal-body">
            <label>Date</label>
            <input type="date" name="date" class="form-control inpv2 mb-2">
            <div class="row">
              <div class="col">
                <label>In Mc</label>
                <input type="number" name="in_mc" class="form-control inpv2 mb-2">
              </div>
              <div class="col">
                <label>In Kg</label>
                <input type="text" name="in_kg" class="form-control inpv2 mb-2">
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label>Out Mc</label>
                <input type="number" name="out_mc" class="form-control inpv2 mb-2">
              </div>
              <div class="col">
                <label>Out Kg</label>
                <input type="text" name="out_kg" class="form-control inpv2 mb-2">
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label>Rate</label>
                <input type="text" name="rate" class="form-control inpv2 mb-2">
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
          <form action="daterangecharges.php" method="post">
          <div class="modal-body">
            <div class="row">
              <div class="col">
                <label>In Date</label>
                <input type="date" name="indate" class="form-control inpv2 mb-2">
              </div>
              <div class="col">
                <label>Commondity</label>
                <select class="form-control inpv2" name="commondity_id">
                  <?php
                  $commonditydatas = $query->selectall('category');
                  foreach ($commonditydatas as $commonditydata) {
                    ?>
                    <option value="<?php echo $commonditydata['category_id']; ?>"><?php echo $commonditydata['category_name']; ?></option>
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
      $("#commondity").change(function(){
        var commondity = $("#commondity").val();
        if(commondity.includes('B01') === true){
          $(".processingratediv").hide();
          $(".processingchargesdiv").show();
        }else{
          $(".processingratediv").show();
          $(".processingchargesdiv").hide();
        }
      });
    </script>
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
      }else{
        echo "showcoldstore();";
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
