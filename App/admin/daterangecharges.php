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

    if(isset($_POST['totaladd'])){
      $date = $_POST['date'];
      $total_coldstore_charges = $_POST['total_coldstore_charges'];
      $total_labour_charges = $_POST['total_labour_charges'];
      $total_processing_charges = $_POST['total_processing_charges'];
      $repacking_charges = $_POST['repacking_charges'];
      $ice_charges = $_POST['ice_charges'];
      $query->addcoldstoretotal($date, $total_coldstore_charges, $total_labour_charges, $total_processing_charges, $repacking_charges, $ice_charges);
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
            <h4 class="d-inline">Date Range Cold Store Charges</h4>
            <button type="submit" class="btn btn-success float-end addnewcharges" data-bs-toggle="modal" data-bs-target="#newcharges">Add New Charges</button>
            <button type="submit" class="btn btn-success float-end hide addtotalcharges" data-bs-toggle="modal" data-bs-target="#totalcharges">Add Total Charges</button>
          </div>
          <div class="card-body">
            <div class="text-center">
              <button class="pb-2 pt-2 ps-5 pe-5 text-dark coldstorelink" style="text-decoration:none; border:none;" onclick="showcoldstore()">Cold Store Charges</button>
              <button class="pb-2 pt-2 ps-5 pe-5 text-dark labourlink" style="text-decoration:none; border:none;" onclick="showlabour()">Labour Charges</button>
              <button class="pb-2 pt-2 ps-5 pe-5 text-dark processinglink" style="text-decoration:none; border:none;" onclick="showprocessing()">Processing Charges</button>
              <button class="pb-2 pt-2 ps-5 pe-5 text-dark totallink" style="text-decoration:none; border:none;" onclick="showtotal()">Total Charges</button>
            </div>
            <hr>
            <div class="coldstorecharges hide">
              <table class="table table-striped table-bordered table-hover">
                <tr>
                  <th class="text-center">Id</th>
                  <th class="text-center">In Date</th>
                  <th class="text-center">Out Date</th>
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

                $datastmt = $pdo->prepare("SELECT * FROM coldstore");
                $datastmt->execute();
                $datas = $datastmt->fetchall();
                foreach ($datas as $data) {
                ?>
                <tr>
                  <td><?php echo $data['id']; ?></td>
                  <td><?php echo $data['indate']; ?></td>
                  <td><?php echo $data['outdate']; ?></td>
                  <td><?php echo $data['mc']; ?></td>
                  <td><?php echo $data['total_mc']; ?></td>
                  <td><?php echo $data['kg']; ?></td>
                  <td><?php echo $data['total_kg']; ?></td>
                  <td><?php echo $data['day']; ?></td>
                  <td><?php echo $data['rate']; ?></td>
                  <td><?php echo $data['charges']; ?></td>
                  <td><?php echo $data['total_charges']; ?></td>
                  <td><a href="daterangecharges.php" class="btn btn-warning text-light btn-sm" data-bs-toggle="modal" data-bs-target="#coldstoreupdatemodal<?php echo $data['id']; ?>">
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
                 ?>
              </table>
            </div>
            <div class="labourcharges hide">
              <table class="table table-striped table-bordered table-hover">
                <tr>
                  <th class="text-center">Id</th>
                  <th class="text-center">In Date</th>
                  <th class="text-center">Out Date</th>
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
                $labourstmt = $pdo->prepare("SELECT * FROM labour");
                $labourstmt->execute();
                $labour = $labourstmt->fetchall();
                foreach ($labour as $labourdata) {
                ?>
                <tr>
                  <td><?php echo $labourdata['id']; ?></td>
                  <td><?php echo $labourdata['indate']; ?></td>
                  <td><?php echo $labourdata['outdate']; ?></td>
                  <td><?php echo $labourdata['mc']; ?></td>
                  <td><?php echo $labourdata['total_mc']; ?></td>
                  <td><?php echo $labourdata['kg']; ?></td>
                  <td><?php echo $labourdata['total_kg']; ?></td>
                  <td><?php echo $labourdata['rate']; ?></td>
                  <td><?php echo $labourdata['charges']; ?></td>
                  <td><?php echo $labourdata['total_charges']; ?></td>
                  <td><a href="daterangecharges.php" class="btn btn-warning text-light btn-sm" data-bs-toggle="modal" data-bs-target="#coldstoreupdatemodal<?php echo $data['id']; ?>">
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
                 ?>
              </table>
            </div>
            <div class="processingcharges hide">
              <table class="table table-striped table-bordered table-hover">
                <tr>
                  <th class="text-center">Id</th>
                  <th class="text-center">In Date</th>
                  <th class="text-center">Out Date</th>
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
                $processingstmt = $pdo->prepare("SELECT * FROM processing");
                $processingstmt->execute();
                $processing = $processingstmt->fetchall();
                foreach ($processing as $processingdata) {
                ?>
                <tr>
                  <td><?php echo $processingdata['id']; ?></td>
                  <td><?php echo $processingdata['indate']; ?></td>
                  <td><?php echo $processingdata['outdate']; ?></td>
                  <td><?php echo $processingdata['mc']; ?></td>
                  <td><?php echo $processingdata['total_mc']; ?></td>
                  <td><?php echo $processingdata['kg']; ?></td>
                  <td><?php echo $processingdata['total_kg']; ?></td>
                  <td><?php echo $processingdata['rate']; ?></td>
                  <td><?php echo $processingdata['charges']; ?></td>
                  <td><?php echo $processingdata['total_charges']; ?></td>
                  <td><a href="daterangecharges.php" class="btn btn-warning text-light btn-sm" data-bs-toggle="modal" data-bs-target="#coldstoreupdatemodal<?php echo $data['id']; ?>">
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
                 ?>
              </table>
            </div>
            <div class="totalcharges hide">
              <table class="table table-striped table-bordered table-hover">
                <tr style="font-size:13px;">
                  <th class="text-center">Id</th>
                  <th class="text-center">Date</th>
                  <th class="text-center">Total Cold Store Charges</th>
                  <th class="text-center">Total Labour Charges</th>
                  <th class="text-center">Total Processing Charges</th>
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
                $total_charges_datas = $query->selectall('total_charges');
                foreach ($total_charges_datas as $total_charges_data) {
                ?>
                <tr>
                  <td><?php echo $total_charges_data['id']; ?></td>
                  <td><?php echo $total_charges_data['date']; ?></td>
                  <td><?php echo $total_charges_data['total_coldstore_charges']; ?></td>
                  <td><?php echo $total_charges_data['total_labour_charges']; ?></td>
                  <td><?php echo $total_charges_data['total_processing_charges']; ?></td>
                  <td><?php echo $total_charges_data['repacking_charges']; ?></td>
                  <td><?php echo $total_charges_data['ice_charges']; ?></td>
                  <td><?php echo $total_charges_data['total_charges']; ?></td>
                  <td><?php echo $total_charges_data['grand_total_charges']; ?></td>
                  <td><?php if($total_charges_data['payment_date'] != "0000-00-00"){ echo $total_charges_data['payment_date']; } ; ?></td>
                  <td><?php if($total_charges_data['payment_amount'] != "0"){ echo $total_charges_data['payment_amount']; }; ?></td>
                  <td><?php if($total_charges_data['balance_amount'] != "0"){ echo $total_charges_data['balance_amount'];}; ?></td>
                  <td><?php if($total_charges_data['remark'] != "0"){ echo $total_charges_data['remark'];}; ?></td>
                </tr>
                <?php
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
                <label style="font-weight: bold;">Mc</label>
                <input type="number" name="mc" class="form-control inpv2">
              </div>
              <div class="col">
                <label style="font-weight: bold;">Kg</label>
                <input type="text" name="kg" class="form-control inpv2">
              </div>
            </div>
            <div class="row" style="margin-bottom: 10px !important;">
              <div class="col">
                <label style="font-weight: bold;">Cold Store Rate</label>
                <input type="text" name="coldstorerate" class="form-control inpv2">
              </div>
              <div class="col">
                <label style="font-weight: bold;">Labour Rate</label>
                <input type="text" name="labourrate" class="form-control inpv2">
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label style="font-weight: bold;">Processing Rate</label>
                <input type="text" name="processingrate" class="form-control inpv2">
              </div>
            <div class="col mt-4">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-success" name="add">Add</button>
              </div>
            </div>
          </div>
        </form>
        </div>
      </div>
    </div>
    <!-- Add Modal -->
    <!-- Add Modal -->
    <div class="modal fade" id="totalcharges">
      <div class="modal-dialog">
        <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
          <div class="modal-header bg-secondary text-light">
            <h1 class="modal-title fs-5">Total Charges</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <form action="daterangecharges.php" method="post">
          <div class="modal-body">
            <div class="row">
              <div class="col">
                <label style="font-weight:bold;">Date</label>
                <input type="date" name="date" class="form-control inpv2 mb-2">
              </div>
              <div class="col">
                <label style="font-weight:bold;">Total Cold Store Charges</label>
                <input type="number" name="total_coldstore_charges" class="form-control inpv2 mb-2" placeholder="Total Cold Store Charges">
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label style="font-weight:bold;">Total Labour Charges</label>
                <input type="number" name="total_labour_charges" class="form-control inpv2 mb-2" placeholder="Total Labour Charges">
              </div>
              <div class="col">
                <label style="font-weight:bold;">Total Processing Charges</label>
                <input type="number" name="total_processing_charges" class="form-control inpv2 mb-2" placeholder="Total Processing Charges">
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label style="font-weight:bold;">Repacking Charges</label>
                <input type="number" name="repacking_charges" class="form-control inpv2" placeholder="Repacking Charges">
              </div>
              <div class="col">
                <label style="font-weight:bold;">Ice Charges</label>
                <input type="number" name="ice_charges" class="form-control inpv2" placeholder="Ice Charges">
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-toggle="modal">Cancel</button>
              <button type="submit" name="totaladd" class="btn btn-success">Add</button>
            </div>
          </div>
        </form>
        </div>
      </div>
    </div>
    <!-- Add Modal -->
    <script type="text/javascript">
    showcoldstore();
    function showtotal(){
      document.querySelector(".addtotalcharges").classList.remove("hide");
      document.querySelector(".addnewcharges").classList.add("hide");
      document.querySelector(".totallink").classList.add('color');
      document.querySelector(".totalcharges").classList.remove('hide');
      document.querySelector(".coldstorelink").classList.remove('color');
      document.querySelector(".coldstorecharges").classList.add('hide');
      document.querySelector(".labourlink").classList.remove('color');
      document.querySelector(".labourcharges").classList.add('hide');
      document.querySelector(".processinglink").classList.remove('color');
      document.querySelector(".processingcharges").classList.add('hide');
    }
    function showcoldstore(){
      document.querySelector(".addtotalcharges").classList.add("hide");
      document.querySelector(".addnewcharges").classList.remove("hide");
      document.querySelector(".coldstorelink").classList.add('color');
      document.querySelector(".coldstorecharges").classList.remove('hide');
      document.querySelector(".labourlink").classList.remove('color');
      document.querySelector(".labourcharges").classList.add('hide');
      document.querySelector(".processinglink").classList.remove('color');
      document.querySelector(".processingcharges").classList.add('hide');
      document.querySelector(".totallink").classList.remove('color');
      document.querySelector(".totalcharges").classList.add('hide');
    }
    function showlabour(){
      document.querySelector(".addtotalcharges").classList.add("hide");
      document.querySelector(".addnewcharges").classList.remove("hide");
      document.querySelector(".coldstorelink").classList.remove('color');
      document.querySelector(".coldstorecharges").classList.add('hide');
      document.querySelector(".labourlink").classList.add('color');
      document.querySelector(".labourcharges").classList.remove('hide');
      document.querySelector(".processinglink").classList.remove('color');
      document.querySelector(".processingcharges").classList.add('hide');
      document.querySelector(".totallink").classList.remove('color');
      document.querySelector(".totalcharges").classList.add('hide');
    }
    function showprocessing(){
      document.querySelector(".addtotalcharges").classList.add("hide");
      document.querySelector(".addnewcharges").classList.remove("hide");
      document.querySelector(".coldstorelink").classList.remove('color');
      document.querySelector(".coldstorecharges").classList.add('hide');
      document.querySelector(".labourlink").classList.remove('color');
      document.querySelector(".labourcharges").classList.add('hide');
      document.querySelector(".processinglink").classList.add('color');
      document.querySelector(".processingcharges").classList.remove('hide');
      document.querySelector(".totallink").classList.remove('color');
      document.querySelector(".totalcharges").classList.add('hide');
    }
    </script>
    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
