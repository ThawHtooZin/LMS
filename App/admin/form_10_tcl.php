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

  if (isset($_POST['updatebutton'])) {
    $updateid = $_POST['upid'];
    $newdate = $_POST['update'];
    $upitem_id = $_POST['upitem_id'];
    //   $upsupplier_id = $_POST['upsupplier_id'];
    $upcountry = $_POST['upcountry'];
    //   $uptype = $_POST['uptype'];
    $upsize = $_POST['upsize'];
    $upmc = $_POST['upmc'];
    $upkg = $_POST['upkg'];
    $uppcs = $_POST['uppcs'];
    $uplooseinkg = $_POST['uploose_in_kg'];
    $uplooseinpcs = $_POST['uploose_in_pcs'];
    $uplooseoutkg = $_POST['uploose_out_kg'];
    $uplooseoutpcs = $_POST['uploose_out_pcs'];

    $query->updateform10tcl($updateid, $newdate, $upitem_id, $upcountry, $upsize, $upmc, $upkg, $uppcs, $uplooseinkg, $uplooseinpcs, $uplooseoutkg, $uplooseoutpcs);
  }

  if (isset($_POST['add'])) {
    $date = $_POST['date'];
    $item_id = $_POST['item_id'];
    //   $supplier_id = $_POST['supplier_id'];
    $country = $_POST['country'];
    //   $type = $_POST['type'];
    $size = $_POST['size'];
    $mc = $_POST['mc'];
    $kg = $_POST['kg'];
    $pcs = $_POST['pcs'];
    $looseinkg = $_POST['loose_in_kg'];
    $looseinpcs = $_POST['loose_in_pcs'];
    $looseoutkg = $_POST['loose_out_kg'];
    $looseoutpcs = $_POST['loose_out_pcs'];
    $cckg = $_POST['cc_kg'];
    $ccpcs = $_POST['cc_pcs'];
    $cutpiecekg = $_POST['cutpiece_kg'];
    $cutpiecepcs = $_POST['cutpiece_pcs'];
    $hhkkg = $_POST['hhk_kg'];
    $hhkpcs = $_POST['hhk_pcs'];
    $mslkg = $_POST['msl_kg'];
    $mslpcs = $_POST['msl_pcs'];
    $lanfishkg = $_POST['lanfish_kg'];
    $lanfishpcs = $_POST['lanfish_pcs'];

    $query->addform10tcl($date, $item_id, $country, $size, $mc, $kg, $pcs, $looseinkg, $looseinpcs, $looseoutkg, $looseoutpcs, $cckg, $ccpcs, $cutpiecekg, $cutpiecepcs, $hhkkg, $hhkpcs, $mslkg, $mslpcs, $lanfishkg, $lanfishpcs);
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
      <div class="card mt-1">
        <div class="card-header bg-warning text-secondary" style="padding:-10px;">
          <form action="" method="post">

            <b>Link Mark Limited (F-10) TCL</b>
            <?php if (!isset($_POST['view'])): ?>
              <button type="button" class="btn btn-success btn-sm float-end" data-bs-toggle="modal" data-bs-target="#addmodal">Add Form-10 Data</button>
            <?php endif; ?>
            <?php if (isset($_POST['view'])): ?>
              <a href="export.php?table_name=form_10_tcl&searchdate=<?= $_POST['searchdate']; ?>&searchcommondity=<?= $_POST['commondity']; ?>" name="export" class="btn btn-primary btn-sm float-end me-2">Export Excel</a>
            <?php endif; ?>
            <button type="submit" name="view" class="btn btn-secondary btn-sm float-end me-2">View</button>
            <select name="commondity" class="form-control inpv2 w-25 d-inline float-end me-2" style=" width: 12% !important; height: 27px !important; padding-top: 1.5px !important;">
              <option value="">Select Commondity</option>
              <?php
              $commonstmt = $pdo->prepare("SELECT DISTINCT item_id FROM form10stocktcl");
              $commonstmt->execute();
              $commondatas = $commonstmt->fetchall();
              foreach ($commondatas as $commondata) {
                $itemid = $commondata['item_id'];
                $item_name = $query->select('item', $itemid, 'item_id');
              ?>
                <option value="<?php echo $item_name['item_id']; ?>"><?php echo $item_name['item_name']; ?></option>
              <?php
              }
              ?>
            </select>
            <input type="date" name="searchdate" class="form-control inpv2 w-25 d-inline float-end me-2" style=" width: 12% !important; height: 27px !important; padding-top: 1.5px !important;">
          </form>
        </div>
        <div class="card-body">
          <table class="table table-hover table-striped table-bordered">
            <tr class="text-center">
              <th rowspan="2" style="padding-top:25px;">Date</th>
              <th rowspan="2" style="padding-top:25px;">Commondity</th>
              <!-- <th rowspan="2" style="padding-top:25px;">Country</th> -->
              <!-- <th rowspan="2" style="padding-top:25px;">Type</th> -->
              <th rowspan="2" style="padding-top:25px;">Size</th>
              <th colspan="4">Production</th>
              <th colspan="2">Loose In</th>
              <th colspan="2">Loose Out</th>
              <th colspan="2">CC Balance</th>
              <th colspan="2">လမ်းငါး</th>
              <th colspan="2">Cut Piece</th>
              <th colspan="2">HHK</th>
              <th colspan="2">MSL</th>
              <th>Total</th>
              <?php
              if (!isset($_POST['view'])) {
              ?>
                <th rowspan="2" style="padding-top:25px;">Action</th>
              <?php
              }
              ?>
              <?php
              if (isset($_POST['view'])) {
              ?>
                <th rowspan="2" style="padding-top:25px;">%</th>
              <?php
              }
              ?>
            </tr>
            <tr class="text-center">
              <th>PCS/Form-10</th>
              <th>MC</th>
              <th>KG</th>
              <th>Pcs</th>
              <th>Kg</th>
              <th>Pcs</th>
              <th>Kg</th>
              <th>Pcs</th>
              <th>Kg</th>
              <th>Pcs</th>
              <th>Kg</th>
              <th>Pcs</th>
              <th>Kg</th>
              <th>Pcs</th>
              <th>Kg</th>
              <th>Pcs</th>
              <th>Kg</th>
              <th>Pcs</th>
              <th>Kg</th>
            </tr>
            <?php
            if (isset($_POST['view']) && !empty($_POST['commondity']) && !empty($_POST['searchdate'])) {
              $commondity_id = $_POST['commondity'];
              $searchdate = $_POST['searchdate'];
              $stmt = $pdo->prepare("SELECT * FROM form10stocktcl WHERE item_id='$commondity_id' AND date='$searchdate'");
              $stmt->execute();
              $datas = $stmt->fetchall();
              foreach ($datas as $data) {
                $item_id = $data['item_id'];
                $commonditydata = $query->select('item', $item_id, 'item_id');
                $supplierid = $data['supplier_id'];
                $supplier_name = $query->select('acname', $supplierid, 'code_no');
            ?>
                <tr>
                  <td><?php echo date('d-m-Y', strtotime($data['date'])); ?></td>
                  <td><?php echo $commonditydata['item_name']; ?></td>
                  <!-- <td><?php echo $data['country']; ?></td> -->
                  <!-- <td><?php echo $data['type']; ?></td> -->
                  <td><?php echo $data['size']; ?></td>
                  <td><?php echo $data['pcsform10']; ?></td>
                  <td><?php echo $data['mc']; ?></td>
                  <td><?php echo $data['kg']; ?></td>
                  <td><?php echo $data['pcs']; ?></td>
                  <td><?php echo $data['looseinkg']; ?></td>
                  <td><?php echo $data['looseinpcs']; ?></td>
                  <td><?php echo $data['looseoutkg']; ?></td>
                  <td><?php echo $data['looseoutpcs']; ?></td>
                  <td><?php echo $data['cc_kg']; ?></td>
                  <td><?php echo $data['cc_pcs']; ?></td>
                  <td><?php echo $data['lanfish_kg']; ?></td>
                  <td><?php echo $data['lanfish_pcs']; ?></td>
                  <td><?php echo $data['cutpiece_kg']; ?></td>
                  <td><?php echo $data['cutpiece_pcs']; ?></td>
                  <td><?php echo $data['hhk_kg']; ?></td>
                  <td><?php echo $data['hhk_pcs']; ?></td>
                  <td><?php echo $data['msl_kg']; ?></td>
                  <td><?php echo $data['msl_pcs']; ?></td>
                  <?php
                  if (!isset($_POST['view'])) {
                  ?>
                    <td></td>
                  <?php
                  }
                  ?>
                  <td><?php echo round($data['total_kg'], 2); ?></td>
                  <td></td>
                </tr>
              <?php
              }

              $lastsearchdatestmt = $pdo->prepare("SELECT * FROM form10stocktcl WHERE date<'$searchdate' ORDER BY id DESC");
              $lastsearchdatestmt->execute();
              $lastsearchdate = $lastsearchdatestmt->fetch(PDO::FETCH_ASSOC);
              print_r($lastsearchdate);
              if (!empty($lastsearchdate['date'])) {
                $lastsearchdate = $lastsearchdate['date'];
              } else {
                $lastsearchdate = 0000 - 00 - 00;
              }
              $totalf7kgstmt = $pdo->prepare("SELECT SUM(kg) AS total_kg FROM form7stocktcl WHERE item_id='$commondity_id' AND date BETWEEN '$lastsearchdate' AND '$searchdate'");
              $totalf7kgstmt->execute();
              $totalf7kgdata = $totalf7kgstmt->fetch(PDO::FETCH_ASSOC);
              // echo $totalf7kgdata['total_kg'];
              $totalkgstmt = $pdo->prepare("SELECT SUM(total_kg) AS total_kg FROM form10stocktcl WHERE item_id='$commondity_id' AND date='$searchdate'");
              $totalkgstmt->execute();
              $totalkgdata = $totalkgstmt->fetch(PDO::FETCH_ASSOC);
              $result1 = round($totalkgdata['total_kg'], 2) - round($totalf7kgdata['total_kg'], 2);
              if (round($totalf7kgdata['total_kg']) == 0) {
                $percentage = "";
              } else {
                $result2 = $result1 / round($totalf7kgdata['total_kg'], 2);
                $percentage = $result2 * 100;
              }


              $form10pcsstmt = $pdo->prepare("SELECT SUM(pcsform10) AS total_form10_pcs FROM form10stocktcl WHERE item_id='$commondity_id' AND date='$searchdate'");
              $form10pcsstmt->execute();
              $form10pcsdata = $form10pcsstmt->fetch(PDO::FETCH_ASSOC);

              $totalkgstmt = $pdo->prepare("SELECT SUM(total_kg) AS total_kg FROM form10stocktcl WHERE item_id='$commondity_id' AND date='$searchdate'");
              $totalkgstmt->execute();
              $totalkgdata = $totalkgstmt->fetch(PDO::FETCH_ASSOC);
              $totalkgdata['total_kg'];
              $mcstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM form10stocktcl WHERE item_id='$commondity_id'");
              $mcstmt->execute();
              $mcdata = $mcstmt->fetch(PDO::FETCH_ASSOC);

              $kgstmt = $pdo->prepare("SELECT SUM(kg) AS kg FROM form10stocktcl WHERE item_id='$commondity_id'");
              $kgstmt->execute();
              $kgdata = $kgstmt->fetch(PDO::FETCH_ASSOC);
              ?>
              <tr>
                <td></td>
                <td style="font-weight:bold;">Total</td>
                <td></td>

                <td style="font-weight:bold;"><?php echo round($form10pcsdata['total_form10_pcs'], 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($mcdata['total_mc'], 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($kgdata['kg'], 2); ?></td>
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
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td style="font-weight:bold;"><?php echo round($totalkgdata['total_kg'], 2); ?></td>
                <?php
                if (!isset($_POST['view'])) {
                ?>
                  <td></td>
                <?php
                }
                ?>
                <?php
                if (isset($_POST['view'])) {
                ?>
                  <td style="font-weight:bold; <?php if (strpos(round($percentage, 2), '-') !== false) {
                                                  echo 'color:red;';
                                                } ?>"><?php echo round($percentage, 2) . "%"; ?></td>
                <?php
                }
                ?>
              </tr>

              <?php
            } else {
              $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT item_id) FROM form10stocktcl");
              $commonditycountstmt->execute();
              $commonditycountdatas = $commonditycountstmt->fetchColumn();
              for ($i = 0; $i < $commonditycountdatas; $i++) {
                if (isset($_POST['searchbtn2']) && !empty($_POST['type'])) {
                  $commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM form10stocktcl");
                } else {
                  $commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM form10stocktcl");
                }
                $commonditystmt->execute();
                $commonditydata = $commonditystmt->fetchall();
                $commondity_id = $commonditydata[$i]['item_id'];
                if (isset($_POST['searchbtn2']) && !empty($_POST['type'])) {
                  $stmt = $pdo->prepare("SELECT * FROM form10stocktcl AND item_id='$commondity_id'");
                  $stmt->execute();
                  $datas = $stmt->fetchall();
                } else {
                  $stmt = $pdo->prepare("SELECT * FROM form10stocktcl WHERE item_id='$commondity_id'");
                  $stmt->execute();
                  $datas = $stmt->fetchall();
                }
                foreach ($datas as $form10data) {
                  $item_id = $form10data['item_id'];
                  $commonditydata = $query->select('item', $item_id, 'item_id');
                  $supplierid = $form10data['supplier_id'];
                  $supplier_name = $query->select('acname', $supplierid, 'code_no');
              ?>
                  <tr>
                    <td><?php echo date('d-m-Y', strtotime($form10data['date'])); ?></td>
                    <td><?php echo $commonditydata['item_name']; ?></td>
                    <!-- <td><?php echo $form10data['country']; ?></td> -->
                    <!-- <td><?php echo $form10data['type']; ?></td> -->
                    <td><?php echo $form10data['size']; ?></td>
                    <td><?php echo $form10data['pcsform10']; ?></td>
                    <td><?php echo $form10data['mc']; ?></td>
                    <td><?php echo $form10data['kg']; ?></td>
                    <td><?php echo $form10data['pcs']; ?></td>
                    <td><?php echo $form10data['looseinkg']; ?></td>
                    <td><?php echo $form10data['looseinpcs']; ?></td>
                    <td><?php echo $form10data['looseoutkg']; ?></td>
                    <td><?php echo $form10data['looseoutpcs']; ?></td>
                    <td><?php echo $form10data['cc_kg']; ?></td>
                    <td><?php echo $form10data['cc_pcs']; ?></td>
                    <td><?php echo $form10data['lanfish_kg']; ?></td>
                    <td><?php echo $form10data['lanfish_pcs']; ?></td>
                    <td><?php echo $form10data['cutpiece_kg']; ?></td>
                    <td><?php echo $form10data['cutpiece_pcs']; ?></td>
                    <td><?php echo $form10data['hhk_kg']; ?></td>
                    <td><?php echo $form10data['hhk_pcs']; ?></td>
                    <td><?php echo $form10data['msl_kg']; ?></td>
                    <td><?php echo $form10data['msl_pcs']; ?></td>
                    <td><?php echo round($form10data['total_kg'], 2); ?></td>
                    <?php
                    if (!isset($_POST['view'])) {
                    ?>
                      <td>
                        <button type="submit" data-bs-toggle="modal" data-bs-target="#updatemodal<?= $form10data['id']; ?>" tabindex="-1" role="dialog" class="btn btn-warning text-light btn-sm d-inline" name="updatebutton"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                            <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                          </svg>
                        </button>
                      </td>
                    <?php
                    }
                    ?>
                    <?php
                    if (isset($_POST['view'])) {
                    ?>
                      <td><?php echo $form10data['percentage']; ?></td>
                      <!-- <td></td> -->
                    <?php
                    }
                    ?>
                  </tr>
                  <?php
                  $country = $form10data['country'];
                  $commondity_id = $form10data['item_id'];
                  ?>
                  <div class="modal fade" id="updatemodal<?= $form10data['id']; ?>" tabindex="-1" role="dialog">
                    <div class="modal-dialog" role="document">
                      <div class="modal-content" style="width: 650px !important; margin-top:70px !important;">
                        <div class="modal-header bg-warning text-light">
                          <h1 class="modal-title fs-5">Update Form 10 Data</h1>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                          <form action="" method="post">
                            <?php
                            $id = $form10data['id'];
                            $updatedata = $query->select('form10stocktcl', $id, 'id');

                            ?>
                            <input type="hidden" name="upid" value="<?php echo $form10data['id']; ?>">
                            <div class="modal-body">
                              <label>Date</label>
                              <input type="date" name="update" class="form-control inpv2 mb-2" value="<?php echo $updatedata['date']; ?>">

                              <div class="row">
                              </div>
                              <div class="row">
                                <div class="col">
                                  <label>Commondity</label>
                                  <select class="form-control inpv2 mb-2" name="upitem_id">
                                    <?php
                                    $form7commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM form7stocktcl");
                                    $form7commonditystmt->execute();
                                    $form7commonditydatas = $form7commonditystmt->fetchall();
                                    foreach ($form7commonditydatas as $form7commonditydata) {
                                      $item_id = $form7commonditydata['item_id'];
                                      $commonditydata = $query->select('item', $item_id, 'item_id');
                                    ?>
                                      <option value="<?php echo $commonditydata['item_id']; ?>" <?php if ($updatedata['item_id'] == $commonditydata['item_id']) {
                                                                                                  echo "selected";
                                                                                                }; ?>><?php echo $commonditydata['item_name']; ?></option>
                                    <?php
                                    }
                                    ?>
                                  </select>
                                </div>
                                <div class="col">
                                  <label>Country</label>
                                  <input type="text" name="upcountry" class="form-control inpv2 mb-2" value="<?php echo $updatedata['country']; ?>">
                                </div>
                              </div>
                              <div class="row">
                                <div class="col">
                                  <label>Size</label>
                                  <input type="text" name="upsize" class="form-control inpv2 mb-2" value="<?php echo $updatedata['size']; ?>">
                                </div>
                                <div class="col">
                                  <label>Mc</label>
                                  <input type="number" name="upmc" class="form-control inpv2 mb-2" value="<?php echo $updatedata['mc']; ?>">
                                </div>
                              </div>
                              <div class="row">
                                <div class="col">
                                  <label>Kg</label>
                                  <input type="text" name="upkg" class="form-control inpv2 mb-2" value="<?php echo $updatedata['kg']; ?>">
                                </div>
                                <div class="col">
                                  <label>Pcs</label>
                                  <input type="text" name="uppcs" class="form-control inpv2 mb-2" value="<?php echo $updatedata['pcs']; ?>">
                                </div>
                              </div>
                              <div class="row">
                                <div class="col">
                                  <label>Loose In Kg</label>
                                  <input type="text" name="uploose_in_kg" class="form-control inpv2 mb-2" value="<?php echo $updatedata['looseinkg']; ?>">
                                </div>
                                <div class="col">
                                  <label>Loose In Pcs</label>
                                  <input type="number" name="uploose_in_pcs" class="form-control inpv2 mb-2" value="<?php echo $updatedata['looseinpcs']; ?>">
                                </div>
                              </div>
                              <div class="row">
                                <div class="col">
                                  <label>Loose Out Kg</label>
                                  <input type="text" name="uploose_out_kg" class="form-control inpv2 mb-2" value="<?php echo $updatedata['looseoutkg']; ?>">
                                </div>
                                <div class="col">
                                  <label>Loose Out Pcs</label>
                                  <input type="number" name="uploose_out_pcs" class="form-control inpv2 mb-2" value="<?php echo $updatedata['looseoutpcs']; ?>">
                                </div>
                              </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                          <button type="submit" class="btn btn-success" name="updatebutton">Update</button>
                        </div>
                        </form>
                      </div>
                    </div>
                  </div>
                <?php
                }
                ?>
            <?php
              }
            }
            ?>
          </table>
        </div>
      </div>
    </div>
  </div>
  <div class="modal fade" id="addmodal">
    <div class="modal-dialog" role="document">
      <div class="modal-content" style="width: 650px !important; margin-top:70px !important;">
        <div class="modal-header bg-warning text-light">
          <h1 class="modal-title fs-5"> Add Form 10 Data</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form action="form_10_tcl.php" method="post">
            <div class="modal-body">
              <label>Date</label>
              <input type="date" name="date" class="form-control inpv2 mb-2">
              <div class="row">
                <div class="col">
                  <label>Commondity</label>
                  <select class="form-control inpv2 mb-2" name="item_id">
                    <?php
                    $form7commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM form7stocktcl");
                    $form7commonditystmt->execute();
                    $form7commonditydatas = $form7commonditystmt->fetchall();
                    foreach ($form7commonditydatas as $form7commonditydata) {
                      $item_id = $form7commonditydata['item_id'];
                      $commonditydata = $query->select('item', $item_id, 'item_id');
                    ?>
                      <option value="<?php echo $commonditydata['item_id']; ?>"><?php echo $commonditydata['item_name']; ?></option>
                    <?php
                    }
                    ?>
                  </select>
                </div>
                <div class="col">
                  <label>Country</label>
                  <input type="text" name="country" class="form-control inpv2 mb-2">
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <label>Size</label>
                  <input type="text" name="size" class="form-control inpv2 mb-2">
                </div>
                <div class="col">
                  <label>Mc</label>
                  <input type="number" name="mc" class="form-control inpv2 mb-2">
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <label>Kg</label>
                  <input type="text" name="kg" class="form-control inpv2 mb-2">
                </div>
                <div class="col">
                  <label>Pcs</label>
                  <input type="text" name="pcs" class="form-control inpv2 mb-2">
                </div>
              </div>
              <!-- Loose -->
              <div class="row">
                <div class="col-6">
                  <div class="row">
                    <div class="col">
                      <label>Loose Out Kg</label>
                      <input type="text" name="loose_out_kg" class="form-control inpv2 mb-2">
                    </div>
                    <div class="col">
                      <label>Loose Out Pcs</label>
                      <input type="number" name="loose_out_pcs" class="form-control inpv2 mb-2">
                    </div>
                  </div>
                </div>
                <div class="col-6">
                  <div class="row">
                    <div class="col">
                      <label>Loose In Kg</label>
                      <input type="text" name="loose_in_kg" class="form-control inpv2 mb-2">
                    </div>
                    <div class="col">
                      <label>Loose In Pcs</label>
                      <input type="number" name="loose_in_pcs" class="form-control inpv2 mb-2">
                    </div>
                  </div>
                </div>
              </div>
              <!-- Loose -->
              <!-- CC & Cut Piece -->
              <div class="row">
                <div class="col-6">
                  <div class="row">
                    <div class="col">
                      <label>CC_balance Kg</label>
                      <input type="text" name="cc_kg" class="form-control inpv2 mb-2">
                    </div>
                    <div class="col">
                      <label>CC_balance Pcs</label>
                      <input type="number" name="cc_pcs" class="form-control inpv2 mb-2">
                    </div>
                  </div>
                </div>
                <div class="col-6">
                  <div class="row">
                    <div class="col">
                      <label>Cut Piece Kg</label>
                      <input type="text" name="cutpiece_kg" class="form-control inpv2 mb-2">
                    </div>
                    <div class="col">
                      <label>Cut Piece Pcs</label>
                      <input type="number" name="cutpiece_pcs" class="form-control inpv2 mb-2">
                    </div>
                  </div>
                </div>
              </div>
              <!-- CC & Cut Piece -->
              <!-- Transfer -->
              <div class="row">
                <div class="col-6">
                  <div class="row">
                    <div class="col">
                      <label>HHK Kg</label>
                      <input type="text" name="hhk_kg" class="form-control inpv2 mb-2">
                    </div>
                    <div class="col">
                      <label>HKK Pcs</label>
                      <input type="number" name="hhk_pcs" class="form-control inpv2 mb-2">
                    </div>
                  </div>
                </div>
                <div class="col-6">
                  <div class="row">
                    <div class="col">
                      <label>MSL Kg</label>
                      <input type="text" name="msl_kg" class="form-control inpv2 mb-2">
                    </div>
                    <div class="col">
                      <label>MSL Pcs</label>
                      <input type="number" name="msl_pcs" class="form-control inpv2 mb-2">
                    </div>
                  </div>
                </div>
              </div>
              <!-- Transfer -->
              <!-- Lan Fish -->
              <div class="row">
                <div class="col-6">
                  <div class="row">
                    <div class="col">
                      <label>လမ်းငါး Kg</label>
                      <input type="text" name="lanfish_kg" class="form-control inpv2 mb-2">
                    </div>
                    <div class="col">
                      <label>လမ်းငါး Pcs</label>
                      <input type="number" name="lanfish_pcs" class="form-control inpv2 mb-2">
                    </div>
                  </div>
                </div>
                <div class="col-6 mt-4">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                  <button type="submit" class="btn btn-success" name="add">Add</button>
                </div>
              </div>
              <!-- Lan Fish -->
            </div>
        </div>
        </form>
      </div>
    </div>
  </div>
  <?php
  $bootstrap->javascript();
  ?>
</body>

</html>