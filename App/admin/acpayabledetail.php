<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();

if (!isset($_GET['supplier_id'])) {
  header("Location: acpayable.php");
  exit;
}

$supplier_id = intval($_GET['supplier_id']);

// Handle Bulk/Waterfall Payment Submission
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['pay_bulk'])) {
  $payment_date = $_POST['payment_date'];
  $payment_account = $_POST['payment_account'];
  $reference = $_POST['reference'];
  $payment_amount = $_POST['payment_amount'];

  // Calls the waterfall engine in query.ctr.php
  $query->paySupplierBalance($supplier_id, $payment_date, $payment_account, $reference, $payment_amount);
}

// Fetch Supplier Info
$supStmt = $pdo->prepare("SELECT name FROM contacts WHERE id = ?");
$supStmt->execute([$supplier_id]);
$supplier_name = $supStmt->fetchColumn();

// Fetch all Authorised and Paid Bills for this supplier
$billsStmt = $pdo->prepare("
    SELECT id, date, voucher_no, grand_total, paid_amount, (grand_total - paid_amount) AS outstanding, status 
    FROM purchases 
    WHERE contact_id = ? AND status IN ('AUTHORISED', 'PAID') 
    ORDER BY date ASC, id ASC
");
$billsStmt->execute([$supplier_id]);
$bills = $billsStmt->fetchAll(PDO::FETCH_ASSOC);

// Calculate total outstanding for the payment modal limit
$total_outstanding = 0;
foreach ($bills as $b) {
  $total_outstanding += $b['outstanding'];
}

// Fetch Bank/Cash Accounts for the payment dropdown
$accStmt = $pdo->query("SELECT code, name FROM accodes WHERE class = 'ASSETS' ORDER BY code ASC");
$asset_accounts = $accStmt->fetchAll(PDO::FETCH_ASSOC);

?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>Document</title>
  <?php $bootstrap->css(); ?>
</head>

<body>
  <div class="row">
    <div class="sidebarcol" id="sidebar">
      <?php include 'sidebar.php'; ?>
    </div>
    <div class="contentcol" id="content">
      <?php require 'navbar.php'; ?>

      <div class="card">
        <div class="card-header bg-info text-light">
          <a href="acpayable.php" class="btn btn-secondary btn-sm float-end">Back</a>

          <!-- Master Waterfall Payment Button -->
          <?php if ($total_outstanding > 0): ?>
            <button type="button" class="btn btn-success btn-sm float-end me-2" data-bs-toggle="modal" data-bs-target="#payModal">
              Make Payment
            </button>
          <?php endif; ?>

          <h5><?= htmlspecialchars($supplier_name); ?> Payable Detail Info</h5>
        </div>
        <div class="card-body">
          <table class="mt-1 table table-bordered table-striped rounded">
            <tr>
              <th class="pt-3">Date</th>
              <th>Purchase <br> Voucher No</th>
              <th>Purchase <br> Amount</th>
              <th class="pt-3">Paid Amount</th>
              <th class="pt-3">Outstanding</th>
              <th class="pt-3">Status</th>
            </tr>
            <?php if (empty($bills)): ?>
              <tr>
                <td colspan="6" class="text-center">No authorized or paid bills found for this supplier.</td>
              </tr>
            <?php else: ?>
              <?php foreach ($bills as $bill): ?>
                <tr>
                  <td><?= date('d-m-Y', strtotime($bill['date'])); ?></td>
                  <td><?= htmlspecialchars($bill['voucher_no']); ?></td>
                  <td><?= number_format($bill['grand_total']); ?></td>
                  <td><?= number_format($bill['paid_amount']); ?></td>
                  <td><?= number_format($bill['outstanding']); ?></td>
                  <td>
                    <?php if ($bill['outstanding'] == 0): ?>
                      Paid
                    <?php elseif ($bill['paid_amount'] > 0): ?>
                      Partial
                    <?php else: ?>
                      Unpaid
                    <?php endif; ?>
                  </td>
                </tr>
              <?php endforeach; ?>
            <?php endif; ?>
          </table>
        </div>
      </div>
    </div>
  </div>

  <!-- Master Waterfall Payment Modal -->
  <?php if ($total_outstanding > 0): ?>
    <div class="modal fade" id="payModal" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header bg-secondary text-light">
            <h5 class="modal-title">Make Payment to <?= htmlspecialchars($supplier_name); ?></h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <form action="" method="post">
            <div class="modal-body">
              <input type="hidden" name="pay_bulk" value="1">

              <div class="mb-2">
                <label>Payment Date</label>
                <input type="date" name="payment_date" class="form-control" value="<?= date('Y-m-d'); ?>" required>
              </div>

              <div class="mb-2">
                <label>Pay From (Bank/Cash Account)</label>
                <select name="payment_account" class="form-control" required>
                  <option value="">- Select Account -</option>
                  <?php foreach ($asset_accounts as $acc): ?>
                    <option value="<?= $acc['code']; ?>"><?= $acc['code'] . ' - ' . htmlspecialchars($acc['name']); ?></option>
                  <?php endforeach; ?>
                </select>
              </div>

              <div class="mb-2">
                <label>Payment Reference</label>
                <input type="text" name="reference" class="form-control" placeholder="e.g. Bank Transfer Ref or Check No" required>
              </div>

              <div class="mb-2">
                <label>Payment Amount</label>
                <input type="number" name="payment_amount" step="0.01" max="<?= $total_outstanding; ?>" class="form-control" placeholder="Max: <?= number_format($total_outstanding, 2); ?>" required>
                <small class="text-muted">Total Outstanding: <?= number_format($total_outstanding, 2); ?></small>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-success">Apply Payment</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  <?php endif; ?>

  <?php $bootstrap->javascript(); ?>
</body>

</html>