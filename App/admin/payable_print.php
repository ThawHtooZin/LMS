<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$query = new Query();

$from = isset($_GET['from']) ? $_GET['from'] : '';
$to = isset($_GET['to']) ? $_GET['to'] : '';
$type = isset($_GET['type']) ? $_GET['type'] : '';

$type_filter = ($type === 'material') ? "fishormaterial = 'material'" : "1=1";
$date_filter = (!empty($from) && !empty($to)) ? "(date BETWEEN '$from' AND '$to' OR paid_date BETWEEN '$from' AND '$to')" : "1=1";

// Logic for Date Display
if (empty($from) || empty($to)) {
    $date_display = "All";
} elseif ($from === $to) {
    $date_display = date('d-m-Y', strtotime($from));
} else {
    $date_display = date('d-m-Y', strtotime($from)) . " - " . date('d-m-Y', strtotime($to));
}
?>
<!DOCTYPE html>
<html>

<head>
    <title>Payable Report</title>
    <style>
        body {
            font-family: sans-serif;
        }

        h2 {
            text-align: center;
            margin-bottom: 5px;
        }

        .header-section {
            margin-bottom: 15px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th,
        td {
            border: 1px solid #000;
            padding: 6px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
            text-align: center;
        }

        @media print {
            @page {
                margin: 10mm;
            }
        }
    </style>
</head>

<body onload="window.print();">

    <h2>Link Mark Supplier Statement</h2>

    <div class="header-section">
        <table style="border: none; width: 100%;">
            <tr style="border: none;">
                <td style="border: none; text-align: left; vertical-align: bottom;"><u><b>Payable For Supplier</b></u></td>
                <td style="border: none; text-align: right; vertical-align: bottom;"><b>Date : </b> <?php echo $date_display; ?></td>
            </tr>
        </table>
    </div>

    <table>
        <tr>
            <th>No</th>
            <th>Supplier Name</th>
            <th>Opening Balance</th>
            <th>Add Amt</th>
            <th>Paid Amt</th>
            <th>Balance</th>
        </tr>
        <?php
        $stmt = $pdo->prepare("SELECT DISTINCT supplier_id FROM payable WHERE $type_filter AND $date_filter");
        $stmt->execute();
        $payablesuppliers = $stmt->fetchall();

        $id = 0;
        $total_opening = 0;
        $total_add = 0;
        $total_paid = 0;
        $total_balance = 0;

        foreach ($payablesuppliers as $payablesupplier) {
            $supplier_id = $payablesupplier['supplier_id'];

            // Calculations
            // If dates provided, filter; otherwise calculate overall
            $date_clause = (!empty($from) && !empty($to)) ? "AND date<'$from'" : "";
            $opening = $pdo->query("SELECT closing_balance FROM payable WHERE $type_filter AND supplier_id='$supplier_id' $date_clause ORDER BY id DESC LIMIT 1")->fetch(PDO::FETCH_ASSOC)['closing_balance'] ?? 0;

            $add_clause = (!empty($from) && !empty($to)) ? "AND date BETWEEN '$from' AND '$to'" : "";
            $add = $pdo->query("SELECT SUM(purchase_amount) FROM payable WHERE $type_filter AND supplier_id='$supplier_id' $add_clause")->fetchColumn() ?? 0;

            $paid_clause = (!empty($from) && !empty($to)) ? "AND paid_date BETWEEN '$from' AND '$to'" : "";
            $paid = $pdo->query("SELECT SUM(paid_amount) FROM payable WHERE $type_filter AND supplier_id='$supplier_id' $paid_clause")->fetchColumn() ?? 0;

            $balance = ($opening + $add) - $paid;
            $name = $query->select('acname', $supplier_id, 'code_no')['ac_name'] ?? 'Unknown';
            $id++;

            echo "<tr><td>$id</td><td>$name</td><td>" . number_format($opening, 0) . "</td><td>" . number_format($add, 0) . "</td><td>" . number_format($paid, 0) . "</td><td>" . number_format($balance, 0) . "</td></tr>";

            $total_opening += $opening;
            $total_add += $add;
            $total_paid += $paid;
            $total_balance += $balance;
        }
        ?>
        <tr style="font-weight:bold;">
            <td colspan="2">TOTAL</td>
            <td><?= number_format($total_opening, 0) ?></td>
            <td><?= number_format($total_add, 0) ?></td>
            <td><?= number_format($total_paid, 0) ?></td>
            <td><?= number_format($total_balance, 0) ?></td>
        </tr>
    </table>
</body>

</html>