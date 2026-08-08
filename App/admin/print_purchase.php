<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();

$purchase_id = isset($_GET['id']) ? intval($_GET['id']) : 0;

if ($purchase_id === 0) {
    die("Invalid Bill ID.");
}

// Fetch Purchase & Supplier Data
$stmt = $pdo->prepare("
    SELECT p.*, c.name as supplier_name, c.address as supplier_address, c.email as supplier_email, c.phone as supplier_phone 
    FROM purchases p 
    LEFT JOIN contacts c ON p.contact_id = c.id 
    WHERE p.id = ?
");
$stmt->execute([$purchase_id]);
$purchase = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$purchase) {
    die("Bill not found.");
}

// Fetch Line Items
$line_stmt = $pdo->prepare("
    SELECT pl.*, pr.name as product_name, pr.code as product_code 
    FROM purchase_lines pl 
    LEFT JOIN products pr ON pl.product_id = pr.id 
    WHERE pl.purchase_id = ?
");
$line_stmt->execute([$purchase_id]);
$lines = $line_stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Bill_<?= htmlspecialchars($purchase['voucher_no']); ?></title>
    <?php $bootstrap->css(); ?>
    <style>
        body {
            background-color: #fff;
            color: #333;
            font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
            padding: 40px;
        }

        .bill-header {
            font-size: 36px;
            font-weight: 300;
            color: #ccc;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .meta-table th {
            text-align: right;
            color: #888;
            font-weight: normal;
            padding-right: 15px;
            width: 100px;
        }

        .meta-table td {
            text-align: right;
            font-weight: bold;
        }

        .table-lines {
            margin-top: 40px;
        }

        .table-lines th {
            border-bottom: 2px solid #333;
            color: #555;
            padding-bottom: 10px;
        }

        .table-lines td {
            border-bottom: 1px solid #eee;
            padding: 12px 5px;
        }

        .totals-table th {
            text-align: right;
            padding: 8px 15px;
            color: #555;
        }

        .totals-table td {
            text-align: right;
            padding: 8px 5px;
            font-weight: bold;
        }

        .grand-total {
            font-size: 20px;
            border-top: 2px solid #333;
            border-bottom: 2px solid #333;
        }

        /* Print optimizations */
        @media print {
            body {
                padding: 0;
                margin: 0;
            }

            @page {
                margin: 1cm;
            }
        }
    </style>
</head>

<body>

    <div class="container-fluid p-0" style="max-width: 900px; margin: auto;">

        <div class="row mb-5">
            <div class="col-6">
                <h5 class="fw-bold text-dark mb-3">From</h5>
                <h4 class="fw-bold mb-1"><?= htmlspecialchars($purchase['supplier_name']); ?></h4>
                <?php if (!empty($purchase['supplier_address'])): ?>
                    <p class="mb-0 text-muted"><?= nl2br(htmlspecialchars($purchase['supplier_address'])); ?></p>
                <?php endif; ?>
                <?php if (!empty($purchase['supplier_email'])): ?>
                    <p class="mb-0 text-muted"><?= htmlspecialchars($purchase['supplier_email']); ?></p>
                <?php endif; ?>
                <?php if (!empty($purchase['supplier_phone'])): ?>
                    <p class="mb-0 text-muted"><?= htmlspecialchars($purchase['supplier_phone']); ?></p>
                <?php endif; ?>
            </div>

            <div class="col-6 d-flex flex-column align-items-end">
                <div class="bill-header mb-4">Bill</div>
                <table class="meta-table">
                    <tr>
                        <th>Date</th>
                        <td><?= date('d M Y', strtotime($purchase['date'])); ?></td>
                    </tr>
                    <tr>
                        <th>Due Date</th>
                        <td><?= !empty($purchase['due_date']) ? date('d M Y', strtotime($purchase['due_date'])) : '-'; ?></td>
                    </tr>
                    <tr>
                        <th>Reference</th>
                        <td><?= htmlspecialchars($purchase['voucher_no']); ?></td>
                    </tr>
                    <tr>
                        <th>Total</th>
                        <td><?= $purchase['currency']; ?> <?= number_format($purchase['grand_total'], 2); ?></td>
                    </tr>
                </table>
            </div>
        </div>

        <table class="table table-borderless table-lines w-100">
            <thead>
                <tr>
                    <th width="20%">Item</th>
                    <th width="35%">Description</th>
                    <th width="15%" class="text-end">Qty</th>
                    <th width="15%" class="text-end">Unit Price</th>
                    <th width="15%" class="text-end">Amount <?= $purchase['currency']; ?></th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($lines as $line):
                    // Determine quantity logic based on what was entered
                    $qty = 0;
                    $qty_label = "";
                    if (strtolower($purchase['tclfrozen']) === 'material') {
                        $qty = $line['pcs'];
                        $qty_label = " Pcs";
                    } else {
                        if ($line['viss'] > 0) {
                            $qty = $line['viss'];
                            $qty_label = " Viss";
                        } elseif ($line['pcs'] > 0) {
                            $qty = $line['pcs'];
                            $qty_label = " Pcs";
                        }
                    }
                ?>
                    <tr>
                        <td>
                            <div class="fw-bold"><?= htmlspecialchars($line['product_code']); ?></div>
                            <div class="text-muted small"><?= htmlspecialchars($line['product_name']); ?></div>
                        </td>
                        <td>
                            <?= htmlspecialchars($line['description']); ?>
                            <?php if (!empty($line['size'])): ?>
                                <div class="text-muted small">Size: <?= htmlspecialchars($line['size']); ?></div>
                            <?php endif; ?>
                        </td>
                        <td class="text-end"><?= $qty . $qty_label; ?></td>
                        <td class="text-end"><?= number_format($line['unit_price'], 2); ?></td>
                        <td class="text-end"><?= number_format($line['line_amount'], 2); ?></td>
                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>

        <div class="row mt-4">
            <div class="col-6"></div>
            <div class="col-6">
                <table class="totals-table w-100">
                    <tr>
                        <th>Subtotal</th>
                        <td><?= number_format($purchase['subtotal'], 2); ?></td>
                    </tr>
                    <tr class="grand-total">
                        <th>TOTAL <?= $purchase['currency']; ?></th>
                        <td><?= number_format($purchase['grand_total'], 2); ?></td>
                    </tr>
                    <?php if ($purchase['paid_amount'] > 0): ?>
                        <tr>
                            <th>Less Amount Paid</th>
                            <td class="text-danger">- <?= number_format($purchase['paid_amount'], 2); ?></td>
                        </tr>
                        <tr>
                            <th>Amount Due <?= $purchase['currency']; ?></th>
                            <td><?= number_format($purchase['grand_total'] - $purchase['paid_amount'], 2); ?></td>
                        </tr>
                    <?php endif; ?>
                </table>
            </div>
        </div>

    </div>

    <!-- Instantly triggers the PDF/Print dialog -->
    <script>
        window.onload = function() {
            window.print();
        };
    </script>
    <?php $bootstrap->javascript(); ?>
</body>

</html>