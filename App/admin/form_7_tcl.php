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

    $existing_data = $query->select('form7stocktcl', $updateid, 'id');
    $country = isset($_POST['country']) ? $_POST['country'] : $existing_data['country'];

    $query->updatetclcountry($country, $pcsperf7, $updateid);
  }

  if (isset($_POST['addsize'])) {
    $id = $_POST['id'];
    $size = $_POST['size'];
    $query->addsizetcl($id, $size);
  }

  if (isset($_POST['bulk_update_btn'])) {
    $bulk_ids = $_POST['bulk_ids'];
    $bulk_country = trim($_POST['bulk_country']);

    if (!empty($bulk_ids) && $bulk_country !== '') {
      $query->bulkUpdateForm7Tcl($bulk_ids, $bulk_country);
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
      <div class="card mt-1">
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
              $commonstmt = $pdo->prepare("SELECT DISTINCT size FROM form7stocktcl");
              $commonstmt->execute();
              $commondatas = $commonstmt->fetchAll();
              foreach ($commondatas as $commondata) {
                $size = $commondata['size'];
              ?>
                <option value="<?php echo $size; ?>" <?php if (!empty($_SESSION['search']['searchsize']) && $_SESSION['search']['searchsize'] == $size) echo "selected"; ?>><?php echo $size; ?></option>
              <?php } ?>
            </select>

            <select name="commondity_id" class="form-control inpv2 d-inline float-end ms-1" style="width:12%; height:26px !important; padding:0px 5px;">
              <option value="">Select Commondity</option>
              <?php
              $commonstmt = $pdo->prepare("SELECT DISTINCT item_id FROM form7stocktcl");
              $commonstmt->execute();
              $commondatas = $commonstmt->fetchAll();
              foreach ($commondatas as $commondata) {
                $item_id = $commondata['item_id'];
                $commonditydata = $query->select('item', $item_id, 'item_id');
              ?>
                <option value="<?php echo $commondata['item_id']; ?>" <?php if (!empty($_SESSION['search']['searchcommondity']) && $_SESSION['search']['searchcommondity'] == $commondata['item_id']) echo "selected"; ?>><?php echo $commonditydata['item_name']; ?></option>
              <?php } ?>
            </select>
            <input type="date" name="searchdate" value="<?php echo !empty($_SESSION['search']['searchdate']) ? $_SESSION['search']['searchdate'] : ''; ?>" class="form-control inpv2 d-inline float-end" style="width:12%; height:26px !important; padding:0px 5px;">
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
            // Setup Unified Fetching
            $sql = "SELECT * FROM form7stocktcl";
            $conditions = [];
            $nodata = true;

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

            if ($nodata) {
              $datas = [];
            } else {
              $sql .= " WHERE " . implode(" AND ", $conditions);
              $stmt = $pdo->prepare($sql);

              if ($search_commondity != '') {
                $stmt->bindParam(':commondity_id', $search_commondity, PDO::PARAM_STR);
              }
              if ($search_date != '') {
                $stmt->bindParam(':searchdate', $search_date, PDO::PARAM_STR);
              }
              if ($search_size != '') {
                $stmt->bindParam(':searchsize', $search_size, PDO::PARAM_STR);
              }

              $stmt->execute();
              $datas = $stmt->fetchall();
            }

            // Initialize Dynamic Totals
            $t_viss = 0;
            $t_kg = 0;
            $t_pcs = 0;
            $t_pcsf7 = 0;

            foreach ($datas as $form7data) {
              $item_id = $form7data['item_id'];
              $commonditydata = $query->select('item', $item_id, 'item_id');
              $supplier_id = $form7data['supplier_name'];
              $supplierdata = $query->select('acname', $supplier_id, 'code_no');

              // Accumulate totals
              $t_viss += floatval($form7data['viss']);
              $t_kg += floatval($form7data['kg']);
              $t_pcs += floatval($form7data['pcspervr']);
              $t_pcsf7 += floatval($form7data['pcsperf7']);
            ?>
              <tr data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $form7data['id']; ?>" style="cursor:pointer;">
                <td onclick="event.stopPropagation();"><input type="checkbox" class="row-checkbox" value="<?php echo $form7data['id']; ?>"></td>
                <td><?php if ($form7data['date'] != "0000-00-00") echo date('d-m-Y', strtotime($form7data['date'])); ?></td>
                <td><?php echo $commonditydata['item_name']; ?></td>
                <td><?php echo $supplierdata['ac_name']; ?></td>
                <td><?php echo $form7data['type']; ?></td>
                <td><?php echo $form7data['country']; ?></td>
                <td onclick="event.stopPropagation();" data-bs-target="#addsizemodal<?php echo $form7data['id']; ?>" data-bs-toggle="modal"><?php echo $form7data['size']; ?></td>
                <td><?php echo $form7data['viss']; ?></td>
                <td><?php if (!empty($form7data['kg'])) echo round($form7data['kg'], 2); ?></td>
                <td><?php echo $form7data['pcspervr']; ?></td>
                <td><?php if (!empty($form7data['pcsperf7'])) echo $form7data['pcsperf7']; ?></td>
                <td onclick="event.stopPropagation();">
                  <form action="" method="post">
                    <input type="hidden" name="deleteid" value="<?php echo $form7data['id']; ?>">
                    <button type="submit" name="deleteform7" class="btn btn-danger btn-sm">
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
                      <form action="" method="post">
                        <input type="hidden" name="id" value="<?php echo $form7data['id']; ?>">
                        <div class="modal-body">
                          <?php
                          $idd = $form7data['id'];
                          $updata = $query->select('form7stocktcl', $idd, 'id');
                          ?>
                          <div class="row">
                            <div class="col">
                              <label>Pcs Per F7</label>
                              <input type="text" name="pcsperf7" class="form-control inpv2 mt-1" value="<?php echo $updata['pcsperf7']; ?>">
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
                      <form action="" method="post">
                        <input type="hidden" name="id" value="<?php echo $form7data['id']; ?>">
                        <div class="modal-body">
                          <label>Size</label>
                          <input type="text" name="size" class="form-control inpv2 mt-2">
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
        <form action="" method="post">
          <div class="modal-body">
            <input type="hidden" name="bulk_ids" id="bulk_ids" value="">
            <div class="mb-3">
              <label class="fw-bold">Country (Leave blank to ignore)</label>
              <input type="text" name="bulk_country" class="form-control inpv2">
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

  <div class="modal fade" id="addmodal">
    <div class="modal-dialog" role="document">
      <div class="modal-content" style="width: 650px !important; margin-top:70px !important;">
        <div class="modal-header bg-secondary text-light">
          <h1 class="modal-title fs-5">Add New Data</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form action="" method="post">
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
                    $itemdatas = $query->selectall('item');
                    foreach ($itemdatas as $itemdata) {
                    ?>
                      <option value="<?php echo $itemdata['item_id']; ?>"><?php echo $itemdata['item_name']; ?></option>
                    <?php } ?>
                  </select>
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <label>Supplier Name</label>
                  <select class="form-control inpv2 mb-2" name="supplier_id">
                    <?php
                    $supplierstmt = $pdo->prepare("SELECT * FROM acname WHERE code_no LIKE '4000%'");
                    $supplierstmt->execute();
                    $supplierdatas = $supplierstmt->fetchall();
                    foreach ($supplierdatas as $supplierdata) {
                    ?>
                      <option value="<?php echo $supplierdata['code_no']; ?>"><?php echo $supplierdata['ac_name']; ?></option>
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