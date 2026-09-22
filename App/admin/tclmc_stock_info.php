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
</head>
<?php
$bootstrap->css();
?>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Caprasimo&family=Cormorant+Garamond:wght@300&family=Teko:wght@700&display=swap" rel="stylesheet">

<body>
  <?php
  $id = $_GET['id'];

  if (isset($_POST['transferbtn'])) {
    $transfer_to = $_POST['transfer_to'];
    $transfer_mc = $_POST['transfer_mc'];
    echo $query->transfermcstocktcl($transfer_to, $transfer_mc, $id);
  }

  if (isset($_POST['exportbtn'])) {
    $loading_no = $_POST['loading_no'];
    $loading_mc = $_POST['loading_mc'];
    echo $query->loadmcstocktcl($loading_no, $loading_mc, $id);
  }
  ?>
  <div class="row">
    <div class="sidebarcol" id="sidebar">
      <?php include 'sidebar.php'; ?>
    </div>
    <div class="contentcol" id="content">
      <?php require 'navbar.php'; ?>
      <div class="card">
        <div class="card-header bg-info">
          <h5 style="font-weight:bold;" class="text-light d-inline">TCL MC STOCK INFO</h5>
          <button type="button" class="btn btn-danger btn-sm float-end ms-2" data-bs-toggle="modal" data-bs-target="#transfer">Transfer Mc</button>
          <button type="button" class="btn btn-warning btn-sm float-end ms-2" data-bs-toggle="modal" data-bs-target="#export">Export Mc</button>
          <a href="tclmcstock.php" type="button" class="btn btn-secondary btn-sm float-end ms-2">Back</a>
        </div>
        <div class="card-body">
          <?php
          $infostmt = $pdo->prepare("SELECT * FROM tclmcstock WHERE id = ?");
          $infostmt->execute([$id]);
          $infodata = $infostmt->fetch(PDO::FETCH_ASSOC);

          $item_id = $infodata['item_id'];
          $productstmt = $pdo->prepare("SELECT id, name AS item_name FROM products WHERE id = ? LIMIT 1");
          $productstmt->execute([$item_id]);
          $commonditydata = $productstmt->fetch(PDO::FETCH_ASSOC);
          ?>

          <h5 class="mb-3 text-primary" style="font-weight:bold;">Master Carton Details</h5>
          <table class="table table-hover table-bordered table-striped">
            <thead class="table-light">
              <tr>
                <th>Date</th>
                <th>Fish Name</th>
                <th>Size</th>
                <th>Pcs</th>
                <th>Kg</th>
                <th>Opening Mc</th>
                <th>Form 10 Mc</th>
                <th class="bg-warning text-dark text-center">Current Balance (Mc)</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><?= date('d-m-Y', strtotime($infodata['date'])); ?></td>
                <td><?= htmlspecialchars($commonditydata['item_name'] ?? 'Unknown'); ?></td>
                <td><?= htmlspecialchars($infodata['size'] ?? ''); ?></td>
                <td><?= htmlspecialchars($infodata['pcs'] ?? ''); ?></td>
                <td><?= htmlspecialchars($infodata['kg'] ?? ''); ?></td>
                <td><?= htmlspecialchars($infodata['opening_mc'] ?? ''); ?></td>
                <td><?= htmlspecialchars($infodata['form10mc'] ?? ''); ?></td>
                <td class="fw-bold fs-5 text-danger text-center"><?= htmlspecialchars($infodata['grandtotal_mc'] ?? '0'); ?></td>
              </tr>
            </tbody>
          </table>

          <h5 class="mt-4 mb-3 text-secondary" style="font-weight:bold;">Transaction Ledger (Transfers & Exports)</h5>
          <table class="table table-hover table-bordered table-striped">
            <thead class="table-dark">
              <tr>
                <th>No.</th>
                <th>Date</th>
                <th>Transaction Type</th>
                <th>Destination / Loading No</th>
                <th>Quantity (Mc)</th>
              </tr>
            </thead>
            <tbody>
              <?php
              $transStmt = $pdo->prepare("SELECT * FROM tclmc_transactions WHERE tclmc_id = ? ORDER BY id ASC");
              $transStmt->execute([$id]);
              $transactions = $transStmt->fetchAll(PDO::FETCH_ASSOC);

              if (empty($transactions)) {
                echo '<tr><td colspan="5" class="text-center text-muted">No transactions recorded yet.</td></tr>';
              } else {
                $count = 1;
                $totalQuantity = 0;

                foreach ($transactions as $trx) {
                  $totalQuantity += (float)$trx['quantity'];

                  $typeBadge = $trx['type'] === 'transfer' ? '<span class="badge bg-info text-dark">Transfer</span>' : '<span class="badge bg-success">Export</span>';
                  echo '<tr>';
                  echo '<td>' . $count++ . '</td>';
                  echo '<td>' . date('d-m-Y', strtotime($trx['transaction_date'])) . '</td>';
                  echo '<td>' . $typeBadge . '</td>';
                  echo '<td>' . htmlspecialchars($trx['destination']) . '</td>';
                  echo '<td class="fw-bold text-danger">-' . htmlspecialchars($trx['quantity']) . '</td>';
                  echo '</tr>';
                }

                echo '<tr class="table-light">';
                echo '<td colspan="4" class="text-end fw-bold">Total Reduced:</td>';
                echo '<td class="fw-bold text-danger">-' . htmlspecialchars($totalQuantity) . '</td>';
                echo '</tr>';
              }
              ?>
            </tbody>
          </table>

        </div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="export">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header bg-secondary text-light">
          <h1 class="modal-title fs-5">Export Mc</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form action="" method="post">
          <div class="modal-body">
            <label>Loading No</label>
            <input type="text" name="loading_no" class="form-control inpv2 mb-3 mt-1" required>
            <label>Loading Mc</label>
            <input type="number" name="loading_mc" class="form-control inpv2 mb-3 mt-1" max="<?= htmlspecialchars($infodata['grandtotal_mc']); ?>" required>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-success" name="exportbtn">Export</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <div class="modal fade" id="transfer">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header bg-secondary text-light">
          <h1 class="modal-title fs-5">Transfer Mc</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form action="" method="post">
          <div class="modal-body">
            <label>Transfer To</label>
            <input type="text" name="transfer_to" class="form-control inpv2 mb-3 mt-1" value="HHK" required>
            <label>Transfer Mc</label>
            <input type="number" name="transfer_mc" class="form-control inpv2 mb-3 mt-1" max="<?= htmlspecialchars($infodata['grandtotal_mc']); ?>" required>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-success" name="transferbtn">Transfer</button>
          </div>
        </form>
      </div>
    </div>
  </div>
  <?php
  $bootstrap->javascript();
  ?>
</body>

</html>