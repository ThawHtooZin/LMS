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

<body>
  <?php

  $form7Alert = function ($message) {
    echo '<script>swal("Error!", ' . json_encode($message) . ', "error");</script>';
  };
  $allowedFishTypes = ['G', 'egg', 'ggs', 'fillet', 'W', 'Cut_piece', 'Scaless', 'Bls', 'iqf'];
  $allowedTypes = ['frozen', 'tcl'];

  if (isset($_POST['update'])) {
    $pcsperf7 = trim($_POST['pcsperf7'] ?? '');
    $updateid = $_POST['id'] ?? '';

    if (!ctype_digit((string) $updateid) || (int) $updateid < 1) {
      $form7Alert('Invalid row to update.');
    } elseif ($pcsperf7 === '' || filter_var($pcsperf7, FILTER_VALIDATE_INT) === false || (int) $pcsperf7 < 0) {
      $form7Alert('Pcs per F-7 must be a whole number zero or greater.');
    } else {
      $existing_data = $query->select('form7stock', $updateid, 'id');
      if (!$existing_data) {
        $form7Alert('Row not found.');
      } else {
        $country = $existing_data['country'] ?? '';
        $query->updatefrozencountry($country, $pcsperf7, $updateid);
      }
    }
  }

  if (isset($_POST['addsize'])) {
    $id = $_POST['id'] ?? '';
    $size = trim($_POST['size'] ?? '');

    if (!ctype_digit((string) $id) || (int) $id < 1) {
      $form7Alert('Invalid row to update.');
    } elseif ($size === '') {
      $form7Alert('Size is required.');
    } elseif (strlen($size) > 11) {
      $form7Alert('Size must be 11 characters or fewer.');
    } else {
      $source = $query->select('form7stock', $id, 'id');
      if (!$source) {
        $form7Alert('Row not found.');
      } else {
        $query->addsize($id, $size);
      }
    }
  }

  if (isset($_POST['bulk_update_btn'])) {
    $bulk_ids = $_POST['bulk_ids'] ?? '';
    $bulk_country = trim($_POST['bulk_country'] ?? '');
    $bulk_fish_type = trim($_POST['bulk_fish_type'] ?? '');
    $idParts = array_filter(array_map('trim', explode(',', (string) $bulk_ids)), function ($id) {
      return ctype_digit($id) && (int) $id > 0;
    });

    if (count($idParts) === 0) {
      $form7Alert('Select at least one row to update.');
    } elseif ($bulk_country === '' && $bulk_fish_type === '') {
      $form7Alert('Enter a country or select a fish type. Leave a field blank only to keep its current value.');
    } elseif (strlen($bulk_country) > 155) {
      $form7Alert('Country must be 155 characters or fewer.');
    } elseif ($bulk_fish_type !== '' && !in_array($bulk_fish_type, $allowedFishTypes, true)) {
      $form7Alert('Select a valid fish type.');
    } else {
      $query->bulkUpdateForm7Frozen(implode(',', $idParts), $bulk_country, $bulk_fish_type);
    }
  }

  if (isset($_POST['addform7'])) {
    $date = trim($_POST['date'] ?? '');
    $commondity_id = trim($_POST['item_id'] ?? '');
    $supplier_name = trim($_POST['supplier_id'] ?? '');
    $type = trim($_POST['type'] ?? '');
    $size = trim($_POST['size'] ?? '');
    $viss = trim($_POST['viss'] ?? '');

    $dateOk = (bool) preg_match('/^\d{4}-\d{2}-\d{2}$/', $date);
    if ($dateOk) {
      $parts = explode('-', $date);
      $dateOk = checkdate((int) $parts[1], (int) $parts[2], (int) $parts[0]);
    }

    if (!$dateOk) {
      $form7Alert('Date is required.');
    } elseif ($commondity_id === '' || strlen($commondity_id) > 11) {
      $form7Alert('Fish Name is required.');
    } elseif ($supplier_name === '' || strlen($supplier_name) > 255) {
      $form7Alert('Supplier Name is required.');
    } elseif (!in_array($type, $allowedTypes, true)) {
      $form7Alert('Select a type.');
    } elseif ($size === '') {
      $form7Alert('Size is required.');
    } elseif (strlen($size) > 11) {
      $form7Alert('Size must be 11 characters or fewer.');
    } elseif ($viss === '' || !is_numeric($viss) || floatval($viss) <= 0 || strlen($viss) > 11) {
      $form7Alert('Viss must be a number greater than zero (11 characters or fewer).');
    } else {
      $query->addform7($date, $commondity_id, $supplier_name, $type, $size, $viss);
    }
  }

  if (isset($_POST['deleteform7'])) {
    $deleteid = $_POST['deleteid'] ?? '';
    if (!ctype_digit((string) $deleteid) || (int) $deleteid < 1) {
      $form7Alert('Invalid row to delete.');
    } else {
      $query->form7frozendelete($deleteid);
    }
  }

  if (isset($_POST['waterkgupdate'])) {
    $waterkgid = $_POST['waterkgid'] ?? '';
    $waterkg = trim($_POST['waterkg'] ?? '');

    if (!ctype_digit((string) $waterkgid) || (int) $waterkgid < 1) {
      $form7Alert('Invalid row to update.');
    } elseif ($waterkg === '' || filter_var($waterkg, FILTER_VALIDATE_INT) === false || (int) $waterkg < 0) {
      $form7Alert('Water Kg must be a whole number zero or greater.');
    } else {
      $row = $query->select('form7stock', $waterkgid, 'id');
      if (!$row) {
        $form7Alert('Row not found.');
      } else {
        $originalKg = floatval($row['viss'] ?? 0) * 1.634;
        if ((float) $waterkg > $originalKg) {
          $form7Alert('Water Kg cannot be greater than Original Kg (' . round($originalKg, 4) . ').');
        } else {
          $query->waterkg($waterkgid, $waterkg);
        }
      }
    }
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
  ?>
  <div class="row">
    <div class="sidebarcol" id="sidebar">
      <?php include 'sidebar.php'; ?>
    </div>
    <div class="contentcol" id="content">
      <?php require 'navbar.php'; ?>
      <div class="card">
        <form action="" method="post">
          <div class="card-header bg-info text-light pb-3">

            <b class="h5">Link Mark Limited (F-7) Frozen</b>
            <button type="button" class="btn btn-warning btn-sm float-end ms-2" onclick="openBulkModal()">Bulk Update</button>
            <button type="button" class="btn btn-success btn-sm float-end ms-2" data-bs-toggle="modal" data-bs-target="#addmodal">Add Data</button>

            <button type="submit" name="clearfilter" class="btn btn-secondary btn-sm float-end me-2" style="border-top-left-radius:0px; border-bottom-left-radius:0px;">Clear Filter</button>
            <button type="submit" name="searchbtn" class="btn btn-primary btn-sm float-end me-2" style="border-top-left-radius:0px; border-bottom-left-radius:0px;">View</button>

            <select name="commondity_id" class="form-control inpv2 d-inline float-end" style="margin-left:5px; width: 10%; height:26px !important; padding:0px 2px;">
              <option value="">Select Commondity</option>
              <?php
              $commonstmt = $pdo->prepare("SELECT DISTINCT item_id FROM form7stock");
              $commonstmt->execute();
              $commondatas = $commonstmt->fetchAll();

              foreach ($commondatas as $commondata) {
                $item_id = $commondata['item_id'];
                if (empty($item_id)) continue;
                // REFACTORED: Querying 'products' table directly
                $prodStmt = $pdo->prepare("SELECT name FROM products WHERE id = ? LIMIT 1");
                $prodStmt->execute([$item_id]);
                $prodName = $prodStmt->fetchColumn();
                $display_name = $prodName ? $prodName : 'Unknown Product';
              ?>
                <option value="<?php echo htmlspecialchars($item_id); ?>" <?php if (!empty($_SESSION['search']['searchcommondity']) && $_SESSION['search']['searchcommondity'] == $item_id) echo "selected"; ?>>
                  <?php echo htmlspecialchars($display_name); ?>
                </option>
              <?php } ?>
            </select>
            <input type="date" name="date" value="<?php if (!empty($_SESSION['search']['searchdate'])) {
                                                    echo htmlspecialchars($_SESSION['search']['searchdate']);
                                                  } ?>" class="form-control inpv2 d-inline float-end" style="margin-left:5px; width: 14%; height:26px !important; padding:0px 2px;">
            <select name="size" class="form-control inpv2 d-inline float-end" style="margin-left:5px; width: 10%; height:26px !important; padding:0px 2px;">
              <option value="">Select Size</option>
              <?php
              $sizestmt = $pdo->prepare("SELECT DISTINCT size FROM form7stock");
              $sizestmt->execute();
              $sizedatas = $sizestmt->fetchAll();

              foreach ($sizedatas as $sizedata) {
                if (empty($sizedata['size'])) continue;
              ?>
                <option value="<?php echo htmlspecialchars($sizedata['size']); ?>" <?php if (!empty($_SESSION['search']['searchsize']) && $_SESSION['search']['searchsize'] == $sizedata['size']) echo "selected"; ?>>
                  <?php echo htmlspecialchars($sizedata['size']); ?>
                </option>
              <?php } ?>
            </select>
          </div>
        </form>
        <div class="card-body">
          <table class="table table-hover table-striped table-bordered">
            <tr>
              <th style="width: 1%;"><input type="checkbox" onclick="toggleAllRows(this)"></th>
              <th>Date</th>
              <th>Fish Name</th>
              <th>Supplier Name</th>
              <th>Type</th>
              <th>Country</th>
              <th>Size</th>
              <th>Viss</th>
              <th>Original Kg</th>
              <th>Water Kg</th>
              <th>Kg</th>
              <th>Pcs per Vr</th>
              <th>Pcs per F-7</th>
              <th>Action</th>
            </tr>
            <?php
            // Initialize variables
            $commondity_id = !empty($_SESSION['search']['searchcommondity']) ? $_SESSION['search']['searchcommondity'] : '';
            $searchdate = !empty($_SESSION['search']['searchdate']) ? $_SESSION['search']['searchdate'] : '';
            $searchsize = !empty($_SESSION['search']['searchsize']) ? $_SESSION['search']['searchsize'] : '';

            // Initialize base query and conditions
            $sql = "SELECT * FROM form7stock";
            $conditions = [];

            if ($commondity_id != '') {
              $conditions[] = "item_id = :commondity_id";
            }
            if ($searchdate != '') {
              $conditions[] = "date = :searchdate";
            }
            if ($searchsize != '') {
              $conditions[] = "size = :searchsize";
            }

            if (count($conditions) > 0) {
              $sql .= " WHERE " . implode(" AND ", $conditions);
            }

            $stmt = $pdo->prepare($sql);

            if ($commondity_id != '') {
              $stmt->bindParam(':commondity_id', $commondity_id, PDO::PARAM_STR);
            }
            if ($searchdate != '') {
              $stmt->bindParam(':searchdate', $searchdate, PDO::PARAM_STR);
            }
            if ($searchsize != '') {
              $stmt->bindParam(':searchsize', $searchsize, PDO::PARAM_STR);
            }

            $stmt->execute();
            $datas = $stmt->fetchAll(PDO::FETCH_ASSOC);

            // Accumulator variables
            $total_viss = 0;
            $total_kg = 0;
            $total_pcs = 0;
            $total_pcsf7 = 0;

            foreach ($datas as $form7data) {
              $item_id = $form7data['item_id'] ?? '';

              // REFACTORED: Direct Product Lookup
              $prodStmt = $pdo->prepare("SELECT name FROM products WHERE id = ? LIMIT 1");
              $prodStmt->execute([$item_id]);
              $item_name_val = $prodStmt->fetchColumn() ?: 'Unknown Product';

              $supplier_id = $form7data['supplier_name'] ?? '';

              // REFACTORED: Direct Supplier Lookup from new accounts/contacts structure
              $supStmt = $pdo->prepare("SELECT name FROM accodes WHERE code = ? UNION SELECT name FROM contacts WHERE id = ? LIMIT 1");
              $supStmt->execute([$supplier_id, $supplier_id]);
              $supplier_name_val = $supStmt->fetchColumn() ?: $supplier_id;

              // Accumulate totals dynamically
              $total_viss += floatval($form7data['viss'] ?? 0);
              $total_kg += floatval($form7data['kg'] ?? 0);
              $total_pcs += floatval($form7data['pcspervr'] ?? 0);
              $total_pcsf7 += floatval($form7data['pcsperf7'] ?? 0);
            ?>
              <tr>
                <td><input type="checkbox" class="row-checkbox" value="<?php echo $form7data['id']; ?>"></td>
                <td><?php if (!empty($form7data['date']) && $form7data['date'] != "0000-00-00") {
                      echo date('d-m-Y', strtotime($form7data['date']));
                    }; ?></td>
                <td><?php echo htmlspecialchars($item_name_val) . "(" . htmlspecialchars($form7data['fish_type'] ?? '') . ")"; ?></td>
                <td><?php echo htmlspecialchars($supplier_name_val); ?></td>
                <td><?php echo htmlspecialchars($form7data['type'] ?? ''); ?></td>
                <td><?php echo htmlspecialchars($form7data['country'] ?? ''); ?></td>
                <td data-bs-toggle="modal" data-bs-target="#updatesizemodal<?php echo $form7data['id']; ?>"><?php echo htmlspecialchars($form7data['size'] ?? ''); ?></td>
                <td><?php echo htmlspecialchars($form7data['viss'] ?? '0'); ?></td>
                <td><?php echo floatval($form7data['viss'] ?? 0) * 1.634; ?></td>
                <td data-bs-toggle="modal" data-bs-target="#waterkgmodal<?php echo $form7data['id']; ?>"><?php if (!empty($form7data['water_kg'])) {
                                                                                                            echo htmlspecialchars($form7data['water_kg']);
                                                                                                          } ?></td>
                <td><?php echo htmlspecialchars($form7data['kg'] ?? '0'); ?></td>
                <td><?php echo htmlspecialchars($form7data['pcspervr'] ?? '0'); ?></td>
                <td data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $form7data['id']; ?>"><?php if (!empty($form7data['pcsperf7'])) {
                                                                                                          echo htmlspecialchars($form7data['pcsperf7']);
                                                                                                        }; ?></td>
                <td>
                  <form action="form_7_frozen.php" method="post">
                    <input type="hidden" name="deleteid" value="<?php echo $form7data['id']; ?>">
                    <button type="submit" name="deleteform7" value="1" class="btn btn-danger btn-sm" onclick="event.stopPropagation(); if (window.lmsConfirmDelete) { lmsConfirmDelete(this, 'Are you sure you want to delete this Form 7 record?'); return false; } return confirm('Are you sure you want to delete this Form 7 record?');">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
                        <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z" />
                      </svg>
                    </button>
                  </form>
                </td>
              </tr>

              <!-- WATER KG MODAL -->
              <div class="modal fade" id="waterkgmodal<?php echo $form7data['id']; ?>">
                <div class="modal-dialog" role="document">
                  <div class="modal-content" style="width: 650px !important; margin-top:70px !important;">
                    <div class="modal-header bg-warning text-light">
                      <h1 class="modal-title fs-5">Add WaterKg</h1>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="form_7_frozen.php" method="post" novalidate onsubmit="return validateWaterKg(this)">
                      <div class="modal-body">
                        <input type="hidden" name="waterkgid" value="<?php echo $form7data['id']; ?>">
                        <?php
                        $idd = $form7data['id'];
                        $updata = $query->select('form7stock', $idd, 'id');
                        $safe_waterkg = $updata ? ($updata['water_kg'] ?? '') : '';
                        $originalKg = floatval($form7data['viss'] ?? 0) * 1.634;
                        ?>
                        <label>Water Kg</label>
                        <input type="number" name="waterkg" min="0" step="1" max="<?php echo htmlspecialchars((string) $originalKg); ?>" class="form-control inpv2 mt-1" value="<?php echo htmlspecialchars((string) $safe_waterkg); ?>" required>
                        <small class="text-muted">Whole number from 0 up to Original Kg (<?php echo round($originalKg, 4); ?>).</small>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-warning" name="waterkgupdate">Update</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>

              <!-- UPDATE MODAL -->
              <div class="modal fade" id="updatemodal<?php echo $form7data['id']; ?>">
                <div class="modal-dialog" role="document">
                  <div class="modal-content" style="margin-top:70px !important;">
                    <div class="modal-header bg-warning text-light">
                      <h1 class="modal-title fs-5">Update Data</h1>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="form_7_frozen.php" method="post" novalidate onsubmit="return validatePcsPerF7(this)">
                      <div class="modal-body">
                        <input type="hidden" name="id" value="<?php echo $form7data['id']; ?>">
                        <?php
                        $idd = $form7data['id'];
                        $updata = $query->select('form7stock', $idd, 'id');
                        $safe_pcsperf7 = $updata ? ($updata['pcsperf7'] ?? '') : '';
                        ?>
                        <label>Pcs Per F7</label>
                        <input type="number" name="pcsperf7" min="0" step="1" class="form-control inpv2 mt-1" value="<?php echo htmlspecialchars((string) $safe_pcsperf7); ?>" required>
                        <small class="text-muted">Whole number, zero or greater.</small>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-warning" name="update">Update</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>

              <!-- ADD SIZE MODAL -->
              <div class="modal fade" id="updatesizemodal<?php echo $form7data['id']; ?>">
                <div class="modal-dialog" role="document">
                  <div class="modal-content" style="width: 650px !important; margin-top:70px !important;">
                    <div class="modal-header bg-primary text-light">
                      <h1 class="modal-title fs-5">Add Size</h1>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="form_7_frozen.php" method="post" novalidate onsubmit="return validateForm7Size(this)">
                      <div class="modal-body">
                        <input type="hidden" name="id" value="<?php echo $form7data['id']; ?>">
                        <?php
                        $idd = $form7data['id'];
                        $updata = $query->select('form7stock', $idd, 'id');
                        $safe_size = $updata ? ($updata['size'] ?? '') : '';
                        ?>
                        <label>Size</label>
                        <input type="text" name="size" maxlength="11" class="form-control inpv2 mt-1" value="<?php echo htmlspecialchars($safe_size); ?>" required>
                        <small class="text-muted">Required. Up to 11 characters. This adds a new row with the size you enter.</small>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-warning" name="addsize">Update</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            <?php } ?>

            <?php if (count($datas) > 0) { ?>
              <tr style="font-weight: bold !important; background-color: #f8f9fa;">
                <td></td>
                <td>Total</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><?php echo round($total_viss, 3); ?></td>
                <td></td>
                <td></td>
                <td><?php echo round($total_kg, 4); ?></td>
                <td><?php echo $total_pcs; ?></td>
                <td><?php echo $total_pcsf7; ?></td>
                <td></td>
              </tr>
            <?php } ?>
          </table>
        </div>
      </div>
    </div>
  </div>

  <!-- BULK UPDATE MODAL -->
  <div class="modal fade" id="bulkUpdateModal" tabindex="-1">
    <div class="modal-dialog">
      <div class="modal-content" style="margin-top:70px !important;">
        <div class="modal-header bg-warning text-dark">
          <h5 class="modal-title">Bulk Update Form-7 Data</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form action="form_7_frozen.php" method="post" novalidate onsubmit="return validateBulkForm7(this)">
          <div class="modal-body">
            <input type="hidden" name="bulk_ids" id="bulk_ids" value="">

            <div class="mb-3">
              <label class="fw-bold">Country (Leave blank to ignore)</label>
              <input type="text" name="bulk_country" maxlength="155" class="form-control inpv2">
            </div>

            <div class="mb-3">
              <label class="fw-bold">Fish Type (Leave blank to ignore)</label>
              <select name="bulk_fish_type" class="form-control inpv2">
                <option value="">-- No Change --</option>
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
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-warning" name="bulk_update_btn">Update Selected</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <!-- ADD DATA MODAL -->
  <div class="modal fade" id="addmodal">
    <div class="modal-dialog" role="document">
      <div class="modal-content" style="width: 650px !important; margin-top:70px !important;">
        <div class="modal-header bg-secondary text-light">
          <h1 class="modal-title fs-5">Add New Data</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form action="form_7_frozen.php" method="post" novalidate onsubmit="return validateAddForm7(this)">
          <div class="modal-body">
            <div class="row">
              <div class="col">
                <label>Date</label>
                <input type="date" name="date" class="form-control inpv2 mb-2" required>
              </div>
              <div class="col">
                <label>Fish Name</label>
                <select class="form-control inpv2 mb-2" name="item_id" required>
                  <option value="">Select Fish Name</option>
                  <?php
                  $itemdatas = $query->selectall('products');
                  foreach ($itemdatas as $itemdata) {
                  ?>
                    <option value="<?php echo htmlspecialchars($itemdata['id']); ?>"><?php echo htmlspecialchars($itemdata['name']); ?></option>
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label>Supplier Name</label>
                <select class="form-control inpv2 mb-2" name="supplier_id" required>
                  <option value="">Select Supplier</option>
                  <?php
                  $supplierstmt = $pdo->prepare("SELECT code AS code_no, name AS ac_name FROM accodes UNION SELECT id AS code_no, name AS ac_name FROM contacts");
                  $supplierstmt->execute();
                  $supplierdatas = $supplierstmt->fetchAll(PDO::FETCH_ASSOC);

                  foreach ($supplierdatas as $supplierdata) {
                  ?>
                    <option value="<?php echo htmlspecialchars($supplierdata['code_no']); ?>"><?php echo htmlspecialchars($supplierdata['ac_name']); ?></option>
                  <?php } ?>
                </select>
              </div>
              <div class="col">
                <label>Type</label>
                <select class="form-control inpv2 mb-2" name="type" required>
                  <option value="frozen" selected>Frozen</option>
                  <option value="tcl">TCl</option>
                </select>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label>Size</label>
                <input type="text" name="size" maxlength="11" class="form-control inpv2 mb-2" required>
              </div>
              <div class="col">
                <label>Viss</label>
                <input type="number" name="viss" min="0.001" step="any" class="form-control inpv2 mb-2" required>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-success" name="addform7">Add</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <script type="text/javascript">
    function toggleAllRows(source) {
      const checkboxes = document.querySelectorAll('.row-checkbox');
      checkboxes.forEach(cb => cb.checked = source.checked);
    }

    function markInvalid(input, invalid) {
      if (!input) return;
      input.classList.toggle('redborder', invalid);
    }

    document.addEventListener('input', function (event) {
      if (event.target && event.target.classList) {
        event.target.classList.remove('redborder');
      }
    });
    document.addEventListener('change', function (event) {
      if (event.target && event.target.classList) {
        event.target.classList.remove('redborder');
      }
    });

    function validateAddForm7(form) {
      let message = '';
      const dateBad = !form.date.value;
      markInvalid(form.date, dateBad);
      if (dateBad) message = message || 'Date is required.';

      const itemBad = !form.item_id.value;
      markInvalid(form.item_id, itemBad);
      if (itemBad) message = message || 'Fish Name is required.';

      const supplierBad = !form.supplier_id.value;
      markInvalid(form.supplier_id, supplierBad);
      if (supplierBad) message = message || 'Supplier Name is required.';

      const typeBad = form.type.value !== 'frozen' && form.type.value !== 'tcl';
      markInvalid(form.type, typeBad);
      if (typeBad) message = message || 'Select a type.';

      const size = form.size.value.trim();
      const sizeBad = size === '' || size.length > 11;
      markInvalid(form.size, sizeBad);
      if (size === '') message = message || 'Size is required.';
      else if (size.length > 11) message = message || 'Size must be 11 characters or fewer.';

      const viss = form.viss.value.trim();
      const vissNum = Number(viss);
      const vissBad = viss === '' || Number.isNaN(vissNum) || vissNum <= 0 || viss.length > 11;
      markInvalid(form.viss, vissBad);
      if (vissBad) message = message || 'Viss must be a number greater than zero (11 characters or fewer).';

      if (message) {
        swal('Warning', message, 'warning');
        return false;
      }
      form.size.value = size;
      form.viss.value = viss;
      return true;
    }

    function validatePcsPerF7(form) {
      const value = form.pcsperf7.value.trim();
      const bad = !/^\d+$/.test(value);
      markInvalid(form.pcsperf7, bad);
      if (bad) {
        swal('Warning', 'Pcs per F-7 must be a whole number zero or greater.', 'warning');
        return false;
      }
      return true;
    }

    function validateForm7Size(form) {
      const size = form.size.value.trim();
      const bad = size === '' || size.length > 11;
      markInvalid(form.size, bad);
      if (size === '') {
        swal('Warning', 'Size is required.', 'warning');
        return false;
      }
      if (size.length > 11) {
        swal('Warning', 'Size must be 11 characters or fewer.', 'warning');
        return false;
      }
      form.size.value = size;
      return true;
    }

    function validateWaterKg(form) {
      const value = form.waterkg.value.trim();
      const max = parseFloat(form.waterkg.getAttribute('max'));
      const whole = /^\d+$/.test(value);
      const num = Number(value);
      const overMax = whole && !Number.isNaN(max) && num > max;
      const bad = !whole || overMax;
      markInvalid(form.waterkg, bad);
      if (!whole) {
        swal('Warning', 'Water Kg must be a whole number zero or greater.', 'warning');
        return false;
      }
      if (overMax) {
        swal('Warning', 'Water Kg cannot be greater than Original Kg (' + max + ').', 'warning');
        return false;
      }
      return true;
    }

    function validateBulkForm7(form) {
      const country = form.bulk_country.value.trim();
      const fish = form.bulk_fish_type.value;
      const tooLong = country.length > 155;
      const empty = country === '' && fish === '';
      markInvalid(form.bulk_country, tooLong || empty);
      markInvalid(form.bulk_fish_type, empty);

      if (!form.bulk_ids.value) {
        swal('Warning', 'Please select at least one row to update.', 'warning');
        return false;
      }
      if (empty) {
        swal('Warning', 'Enter a country or select a fish type. Leave a field blank only to keep its current value.', 'warning');
        return false;
      }
      if (tooLong) {
        swal('Warning', 'Country must be 155 characters or fewer.', 'warning');
        return false;
      }
      form.bulk_country.value = country;
      return true;
    }

    function openBulkModal() {
      const checkedBoxes = document.querySelectorAll('.row-checkbox:checked');
      if (checkedBoxes.length === 0) {
        swal("Warning", "Please select at least one row to update.", "warning");
        return;
      }

      const ids = Array.from(checkedBoxes).map(cb => cb.value).join(',');
      document.getElementById('bulk_ids').value = ids;

      var bulkModal = new bootstrap.Modal(document.getElementById('bulkUpdateModal'));
      bulkModal.show();
    }
  </script>

  <?php $bootstrap->javascript(); ?>
</body>

</html>