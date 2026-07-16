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
    // Header Level Data
    $date = $_POST['date'];
    $supplier_id = $_POST['supplier_id'];
    $country = $_POST['country'];
    $type = $_POST['type'];

    // Line Level Arrays
    $item_ids = isset($_POST['item_id']) ? $_POST['item_id'] : [];
    $fish_types = isset($_POST['fish_type']) ? $_POST['fish_type'] : [];
    $sizes = isset($_POST['size']) ? $_POST['size'] : [];
    $mcs = isset($_POST['mc']) ? $_POST['mc'] : [];
    $kgs = isset($_POST['kg']) ? $_POST['kg'] : [];
    $pcss = isset($_POST['pcs']) ? $_POST['pcs'] : [];
    $loose_in_kgs = isset($_POST['loose_in_kg']) ? $_POST['loose_in_kg'] : [];
    $loose_in_pcss = isset($_POST['loose_in_pcs']) ? $_POST['loose_in_pcs'] : [];
    $loose_out_kgs = isset($_POST['loose_out_kg']) ? $_POST['loose_out_kg'] : [];
    $loose_out_pcss = isset($_POST['loose_out_pcs']) ? $_POST['loose_out_pcs'] : [];

    // Process each line
    foreach ($item_ids as $index => $item_id) {
      $item_id = trim($item_id);
      if (empty($item_id)) continue;

      $fish_type = isset($fish_types[$index]) ? trim($fish_types[$index]) : '';
      $size = isset($sizes[$index]) ? trim($sizes[$index]) : '';
      $mc = isset($mcs[$index]) ? trim($mcs[$index]) : '';
      $kg = isset($kgs[$index]) ? trim($kgs[$index]) : '';
      $pcs = isset($pcss[$index]) ? trim($pcss[$index]) : '';
      $looseinkg = isset($loose_in_kgs[$index]) ? trim($loose_in_kgs[$index]) : '';
      $looseinpcs = isset($loose_in_pcss[$index]) ? trim($loose_in_pcss[$index]) : '';
      $looseoutkg = isset($loose_out_kgs[$index]) ? trim($loose_out_kgs[$index]) : '';
      $looseoutpcs = isset($loose_out_pcss[$index]) ? trim($loose_out_pcss[$index]) : '';

      $query->addform10($date, $item_id, $fish_type, $supplier_id, $country, $type, $size, $mc, $kg, $pcs, $looseinkg, $looseinpcs, $looseoutkg, $looseoutpcs);
    }

    $_SESSION['date'] = $date;
    $_SESSION['supplier_id'] = $supplier_id;
    $_SESSION['country'] = $country;
  }

  // Handle Main Table Header Filters
  if (isset($_POST['searchbtn'])) {
    $_SESSION['search']['searchcommondity'] = $_POST['commondity_id'];
    $_SESSION['search']['searchdate'] = $_POST['date'];
    $_SESSION['search']['searchsize'] = $_POST['size'];
  }

  if (isset($_POST['clearfilter'])) {
    $_SESSION['search']['searchcommondity'] = '';
    $_SESSION['search']['searchdate'] = '';
    $_SESSION['search']['searchsize'] = '';
  }

  $isViewMode = isset($_POST['view']);
  ?>
  <div class="row">
    <div class="sidebarcol" id="sidebar">
      <?php include 'sidebar.php'; ?>
    </div>
    <div class="contentcol" id="content">
      <?php require 'navbar.php'; ?>
      <div class="card mt-1">
        <div class="card-header bg-warning text-secondary" style="padding-bottom: 10px;">
          <form action="" method="post">
            <b class="h5">Link Mark Limited (F-10) Frozen</b>

            <button type="button" class="btn btn-success btn-sm float-end ms-2" data-bs-toggle="modal" data-bs-target="#addmodal">Add Form-10 Data</button>
            <button type="button" class="btn btn-primary btn-sm float-end ms-2" data-bs-toggle="modal" data-bs-target="#filtermodal" title="Percentage Report">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-binoculars" viewBox="0 0 16 16">
                <path d="M3 2.5A1.5 1.5 0 0 1 4.5 1h1A1.5 1.5 0 0 1 7 2.5V5h2V2.5A1.5 1.5 0 0 1 10.5 1h1A1.5 1.5 0 0 1 13 2.5v2.382a.5.5 0 0 0 .276.447l.895.447A1.5 1.5 0 0 1 15 7.118V14.5a1.5 1.5 0 0 1-1.5 1.5h-3A1.5 1.5 0 0 1 9 14.5v-3a.5.5 0 0 1 .146-.354l.854-.853V9.5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5v.793l.854.853A.5.5 0 0 1 7 11.5v3A1.5 1.5 0 0 1 5.5 16h-3A1.5 1.5 0 0 1 1 14.5V7.118a1.5 1.5 0 0 1 .83-1.342l.894-.447A.5.5 0 0 0 3 4.882zM4.5 2a.5.5 0 0 0-.5.5V3h2v-.5a.5.5 0 0 0-.5-.5zM6 4H4v.882a1.5 1.5 0 0 1-.83 1.342l-.894.447A.5.5 0 0 0 2 7.118V13h4v-1.293l-.854-.853A.5.5 0 0 1 5 10.5v-1A1.5 1.5 0 0 1 6.5 8h3A1.5 1.5 0 0 1 11 9.5v1a.5.5 0 0 1-.146.354l-.854.853V13h4V7.118a.5.5 0 0 0-.276-.447l-.895-.447A1.5 1.5 0 0 1 12 4.882V4h-2v1.5a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5zm4-1h2v-.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5zm4 11h-4v.5a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5zm-8 0H2v.5a.5.5 0 0 0 .5.5h3a.5.5 0 0 0 .5-.5z" />
              </svg>
            </button>

            <button type="submit" name="clearfilter" class="btn btn-secondary btn-sm float-end ms-2" style="border-top-left-radius:0px; border-bottom-left-radius:0px;">Clear Filter</button>
            <button type="submit" name="searchbtn" class="btn btn-primary btn-sm float-end me-2" style="border-top-left-radius:0px; border-bottom-left-radius:0px;">View</button>

            <select name="commondity_id" class="form-control inpv2 d-inline float-end" style="margin-left:5px; width: 10%; height:26px !important; padding:0px 2px;">
              <option value="">Select Commondity</option>
              <?php
              $commonstmt = $pdo->prepare("SELECT DISTINCT item_id FROM form10stock");
              $commonstmt->execute();
              $commondatas = $commonstmt->fetchAll();
              foreach ($commondatas as $commondata) {
                $item_id = $commondata['item_id'];
                $commonditydata = $query->select('item', $item_id, 'item_id');
              ?>
                <option value="<?php echo $commondata['item_id']; ?>" <?php if (!empty($_SESSION['search']['searchcommondity']) && $_SESSION['search']['searchcommondity'] == $commondata['item_id']) echo "selected"; ?>><?php echo $commonditydata['item_name']; ?></option>
              <?php } ?>
            </select>
            <input type="date" name="date" value="<?php echo !empty($_SESSION['search']['searchdate']) ? $_SESSION['search']['searchdate'] : ''; ?>" class="form-control inpv2 d-inline float-end" style="margin-left:5px; width: 14%; height:26px !important; padding:0px 2px;">
            <select name="size" class="form-control inpv2 d-inline float-end" style="margin-left:5px; width: 10%; height:26px !important; padding:0px 2px;">
              <option value="">Select Size</option>
              <?php
              $sizestmt = $pdo->prepare("SELECT DISTINCT size FROM form10stock");
              $sizestmt->execute();
              $sizedatas = $sizestmt->fetchAll();
              foreach ($sizedatas as $sizedata) {
              ?>
                <option value="<?php echo $sizedata['size']; ?>" <?php if (!empty($_SESSION['search']['searchsize']) && $_SESSION['search']['searchsize'] == $sizedata['size']) echo "selected"; ?>><?php echo $sizedata['size']; ?></option>
              <?php } ?>
            </select>

            <?php if ($isViewMode && !empty($_POST['commondity']) && !empty($_POST['country']) && !empty($_POST['searchdate'])) { ?>
              <a href="testing_export_two.php?table_name=form10frozen&searchdate=<?php echo $_POST['searchdate'] ?>&country=<?php echo $_POST['country'] ?>&commondity=<?php echo $_POST['commondity'] ?>&fish_type=<?php echo $_POST['fish_type'] ?>" class="btn btn-dark btn-sm float-end me-2">Export Excel</a>
            <?php } ?>
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
                  <div class="modal-body">
                    <label>Form7Date:</label>
                    <input type="date" id="dateselector" name="form7date" class="form-control inpv2">
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
                          <?php } ?>
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
                          <?php } ?>
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
                          <option value="iqf">IQF</option>
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
              <?php if (!$isViewMode) { ?>
                <th rowspan="2" style="padding-top:25px;">Action</th>
              <?php } else { ?>
                <th rowspan="2" style="padding-top:25px;">%</th>
              <?php } ?>
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
            // Setup Unified Fetching
            $sql = "SELECT * FROM form10stock";
            $conditions = [];
            $nodata = true; // Assume blank table

            if ($isViewMode) {
              // Percentage Report Logic
              if (!empty($_POST['commondity'])) {
                $conditions[] = "item_id = '" . $_POST['commondity'] . "'";
              }
              if (!empty($_POST['country'])) {
                $conditions[] = "country = '" . $_POST['country'] . "'";
              }
              if (!empty($_POST['searchdate'])) {
                $conditions[] = "date = '" . $_POST['searchdate'] . "'";
              }
              if (!empty($_POST['fish_type'])) {
                $conditions[] = "fish_type = '" . $_POST['fish_type'] . "'";
              }
              if (count($conditions) > 0) {
                $nodata = false;
              }
            } else {
              // Main Table Filter Logic
              $search_commondity = !empty($_SESSION['search']['searchcommondity']) ? $_SESSION['search']['searchcommondity'] : '';
              $search_date = !empty($_SESSION['search']['searchdate']) ? $_SESSION['search']['searchdate'] : '';
              $search_size = !empty($_SESSION['search']['searchsize']) ? $_SESSION['search']['searchsize'] : '';

              if ($search_commondity != '') {
                $conditions[] = "item_id = :commondity_id";
              }
              if ($search_date != '') {
                $conditions[] = "date = :searchdate";
              }
              if ($search_size != '') {
                $conditions[] = "size = :searchsize";
              }
              if (count($conditions) > 0) {
                $nodata = false;
              }
            }

            if ($nodata) {
              $datas = [];
            } else {
              if (count($conditions) > 0) {
                $sql .= " WHERE " . implode(" AND ", $conditions);
              }
              $stmt = $pdo->prepare($sql);

              // Bind params specifically for standard filter
              if (!$isViewMode) {
                if ($search_commondity != '') {
                  $stmt->bindParam(':commondity_id', $search_commondity, PDO::PARAM_STR);
                }
                if ($search_date != '') {
                  $stmt->bindParam(':searchdate', $search_date, PDO::PARAM_STR);
                }
                if ($search_size != '') {
                  $stmt->bindParam(':searchsize', $search_size, PDO::PARAM_STR);
                }
              }
              $stmt->execute();
              $datas = $stmt->fetchall();
            }

            // Initialize Dynamic Totals
            $t_pcsform10 = 0;
            $t_mc = 0;
            $t_kg = 0;
            $t_pcs = 0;
            $t_looseinkg = 0;
            $t_looseinpcs = 0;
            $t_looseoutkg = 0;
            $t_looseoutpcs = 0;
            $t_total_kg = 0;

            foreach ($datas as $data) {
              $item_id = $data['item_id'];
              $commonditydata = $query->select('item', $item_id, 'item_id');
              $supplierid = $data['supplier_id'];
              $supplier_name = $query->select('acname', $supplierid, 'code_no');

              // Accumulate totals
              $t_pcsform10 += floatval($data['pcsform10']);
              $t_mc += floatval($data['mc']);
              $t_kg += floatval($data['kg']);
              $t_pcs += floatval($data['pcs']);
              $t_looseinkg += floatval($data['looseinkg']);
              $t_looseinpcs += floatval($data['looseinpcs']);
              $t_looseoutkg += floatval($data['looseoutkg']);
              $t_looseoutpcs += floatval($data['looseoutpcs']);
              $t_total_kg += floatval($data['total_kg']);
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
                <td><?php echo round($data['total_kg'], 2); ?></td>

                <?php if (!$isViewMode) { ?>
                  <td>
                    <button type="button" data-bs-toggle="modal" data-bs-target="#updatemodal<?= $data['id']; ?>" class="btn btn-warning text-light btn-sm d-inline">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                      </svg>
                    </button>
                  </td>
                <?php } else { ?>
                  <td>-</td> <?php } ?>
              </tr>

              <div class="modal fade" id="updatemodal<?= $data['id']; ?>" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                  <div class="modal-content" style="width: 650px !important; margin-top:70px !important;">
                    <div class="modal-header bg-warning text-light">
                      <h1 class="modal-title fs-5">Update Form 10 Data</h1>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <form action="" method="post">
                        <?php
                        $updatedata = $query->select('form10stock', $data['id'], 'id');
                        ?>
                        <input type="hidden" name="upid" value="<?php echo $data['id']; ?>">
                        <div class="modal-body">
                          <label>Date</label>
                          <input type="date" name="update" class="form-control inpv2 mb-2" value="<?php echo $updatedata['date']; ?>">
                          <div class="row">
                            <div class="col">
                              <label>Type</label>
                              <select class="form-control inpv2 mb-2" name="uptype">
                                <option>Select Type</option>
                                <option value="frozen" <?php if ($updatedata['type'] == 'frozen') echo "selected"; ?>>frozen</option>
                                <option value="tcl" <?php if ($updatedata['type'] == 'tcl') echo "selected"; ?>>tcl</option>
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
                                  $supplierid_opt = $supplier_id_data['supplier_name'];
                                  $supplier_name_opt = $query->select('acname', $supplierid_opt, 'code_no');
                                ?>
                                  <option value="<?php echo $supplier_name_opt['code_no']; ?>" <?php if ($updatedata['supplier_id'] == $supplier_name_opt['code_no']) echo "selected"; ?>><?php echo $supplier_name_opt['ac_name']; ?></option>
                                <?php } ?>
                              </select>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col">
                              <label>Commodity</label>
                              <div class="row">
                                <div class="col">
                                  <select class="form-control inpv2 mb-2" name="upitem_id">
                                    <?php
                                    $form7commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM form7stock");
                                    $form7commonditystmt->execute();
                                    $form7commonditydatas = $form7commonditystmt->fetchall();
                                    foreach ($form7commonditydatas as $form7commonditydata) {
                                      $item_id_opt = $form7commonditydata['item_id'];
                                      $commonditydata_opt = $query->select('item', $item_id_opt, 'item_id');
                                    ?>
                                      <option value="<?php echo $commonditydata_opt['item_id']; ?>" <?php if ($updatedata['item_id'] == $commonditydata_opt['item_id']) echo "selected"; ?>><?php echo $commonditydata_opt['item_name']; ?></option>
                                    <?php } ?>
                                  </select>
                                </div>
                                <div class="col">
                                  <select name="upfish_type" class="form-control inpv2">
                                    <option value="G" <?php if ($updatedata['fish_type'] == 'G') echo "selected"; ?>>G</option>
                                    <option value="egg" <?php if ($updatedata['fish_type'] == 'egg') echo "selected"; ?>>egg</option>
                                    <option value="ggs" <?php if ($updatedata['fish_type'] == 'ggs') echo "selected"; ?>>ggs</option>
                                    <option value="fillet" <?php if ($updatedata['fish_type'] == 'fillet') echo "selected"; ?>>fillet</option>
                                    <option value="W" <?php if ($updatedata['fish_type'] == 'W') echo "selected"; ?>>W</option>
                                    <option value="Cut_piece" <?php if ($updatedata['fish_type'] == 'Cut_piece') echo "selected"; ?>>Cut Piece</option>
                                    <option value="Scaless" <?php if ($updatedata['fish_type'] == 'Scaless') echo "selected"; ?>>Scaless</option>
                                    <option value="Bls" <?php if ($updatedata['fish_type'] == 'Bls') echo "selected"; ?>>Bl's</option>
                                    <option value="iqf" <?php if ($updatedata['fish_type'] == 'iqf') echo "selected"; ?>>IQF</option>
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
            <?php } ?>

            <?php
            // Calculate Form 7 Percentage if viewing report and provided form7date
            $percentage = "";
            if ($isViewMode && !empty($_POST['form7date']) && !empty($_POST['commondity']) && !empty($_POST['country']) && !empty($_POST['fish_type'])) {
              $form7date = $_POST['form7date'];
              $_SESSION['form7date'] = $form7date;
              $datesArray = explode(', ', $form7date);
              $quotedDates = array_map(function ($date) {
                return "'" . $date . "'";
              }, $datesArray);
              $datesList = implode(', ', $quotedDates);

              $commondity_id = $_POST['commondity'];
              $country = $_POST['country'];
              $fishtype = $_POST['fish_type'];

              $totalf7kgstmt = $pdo->prepare("SELECT SUM(kg) AS total_kg FROM form7stock WHERE item_id='$commondity_id' AND country='$country' AND fish_type='$fishtype' AND date IN ($datesList)");
              $totalf7kgstmt->execute();
              $totalf7kgdata = $totalf7kgstmt->fetch(PDO::FETCH_ASSOC);

              if (!empty($totalf7kgdata['total_kg'])) {
                $result1 = $t_total_kg - round($totalf7kgdata['total_kg'], 2);
                $percentage = ($result1 / round($totalf7kgdata['total_kg'], 2)) * 100;
              }
            }
            ?>

            <?php if (count($datas) > 0) { ?>
              <tr style="background-color: #f8f9fa;">
                <td></td>
                <td style="font-weight:bold;">Total</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td style="font-weight:bold;"><?php echo round($t_pcsform10, 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($t_mc, 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($t_kg, 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($t_pcs, 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($t_looseinkg, 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($t_looseinpcs, 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($t_looseoutkg, 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($t_looseoutpcs, 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($t_total_kg, 2); ?></td>

                <?php if (!$isViewMode) { ?>
                  <td></td>
                <?php } else { ?>
                  <?php if ($percentage !== "") {
                    $color = (strpos(round($percentage, 2), '-') !== false) ? 'color: red;' : '';
                    $sign = (strpos(round($percentage, 2), '-') !== false) ? '' : '+';
                  ?>
                    <td style="font-weight:bold; <?php echo $color; ?>"><?php echo $sign . round($percentage, 2); ?> %</td>
                  <?php } else { ?>
                    <td style="font-weight:bold;">-</td>
                  <?php } ?>
                <?php } ?>
              </tr>
            <?php } ?>
          </table>
        </div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="addmodal">
    <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content" style="margin-top:70px !important;">
        <div class="modal-header bg-warning text-light">
          <h1 class="modal-title fs-5">Add Form 10 Data</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form action="form_10_frozen.php" method="post" autocomplete="off">
          <div class="modal-body">
            <div class="row g-3 mb-3">
              <div class="col-md-3">
                <label style="font-weight: bold;">Date</label>
                <input type="date" name="date" class="form-control inpv2" value="<?php echo !empty($_SESSION['date']) ? $_SESSION['date'] : ''; ?>">
              </div>
              <div class="col-md-3">
                <label style="font-weight: bold;">Type</label>
                <select class="form-control inpv2" name="type">
                  <option value="frozen">Frozen</option>
                </select>
              </div>
              <div class="col-md-3">
                <label style="font-weight: bold;">Supplier</label>
                <select name="supplier_id" class="form-control inpv2 chzn-select" data-placeholder="Select Supplier">
                  <option value=""></option>
                  <?php
                  $supplier_id_stmt = $pdo->prepare("SELECT DISTINCT supplier_name FROM form7stock");
                  $supplier_id_stmt->execute();
                  $supplier_id_datas = $supplier_id_stmt->fetchall();
                  foreach ($supplier_id_datas as $supplier_id_data) {
                    $supplierid = $supplier_id_data['supplier_name'];
                    $supplier_name = $query->select('acname', $supplierid, 'code_no');
                  ?>
                    <option value="<?php echo $supplier_name['code_no']; ?>" <?php echo (!empty($_SESSION['supplier_id']) && $_SESSION['supplier_id'] == $supplier_name['code_no']) ? 'selected' : ''; ?>>
                      <?php echo $supplier_name['ac_name']; ?>
                    </option>
                  <?php } ?>
                </select>
              </div>
              <div class="col-md-3">
                <label style="font-weight: bold;">Country</label>
                <input type="text" name="country" class="form-control inpv2" value="<?php echo !empty($_SESSION['country']) ? $_SESSION['country'] : ''; ?>">
              </div>
            </div>

            <div class="mb-2 d-flex justify-content-between align-items-center mt-4">
              <label style="font-weight: bold;">Form-10 Lines</label>
              <button type="button" class="btn btn-sm btn-outline-primary" onclick="addForm10Line();">Add Line</button>
            </div>

            <div class="table-responsive">
              <table class="table table-bordered table-sm" style="min-width: 1100px;">
                <thead class="table-light text-center align-middle">
                  <tr>
                    <th>Commodity</th>
                    <th>Fish Type</th>
                    <th>Size</th>
                    <th>MC</th>
                    <th>Kg</th>
                    <th>Pcs</th>
                    <th>L-In Kg</th>
                    <th>L-In Pcs</th>
                    <th>L-Out Kg</th>
                    <th>L-Out Pcs</th>
                    <th style="width:1px;">Rem</th>
                  </tr>
                </thead>
                <tbody id="form10-lines">
                  <tr>
                    <td>
                      <select name="item_id[]" class="form-control" style="min-width: 120px;">
                        <option value="">Select</option>
                        <?php
                        $form7commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM form7stock");
                        $form7commonditystmt->execute();
                        $form7commonditydatas = $form7commonditystmt->fetchall();
                        foreach ($form7commonditydatas as $form7commonditydata) {
                          $c_item_id = $form7commonditydata['item_id'];
                          $commonditydata = $query->select('item', $c_item_id, 'item_id');
                        ?>
                          <option value="<?php echo $commonditydata['item_id']; ?>" <?php echo (!empty($_SESSION['item_id']) && $_SESSION['item_id'] == $commonditydata['item_id']) ? 'selected' : ''; ?>>
                            <?php echo $commonditydata['item_name']; ?>
                          </option>
                        <?php } ?>
                      </select>
                    </td>
                    <td>
                      <select name="fish_type[]" class="form-control" style="min-width: 90px;">
                        <option value="G">G</option>
                        <option value="egg">egg</option>
                        <option value="ggs">ggs</option>
                        <option value="fillet">fillet</option>
                        <option value="W">W</option>
                        <option value="Cut_piece">Cut Piece</option>
                        <option value="Scaless">Scaless</option>
                        <option value="Bls">Bl's</option>
                        <option value="iqf">IQF</option>
                      </select>
                    </td>
                    <td><input type="text" name="size[]" class="form-control" style="min-width: 70px;"></td>
                    <td><input type="number" name="mc[]" class="form-control" style="min-width: 70px;"></td>
                    <td><input type="text" name="kg[]" class="form-control" style="min-width: 70px;"></td>
                    <td><input type="text" name="pcs[]" class="form-control" style="min-width: 70px;"></td>
                    <td><input type="text" name="loose_in_kg[]" class="form-control" style="min-width: 70px;"></td>
                    <td><input type="number" name="loose_in_pcs[]" class="form-control" style="min-width: 70px;"></td>
                    <td><input type="text" name="loose_out_kg[]" class="form-control" style="min-width: 70px;"></td>
                    <td><input type="number" name="loose_out_pcs[]" class="form-control" style="min-width: 70px;"></td>
                    <td><button type="button" class="btn btn-danger btn-sm" onclick="removeForm10Line(this);">×</button></td>
                  </tr>
                </tbody>
              </table>
            </div>

            <div class="text-end mt-3">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-success" name="add">Save Form 10</button>
            </div>
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
  <script type="text/javascript">
    function addForm10Line() {
      const tbody = document.getElementById('form10-lines');
      const row = document.createElement('tr');
      row.innerHTML = `
        <td>
          <select name="item_id[]" class="form-control" style="min-width: 120px;">
            <option value="">Select</option>
            <?php
            foreach ($form7commonditydatas as $form7commonditydata) {
              $c_item_id = $form7commonditydata['item_id'];
              $commonditydata = $query->select('item', $c_item_id, 'item_id');
              echo '<option value="' . $commonditydata['item_id'] . '">' . $commonditydata['item_name'] . '</option>';
            }
            ?>
          </select>
        </td>
        <td>
          <select name="fish_type[]" class="form-control" style="min-width: 90px;">
            <option value="G">G</option><option value="egg">egg</option><option value="ggs">ggs</option>
            <option value="fillet">fillet</option><option value="W">W</option><option value="Cut_piece">Cut Piece</option>
            <option value="Scaless">Scaless</option><option value="Bls">Bl's</option><option value="iqf">IQF</option>
          </select>
        </td>
        <td><input type="text" name="size[]" class="form-control" style="min-width: 70px;"></td>
        <td><input type="number" name="mc[]" class="form-control" style="min-width: 70px;"></td>
        <td><input type="text" name="kg[]" class="form-control" style="min-width: 70px;"></td>
        <td><input type="text" name="pcs[]" class="form-control" style="min-width: 70px;"></td>
        <td><input type="text" name="loose_in_kg[]" class="form-control" style="min-width: 70px;"></td>
        <td><input type="number" name="loose_in_pcs[]" class="form-control" style="min-width: 70px;"></td>
        <td><input type="text" name="loose_out_kg[]" class="form-control" style="min-width: 70px;"></td>
        <td><input type="number" name="loose_out_pcs[]" class="form-control" style="min-width: 70px;"></td>
        <td><button type="button" class="btn btn-danger btn-sm" onclick="removeForm10Line(this);">×</button></td>
      `;
      tbody.appendChild(row);
    }

    function removeForm10Line(button) {
      const row = button.closest('tr');
      const tbody = row.closest('tbody');
      if (tbody.rows.length > 1) {
        row.remove();
      }
    }
  </script>
  <?php $bootstrap->javascript(); ?>
</body>

</html>