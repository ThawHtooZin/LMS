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
  <title>Manage Purchase Report</title>
  <?php $bootstrap->css(); ?>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
</head>

<body>

  <div class="row">
    <div class="sidebarcol" id="sidebar">
      <?php include 'sidebar.php'; ?>
    </div>
    <div class="contentcol" id="content">
      <?php require 'navbar.php'; ?>

      <div class="card shadow-sm border-0">
        <div class="card-header bg-warning text-light d-flex justify-content-between align-items-center">
          <h4 class="mb-0 fw-bold">Manage Purchase Report</h4>

          <!-- Master Export Buttons (They secretly carry over your active filters!) -->
          <form action="export/purchase.php" method="POST" target="_blank" class="m-0 p-0 d-flex">
            <?php
            if (!empty($_POST)) {
              foreach ($_POST as $key => $value) {
                if ($key !== 'export_type') {
                  echo "<input type='hidden' name='" . htmlspecialchars($key) . "' value='" . htmlspecialchars($value) . "'>";
                }
              }
            }
            ?>
            <button type="submit" name="export_type" value="excel" class="btn btn-success btn-sm fw-bold shadow-sm">
              <i class="bi bi-file-earmark-excel"></i> Export Excel
            </button>
            <button type="submit" name="export_type" value="pdf" class="btn btn-danger btn-sm fw-bold ms-2 shadow-sm">
              <i class="bi bi-file-earmark-pdf"></i> Export PDF
            </button>
          </form>
        </div>

        <div class="card-body">
          <label class="fw-bold">Filters</label>
          <form class="border p-3 mb-3 bg-light rounded" action="purchase_report.php" method="post">
            <div class="d-flex">
              <select class="form-select w-50 inpv2" name="reportselect">
                <option value="">Select Report Method</option>
                <option value="dbwsearch" <?= (isset($_POST['reportselect']) && $_POST['reportselect'] == 'dbwsearch') ? 'selected' : '' ?>>Date Between Search</option>
                <option value="tdysearch" <?= (isset($_POST['reportselect']) && $_POST['reportselect'] == 'tdysearch') ? 'selected' : '' ?>>Today Search</option>
                <option value="suppliersearch" <?= (isset($_POST['reportselect']) && $_POST['reportselect'] == 'suppliersearch') ? 'selected' : '' ?>>Supplier Search</option>
                <option value="commoditysearch" <?= (isset($_POST['reportselect']) && $_POST['reportselect'] == 'commoditysearch') ? 'selected' : '' ?>>Commodity Search</option>
                <option value="supplierdbwsearch" <?= (isset($_POST['reportselect']) && $_POST['reportselect'] == 'supplierdbwsearch') ? 'selected' : '' ?>>Supplier & Date Between Search</option>
                <option value="commoditydbwsearch" <?= (isset($_POST['reportselect']) && $_POST['reportselect'] == 'commoditydbwsearch') ? 'selected' : '' ?>>Commodity & Date Between Search</option>
                <option value="vouchersearch" <?= (isset($_POST['reportselect']) && $_POST['reportselect'] == 'vouchersearch') ? 'selected' : '' ?>>Voucher Search</option>
                <option value="commodityandsizesearch" <?= (isset($_POST['reportselect']) && $_POST['reportselect'] == 'commodityandsizesearch') ? 'selected' : '' ?>>Commodity & Size Search</option>
              </select>
              <button type="submit" name="ok" class="btn btn-primary ms-2 fw-bold">Load Filter</button>
            </div>
            <br>

            <?php if (isset($_POST['ok']) && $_POST['reportselect'] == 'dbwsearch') { ?>
              <label class="fw-bold">Date Between Search:</label><br>
              <div class="row align-items-end">
                <div class="col-4">
                  <label>Start Date</label>
                  <input type="date" name="dbwstartdate" class="form-control inpv2" required>
                </div>
                <div class="col-1 text-center fw-bold">To</div>
                <div class="col-4">
                  <label>End Date</label>
                  <input type="date" name="dbwenddate" class="form-control inpv2" required>
                </div>
                <div class="col-3">
                  <button type="submit" name="dbwsearch" class="btn btn-primary btn-sm fw-bold w-100">Check Reports</button>
                </div>
              </div>
            <?php } ?>

            <?php if (isset($_POST['ok']) && $_POST['reportselect'] == 'tdysearch') { ?>
              <button type="submit" name="tdysearch" class="btn btn-primary fw-bold">Search Today Report</button>
            <?php } ?>

            <?php if (isset($_POST['ok']) && $_POST['reportselect'] == 'suppliersearch') { ?>
              <div class="d-flex w-75 align-items-center">
                <select class="form-select inpv2 me-2" name="supplier_id" required>
                  <?php
                  $supplierstmt = $pdo->prepare("SELECT id, name FROM contacts WHERE is_supplier = 1 OR is_supplier = 0");
                  $supplierstmt->execute();
                  foreach ($supplierstmt->fetchAll(PDO::FETCH_ASSOC) as $supplierdata) {
                    echo "<option value='{$supplierdata['id']}'>" . htmlspecialchars($supplierdata['name']) . "</option>";
                  }
                  ?>
                </select>
                <button type="submit" name="suppliersearch" class="btn btn-primary fw-bold">Search</button>
              </div>
            <?php } ?>

            <?php if (isset($_POST['ok']) && $_POST['reportselect'] == 'commoditysearch') { ?>
              <div class="d-flex w-75 align-items-center">
                <select class="form-select inpv2 me-2" name="item_id" required>
                  <?php
                  $itemstmt = $pdo->prepare("SELECT id, name FROM products");
                  $itemstmt->execute();
                  foreach ($itemstmt->fetchAll(PDO::FETCH_ASSOC) as $itemdata) {
                    echo "<option value='{$itemdata['id']}'>" . htmlspecialchars($itemdata['name']) . "</option>";
                  }
                  ?>
                </select>
                <button type="submit" name="commoditysearch" class="btn btn-primary fw-bold">Search</button>
              </div>
            <?php } ?>

            <?php if (isset($_POST['ok']) && $_POST['reportselect'] == 'supplierdbwsearch') { ?>
              <label class="fw-bold">Supplier Name</label>
              <div class="row align-items-end">
                <div class="col-4">
                  <select class="form-select inpv2" name="supplier_name" required>
                    <?php
                    foreach ($pdo->query("SELECT id, name FROM contacts WHERE is_supplier = 1 OR is_supplier = 0")->fetchAll() as $supplierdata) {
                      echo "<option value='{$supplierdata['id']}'>" . htmlspecialchars($supplierdata['name']) . "</option>";
                    }
                    ?>
                  </select>
                </div>
                <div class="col-6">
                  <div class="row align-items-end">
                    <div class="col-5">
                      <label class="small">Start Date</label>
                      <input type="date" name="dbwstartdate" class="form-control inpv2" required>
                    </div>
                    <div class="col-1 text-center fw-bold">To</div>
                    <div class="col-5">
                      <label class="small">End Date</label>
                      <input type="date" name="dbwenddate" class="form-control inpv2" required>
                    </div>
                  </div>
                </div>
                <div class="col-2">
                  <button type="submit" name="supplierdbwsearch" class="btn btn-primary btn-sm fw-bold w-100">Search</button>
                </div>
              </div>
            <?php } ?>

            <?php if (isset($_POST['ok']) && $_POST['reportselect'] == 'commoditydbwsearch') { ?>
              <label class="fw-bold">Commodity</label>
              <div class="row align-items-end">
                <div class="col-4">
                  <select class="form-select inpv2" name="item_id" required>
                    <?php
                    foreach ($pdo->query("SELECT id, name FROM products")->fetchAll() as $itemdata) {
                      echo "<option value='{$itemdata['id']}'>" . htmlspecialchars($itemdata['name']) . "</option>";
                    }
                    ?>
                  </select>
                </div>
                <div class="col-6">
                  <div class="row align-items-end">
                    <div class="col-5">
                      <label class="small">Start Date</label>
                      <input type="date" name="dbwstartdate" class="form-control inpv2" required>
                    </div>
                    <div class="col-1 text-center fw-bold">To</div>
                    <div class="col-5">
                      <label class="small">End Date</label>
                      <input type="date" name="dbwenddate" class="form-control inpv2" required>
                    </div>
                  </div>
                </div>
                <div class="col-2">
                  <button type="submit" name="commoditydbwsearch" class="btn btn-primary btn-sm fw-bold w-100">Search</button>
                </div>
              </div>
            <?php } ?>

            <?php if (isset($_POST['ok']) && $_POST['reportselect'] == 'vouchersearch') { ?>
              <label class="fw-bold">Voucher Search</label>
              <div class="row align-items-end">
                <div class="col-4">
                  <select class="form-select inpv2 chzn-select" name="voucher_no" data-placeholder="Select Voucher" required>
                    <?php
                    $voucherstmt = $pdo->prepare("SELECT DISTINCT voucher_no FROM purchases");
                    $voucherstmt->execute();
                    foreach ($voucherstmt->fetchAll(PDO::FETCH_ASSOC) as $voucherdata) {
                      echo "<option value='{$voucherdata['voucher_no']}'>" . htmlspecialchars($voucherdata['voucher_no']) . "</option>";
                    }
                    ?>
                  </select>
                </div>
                <div class="col-4">
                  <button type="submit" name="vouchersearch" class="btn btn-primary fw-bold">Search</button>
                </div>
              </div>
            <?php } ?>

            <?php if (isset($_POST['ok']) && $_POST['reportselect'] == 'commodityandsizesearch') { ?>
              <label class="fw-bold">Commodity & Size Search</label>
              <div class="row align-items-end">
                <div class="col-4">
                  <select class="form-select inpv2" name="item_id" required>
                    <?php
                    foreach ($pdo->query("SELECT id, name FROM products")->fetchAll() as $itemdata) {
                      echo "<option value='{$itemdata['id']}'>" . htmlspecialchars($itemdata['name']) . "</option>";
                    }
                    ?>
                  </select>
                </div>
                <div class="col-4">
                  <input type="text" name="size" class="form-control inpv2" placeholder="Enter Size" required>
                </div>
                <div class="col-4">
                  <button type="submit" name="commodityandsizesearch" class="btn btn-primary fw-bold">Search</button>
                </div>
              </div>
            <?php } ?>
          </form>

          <!-- Reports Table -->
          <table class="table table-striped table-hover table-bordered mt-3">
            <thead class="table-dark">
              <tr>
                <th>#</th>
                <th>Date</th>
                <th>Voucher No</th>
                <th>Type</th>
                <th>Supplier Name</th>
                <th>Commodity</th>
                <th>Size</th>
                <th>Viss</th>
                <th>Kg</th>
                <th>Pcs</th>
                <th>Price</th>
                <th>Amount</th>
              </tr>
            </thead>
            <tbody>
              <?php
              $base_sql = "SELECT pl.*, p.date, p.voucher_no, p.contact_id AS supplier_id, p.tclfrozen 
                         FROM purchase_lines pl 
                         JOIN purchases p ON pl.purchase_id = p.id";
              $base_sum_sql = "SELECT SUM(pl.line_amount) as total_amount FROM purchase_lines pl JOIN purchases p ON pl.purchase_id = p.id";

              $purchasedatas = [];

              if (isset($_POST['suppliersearch'])) {
                $supplier_id = $_POST['supplier_id'];
                $stmt = $pdo->prepare("$base_sql WHERE p.contact_id = ?");
                $stmt->execute([$supplier_id]);
                $purchasedatas = $stmt->fetchAll(PDO::FETCH_ASSOC);

                $sum_stmt = $pdo->prepare("$base_sum_sql WHERE p.contact_id = ?");
                $sum_stmt->execute([$supplier_id]);
                $total_amount_supplier_search = $sum_stmt->fetch(PDO::FETCH_ASSOC);
              } elseif (isset($_POST['commoditysearch'])) {
                $commodity_id = $_POST['item_id'];
                $stmt = $pdo->prepare("$base_sql WHERE pl.product_id = ?");
                $stmt->execute([$commodity_id]);
                $purchasedatas = $stmt->fetchAll(PDO::FETCH_ASSOC);

                $sum_stmt = $pdo->prepare("SELECT SUM(line_amount) as total_amount FROM purchase_lines WHERE product_id = ?");
                $sum_stmt->execute([$commodity_id]);
                $total_amount_commodity_search = $sum_stmt->fetch(PDO::FETCH_ASSOC);

                $sum_stmt2 = $pdo->prepare("SELECT SUM(viss) as total_viss FROM purchase_lines WHERE product_id = ?");
                $sum_stmt2->execute([$commodity_id]);
                $total_amount_commodity_search_viss = $sum_stmt2->fetch(PDO::FETCH_ASSOC);
              } elseif (isset($_POST['dbwsearch'])) {
                $startdate = $_POST['dbwstartdate'];
                $enddate = $_POST['dbwenddate'];
                $stmt = $pdo->prepare("$base_sql WHERE p.date BETWEEN ? AND ?");
                $stmt->execute([$startdate, $enddate]);
                $purchasedatas = $stmt->fetchAll(PDO::FETCH_ASSOC);

                $sum_stmt = $pdo->prepare("$base_sum_sql WHERE p.date BETWEEN ? AND ?");
                $sum_stmt->execute([$startdate, $enddate]);
                $total_amount_dbw_search = $sum_stmt->fetch(PDO::FETCH_ASSOC);
              } elseif (isset($_POST['tdysearch'])) {
                $startdate = date('Y-m-d');
                $enddate = date('Y-m-d');
                $stmt = $pdo->prepare("$base_sql WHERE p.date BETWEEN ? AND ?");
                $stmt->execute([$startdate, $enddate]);
                $purchasedatas = $stmt->fetchAll(PDO::FETCH_ASSOC);

                $sum_stmt = $pdo->prepare("$base_sum_sql WHERE p.date BETWEEN ? AND ?");
                $sum_stmt->execute([$startdate, $enddate]);
                $total_amount_dbw_search = $sum_stmt->fetch(PDO::FETCH_ASSOC);
              } elseif (isset($_POST['supplierdbwsearch'])) {
                $startdate = $_POST['dbwstartdate'];
                $enddate = $_POST['dbwenddate'];
                $supplier_id = $_POST['supplier_name'];
                $stmt = $pdo->prepare("$base_sql WHERE p.contact_id = ? AND p.date BETWEEN ? AND ?");
                $stmt->execute([$supplier_id, $startdate, $enddate]);
                $purchasedatas = $stmt->fetchAll(PDO::FETCH_ASSOC);

                $sum_stmt = $pdo->prepare("$base_sum_sql WHERE p.contact_id = ? AND p.date BETWEEN ? AND ?");
                $sum_stmt->execute([$supplier_id, $startdate, $enddate]);
                $total_amount_dbw_supplier_search = $sum_stmt->fetch(PDO::FETCH_ASSOC);
              } elseif (isset($_POST['commoditydbwsearch'])) {
                $startdate = $_POST['dbwstartdate'];
                $enddate = $_POST['dbwenddate'];
                $commodity = $_POST['item_id'];
                $stmt = $pdo->prepare("$base_sql WHERE pl.product_id = ? AND p.date BETWEEN ? AND ?");
                $stmt->execute([$commodity, $startdate, $enddate]);
                $purchasedatas = $stmt->fetchAll(PDO::FETCH_ASSOC);

                $sum_stmt = $pdo->prepare("$base_sum_sql WHERE pl.product_id = ? AND p.date BETWEEN ? AND ?");
                $sum_stmt->execute([$commodity, $startdate, $enddate]);
                $total_amount_dbw_commodity_search = $sum_stmt->fetch(PDO::FETCH_ASSOC);
              } elseif (isset($_POST['vouchersearch'])) {
                $voucher_no = $_POST['voucher_no'];
                $stmt = $pdo->prepare("$base_sql WHERE p.voucher_no = ?");
                $stmt->execute([$voucher_no]);
                $purchasedatas = $stmt->fetchAll(PDO::FETCH_ASSOC);

                $sum_stmt = $pdo->prepare("$base_sum_sql WHERE p.voucher_no = ?");
                $sum_stmt->execute([$voucher_no]);
                $total_amount_commodity_search = $sum_stmt->fetch(PDO::FETCH_ASSOC);
              } elseif (isset($_POST['commodityandsizesearch'])) {
                $item_id = $_POST['item_id'];
                $size = $_POST['size'];
                $stmt = $pdo->prepare("$base_sql WHERE pl.product_id = ? AND pl.size = ?");
                $stmt->execute([$item_id, $size]);
                $purchasedatas = $stmt->fetchAll(PDO::FETCH_ASSOC);

                $sum_stmt = $pdo->prepare("SELECT SUM(pl.line_amount) as total_amount FROM purchase_lines pl JOIN purchases p ON pl.purchase_id = p.id WHERE pl.product_id = ? AND pl.size = ?");
                $sum_stmt->execute([$item_id, $size]);
                $total_amount_commodity_and_size_search = $sum_stmt->fetch(PDO::FETCH_ASSOC);

                $sum_stmt2 = $pdo->prepare("SELECT SUM(viss) as total_viss FROM purchase_lines pl JOIN purchases p ON pl.purchase_id = p.id WHERE pl.product_id = ? AND pl.size = ?");
                $sum_stmt2->execute([$item_id, $size]);
                $total_amount_commodity_and_size_search_viss = $sum_stmt2->fetch(PDO::FETCH_ASSOC);
              } else {
                $stmt = $pdo->prepare($base_sql . " LIMIT 100");
                $stmt->execute();
                $purchasedatas = $stmt->fetchAll(PDO::FETCH_ASSOC);
              }

              $counter = 1;
              foreach ($purchasedatas as $purchasedata) {
                $supplierid = $purchasedata['supplier_id'];
                $supStmt = $pdo->prepare("SELECT name FROM contacts WHERE id = ? LIMIT 1");
                $supStmt->execute([$supplierid]);
                $supplier_name_val = $supStmt->fetchColumn() ?: 'Unknown';

                $itemid = $purchasedata['product_id'];
                $prodStmt = $pdo->prepare("SELECT name FROM products WHERE id = ? LIMIT 1");
                $prodStmt->execute([$itemid]);
                $item_name_val = $prodStmt->fetchColumn() ?: 'Unknown';
              ?>
                <tr>
                  <td><?php echo $counter++; ?></td>
                  <td><?php echo !empty($purchasedata['date']) ? date('d-m-Y', strtotime($purchasedata['date'])) : ''; ?></td>
                  <td><?php echo htmlspecialchars($purchasedata['voucher_no'] ?? ''); ?></td>
                  <td><?php echo htmlspecialchars($purchasedata['tclfrozen'] ?? ''); ?></td>
                  <td><?php echo htmlspecialchars($supplier_name_val); ?></td>
                  <td><?php echo htmlspecialchars($item_name_val); ?></td>
                  <td><?php echo htmlspecialchars($purchasedata['size'] ?? ''); ?></td>
                  <td><?php echo htmlspecialchars($purchasedata['viss'] ?? ''); ?></td>
                  <td><?php echo number_format(floatval($purchasedata['viss'] ?? 0) * 1.634, 2); ?></td>
                  <td><?php echo htmlspecialchars($purchasedata['pcs'] ?? ''); ?></td>
                  <td><?php echo number_format($purchasedata['unit_price'] ?? 0, 2); ?></td>
                  <td><?php echo number_format($purchasedata['line_amount'] ?? 0, 2); ?></td>
                </tr>
              <?php } ?>

              <?php if (!empty($total_amount_supplier_search)) { ?>
                <tr class="table-info fw-bold">
                  <td colspan="10"></td>
                  <td>Total Amount:</td>
                  <td><?php echo number_format($total_amount_supplier_search['total_amount'] ?? 0, 2); ?></td>
                </tr>
              <?php } ?>

              <?php if (!empty($total_amount_commodity_search)) { ?>
                <tr class="table-info fw-bold">
                  <td colspan="10"></td>
                  <td>Total Amount:</td>
                  <td><?php echo number_format($total_amount_commodity_search['total_amount'] ?? 0, 2); ?></td>
                </tr>
                <?php if (!empty($total_amount_commodity_search_viss)) { ?>
                  <tr class="table-info fw-bold">
                    <td colspan="10"></td>
                    <td>Total Viss:</td>
                    <td><?php echo number_format($total_amount_commodity_search_viss['total_viss'] ?? 0, 2); ?></td>
                  </tr>
                  <tr class="table-info fw-bold">
                    <td colspan="10"></td>
                    <td>Total Kg:</td>
                    <td><?php echo number_format(floatval($total_amount_commodity_search_viss['total_viss'] ?? 0) * 1.634, 2); ?></td>
                  </tr>
                <?php } ?>
              <?php } ?>

              <?php if (!empty($total_amount_dbw_search)) { ?>
                <tr class="table-info fw-bold">
                  <td colspan="10"></td>
                  <td>Total Amount:</td>
                  <td><?php echo number_format($total_amount_dbw_search['total_amount'] ?? 0, 2); ?></td>
                </tr>
              <?php } ?>

              <?php if (!empty($total_amount_dbw_supplier_search)) { ?>
                <tr class="table-info fw-bold">
                  <td colspan="10"></td>
                  <td>Total Amount:</td>
                  <td><?php echo number_format($total_amount_dbw_supplier_search['total_amount'] ?? 0, 2); ?></td>
                </tr>
              <?php } ?>

              <?php if (!empty($total_amount_dbw_commodity_search)) { ?>
                <tr class="table-info fw-bold">
                  <td colspan="10"></td>
                  <td>Total Amount:</td>
                  <td><?php echo number_format($total_amount_dbw_commodity_search['total_amount'] ?? 0, 2); ?></td>
                </tr>
              <?php } ?>

              <?php if (!empty($total_amount_commodity_and_size_search)) { ?>
                <tr class="table-info fw-bold">
                  <td colspan="10"></td>
                  <td>Total Amount:</td>
                  <td><?php echo number_format($total_amount_commodity_and_size_search['total_amount'] ?? 0, 2); ?></td>
                </tr>
                <tr class="table-info fw-bold">
                  <td colspan="10"></td>
                  <td>Total Viss:</td>
                  <td><?php echo number_format($total_amount_commodity_and_size_search_viss['total_viss'] ?? 0, 2); ?></td>
                </tr>
                <tr class="table-info fw-bold">
                  <td colspan="10"></td>
                  <td>Total Kg:</td>
                  <td><?php echo number_format(floatval($total_amount_commodity_and_size_search_viss['total_viss'] ?? 0) * 1.634, 2); ?></td>
                </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

  <?php $bootstrap->javascript(); ?>
</body>

</html>