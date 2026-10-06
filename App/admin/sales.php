<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();

$deleteResult = null;
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['delete_sale_id'])) {
  $deleteResult = $query->deleteSale(intval($_POST['delete_sale_id']));
}

$allowed_statuses = ['all', 'draft', 'awaiting_approval', 'awaiting_payment', 'paid', 'voided'];
$status_filter = isset($_GET['status']) && in_array($_GET['status'], $allowed_statuses, true) ? $_GET['status'] : 'all';
$search        = isset($_GET['search']) ? trim($_GET['search']) : '';

$where = ["1=1"];
$params = [];

if ($status_filter !== 'all') {
  $where[] = "s.status = ?";
  $params[] = strtoupper($status_filter);
}

if (!empty($search)) {
  $where[] = "(s.sr_no LIKE ? OR c.name LIKE ?)";
  $params[] = "%$search%";
  $params[] = "%$search%";
}

$whereSql = implode(" AND ", $where);

function sale_status_badge_class($status)
{
  $map = [
    'DRAFT' => 'bg-draft',
    'AWAITING_APPROVAL' => 'bg-awaiting-approval',
    'AWAITING_PAYMENT' => 'bg-awaiting-payment',
    'PAID' => 'bg-paid',
    'VOIDED' => 'bg-voided',
  ];
  return $map[$status] ?? 'bg-awaiting-payment';
}
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>Sales Overview</title>
  <?php echo $bootstrap->css(); ?>
  <link rel="stylesheet" href="../../Resources/dist/css/account-purchase-sales.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
</head>

<body>
  <div class="row">
    <div class="sidebarcol" id="sidebar"><?php include 'sidebar.php'; ?></div>
    <div class="contentcol" id="content">
      <?php require 'navbar.php'; ?>

      <div class="account-page-wrap">
        <div class="account-panel">
          <div class="account-panel-body">
            <div class="account-toolbar">
              <h1 class="account-page-title">Sales</h1>
              <a href="newsales.php" class="btn btn-success fw-bold">New Sale</a>
            </div>

            <div class="account-toolbar-tabs">
              <ul class="nav nav-tabs account-tabs border-bottom-0">
                <li class="nav-item"><a class="nav-link <?= $status_filter == 'all' ? 'active' : ''; ?>" href="?status=all&search=<?= urlencode($search); ?>">All</a></li>
                <li class="nav-item"><a class="nav-link <?= $status_filter == 'draft' ? 'active' : ''; ?>" href="?status=draft&search=<?= urlencode($search); ?>">Draft</a></li>
                <li class="nav-item"><a class="nav-link <?= $status_filter == 'awaiting_approval' ? 'active' : ''; ?>" href="?status=awaiting_approval&search=<?= urlencode($search); ?>">Awaiting Approval</a></li>
                <li class="nav-item"><a class="nav-link <?= $status_filter == 'awaiting_payment' ? 'active' : ''; ?>" href="?status=awaiting_payment&search=<?= urlencode($search); ?>">Awaiting Payment</a></li>
                <li class="nav-item"><a class="nav-link <?= $status_filter == 'paid' ? 'active' : ''; ?>" href="?status=paid&search=<?= urlencode($search); ?>">Paid</a></li>
                <li class="nav-item"><a class="nav-link <?= $status_filter == 'voided' ? 'active' : ''; ?>" href="?status=voided&search=<?= urlencode($search); ?>">Voided</a></li>
              </ul>

              <form method="GET" class="account-search-form">
                <input type="hidden" name="status" value="<?= htmlspecialchars($status_filter); ?>">
                <input type="text" name="search" class="form-control form-control-sm me-2" placeholder="Search SR # or customer..." value="<?= htmlspecialchars($search); ?>">
                <button type="submit" class="btn btn-secondary btn-sm fw-bold">Search</button>
              </form>
            </div>

            <table class="table table-striped align-middle border account-table">
              <thead>
                <tr>
                  <th>SR #</th>
                  <th>Customer</th>
                  <th>Containers</th>
                  <th>Date</th>
                  <th>Due Date</th>
                  <th class="text-end">Total Amount</th>
                  <th class="text-end">Paid Amount</th>
                  <th class="text-end">Balance Due</th>
                  <th>Status</th>
                  <th class="text-center" style="width: 56px;">Action</th>
                </tr>
              </thead>
              <tbody>
                <?php
                global $pdo;
                $sql = "
                    SELECT s.*, c.name AS customer_name,
                    (SELECT GROUP_CONCAT(DISTINCT container_no SEPARATOR ', ') FROM sale_lines WHERE sale_id = s.id AND container_no != '') AS containers
                    FROM sales s
                    INNER JOIN contacts c ON s.contact_id = c.id
                    WHERE $whereSql
                    ORDER BY s.date DESC, s.id DESC
                ";
                $stmt = $pdo->prepare($sql);
                $stmt->execute($params);
                $sales = $stmt->fetchAll(PDO::FETCH_ASSOC);

                if (count($sales) === 0): ?>
                  <tr>
                    <td colspan="10" class="text-center text-muted py-4">No sales found for this view.</td>
                  </tr>
                  <?php else:
                  foreach ($sales as $sale):
                    $due = $sale['grand_total'] - $sale['paid_amount'];
                    $status_class = sale_status_badge_class($sale['status']);
                  ?>
                    <tr class="clickable-row" data-href="editsales.php?id=<?= (int)$sale['id']; ?>">
                      <td class="fw-bold text-primary"><?= htmlspecialchars($sale['sr_no']); ?></td>
                      <td><?= htmlspecialchars($sale['customer_name']); ?></td>
                      <td class="text-muted small"><?= htmlspecialchars($sale['containers'] ?? '-'); ?></td>
                      <td><?= date('M d, Y', strtotime($sale['date'])); ?></td>
                      <td><?= !empty($sale['due_date']) ? date('M d, Y', strtotime($sale['due_date'])) : '-'; ?></td>
                      <td class="text-end fw-bold"><?= number_format($sale['grand_total'], 2); ?> <?= htmlspecialchars($sale['currency']); ?></td>
                      <td class="text-end text-muted"><?= number_format($sale['paid_amount'], 2); ?></td>
                      <td class="text-end fw-bold"><?= number_format($due, 2); ?></td>
                      <td><span class="status-badge <?= $status_class; ?>"><?= ucfirst(strtolower(str_replace('_', ' ', $sale['status']))); ?></span></td>
                      <td class="text-center">
                        <?php if ($sale['status'] === 'DRAFT'): ?>
                          <form method="post" class="d-inline action-btn" onsubmit="return confirm('Delete this draft?');">
                            <input type="hidden" name="delete_sale_id" value="<?= (int)$sale['id']; ?>">
                            <button type="submit" class="btn btn-sm btn-outline-danger border-0" title="Delete draft"><i class="bi bi-trash"></i></button>
                          </form>
                        <?php endif; ?>
                      </td>
                    </tr>
                <?php endforeach;
                endif; ?>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script>
    document.addEventListener('DOMContentLoaded', function() {
      document.querySelectorAll('.clickable-row').forEach(function(row) {
        row.addEventListener('click', function(e) {
          if (!e.target.closest('a, button, form')) {
            window.location = row.getAttribute('data-href');
          }
        });
      });
    });
  </script>
  <?php echo $bootstrap->javascript(); ?>
  <?php if ($deleteResult !== null): ?>
    <script>
      swal(
        <?= json_encode($deleteResult['title'] ?? ($deleteResult['status'] ? 'Deleted' : 'Delete failed')); ?>,
        <?= json_encode($deleteResult['message'] ?? 'The deletion request did not return a result.'); ?>,
        <?= json_encode($deleteResult['status'] ? 'success' : 'error'); ?>
      ).then(function() {
        <?php if (!empty($deleteResult['status'])): ?>
          window.location.href = 'sales.php';
        <?php endif; ?>
      });
    </script>
  <?php endif; ?>
</body>

</html>
