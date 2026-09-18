<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();

if (!isset($_GET['customer_id'])) {
    header("Location: acreceivable.php");
    exit;
}

$customer_id = intval($_GET['customer_id']);

// Fetch Customer Info
$custStmt = $pdo->prepare("SELECT name FROM contacts WHERE id = ?");
$custStmt->execute([$customer_id]);
$customer_name = $custStmt->fetchColumn();

// Fetch all receivables entries for this customer
$invoicesStmt = $pdo->prepare("
    SELECT id, date, sr_no, container_no, invoice_amount, paid_amount, balance, particulars, payment_no 
    FROM receivable 
    WHERE ac_code = ? 
    ORDER BY date ASC, id ASC
");
$invoicesStmt->execute([$customer_id]);
$invoices = $invoicesStmt->fetchAll(PDO::FETCH_ASSOC);

$total_outstanding = 0;
foreach ($invoices as $inv) {
    if (empty($inv['payment_no']) && $inv . invoice_amount > 0) {
        $total_outstanding += floatval($inv['balance']);
    }
}

// Fetch Bank/Cash Accounts for the payment collection dropdown
$accStmt = $pdo->query("SELECT code, name FROM accodes WHERE class = 'ASSETS' ORDER BY code ASC");
$asset_accounts = $accStmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <title>Receivable Detail</title>
    <?php $bootstrap->css(); ?>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
</head>

<body>
    <?php $bootstrap->javascriptindex(); ?>

    <div class="row">
        <div class="sidebarcol" id="sidebar">
            <?php include 'sidebar.php'; ?>
        </div>
        <div class="contentcol" id="content">
            <?php require 'navbar.php'; ?>

            <div class="card">
                <div class="card-header bg-info text-light">
                    <a href="acreceivable.php" class="btn btn-secondary btn-sm float-end">Back</a>
                    <h5><?= htmlspecialchars($customer_name); ?> Receivable Detail Info</h5>
                </div>
                <div class="card-body">
                    <table class="mt-1 table table-bordered table-striped rounded">
                        <tr>
                            <th class="pt-3">Date</th>
                            <th>Sr No.</th>
                            <th>Container No</th>
                            <th>Invoice Amount ($)</th>
                            <th class="pt-3">Paid Amount ($)</th>
                            <th class="pt-3">Balance ($)</th>
                            <th class="pt-3">Particulars</th>
                        </tr>
                        <?php if (empty($invoices)): ?>
                            <tr>
                                <td colspan="7" class="text-center">No invoice records found for this customer.</td>
                            </tr>
                        <?php else: ?>
                            <?php foreach ($invoices as $inv): ?>
                                <tr>
                                    <td><?= ($inv['date'] && $inv['date'] != '0000-00-00') ? date('d-m-Y', strtotime($inv['date'])) : ''; ?></td>
                                    <td><?= htmlspecialchars($inv['sr_no'] ?? ''); ?></td>
                                    <td><?= htmlspecialchars($inv['container_no'] ?? ''); ?></td>
                                    <td><?= number_format(floatval($inv['invoice_amount']), 2); ?></td>
                                    <td><?= number_format(floatval($inv['paid_amount']), 2); ?></td>
                                    <td><?= number_format(floatval($inv['balance']), 2); ?></td>
                                    <td><?= htmlspecialchars($inv['particulars'] ?? ''); ?></td>
                                </tr>
                            <?php endforeach; ?>
                        <?php endif; ?>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <?php $bootstrap->javascript(); ?>
</body>

</html>