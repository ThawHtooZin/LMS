<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();

if (isset($_GET['delete'])) {
  $query->deleteSale(intval($_GET['delete']));
}

$status_filter = isset($_GET['status']) ? $_GET['status'] : 'all';
$search        = isset($_GET['search']) ? $_GET['search'] : '';

$where = ["1=1"];
$params = [];

if ($status_filter !== 'all') {
  $where[] = "s.status = ?";
  $params[] = strtoupper($status_filter);
}

if (!empty($search)) {
  $where[] = "(s.voucher_no LIKE ? OR c.name LIKE ?)";
  $params[] = "%$search%";
  $params[] = "%$search%";
}

$whereSql = implode(" AND ", $where);
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>Sales Overview</title>
  <?php echo $bootstrap->css(); ?>
  <style>
    .xero-title {
      font-size: 24px;
      font-weight: normal;
      color: #202e3c;
      margin-bottom: 20px;
    }

    .nav-tabs .nav-link {
      color: #008aab;
      padding: 10px 20px;
      border: none;
      border-bottom: 3px solid transparent;
    }

    .nav-tabs .nav-link.active {
      color: #202e3c;
      border-bottom: 3px solid #008aab;
      font-weight: bold;
      background: none;
    }

    .nav-tabs .nav-link:hover {
      border-bottom: 3px solid #ccc;
    }
  </style>
</head>

<body>
  <?php echo $bootstrap->javascriptindex(); ?>
  <div class="row">
    <div class="sidebarcol" id="sidebar"><?php include 'sidebar.php'; ?></div>
    <div class="contentcol" id="content">
      <?php require 'navbar.php'; ?>
      <div class="bg-white p-4 shadow-sm rounded mt-3 ms-2 me-2">
        <div class="d-flex justify-content-between align-items-center mb-2">
          <div class="xero-title mb-0">Sales Invoices</div>
          <a href="newsales.php" class="btn btn-primary fw-bold">New Sale</a>
        </div>

        <div class="d-flex justify-content-between align-items-end mb-3 border-bottom">
          <ul class="nav nav-tabs border-bottom-0">
            <li class="nav-item"><a class="nav-link <?= $status_filter == 'all' ? 'active' : ''; ?>" href="?status=all&search=<?= urlencode($search); ?>">All</a></li>
            <li class="nav-item"><a class="nav-link <?= $status_filter == 'draft' ? 'active' : ''; ?>" href="?status=draft&search=<?= urlencode($search); ?>">Draft</a></li>
            <li class="nav-item"><a class="nav-link <?= $status_filter == 'awaiting_payment' ? 'active' : ''; ?>" href="?status=awaiting_payment&search=<?= urlencode($search); ?>">Awaiting Payment</a></li>
            <li class="nav-item"><a class="nav-link <?= $status_filter == 'paid' ? 'active' : ''; ?>" href="?status=paid&search=<?= urlencode($search); ?>">Paid</a></li>
          </ul>

          <form method="GET" class="d-flex pb-2">
            <input type="hidden" name="status" value="<?= htmlspecialchars($status_filter); ?>">
            <input type="text" name="search" class="form-control form-control-sm me-2" placeholder="Search..." value="<?= htmlspecialchars($search); ?>" style="width: 250px;">
            <button type="submit" class="btn btn-secondary btn-sm fw-bold">Search</button>
          </form>
        </div>

        <table class="table table-bordered table-hover">
          <thead class="table-dark">
            <tr>
              <th>Invoice #</th>
              <th>Customer</th>
              <th>Containers</th>
              <th>Date</th>
              <th>Due Date</th>
              <th>Total Amount</th>
              <th>Paid Amount</th>
              <th>Balance Due</th>
              <th>Status</th>
              <th>Action</th>
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
                <td colspan="10" class="text-center text-muted py-4">No invoices found.</td>
              </tr>
              <?php else:
              foreach ($sales as $sale):
                $due = $sale['grand_total'] - $sale['paid_amount'];
                $badge = 'bg-secondary';
                if ($sale['status'] == 'AWAITING_PAYMENT') {
                  $badge = 'bg-warning text-dark';
                }
                if ($sale['status'] == 'PAID') {
                  $badge = 'bg-success';
                }
              ?>
                <tr class="clickable-row" data-href="editsales.php?id=<?= $sale['id']; ?>" style="cursor: pointer;">
                  <td class="fw-bold text-primary"><?= htmlspecialchars($sale['voucher_no']); ?></td>
                  <td><?= htmlspecialchars($sale['customer_name']); ?></td>
                  <td><?= htmlspecialchars($sale['containers'] ?? '-'); ?></td>
                  <td><?= date('d M Y', strtotime($sale['date'])); ?></td>
                  <td><?= !empty($sale['due_date']) ? date('d M Y', strtotime($sale['due_date'])) : '-'; ?></td>
                  <td class="fw-bold text-success"><?= number_format($sale['grand_total'], 2); ?> <?= htmlspecialchars($sale['currency']); ?></td>
                  <td><?= number_format($sale['paid_amount'], 2); ?></td>
                  <td class="fw-bold text-dark"><?= number_format($due, 2); ?></td>
                  <td><span class="badge <?= $badge; ?>"><?= htmlspecialchars($sale['status']); ?></span></td>
                  <td>
                    <?php if ($sale['status'] === 'DRAFT'): ?>
                      <a href="sales.php?delete=<?= $sale['id']; ?>" class="btn btn-sm btn-outline-danger border-0 action-btn" onclick="return confirm('Delete this draft?');"><i class="bi bi-trash"></i></a>
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
  <script>
    $(document).ready(function() {
      $(".clickable-row").click(function(e) {
        // Prevent row click if the user clicks the Delete button
        if (!$(e.target).closest('a, button').length) {
          window.location = $(this).data("href");
        }
      });
    });
  </script>
  <?php echo $bootstrap->javascript(); ?>
</body>

</html>