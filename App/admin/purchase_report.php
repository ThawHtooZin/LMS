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

<body>

  <div class="row">
    <div class="sidebarcol" id="sidebar">
      <?php
      include 'sidebar.php';
      ?>
    </div>
    <div class="contentcol" id="content">
      <?php require 'navbar.php'; ?>
      <div class="card">
        <div class="card-header bg-warning text-light">

          <h4>Manage Purchase Report</h4>
        </div>
        <div class="card-body">
          <label>Reports</label>
          <form class="border p-3" action="purchase_report.php" method="post">
            <div class="d-flex">
              <select class="form-control w-50 inpv2" name="reportselect">
                <option value="">Select Report Method</option>
                <option value="dbwsearch">Date Between Search</option>
                <option value="tdysearch">Today Search</option>
                <option value="suppliersearch">Supplier Search</option>
                <option value="commoditysearch">Commodity Search</option>
                <option value="supplierdbwsearch">Supplier & Date Between Search</option>
                <option value="commoditydbwsearch">Commodity & Date Between Search</option>
                <option value="vouchersearch">Voucher Search</option>
                <option value="commodityandsizesearch">Commodity & Size Search</option>
              </select>
              <button type="submit" name="ok" class="btn btn-primary">Ok</button>
            </div>
            <br>
            <!-- Search Date Between -->
            <?php
            if (isset($_POST['ok']) && $_POST['reportselect'] == 'dbwsearch') {
            ?>
              <label>Date Between Search:</label>
              <br>
              <div class="row">
                <div class="col-6">
                  <label>Start Date</label>
                  <input type="date" name="dbwstartdate" class="form-control inpv2">
                </div>
                <div class="col-1 text-center">
                  To
                </div>
                <div class="col-5">
                  <label>End Date</label>
                  <input type="date" name="dbwenddate" class="form-control inpv2">
                </div>
              </div>
              <button type="submit" name="dbwsearch" class="btn btn-primary btn-sm">Check Today Reports</button>
            <?php
            }
            ?>
            <!-- Today Search -->
            <?php
            if (isset($_POST['ok']) && $_POST['reportselect'] == 'tdysearch') {
            ?>
              <button type="submit" name="tdysearch" class="btn btn-primary">Search Today Report</button>
            <?php
            }
            ?>
            <!-- Supplier Search -->
            <?php
            if (isset($_POST['ok']) && $_POST['reportselect'] == 'suppliersearch') {
            ?>
              <select class="form-control inpv2 mb-2 w-50" name="supplier_id">
                <?php
                $supplierdatas = $query->selectall('supplier');
                foreach ($supplierdatas as $supplierdata) {
                ?>
                  <option value="<?php echo $supplierdata['supplier_id']; ?>"><?php echo $supplierdata['supplier_name']; ?></option>
                <?php
                }
                ?>
              </select>
              <button type="submit" name="suppliersearch" class="btn btn-primary">Search Supplier Report</button>
            <?php
            }
            ?>
            <!-- Commodity Search -->
            <?php
            if (isset($_POST['ok']) && $_POST['reportselect'] == 'commoditysearch') {
            ?>
              <select class="form-control  mb-2 w-50 inpv2" name="item_id">
                <?php
                $itemdatas = $query->selectall('item');
                foreach ($itemdatas as $itemdata) {
                ?>
                  <option value="<?php echo $itemdata['item_id']; ?>"><?php echo $itemdata['item_name']; ?></option>
                <?php
                }
                ?>
              </select>
              <button type="submit" name="commoditysearch" class="btn btn-primary">Search Commodity Report</button>
            <?php
            }
            ?>
            <!-- Supplier and Date Between Search -->
            <?php
            if (isset($_POST['ok']) && $_POST['reportselect'] == 'supplierdbwsearch') {
            ?>
              <label>Supplier Name</label>
              <div class="row">
                <div class="col-4">
                  <select class="form-control inpv2 mb-2" name="supplier_name">
                    <?php
                    $supplierdatas = $query->selectall('supplier');
                    foreach ($supplierdatas as $supplierdata) {
                    ?>
                      <option value="<?php echo $supplierdata['supplier_id']; ?>"><?php echo $supplierdata['supplier_name']; ?></option>
                    <?php
                    }
                    ?>
                  </select>
                </div>
                <div class="col-6">
                  <div class="row">
                    <div class="col-6">
                      <input type="date" name="dbwstartdate" class="form-control inpv2">
                      <label>Start Date</label>
                    </div>
                    <div class="col-1 text-center">
                      To
                    </div>
                    <div class="col-5">
                      <input type="date" name="dbwenddate" class="form-control inpv2">
                      <label>End Date</label>
                    </div>
                  </div>
                </div>
                <div class="col-2">
                  <button type="submit" name="supplierdbwsearch" class="btn btn-primary">Search Report</button>
                </div>
              </div>
            <?php
            }
            ?>
            <!-- Commodity and Date Between Search -->
            <?php
            if (isset($_POST['ok']) && $_POST['reportselect'] == 'commoditydbwsearch') {
            ?>
              <label>Commodity</label>
              <div class="row">
                <div class="col-4">
                  <select class="form-control inpv2 mb-2" name="item_id">
                    <?php
                    $itemdatas = $query->selectall('item');
                    foreach ($itemdatas as $itemdata) {
                    ?>
                      <option value="<?php echo $itemdata['item_id']; ?>"><?php echo $itemdata['item_name']; ?></option>
                    <?php
                    }
                    ?>
                  </select>
                </div>
                <div class="col-6">
                  <div class="row">
                    <div class="col-6">
                      <input type="date" name="dbwstartdate" class="form-control inpv2">
                      <label>Start Date</label>
                    </div>
                    <div class="col-1 text-center">
                      To
                    </div>
                    <div class="col-5">
                      <input type="date" name="dbwenddate" class="form-control inpv2">
                      <label>End Date</label>
                    </div>
                  </div>
                </div>
                <div class="col-2">
                  <button type="submit" name="commoditydbwsearch" class="btn btn-primary">Search Report</button>
                </div>
              </div>
            <?php
            }
            ?>
            <!-- Voucher Search -->
            <?php
            if (isset($_POST['ok']) && $_POST['reportselect'] == 'vouchersearch') {
            ?>
              <label>Voucher Search</label>
              <div class="row">
                <div class="col-4">
                  <select class="form-control inpv2 mb-2 chzn-select" name="voucher_no" data-placeholder="Select Voucher">
                    <?php
                    $voucherdatas = $query->selectall('purchase_voucher');
                    foreach ($voucherdatas as $voucherdata) {
                    ?>
                      <option value="<?php echo $voucherdata['voucher_no']; ?>"><?php echo $voucherdata['voucher_no']; ?></option>
                    <?php
                    }
                    ?>
                  </select>
                </div>
                <div class="col-2">
                  <button type="submit" name="vouchersearch" class="btn btn-primary">Search Report</button>
                </div>
              </div>
            <?php
            }
            ?>
            <!-- Commodity & Size Search -->
            <?php
            if (isset($_POST['ok']) && $_POST['reportselect'] == 'commodityandsizesearch') {
            ?>
              <div class="row">
                <div class="col-5">
                  <select class="form-control  mb-2 inpv2" name="item_id">
                    <?php
                    $itemdatas = $query->selectall('item');
                    foreach ($itemdatas as $itemdata) {
                    ?>
                      <option value="<?php echo $itemdata['item_id']; ?>"><?php echo $itemdata['item_name']; ?></option>
                    <?php
                    }
                    ?>
                  </select>
                </div>
                <div class="col-5">
                  <input type="number" name="size" class="form-control inpv2" placeholder="Enter Size">
                </div>
                <div class="col-2">
                  <button type="submit" name="commodityandsizesearch" class="btn btn-primary">Search Report</button>
                </div>
              </div>
            <?php
            }
            ?>
          </form>

          <!-- Reports Table -->
          <table class="table table-striped table-hover">
            <tr>
              <th>#</th>
              <th>Date</th>
              <th>Voucher No</th>
              <th>TCL (or) Frozen</th>
              <th>Supplier Name</th>
              <th>Commodity</th>
              <th>Size</th>
              <th>Viss</th>
              <th>Kg</th>
              <th>Pcs</th>
              <th>Price</th>
              <th>Amount</th>
            </tr>
            <?php
            global $pdo;

            // Updated base queries targeting the relational structure
            $base_sql = "SELECT p.*, pv.date, pv.voucher_no, pv.supplier_id, pv.tclfrozen 
                         FROM purchase p 
                         JOIN purchase_voucher pv ON p.purchase_voucher_id = pv.id";

            $base_sum_sql = "SELECT SUM(p.amount) as total_amount FROM purchase p JOIN purchase_voucher pv ON p.purchase_voucher_id = pv.id";

            // Data Retrieval logic using correct parameters
            if (isset($_POST['suppliersearch'])) {
              $supplier_id = $_POST['supplier_id'];
              $stmt = $pdo->prepare("$base_sql WHERE pv.supplier_id = ?");
              $stmt->execute([$supplier_id]);
              $purchasedatas = $stmt->fetchAll(PDO::FETCH_ASSOC);

              $sum_stmt = $pdo->prepare("$base_sum_sql WHERE pv.supplier_id = ?");
              $sum_stmt->execute([$supplier_id]);
              $total_amount_supplier_search = $sum_stmt->fetch(PDO::FETCH_ASSOC);
            } elseif (isset($_POST['commoditysearch'])) {
              $commodity_id = $_POST['item_id'];
              $stmt = $pdo->prepare("$base_sql WHERE p.commodity = ?");
              $stmt->execute([$commodity_id]);
              $purchasedatas = $stmt->fetchAll(PDO::FETCH_ASSOC);

              $sum_stmt = $pdo->prepare("SELECT SUM(amount) as total_amount FROM purchase WHERE commodity = ?");
              $sum_stmt->execute([$commodity_id]);
              $total_amount_commodity_search = $sum_stmt->fetch(PDO::FETCH_ASSOC);

              $sum_stmt2 = $pdo->prepare("SELECT SUM(viss) as total_viss FROM purchase WHERE commodity = ?");
              $sum_stmt2->execute([$commodity_id]);
              $total_amount_commodity_search_viss = $sum_stmt2->fetch(PDO::FETCH_ASSOC);
            } elseif (isset($_POST['dbwsearch'])) {
              $startdate = $_POST['dbwstartdate'];
              $enddate = $_POST['dbwenddate'];
              $stmt = $pdo->prepare("$base_sql WHERE pv.date BETWEEN ? AND ?");
              $stmt->execute([$startdate, $enddate]);
              $purchasedatas = $stmt->fetchAll(PDO::FETCH_ASSOC);

              $sum_stmt = $pdo->prepare("$base_sum_sql WHERE pv.date BETWEEN ? AND ?");
              $sum_stmt->execute([$startdate, $enddate]);
              $total_amount_dbw_search = $sum_stmt->fetch(PDO::FETCH_ASSOC);
            } elseif (isset($_POST['tdysearch'])) {
              $startdate = date('Y-m-d');
              $enddate = date('Y-m-d');
              $stmt = $pdo->prepare("$base_sql WHERE pv.date BETWEEN ? AND ?");
              $stmt->execute([$startdate, $enddate]);
              $purchasedatas = $stmt->fetchAll(PDO::FETCH_ASSOC);

              $sum_stmt = $pdo->prepare("$base_sum_sql WHERE pv.date BETWEEN ? AND ?");
              $sum_stmt->execute([$startdate, $enddate]);
              $total_amount_dbw_search = $sum_stmt->fetch(PDO::FETCH_ASSOC);
            } elseif (isset($_POST['supplierdbwsearch'])) {
              $startdate = $_POST['dbwstartdate'];
              $enddate = $_POST['dbwenddate'];
              $supplier_id = $_POST['supplier_name'];
              $stmt = $pdo->prepare("$base_sql WHERE pv.supplier_id = ? AND pv.date BETWEEN ? AND ?");
              $stmt->execute([$supplier_id, $startdate, $enddate]);
              $purchasedatas = $stmt->fetchAll(PDO::FETCH_ASSOC);

              $sum_stmt = $pdo->prepare("$base_sum_sql WHERE pv.supplier_id = ? AND pv.date BETWEEN ? AND ?");
              $sum_stmt->execute([$supplier_id, $startdate, $enddate]);
              $total_amount_dbw_supplier_search = $sum_stmt->fetch(PDO::FETCH_ASSOC);
            } elseif (isset($_POST['commoditydbwsearch'])) {
              $startdate = $_POST['dbwstartdate'];
              $enddate = $_POST['dbwenddate'];
              $commodity = $_POST['item_id'];
              $stmt = $pdo->prepare("$base_sql WHERE p.commodity = ? AND pv.date BETWEEN ? AND ?");
              $stmt->execute([$commodity, $startdate, $enddate]);
              $purchasedatas = $stmt->fetchAll(PDO::FETCH_ASSOC);

              $sum_stmt = $pdo->prepare("$base_sum_sql WHERE p.commodity = ? AND pv.date BETWEEN ? AND ?");
              $sum_stmt->execute([$commodity, $startdate, $enddate]);
              $total_amount_dbw_commodity_search = $sum_stmt->fetch(PDO::FETCH_ASSOC);
            } elseif (isset($_POST['vouchersearch'])) {
              $voucher_no = $_POST['voucher_no'];
              $stmt = $pdo->prepare("$base_sql WHERE pv.voucher_no = ?");
              $stmt->execute([$voucher_no]);
              $purchasedatas = $stmt->fetchAll(PDO::FETCH_ASSOC);

              $sum_stmt = $pdo->prepare("$base_sum_sql WHERE pv.voucher_no = ?");
              $sum_stmt->execute([$voucher_no]);
              $total_amount_commodity_search = $sum_stmt->fetch(PDO::FETCH_ASSOC);
            } elseif (isset($_POST['commodityandsizesearch'])) {
              $item_id = $_POST['item_id'];
              $size = $_POST['size'];
              $stmt = $pdo->prepare("$base_sql WHERE p.commodity = ? AND p.size = ?");
              $stmt->execute([$item_id, $size]);
              $purchasedatas = $stmt->fetchAll(PDO::FETCH_ASSOC);

              $sum_stmt = $pdo->prepare("SELECT SUM(amount) as total_amount FROM purchase WHERE commodity = ? AND size = ?");
              $sum_stmt->execute([$item_id, $size]);
              $total_amount_commodity_and_size_search = $sum_stmt->fetch(PDO::FETCH_ASSOC);

              $sum_stmt2 = $pdo->prepare("SELECT SUM(viss) as total_viss FROM purchase WHERE commodity = ? AND size = ?");
              $sum_stmt2->execute([$item_id, $size]);
              $total_amount_commodity_and_size_search_viss = $sum_stmt2->fetch(PDO::FETCH_ASSOC);
            } else {
              $stmt = $pdo->prepare($base_sql);
              $stmt->execute();
              $purchasedatas = $stmt->fetchAll(PDO::FETCH_ASSOC);
            }

            // Loop mapped data correctly to frontend
            foreach ($purchasedatas as $purchasedata) {
              $supplierid = $purchasedata['supplier_id'];
              $supplier_name = $query->select('supplier', $supplierid, 'supplier_id');
              $itemid = $purchasedata['commodity'];
              $item_name = $query->select('item', $itemid, 'item_id');
            ?>

              <tr>
                <td><?php echo $purchasedata['no']; ?></td>
                <td><?php echo date('d-m-Y', strtotime($purchasedata['date'])); ?></td>
                <td><?php echo $purchasedata['voucher_no']; ?></td>
                <td><?php echo $purchasedata['tclfrozen']; ?></td>
                <td><?php echo $supplier_name['supplier_name']; ?></td>
                <td><?php echo $item_name['item_name']; ?></td>
                <td><?php echo $purchasedata['size']; ?></td>
                <td><?php echo $purchasedata['viss']; ?></td>
                <td><?php echo floatval($purchasedata['viss']) * 1.634; ?></td>
                <td><?php echo $purchasedata['pcs']; ?></td>
                <td><?php echo $purchasedata['price']; ?></td>
                <td><?php echo $purchasedata['amount']; ?></td>
              </tr>
            <?php
            }
            ?>
            <?php
            if (!empty($total_amount_supplier_search)) {
            ?>
              <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>Total Amount:</td>
                <td><?php echo $total_amount_supplier_search['total_amount']; ?></td>
              </tr>
            <?php
            }
            ?>

            <?php
            if (!empty($total_amount_commodity_search)) {
            ?>
              <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>Total Amount:</td>
                <td><?php echo $total_amount_commodity_search['total_amount']; ?></td>
              </tr>
              <?php
              if (!empty($total_amount_commodity_and_size_search_viss)) {
              ?>
                <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td>Total Viss:</td>
                  <td><?php echo $total_amount_commodity_search_viss['total_viss']; ?></td>
                </tr>
                <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td>Total Kg:</td>
                  <td><?php echo floatval($total_amount_commodity_search_viss['total_viss']) * 1.634; ?></td>
                </tr>
              <?php
              }
              ?>
            <?php
            }
            ?>

            <?php
            if (!empty($total_amount_dbw_search)) {
            ?>
              <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>Total Amount:</td>
                <td><?php echo $total_amount_dbw_search['total_amount']; ?></td>
              </tr>
            <?php
            }
            ?>

            <?php
            if (!empty($total_amount_dbw_supplier_search)) {
            ?>
              <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>Total Amount:</td>
                <td><?php echo $total_amount_dbw_supplier_search['total_amount']; ?></td>
              </tr>
            <?php
            }
            ?>

            <?php
            if (!empty($total_amount_dbw_commodity_search)) {
            ?>
              <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>Total Amount:</td>
                <td><?php echo $total_amount_dbw_commodity_search['total_amount']; ?></td>
              </tr>
            <?php
            }
            ?>

            <?php
            if (!empty($total_amount_commodity_and_size_search)) {
            ?>
              <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>Total Amount:</td>
                <td><?php echo $total_amount_commodity_and_size_search['total_amount']; ?></td>
              </tr>
              <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>Total Viss:</td>
                <td><?php echo $total_amount_commodity_and_size_search_viss['total_viss']; ?></td>
              </tr>
              <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>Total Kg:</td>
                <td><?php echo floatval($total_amount_commodity_and_size_search_viss['total_viss']) * 1.634; ?></td>
              </tr>
            <?php
            }
            ?>

          </table>
        </div>
      </div>
    </div>
  </div>

  <?php
  $bootstrap->javascript();
  ?>
</body>

</html>