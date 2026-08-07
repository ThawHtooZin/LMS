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
  <title>Admin | Dashboard</title>
  <?php
  $bootstrap->css();
  ?>
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
      <div class="card">
        <div class="card-header bg-info text-light">
          <h3 class="d-inline">Payable for Supplier</h3>
        </div>
        <div class="card-body">
          <table class="mt-3 table table-bordered table-striped rounded">
            <tr>
              <th>No</th>
              <th>Supplier Name</th>
              <th>Total Billed</th>
              <th>Total Paid</th>
              <th>Balance Owed</th>
              <th>Detail</th>
            </tr>
            <?php
            global $pdo;

            $stmt = $pdo->prepare("
                SELECT 
                    c.id AS supplier_id,
                    c.name AS supplier_name,
                    SUM(p.grand_total) AS total_billed,
                    SUM(p.paid_amount) AS total_paid,
                    SUM(p.grand_total - p.paid_amount) AS balance_owed
                FROM contacts c
                INNER JOIN purchases p ON c.id = p.contact_id
                WHERE c.is_supplier = 1 AND p.status IN ('AUTHORISED', 'PAID')
                GROUP BY c.id, c.name
                HAVING total_billed > 0
                ORDER BY balance_owed DESC, c.name ASC
            ");
            $stmt->execute();
            $suppliers = $stmt->fetchAll(PDO::FETCH_ASSOC);

            $id = 1;
            $grand_billed = 0;
            $grand_paid = 0;
            $grand_owed = 0;

            foreach ($suppliers as $sup) :
              $grand_billed += $sup['total_billed'];
              $grand_paid += $sup['total_paid'];
              $grand_owed += $sup['balance_owed'];
            ?>
              <tr>
                <td><?= $id++; ?></td>
                <td><?= htmlspecialchars($sup['supplier_name']); ?></td>
                <td><?= number_format($sup['total_billed']); ?></td>
                <td><?= number_format($sup['total_paid']); ?></td>
                <td><?= number_format($sup['balance_owed']); ?></td>
                <td>
                  <a href="acpayabledetail.php?supplier_id=<?= $sup['supplier_id']; ?>" class="btn btn-primary btn-sm">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list-check" viewBox="0 0 16 16">
                      <path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3.854 2.146a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 3.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 7.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0z" />
                    </svg>
                  </a>
                </td>
              </tr>
            <?php endforeach; ?>
            <tr style="font-weight: bold;">
              <td colspan="2">Total:</td>
              <td><?= number_format($grand_billed); ?></td>
              <td><?= number_format($grand_paid); ?></td>
              <td><?= number_format($grand_owed); ?></td>
              <td></td>
            </tr>
          </table>
        </div>
      </div>
    </div>
  </div>
  <?php
  $bootstrap->javascript();
  ?>
</body>

</html>