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
    $upcountry = $_POST['upcountry'];
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

  // Handle Main Table Header Filters
  if (isset($_POST['view'])) {
    $_SESSION['search_tcl']['commondity'] = $_POST['commondity'];
    $_SESSION['search_tcl']['searchdate'] = $_POST['searchdate'];
  }
  if (isset($_POST['clearfilter'])) {
    $_SESSION['search_tcl']['commondity'] = '';
    $_SESSION['search_tcl']['searchdate'] = '';
  }

  $isViewMode = (!empty($_SESSION['search_tcl']['commondity']) || !empty($_SESSION['search_tcl']['searchdate']));
  $hasBothFilters = (!empty($_SESSION['search_tcl']['commondity']) && !empty($_SESSION['search_tcl']['searchdate']));
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
            <b class="h5">Link Mark Limited (F-10) TCL</b>
            <a href="add_form_10_tcl.php" class="btn btn-success btn-sm float-end ms-2">Add Form-10 Data</a>

            <?php if ($hasBothFilters): ?>
              <a href="export.php?table_name=form_10_tcl&searchdate=<?= $_SESSION['search_tcl']['searchdate']; ?>&searchcommondity=<?= $_SESSION['search_tcl']['commondity']; ?>" class="btn btn-dark btn-sm float-end me-2">Export Excel</a>
            <?php endif; ?>

            <button type="submit" name="clearfilter" class="btn btn-secondary btn-sm float-end me-2" style="border-top-left-radius:0px; border-bottom-left-radius:0px;">Clear Filter</button>
            <button type="submit" name="view" class="btn btn-primary btn-sm float-end me-2" style="border-top-left-radius:0px; border-bottom-left-radius:0px;">View</button>

            <select name="commondity" class="form-control inpv2 w-25 d-inline float-end me-2" style="width: 12% !important; height: 27px !important; padding-top: 1.5px !important;">
              <option value="">Select Commondity</option>
              <?php
              $commonstmt = $pdo->prepare("SELECT DISTINCT item_id FROM form10stocktcl WHERE item_id IS NOT NULL AND item_id != ''");
              $commonstmt->execute();
              $commondatas = $commonstmt->fetchall();
              foreach ($commondatas as $commondata) {
                $itemid = $commondata['item_id'];
                $item_name = $query->select('products', $itemid, 'id');
                if (!empty($item_name) && isset($item_name['id'], $item_name['name'])) {
              ?>
                  <option value="<?php echo htmlspecialchars($item_name['id']); ?>" <?php if (!empty($_SESSION['search_tcl']['commondity']) && $_SESSION['search_tcl']['commondity'] == $item_name['id']) echo "selected"; ?>><?php echo htmlspecialchars($item_name['name']); ?></option>
              <?php
                }
              }
              ?>
            </select>
            <input type="date" name="searchdate" value="<?php echo !empty($_SESSION['search_tcl']['searchdate']) ? $_SESSION['search_tcl']['searchdate'] : ''; ?>" class="form-control inpv2 w-25 d-inline float-end me-2" style="width: 12% !important; height: 27px !important; padding-top: 1.5px !important;">
          </form>
        </div>
        <div class="card-body table-responsive">
          <table class="table table-hover table-striped table-bordered" style="font-size: 13px;">
            <tr class="text-center">
              <th rowspan="2" style="padding-top:25px;">Date</th>
              <th rowspan="2" style="padding-top:25px;">Commondity</th>
              <th rowspan="2" style="padding-top:25px;">Size</th>
              <th colspan="4">Production</th>
              <th colspan="2">Loose In</th>
              <th colspan="2">Loose Out</th>
              <th colspan="2">CC Balance</th>
              <th colspan="2">လမ်းငါး</th>
              <th colspan="2">Cut Piece</th>
              <th colspan="2">HHK</th>
              <th colspan="2">MSL</th>
              <th rowspan="2" style="padding-top:25px;">Total</th>
              <th rowspan="2" style="padding-top:25px;">Action</th>
              <?php if ($isViewMode) { ?><th rowspan="2" style="padding-top:25px;">%</th><?php } ?>
            </tr>
            <tr class="text-center">
              <th>PCS/F-10</th>
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
            </tr>

            <?php
            $sql = "SELECT * FROM form10stocktcl";
            $conditions = [];
            $nodata = true;
            $datas = [];

            // Independent filtering: works with single or dual filters
            if (!empty($_SESSION['search_tcl']['commondity'])) {
              $conditions[] = "item_id = '" . $_SESSION['search_tcl']['commondity'] . "'";
              $nodata = false;
            }
            if (!empty($_SESSION['search_tcl']['searchdate'])) {
              $conditions[] = "date = '" . $_SESSION['search_tcl']['searchdate'] . "'";
              $nodata = false;
            }

            try {
              if (!$nodata) {
                $sql .= " WHERE " . implode(" AND ", $conditions);
              }
              $stmt = $pdo->prepare($sql);
              $stmt->execute();
              $datas = $stmt->fetchAll(PDO::FETCH_ASSOC);
            } catch (PDOException $e) {
              $datas = [];
            }

            // Init Totals
            $t_pcsform10 = 0;
            $t_mc = 0;
            $t_kg = 0;
            $t_pcs = 0;
            $t_looseinkg = 0;
            $t_looseinpcs = 0;
            $t_looseoutkg = 0;
            $t_looseoutpcs = 0;
            $t_cc_kg = 0;
            $t_cc_pcs = 0;
            $t_lanfish_kg = 0;
            $t_lanfish_pcs = 0;
            $t_cutpiece_kg = 0;
            $t_cutpiece_pcs = 0;
            $t_hhk_kg = 0;
            $t_hhk_pcs = 0;
            $t_msl_kg = 0;
            $t_msl_pcs = 0;
            $t_total_kg = 0;

            foreach ($datas as $data) {
              $item_id = $data['item_id'];
              $commonditydata = $query->select('products', $item_id, 'id');

              $t_pcsform10 += floatval($data['pcsform10']);
              $t_mc += floatval($data['mc']);
              $t_kg += floatval($data['kg']);
              $t_pcs += floatval($data['pcs']);
              $t_looseinkg += floatval($data['looseinkg']);
              $t_looseinpcs += floatval($data['looseinpcs']);
              $t_looseoutkg += floatval($data['looseoutkg']);
              $t_looseoutpcs += floatval($data['looseoutpcs']);
              $t_cc_kg += floatval($data['cc_kg']);
              $t_cc_pcs += floatval($data['cc_pcs']);
              $t_lanfish_kg += floatval($data['lanfish_kg']);
              $t_lanfish_pcs += floatval($data['lanfish_pcs']);
              $t_cutpiece_kg += floatval($data['cutpiece_kg']);
              $t_cutpiece_pcs += floatval($data['cutpiece_pcs']);
              $t_hhk_kg += floatval($data['hhk_kg']);
              $t_hhk_pcs += floatval($data['hhk_pcs']);
              $t_msl_kg += floatval($data['msl_kg']);
              $t_msl_pcs += floatval($data['msl_pcs']);
              $t_total_kg += floatval($data['total_kg']);
            ?>
              <tr>
                <td><?php echo date('d-m-Y', strtotime($data['date'])); ?></td>
                <td><?php echo htmlspecialchars($commonditydata['name'] ?? 'Unknown'); ?></td>
                <td><?php echo htmlspecialchars($data['size']); ?></td>
                <td><?php echo htmlspecialchars($data['pcsform10']); ?></td>
                <td><?php echo htmlspecialchars($data['mc']); ?></td>
                <td><?php echo htmlspecialchars($data['kg']); ?></td>
                <td><?php echo htmlspecialchars($data['pcs']); ?></td>
                <td><?php echo htmlspecialchars($data['looseinkg']); ?></td>
                <td><?php echo htmlspecialchars($data['looseinpcs']); ?></td>
                <td><?php echo htmlspecialchars($data['looseoutkg']); ?></td>
                <td><?php echo htmlspecialchars($data['looseoutpcs']); ?></td>
                <td><?php echo htmlspecialchars($data['cc_kg']); ?></td>
                <td><?php echo htmlspecialchars($data['cc_pcs']); ?></td>
                <td><?php echo htmlspecialchars($data['lanfish_kg']); ?></td>
                <td><?php echo htmlspecialchars($data['lanfish_pcs']); ?></td>
                <td><?php echo htmlspecialchars($data['cutpiece_kg']); ?></td>
                <td><?php echo htmlspecialchars($data['cutpiece_pcs']); ?></td>
                <td><?php echo htmlspecialchars($data['hhk_kg']); ?></td>
                <td><?php echo htmlspecialchars($data['hhk_pcs']); ?></td>
                <td><?php echo htmlspecialchars($data['msl_kg']); ?></td>
                <td><?php echo htmlspecialchars($data['msl_pcs']); ?></td>
                <td><?php echo round($data['total_kg'], 2); ?></td>
                <td>
                  <button type="submit" data-bs-toggle="modal" data-bs-target="#updatemodal<?= $data['id']; ?>" class="btn btn-warning text-light btn-sm d-inline"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                      <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                      <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                    </svg></button>
                </td>
                <?php if ($isViewMode) { ?><td>-</td><?php } ?>
              </tr>

              <!-- Update Modal -->
              <div class="modal fade" id="updatemodal<?= $data['id']; ?>" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                  <div class="modal-content" style="width: 650px !important; margin-top:70px !important;">
                    <div class="modal-header bg-warning text-light">
                      <h1 class="modal-title fs-5">Update Data</h1>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="" method="post">
                      <input type="hidden" name="upid" value="<?php echo $data['id']; ?>">
                      <div class="modal-body">
                        <label>Date</label>
                        <input type="date" name="update" class="form-control inpv2 mb-2" value="<?php echo htmlspecialchars($data['date']); ?>">
                        <div class="row">
                          <div class="col">
                            <label>Commondity</label>
                            <select class="form-control inpv2 mb-2" name="upitem_id">
                              <?php
                              $form7commonditystmt = $pdo->prepare("SELECT id, name FROM products ORDER BY name ASC");
                              $form7commonditystmt->execute();
                              $form7commonditydatas = $form7commonditystmt->fetchall();
                              foreach ($form7commonditydatas as $commonditydata_opt) {
                              ?>
                                <option value="<?php echo htmlspecialchars($commonditydata_opt['id']); ?>" <?php if ($data['item_id'] == $commonditydata_opt['id']) echo "selected"; ?>><?php echo htmlspecialchars($commonditydata_opt['name']); ?></option>
                              <?php } ?>
                            </select>
                          </div>
                          <div class="col">
                            <label>Country</label>
                            <input type="text" name="upcountry" class="form-control inpv2 mb-2" value="<?php echo htmlspecialchars($data['country']); ?>">
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <label>Size</label>
                            <input type="text" name="upsize" class="form-control inpv2 mb-2" value="<?php echo htmlspecialchars($data['size']); ?>">
                          </div>
                          <div class="col">
                            <label>Mc</label>
                            <input type="number" name="upmc" class="form-control inpv2 mb-2" value="<?php echo htmlspecialchars($data['mc']); ?>">
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <label>Kg</label>
                            <input type="text" name="upkg" class="form-control inpv2 mb-2" value="<?php echo htmlspecialchars($data['kg']); ?>">
                          </div>
                          <div class="col">
                            <label>Pcs</label>
                            <input type="text" name="uppcs" class="form-control inpv2 mb-2" value="<?php echo htmlspecialchars($data['pcs']); ?>">
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <label>Loose In Kg</label>
                            <input type="text" name="uploose_in_kg" class="form-control inpv2 mb-2" value="<?php echo htmlspecialchars($data['looseinkg']); ?>">
                          </div>
                          <div class="col">
                            <label>Loose In Pcs</label>
                            <input type="number" name="uploose_in_pcs" class="form-control inpv2 mb-2" value="<?php echo htmlspecialchars($data['looseinpcs']); ?>">
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <label>Loose Out Kg</label>
                            <input type="text" name="uploose_out_kg" class="form-control inpv2 mb-2" value="<?php echo htmlspecialchars($data['looseoutkg']); ?>">
                          </div>
                          <div class="col">
                            <label>Loose Out Pcs</label>
                            <input type="number" name="uploose_out_pcs" class="form-control inpv2 mb-2" value="<?php echo htmlspecialchars($data['looseoutpcs']); ?>">
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
            // Calculate Form 7 Percentage safely only if BOTH filters are present and Form 7 data matches
            $percentage = "";
            if ($hasBothFilters) {
              try {
                $c_id = $_SESSION['search_tcl']['commondity'];
                $s_date = $_SESSION['search_tcl']['searchdate'];

                $lastsearchdatestmt = $pdo->prepare("SELECT * FROM form10stocktcl WHERE date < ? ORDER BY id DESC LIMIT 1");
                $lastsearchdatestmt->execute([$s_date]);
                $lastsearchdate = $lastsearchdatestmt->fetch(PDO::FETCH_ASSOC);
                $l_date = !empty($lastsearchdate['date']) ? $lastsearchdate['date'] : '0000-00-00';

                $totalf7kgstmt = $pdo->prepare("SELECT SUM(kg) AS total_kg FROM form7stocktcl WHERE item_id = ? AND date BETWEEN ? AND ?");
                $totalf7kgstmt->execute([$c_id, $l_date, $s_date]);
                $totalf7kgdata = $totalf7kgstmt->fetch(PDO::FETCH_ASSOC);

                if ($totalf7kgdata && isset($totalf7kgdata['total_kg']) && floatval($totalf7kgdata['total_kg']) != 0) {
                  $f7_kg = floatval($totalf7kgdata['total_kg']);
                  $result1 = round($t_total_kg, 2) - round($f7_kg, 2);
                  $percentage = ($result1 / round($f7_kg, 2)) * 100;
                }
              } catch (Exception $e) {
                $percentage = "";
              }
            }
            ?>

            <?php if (count($datas) > 0) { ?>
              <tr style="background-color: #f8f9fa;">
                <td></td>
                <td style="font-weight:bold;">Total</td>
                <td></td>
                <td style="font-weight:bold;"><?php echo round($t_pcsform10, 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($t_mc, 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($t_kg, 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($t_pcs, 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($t_looseinkg, 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($t_looseinpcs, 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($t_looseoutkg, 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($t_looseoutpcs, 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($t_cc_kg, 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($t_cc_pcs, 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($t_lanfish_kg, 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($t_lanfish_pcs, 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($t_cutpiece_kg, 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($t_cutpiece_pcs, 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($t_hhk_kg, 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($t_hhk_pcs, 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($t_msl_kg, 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($t_msl_pcs, 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($t_total_kg, 2); ?></td>
                <td></td>
                <?php if ($isViewMode) { ?>
                  <td style="font-weight:bold; <?php if ($percentage !== "" && strpos(round(floatval($percentage), 2), '-') !== false) echo 'color:red;'; ?>">
                    <?php echo ($percentage !== "") ? round(floatval($percentage), 2) . "%" : "-"; ?>
                  </td>
                <?php } ?>
              </tr>
            <?php } ?>
          </table>
        </div>
      </div>
    </div>
  </div>

  <script>
    $(document).ready(function() {
      // Force-hide stuck loader/spinner overlay
      $('.loader, #preloader, .spinner-overlay, div:has(> .spinner-border)').fadeOut('fast');
    });
  </script>

  <?php $bootstrap->javascript(); ?>
</body>

</html>