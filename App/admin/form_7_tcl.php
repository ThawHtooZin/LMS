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

  $form7Alert = function ($message) {
    echo '<script>swal("Error!", ' . json_encode($message) . ', "error");</script>';
  };
  $allowedTypes = ['frozen', 'tcl'];

  if (isset($_POST['update'])) {
    $pcsperf7 = trim($_POST['pcsperf7'] ?? '');
    $updateid = $_POST['id'] ?? '';

    if (!ctype_digit((string) $updateid) || (int) $updateid < 1) {
      $form7Alert('Invalid row to update.');
    } elseif ($pcsperf7 === '' || filter_var($pcsperf7, FILTER_VALIDATE_INT) === false || (int) $pcsperf7 < 0) {
      $form7Alert('Pcs per F-7 must be a whole number zero or greater.');
    } else {
      $existing_data = $query->select('form7stocktcl', $updateid, 'id');
      if (!$existing_data) {
        $form7Alert('Row not found.');
      } else {
        $country = isset($_POST['country']) ? $_POST['country'] : $existing_data['country'];
        $query->updatetclcountry($country, $pcsperf7, $updateid);
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
      $source = $query->select('form7stocktcl', $id, 'id');
      if (!$source) {
        $form7Alert('Row not found.');
      } else {
        $query->addsizetcl($id, $size);
      }
    }
  }

  if (isset($_POST['bulk_update_btn'])) {
    $bulk_ids = $_POST['bulk_ids'] ?? '';
    $bulk_country = trim($_POST['bulk_country'] ?? '');
    $idParts = array_filter(array_map('trim', explode(',', (string) $bulk_ids)), function ($id) {
      return ctype_digit($id) && (int) $id > 0;
    });

    if (count($idParts) === 0) {
      $form7Alert('Select at least one row to update.');
    } elseif ($bulk_country === '') {
      $form7Alert('Country is required.');
    } elseif (strlen($bulk_country) > 155) {
      $form7Alert('Country must be 155 characters or fewer.');
    } else {
      $query->bulkUpdateForm7Tcl(implode(',', $idParts), $bulk_country);
    }
  }

  if (isset($_POST['addform7'])) {
    $date = trim($_POST['date'] ?? '');
    $commondity_id = trim($_POST['item_id'] ?? '');
    $supplier_name = trim($_POST['supplier_id'] ?? '');
    $type = strtolower(trim($_POST['type'] ?? ''));
    $size = trim($_POST['size'] ?? '');
    $viss = trim($_POST['viss'] ?? '');

    $dateOk = (bool) preg_match('/^\d{4}-\d{2}-\d{2}$/', $date);
    if ($dateOk) {
      $parts = explode('-', $date);
      $dateOk = checkdate((int) $parts[1], (int) $parts[2], (int) $parts[0]);
    }

    $itemOk = ctype_digit($commondity_id);
    if ($itemOk) {
      $itemStmt = $pdo->prepare("SELECT id FROM products WHERE id = ?");
      $itemStmt->execute([(int) $commondity_id]);
      $itemOk = (bool) $itemStmt->fetchColumn();
    }

    $supplierOk = ctype_digit($supplier_name);
    if ($supplierOk) {
      $supplierStmt = $pdo->prepare("SELECT id FROM contacts WHERE id = ?");
      $supplierStmt->execute([(int) $supplier_name]);
      $supplierOk = (bool) $supplierStmt->fetchColumn();
    }

    if (!$dateOk) {
      $form7Alert('Date is required.');
    } elseif (!$itemOk) {
      $form7Alert('Fish Name is required.');
    } elseif (!$supplierOk) {
      $form7Alert('Supplier Name is required.');
    } elseif (!in_array($type, $allowedTypes, true)) {
      $form7Alert('Select a type.');
    } elseif ($size === '') {
      $form7Alert('Size is required.');
    } elseif (strlen($size) > 11) {
      $form7Alert('Size must be 11 characters or fewer.');
    } elseif ($viss === '' || !is_numeric($viss) || floatval($viss) <= 0 || strlen($viss) > 11) {
      $form7Alert('Viss must be a number greater than zero (11 characters or fewer).');
    } elseif ($type === 'tcl') {
      $query->addform7tcl($date, $commondity_id, $supplier_name, $size, $viss);
    } else {
      $query->addform7($date, $commondity_id, $supplier_name, $type, $size, $viss);
    }
  }

  if (isset($_POST['deleteform7'])) {
    $deleteid = $_POST['deleteid'];
    $query->form7tcldelete($deleteid);
  }

  if (isset($_POST['searchbtn'])) {
    $_SESSION['search']['searchcommondity'] = $_POST['commondity_id'];
    $_SESSION['search']['searchdate'] = $_POST['searchdate'];
    $_SESSION['search']['searchsize'] = $_POST['searchsize'];
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
            <b class="h5">Link Mark Limited (F-7) TCL</b>
            <button type="button" class="btn btn-warning btn-sm float-end ms-2" onclick="openBulkModal()">Bulk Update</button>
            <button type="button" class="btn btn-success btn-sm float-end ms-2" data-bs-toggle="modal" data-bs-target="#addmodal">Add Data</button>

            <button type="submit" name="clearfilter" class="btn btn-secondary btn-sm float-end me-2" style="border-top-left-radius:0px; border-bottom-left-radius:0px;">Clear Filter</button>
            <button type="submit" name="searchbtn" class="btn btn-primary btn-sm float-end me-2" style="border-top-left-radius:0px; border-bottom-left-radius:0px;">View</button>

            <select name="searchsize" class="form-control inpv2 d-inline float-end ms-1" style="width:12%; height:26px !important; padding:0px 5px;">
              <option value="">Select Size</option>
              <?php
              $sizestmt = $pdo->prepare("SELECT DISTINCT size FROM form7stocktcl WHERE size IS NOT NULL AND size != ''");
              $sizestmt->execute();
              $sizedatas = $sizestmt->fetchAll(PDO::FETCH_ASSOC);
              foreach ($sizedatas as $sizedata) {
                $size = $sizedata['size'];
              ?>
                <option value="<?php echo htmlspecialchars($size); ?>" <?php if (!empty($_SESSION['search']['searchsize']) && $_SESSION['search']['searchsize'] == $size) echo "selected"; ?>><?php echo htmlspecialchars($size); ?></option>
              <?php } ?>
            </select>

            <select name="commondity_id" class="form-control inpv2 d-inline float-end ms-1" style="width:12%; height:26px !important; padding:0px 5px;">
              <option value="">Select Commondity</option>
              <?php
              $commonstmt = $pdo->prepare("SELECT DISTINCT item_id FROM form7stocktcl WHERE item_id IS NOT NULL AND item_id != ''");
              $commonstmt->execute();
              $commondatas = $commonstmt->fetchAll(PDO::FETCH_ASSOC);
              foreach ($commondatas as $commondata) {
                $item_id = $commondata['item_id'];
                $prodStmt = $pdo->prepare("SELECT id, name FROM products WHERE id = ? LIMIT 1");
                $prodStmt->execute([$item_id]);
                $prodData = $prodStmt->fetch(PDO::FETCH_ASSOC);

                if ($prodData) {
              ?>
                  <option value="<?php echo htmlspecialchars($prodData['id']); ?>" <?php if (!empty($_SESSION['search']['searchcommondity']) && $_SESSION['search']['searchcommondity'] == $prodData['id']) echo "selected"; ?>><?php echo htmlspecialchars($prodData['name']); ?></option>
              <?php
                }
              }
              ?>
            </select>
            <input type="date" name="searchdate" value="<?php echo !empty($_SESSION['search']['searchdate']) ? htmlspecialchars($_SESSION['search']['searchdate']) : ''; ?>" class="form-control inpv2 d-inline float-end" style="width:12%; height:26px !important; padding:0px 5px;">
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
              <th>Kg</th>
              <th>Pcs per Vr</th>
              <th>Pcs per F-7</th>
              <th>Action</th>
            </tr>
            <?php
            // Setup Unified Fetching with safe error trapping
            $sql = "SELECT * FROM form7stocktcl";
            $conditions = [];
            $datas = [];

            $search_commondity = !empty($_SESSION['search']['searchcommondity']) ? $_SESSION['search']['searchcommondity'] : '';
            $search_date = !empty($_SESSION['search']['searchdate']) ? $_SESSION['search']['searchdate'] : '';
            $search_size = !empty($_SESSION['search']['searchsize']) ? $_SESSION['search']['searchsize'] : '';

            if ($search_commondity !== '') {
              $conditions[] = "item_id = :commondity_id";
            }
            if ($search_date !== '') {
              $conditions[] = "date = :searchdate";
            }
            if ($search_size !== '') {
              $conditions[] = "size = :searchsize";
            }

            try {
              if (count($conditions) > 0) {
                $sql .= " WHERE " . implode(" AND ", $conditions);
              }
              $stmt = $pdo->prepare($sql);

              if ($search_commondity !== '') {
                $stmt->bindValue(':commondity_id', $search_commondity);
              }
              if ($search_date !== '') {
                $stmt->bindValue(':searchdate', $search_date);
              }
              if ($search_size !== '') {
                $stmt->bindValue(':searchsize', $search_size);
              }

              $stmt->execute();
              $datas = $stmt->fetchAll(PDO::FETCH_ASSOC);
            } catch (PDOException $e) {
              $datas = [];
            }

            // Initialize Dynamic Totals
            $t_viss = 0;
            $t_kg = 0;
            $t_pcs = 0;
            $t_pcsf7 = 0;

            foreach ($datas as $form7data) {
              $item_id = $form7data['item_id'] ?? 0;
              $supplier_id = $form7data['supplier_name'] ?? '';

              $item_name_val = 'Unknown Product';
              $supplier_name_val = $supplier_id;

              try {
                $prodStmt = $pdo->prepare("SELECT name FROM products WHERE id = ? LIMIT 1");
                $prodStmt->execute([$item_id]);
                $resName = $prodStmt->fetchColumn();
                if ($resName) {
                  $item_name_val = $resName;
                }

                if (is_numeric($supplier_id)) {
                  $supStmt = $pdo->prepare("SELECT name FROM contacts WHERE id = ? LIMIT 1");
                  $supStmt->execute([$supplier_id]);
                  $resSup = $supStmt->fetchColumn();
                  if ($resSup) {
                    $supplier_name_val = $resSup;
                  }
                }
              } catch (Exception $e) {
                // Fallback gracefully if lookup fails
              }

              // Accumulate totals
              $t_viss += floatval($form7data['viss'] ?? 0);
              $t_kg += floatval($form7data['kg'] ?? 0);
              $t_pcs += floatval($form7data['pcspervr'] ?? 0);
              $t_pcsf7 += floatval($form7data['pcsperf7'] ?? 0);
            ?>
              <tr data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $form7data['id']; ?>" style="cursor:pointer;">
                <td onclick="event.stopPropagation();"><input type="checkbox" class="row-checkbox" value="<?php echo $form7data['id']; ?>"></td>
                <td><?php if (!empty($form7data['date']) && $form7data['date'] != "0000-00-00") echo date('d-m-Y', strtotime($form7data['date'])); ?></td>
                <td><?php echo htmlspecialchars($item_name_val); ?></td>
                <td><?php echo htmlspecialchars($supplier_name_val); ?></td>
                <td><?php echo htmlspecialchars($form7data['type'] ?? ''); ?></td>
                <td><?php echo htmlspecialchars($form7data['country'] ?? ''); ?></td>
                <td onclick="event.stopPropagation();" data-bs-target="#addsizemodal<?php echo $form7data['id']; ?>" data-bs-toggle="modal"><?php echo htmlspecialchars($form7data['size'] ?? ''); ?></td>
                <td><?php echo htmlspecialchars($form7data['viss'] ?? ''); ?></td>
                <td><?php if (!empty($form7data['kg'])) echo round($form7data['kg'], 2); ?></td>
                <td><?php echo htmlspecialchars($form7data['pcspervr'] ?? ''); ?></td>
                <td><?php if (!empty($form7data['pcsperf7'])) echo htmlspecialchars($form7data['pcsperf7']); ?></td>
                <td onclick="event.stopPropagation();">
                  <form action="" method="post">
                    <input type="hidden" name="deleteid" value="<?php echo $form7data['id']; ?>">
                    <button type="submit" name="deleteform7" value="1" class="btn btn-danger btn-sm" onclick="event.stopPropagation(); if (window.lmsConfirmDelete) { lmsConfirmDelete(this, 'Are you sure you want to delete this Form 7 record?'); return false; } return confirm('Are you sure you want to delete this Form 7 record?');">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
                        <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z" />
                      </svg>
                    </button>
                  </form>
                </td>
              </tr>

              <!-- Modals for this row -->
              <div class="modal fade" id="updatemodal<?php echo $form7data['id']; ?>">
                <div class="modal-dialog modal-md" role="document">
                  <div class="modal-content" style="margin-top:70px !important;">
                    <div class="modal-header bg-warning text-light">
                      <h1 class="modal-title fs-5">Update Data</h1>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <form action="" method="post" novalidate onsubmit="return validatePcsPerF7(this)">
                        <input type="hidden" name="id" value="<?php echo $form7data['id']; ?>">
                        <div class="modal-body">
                          <?php
                          $idd = $form7data['id'];
                          $updata = $query->select('form7stocktcl', $idd, 'id');
                          ?>
                          <div class="row">
                            <div class="col">
                              <label>Pcs Per F7</label>
                              <input type="number" name="pcsperf7" min="0" step="1" class="form-control inpv2 mt-1" value="<?php echo htmlspecialchars($updata['pcsperf7'] ?? ''); ?>" required>
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

              <div class="modal fade" id="addsizemodal<?php echo $form7data['id']; ?>">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header bg-warning text-light">
                      <h1 class="modal-title fs-5">Add Size</h1>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <form action="" method="post" novalidate onsubmit="return validateForm7Size(this)">
                        <input type="hidden" name="id" value="<?php echo $form7data['id']; ?>">
                        <div class="modal-body">
                          <label>Size</label>
                          <input type="text" name="size" maxlength="11" class="form-control inpv2 mt-2" required>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                          <button type="submit" class="btn btn-success" name="addsize">Add Size</button>
                        </div>
                      </form>
                    </div>
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
                <td><?php echo round($t_viss, 3); ?></td>
                <td><?php echo round($t_kg, 2); ?></td>
                <td><?php echo $t_pcs; ?></td>
                <td><?php echo $t_pcsf7; ?></td>
                <td></td>
              </tr>
            <?php } ?>
          </table>
        </div>
      </div>
    </div>
  </div>

  <!-- Bulk Update Modal -->
  <div class="modal fade" id="bulkUpdateModal" tabindex="-1">
    <div class="modal-dialog">
      <div class="modal-content" style="margin-top:70px !important;">
        <div class="modal-header bg-warning text-dark">
          <h5 class="modal-title">Bulk Update TCL Form-7 Data</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form action="" method="post" novalidate onsubmit="return validateBulkCountry(this)">
          <div class="modal-body">
            <input type="hidden" name="bulk_ids" id="bulk_ids" value="">
            <div class="mb-3">
              <label class="fw-bold">Country</label>
              <input type="text" name="bulk_country" maxlength="155" class="form-control inpv2" required>
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

  <!-- ADD MODAL -->
  <div class="modal fade" id="addmodal">
    <div class="modal-dialog" role="document">
      <div class="modal-content" style="width: 650px !important; margin-top:70px !important;">
        <div class="modal-header bg-secondary text-light">
          <h1 class="modal-title fs-5">Add New Data</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form action="" method="post" novalidate onsubmit="return validateAddForm7(this)">
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
                    $itemstmt = $pdo->prepare("SELECT id, name FROM products");
                    $itemstmt->execute();
                    $itemdatas = $itemstmt->fetchAll(PDO::FETCH_ASSOC);
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
                    $supplierstmt = $pdo->prepare("SELECT id, name FROM contacts WHERE is_supplier = 1 ORDER BY name ASC");
                    $supplierstmt->execute();
                    $supplierdatas = $supplierstmt->fetchAll(PDO::FETCH_ASSOC);
                    foreach ($supplierdatas as $supplierdata) {
                    ?>
                      <option value="<?php echo htmlspecialchars($supplierdata['id']); ?>"><?php echo htmlspecialchars($supplierdata['name']); ?></option>
                    <?php } ?>
                  </select>
                </div>
                <div class="col">
                  <label>Type</label>
                  <select class="form-control inpv2 mb-2" name="type" required>
                    <option value="tcl" selected>TCl</option>
                    <option value="frozen">Frozen</option>
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

    function validateBulkCountry(form) {
      const country = form.bulk_country.value.trim();
      const bad = country === '' || country.length > 155;
      markInvalid(form.bulk_country, bad);
      if (country === '') {
        swal('Warning', 'Country is required.', 'warning');
        return false;
      }
      if (country.length > 155) {
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