<?php
// Handle real-time duplicate validation
if (isset($_GET['action']) && $_GET['action'] == 'check_duplicate') {
  include '../../Controllers/query.ctr.php';
  $query = new Query();
  $table = $_GET['table'];
  $column = $_GET['column'];
  $value = $_GET['value'];
  echo $query->isDuplicate($table, $column, $value) ? '1' : '0';
  exit;
}

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
  <title>Material Purchase</title>
</head>
<?php
$bootstrap->css();
?>

<body>
  <script type="text/javascript">
    $(document).ready(() => {
      $('#addac_code').on('keyup', function() {
        var ac_codepost = $('#addac_code').val();
        var type = "";
        if (ac_codepost.includes('/')) {
          ac_code = ac_codepost.split('/');
          type = "slash";
        } else {
          ac_code = ac_codepost.split('-');
          type = "dash";
        }
        firstpart = ac_code[0];
        lastpart = ac_code[1];
        $('#addac_name').load('ac_name.php', {
          FirstPart: firstpart,
          LastPart: JSON.stringify(lastpart),
          Type: type
        });
      });
    });

    // Real-time validation for duplicate voucher numbers
    function validateInput(table, column, value, errorId) {
      if (value.length === 0) {
        document.getElementById(errorId).innerText = "";
        return;
      }
      fetch(`material_purchase.php?action=check_duplicate&table=${table}&column=${column}&value=${encodeURIComponent(value)}`)
        .then(response => response.text())
        .then(data => {
          if (data === '1') {
            document.getElementById(errorId).innerText = "This voucher number is already taken.";
          } else {
            document.getElementById(errorId).innerText = "";
          }
        });
    }
  </script>
  <div class="row">
    <div class="sidebarcol" id="sidebar">
      <?php include 'sidebar.php'; ?>
    </div>
    <div class="contentcol" id="content">
      <?php require 'navbar.php'; ?>
      <div class="card">
        <div class="card-header bg-warning text-light" style="padding:-10px;">
          <b>Packing Material Purchase</b>
        </div>
        <div class="card-body" style="margin-top:-8px !important;">
          <?php
          $date_error = '';
          $voucher_no_error = '';
          $type_error = '';
          $supplier_name_error = '';
          $quantity_error = '';
          $rate_error = '';

          if (isset($_POST['addbutton'])) {
            $date = $_POST['date'];
            $voucher_no = $_POST['voucher_no'];
            $supplier_name = $_POST['supplier_code_no'];
            $materials = isset($_POST['material']) ? $_POST['material'] : [];
            $quantities = isset($_POST['quantity']) ? $_POST['quantity'] : [];
            $rates = isset($_POST['rate']) ? $_POST['rate'] : [];

            $_SESSION['purchase_date'] = $date;
            $_SESSION['purchase_voucher_no'] = $voucher_no;
            $_SESSION['purchase_supplier_name'] = $supplier_name;

            $hasLine = false;
            foreach ($materials as $index => $mat) {
              $qty = isset($quantities[$index]) ? trim($quantities[$index]) : '';
              $rt = isset($rates[$index]) ? trim($rates[$index]) : '';
              if (!empty($mat) && $qty !== '' && $rt !== '') {
                $hasLine = true;
                break;
              }
            }

            if (empty($date) || empty($voucher_no) || empty($supplier_name) || !$hasLine) {
              echo '<script>swal("Error!", "Please fill in all required fields and at least one material line.", "error");</script>';
              if (empty($date)) $date_error = "Please Enter The Date";
              if (empty($voucher_no)) $voucher_no_error = "Please Enter The Voucher No";
              if (empty($supplier_name)) $supplier_name_error = "Please Enter The Supplier A/C Code";
              if (!$hasLine) $quantity_error = "Please add at least one complete material line";
            } else {
              foreach ($materials as $index => $material) {
                $material = trim($material);
                $quantity = isset($quantities[$index]) ? trim($quantities[$index]) : '';
                $rate = isset($rates[$index]) ? trim($rates[$index]) : '';
                if ($material === '' || $quantity === '' || $rate === '') continue;
                $query->addmaterialpurchase('material_purchase', $date, $voucher_no, $supplier_name, $material, $quantity, $rate);
              }
            }
          }

          if (isset($_POST['updatebtn'])) {
            $up_id = $_POST['up_id'];
            $up_date = $_POST['up_date'];
            $up_voucher_no = $_POST['up_voucher_no'];
            $up_supplier_name = $_POST['up_supplier_code_no'];
            $up_material = $_POST['up_material'];
            $up_quantity = $_POST['up_quantity'];
            $up_rate = $_POST['up_rate'];

            $query->updatematerialpurchase('material_purchase', $up_date, $up_voucher_no, $up_supplier_name, $up_material, $up_quantity, $up_rate, $up_id);
            $query->updatematerial_warehouse('material_store_house', $up_date, $up_supplier_name, $up_voucher_no, $up_material, $up_quantity);
          }

          if (isset($_POST['deletebtn'])) {
            $deleteid = $_POST['up_id'];
            $deletevoucher_no = $_POST['deletevoucher_no'];
            $deletesupplier_id = $_POST['deletesupplier_id'];

            $query->deletematerialpurchase('material_purchase', $deleteid);
            $query->deletematerial_payable('payable', $deletesupplier_id, $deleteid);
            $query->deletematerial_warehouse('material_store_house', $deletevoucher_no);
          }

          if (isset($_POST['commoditybtn'])) {
            $material_id = $_POST['material_id'];
            $purchasedatas = $query->search('material_purchase', 'material_id', $material_id);
          }

          if (!empty($message)) {
            if (strpos($message, 'Successfully')) $successmessage = $message;
            if (strpos($message, 'Error')) $errmessage = $message;
            if (strpos($message, 'following')) $errormessage = $message;
          }
          ?>

          <?php
          if (!empty($errormessage)) { ?>
            <div class="alert alert-danger alert-dismissible fade show">
              <strong>Error! </strong> <?php echo $errormessage; ?>
              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
          <?php }
          if (!empty($errmessage)) { ?>
            <div class="alert alert-danger alert-dismissible fade show">
              <strong>Error! </strong> <?php echo $errmessage; ?>
              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
          <?php }
          if (!empty($successmessage)) { ?>
            <div class="alert alert-success alert-dismissible fade show">
              <strong>Success! </strong> <?php echo $successmessage; ?>
              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
          <?php } ?>

          <form action="material_purchase.php" method="post" class="d-inline">
            <span>Supplier Name:</span>
            <select class="chzn-select" name="supplier_id" style="width:15%;" data-placeholder="Supplier Name">
              <?php
              $supplierdatastmt = $pdo->prepare("SELECT * FROM material_purchase GROUP BY supplier_id");
              $supplierdatastmt->execute();
              $supplierdatas = $supplierdatastmt->fetchall();
              foreach ($supplierdatas as $supplierdata) {
                $supplier_name = $query->select('supplier', $supplierdata['supplier_id'], 'supplier_id');
              ?>
                <option value="<?php echo $supplierdata['supplier_id']; ?>"><?php echo $supplier_name['supplier_name']; ?> - <?= $supplierdata['supplier_id']; ?></option>
              <?php } ?>
            </select>
            <button type="submit" name="total" class="btn btn-primary btn-sm">Search</button>
            <span>Material:</span>
            <select class="form-control d-inline" name="material_id" style="width:15%;">
              <?php
              $materialdatas = $query->selectall('materials');
              foreach ($materialdatas as $materialdata) {
              ?>
                <option value="<?php echo $materialdata['id']; ?>"><?php echo $materialdata['name']; ?></option>
              <?php } ?>
            </select>
            <button type="submit" name="commoditybtn" class="btn btn-primary btn-sm">Find Material</button>
          </form>
          <button type="button" class="btn btn-success float-end btn-sm" data-bs-toggle="modal" data-bs-target="#addmodal">
            Add Material Purchase Voucher
          </button>
          <?php
          if (!empty($_GET['pageno'])) $pageno = $_GET['pageno'];
          else $pageno = 1;
          $numOfrecs = 15;
          $offset = ($pageno - 1) * $numOfrecs;
          ?>
          <table class="mt-1 table table-bordered table-striped rounded table-hover">
            <tr>
              <th>No.</th>
              <th>Date</th>
              <th>Voucher No</th>
              <th>Supplier Id</th>
              <th>Name</th>
              <th>Quantity</th>
              <th>Rate</th>
              <th>Total</th>
            </tr>
            <?php
            $sql = "SELECT * FROM material_purchase";
            $params = [];
            if (isset($_POST['total'])) {
              $supplier_id = $_POST['supplier_id'];
              $sql .= " WHERE supplier_id = ?";
              $params = [$supplier_id];
            } elseif (isset($_POST['commoditybtn'])) {
              $material_id = $_POST['material_id'];
              $sql .= " WHERE material_id = ?";
              $params = [$material_id];
            }

            $countStmt = $pdo->prepare($sql);
            $countStmt->execute($params);
            $total_pages = ceil($countStmt->rowCount() / $numOfrecs);

            $sql .= " ORDER BY id LIMIT $offset, $numOfrecs";
            $stmt = $pdo->prepare($sql);
            $stmt->execute($params);
            $purchasedatas = $stmt->fetchAll();

            $idd = $offset;
            foreach ($purchasedatas as $purchasedata) {
              $idd++;
              $supplierid = $purchasedata['supplier_id'];
              $supplier_name = $query->select('supplier', $supplierid, 'supplier_id');
              $materialid = $purchasedata['material_id'];
              $material_name = $query->select('materials', $materialid, 'id');
            ?>
              <tr data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $purchasedata['id'];  ?>" style="cursor: pointer !important;">
                <td><?php echo $idd; ?></td>
                <td><?php echo date('d-m-Y', strtotime($purchasedata['date'])); ?></td>
                <td><?php echo $purchasedata['voucher_no']; ?></td>
                <td><?php echo $supplier_name['supplier_name'] ?></td>
                <td><?php echo $material_name['name'] ?></td>
                <td><?php echo $purchasedata['quantity'] ?></td>
                <td><?php echo $purchasedata['rate'] ?></td>
                <td><?php echo $purchasedata['quantity'] * $purchasedata['rate']; ?></td>
              </tr>
              <!-- Update Modal -->
              <div class="modal fade" id="updatemodal<?php echo $purchasedata['id']; ?>" style="margin-left:auto !important; margin-right: auto !important;">
                <div class="modal-dialog" role="document">
                  <div class="modal-content" style="width: 750px !important; margin-top:70px !important;">
                    <div class="modal-header bg-warning text-light d-flex">
                      <div class="col-10">
                        <h4 class="modal-title">Edit Packing Material Purchase</h4>
                      </div>
                      <form method="post" autocomplete="off">
                        <input type="hidden" name="up_id" value="<?php echo $purchasedata['id']; ?>">
                        <input type="hidden" name="deletevoucher_no" value="<?php echo $purchasedata['voucher_no']; ?>">
                        <input type="hidden" name="deletesupplier_id" value="<?php echo $purchasedata['supplier_id']; ?>">
                        <div class="col">
                          <button type="submit" name="updatebtn" class="btn btn-success ps-2 pe-2 pb-2">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                              <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                              <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                            </svg>
                          </button>
                          <button type="submit" name="deletebtn" class="btn btn-danger ps-2 pe-2 pb-2">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
                              <path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z" />
                            </svg>
                          </button>
                          <button type="button" class="btn btn-primary ps-2 pe-2 pb-1 pt-0" data-bs-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" class="h3">&times;</span>
                          </button>
                        </div>
                    </div>
                    <div class="modal-body pt-4 pb-5 ps-4 pe-4">
                      <div class="row">
                        <input type="hidden" name="up_id" value="<?php echo $purchasedata['id']; ?>">
                        <div class="col">
                          <label style="font-weight: bold;">Date</label>
                          <input type="date" name="up_date" class="form-control inpv2" value="<?php echo $purchasedata['date']; ?>">
                        </div>
                        <div class="col">
                          <label style="font-weight: bold;">Voucher No</label>
                          <input type="number" name="up_voucher_no" class="form-control inpv2" value="<?php echo $purchasedata['voucher_no']; ?>">
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-6">
                          <label style="font-weight: bold;">Supplier A/C Code</label>
                          <div class="row">
                            <div style="width: 40%;">
                              <input type="text" id="addac_code" name="up_supplier_code_no" class="form-control inpv2" value="<?php echo $purchasedata['supplier_id']; ?>">
                            </div>
                            <div style="width: 10%;">
                              <a href="supplier.php" target="_blank" style="width: 10%; padding: 2.5px; color:black; text-align: center;">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0" />
                                </svg>
                              </a>
                            </div>
                            <div class="col-6">
                              <div id='addac_name'>
                                <input type="text" name="addac_name" disabled class="form-control inpv2 mb-1" style="padding-top: 2px; padding-bottom: 2px;">
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="col-6">
                          <label style="font-weight: bold;">Material</label>
                          <select class="form-control inpv2 mb-2" name="up_material">
                            <?php
                            $materialdatas = $query->selectall('materials');
                            foreach ($materialdatas as $materialdata) {
                            ?>
                              <option value="<?php echo $materialdata['id']; ?>" <?php if ($materialdata['id'] == $purchasedata['material_id']) {
                                                                                    echo "selected";
                                                                                  } ?>><?php echo $materialdata['name']; ?></option>
                            <?php } ?>
                          </select>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col">
                          <label style="font-weight: bold;">Quantity</label>
                          <input type="number" name="up_quantity" class="form-control inpv2" value="<?php echo $purchasedata['quantity']; ?>">
                        </div>
                        <div class="col">
                          <label style="font-weight: bold;">Rate</label>
                          <input type="text" name="up_rate" class="form-control inpv2" value="<?php echo $purchasedata['rate']; ?>">
                        </div>
                      </div>
                    </div>
                    </form>
                  </div>
                </div>
              </div>
            <?php } ?>
          </table>
          <div aria-label="Page navigation example" style="float:right;">
            <ul class="pagination">
              <li class="page-item"><a class="page-link" href="?pageno=1">First</a></li>
              <li class="page-item <?php if ($pageno <= 1) echo 'disabled'; ?>">
                <a class="page-link" href="<?php if ($pageno <= 1) echo '#';
                                            else echo "?pageno=" . ($pageno - 1); ?>">Previous</a>
              </li>
              <li class="page-item"><a class="page-link" href="#"><?php echo $pageno; ?></a></li>
              <li class="page-item <?php if ($pageno >= $total_pages) echo 'disabled'; ?>">
                <a class="page-link" href="<?php if ($pageno >= $total_pages) echo '#';
                                            else echo "?pageno=" . ($pageno + 1); ?>">Next</a>
              </li>
              <li class="page-item"><a class="page-link" href="?pageno=<?php echo $total_pages; ?>">Last</a> </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Data Add Modal -->
  <div class="modal fade" id="addmodal" style="margin-left:auto !important; margin-right: auto !important;">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content" style="margin-top:70px !important;">
        <div class="modal-header bg-secondary text-light">
          <h5 class="modal-title" id="addmodellabel">Create New Purchase Voucher</h5>
          <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true" class="h3">&times;</span>
          </button>
        </div>
        <form action="" method="post" autocomplete="off">
          <div class="modal-body">
            <div class="row mb-3">
              <div class="col-md-4">
                <label style="font-weight: bold;">Date</label>
                <input type="date" name="date" class="form-control inpv2" value="<?php echo !empty($_SESSION['purchase_date']) ? $_SESSION['purchase_date'] : ''; ?>">
              </div>
              <div class="col-md-4">
                <label style="font-weight: bold;">Voucher No</label>
                <!-- Updated input with validation -->
                <input type="number" name="voucher_no" id="voucher_no" class="form-control inpv2" oninput="validateInput('material_purchase', 'voucher_no', this.value, 'voucher_error')" required>
                <span id="voucher_error" class="text-danger small"></span>
              </div>
              <div class="col-md-4">
                <label style="font-weight: bold;">Supplier A/C Code</label>
                <div class="d-flex">
                  <!-- Using Chosen Select -->
                  <select name="supplier_code_no" id="addac_code" class="chzn-select form-control" style="width: 100%;" required>
                    <option value="">Select Supplier</option>
                    <?php
                    $supplier_list = $query->selectall('supplier');
                    foreach ($supplier_list as $s) {
                      echo "<option value='" . $s['supplier_id'] . "'>" . $s['supplier_name'] . " - " . $s['supplier_id'] . "</option>";
                    }
                    ?>
                  </select>
                </div>
              </div>
            </div>

            <div class="d-flex justify-content-between align-items-center mb-2 mt-4">
              <label style="font-weight: bold;">Material Lines</label>
              <button type="button" class="btn btn-sm btn-outline-primary" onclick="addMaterialLine();">Add Line</button>
            </div>

            <div class="table-responsive">
              <table class="table table-bordered table-sm">
                <thead class="table-light text-center">
                  <tr>
                    <th>Material</th>
                    <th>Quantity</th>
                    <th>Rate</th>
                    <th style="width:1px;">Rem</th>
                  </tr>
                </thead>
                <tbody id="material-lines">
                  <?php $materialdatas = $query->selectall('materials'); ?>
                  <tr>
                    <td>
                      <select class="form-control" name="material[]">
                        <option value="">Select Material</option>
                        <?php foreach ($materialdatas as $materialdata) { ?>
                          <option value="<?php echo $materialdata['id']; ?>"><?php echo $materialdata['name']; ?></option>
                        <?php } ?>
                      </select>
                    </td>
                    <td><input type="number" name="quantity[]" class="form-control"></td>
                    <td><input type="text" name="rate[]" class="form-control"></td>
                    <td><button type="button" class="btn btn-danger btn-sm" onclick="removeMaterialLine(this);">×</button></td>
                  </tr>
                </tbody>
              </table>
            </div>

            <div class="text-end mt-3">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
              <button type="submit" class="btn btn-success" name="addbutton">Add Voucher</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>

  <script type="text/javascript">
    function addMaterialLine() {
      const tbody = document.getElementById('material-lines');
      const row = document.createElement('tr');
      row.innerHTML = `
        <td>
          <select name="material[]" class="form-control">
            <option value="">Select Material</option>
            <?php
            $jsmaterialdatas = $query->selectall('materials');
            foreach ($jsmaterialdatas as $materialdata) {
              echo '<option value="' . $materialdata['id'] . '">' . addslashes($materialdata['name']) . '</option>';
            }
            ?>
          </select>
        </td>
        <td><input type="number" name="quantity[]" class="form-control"></td>
        <td><input type="text" name="rate[]" class="form-control"></td>
        <td><button type="button" class="btn btn-danger btn-sm" onclick="removeMaterialLine(this);">×</button></td>
      `;
      tbody.appendChild(row);
    }

    function removeMaterialLine(button) {
      const row = button.closest('tr');
      const tbody = row.closest('tbody');
      if (tbody.rows.length > 1) {
        row.remove();
      }
    }
    $(document).ready(() => {
      // Initialize Chosen
      $('.chzn-select').chosen();

      // Updated event listener for the supplier select
      $('#addac_code').on('change', function() {
        var ac_codepost = $(this).val();
        var type = "";
        if (ac_codepost.includes('/')) {
          ac_code = ac_codepost.split('/');
          type = "slash";
        } else {
          ac_code = ac_codepost.split('-');
          type = "dash";
        }
        firstpart = ac_code[0];
        lastpart = ac_code[1];

        $('#addac_name').load('ac_name.php', {
          FirstPart: firstpart,
          LastPart: JSON.stringify(lastpart),
          Type: type
        });
      });
    });
  </script>

  <?php $bootstrap->javascript(); ?>
</body>

</html>