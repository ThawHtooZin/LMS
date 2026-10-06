<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();

// Filters & Tabs Logic
$tab = isset($_GET['tab']) ? $_GET['tab'] : 'All';
$search = isset($_GET['search']) ? trim($_GET['search']) : '';

$where_clause = "1=1";
if ($tab !== 'All') {
  $db_tab_val = strtoupper(str_replace(' ', '_', $tab));
  if ($db_tab_val === 'AWAITING_APPROVAL') {
    $where_clause .= " AND p.status = 'AWAITING_APPROVAL'";
  } elseif ($db_tab_val === 'AWAITING_PAYMENT') {
    $where_clause .= " AND p.status = 'AWAITING_PAYMENT'";
  } else {
    $where_clause .= " AND p.status = " . $pdo->quote($db_tab_val);
  }
}
if (!empty($search)) {
  $where_clause .= " AND (c.name LIKE '%$search%' OR p.voucher_no LIKE '%$search%')";
}

$stmt = $pdo->prepare("
    SELECT p.*, c.name as supplier_name 
    FROM purchases p 
    LEFT JOIN contacts c ON p.contact_id = c.id 
    WHERE $where_clause 
    ORDER BY p.date DESC, p.id DESC
");
$stmt->execute();
$bills = $stmt->fetchAll(PDO::FETCH_ASSOC);

$tabs = ['All', 'Draft', 'Awaiting Approval', 'Awaiting Payment', 'Paid', 'Voided'];
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>Purchases Overview</title>
  <?php $bootstrap->css(); ?>
  <link rel="stylesheet" href="../../Resources/dist/css/account-purchase-sales.css">
</head>

<body>
  <div class="row">
    <div class="sidebarcol" id="sidebar">
      <?php include 'sidebar.php'; ?>
    </div>
    <div class="contentcol" id="content">
      <?php require 'navbar.php'; ?>

      <div class="account-page-wrap">
        <div class="account-panel">
        <div class="account-panel-body">
          <div class="account-toolbar">
            <h1 class="account-page-title">Purchases</h1>
            <a href="newpurchase.php" class="btn btn-success fw-bold">New Purchase</a>
          </div>

          <div class="account-toolbar-tabs">
            <ul class="nav nav-tabs account-tabs border-bottom-0">
              <?php foreach ($tabs as $t): ?>
                <li class="nav-item">
                  <a class="nav-link <?php echo $tab === $t ? 'active' : ''; ?>" href="?tab=<?php echo urlencode($t); ?>&search=<?php echo urlencode($search); ?>"><?php echo $t; ?></a>
                </li>
              <?php endforeach; ?>
            </ul>

            <form method="GET" class="account-search-form">
              <input type="hidden" name="tab" value="<?php echo htmlspecialchars($tab); ?>">
              <input type="text" name="search" class="form-control form-control-sm me-2" placeholder="Search supplier or voucher..." value="<?php echo htmlspecialchars($search); ?>">
              <button type="submit" class="btn btn-secondary btn-sm fw-bold">Search</button>
            </form>
          </div>

          <table class="table table-striped align-middle border account-table">
            <thead>
              <tr>
                <th>Suppliers Name</th>
                <th>Status</th>
                <th>SR #</th>
                <th>Date</th>
                <th>Due Date</th>
                <th class="text-end">Paid</th>
                <th class="text-end">Amount</th>
              </tr>
            </thead>
            <tbody>
              <?php if (count($bills) == 0): ?>
                <tr>
                  <td colspan="7" class="text-center text-muted py-4">No bills found for this view.</td>
                </tr>
              <?php else: ?>
                <?php foreach ($bills as $b):
                  $status_class = 'bg-awaiting-payment';
                  if ($b['status'] == 'DRAFT') $status_class = 'bg-draft';
                  if ($b['status'] == 'AWAITING_APPROVAL') $status_class = 'bg-awaiting-approval';
                  if ($b['status'] == 'PAID') $status_class = 'bg-paid';
                  if ($b['status'] == 'AWAITING_PAYMENT') $status_class = 'bg-awaiting-payment';
                  if ($b['status'] == 'VOIDED') $status_class = 'bg-voided';

                  $due = floatval($b['grand_total']) - floatval($b['paid_amount']);
                  $paid = floatval($b['paid_amount']);
                ?>
                  <tr class="clickable-row" onclick="window.location='editpurchase.php?id=<?php echo $b['id']; ?>'">
                    <td class="fw-bold text-primary"><?php echo htmlspecialchars($b['supplier_name']); ?></td>
                    <td><span class="status-badge <?php echo $status_class; ?>"><?php echo ucfirst(strtolower(str_replace('_', ' ', $b['status']))); ?></span></td>
                    <td><?php echo htmlspecialchars($b['voucher_no']); ?></td>
                    <td><?php echo date('M d, Y', strtotime($b['date'])); ?></td>
                    <td><?php echo !empty($b['due_date']) ? date('M d, Y', strtotime($b['due_date'])) : '-'; ?></td>
                    <td class="text-end text-muted"><?php echo number_format($paid, 2); ?></td>
                    <td class="text-end fw-bold"><?php echo number_format($due, 2); ?></td>
                  </tr>
                <?php endforeach; ?>
              <?php endif; ?>
            </tbody>
          </table>

        </div>
        </div>
      </div>
    </div>
  </div>
  <?php $bootstrap->javascript(); ?>
</body>

</html>