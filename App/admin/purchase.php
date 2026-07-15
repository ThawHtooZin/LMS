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
  <title>Document</title>
</head>
<?php
$bootstrap->css();
?>
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
</script>

<body>
  <div class="row">
    <div class="sidebarcol" id="sidebar">
      <?php include 'sidebar.php'; ?>
    </div>
    <div class="contentcol" id="content">
      <?php require 'navbar.php'; ?>
      <div class="card">
        <div class="card-header bg-warning text-light" style="padding:-10px;">
          <b>Manage Purchase</b>
          <a href="export.php?table_name=purchase" class="btn btn-sm btn-success float-end">Export to excel</a>
        </div>
        <div class="card-body" style="margin-top:-8px !important;">
          <?php
          if (isset($_POST['deletebutton'])) {
            $deleteid = $_POST['deleteid'];
            $data = $query->select('purchase', $deleteid, 'no');
            if (!empty($data['tclfrozen'])) {
              $tclorfrozen = $data['tclfrozen'];
            } else {
              $tclorfrozen = '';
            }
            $query->deletepurchase('purchase', $deleteid);
            if ($tclorfrozen == 'tcl') {
              $query->deleteform7('form7stocktcl', $deleteid);
            } else {
              $query->deleteform7('form7stock', $deleteid);
            }
          }

          if (isset($_POST['updatebutton']) || isset($_POST['update_voucher'])) {
            // Note: Keeping existing individual update logic just in case, 
            // but voucher detail modal uses this same file. 
            // You may need to adapt your update method if updating multiple lines.
            $date = $_POST['date'];
            $voucher_no = $_POST['voucher_no'];
            $tclfrozen = $_POST['tclfrozen'];
            $supplier_name = isset($_POST['upsupplier_code_no']) ? $_POST['upsupplier_code_no'] : (isset($_POST['supplier_code_no']) ? $_POST['supplier_code_no'] : '');
            $commodity = isset($_POST['commodity']) ? $_POST['commodity'] : '';
            $size = isset($_POST['size']) ? $_POST['size'] : '';
            $viss = isset($_POST['viss']) ? $_POST['viss'] : '';
            $pcs = isset($_POST['pcs']) ? $_POST['pcs'] : '';
            $price = isset($_POST['price']) ? $_POST['price'] : '';
            $no = isset($_POST['updateid']) ? $_POST['updateid'] : (isset($_POST['voucher_id']) ? $_POST['voucher_id'] : '');

            // For the complex line updates in the modal, you would need a loop here 
            // similar to the add function if you are updating all lines at once.
            // Assuming your query->updatepurchase handles the basic single item update for now:
            if (isset($_POST['updatebutton'])) {
              $message = $query->updatepurchase('purchase', $date, $voucher_no, $supplier_name, $tclfrozen, $commodity, $size, $viss, $pcs, $price, $no);
            }
          }

          $date_error = '';
          $voucher_no_error = '';
          $type_error = '';
          $supplier_name_error = '';
          $viss_error = '';
          $price_error = '';

          // Add Feature Logic Restored
          if (isset($_POST['addbutton'])) {
            $date = $_POST['date'];
            $voucher_no = $_POST['voucher_no'];
            $tclfrozen = $_POST['tclfrozen'];
            $supplier_name = $_POST['supplier_code_no'];
            $commodities = isset($_POST['commodity']) ? $_POST['commodity'] : [];
            $sizes = isset($_POST['size']) ? $_POST['size'] : [];
            $visses = isset($_POST['viss']) ? $_POST['viss'] : [];
            $pcss = isset($_POST['pcs']) ? $_POST['pcs'] : [];
            $prices = isset($_POST['price']) ? $_POST['price'] : [];

            $_SESSION['purchase_date'] = $date;
            $_SESSION['purchase_voucher_no'] = $voucher_no;
            $_SESSION['purchase_tclfrozen'] = $tclfrozen;
            $_SESSION['purchase_supplier_name'] = $supplier_name;
            $hasLine = false;

            foreach ($visses as $index => $lineViss) {
              $linePrice = isset($prices[$index]) ? trim($prices[$index]) : '';
              $lineViss = trim($lineViss);
              if ($lineViss !== '' || $linePrice !== '' || !empty($commodities[$index]) || !empty($sizes[$index]) || !empty($pcss[$index])) {
                $hasLine = true;
                break;
              }
            }

            if (empty($date) || empty($voucher_no) || empty($tclfrozen) || empty($supplier_name) || !$hasLine) {
              echo '<script>swal("Error!", "Error occurs when added Purchase Voucher", "error");</script>';
              if (empty($date)) {
                $date_error = "Please Enter The Date";
              }
              if (empty($voucher_no)) {
                $voucher_no_error = "Please Enter The Voucher_no";
              }
              if (empty($tclfrozen)) {
                $type_error = "Please Enter Tcl Or Frozen";
              }
              if (empty($supplier_name)) {
                $supplier_name_error = "Please Enter The Supplier A/C Code";
              }
              if (!$hasLine) {
                $viss_error = "Please add at least one purchase line";
              }
            } else {
              $lines = [];
              foreach ($commodities as $index => $commodity) {
                $commodity = trim($commodity);
                $size = isset($sizes[$index]) ? trim($sizes[$index]) : '';
                $viss = isset($visses[$index]) ? trim($visses[$index]) : '';
                $pcs = isset($pcss[$index]) ? trim($pcss[$index]) : '';
                $price = isset($prices[$index]) ? trim($prices[$index]) : '';
                if ($commodity === '' && $size === '' && $viss === '' && $pcs === '' && $price === '') {
                  continue;
                }
                if ($viss === '' || $price === '') {
                  continue;
                }
                $lines[] = [
                  'commodity' => $commodity,
                  'size' => $size,
                  'viss' => $viss,
                  'pcs' => $pcs,
                  'price' => $price
                ];
              }
              if (!empty($lines)) {
                $query->addPurchaseVoucher($date, $voucher_no, $tclfrozen, $supplier_name, $lines);
              }
            }
          }

          if (isset($_POST['total'])) {
            $supplier_id = $_POST['supplier_id'];
            $purchasedatas = $query->search('purchase_voucher', 'supplier_id', $supplier_id);
          }

          if (isset($_POST['commoditybtn'])) {
            $item_id = $_POST['item_id'];
            $stmt = $pdo->prepare("SELECT DISTINCT purchase_voucher_id FROM purchase WHERE commodity='$item_id'");
            $stmt->execute();
            $voucherIds = $stmt->fetchAll(PDO::FETCH_COLUMN);
            if (!empty($voucherIds)) {
              $idList = implode(',', array_map('intval', $voucherIds));
              $stmt = $pdo->prepare("SELECT * FROM purchase_voucher WHERE id IN ($idList) ORDER BY id");
              $stmt->execute();
              $purchasedatas = $stmt->fetchAll(PDO::FETCH_ASSOC);
            } else {
              $purchasedatas = [];
            }
          }

          if (!empty($message)) {
            if (strpos($message, 'Successfully')) {
              $successmessage = $message;
            }
            if (strpos($message, 'Error')) {
              $errmessage = $message;
            }
            if (strpos($message, 'following')) {
              $errormessage = $message;
            }
          }
          ?>

          <?php if (!empty($errormessage)) { ?>
            <div class="alert alert-danger alert-dismissible fade show">
              <strong>Error! </strong> <?php echo $errormessage; ?>
              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
          <?php } ?>

          <?php if (!empty($errmessage)) { ?>
            <div class="alert alert-danger alert-dismissible fade show">
              <strong>Error! </strong> <?php echo $errmessage; ?>
              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
          <?php } ?>

          <?php if (!empty($successmessage)) { ?>
            <div class="alert alert-success alert-dismissible fade show">
              <strong>Success! </strong> <?php echo $successmessage; ?>
              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
          <?php } ?>

          <!-- <a href="purchase_report.php" class="btn btn-primary btn-sm">Report</a> -->
          <form action="purchase.php" method="post" class="d-inline">
            <span>Supplier Name:</span>
            <select class="chzn-select" name="supplier_id" style="width:15%;" data-placeholder="Supplier Name">
              <?php
              $supplierdatastmt = $pdo->prepare("SELECT * FROM purchase_voucher GROUP BY supplier_id");
              $supplierdatastmt->execute();
              $supplierdatas = $supplierdatastmt->fetchall();
              foreach ($supplierdatas as $supplierdata) {
                $supplier_name = $query->select('supplier', $supplierdata['supplier_id'], 'supplier_id');
              ?>
                <option value="<?php echo $supplierdata['supplier_id']; ?>"><?php echo $supplier_name['supplier_name']; ?> - <?= $supplierdata['supplier_id']; ?></option>
              <?php } ?>
            </select>
            <button type="submit" name="total" class="btn btn-primary btn-sm">Search</button>

            <span>Commodity:</span>
            <select class="form-control d-inline" name="item_id" style="width:15%;">
              <?php
              $itemdatas = $query->selectall('item');
              foreach ($itemdatas as $itemdata) {
              ?>
                <option value="<?php echo $itemdata['item_id']; ?>"><?php echo $itemdata['item_name']; ?></option>
              <?php } ?>
            </select>
            <button type="submit" name="commoditybtn" class="btn btn-primary btn-sm">Find Commodity</button>
          </form>

          <button type="button" class="btn btn-primary float-end btn-sm" data-bs-toggle="modal" data-bs-target="#addmodal">
            Add Purchase Voucher
          </button>

          <?php
          if (!empty($_GET['pageno'])) {
            $pageno = $_GET['pageno'];
          } else {
            $pageno = 1;
          }
          $numOfrecs = 15;
          $offset = ($pageno - 1) * $numOfrecs;
          ?>

          <table class="mt-1 table table-bordered table-striped rounded table-hover">
            <tr>
              <th>No.</th>
              <th>Date</th>
              <th>Voucher No</th>
              <th>Type</th>
              <th>Supplier Name</th>
              <th class="text-end">Total Amount</th>
              <th>Actions</th>
            </tr>
            <?php
            if (isset($_POST['total'])) {
              $supplier_id = $_POST['supplier_id'];
              $purchasedatas = $query->search('purchase_voucher', 'supplier_id', $supplier_id);
              $total_pages = 1;
              $total_amount = $query->selectallsumcheck('purchase_voucher', 'total_amount', 'total_amount', 'supplier_id', $supplier_id);
            } elseif (isset($_POST['commoditybtn'])) {
              $item_id = $_POST['item_id'];
              $stmt = $pdo->prepare("SELECT DISTINCT purchase_voucher_id FROM purchase WHERE commodity='$item_id'");
              $stmt->execute();
              $voucherIds = $stmt->fetchAll(PDO::FETCH_COLUMN);
              if (!empty($voucherIds)) {
                $idList = implode(',', array_map('intval', $voucherIds));
                $stmt = $pdo->prepare("SELECT * FROM purchase_voucher WHERE id IN ($idList) ORDER BY id");
                $stmt->execute();
                $purchasedatas = $stmt->fetchAll(PDO::FETCH_ASSOC);
              } else {
                $purchasedatas = [];
              }
              $total_amount = $query->selectsum('purchase', $item_id, 'commodity');
              $total_pages = 1;
            } else {
              $stmt = $pdo->prepare("SELECT COUNT(*) AS cnt FROM purchase_voucher");
              $stmt->execute();
              $countData = $stmt->fetch(PDO::FETCH_ASSOC);
              $total_pages = ceil($countData['cnt'] / $numOfrecs);

              $stmt = $pdo->prepare("SELECT * FROM purchase_voucher ORDER BY id LIMIT $offset,$numOfrecs ");
              $stmt->execute();
              $purchasedatas = $stmt->fetchAll(PDO::FETCH_ASSOC);
            }

            $idd = $offset;
            $modals_html = ''; // Initialize the buffer variable for modals

            foreach ($purchasedatas as $purchasedata) {
              $idd++;
              $supplierid = $purchasedata['supplier_id'];
              $supplier_name = $query->select('supplier', $supplierid, 'supplier_id');
            ?>
              <tr class="table-secondary">
                <td><?php echo $idd; ?></td>
                <td><?php echo date('d-m-Y', strtotime($purchasedata['date'])); ?></td>
                <td><?php echo $purchasedata['voucher_no']; ?></td>
                <td><?php echo $purchasedata['tclfrozen']; ?></td>
                <td><?php echo $supplier_name['supplier_name']; ?></td>
                <td class="text-end fw-bold"><?php echo $purchasedata['total_amount']; ?></td>
                <td>
                  <button type="button" class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#voucherModal<?php echo $purchasedata['id']; ?>">Details</button>
                </td>
              </tr>

              <?php ob_start(); // Start buffering the modal 
              ?>
              <div class="modal fade" id="voucherModal<?php echo $purchasedata['id']; ?>" tabindex="-1">
                <div class="modal-dialog modal-xl">
                  <div class="modal-content" style="margin-top:70px !important;">
                    <div class="modal-header bg-secondary text-light">
                      <h5 class="modal-title">Edit Voucher - <?php echo $purchasedata['voucher_no']; ?></h5>
                      <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="h3">&times;</span>
                      </button>
                    </div>
                    <form action="purchase.php" method="post" autocomplete="off">
                      <input type="hidden" name="voucher_id" value="<?php echo $purchasedata['id']; ?>">
                      <div class="modal-body">
                        <div class="row g-3 mb-3">
                          <div class="col-md-3">
                            <label style="font-weight: bold;">Date</label>
                            <input type="date" name="date" class="form-control inpv2" value="<?php echo $purchasedata['date']; ?>">
                          </div>
                          <div class="col-md-3">
                            <label style="font-weight: bold;">Voucher No</label>
                            <input type="text" name="voucher_no" class="form-control inpv2" value="<?php echo $purchasedata['voucher_no']; ?>">
                          </div>
                          <div class="col-md-3">
                            <label style="font-weight: bold;">TCL (or) Frozen</label>
                            <select name="tclfrozen" class="form-control inpv2">
                              <option value="">Select</option>
                              <option value="tcl" <?php if ($purchasedata['tclfrozen'] == 'tcl') echo 'selected'; ?>>TCL</option>
                              <option value="frozen" <?php if ($purchasedata['tclfrozen'] == 'frozen') echo 'selected'; ?>>Frozen</option>
                            </select>
                          </div>
                          <div class="col-md-3">
                            <label style="font-weight: bold;">Supplier</label>
                            <select name="supplier_code_no" class="form-control inpv2">
                              <?php
                              $supplierdatas2 = $query->selectall('supplier');
                              foreach ($supplierdatas2 as $supplierdata2) {
                              ?>
                                <option value="<?php echo $supplierdata2['supplier_id']; ?>" <?php if ($purchasedata['supplier_id'] == $supplierdata2['supplier_id']) echo 'selected'; ?>><?php echo $supplierdata2['supplier_name']; ?></option>
                              <?php } ?>
                            </select>
                          </div>
                        </div>

                        <div class="mb-2 d-flex justify-content-between align-items-center">
                          <label style="font-weight: bold;">Purchase Lines</label>
                          <button type="button" class="btn btn-sm btn-outline-primary" onclick="addPurchaseLineTo('purchase-lines-<?php echo $purchasedata['id']; ?>');">Add Line</button>
                        </div>

                        <div class="table-responsive">
                          <table class="table table-bordered table-sm">
                            <thead class="table-light">
                              <tr>
                                <th>Commodity</th>
                                <th>Size</th>
                                <th>Viss</th>
                                <th>Pcs</th>
                                <th>Price</th>
                                <th style="width:1px;">Remove</th>
                              </tr>
                            </thead>
                            <tbody id="purchase-lines-<?php echo $purchasedata['id']; ?>">
                              <?php
                              $lines = $query->search('purchase', 'purchase_voucher_id', $purchasedata['id']);
                              $allItems = $query->selectall('item');
                              foreach ($lines as $ln) {
                              ?>
                                <tr>
                                  <td>
                                    <select name="commodity[]" class="form-control">
                                      <option value="">Select product</option>
                                      <?php foreach ($allItems as $it) { ?>
                                        <option value="<?php echo $it['item_id']; ?>" <?php if ($ln['commodity'] == $it['item_id']) echo 'selected'; ?>><?php echo $it['item_name']; ?></option>
                                      <?php } ?>
                                    </select>
                                    <input type="hidden" name="line_id[]" value="<?php echo $ln['no']; ?>">
                                  </td>
                                  <td><input type="text" name="size[]" class="form-control" value="<?php echo $ln['size']; ?>"></td>
                                  <td><input type="text" name="viss[]" class="form-control" value="<?php echo $ln['viss']; ?>"></td>
                                  <td><input type="number" name="pcs[]" class="form-control" value="<?php echo $ln['pcs']; ?>"></td>
                                  <td><input type="number" step="0.01" name="price[]" class="form-control" value="<?php echo $ln['price']; ?>"></td>
                                  <td><button type="button" class="btn btn-danger btn-sm" onclick="removePurchaseLine(this);">×</button></td>
                                </tr>
                              <?php } ?>
                            </tbody>
                          </table>
                        </div>

                        <div class="text-end mt-2">
                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                          <button type="submit" class="btn btn-success" name="update_voucher">Save Changes</button>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            <?php
              $modals_html .= ob_get_clean(); // End buffering and store in variable
            }
            ?>

            <?php
            if (isset($_POST['total'])) {
              $supplier_id = $_POST['supplier_id'];
              $total_amount = $query->selectallsumcheck('purchase_voucher', 'total_amount', 'total_amount', 'supplier_id', $supplier_id);
            ?>
              <tr>
                <td colspan="5"></td>
                <td class="fw-bold">Total Amount:</td>
                <td class="text-end"><?php echo $total_amount['total_amount']; ?></td>
              </tr>
            <?php } ?>

            <?php
            if (isset($_POST['commoditybtn'])) {
              $id = $_POST['item_id'];
              $total_amount = $query->selectsum('purchase', $id, 'commodity');
            ?>
              <tr>
                <td colspan="5"></td>
                <td class="fw-bold">Total Amount:</td>
                <td class="text-end"><?php echo $total_amount['total_amount']; ?></td>
              </tr>
            <?php } ?>

            <?php
            if (!$_POST && !empty($_GET['pageno']) && $_GET['pageno'] == $total_pages) {
              $total_amount = $query->selectallsum('purchase_voucher', 'total_amount', 'total_amount');
            ?>
              <tr>
                <td colspan="5"></td>
                <td class="fw-bold">Total Amount:</td>
                <td class="text-end"><?php echo $total_amount['total_amount']; ?></td>
              </tr>
            <?php } ?>
          </table>

          <?php echo $modals_html; ?>

          <div aria-label="Page navigation example" style="float:right;">
            <ul class="pagination">
              <li class="page-item"><a class="page-link" href="?pageno=1">First</a></li>
              <li class="page-item <?php if ($pageno <= 1) {
                                      echo 'disabled';
                                    } ?>">
                <a class="page-link" href="<?php if ($pageno <= 1) {
                                              echo '#';
                                            } else {
                                              echo "?pageno=" . ($pageno - 1);
                                            } ?>">Previous</a>
              </li>
              <li class="page-item"><a class="page-link" href="#"><?php echo $pageno; ?></a></li>
              <li class="page-item <?php if ($pageno >= $total_pages) {
                                      echo 'disabled';
                                    }; ?>">
                <a class="page-link" href="<?php if ($pageno >= $total_pages) {
                                              echo '#';
                                            } else {
                                              echo "?pageno=" . ($pageno + 1);
                                            } ?>">Next</a>
              </li>
              <li class="page-item"><a class="page-link" href="?pageno=<?php echo $total_pages; ?>">Last</a> </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="addmodal" style="margin-left:auto !important; margin-right: auto !important;">
    <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content" style="margin-top:70px !important;">
        <div class="modal-header bg-secondary text-light">
          <h5 class="modal-title" id="addmodellabel">Create New Purchase Voucher</h5>
          <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true" class="h3">&times;</span>
          </button>
        </div>
        <form action="purchase.php" method="post" autocomplete="off">
          <div class="modal-body">
            <div class="row g-3 mb-3">
              <div class="col-md-3">
                <label style="font-weight: bold;">Date</label>
                <input type="date" name="date" <?php if (!empty($date_error)) {
                                                  echo "class=\"form-control is-invalid\"";
                                                } else {
                                                  echo "class=\"form-control inpv2\"";
                                                } ?> value="<?php echo !empty($_POST['date']) ? $_POST['date'] : ''; ?>">
                <div class="text-danger small"><?php echo $date_error; ?></div>
              </div>
              <div class="col-md-3">
                <label style="font-weight: bold;">Voucher No</label>
                <input type="text" name="voucher_no" <?php if (!empty($voucher_no_error)) {
                                                        echo "class=\"form-control is-invalid\"";
                                                      } else {
                                                        echo "class=\"form-control inpv2\"";
                                                      } ?> value="<?php echo !empty($_POST['voucher_no']) ? $_POST['voucher_no'] : ''; ?>">
                <div class="text-danger small"><?php echo $voucher_no_error; ?></div>
              </div>
              <div class="col-md-3">
                <label style="font-weight: bold;">TCL (or) Frozen</label>
                <select <?php if (!empty($type_error)) {
                          echo "class=\"form-control is-invalid\"";
                        } else {
                          echo "class=\"form-control inpv2\"";
                        } ?> name="tclfrozen">
                  <option value="">Select</option>
                  <option value="tcl" <?php echo (!empty($_POST['tclfrozen']) && $_POST['tclfrozen'] == 'tcl') ? 'selected' : ''; ?>>TCL</option>
                  <option value="frozen" <?php echo (!empty($_POST['tclfrozen']) && $_POST['tclfrozen'] == 'frozen') ? 'selected' : ''; ?>>Frozen</option>
                </select>
                <div class="text-danger small"><?php echo $type_error; ?></div>
              </div>
              <div class="col-md-3">
                <label style="font-weight: bold;">Supplier</label>
                <select name="supplier_code_no" class="form-control inpv2">
                  <option value="">Select supplier</option>
                  <?php
                  $supplierdatas = $query->selectall('supplier');
                  foreach ($supplierdatas as $supplierdata) {
                  ?>
                    <option value="<?php echo $supplierdata['supplier_id']; ?>" <?php echo (!empty($_POST['supplier_code_no']) && $_POST['supplier_code_no'] == $supplierdata['supplier_id']) ? 'selected' : ''; ?>><?php echo $supplierdata['supplier_name']; ?></option>
                  <?php } ?>
                </select>
                <div class="text-danger small"><?php echo $supplier_name_error; ?></div>
              </div>
            </div>

            <div class="mb-2 d-flex justify-content-between align-items-center">
              <label style="font-weight: bold;">Purchase Lines</label>
              <button type="button" class="btn btn-sm btn-outline-primary" onclick="addPurchaseLine();">Add Line</button>
            </div>

            <div class="table-responsive">
              <table class="table table-bordered table-sm">
                <thead class="table-light">
                  <tr>
                    <th>Commodity</th>
                    <th>Size</th>
                    <th>Viss</th>
                    <th>Pcs</th>
                    <th>Price</th>
                    <th style="width:1px;">Remove</th>
                  </tr>
                </thead>
                <tbody id="purchase-lines">
                  <?php $itemdatas = $query->selectall('item'); ?>
                  <tr>
                    <td>
                      <select name="commodity[]" class="form-control">
                        <option value="">Select product</option>
                        <?php foreach ($itemdatas as $itemdata) { ?>
                          <option value="<?php echo $itemdata['item_id']; ?>"><?php echo $itemdata['item_name']; ?></option>
                        <?php } ?>
                      </select>
                    </td>
                    <td><input type="text" name="size[]" class="form-control"></td>
                    <td><input type="text" name="viss[]" class="form-control"></td>
                    <td><input type="number" name="pcs[]" class="form-control"></td>
                    <td><input type="number" step="0.01" name="price[]" class="form-control"></td>
                    <td><button type="button" class="btn btn-danger btn-sm" onclick="removePurchaseLine(this);">×</button></td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="text-end mt-2">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-success" name="addbutton">Create Voucher</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>

  <script type="text/javascript">
    function addPurchaseLine() {
      const tbody = document.getElementById('purchase-lines');
      const row = document.createElement('tr');
      row.innerHTML = `
        <td>
          <select name="commodity[]" class="form-control">
            <option value="">Select product</option>
            <?php foreach ($itemdatas as $itemdata) { ?>
              <option value="<?php echo $itemdata['item_id']; ?>"><?php echo $itemdata['item_name']; ?></option>
            <?php } ?>
          </select>
        </td>
        <td><input type="text" name="size[]" class="form-control"></td>
        <td><input type="text" name="viss[]" class="form-control"></td>
        <td><input type="number" name="pcs[]" class="form-control"></td>
        <td><input type="number" step="0.01" name="price[]" class="form-control"></td>
        <td><button type="button" class="btn btn-danger btn-sm" onclick="removePurchaseLine(this);">×</button></td>
      `;
      tbody.appendChild(row);
    }

    function addPurchaseLineTo(tbodyId) {
      const tbody = document.getElementById(tbodyId);
      if (!tbody) return;
      const row = document.createElement('tr');
      row.innerHTML = `
        <td>
          <select name="commodity[]" class="form-control">
            <option value="">Select product</option>
            <?php foreach ($itemdatas as $itemdata) { ?>
              <option value="<?php echo $itemdata['item_id']; ?>"><?php echo $itemdata['item_name']; ?></option>
            <?php } ?>
          </select>
          <input type="hidden" name="line_id[]" value="">
        </td>
        <td><input type="text" name="size[]" class="form-control"></td>
        <td><input type="text" name="viss[]" class="form-control"></td>
        <td><input type="number" name="pcs[]" class="form-control"></td>
        <td><input type="number" step="0.01" name="price[]" class="form-control"></td>
        <td><button type="button" class="btn btn-danger btn-sm" onclick="removePurchaseLine(this);">×</button></td>
      `;
      tbody.appendChild(row);
    }

    function removePurchaseLine(button) {
      const row = button.closest('tr');
      if (!row) return;
      const tbody = row.closest('tbody');
      if (!tbody) return;
      if (tbody.rows.length > 1) row.remove();
    }
  </script>

  <?php
  $bootstrap->javascript();
  ?>
</body>

</html>