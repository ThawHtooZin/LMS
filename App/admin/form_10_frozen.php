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

            <a href="add_form_10_frozen.php" class="btn btn-success btn-sm float-end ms-2">New Form-10 Data</a>
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
              $prodFilterStmt = $pdo->prepare("SELECT id, name FROM products");
              $prodFilterStmt->execute();
              $prodFilterDatas = $prodFilterStmt->fetchAll(PDO::FETCH_ASSOC);
              foreach ($prodFilterDatas as $prodData) {
              ?>
                <option value="<?php echo htmlspecialchars($prodData['id']); ?>" <?php if (!empty($_SESSION['search']['searchcommondity']) && $_SESSION['search']['searchcommondity'] == $prodData['id']) echo "selected"; ?>>
                  <?php echo htmlspecialchars($prodData['name']); ?>
                </option>
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
                <option value="<?php echo htmlspecialchars($sizedata['size']); ?>" <?php if (!empty($_SESSION['search']['searchsize']) && $_SESSION['search']['searchsize'] == $sizedata['size']) echo "selected"; ?>><?php echo htmlspecialchars($sizedata['size']); ?></option>
              <?php } ?>
            </select>

            <?php if ($isViewMode && !empty($_POST['commondity']) && !empty($_POST['country']) && !empty($_POST['searchdate'])) { ?>
              <a href="testing_export_two.php?table_name=form10frozen&searchdate=<?php echo $_POST['searchdate'] ?>&country=<?php echo $_POST['country'] ?>&commondity=<?php echo $_POST['commondity'] ?>&fish_type=<?php echo $_POST['fish_type'] ?>" class="btn btn-dark btn-sm float-end me-2">Export Excel</a>
            <?php } ?>
          </form>
        </div>

        <div class="modal fade" id="filtermodal" tabindex="-1" aria-labelledby="filtermodalLabel" aria-hidden="true">
          <div class="modal-dialog modal-md modal-dialog-centered">
            <div class="modal-content" style="overflow: visible !important;">
              <div class="modal-header bg-info text-light">
                <h1 class="modal-title fs-5" id="filtermodalLabel">Percentage Report</h1>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>

              <form action="" method="post">
                <div class="modal-body" style="overflow: visible !important;">
                  <div class="mb-3">
                    <label for="dateselector" class="form-label">Form7Date:</label>
                    <input type="date" id="dateselector" name="form7date" class="form-control inpv2">
                  </div>

                  <div class="row g-3">
                    <div class="col-md-6">
                      <label class="form-label">Form10Date:</label>
                      <input type="date" name="searchdate" class="form-control inpv2">
                    </div>
                    <div class="col-md-6">
                      <label class="form-label">Country:</label>
                      <select name="country" class="form-control inpv2">
                        <option value="">Select Country</option>
                        <?php
                        $countrystmt = $pdo->prepare("SELECT DISTINCT country FROM form10stock");
                        $countrystmt->execute();
                        $countrydatas = $countrystmt->fetchAll(PDO::FETCH_ASSOC);
                        foreach ($countrydatas as $countrydata) {
                        ?>
                          <option value="<?php echo htmlspecialchars($countrydata['country']); ?>">
                            <?php echo htmlspecialchars($countrydata['country']); ?>
                          </option>
                        <?php } ?>
                      </select>
                    </div>
                  </div>

                  <div class="row g-3 mt-1">
                    <div class="col-md-6">
                      <label class="form-label">Commodity:</label>
                      <select name="commondity" class="form-control inpv2">
                        <option value="">Select Commodity</option>
                        <?php
                        foreach ($prodFilterDatas as $prodData) {
                        ?>
                          <option value="<?php echo htmlspecialchars($prodData['id']); ?>">
                            <?php echo htmlspecialchars($prodData['name']); ?>
                          </option>
                        <?php } ?>
                      </select>
                    </div>
                    <div class="col-md-6">
                      <label class="form-label">Fish Type:</label>
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
                  <button type="submit" name="view" class="btn btn-primary">View</button>
                </div>
              </form>
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
            $sql = "SELECT * FROM form10stock";
            $conditions = [];
            $nodata = true;

            if ($isViewMode) {
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
              $datas = $stmt->fetchall(PDO::FETCH_ASSOC);
            }

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

              $prodStmt = $pdo->prepare("SELECT name FROM products WHERE id = ? LIMIT 1");
              $prodStmt->execute([$item_id]);
              $item_name = $prodStmt->fetchColumn() ?: 'Unknown';

              $supplierid = $data['supplier_id'];

              $supStmt = $pdo->prepare("SELECT name FROM contacts WHERE id = ? LIMIT 1");
              $supStmt->execute([$supplierid]);
              $supplier_name_val = $supStmt->fetchColumn() ?: $supplierid;

              $t_pcsform10 += floatval($data['pcsform10'] ?? 0);
              $t_mc += floatval($data['mc'] ?? 0);
              $t_kg += floatval($data['kg'] ?? 0);
              $t_pcs += floatval($data['pcs'] ?? 0);
              $t_looseinkg += floatval($data['looseinkg'] ?? 0);
              $t_looseinpcs += floatval($data['looseinpcs'] ?? 0);
              $t_looseoutkg += floatval($data['looseoutkg'] ?? 0);
              $t_looseoutpcs += floatval($data['looseoutpcs'] ?? 0);
              $t_total_kg += floatval($data['total_kg'] ?? 0);
            ?>
              <tr>
                <td><?php echo !empty($data['date']) && $data['date'] != '0000-00-00' ? date('d-m-Y', strtotime($data['date'])) : ''; ?></td>
                <td><?php echo htmlspecialchars($item_name) . '(' . htmlspecialchars($data['fish_type'] ?? '') . ')'; ?></td>
                <td><?php echo htmlspecialchars($supplier_name_val); ?></td>
                <td><?php echo htmlspecialchars($data['country'] ?? ''); ?></td>
                <td><?php echo htmlspecialchars($data['type'] ?? ''); ?></td>
                <td><?php echo htmlspecialchars($data['size'] ?? ''); ?></td>
                <td><?php echo htmlspecialchars($data['pcsform10'] ?? ''); ?></td>
                <td><?php echo htmlspecialchars($data['mc'] ?? ''); ?></td>
                <td><?php echo htmlspecialchars($data['kg'] ?? ''); ?></td>
                <td><?php echo htmlspecialchars($data['pcs'] ?? ''); ?></td>
                <td><?php echo htmlspecialchars($data['looseinkg'] ?? ''); ?></td>
                <td><?php echo htmlspecialchars($data['looseinpcs'] ?? ''); ?></td>
                <td><?php echo htmlspecialchars($data['looseoutkg'] ?? ''); ?></td>
                <td><?php echo htmlspecialchars($data['looseoutpcs'] ?? ''); ?></td>
                <td><?php echo round(floatval($data['total_kg'] ?? 0), 2); ?></td>

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

              <!-- UPDATE MODAL -->
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
                          <input type="date" name="update" class="form-control inpv2 mb-2" value="<?php echo htmlspecialchars($updatedata['date'] ?? ''); ?>">
                          <div class="row">
                            <div class="col">
                              <label>Type</label>
                              <select class="form-control inpv2 mb-2" name="uptype">
                                <option>Select Type</option>
                                <option value="frozen" <?php if (($updatedata['type'] ?? '') == 'frozen') echo "selected"; ?>>frozen</option>
                                <option value="tcl" <?php if (($updatedata['type'] ?? '') == 'tcl') echo "selected"; ?>>tcl</option>
                              </select>
                            </div>
                            <div class="col">
                              <label>Supplier Name</label>
                              <select name="upsupplier_id" class="form-control inpv2">
                                <?php
                                $supplier_id_stmt = $pdo->prepare("SELECT id, name FROM contacts WHERE is_supplier = 1 OR is_supplier = 0");
                                $supplier_id_stmt->execute();
                                $supplier_id_datas = $supplier_id_stmt->fetchAll(PDO::FETCH_ASSOC);
                                foreach ($supplier_id_datas as $supplier_name_opt) {
                                ?>
                                  <option value="<?php echo htmlspecialchars($supplier_name_opt['id']); ?>" <?php if (($updatedata['supplier_id'] ?? '') == $supplier_name_opt['id']) echo "selected"; ?>><?php echo htmlspecialchars($supplier_name_opt['name']); ?></option>
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
                                    foreach ($prodFilterDatas as $commonditydata_opt) {
                                    ?>
                                      <option value="<?php echo htmlspecialchars($commonditydata_opt['id']); ?>" <?php if (($updatedata['item_id'] ?? '') == $commonditydata_opt['id']) echo "selected"; ?>><?php echo htmlspecialchars($commonditydata_opt['name']); ?></option>
                                    <?php } ?>
                                  </select>
                                </div>
                                <div class="col">
                                  <select name="upfish_type" class="form-control inpv2">
                                    <option value="G" <?php if (($updatedata['fish_type'] ?? '') == 'G') echo "selected"; ?>>G</option>
                                    <option value="egg" <?php if (($updatedata['fish_type'] ?? '') == 'egg') echo "selected"; ?>>egg</option>
                                    <option value="ggs" <?php if (($updatedata['fish_type'] ?? '') == 'ggs') echo "selected"; ?>>ggs</option>
                                    <option value="fillet" <?php if (($updatedata['fish_type'] ?? '') == 'fillet') echo "selected"; ?>>fillet</option>
                                    <option value="W" <?php if (($updatedata['fish_type'] ?? '') == 'W') echo "selected"; ?>>W</option>
                                    <option value="Cut_piece" <?php if (($updatedata['fish_type'] ?? '') == 'Cut_piece') echo "selected"; ?>>Cut Piece</option>
                                    <option value="Scaless" <?php if (($updatedata['fish_type'] ?? '') == 'Scaless') echo "selected"; ?>>Scaless</option>
                                    <option value="Bls" <?php if (($updatedata['fish_type'] ?? '') == 'Bls') echo "selected"; ?>>Bl's</option>
                                    <option value="iqf" <?php if (($updatedata['fish_type'] ?? '') == 'iqf') echo "selected"; ?>>IQF</option>
                                  </select>
                                </div>
                              </div>
                            </div>
                            <div class="col">
                              <label>Country</label>
                              <input type="text" name="upcountry" class="form-control inpv2 mb-2" value="<?php echo htmlspecialchars($updatedata['country'] ?? ''); ?>">
                            </div>
                          </div>
                          <div class="row">
                            <div class="col">
                              <label>Size</label>
                              <input type="text" name="upsize" class="form-control inpv2 mb-2" value="<?php echo htmlspecialchars($updatedata['size'] ?? ''); ?>">
                            </div>
                            <div class="col">
                              <label>Mc</label>
                              <input type="number" name="upmc" class="form-control inpv2 mb-2" value="<?php echo htmlspecialchars($updatedata['mc'] ?? ''); ?>">
                            </div>
                          </div>
                          <div class="row">
                            <div class="col">
                              <label>Kg</label>
                              <input type="text" name="upkg" class="form-control inpv2 mb-2" value="<?php echo htmlspecialchars($updatedata['kg'] ?? ''); ?>">
                            </div>
                            <div class="col">
                              <label>Pcs</label>
                              <input type="text" name="uppcs" class="form-control inpv2 mb-2" value="<?php echo htmlspecialchars($updatedata['pcs'] ?? ''); ?>">
                            </div>
                          </div>
                          <div class="row">
                            <div class="col">
                              <label>Loose In Kg</label>
                              <input type="text" name="uploose_in_kg" class="form-control inpv2 mb-2" value="<?php echo htmlspecialchars($updatedata['looseinkg'] ?? ''); ?>">
                            </div>
                            <div class="col">
                              <label>Loose In Pcs</label>
                              <input type="number" name="uploose_in_pcs" class="form-control inpv2 mb-2" value="<?php echo htmlspecialchars($updatedata['looseinpcs'] ?? ''); ?>">
                            </div>
                          </div>
                          <div class="row">
                            <div class="col">
                              <label>Loose Out Kg</label>
                              <input type="text" name="uploose_out_kg" class="form-control inpv2 mb-2" value="<?php echo htmlspecialchars($updatedata['looseoutkg'] ?? ''); ?>">
                            </div>
                            <div class="col">
                              <label>Loose Out Pcs</label>
                              <input type="number" name="uploose_out_pcs" class="form-control inpv2 mb-2" value="<?php echo htmlspecialchars($updatedata['looseoutpcs'] ?? ''); ?>">
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
  <?php $bootstrap->javascript(); ?>
</body>

</html>