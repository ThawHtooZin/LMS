<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();

// Filter parameters
$from = isset($_POST['date_from']) ? $_POST['date_from'] : date('Y-m-01');
$to = isset($_POST['date_to']) ? $_POST['date_to'] : date('Y-m-d');
$filter_type = isset($_POST['supplier_type']) ? $_POST['supplier_type'] : 'All';

$categories = [
  'Fish Supplier' => 'Payable for Supplier',
  'Material Supplier' => 'Materials',
  'Cold Store Factory' => 'Cold Store Charges Balance'
];

$active_categories = $categories;
if ($filter_type !== 'All' && array_key_exists($filter_type, $categories)) {
  $active_categories = [$filter_type => $categories[$filter_type]];
}
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>Supplier Statement Report</title>
  <?php $bootstrap->css(); ?>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
  <style>
    .report-table {
      border-collapse: collapse;
      width: 100%;
      color: #000;
    }

    /* Exact full-grid black borders */
    .report-table th,
    .report-table td {
      border: 1px solid #000 !important;
      padding: 6px 10px;
    }

    .report-table th {
      font-weight: bold;
      text-align: center;
      background: transparent;
    }

    .report-table .row-total td {
      font-weight: bold;
      background: transparent;
    }

    .sig-line {
      border-bottom: 1px solid #000;
      width: 200px;
      display: inline-block;
      margin-left: 10px;
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
        <div class="card-header bg-dark text-light d-flex justify-content-between align-items-center">
          <h5 class="mb-0 fw-bold">Link Mark Supplier Statement</h5>

          <form action="export/payablereport.php" method="POST" target="_blank" class="m-0 p-0 d-flex">
            <input type='hidden' name='date_from' value='<?= htmlspecialchars($from) ?>'>
            <input type='hidden' name='date_to' value='<?= htmlspecialchars($to) ?>'>
            <input type='hidden' name='supplier_type' value='<?= htmlspecialchars($filter_type) ?>'>

            <button type="submit" name="export_type" value="excel" class="btn btn-success btn-sm fw-bold shadow-sm">
              <i class="bi bi-file-earmark-excel"></i> Export Excel
            </button>
            <button type="submit" name="export_type" value="pdf" class="btn btn-danger btn-sm fw-bold ms-2 shadow-sm">
              <i class="bi bi-printer"></i> Print / Save PDF
            </button>
          </form>
        </div>

        <div class="card-body">
          <form action="" method="post" class="p-3 mb-4 bg-light border rounded d-flex align-items-end">
            <div class="me-3">
              <label class="fw-bold small">Start Date</label>
              <input type="date" name="date_from" class="form-control form-control-sm border-dark" value="<?= $from; ?>" required>
            </div>
            <div class="me-3">
              <label class="fw-bold small">End Date</label>
              <input type="date" name="date_to" class="form-control form-control-sm border-dark" value="<?= $to; ?>" required>
            </div>
            <div class="me-3">
              <label class="fw-bold small">Supplier Type</label>
              <select name="supplier_type" class="form-select form-select-sm border-dark">
                <option value="All" <?= $filter_type == 'All' ? 'selected' : '' ?>>All Types</option>
                <option value="Fish Supplier" <?= $filter_type == 'Fish Supplier' ? 'selected' : '' ?>>Fish Supplier</option>
                <option value="Material Supplier" <?= $filter_type == 'Material Supplier' ? 'selected' : '' ?>>Material Supplier</option>
                <option value="Cold Store Factory" <?= $filter_type == 'Cold Store Factory' ? 'selected' : '' ?>>Cold Store Factory</option>
              </select>
            </div>
            <div>
              <button type="submit" name="date_search" class="btn btn-primary btn-sm fw-bold px-4">Load Statement</button>
            </div>
          </form>

          <div class="d-flex justify-content-between mb-3 px-2 text-dark">
            <h5 class="fw-bold text-decoration-underline mb-0">Link Mark Supplier Statement</h5>
            <h5 class="fw-bold mb-0">Date: <?= date('d.m.y', strtotime($to)); ?></h5>
          </div>

          <?php foreach ($active_categories as $db_type => $display_title):
            // Set column header based on type to match physical paper exactly
            $name_header = 'Supplier Name';
            if ($db_type == 'Material Supplier') $name_header = 'Name';
            if ($db_type == 'Cold Store Factory') $name_header = 'Factory';
          ?>
            <h6 class="fw-bold text-decoration-underline mt-4 mb-2 text-dark"><?= $display_title; ?></h6>
            <table class="table report-table mb-5">
              <tr>
                <th width="5%">No</th>
                <th width="30%" class="text-start"><?= $name_header; ?></th>
                <th width="15%" class="text-center">Opening Balance</th>
                <th width="15%" class="text-center">Add Amt</th>
                <th width="15%" class="text-center">Paid Amt</th>
                <th width="20%" class="text-center">Balance</th>
              </tr>
              <?php
              $stmt = $pdo->prepare("SELECT id, name FROM contacts WHERE contact_type = ? ORDER BY name ASC");
              $stmt->execute([$db_type]);
              $contacts = $stmt->fetchAll(PDO::FETCH_ASSOC);

              $id_count = 1;
              $cat_opening = $cat_add = $cat_paid = $cat_balance = 0;

              foreach ($contacts as $contact) {
                $supplier_id = $contact['id'];

                // FIXED: Updated from AUTHORISED to AWAITING_PAYMENT
                $opPurStmt = $pdo->prepare("SELECT COALESCE(SUM(grand_total), 0) FROM purchases WHERE contact_id = ? AND date < ? AND status IN ('AWAITING_PAYMENT', 'PAID')");
                $opPurStmt->execute([$supplier_id, $from]);
                $opening_purchases = floatval($opPurStmt->fetchColumn());

                $opPayStmt = $pdo->prepare("SELECT COALESCE(SUM(pp.amount), 0) FROM purchase_payments pp JOIN purchases p ON pp.purchase_id = p.id WHERE p.contact_id = ? AND pp.payment_date < ?");
                $opPayStmt->execute([$supplier_id, $from]);
                $opening_payments = floatval($opPayStmt->fetchColumn());

                $opening = $opening_purchases - $opening_payments;

                // FIXED: Updated from AUTHORISED to AWAITING_PAYMENT
                $addStmt = $pdo->prepare("SELECT COALESCE(SUM(grand_total), 0) FROM purchases WHERE contact_id = ? AND date BETWEEN ? AND ? AND status IN ('AWAITING_PAYMENT', 'PAID')");
                $addStmt->execute([$supplier_id, $from, $to]);
                $add = floatval($addStmt->fetchColumn());

                $paidStmt = $pdo->prepare("SELECT COALESCE(SUM(pp.amount), 0) FROM purchase_payments pp JOIN purchases p ON pp.purchase_id = p.id WHERE p.contact_id = ? AND pp.payment_date BETWEEN ? AND ?");
                $paidStmt->execute([$supplier_id, $from, $to]);
                $paid = floatval($paidStmt->fetchColumn());

                $balance = ($opening + $add) - $paid;

                if ($opening == 0 && $add == 0 && $paid == 0 && $balance == 0) continue;

                $cat_opening += $opening;
                $cat_add += $add;
                $cat_paid += $paid;
                $cat_balance += $balance;
              ?>
                <tr>
                  <td class="text-center"><?= $id_count++; ?></td>
                  <td><?= htmlspecialchars($contact['name']); ?></td>
                  <td class="text-end"><?= $opening != 0 ? number_format($opening) : ''; ?></td>
                  <td class="text-end"><?= $add != 0 ? number_format($add) : ''; ?></td>
                  <td class="text-end"><?= $paid != 0 ? number_format($paid) : ''; ?></td>
                  <td class="text-end"><?= $balance != 0 ? number_format($balance) : '-'; ?></td>
                </tr>
              <?php } ?>

              <tr class="row-total">
                <td colspan="2" class="text-center">Total Amount</td>
                <td class="text-end"><?= $cat_opening != 0 ? number_format($cat_opening) : ''; ?></td>
                <td class="text-end"><?= $cat_add != 0 ? number_format($cat_add) : ''; ?></td>
                <td class="text-end"><?= $cat_paid != 0 ? number_format($cat_paid) : ''; ?></td>
                <td class="text-end"><?= $cat_balance != 0 ? number_format($cat_balance) : '-'; ?></td>
              </tr>
            </table>
          <?php endforeach; ?>

          <div class="row mt-5 pt-5 pb-4 text-dark">
            <div class="col-6 text-center">
              <span class="fw-bold">Prepared</span>
              <div class="sig-line"></div>
            </div>
            <div class="col-6 text-center">
              <span class="fw-bold">Checked By</span>
              <div class="sig-line"></div>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>

  <?php $bootstrap->javascript(); ?>
</body>

</html>