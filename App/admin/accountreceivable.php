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
  <title>Account Receivable</title>
  <?php $bootstrap->css(); ?>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Caprasimo&family=Cormorant+Garamond:wght@300&family=Teko:wght@700&display=swap" rel="stylesheet">
</head>

<body>
  <div class="row">
    <div class="sidebarcol" id="sidebar">
      <?php include 'sidebar.php'; ?>
    </div>
    <div class="contentcol" id="content">
      <?php require 'navbar.php'; ?>
      <div class="card mt-3 ms-2 me-2 shadow-sm border-0">
        <div class="card-header bg-info text-light">
          <h3 class="d-inline">Receivable for Customers</h3>
        </div>
        <div class="card-body">
          <table class="table table-bordered table-hover table-striped rounded">
            <thead class="table-light">
              <tr>
                <th>No</th>
                <th>Customer Name</th>
                <th>Total Billed</th>
                <th>Total Paid</th>
                <th>Balance Owed</th>
                <th class="text-center">Detail</th>
              </tr>
            </thead>
            <tbody>
              <?php
              global $pdo;

              // Aggregating customer invoice balances straight from the new sales MVF table
              $stmt = $pdo->prepare("
                  SELECT 
                      c.id AS customer_id,
                      c.name AS customer_name,
                      COALESCE(SUM(s.grand_total), 0) AS total_billed,
                      COALESCE(SUM(s.paid_amount), 0) AS total_paid,
                      COALESCE(SUM(s.grand_total - s.paid_amount), 0) AS balance_owed
                  FROM contacts c
                  INNER JOIN sales s ON c.id = s.contact_id
                  WHERE c.is_customer = 1 AND s.status != 'VOIDED'
                  GROUP BY c.id, c.name
                  HAVING total_billed > 0
                  ORDER BY balance_owed DESC, c.name ASC
              ");
              $stmt->execute();
              $customers = $stmt->fetchAll(PDO::FETCH_ASSOC);

              $id = 1;
              $grand_billed = 0;
              $grand_paid = 0;
              $grand_owed = 0;

              foreach ($customers as $cust) :
                $grand_billed += $cust['total_billed'];
                $grand_paid += $cust['total_paid'];
                $grand_owed += $cust['balance_owed'];
              ?>
                <tr>
                  <td><?= $id++; ?></td>
                  <td class="fw-bold"><?= htmlspecialchars($cust['customer_name']); ?></td>
                  <td class="text-secondary"><?= number_format($cust['total_billed'], 2); ?></td>
                  <td class="text-success"><?= number_format($cust['total_paid'], 2); ?></td>
                  <td class="fw-bold text-danger"><?= number_format($cust['balance_owed'], 2); ?></td>
                  <td class="text-center">
                    <a href="acreceivabledetail.php?customer_id=<?= $cust['customer_id']; ?>" class="btn btn-primary btn-sm">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list-check" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3.854 2.146a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 3.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 7.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0z" />
                      </svg>
                    </a>
                  </td>
                </tr>
              <?php endforeach; ?>
              <tr class="table-light border-top border-dark" style="font-weight: bold;">
                <td colspan="2" class="text-end">TOTALS:</td>
                <td><?= number_format($grand_billed, 2); ?></td>
                <td class="text-success"><?= number_format($grand_paid, 2); ?></td>
                <td class="text-danger"><?= number_format($grand_owed, 2); ?></td>
                <td></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
  <?php $bootstrap->javascript(); ?>
</body>

</html>