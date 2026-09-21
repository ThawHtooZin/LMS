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

$paymentResult = null; // Store execution result for SweetAlert

// Handle Bulk/Waterfall Payment Submission
if ($_SERVER['REQUEST_METHOD'] == 'POST' and isset($_POST['pay_bulk'])) {
  $payment_date = $_POST['payment_date'];
  $payment_account = $_POST['payment_account'];
  $reference = $_POST['reference'];
  $check_number = isset($_POST['check_number']) ? $_POST['check_number'] : null;
  $description = isset($_POST['description']) ? $_POST['description'] : null;
  $payment_amount = $_POST['payment_amount'];

  $paymentResult = $query->paySupplierBalance($supplier_id, $payment_date, $payment_account, $reference, $check_number, $description, $payment_amount);
}

// Fetch Supplier Info
$supStmt = $pdo->prepare("SELECT name FROM contacts WHERE id = ?");
$supStmt->execute([$supplier_id]);
$supplier_name = $supStmt->fetchColumn();

// Fetch all Awaiting Payment and Paid Bills for this supplier
$billsStmt = $pdo->prepare("
    SELECT id, date, voucher_no, grand_total, paid_amount, (grand_total - paid_amount) AS outstanding, status 
    FROM purchases 
    WHERE contact_id = ? AND status IN ('AWAITING_PAYMENT', 'PAID') 
    ORDER BY date ASC, id ASC
");
$billsStmt->execute([$supplier_id]);
$bills = $billsStmt->fetchAll(PDO::FETCH_ASSOC);

// Fetch Payment Allocations for these specific bills to build the accordion histories
$bill_ids = array_column($bills, 'id');
$payments_by_bill = [];

if (!empty($bill_ids)) {
  $placeholders = implode(',', array_fill(0, count($bill_ids), '?'));
  $payStmt = $pdo->prepare("
      SELECT p.*, a.name AS account_name 
      FROM purchase_payments p 
      LEFT JOIN accodes a ON p.payment_account = a.code 
      WHERE p.purchase_id IN ($placeholders) 
      ORDER BY p.payment_date DESC, p.id DESC
  ");
  $payStmt->execute($bill_ids);
  $all_payments = $payStmt->fetchAll(PDO::FETCH_ASSOC);

  foreach ($all_payments as $pay) {
    $payments_by_bill[$pay['purchase_id']][] = $pay;
  }
}

// Calculate total outstanding for the payment modal limit
$total_outstanding = 0;
foreach ($bills as $b) {
  $total_outstanding += $b['outstanding'];
}

// Fetch Bank/Cash Accounts for the payment dropdown AND tag which ones are official banks
$accStmt = $pdo->query("
    SELECT a.code, a.name, b.account_code AS is_bank 
    FROM accodes a 
    LEFT JOIN bankdetail b ON a.code = b.account_code 
    WHERE a.class = 'ASSETS' 
    ORDER BY a.code ASC
");
$asset_accounts = $accStmt->fetchAll(PDO::FETCH_ASSOC);

// Extract only the codes that belong to a Bank
$bank_codes = [];
foreach ($asset_accounts as $acc) {
  if (!empty($acc['is_bank'])) {
    $bank_codes[] = $acc['code'];
  }
}
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>Payable Detail</title>
  <?php echo $bootstrap->css(); ?>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
  <style>
    .accordion-toggle {
      cursor: pointer;
    }

    .accordion-toggle:hover {
      background-color: #f8f9fa;
    }
  </style>
</head>

<body>
  <?php echo $bootstrap->javascriptindex(); ?>

  <?php if ($paymentResult !== null): ?>
    <script>
      <?php if ($paymentResult['status'] === true): ?>
        swal("Success!", "Payment of <?= number_format($paymentResult['amount'], 2); ?> applied successfully across open bills.", "success").then(function() {
          window.location.href = "acpayabledetail.php?supplier_id=<?= $supplier_id; ?>";
        });
      <?php else: ?>
        swal("Error!", "Payment failed: <?= addslashes($paymentResult['message']); ?>", "error");
      <?php endif; ?>
    </script>
  <?php endif; ?>

  <div class="row">
    <div class="sidebarcol" id="sidebar">
      <?php include 'sidebar.php'; ?>
    </div>
    <div class="contentcol" id="content">
      <?php require 'navbar.php'; ?>

      <div class="card shadow-sm border-0 mt-3 ms-2 me-2">
        <div class="card-header bg-info text-light d-flex justify-content-between align-items-center">
          <h5 class="mb-0"><?= htmlspecialchars($supplier_name); ?> Payable Detail Info</h5>
          <div>
            <?php if ($total_outstanding > 0): ?>
              <button type="button" class="btn btn-success btn-sm fw-bold me-2" data-bs-toggle="modal" data-bs-target="#payModal">
                Make Payment
              </button>
            <?php endif; ?>
            <a href="acpayable.php" class="btn btn-light btn-sm fw-bold">Back</a>
          </div>
        </div>
        <div class="card-body">
          <table class="table table-bordered table-striped rounded">
            <thead class="table-light">
              <tr>
                <th>Date</th>
                <th>Purchase <br> Voucher No</th>
                <th>Purchase <br> Amount</th>
                <th>Paid Amount</th>
                <th>Balance</th>
                <th>Status</th>
              </tr>
            </thead>
            <tbody>
              <?php if (empty($bills)): ?>
                <tr>
                  <td colspan="6" class="text-center">No authorized or paid bills found for this supplier.</td>
                </tr>
              <?php else: ?>
                <?php foreach ($bills as $bill): ?>
                  <tr>
                    <td><?= date('d-m-Y', strtotime($bill['date'])); ?></td>
                    <td class="fw-bold text-primary"><?= htmlspecialchars($bill['voucher_no']); ?></td>
                    <td><?= number_format($bill['grand_total'], 2); ?></td>
                    <td>
                      <?php if ($bill['paid_amount'] > 0): ?>
                        <a href="#history-<?= $bill['id']; ?>" data-bs-toggle="collapse" class="text-success text-decoration-none fw-bold accordion-toggle">
                          <?= number_format($bill['paid_amount'], 2); ?> <i class="bi bi-chevron-down ms-1" style="font-size:11px;"></i>
                        </a>
                      <?php else: ?>
                        <?= number_format($bill['paid_amount'], 2); ?>
                      <?php endif; ?>
                    </td>
                    <td class="fw-bold"><?= number_format($bill['outstanding'], 2); ?></td>
                    <td>
                      <?php if ($bill['outstanding'] == 0): ?>
                        <span class="badge bg-success">Paid</span>
                      <?php elseif ($bill['paid_amount'] > 0): ?>
                        <span class="badge bg-warning text-dark">Partial</span>
                      <?php else: ?>
                        <span class="badge bg-secondary">Unpaid</span>
                      <?php endif; ?>
                    </td>
                  </tr>

                  <?php if ($bill['paid_amount'] > 0): ?>
                    <tr id="history-<?= $bill['id']; ?>" class="collapse bg-light">
                      <td colspan="6" class="p-3 border-start border-4 border-info">
                        <b class="text-muted"><i class="bi bi-clock-history"></i> Payment History:</b>
                        <table class="table table-sm table-bordered mt-2 bg-white mb-0" style="font-size: 14px;">
                          <tr class="bg-secondary text-light">
                            <th>Date</th>
                            <th>Account Name</th>
                            <th>Reference</th>
                            <th>Check #</th>
                            <th>Description</th>
                            <th>Amount</th>
                          </tr>
                          <?php if (!empty($payments_by_bill[$bill['id']])): ?>
                            <?php foreach ($payments_by_bill[$bill['id']] as $pay): ?>
                              <tr>
                                <td><?= date('d-m-Y', strtotime($pay['payment_date'])); ?></td>
                                <td><?= htmlspecialchars($pay['account_name'] ?? $pay['payment_account']); ?></td>
                                <td><?= htmlspecialchars($pay['reference']); ?></td>
                                <td><?= htmlspecialchars($pay['check_number'] ?? '-'); ?></td>
                                <td class="text-muted"><?= htmlspecialchars($pay['description'] ?? '-'); ?></td>
                                <td class="fw-bold text-success"><?= number_format($pay['amount'], 2); ?></td>
                              </tr>
                            <?php endforeach; ?>
                          <?php else: ?>
                            <tr>
                              <td colspan="6" class="text-center text-muted">Legacy payment record (No detailed breakdown available).</td>
                            </tr>
                          <?php endif; ?>
                        </table>
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

  <?php if ($total_outstanding > 0): ?>
    <div class="modal fade" id="payModal" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header bg-success text-light">
            <h5 class="modal-title">Make Payment to <?= htmlspecialchars($supplier_name); ?></h5>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <form action="" method="post">
            <div class="modal-body">
              <input type="hidden" name="pay_bulk" value="1">

              <div class="row mb-3">
                <div class="col-md-6">
                  <label class="form-label fw-bold small">Payment Date</label>
                  <input type="date" name="payment_date" class="form-control" value="<?= date('Y-m-d'); ?>" required>
                </div>
                <div class="col-md-6">
                  <label class="form-label fw-bold small">Pay From (Bank/Cash Account)</label>
                  <select name="payment_account" class="form-select" required>
                    <option value="">- Select Account -</option>
                    <?php foreach ($asset_accounts as $acc): ?>
                      <option value="<?= $acc['code']; ?>"><?= htmlspecialchars($acc['name']); ?></option>
                    <?php endforeach; ?>
                  </select>
                </div>
              </div>

              <div class="row mb-3">
                <div class="col-md-6">
                  <label class="form-label fw-bold small">Payment Reference</label>
                  <input type="text" name="reference" class="form-control" placeholder="e.g. Bank Transfer Ref" required>
                </div>
                <div class="col-md-6" id="checkNumberWrapper" style="display: none;">
                  <label class="form-label fw-bold small">Check Number <span class="text-muted fw-normal">(Optional)</span></label>
                  <input type="text" name="check_number" class="form-control" placeholder="e.g. 0001234">
                </div>
              </div>

              <div class="mb-3">
                <label class="form-label fw-bold small">Description / Notes <span class="text-muted fw-normal">(Optional)</span></label>
                <textarea name="description" class="form-control" rows="2" placeholder="Payment notes..."></textarea>
              </div>

              <div class="mb-2">
                <label class="form-label fw-bold small">Payment Amount</label>
                <input type="number" name="payment_amount" step="0.01" max="<?= $total_outstanding; ?>" class="form-control form-control-lg text-success fw-bold" placeholder="Max: <?= number_format($total_outstanding, 2); ?>" required>
                <small class="text-muted">Total Outstanding: <?= number_format($total_outstanding, 2); ?></small>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary fw-bold" data-bs-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-success fw-bold px-4">Apply Payment</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  <?php endif; ?>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
  <?php echo $bootstrap->javascript(); ?>

  <script>
    const bankCodes = <?= json_encode(empty($bank_codes) ? [] : $bank_codes); ?>;

    $(document).ready(function() {
      $('select[name="payment_account"]').change(function() {
        let selectedCode = $(this).val();
        if (bankCodes.includes(selectedCode)) {
          $('#checkNumberWrapper').fadeIn(200);
        } else {
          $('#checkNumberWrapper').fadeOut(200);
          $('input[name="check_number"]').val('');
        }
      });
    });
  </script>
</body>

</html>