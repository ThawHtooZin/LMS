<?php
session_start();
include '../../../Auth/authrize.ctr.php';
include '../../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();

$from = isset($_POST['date_from']) ? $_POST['date_from'] : date('Y-m-01');
$to = isset($_POST['date_to']) ? $_POST['date_to'] : date('Y-m-d');
$filter_type = isset($_POST['supplier_type']) ? $_POST['supplier_type'] : 'All';

$is_excel = (isset($_POST['export_type']) && $_POST['export_type'] === 'excel');
$is_pdf = (isset($_POST['export_type']) && $_POST['export_type'] === 'pdf');

if ($is_excel) {
    header("Content-Type: application/vnd.ms-excel");
    header("Content-Disposition: attachment; filename=Supplier_Statement_" . date('d_M_Y', strtotime($to)) . ".xls");
    header("Pragma: no-cache");
    header("Expires: 0");
} elseif ($is_pdf) {
    echo '<!DOCTYPE html><html><head>
    <title>Supplier Statement - ' . date('d.m.y', strtotime($to)) . '</title>
    <style>
        body { font-family: Arial, sans-serif; color: #000; background: #fff; margin: 0; padding: 30px;}
        .header { display: flex; justify-content: space-between; margin-bottom: 20px; font-weight: bold; }
        .header h3 { margin: 0; text-decoration: underline; font-size: 16px; }
        table { border-collapse: collapse; width: 100%; font-size: 13px; margin-bottom: 40px; }
        /* Exact full-grid black borders */
        th, td { border: 1px solid #000 !important; padding: 6px 8px; text-align: right; color: #000; }
        th { text-align: center; font-weight: bold; background: transparent; }
        td:nth-child(1), td:nth-child(2) { text-align: left; }
        td:nth-child(1) { text-align: center; }
        .row-total td { font-weight: bold; background: transparent; }
        
        .sig-container { display: flex; justify-content: space-between; margin-top: 60px; padding: 0 50px; page-break-inside: avoid;}
        .sig-block { text-align: center; font-weight: bold; }
        .sig-line { border-bottom: 1px solid #000; width: 180px; margin-top: 40px; }
        
        @media print {
            body { padding: 0; }
            /* Force borders to print */
            th, td { border: 1px solid #000 !important; }
        }
    </style>
    </head><body>
    <div class="header">
        <h3>Link Mark Supplier Statement</h3>
        <h3 style="text-decoration: underline;">Date: ' . date('d.m.y', strtotime($to)) . '</h3>
    </div>';
}

$categories = [
    'Fish Supplier' => 'Payable for Supplier',
    'Material Supplier' => 'Materials',
    'Cold Store Factory' => 'Cold Store Charges Balance'
];

$active_categories = $categories;
if ($filter_type !== 'All' && array_key_exists($filter_type, $categories)) {
    $active_categories = [$filter_type => $categories[$filter_type]];
}

foreach ($active_categories as $db_type => $display_title) {
    $name_header = 'Supplier Name';
    if ($db_type == 'Material Supplier') $name_header = 'Name';
    if ($db_type == 'Cold Store Factory') $name_header = 'Factory';

    echo "<div><h4 style='text-decoration:underline; font-size:14px; margin-bottom: 8px;'>{$display_title}</h4>";
    echo "<table>";
    echo "<tr>
            <th width='5%'>No</th>
            <th width='30%' style='text-align:left;'>{$name_header}</th>
            <th width='15%'>Opening Balance</th>
            <th width='15%'>Add Amt</th>
            <th width='15%'>Paid Amt</th>
            <th width='20%'>Balance</th>
          </tr>";

    $stmt = $pdo->prepare("SELECT id, name FROM contacts WHERE contact_type = ? ORDER BY name ASC");
    $stmt->execute([$db_type]);
    $contacts = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $id_count = 1;
    $cat_opening = $cat_add = $cat_paid = $cat_balance = 0;

    foreach ($contacts as $contact) {
        $supplier_id = $contact['id'];

        $opPurStmt = $pdo->prepare("SELECT COALESCE(SUM(grand_total), 0) FROM purchases WHERE contact_id = ? AND date < ? AND status IN ('AUTHORISED', 'PAID')");
        $opPurStmt->execute([$supplier_id, $from]);
        $opening_purchases = floatval($opPurStmt->fetchColumn());

        $opPayStmt = $pdo->prepare("SELECT COALESCE(SUM(pp.amount), 0) FROM purchase_payments pp JOIN purchases p ON pp.purchase_id = p.id WHERE p.contact_id = ? AND pp.payment_date < ?");
        $opPayStmt->execute([$supplier_id, $from]);
        $opening_payments = floatval($opPayStmt->fetchColumn());

        $opening = $opening_purchases - $opening_payments;

        $addStmt = $pdo->prepare("SELECT COALESCE(SUM(grand_total), 0) FROM purchases WHERE contact_id = ? AND date BETWEEN ? AND ? AND status IN ('AUTHORISED', 'PAID')");
        $addStmt->execute([$supplier_id, $from, $to]);
        $add = floatval($addStmt->fetchColumn());

        $paidStmt = $pdo->prepare("SELECT COALESCE(SUM(pp.amount), 0) FROM purchase_payments pp JOIN purchases p ON pp.purchase_id = p.id WHERE p.contact_id = ? AND pp.payment_date BETWEEN ? AND ?");
        $paidStmt->execute([$supplier_id, $from, $to]);
        $paid = floatval($paidStmt->fetchColumn());

        $balance = ($opening + $add) - $paid;

        if ($opening == 0 && $add == 0 && $paid == 0 && $balance == 0) continue;

        $cat_opening += $opening;
        $cat_add += $add;
        $cat_paid += $paid;
        $cat_balance += $balance;

        echo "<tr>";
        echo "<td>{$id_count}</td>";
        echo "<td>" . htmlspecialchars($contact['name']) . "</td>";
        echo "<td>" . ($opening != 0 ? number_format($opening) : '') . "</td>";
        echo "<td>" . ($add != 0 ? number_format($add) : '') . "</td>";
        echo "<td>" . ($paid != 0 ? number_format($paid) : '') . "</td>";
        echo "<td>" . ($balance != 0 ? number_format($balance) : '-') . "</td>";
        echo "</tr>";
        $id_count++;
    }

    echo "<tr class='row-total'>";
    echo "<td colspan='2' style='text-align:center;'>Total Amount</td>";
    echo "<td>" . ($cat_opening != 0 ? number_format($cat_opening) : '') . "</td>";
    echo "<td>" . ($cat_add != 0 ? number_format($cat_add) : '') . "</td>";
    echo "<td>" . ($cat_paid != 0 ? number_format($cat_paid) : '') . "</td>";
    echo "<td>" . ($cat_balance != 0 ? number_format($cat_balance) : '-') . "</td>";
    echo "</tr>";

    echo "</table></div>";
}

if ($is_excel) {
    echo "<table><tr><td colspan='2' style='font-weight:bold; height:50px; vertical-align:bottom;'>Prepared: ___________________</td><td colspan='4' style='font-weight:bold; height:50px; vertical-align:bottom; text-align:right;'>Checked By: ___________________</td></tr></table>";
} elseif ($is_pdf) {
    echo '<div class="sig-container">
            <div class="sig-block">Prepared<div class="sig-line"></div></div>
            <div class="sig-block">Checked By<div class="sig-line"></div></div>
          </div>';

    echo "<script>
        window.onload = function() {
            window.print();
        };
        window.onafterprint = function() {
            window.close();
        };
    </script></body></html>";
}
