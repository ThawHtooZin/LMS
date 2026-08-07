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

  if (isset($_POST['update'])) {
    $pcsperf7 = $_POST['pcsperf7'];
    $updateid = $_POST['id'];

    // Fetch existing country so it is not overwritten
    $existing_data = $query->select('form7stock', $updateid, 'id');
    $country = $existing_data ? ($existing_data['country'] ?? '') : '';

    $query->updatefrozencountry($country, $pcsperf7, $updateid);
  }

  if (isset($_POST['addsize'])) {
    $id = $_POST['id'];
    $size = $_POST['size'];
    $query->addsize($id, $size);
  }

  if (isset($_POST['bulk_update_btn'])) {
    $bulk_ids = $_POST['bulk_ids'];
    $bulk_country = trim($_POST['bulk_country']);
    $bulk_fish_type = trim($_POST['bulk_fish_type']);

    if (!empty($bulk_ids)) {
      $query->bulkUpdateForm7Frozen($bulk_ids, $bulk_country, $bulk_fish_type);
    }
  }

  if (isset($_POST['addform7'])) {
    $date = $_POST['date'];
    $commondity_id = $_POST['item_id'];
    $supplier_name = $_POST['supplier_id'];
    $type = $_POST['type'];
    $size = $_POST['size'];
    $viss = $_POST['viss'];

    $query->addform7($date, $commondity_id, $supplier_name, $type, $size, $viss);
  }

  if (isset($_POST['deleteform7'])) {
    $deleteid = $_POST['deleteid'];
    $query->form7frozendelete($deleteid);
  }

  if (isset($_POST['waterkgupdate'])) {
    $waterkgid = $_POST['waterkgid'];
    $waterkg = $_POST['waterkg'];

    $query->waterkg($waterkgid, $waterkg);
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
      <div class="card mt-1">
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
                    <button type="submit" name="deleteform7" class="btn btn-danger btn-sm">
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
                    <div class="modal-body">
                      <form action="form_7_frozen.php" method="post">
                        <input type="hidden" name="waterkgid" value="<?php echo $form7data['id']; ?>">
                        <div class="modal-body">
                          <?php
                          $idd = $form7data['id'];
                          $updata = $query->select('form7stock', $idd, 'id');
                          $safe_waterkg = $updata ? ($updata['water_kg'] ?? '') : '';
                          ?>
                          <label>Water Kg</label>
                          <input type="text" name="waterkg" class="form-control inpv2 mt-1" value="<?php echo htmlspecialchars($safe_waterkg); ?>">
                        </div>
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
                    <div class="modal-body">
                      <form action="form_7_frozen.php" method="post">
                        <input type="hidden" name="id" value="<?php echo $form7data['id']; ?>">
                        <div class="modal-body">
                          <?php
                          $idd = $form7data['id'];
                          $updata = $query->select('form7stock', $idd, 'id');
                          $safe_pcsperf7 = $updata ? ($updata['pcsperf7'] ?? '') : '';
                          ?>
                          <div class="row">
                            <div class="col">
                              <label>Pcs Per F7</label>
                              <input type="text" name="pcsperf7" class="form-control inpv2 mt-1" value="<?php echo htmlspecialchars($safe_pcsperf7); ?>">
                            </div>
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

              <!-- ADD SIZE MODAL -->
              <div class="modal fade" id="updatesizemodal<?php echo $form7data['id']; ?>">
                <div class="modal-dialog" role="document">
                  <div class="modal-content" style="width: 650px !important; margin-top:70px !important;">
                    <div class="modal-header bg-primary text-light">
                      <h1 class="modal-title fs-5">Add Size</h1>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <form action="form_7_frozen.php" method="post">
                        <input type="hidden" name="id" value="<?php echo $form7data['id']; ?>">
                        <div class="modal-body">
                          <?php
                          $idd = $form7data['id'];
                          $updata = $query->select('form7stock', $idd, 'id');
                          $safe_size = $updata ? ($updata['size'] ?? '') : '';
                          ?>
                          <div class="row">
                            <div class="col">
                              <label>Size</label>
                              <input type="text" name="size" class="form-control inpv2 mt-1" value="<?php echo htmlspecialchars($safe_size); ?>">
                            </div>
                          </div>
                        </div>
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
        <form action="form_7_frozen.php" method="post">
          <div class="modal-body">
            <input type="hidden" name="bulk_ids" id="bulk_ids" value="">

            <div class="mb-3">
              <label class="fw-bold">Country (Leave blank to ignore)</label>
              <input type="text" name="bulk_country" class="form-control inpv2">
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
        <div class="modal-body">
          <form action="form_7_frozen.php" method="post">
            <div class="modal-body">
              <div class="row">
                <div class="col">
                  <label>Date</label>
                  <input type="date" name="date" class="form-control inpv2 mb-2">
                </div>
                <div class="col">
                  <label>Fish Name</label>
                  <select class="form-control inpv2 mb-2" name="item_id">
                    <?php
                    // REFACTORED: Pulled directly from new 'products' table
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
                  <select class="form-control inpv2 mb-2" name="supplier_id">
                    <?php
                    // REFACTORED: Pulled directly from new 'accodes' or 'contacts' table
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
                  <select class="form-control inpv2 mb-2" name="type">
                    <option value="">Select Type</option>
                    <option value="frozen">Frozen</option>
                    <option value="tcl">TCl</option>
                  </select>
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <label>Size</label>
                  <input type="text" name="size" class="form-control inpv2 mb-2">
                </div>
                <div class="col">
                  <label>Viss</label>
                  <input type="text" name="viss" Class="form-control inpv2 mb-2">
                </div>
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