<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();

// Logic: If type is 'material', filter for material. Otherwise, show everything (1=1).
$type = isset($_GET['type']) ? $_GET['type'] : '';

if ($type === 'material') {
  $type_filter = "fishormaterial = 'material'";
  $display_title = "Material";
} else {
  $type_filter = "1=1";
  $display_title = "All";
}
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>Admin | Payable Reports</title>
</head>
<?php $bootstrap->css(); ?>

<body>
  <div class="row">
    <div class="sidebarcol" id="sidebar">
      <?php include 'sidebar.php'; ?>
    </div>
    <div class="contentcol" id="content">
      <?php require 'navbar.php'; ?>
      <div class="card">
        <div class="card-header bg-info text-light">
          <h5>Payable Reports (<?= $display_title; ?>)</h5>
          <button onclick="printReport()" class="btn btn-secondary btn-sm ms-2 float-end">Print Report</button>
          <?php
          // Export button logic
          $date_range_params = "";
          if (isset($_POST['date_search'])) {
            $date_range_params = "&from=" . $_POST['date_from'] . "&to=" . $_POST['date_to'];
          }
          echo '<a href="export.php?table_name=payable&type=' . $type . $date_range_params . '" class="btn btn-success btn-sm ms-2 float-end">Export To Excel</a>';
          ?>
          <form action="payablereport.php?type=<?= $type; ?>" method="post" class="d-inline">
            <button type="submit" name="date_search" class="btn btn-primary float-end btn-sm ms-2 me-2">Search</button>
            <input type="date" name="date_to" class="inpv2 form-control d-inline float-end ms-2" style="width: 150px; padding: 2px;" value="<?= isset($_POST['date_to']) ? $_POST['date_to'] : '' ?>">
            <input type="date" name="date_from" class="inpv2 form-control d-inline float-end ms-2" style="width: 150px; padding: 2px;" value="<?= isset($_POST['date_from']) ? $_POST['date_from'] : '' ?>">
          </form>
        </div>
        <div class="card-body">
          <b>Payable for Supplier</b>
          <?php
          if (isset($_POST['date_search'])) {
            $from = $_POST['date_from'];
            $to = $_POST['date_to'];
          ?>
            <div class="float-end"><b>Date Range: <?= date('d-m-Y', strtotime($from)); ?> to <?= date('d-m-Y', strtotime($to)); ?></b></div>
            <table class="mt-3 table table-bordered table-striped rounded">
              <tr>
                <th>No</th>
                <th>Supplier Name</th>
                <th>Opening Amount</th>
                <th>Add Amt</th>
                <th>Paid Amt</th>
                <th>Balance</th>
              </tr>
              <?php
              $stmt = $pdo->prepare("SELECT DISTINCT supplier_id FROM payable WHERE $type_filter AND (date BETWEEN '$from' AND '$to' OR paid_date BETWEEN '$from' AND '$to')");
              $stmt->execute();
              $payablesuppliers = $stmt->fetchall();
              $id = 0;
              $totalbalance = 0;
              foreach ($payablesuppliers as $payablesupplier) :
                $supplier_id = $payablesupplier['supplier_id'];

                $openingamountstmt = $pdo->prepare("SELECT closing_balance FROM payable WHERE $type_filter AND supplier_id='$supplier_id' AND date<'$from' ORDER BY id DESC LIMIT 1");
                $openingamountstmt->execute();
                $openingamount = $openingamountstmt->fetch(PDO::FETCH_ASSOC);

                $purchaseamtstmt = $pdo->prepare("SELECT SUM(purchase_amount) AS purchase_amount FROM payable WHERE $type_filter AND supplier_id='$supplier_id' AND date BETWEEN '$from' AND '$to'");
                $purchaseamtstmt->execute();
                $purchaseamt = $purchaseamtstmt->fetch(PDO::FETCH_ASSOC);

                $paidamtstmt = $pdo->prepare("SELECT SUM(paid_amount) AS paid_amount FROM payable WHERE $type_filter AND supplier_id='$supplier_id' AND paid_date BETWEEN '$from' AND '$to'");
                $paidamtstmt->execute();
                $paidamt = $paidamtstmt->fetch(PDO::FETCH_ASSOC);

                $openingamt = !empty($openingamount['closing_balance']) ? $openingamount['closing_balance'] : 0;
                $balance = ($openingamt + $purchaseamt['purchase_amount']) - $paidamt['paid_amount'];
                $supplierdata = $query->select('acname', $supplier_id, 'code_no');
                $id++;
              ?>
                <tr>
                  <td><?= $id; ?></td>
                  <td><?= $supplierdata['ac_name']; ?></td>
                  <td><?= $openingamt; ?></td>
                  <td><?= $purchaseamt['purchase_amount']; ?></td>
                  <td><?= $paidamt['paid_amount']; ?></td>
                  <td><?= $balance; ?></td>
                </tr>
              <?php
                $totalbalance += $balance;
              endforeach; ?>
              <tr style="background-color: lightgreen;">
                <td>TOTAL</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><?= $totalbalance; ?></td>
              </tr>
            </table>
          <?php
          } else {
            // Default view
            $originalDate = date('Y-m-d');
            $stmt = $pdo->prepare("SELECT DISTINCT supplier_id FROM payable WHERE $type_filter AND (date='$originalDate' OR paid_date='$originalDate')");
            $stmt->execute();
            $payablesuppliers = $stmt->fetchall();
          ?>
            <table class="mt-3 table table-bordered table-striped rounded">
              <tr>
                <th>No</th>
                <th>Supplier Name</th>
                <th>Opening Amount</th>
                <th>Add Amt</th>
                <th>Paid Amt</th>
                <th>Balance</th>
              </tr>
              <?php
              $id = 0;
              foreach ($payablesuppliers as $payablesupplier) :
                $supplier_id = $payablesupplier['supplier_id'];
                $id++;
                $openingamountstmt = $pdo->prepare("SELECT closing_balance FROM payable WHERE $type_filter AND supplier_id='$supplier_id' AND date<'$originalDate' ORDER BY id DESC LIMIT 1");
                $openingamountstmt->execute();
                $openingamount = $openingamountstmt->fetch(PDO::FETCH_ASSOC);
                $openingamt = !empty($openingamount['closing_balance']) ? $openingamount['closing_balance'] : 0;

                $purchaseamtstmt = $pdo->prepare("SELECT SUM(purchase_amount) AS purchase_amount FROM payable WHERE $type_filter AND supplier_id='$supplier_id' AND date<'$originalDate'");
                $purchaseamtstmt->execute();
                $purchaseamt = $purchaseamtstmt->fetch(PDO::FETCH_ASSOC);

                $paidamtstmt = $pdo->prepare("SELECT SUM(paid_amount) AS paid_amount FROM payable WHERE $type_filter AND supplier_id='$supplier_id' AND paid_date<'$originalDate'");
                $paidamtstmt->execute();
                $paidamt = $paidamtstmt->fetch(PDO::FETCH_ASSOC);

                $addamountstmt = $pdo->prepare("SELECT SUM(purchase_amount) AS add_amount FROM payable WHERE $type_filter AND supplier_id='$supplier_id' AND date='$originalDate'");
                $addamountstmt->execute();
                $addamountdata = $addamountstmt->fetch(PDO::FETCH_ASSOC);

                $paidamountstmt = $pdo->prepare("SELECT SUM(paid_amount) AS paid_amount FROM payable WHERE $type_filter AND supplier_id='$supplier_id' AND paid_date='$originalDate'");
                $paidamountstmt->execute();
                $paidamountdata = $paidamountstmt->fetch(PDO::FETCH_ASSOC);

                $balance = ($openingamt + $purchaseamt['purchase_amount']) - $paidamt['paid_amount'];
                $supplierdata = $query->select('acname', $supplier_id, 'code_no');
              ?>
                <tr>
                  <td><?= $id; ?></td>
                  <td><?= $supplierdata['ac_name']; ?></td>
                  <td><?= $balance; ?></td>
                  <td><?= $addamountdata['add_amount']; ?></td>
                  <td><?= $paidamountdata['paid_amount']; ?></td>
                  <td><?= ($balance + $addamountdata['add_amount']) - $paidamountdata['paid_amount']; ?></td>
                </tr>
              <?php endforeach; ?>
            </table>
          <?php } ?>
        </div>
      </div>
    </div>
  </div>
  <script>
    function printReport() {
      // Get dates from inputs to ensure we print what we are looking at
      var from = document.getElementsByName('date_from')[0].value;
      var to = document.getElementsByName('date_to')[0].value;
      var type = "<?= $type ?>";
      window.open(`payable_print.php?type=${type}&from=${from}&to=${to}`, '_blank');
    }
  </script>
  <?php $bootstrap->javascript(); ?>
</body>

</html>