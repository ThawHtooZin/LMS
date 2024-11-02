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
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<body>
  <?php

  if (isset($_POST['updatebutton'])) {
    $updateid = $_POST['upid'];
    $newdate = $_POST['update'];
    $upitem_id = $_POST['upitem_id'];
    $upfish_type = $_POST['upfish_type'];
    $upsupplier_id = $_POST['upsupplier_id'];
    $upcountry = $_POST['upcountry'];
    $uptype = $_POST['uptype'];
    $upsize = $_POST['upsize'];
    $upmc = $_POST['upmc'];
    $upkg = $_POST['upkg'];
    $uppcs = $_POST['uppcs'];
    $uplooseinkg = $_POST['uploose_in_kg'];
    $uplooseinpcs = $_POST['uploose_in_pcs'];
    $uplooseoutkg = $_POST['uploose_out_kg'];
    $uplooseoutpcs = $_POST['uploose_out_pcs'];

    $query->updateform10($updateid, $newdate, $upitem_id, $upfish_type, $upsupplier_id, $upcountry, $uptype, $upsize, $upmc, $upkg, $uppcs, $uplooseinkg, $uplooseinpcs, $uplooseoutkg, $uplooseoutpcs);
  }

  if (isset($_POST['add'])) {
    $date = $_POST['date'];
    $item_id = $_POST['item_id'];
    $fish_type = $_POST['fish_type'];
    $supplier_id = $_POST['supplier_id'];
    $country = $_POST['country'];
    $type = $_POST['type'];
    $size = $_POST['size'];
    $mc = $_POST['mc'];
    $kg = $_POST['kg'];
    $pcs = $_POST['pcs'];
    $looseinkg = $_POST['loose_in_kg'];
    $looseinpcs = $_POST['loose_in_pcs'];
    $looseoutkg = $_POST['loose_out_kg'];
    $looseoutpcs = $_POST['loose_out_pcs'];

    $query->addform10($date, $item_id,  $fish_type, $supplier_id, $country, $type, $size, $mc, $kg, $pcs, $looseinkg, $looseinpcs, $looseoutkg, $looseoutpcs);

    $_SESSION['date'] = $date;
    $_SESSION['supplier_id'] = $supplier_id;
    $_SESSION['country'] = $country;
    $_SESSION['item_id'] = $item_id;
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

            <b>Link Mark Limited (F-10) Frozen</b>
            <button type="button" class="btn btn-success btn-sm float-end" data-bs-toggle="modal" data-bs-target="#addmodal">Add Form-10 Data</button>
            <button type="button" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#filtermodal" style="display:inline; float: right; margin-right: 10px;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-binoculars" viewBox="0 0 16 16">
                <path d="M3 2.5A1.5 1.5 0 0 1 4.5 1h1A1.5 1.5 0 0 1 7 2.5V5h2V2.5A1.5 1.5 0 0 1 10.5 1h1A1.5 1.5 0 0 1 13 2.5v2.382a.5.5 0 0 0 .276.447l.895.447A1.5 1.5 0 0 1 15 7.118V14.5a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 14.5v-3a.5.5 0 0 1 .146-.354l.854-.853V9.5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v.793l.854.853A.5.5 0 0 1 7 11.5v3A1.5 1.5 0 0 1 5.5 16h-3A1.5 1.5 0 0 1 1 14.5V7.118a1.5 1.5 0 0 1 .83-1.342l.894-.447A.5.5 0 0 0 3 4.882zM4.5 2a.5.5 0 0 0-.5.5V3h2v-.5a.5.5 0 0 0-.5-.5zM6 4H4v.882a1.5 1.5 0 0 1-.83 1.342l-.894.447A.5.5 0 0 0 2 7.118V13h4v-1.293l-.854-.853A.5.5 0 0 1 5 10.5v-1A1.5 1.5 0 0 1 6.5 8h3A1.5 1.5 0 0 1 11 9.5v1a.5.5 0 0 1-.146.354l-.854.853V13h4V7.118a.5.5 0 0 0-.276-.447l-.895-.447A1.5 1.5 0 0 1 12 4.882V4h-2v1.5a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5zm4-1h2v-.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5zm4 11h-4v.5a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5zm-8 0H2v.5a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5z" />
              </svg></button>
            <?php
            if (isset($_POST['view']) && !empty($_POST['commondity']) && !empty($_POST['country']) && !empty($_POST['searchdate'])) {
            ?>
              <a href="export.php?table_name=form10frozen&searchdate=<?php echo $_POST['searchdate'] ?>&country=<?php echo $_POST['country'] ?>&commondity=<?php echo $_POST['commondity'] ?>" type="" class="btn btn-primary btn-sm me-2 float-end">Export Excel</a>
            <?php
            } ?>
          </form>
        </div>
        <div class="modal fade" id="filtermodal" tabindex="-1" role="dialog">
          <div class="modal-dialog" role="document">
            <div class="modal-content" style="width: 650px !important; margin-top:70px !important;">
              <div class="modal-header bg-info text-light">
                <h1 class="modal-title fs-5">Percentage Report</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form action="" method="post">
                  <input type="hidden" name="upid" value="<?php echo $form10data['id']; ?>">
                  <div class="modal-body">
                    <label>Form7Date:</label>
                    <input type="text" readonly data-id="multiple" id="dateselector" name="form7date" class="form-control inpv2">
                    <div class="row" style="margin-top: 10px !important;">
                      <div class="col">
                        <label>Form10Date:</label>
                        <input type="date" name="searchdate" class="form-control inpv2">
                      </div>
                      <div class="col">
                        <label>Country:</label>
                        <select name="country" class="form-control inpv2">
                          <option value="">Select Country</option>
                          <?php
                          $countrystmt = $pdo->prepare("SELECT DISTINCT country FROM form10stock");
                          $countrystmt->execute();
                          $countrydatas = $countrystmt->fetchall();
                          foreach ($countrydatas as $countrydata) {
                          ?>
                            <option value="<?php echo $countrydata['country']; ?>"><?php echo $countrydata['country']; ?></option>
                          <?php
                          }
                          ?>
                        </select>
                      </div>
                    </div>
                    <div class="row" style="margin-top: 10px !important;">
                      <div class="col">
                        <label>Commondity:</label>
                        <select name="commondity" class="form-control inpv2">
                          <option value="">Select Commondity</option>
                          <?php
                          $commonstmt = $pdo->prepare("SELECT DISTINCT item_id FROM form10stock");
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
                      </div>
                      <div class="col">
                        <label>Fish Type:</label>
                        <select name="fish_type" class="form-control inpv2">
                          <option value="">No Fish Type</option>
                          <option value="G">G</option>
                          <option value="egg">egg</option>
                          <option value="ggs">ggs</option>
                          <option value="fillet">fillet</option>
                          <option value="W">W</option>
                          <option value="Cut_piece">Cut Piece</option>
                          <option value="Scaless">Scaless</option>
                          <option value="Bls">Bl's</option>
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" name="view" class="btn btn-primary float-end me-2">View</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <div class="card-body">
          <table class="table table-hover table-striped table-bordered">
            <tr class="text-center">
              <th rowspan="2" style="padding-top:25px;">Date</th>
              <th rowspan="2" style="padding-top:25px;">Commondity</th>
              <th rowspan="2" style="padding-top:25px;">Supplier</th>
              <th rowspan="2" style="padding-top:25px;">Country</th>
              <th rowspan="2" style="padding-top:25px;">Type</th>
              <th rowspan="2" style="padding-top:25px;">Size</th>
              <th colspan="4">Production</th>
              <th colspan="2">Loose In</th>
              <th colspan="2">Loose Out</th>
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
            </tr>
            <?php
            if (isset($_POST['view']) && !empty($_POST['commondity']) && !empty($_POST['country']) && !empty($_POST['searchdate']) && !empty($_POST['form7date'])) {
              $commondity_id = $_POST['commondity'];
              $country = $_POST['country'];
              $searchdate = $_POST['searchdate'];
              $form7date = $_POST['form7date'];
              $fishtype = $_POST['fish_type'];
              $stmt = $pdo->prepare("SELECT * FROM form10stock WHERE item_id='$commondity_id' AND country='$country' AND date='$searchdate' AND fish_type='$fishtype'");
              $stmt->execute();
              $datas = $stmt->fetchall();
              foreach ($datas as $data) {
                $item_id = $data['item_id'];
                $fish_type = $data['fish_type'];
                $commonditydata = $query->select('item', $item_id, 'item_id');
                $supplierid = $data['supplier_id'];
                $supplier_name = $query->select('acname', $supplierid, 'code_no');
            ?>
                <tr>
                  <td><?php echo date('d-m-Y', strtotime($data['date'])); ?></td>
                  <td><?php echo $commonditydata['item_name'] . '(' . $data['fish_type'] . ')'; ?></td>
                  <td><?php echo $supplier_name['ac_name']; ?></td>
                  <td><?php echo $data['country']; ?></td>
                  <td><?php echo $data['type']; ?></td>
                  <td><?php echo $data['size']; ?></td>
                  <td><?php echo $data['pcsform10']; ?></td>
                  <td><?php echo $data['mc']; ?></td>
                  <td><?php echo $data['kg']; ?></td>
                  <td><?php echo $data['pcs']; ?></td>
                  <td><?php echo $data['looseinkg']; ?></td>
                  <td><?php echo $data['looseinpcs']; ?></td>
                  <td><?php echo $data['looseoutkg']; ?></td>
                  <td><?php echo $data['looseoutpcs']; ?></td>
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

              $supplieridstmt = $pdo->prepare("SELECT * FROM form10stock WHERE item_id='$commondity_id' AND country='$country' AND date='$searchdate'");
              $supplieridstmt->execute();
              $supplierdata = $supplieridstmt->fetch(PDO::FETCH_ASSOC);
              $supplier_id = $supplierdata['supplier_id'];

              // Get POST data
              $form7date = $_POST['form7date'];
              $_SESSION['form7date'] = $form7date;
              // Convert searchdate (which comes from Flatpickr) to an array of dates
              $datesArray = explode(', ', $form7date);

              // Quote each date for SQL
              $quotedDates = array_map(function ($date) {
                return "'" . $date . "'";
              }, $datesArray);

              // Join the quoted dates with commas
              $datesList = implode(', ', $quotedDates);

              $totalf7kgstmt = $pdo->prepare("SELECT SUM(kg) AS total_kg FROM form7stock WHERE item_id='$commondity_id' AND country='$country' AND supplier_name='$supplier_id' AND date IN ($datesList)");
              $totalf7kgstmt->execute();
              $totalf7kgdata = $totalf7kgstmt->fetch(PDO::FETCH_ASSOC);

              $totalkgstmt = $pdo->prepare("SELECT SUM(total_kg) AS total_kg FROM form10stock WHERE item_id='$commondity_id' AND country='$country' AND date='$searchdate'");
              $totalkgstmt->execute();
              $totalkgdata = $totalkgstmt->fetch(PDO::FETCH_ASSOC);
              $result1 = round($totalkgdata['total_kg'], 2) - round($totalf7kgdata['total_kg'], 2);
              if (empty($totalf7kgdata['total_kg'])) {
                $percentage = "";
              } else {
                $result2 = $result1 / round($totalf7kgdata['total_kg'], 2);
                $percentage = $result2 * 100;
              }



              $form10pcsstmt = $pdo->prepare("SELECT SUM(pcsform10) AS total_form10_pcs FROM form10stock WHERE item_id='$commondity_id' AND country='$country' AND supplier_id='$supplier_id' AND fish_type='$fish_type' AND date='$searchdate'");
              $form10pcsstmt->execute();
              $form10pcsdata = $form10pcsstmt->fetch(PDO::FETCH_ASSOC);


              $totalkgstmt = $pdo->prepare("SELECT SUM(total_kg) AS total_kg FROM form10stock WHERE item_id='$commondity_id' AND country='$country' AND supplier_id='$supplier_id' AND fish_type='$fish_type' AND date='$searchdate'");
              $totalkgstmt->execute();
              $totalkgdata = $totalkgstmt->fetch(PDO::FETCH_ASSOC);

              $mcstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM form10stock WHERE item_id='$commondity_id' AND country='$country' AND supplier_id='$supplier_id' AND fish_type='$fish_type' AND date='$searchdate'");
              $mcstmt->execute();
              $mcdata = $mcstmt->fetch(PDO::FETCH_ASSOC);

              $kgstmt = $pdo->prepare("SELECT SUM(kg) AS kg FROM form10stock WHERE item_id='$commondity_id' AND country='$country' AND supplier_id='$supplier_id' AND fish_type='$fish_type' AND date='$searchdate'");
              $kgstmt->execute();
              $kgdata = $kgstmt->fetch(PDO::FETCH_ASSOC);
              ?>
              <tr>
                <td></td>
                <td style="font-weight:bold;">Total</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td style="font-weight:bold;"><?php echo round($form10pcsdata['total_form10_pcs'], 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($mcdata['total_mc'], 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($kgdata['kg'], 2); ?></td>
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
                  <td style="font-weight:bold; <?php if ($percentage != "") {
                                                  if (strpos(round($percentage, 2), '-') !== false) {
                                                    echo 'color:red;';
                                                  }
                                                } ?>"><?php if ($percentage != "") {
                                                        echo round($percentage, 2) . "%";
                                                      } else {
                                                        echo '-';
                                                      } ?></td>
                <?php
                }
                ?>
              </tr>

              <?php
            } else {
              if (isset($_POST['searchbtn2']) && !empty($_POST['type'])) {
                $type = $_POST['type'];
                $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT item_id) FROM form10stock WHERE type='$type'");
              } else {
                $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT item_id) FROM form10stock");
              }
              $commonditycountstmt->execute();
              $commonditycountdatas = $commonditycountstmt->fetchColumn();
              for ($i = 0; $i < $commonditycountdatas; $i++) {
                if (isset($_POST['searchbtn2']) && !empty($_POST['type'])) {
                  $commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM form10stock WHERE type='$type'");
                } else {
                  $commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM form10stock");
                }
                $commonditystmt->execute();
                $commonditydata = $commonditystmt->fetchall();
                $commondity_id = $commonditydata[$i]['item_id'];
                if (isset($_POST['searchbtn2']) && !empty($_POST['type'])) {
                  $stmt = $pdo->prepare("SELECT * FROM form10stock WHERE type='$type' AND item_id='$commondity_id'");
                  $stmt->execute();
                  $datas = $stmt->fetchall();
                } else {
                  $stmt = $pdo->prepare("SELECT * FROM form10stock WHERE item_id='$commondity_id'");
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
                    <td><?php echo $commonditydata['item_name'] . '(' . $form10data['fish_type'] . ')'; ?></td>
                    <td><?php echo $supplier_name['ac_name']; ?></td>
                    <td><?php echo $form10data['country']; ?></td>
                    <td><?php echo $form10data['type']; ?></td>
                    <td><?php echo $form10data['size']; ?></td>
                    <td><?php echo $form10data['pcsform10']; ?></td>
                    <td><?php echo $form10data['mc']; ?></td>
                    <td><?php echo $form10data['kg']; ?></td>
                    <td><?php echo $form10data['pcs']; ?></td>
                    <td><?php echo $form10data['looseinkg']; ?></td>
                    <td><?php echo $form10data['looseinpcs']; ?></td>
                    <td><?php echo $form10data['looseoutkg']; ?></td>
                    <td><?php echo $form10data['looseoutpcs']; ?></td>
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
                          <h1 class="modal-title fs-5">Add Form 10 Data</h1>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                          <form action="" method="post">
                            <?php
                            $id = $form10data['id'];
                            $updatedata = $query->select('form10stock', $id, 'id');
                            $datas = $query->select('acname', $updatedata['supplier_id'], 'code_no');
                            $ac_name = $datas['ac_name'];
                            ?>
                            <input type="hidden" name="upid" value="<?php echo $form10data['id']; ?>">
                            <div class="modal-body">
                              <label>Date</label>
                              <input type="date" name="update" class="form-control inpv2 mb-2" value="<?php echo $updatedata['date']; ?>">
                              <div class="row">
                                <div class="col">
                                  <label>Type</label>
                                  <select class="form-control inpv2 mb-2" name="uptype">
                                    <option>Select Type</option>
                                    <option value="frozen" <?php if ($updatedata['type'] == 'frozen') {
                                                              echo "selected";
                                                            } ?>>frozen</option>
                                    <option value="tcl" <?php if ($updatedata['type'] == 'tcl') {
                                                          echo "selected";
                                                        } ?>>tcl</option>
                                  </select>
                                </div>
                                <div class="col">
                                  <label>Supplier Name</label>
                                  <select name="upsupplier_id" class="form-control inpv2">
                                    <?php
                                    $supplier_id_stmt = $pdo->prepare("SELECT DISTINCT supplier_name FROM form7stock");
                                    $supplier_id_stmt->execute();
                                    $supplier_id_datas = $supplier_id_stmt->fetchall();
                                    foreach ($supplier_id_datas as $supplier_id_data) {
                                      $supplierid = $supplier_id_data['supplier_name'];
                                      $supplier_name = $query->select('acname', $supplierid, 'code_no');
                                    ?>
                                      <option value="<?php echo $supplier_name['code_no']; ?>" <?php if ($updatedata['supplier_id'] == $supplier_name['code_no']) {
                                                                                                  echo "selected";
                                                                                                }; ?>><?php echo $supplier_name['ac_name']; ?></option>
                                    <?php
                                    }
                                    ?>
                                  </select>
                                </div>
                              </div>
                              <div class="row">
                              </div>
                              <div class="row">
                                <div class="col">
                                  <label>Commondity</label>
                                  <div class="row">
                                    <div class="col">
                                      <select class="form-control inpv2 mb-2" name="upitem_id">
                                        <?php
                                        $form7commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM form7stock");
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
                                      <select name="upfish_type" class="form-control inpv2">
                                        <option value="G">G</option>
                                        <option value="egg">egg</option>
                                        <option value="ggs">ggs</option>
                                        <option value="fillet">fillet</option>
                                        <option value="W">W</option>
                                        <option value="Cut_piece">Cut Piece</option>
                                        <option value="Scaless">Scaless</option>
                                        <option value="Bls">Bl's</option>
                                      </select>
                                    </div>
                                  </div>

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
          <h1 class="modal-title fs-5">Add Form 10 Data</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form action="form_10_frozen.php" method="post">
            <div class="modal-body">
              <label>Date</label>
              <input type="date" name="date" class="form-control inpv2 mb-2" value="<?php if (!empty($_SESSION['date'])) {
                                                                                      echo $_SESSION['date'];
                                                                                    } ?>">
              <div class="row">
                <div class="col">
                  <label>Type</label>
                  <select class="form-control inpv2 mb-2" name="type">
                    <option value="frozen">Frozen</option>
                  </select>
                </div>
                <div class="col">
                  <label>Supplier Name</label>
                  <select name="supplier_id" class="form-control inpv2">
                    <?php
                    $supplier_id_stmt = $pdo->prepare("SELECT DISTINCT supplier_name FROM form7stock");
                    $supplier_id_stmt->execute();
                    $supplier_id_datas = $supplier_id_stmt->fetchall();

                    foreach ($supplier_id_datas as $supplier_id_data) {
                      $supplierid = $supplier_id_data['supplier_name'];
                      $supplier_name = $query->select('acname', $supplierid, 'code_no');
                    ?>
                      <option value="<?php echo $supplier_name['code_no']; ?>" <?php if (!empty($_SESSION['supplier_id'])) {
                                                                                  if ($_SESSION['supplier_id'] == $supplier_name['code_no']) {
                                                                                    echo "selected";
                                                                                  }
                                                                                } ?>><?php echo $supplier_name['ac_name']; ?></option>
                    <?php
                    }
                    ?>
                  </select>
                </div>
              </div>
              <div class="row">
              </div>
              <div class="row">
                <div class="col">
                  <label>Commondity</label>
                  <div class="row">
                    <div class="col">
                      <select class="form-control inpv2 mb-2" name="item_id">
                        <?php
                        $form7commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM form7stock");
                        $form7commonditystmt->execute();
                        $form7commonditydatas = $form7commonditystmt->fetchall();
                        foreach ($form7commonditydatas as $form7commonditydata) {
                          $item_id = $form7commonditydata['item_id'];
                          $commonditydata = $query->select('item', $item_id, 'item_id');
                        ?>
                          <option value="<?php echo $commonditydata['item_id']; ?>" <?php if (!empty($_SESSION['item_id'])) {
                                                                                      if ($_SESSION['item_id'] == $commonditydata['item_id']) {
                                                                                        echo "selected";
                                                                                      }
                                                                                    } ?>><?php echo $commonditydata['item_name']; ?></option>
                        <?php
                        }
                        ?>
                      </select>
                    </div>
                    <div class="col">
                      <select name="fish_type" class="form-control inpv2">
                        <option value="G">G</option>
                        <option value="egg">egg</option>
                        <option value="ggs">ggs</option>
                        <option value="fillet">fillet</option>
                        <option value="W">W</option>
                        <option value="Cut_piece">Cut Piece</option>
                        <option value="Scaless">Scaless</option>
                        <option value="Bls">Bl's</option>
                      </select>
                    </div>
                  </div>
                </div>
                <div class="col">
                  <label>Country</label>
                  <input type="text" name="country" class="form-control inpv2 mb-2" value="<?php if (!empty($_SESSION['country'])) {
                                                                                              echo $_SESSION['country'];
                                                                                            } ?>">
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
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-success" name="add">Add</button>
        </div>
        </form>
      </div>
    </div>
  </div>
  <script>
    $('#filtertogglebtn').click(function() {
      var filterDiv = $('#filterdiv');
      if (filterDiv.css('display') === 'none') {
        filterDiv.css('display', 'inline');
      } else {
        filterDiv.css('display', 'none');
      }
    });
    flatpickr("#dateselector", {
      mode: "multiple",
      dateFormat: "Y-m-d",
      onChange: function(selectedDates, dateStr, instance) {
        console.log('Selected dates:', selectedDates.map(date => date.toISOString().split('T')[0]));
      }
    });
  </script>
  <?php
  $bootstrap->javascript();
  ?>
</body>

</html>