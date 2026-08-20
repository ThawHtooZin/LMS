<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();

// Default to current month
$from = isset($_POST['date_from']) ? $_POST['date_from'] : date('Y-m-01');
$to = isset($_POST['date_to']) ? $_POST['date_to'] : date('Y-m-d');

// Helper function to calculate net movement using a broad keyword search
function getAccountBalances($pdo, $keywords, $from, $to, $is_revenue = false)
{
    $math = $is_revenue ? "(SUM(gl.credit) - SUM(gl.debit))" : "(SUM(gl.debit) - SUM(gl.credit))";

    $conditions = [];
    $params = [$from, $to];
    foreach ($keywords as $cat) {
        $conditions[] = "a.class LIKE ?";
        $conditions[] = "a.type LIKE ?";
        $params[] = "%$cat%";
        $params[] = "%$cat%";
    }
    $whereSql = implode(" OR ", $conditions);

    $stmt = $pdo->prepare("
        SELECT a.code, a.name, COALESCE($math, 0) as balance 
        FROM general_ledger gl
        JOIN accodes a ON gl.ac_code = a.code
        WHERE gl.date BETWEEN ? AND ? AND ($whereSql)
        GROUP BY a.code, a.name
        HAVING balance != 0
        ORDER BY a.code ASC
    ");
    $stmt->execute($params);
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

// Broaden the net to catch variations in your database
$income_accounts = getAccountBalances($pdo, ['Revenue', 'Income', 'Sales'], $from, $to, true);
$cos_accounts = getAccountBalances($pdo, ['Direct Costs', 'Cost of Sales', 'COGS', 'Purchase'], $from, $to, false);
$expense_accounts = getAccountBalances($pdo, ['Expense', 'Operating', 'Overhead'], $from, $to, false);

// Keep track of what we successfully categorized
$caught_codes = array_merge(
    array_column($income_accounts, 'code'),
    array_column($cos_accounts, 'code'),
    array_column($expense_accounts, 'code')
);

// THE SAFETY NET: Fetch anything that has ledger movement but wasn't categorized above
$uncategorized = [];
if (!empty($caught_codes)) {
    $placeholders = implode(',', array_fill(0, count($caught_codes), '?'));
    $sql = "SELECT gl.ac_code as code, COALESCE(a.name, gl.ac_code) as name, (SUM(gl.debit) - SUM(gl.credit)) as balance 
            FROM general_ledger gl 
            LEFT JOIN accodes a ON gl.ac_code = a.code 
            WHERE gl.date BETWEEN ? AND ? AND gl.ac_code NOT IN ($placeholders)
            GROUP BY gl.ac_code, a.name
            HAVING balance != 0";
    $params = array_merge([$from, $to], $caught_codes);
} else {
    $sql = "SELECT gl.ac_code as code, COALESCE(a.name, gl.ac_code) as name, (SUM(gl.debit) - SUM(gl.credit)) as balance 
            FROM general_ledger gl 
            LEFT JOIN accodes a ON gl.ac_code = a.code 
            WHERE gl.date BETWEEN ? AND ?
            GROUP BY gl.ac_code, a.name
            HAVING balance != 0";
    $params = [$from, $to];
}

$stmt = $pdo->prepare($sql);
$stmt->execute($params);
$all_uncategorized = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Filter out Assets (1xxx), Liabilities (2xxx), and Payables (4000) so they don't corrupt the P&L
$uncategorized_expenses = [];
foreach ($all_uncategorized as $acc) {
    $first_digit = substr($acc['code'], 0, 1);
    // Grab anything in the 5xxx, 6xxx, 8xxx, or 9xxx range that slipped through
    if ($first_digit == '5' || $first_digit == '6' || $first_digit == '8' || $first_digit == '9') {
        $uncategorized_expenses[] = $acc;
    }
}

// Math logic
$total_income = array_sum(array_column($income_accounts, 'balance'));
$total_cos = array_sum(array_column($cos_accounts, 'balance'));
$gross_profit = $total_income - $total_cos;

$total_expense = array_sum(array_column($expense_accounts, 'balance'));
$total_uncat = array_sum(array_column($uncategorized_expenses, 'balance'));
$net_profit = $gross_profit - $total_expense - $total_uncat;
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <title>Profit and Loss</title>
    <?php $bootstrap->css(); ?>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
    <style>
        .xero-card {
            background: #fff;
            border: 1px solid #e2e8f0;
            border-radius: 4px;
            padding: 30px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
        }

        .xero-header h2 {
            font-weight: bold;
            color: #111827;
            margin-bottom: 5px;
            font-size: 24px;
        }

        .xero-header p {
            color: #4b5563;
            font-size: 14px;
            margin-bottom: 30px;
        }

        .pl-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 14px;
        }

        .pl-table th {
            border-bottom: 2px solid #000;
            padding: 10px 5px;
            text-align: left;
            font-weight: bold;
            font-size: 15px;
        }

        .pl-table td {
            padding: 8px 5px;
            border-bottom: 1px solid #f3f4f6;
            color: #374151;
        }

        .pl-table .text-right {
            text-align: right;
        }

        .pl-table .category-header {
            font-weight: bold;
            color: #111827;
            padding-top: 20px;
            border-bottom: none;
        }

        .pl-table .total-row td {
            font-weight: bold;
            border-top: 1px solid #000;
            border-bottom: 1px solid #000;
            color: #111827;
        }

        .pl-table .grand-total td {
            font-weight: bold;
            border-top: 2px solid #000;
            border-bottom: 2px solid #000;
            font-size: 16px;
            padding: 12px 5px;
        }

        .xero-filter {
            background: #f9fafb;
            border: 1px solid #e5e7eb;
            border-radius: 4px;
            padding: 15px;
            margin-bottom: 20px;
        }
    </style>
</head>

<body>
    <div class="row m-0">
        <div class="sidebarcol" id="sidebar">
            <?php include 'sidebar.php'; ?>
        </div>
        <div class="contentcol" id="content">
            <?php require 'navbar.php'; ?>

            <div class="p-4">
                <div class="xero-filter d-flex justify-content-between align-items-center">
                    <form action="" method="POST" class="d-flex align-items-end m-0">
                        <div class="me-3">
                            <label class="small fw-bold text-secondary mb-1">Date range</label>
                            <div class="d-flex">
                                <input type="date" name="date_from" class="form-control form-control-sm border-secondary me-2" value="<?= $from ?>">
                                <input type="date" name="date_to" class="form-control form-control-sm border-secondary" value="<?= $to ?>">
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary btn-sm fw-bold px-4">Update</button>
                    </form>
                    <div>
                        <button class="btn btn-outline-secondary btn-sm fw-bold me-2"><i class="bi bi-file-earmark-excel"></i> Export</button>
                    </div>
                </div>

                <div class="xero-card">
                    <div class="xero-header d-flex justify-content-between align-items-end">
                        <div>
                            <h2>Profit and Loss</h2>
                            <p>Link Mark System<br>For the period <?= date('j M Y', strtotime($from)) ?> to <?= date('j M Y', strtotime($to)) ?></p>
                        </div>
                        <div class="text-secondary small fw-bold mb-4">
                            <?= date('M-Y', strtotime($from)) ?> - <?= date('M-Y', strtotime($to)) ?>
                        </div>
                    </div>

                    <table class="pl-table">
                        <!-- TRADING INCOME -->
                        <tr>
                            <td colspan="2" class="category-header">Trading Income</td>
                        </tr>
                        <?php if (empty($income_accounts)) {
                            echo "<tr><td colspan='2' class='text-muted fst-italic'>No income recorded</td></tr>";
                        } ?>
                        <?php foreach ($income_accounts as $acc): ?>
                            <tr>
                                <td><?= htmlspecialchars($acc['name']) ?> (<?= $acc['code'] ?>)</td>
                                <td class="text-right text-primary"><?= number_format($acc['balance'], 2) ?></td>
                            </tr>
                        <?php endforeach; ?>
                        <tr class="total-row">
                            <td>Total Trading Income</td>
                            <td class="text-right"><?= number_format($total_income, 2) ?></td>
                        </tr>

                        <!-- COST OF SALES -->
                        <tr>
                            <td colspan="2" class="category-header">Cost of Sales</td>
                        </tr>
                        <?php if (empty($cos_accounts)) {
                            echo "<tr><td colspan='2' class='text-muted fst-italic'>No costs recorded</td></tr>";
                        } ?>
                        <?php foreach ($cos_accounts as $acc): ?>
                            <tr>
                                <td><?= htmlspecialchars($acc['name']) ?> (<?= $acc['code'] ?>)</td>
                                <td class="text-right text-primary"><?= number_format($acc['balance'], 2) ?></td>
                            </tr>
                        <?php endforeach; ?>
                        <tr class="total-row">
                            <td>Total Cost of Sales</td>
                            <td class="text-right"><?= number_format($total_cos, 2) ?></td>
                        </tr>

                        <!-- GROSS PROFIT -->
                        <tr class="total-row">
                            <td class="pt-3 pb-3">Gross Profit</td>
                            <td class="text-right pt-3 pb-3"><?= number_format($gross_profit, 2) ?></td>
                        </tr>

                        <!-- OPERATING EXPENSES -->
                        <tr>
                            <td colspan="2" class="category-header">Operating Expenses</td>
                        </tr>
                        <?php if (empty($expense_accounts)) {
                            echo "<tr><td colspan='2' class='text-muted fst-italic'>No expenses recorded</td></tr>";
                        } ?>
                        <?php foreach ($expense_accounts as $acc): ?>
                            <tr>
                                <td><?= htmlspecialchars($acc['name']) ?> (<?= $acc['code'] ?>)</td>
                                <td class="text-right text-primary"><?= number_format($acc['balance'], 2) ?></td>
                            </tr>
                        <?php endforeach; ?>
                        <tr class="total-row">
                            <td>Total Operating Expenses</td>
                            <td class="text-right"><?= number_format($total_expense, 2) ?></td>
                        </tr>

                        <!-- UNCATEGORIZED SAFETY NET -->
                        <?php if (!empty($uncategorized_expenses)): ?>
                            <tr>
                                <td colspan="2" class="category-header text-danger">Uncategorized Accounts (Check COA Mapping)</td>
                            </tr>
                            <?php foreach ($uncategorized_expenses as $acc): ?>
                                <tr>
                                    <td><?= htmlspecialchars($acc['name']) ?> (<?= $acc['code'] ?>)</td>
                                    <td class="text-right text-danger"><?= number_format($acc['balance'], 2) ?></td>
                                </tr>
                            <?php endforeach; ?>
                            <tr class="total-row">
                                <td class="text-danger">Total Uncategorized</td>
                                <td class="text-right text-danger"><?= number_format($total_uncat, 2) ?></td>
                            </tr>
                        <?php endif; ?>

                        <!-- NET PROFIT -->
                        <tr class="grand-total">
                            <td class="pt-4 pb-4">Net Profit</td>
                            <td class="text-right pt-4 pb-4"><?= $net_profit < 0 ? '(' . number_format(abs($net_profit), 2) . ')' : number_format($net_profit, 2) ?></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <?php $bootstrap->javascript(); ?>
</body>

</html>