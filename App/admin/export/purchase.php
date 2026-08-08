<?php
session_start();
include '../../../Auth/authrize.ctr.php';
include '../../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();

$is_excel = (isset($_POST['export_type']) && $_POST['export_type'] === 'excel');
$is_pdf = (isset($_POST['export_type']) && $_POST['export_type'] === 'pdf');

if ($is_excel) {
    header("Content-Type: application/vnd.ms-excel");
    header("Content-Disposition: attachment; filename=Purchase_Report_" . date('Y-m-d_H-i') . ".xls");
    header("Pragma: no-cache");
    header("Expires: 0");
} elseif ($is_pdf) {
    echo '<!DOCTYPE html><html><head>
    <title>Purchase Report PDF</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
    <style>
        body { font-family: Arial, sans-serif; }
        #pdf-loader { text-align: center; margin-top: 50px; font-size: 20px; font-weight: bold; color: #555; }
        table { border-collapse: collapse; width: 100%; font-size: 11px; margin-top: 20px; }
        th, td { border: 1px solid #444; padding: 6px; text-align: left; }
        th { background-color: #f2f2f2; }
        .totals-row { font-weight: bold; background-color: #e9ecef; }
    </style>
    </head><body>
    <div id="pdf-loader">Generating PDF, please wait...</div>
    <div id="pdf-content" style="padding: 20px; display: none;">
    <h2>Purchase Report (' . date('d M Y') . ')</h2>';
}

$base_sql = "SELECT pl.*, p.date, p.voucher_no, p.contact_id AS supplier_id, p.tclfrozen 
             FROM purchase_lines pl 
             JOIN purchases p ON pl.purchase_id = p.id";
$base_sum_sql = "SELECT SUM(pl.line_amount) as total_amount FROM purchase_lines pl JOIN purchases p ON pl.purchase_id = p.id";

$purchasedatas = [];

if (isset($_POST['suppliersearch'])) {
    $supplier_id = $_POST['supplier_id'];
    $stmt = $pdo->prepare("$base_sql WHERE p.contact_id = ?");
    $stmt->execute([$supplier_id]);
    $purchasedatas = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $sum_stmt = $pdo->prepare("$base_sum_sql WHERE p.contact_id = ?");
    $sum_stmt->execute([$supplier_id]);
    $total_amount_supplier_search = $sum_stmt->fetch(PDO::FETCH_ASSOC);
} elseif (isset($_POST['commoditysearch'])) {
    $commodity_id = $_POST['item_id'];
    $stmt = $pdo->prepare("$base_sql WHERE pl.product_id = ?");
    $stmt->execute([$commodity_id]);
    $purchasedatas = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $sum_stmt = $pdo->prepare("SELECT SUM(line_amount) as total_amount FROM purchase_lines WHERE product_id = ?");
    $sum_stmt->execute([$commodity_id]);
    $total_amount_commodity_search = $sum_stmt->fetch(PDO::FETCH_ASSOC);

    $sum_stmt2 = $pdo->prepare("SELECT SUM(viss) as total_viss FROM purchase_lines WHERE product_id = ?");
    $sum_stmt2->execute([$commodity_id]);
    $total_amount_commodity_search_viss = $sum_stmt2->fetch(PDO::FETCH_ASSOC);
} elseif (isset($_POST['dbwsearch'])) {
    $startdate = $_POST['dbwstartdate'];
    $enddate = $_POST['dbwenddate'];
    $stmt = $pdo->prepare("$base_sql WHERE p.date BETWEEN ? AND ?");
    $stmt->execute([$startdate, $enddate]);
    $purchasedatas = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $sum_stmt = $pdo->prepare("$base_sum_sql WHERE p.date BETWEEN ? AND ?");
    $sum_stmt->execute([$startdate, $enddate]);
    $total_amount_dbw_search = $sum_stmt->fetch(PDO::FETCH_ASSOC);
} elseif (isset($_POST['tdysearch'])) {
    $startdate = date('Y-m-d');
    $enddate = date('Y-m-d');
    $stmt = $pdo->prepare("$base_sql WHERE p.date BETWEEN ? AND ?");
    $stmt->execute([$startdate, $enddate]);
    $purchasedatas = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $sum_stmt = $pdo->prepare("$base_sum_sql WHERE p.date BETWEEN ? AND ?");
    $sum_stmt->execute([$startdate, $enddate]);
    $total_amount_dbw_search = $sum_stmt->fetch(PDO::FETCH_ASSOC);
} elseif (isset($_POST['supplierdbwsearch'])) {
    $startdate = $_POST['dbwstartdate'];
    $enddate = $_POST['dbwenddate'];
    $supplier_id = $_POST['supplier_name'];
    $stmt = $pdo->prepare("$base_sql WHERE p.contact_id = ? AND p.date BETWEEN ? AND ?");
    $stmt->execute([$supplier_id, $startdate, $enddate]);
    $purchasedatas = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $sum_stmt = $pdo->prepare("$base_sum_sql WHERE p.contact_id = ? AND p.date BETWEEN ? AND ?");
    $sum_stmt->execute([$supplier_id, $startdate, $enddate]);
    $total_amount_dbw_supplier_search = $sum_stmt->fetch(PDO::FETCH_ASSOC);
} elseif (isset($_POST['commoditydbwsearch'])) {
    $startdate = $_POST['dbwstartdate'];
    $enddate = $_POST['dbwenddate'];
    $commodity = $_POST['item_id'];
    $stmt = $pdo->prepare("$base_sql WHERE pl.product_id = ? AND p.date BETWEEN ? AND ?");
    $stmt->execute([$commodity, $startdate, $enddate]);
    $purchasedatas = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $sum_stmt = $pdo->prepare("$base_sum_sql WHERE pl.product_id = ? AND p.date BETWEEN ? AND ?");
    $sum_stmt->execute([$commodity, $startdate, $enddate]);
    $total_amount_dbw_commodity_search = $sum_stmt->fetch(PDO::FETCH_ASSOC);
} elseif (isset($_POST['vouchersearch'])) {
    $voucher_no = $_POST['voucher_no'];
    $stmt = $pdo->prepare("$base_sql WHERE p.voucher_no = ?");
    $stmt->execute([$voucher_no]);
    $purchasedatas = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $sum_stmt = $pdo->prepare("$base_sum_sql WHERE p.voucher_no = ?");
    $sum_stmt->execute([$voucher_no]);
    $total_amount_commodity_search = $sum_stmt->fetch(PDO::FETCH_ASSOC);
} elseif (isset($_POST['commodityandsizesearch'])) {
    $item_id = $_POST['item_id'];
    $size = $_POST['size'];
    $stmt = $pdo->prepare("$base_sql WHERE pl.product_id = ? AND pl.size = ?");
    $stmt->execute([$item_id, $size]);
    $purchasedatas = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $sum_stmt = $pdo->prepare("SELECT SUM(pl.line_amount) as total_amount FROM purchase_lines pl JOIN purchases p ON pl.purchase_id = p.id WHERE pl.product_id = ? AND pl.size = ?");
    $sum_stmt->execute([$item_id, $size]);
    $total_amount_commodity_and_size_search = $sum_stmt->fetch(PDO::FETCH_ASSOC);

    $sum_stmt2 = $pdo->prepare("SELECT SUM(viss) as total_viss FROM purchase_lines pl JOIN purchases p ON pl.purchase_id = p.id WHERE pl.product_id = ? AND pl.size = ?");
    $sum_stmt2->execute([$item_id, $size]);
    $total_amount_commodity_and_size_search_viss = $sum_stmt2->fetch(PDO::FETCH_ASSOC);
} else {
    // If hit without filters, show all
    $stmt = $pdo->prepare($base_sql);
    $stmt->execute();
    $purchasedatas = $stmt->fetchAll(PDO::FETCH_ASSOC);
}
?>

<table border="1">
    <tr style="background-color: lightgray; font-weight: bold;">
        <th>No.</th>
        <th>Date</th>
        <th>Voucher No</th>
        <th>Type</th>
        <th>Supplier Name</th>
        <th>Commodity</th>
        <th>Size</th>
        <th>Viss</th>
        <th>Kg</th>
        <th>Pcs</th>
        <th>Price</th>
        <th>Amount</th>
    </tr>

    <?php
    $counter = 1;
    foreach ($purchasedatas as $purchasedata) {
        $supplierid = $purchasedata['supplier_id'];
        $supStmt = $pdo->prepare("SELECT name FROM contacts WHERE id = ? LIMIT 1");
        $supStmt->execute([$supplierid]);
        $supplier_name_val = $supStmt->fetchColumn() ?: 'Unknown';

        $itemid = $purchasedata['product_id'];
        $prodStmt = $pdo->prepare("SELECT name FROM products WHERE id = ? LIMIT 1");
        $prodStmt->execute([$itemid]);
        $item_name_val = $prodStmt->fetchColumn() ?: 'Unknown';
    ?>
        <tr>
            <td><?php echo $counter++; ?></td>
            <td><?php echo !empty($purchasedata['date']) ? date('d-m-Y', strtotime($purchasedata['date'])) : ''; ?></td>
            <td><?php echo $purchasedata['voucher_no']; ?></td>
            <td><?php echo $purchasedata['tclfrozen']; ?></td>
            <td><?php echo $supplier_name_val; ?></td>
            <td><?php echo $item_name_val; ?></td>
            <td><?php echo $purchasedata['size']; ?></td>
            <td><?php echo $purchasedata['viss']; ?></td>
            <td><?php echo round(floatval($purchasedata['viss']) * 1.634, 2); ?></td>
            <td><?php echo $purchasedata['pcs']; ?></td>
            <td><?php echo $purchasedata['unit_price']; ?></td>
            <td><?php echo $purchasedata['line_amount']; ?></td>
        </tr>
    <?php } ?>

    <?php if (!empty($total_amount_supplier_search)) { ?>
        <tr class="totals-row">
            <td colspan="10"></td>
            <td>Total Amount:</td>
            <td><?php echo $total_amount_supplier_search['total_amount'] ?? 0; ?></td>
        </tr>
    <?php } ?>

    <?php if (!empty($total_amount_commodity_search)) { ?>
        <tr class="totals-row">
            <td colspan="10"></td>
            <td>Total Amount:</td>
            <td><?php echo $total_amount_commodity_search['total_amount'] ?? 0; ?></td>
        </tr>
        <?php if (!empty($total_amount_commodity_search_viss)) { ?>
            <tr class="totals-row">
                <td colspan="10"></td>
                <td>Total Viss:</td>
                <td><?php echo $total_amount_commodity_search_viss['total_viss'] ?? 0; ?></td>
            </tr>
            <tr class="totals-row">
                <td colspan="10"></td>
                <td>Total Kg:</td>
                <td><?php echo round(floatval($total_amount_commodity_search_viss['total_viss'] ?? 0) * 1.634, 2); ?></td>
            </tr>
        <?php } ?>
    <?php } ?>

    <?php if (!empty($total_amount_dbw_search)) { ?>
        <tr class="totals-row">
            <td colspan="10"></td>
            <td>Total Amount:</td>
            <td><?php echo $total_amount_dbw_search['total_amount'] ?? 0; ?></td>
        </tr>
    <?php } ?>

    <?php if (!empty($total_amount_dbw_supplier_search)) { ?>
        <tr class="totals-row">
            <td colspan="10"></td>
            <td>Total Amount:</td>
            <td><?php echo $total_amount_dbw_supplier_search['total_amount'] ?? 0; ?></td>
        </tr>
    <?php } ?>

    <?php if (!empty($total_amount_dbw_commodity_search)) { ?>
        <tr class="totals-row">
            <td colspan="10"></td>
            <td>Total Amount:</td>
            <td><?php echo $total_amount_dbw_commodity_search['total_amount'] ?? 0; ?></td>
        </tr>
    <?php } ?>

    <?php if (!empty($total_amount_commodity_and_size_search)) { ?>
        <tr class="totals-row">
            <td colspan="10"></td>
            <td>Total Amount:</td>
            <td><?php echo $total_amount_commodity_and_size_search['total_amount'] ?? 0; ?></td>
        </tr>
        <tr class="totals-row">
            <td colspan="10"></td>
            <td>Total Viss:</td>
            <td><?php echo $total_amount_commodity_and_size_search_viss['total_viss'] ?? 0; ?></td>
        </tr>
        <tr class="totals-row">
            <td colspan="10"></td>
            <td>Total Kg:</td>
            <td><?php echo round(floatval($total_amount_commodity_and_size_search_viss['total_viss'] ?? 0) * 1.634, 2); ?></td>
        </tr>
    <?php } ?>
</table>

<?php
if ($is_pdf) {
    echo '</div>'; // close pdf-content
    echo "<script>
        document.getElementById('pdf-content').style.display = 'block';
        var element = document.getElementById('pdf-content');
        html2pdf().from(element).set({
            margin:       10,
            filename:     'Purchase_Report_" . date('Y-m-d_H-i') . ".pdf',
            image:        { type: 'jpeg', quality: 0.98 },
            html2canvas:  { scale: 2 },
            jsPDF:        { unit: 'mm', format: 'a4', orientation: 'landscape' }
        }).save().then(function() {
            setTimeout(() => { window.close(); }, 500);
        });
    </script></body></html>";
}
?>