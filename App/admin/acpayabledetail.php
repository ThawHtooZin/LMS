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

// Fetch Payment Allocations for these specific bills to build the accordion histories
$bill_ids = array_column($bills, 'id');
$payments_by_bill = [];

if (!empty($bill_ids)) {
  // Dynamically create placeholders for the IN clause (?,?,?)
  $placeholders = implode(',', array_fill(0, count($bill_ids), '?'));
  $payStmt = $pdo->prepare("SELECT * FROM purchase_payments WHERE purchase_id IN ($placeholders) ORDER BY payment_date DESC, id DESC");
  $payStmt->execute($bill_ids);
  $all_payments = $payStmt->fetchAll(PDO::FETCH_ASSOC);

  // Group the payments by purchase_id for easy lookup in the HTML loop
  foreach ($all_payments as $pay) {
    $payments_by_bill[$pay['purchase_id']][] = $pay;
  }
}

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
  <title>Payable Details - <?= htmlspecialchars($supplier_name); ?></title>
  <?php $bootstrap->css(); ?>
  <!-- Added Bootstrap Icons for the dropdown arrows -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
  <style>
    .accordion-toggle {
      cursor: pointer;
    }

    .accordion-toggle:hover {
      background-color: #f8f9fa;
    }

    .nested-table-container {
      border-left: 3px solid #17a2b8;
      background-color: #fcfcfc;
    }
  </style>
</head>

<body>
  <div class="row">
    <div class="sidebarcol" id="sidebar">
      <?php include 'sidebar.php'; ?>
    </div>
    <div class="contentcol" id="content">
      <?php require 'navbar.php'; ?>

      <div class="card shadow-sm border-0">
        <div class="card-header bg-info text-light">
          <a href="acpayable.php" class="btn btn-secondary btn-sm float-end">Back</a>

          <!-- Master Waterfall Payment Button -->
          <?php if ($total_outstanding > 0): ?>
            <button type="button" class="btn btn-success btn-sm float-end me-2 fw-bold" data-bs-toggle="modal" data-bs-target="#payModal">
              Make Payment
            </button>
          <?php endif; ?>

          <h5 class="mb-0 pt-1 fw-bold"><?= htmlspecialchars($supplier_name); ?> - Payable Detail</h5>
        </div>
        <div class="card-body p-0">
          <table class="table table-hover align-middle mb-0">
            <thead class="table-light">
              <tr>
                <th class="ps-4">Date</th>
                <th>Purchase Voucher No</th>
                <th class="text-end">Purchase Amount</th>
                <th class="text-end">Paid Amount</th>
                <th class="text-end">Outstanding</th>
                <th class="text-center pe-4">Status</th>
              </tr>
            </thead>
            <tbody>
              <?php if (empty($bills)): ?>
                <tr>
                  <td colspan="6" class="text-center py-4 text-muted">No authorized or paid bills found for this supplier.</td>
                </tr>
              <?php else: ?>
                <?php foreach ($bills as $bill): ?>
                  <!-- Main Bill Row -->
                  <tr>
                    <td class="ps-4"><?= date('d M Y', strtotime($bill['date'])); ?></td>
                    <td class="fw-bold"><?= htmlspecialchars($bill['voucher_no']); ?></td>
                    <td class="text-end"><?= number_format($bill['grand_total'], 2); ?></td>
                    <td class="text-end">
                      <?php if ($bill['paid_amount'] > 0): ?>
                        <!-- Clickable Link to trigger the nested payment history -->
                        <a href="#payment-history-<?= $bill['id']; ?>" data-bs-toggle="collapse" class="text-primary text-decoration-none fw-bold accordion-toggle">
                          <?= number_format($bill['paid_amount'], 2); ?> <i class="bi bi-chevron-down ms-1" style="font-size:10px;"></i>
                        </a>
                      <?php else: ?>
                        <span class="text-muted">0.00</span>
                      <?php endif; ?>
                    </td>
                    <td class="text-end fw-bold <?php echo ($bill['outstanding'] > 0) ? 'text-danger' : 'text-success'; ?>">
                      <?= number_format($bill['outstanding'], 2); ?>
                    </td>
                    <td class="text-center pe-4">
                      <?php if ($bill['outstanding'] == 0): ?>
                        <span class="badge bg-success">Paid</span>
                      <?php elseif ($bill['paid_amount'] > 0): ?>
                        <span class="badge bg-warning text-dark">Partial</span>
                      <?php else: ?>
                        <span class="badge bg-danger">Unpaid</span>
                      <?php endif; ?>
                    </td>
                  </tr>

                  <!-- Nested Accordion Row (Payment History) -->
                  <?php if ($bill['paid_amount'] > 0): ?>
                    <tr id="payment-history-<?= $bill['id']; ?>" class="collapse">
                      <td colspan="6" class="p-0 border-0">
                        <div class="nested-table-container p-3 mb-3 ms-4 me-4 rounded shadow-sm">
                          <h6 class="text-muted fw-bold mb-2" style="font-size: 11px; text-transform: uppercase; letter-spacing: 1px;"><i class="bi bi-clock-history"></i> Payment History for <?= htmlspecialchars($bill['voucher_no']); ?></h6>
                          <table class="table table-sm table-bordered bg-white mb-0" style="font-size: 13px;">
                            <thead class="table-secondary text-muted">
                              <tr>
                                <th>Payment Date</th>
                                <th>Paid From (Account)</th>
                                <th>Reference</th>
                                <th class="text-end">Amount Applied</th>
                              </tr>
                            </thead>
                            <tbody>
                              <?php if (!empty($payments_by_bill[$bill['id']])): ?>
                                <?php foreach ($payments_by_bill[$bill['id']] as $pay): ?>
                                  <tr>
                                    <td><?= date('d M Y', strtotime($pay['payment_date'])); ?></td>
                                    <td><?= htmlspecialchars($pay['payment_account']); ?></td>
                                    <td><?= htmlspecialchars($pay['reference']); ?></td>
                                    <td class="text-end fw-bold text-success"><?= number_format($pay['amount'], 2); ?></td>
                                  </tr>
                                <?php endforeach; ?>
                              <?php else: ?>
                                <tr>
                                  <td colspan="4" class="text-center text-muted fst-italic py-2">Legacy payment (No detailed records found prior to system upgrade).</td>
                                </tr>
                              <?php endif; ?>
                            </tbody>
                          </table>
                        </div>
                      </td>
                    </tr>
                  <?php endif; ?>
                <?php endforeach; ?>
              <?php endif; ?>
            </tbody>
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

              <div class="mb-3">
                <label class="fw-bold small mb-1">Payment Date</label>
                <input type="date" name="payment_date" class="form-control" value="<?= date('Y-m-d'); ?>" required>
              </div>

              <div class="mb-3">
                <label class="fw-bold small mb-1">Pay From (Bank/Cash Account)</label>
                <select name="payment_account" class="form-select" required>
                  <option value="">- Select Account -</option>
                  <?php foreach ($asset_accounts as $acc): ?>
                    <option value="<?= $acc['code']; ?>"><?= $acc['code'] . ' - ' . htmlspecialchars($acc['name']); ?></option>
                  <?php endforeach; ?>
                </select>
              </div>

              <div class="mb-3">
                <label class="fw-bold small mb-1">Payment Reference</label>
                <input type="text" name="reference" class="form-control" placeholder="e.g. Bank Transfer Ref or Check No" required>
              </div>

              <div class="mb-3">
                <label class="fw-bold small mb-1">Payment Amount</label>
                <div class="input-group">
                  <span class="input-group-text">MMK</span>
                  <input type="number" name="payment_amount" step="0.01" max="<?= $total_outstanding; ?>" class="form-control" placeholder="Max: <?= number_format($total_outstanding, 2); ?>" required>
                </div>
                <small class="text-danger fw-bold mt-1 d-block">Total Outstanding: <?= number_format($total_outstanding, 2); ?></small>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary fw-bold" data-bs-dismiss="modal">Cancel</button>
              <button type="submit" class="btn btn-success fw-bold"><i class="bi bi-check-circle"></i> Apply Payment</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  <?php endif; ?>

  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
  <?php $bootstrap->javascript(); ?>
</body>

</html>