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

$tabs = ['All', 'Draft', 'Awaiting Approval', 'Awaiting Payment', 'Paid'];
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>Purchases Overview</title>
  <?php $bootstrap->css(); ?>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
  <style>
    .nav-tabs .nav-link {
      color: #555;
      font-weight: bold;
      border: none;
      border-bottom: 3px solid transparent;
      padding: 10px 15px;
    }

    .nav-tabs .nav-link.active {
      color: #17a2b8;
      border-bottom: 3px solid #17a2b8;
      background: transparent;
    }

    .nav-tabs .nav-link:hover {
      border-bottom: 3px solid #ddd;
    }

    .status-badge {
      font-size: 11px;
      padding: 4px 8px;
      border-radius: 4px;
      font-weight: bold;
    }

    .bg-draft {
      background-color: #e9ecef;
      color: #495057;
      border: 1px solid #ced4da;
    }

    .bg-awaiting-payment {
      background-color: #fff3cd;
      color: #856404;
      border: 1px solid #ffeeba;
    }

    .bg-awaiting-approval {
      background-color: #d4edda;
      color: #155724;
      border: 1px solid #c3e6cb;
    }

    .bg-paid {
      background-color: #d1ecf1;
      color: #0c5460;
      border: 1px solid #bee5eb;
    }

    .clickable-row {
      cursor: pointer;
    }

    .clickable-row:hover {
      background-color: #f8f9fa !important;
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
        <div class="card-body">
          <div class="d-flex justify-content-between align-items-center mb-3">
            <h4 class="mb-0 text-dark fw-bold">Purchases</h4>
            <a href="newpurchase.php" class="btn btn-success fw-bold">New Purchase</a>
          </div>

          <!-- Tabs -->
          <ul class="nav nav-tabs mb-3 border-bottom-0">
            <?php foreach ($tabs as $t): ?>
              <li class="nav-item">
                <a class="nav-link <?php echo $tab === $t ? 'active' : ''; ?>" href="?tab=<?php echo urlencode($t); ?>"><?php echo $t; ?></a>
              </li>
            <?php endforeach; ?>
          </ul>

          <!-- Filters -->
          <form method="GET" class="row gx-2 mb-3 align-items-center">
            <input type="hidden" name="tab" value="<?php echo htmlspecialchars($tab); ?>">
            <div class="col-md-4">
              <input type="text" name="search" class="form-control" placeholder="Search contact or reference..." value="<?php echo htmlspecialchars($search); ?>">
            </div>
            <div class="col-md-2">
              <button type="submit" class="btn btn-primary fw-bold w-100">Filter</button>
            </div>
          </form>

          <!-- Data Table -->
          <table class="table table-striped align-middle border">
            <thead class="table-light">
              <tr>
                <th>Suppliers Name</th>
                <th>Status</th>
                <th>Reference</th>
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
  <?php $bootstrap->javascript(); ?>
</body>

</html>