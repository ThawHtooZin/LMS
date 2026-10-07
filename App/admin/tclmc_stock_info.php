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

  <style>

    .tclmc-ledger-table th,

    .tclmc-ledger-table td {

      vertical-align: middle;

    }



    .tclmc-ledger-table .col-date {

      width: 105px;

      white-space: nowrap;

    }



    .tclmc-ledger-table .col-mc {

      width: 76px;

      white-space: nowrap;

    }



    .tclmc-ledger-table tr.row-out td {

      background-color: rgba(255, 0, 0, 0.08);

    }



    .tclmc-ledger-table tr.row-total td {

      font-weight: bold;

    }

  </style>

</head>



<body>

  <?php

  $id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

  $sizeFilter = isset($_GET['sizeinfo']) ? (string)$_GET['sizeinfo'] : '';

  $itemFilter = isset($_GET['item_id']) ? (string)$_GET['item_id'] : '';



  if ($id > 0) {

    $seedStmt = $pdo->prepare('SELECT * FROM tclmcstock WHERE id = ? LIMIT 1');

    $seedStmt->execute([$id]);

    $seedRow = $seedStmt->fetch(PDO::FETCH_ASSOC);

    if ($seedRow) {

      $sizeFilter = (string)$seedRow['size'];

      $itemFilter = (string)$seedRow['item_id'];

    }

  }



  if ($itemFilter === '' || $sizeFilter === '') {

    echo '<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>';
    echo '<script>swal("Warning", "Missing stock info.", "warning").then(function () { window.location.href = "tclmcstock.php"; });</script>';

    exit;

  }



  if (isset($_POST['transferbtn'])) {

    $actionId = (int)($_POST['tclmc_id'] ?? $id);

    $transfer_to = $_POST['transfer_to'];

    $transfer_mc = $_POST['transfer_mc'];

    echo $query->transfermcstocktcl($transfer_to, $transfer_mc, $actionId);

  }



  if (isset($_POST['exportbtn'])) {

    $actionId = (int)($_POST['tclmc_id'] ?? $id);

    $loading_no = $_POST['loading_no'];

    $loading_mc = $_POST['loading_mc'];

    echo $query->loadmcstocktcl($loading_no, $loading_mc, $actionId);

  }



  $groupStmt = $pdo->prepare('SELECT * FROM tclmcstock WHERE item_id = ? AND size = ? ORDER BY date ASC, id ASC');

  $groupStmt->execute([$itemFilter, $sizeFilter]);

  $stockRows = $groupStmt->fetchAll(PDO::FETCH_ASSOC);



  if (empty($stockRows)) {

    echo '<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>';
    echo '<script>swal("Warning", "No records for this size.", "warning").then(function () { window.location.href = "tclmcstock.php"; });</script>';

    exit;

  }



  if ($id <= 0) {

    $id = (int)$stockRows[array_key_last($stockRows)]['id'];

  }



  $activeStmt = $pdo->prepare('SELECT * FROM tclmcstock WHERE id = ? LIMIT 1');

  $activeStmt->execute([$id]);

  $infodata = $activeStmt->fetch(PDO::FETCH_ASSOC);

  if (!$infodata) {

    $infodata = $stockRows[array_key_last($stockRows)];

    $id = (int)$infodata['id'];

  }



  $item_id = $infodata['item_id'];

  $productstmt = $pdo->prepare('SELECT id, name AS item_name FROM products WHERE id = ? LIMIT 1');

  $productstmt->execute([$item_id]);

  $commonditydata = $productstmt->fetch(PDO::FETCH_ASSOC);



  $ledgerRows = [];

  $totalIn = 0;

  $totalOut = 0;



  $runningBalanceMc = 0;
  $actionLotId = $id;

  foreach ($stockRows as $stockRow) {

    $stockId = (int)$stockRow['id'];

    if ((int)($stockRow['grandtotal_mc'] ?? 0) > 0) {

      $actionLotId = $stockId;

    }

    $openingMc = (int)($stockRow['opening_mc'] ?? 0);

    $form10Mc = (int)($stockRow['form10mc'] ?? 0);

    $inMc = $openingMc + $form10Mc;



    if ($inMc !== 0) {

      $totalIn += $inMc;

      $runningBalanceMc += $inMc;

      $ledgerRows[] = [

        'date' => $stockRow['date'],

        'size' => $stockRow['size'] ?? '',

        'pcs' => $stockRow['pcs'] ?? '',

        'kg' => $stockRow['kg'] ?? '',

        'in_mc' => $inMc,

        'out_text' => '',

        'out_mc' => 0,

        'balance_mc' => $runningBalanceMc,

        'is_out' => false,

      ];

    }



    $transStmt = $pdo->prepare('SELECT * FROM tclmc_transactions WHERE tclmc_id = ? ORDER BY transaction_date ASC, id ASC');

    $transStmt->execute([$stockId]);

    $transactions = $transStmt->fetchAll(PDO::FETCH_ASSOC);



    foreach ($transactions as $trx) {

      $qty = (int)$trx['quantity'];

      $totalOut += $qty;

      $runningBalanceMc -= $qty;

      if ($trx['type'] === 'transfer') {

        $outText = 'Transfer to ' . $trx['destination'];

      } else {

        $outText = 'Export loading ' . $trx['destination'];

      }

      $ledgerRows[] = [

        'date' => $trx['transaction_date'],

        'size' => '',

        'pcs' => '',

        'kg' => '',

        'in_mc' => 0,

        'out_text' => $outText,

        'out_mc' => $qty,

        'balance_mc' => $runningBalanceMc,

        'is_out' => true,

      ];

    }

  }

  $id = $actionLotId;

  $activeStmt = $pdo->prepare('SELECT * FROM tclmcstock WHERE id = ? LIMIT 1');

  $activeStmt->execute([$id]);

  $infodata = $activeStmt->fetch(PDO::FETCH_ASSOC) ?: $infodata;

  $balanceMc = $runningBalanceMc;

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

          <div class="d-flex justify-content-between align-items-center mb-3">

            <div>

              <div style="font-size: 1.15rem; font-weight: bold;"><?= htmlspecialchars($commonditydata['item_name'] ?? 'Unknown'); ?></div>


            </div>

            <div class="text-end">

              <div class="text-muted">Balance Mc (this size)</div>

              <div style="font-size: 1.35rem; font-weight: bold; line-height: 1.2;"><?= $balanceMc; ?> Mc</div>

            </div>

          </div>



          <div class="table-responsive">

          <table class="table table-hover table-bordered table-striped tclmc-ledger-table mb-0">

            <thead>

              <tr>

                <th class="col-date">Date</th>

                <th>Size</th>

                <th class="text-end">Pcs</th>

                <th class="text-end">Kg</th>

                <th class="text-end col-mc">In Mc</th>

                <th>Out</th>

                <th class="text-end col-mc">Out Mc</th>

                <th class="text-end col-mc">Balance Mc</th>

              </tr>

            </thead>

            <tbody>

              <?php if (empty($ledgerRows)): ?>

                <tr>

                  <td colspan="8" class="text-center">No movements yet</td>

                </tr>

              <?php else: ?>

                <?php foreach ($ledgerRows as $row): ?>

                  <tr class="<?= $row['is_out'] ? 'row-out' : ''; ?>">

                    <td><?= date('d-m-Y', strtotime($row['date'])); ?></td>

                    <td><?= $row['size'] !== '' ? htmlspecialchars((string)$row['size']) : '—'; ?></td>

                    <td class="text-end"><?= $row['pcs'] !== '' && $row['pcs'] !== null ? htmlspecialchars((string)$row['pcs']) : '—'; ?></td>

                    <td class="text-end"><?= $row['kg'] !== '' && $row['kg'] !== null ? htmlspecialchars((string)$row['kg']) : '—'; ?></td>

                    <td class="text-end"><?= $row['in_mc'] !== 0 ? (int)$row['in_mc'] : '—'; ?></td>

                    <td><?= $row['out_text'] !== '' ? htmlspecialchars($row['out_text']) : '—'; ?></td>

                    <td class="text-end"><?= $row['out_mc'] !== 0 ? (int)$row['out_mc'] : '—'; ?></td>

                    <td class="text-end"><?= (int)$row['balance_mc']; ?></td>

                  </tr>

                <?php endforeach; ?>

                <tr class="row-total">

                  <td colspan="4" class="text-end">Total</td>

                  <td class="text-end"><?= $totalIn; ?></td>

                  <td></td>

                  <td class="text-end"><?= $totalOut; ?></td>

                  <td class="text-end"><?= $balanceMc; ?></td>

                </tr>

              <?php endif; ?>

            </tbody>

          </table>

          </div>

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

          <input type="hidden" name="tclmc_id" value="<?= (int)$id; ?>">

          <div class="modal-body">

            <label>Loading No</label>

            <input type="text" name="loading_no" class="form-control inpv2 mb-3 mt-1" required>

            <label>Loading Mc</label>

            <input type="number" name="loading_mc" class="form-control inpv2 mb-3 mt-1" max="<?= htmlspecialchars((string)$infodata['grandtotal_mc']); ?>" required>

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

          <input type="hidden" name="tclmc_id" value="<?= (int)$id; ?>">

          <div class="modal-body">

            <label>Transfer To</label>

            <input type="text" name="transfer_to" class="form-control inpv2 mb-3 mt-1" value="HHK" required>

            <label>Transfer Mc</label>

            <input type="number" name="transfer_mc" class="form-control inpv2 mb-3 mt-1" max="<?= htmlspecialchars((string)$infodata['grandtotal_mc']); ?>" required>

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

