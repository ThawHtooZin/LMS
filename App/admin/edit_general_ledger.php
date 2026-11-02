<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();

$voucherInput = $_GET['voucherno'] ?? $_POST['voucherno'] ?? '';
$voucher_no = is_string($voucherInput) ? trim($voucherInput) : '';
$errorMessage = '';
$saveSucceeded = false;

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['save_changes'])) {
    $result = $query->updateGeneralLedgerVoucher(
        $voucher_no,
        $_POST['journal_date'] ?? '',
        $_POST['lines'] ?? []
    );
    if ($result['status']) {
        $saveSucceeded = true;
    } else {
        $errorMessage = $result['message'];
    }
}

$ledgerRows = [];
if ($voucher_no !== '') {
    $voucherStmt = $pdo->prepare("
        SELECT id, date, voucherno, ac_code, debit, credit, narration
        FROM general_ledger
        WHERE voucherno = ?
        ORDER BY id
    ");
    $voucherStmt->execute([$voucher_no]);
    $ledgerRows = $voucherStmt->fetchAll(PDO::FETCH_ASSOC);
}

$currentMonth = date('Y-m');
$currentMonthStart = date('Y-m-01');
$currentMonthEnd = date('Y-m-t');
$transactionDate = $ledgerRows[0]['date'] ?? '';
$editable = count($ledgerRows) >= 2 && substr($transactionDate, 0, 7) === $currentMonth;
foreach ($ledgerRows as $row) {
    if ($row['date'] !== $transactionDate) {
        $editable = false;
        break;
    }
}

if ($voucher_no === '') {
    $errorMessage = 'Voucher number is required.';
} elseif (!$ledgerRows) {
    $errorMessage = 'No General Ledger rows were found for this voucher.';
} elseif (!$editable) {
    $errorMessage = 'Only complete vouchers dated in the current month can be edited.';
}

$formRows = $ledgerRows;
if (
    !$saveSucceeded &&
    $_SERVER['REQUEST_METHOD'] === 'POST' &&
    $editable &&
    isset($_POST['lines']) &&
    is_array($_POST['lines'])
) {
    $formRows = array_values(array_filter($_POST['lines'], 'is_array'));
    $postedDate = $_POST['journal_date'] ?? '';
    if (is_string($postedDate)) {
        $transactionDate = $postedDate;
    }
}

$accountsStmt = $pdo->query("SELECT code, name, type FROM accodes ORDER BY type ASC, code ASC");
$accounts = $accountsStmt->fetchAll(PDO::FETCH_ASSOC);
$groupedAccounts = [];
foreach ($accounts as $account) {
    $type = !empty($account['type']) ? $account['type'] : 'General Accounts';
    $groupedAccounts[$type][] = $account;
}

$accountOptions = '<option value="">Select account...</option>';
foreach ($groupedAccounts as $typeName => $typeAccounts) {
    $accountOptions .= '<optgroup label="' . htmlspecialchars($typeName, ENT_QUOTES, 'UTF-8') . '">';
    foreach ($typeAccounts as $account) {
        $accountOptions .= '<option value="' . htmlspecialchars($account['code'], ENT_QUOTES, 'UTF-8') . '">'
            . htmlspecialchars($account['code'], ENT_QUOTES, 'UTF-8') . ' - '
            . htmlspecialchars($account['name'], ENT_QUOTES, 'UTF-8')
            . '</option>';
    }
    $accountOptions .= '</optgroup>';
}
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <title>Edit General Ledger Voucher</title>
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

        .journal-table th {
            background-color: #f9fafb;
            font-size: 13px;
            font-weight: bold;
            color: #4b5563;
        }

        .journal-table td {
            padding: 8px 4px;
            border-bottom: 1px solid #e5e7eb;
        }

        .journal-table input,
        .journal-table select {
            border: 1px solid #d1d5db;
            border-radius: 4px;
            padding: 6px 10px;
            width: 100%;
            font-size: 14px;
        }

        .totals-row td {
            font-weight: bold;
            font-size: 16px;
            padding-top: 15px;
        }

        .remove-btn {
            color: #ef4444;
            cursor: pointer;
            background: none;
            border: none;
            font-size: 18px;
        }
    </style>
</head>

<body>
    <div class="row m-0">
        <div class="sidebarcol" id="sidebar"><?php include 'sidebar.php'; ?></div>
        <div class="contentcol" id="content">
            <?php require 'navbar.php'; ?>

            <div class="p-4">
                <h4 class="fw-bold mb-3">Edit General Ledger Voucher</h4>
                <?php if ($errorMessage !== ''): ?>
                    <div class="alert alert-danger"><?= htmlspecialchars($errorMessage, ENT_QUOTES, 'UTF-8'); ?></div>
                <?php endif; ?>

                <?php if ($editable): ?>
                    <div class="xero-card">
                        <form action="" method="POST" id="journalForm">
                            <input type="hidden" name="voucherno" value="<?= htmlspecialchars($voucher_no, ENT_QUOTES, 'UTF-8'); ?>">
                            <div class="row mb-4">
                                <div class="col-md-8">
                                    <label class="fw-bold small mb-1">Voucher No</label>
                                    <input type="text" class="form-control" value="<?= htmlspecialchars($voucher_no, ENT_QUOTES, 'UTF-8'); ?>" disabled>
                                </div>
                                <div class="col-md-4">
                                    <label class="fw-bold small mb-1">Date</label>
                                    <input type="date" name="journal_date" class="form-control"
                                        value="<?= htmlspecialchars($transactionDate, ENT_QUOTES, 'UTF-8'); ?>"
                                        min="<?= $currentMonthStart; ?>" max="<?= $currentMonthEnd; ?>" required>
                                </div>
                            </div>

                            <table class="table journal-table" id="journalTable">
                                <thead>
                                    <tr>
                                        <th width="35%">Description</th>
                                        <th width="30%">Account</th>
                                        <th width="15%" class="text-end">Debit</th>
                                        <th width="15%" class="text-end">Credit</th>
                                        <th width="5%"></th>
                                    </tr>
                                </thead>
                                <tbody id="journalBody">
                                    <?php foreach ($formRows as $index => $line): ?>
                                        <?php
                                        $lineId = $line['id'] ?? '';
                                        $lineDescription = $line['description'] ?? $line['narration'] ?? '';
                                        $lineAccountCode = $line['account_code'] ?? $line['ac_code'] ?? '';
                                        $lineDebit = $line['debit'] ?? '0.00';
                                        $lineCredit = $line['credit'] ?? '0.00';
                                        ?>
                                        <tr>
                                            <td>
                                                <?php if (is_scalar($lineId) && (string) $lineId !== ''): ?>
                                                    <input type="hidden" name="lines[<?= $index; ?>][id]" value="<?= htmlspecialchars((string) $lineId, ENT_QUOTES, 'UTF-8'); ?>">
                                                <?php endif; ?>
                                                <input type="text" name="lines[<?= $index; ?>][description]" value="<?= htmlspecialchars(is_scalar($lineDescription) ? (string) $lineDescription : '', ENT_QUOTES, 'UTF-8'); ?>">
                                            </td>
                                            <td>
                                                <select name="lines[<?= $index; ?>][account_code]" required>
                                                    <option value="">Select account...</option>
                                                    <?php foreach ($groupedAccounts as $typeName => $typeAccounts): ?>
                                                        <optgroup label="<?= htmlspecialchars($typeName, ENT_QUOTES, 'UTF-8'); ?>">
                                                            <?php foreach ($typeAccounts as $account): ?>
                                                                <option value="<?= htmlspecialchars($account['code'], ENT_QUOTES, 'UTF-8'); ?>" <?= is_scalar($lineAccountCode) && $account['code'] === (string) $lineAccountCode ? 'selected' : ''; ?>>
                                                                    <?= htmlspecialchars($account['code'], ENT_QUOTES, 'UTF-8'); ?> - <?= htmlspecialchars($account['name'], ENT_QUOTES, 'UTF-8'); ?>
                                                                </option>
                                                            <?php endforeach; ?>
                                                        </optgroup>
                                                    <?php endforeach; ?>
                                                </select>
                                            </td>
                                            <td><input type="number" step="0.01" min="0" name="lines[<?= $index; ?>][debit]" class="debit-input text-end" value="<?= htmlspecialchars(is_scalar($lineDebit) ? (string) $lineDebit : '0.00', ENT_QUOTES, 'UTF-8'); ?>"></td>
                                            <td><input type="number" step="0.01" min="0" name="lines[<?= $index; ?>][credit]" class="credit-input text-end" value="<?= htmlspecialchars(is_scalar($lineCredit) ? (string) $lineCredit : '0.00', ENT_QUOTES, 'UTF-8'); ?>"></td>
                                            <td class="text-center align-middle">
                                                <button type="button" class="remove-btn" aria-label="Remove line" onclick="this.closest('tr').remove(); calculateTotals();"><i class="bi bi-x-circle-fill"></i></button>
                                            </td>
                                        </tr>
                                    <?php endforeach; ?>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="5" class="border-0 pt-3">
                                            <button type="button" class="btn btn-outline-primary btn-sm fw-bold" onclick="addNewLine()">
                                                <i class="bi bi-plus-lg"></i> Add a new line
                                            </button>
                                        </td>
                                    </tr>
                                    <tr class="totals-row">
                                        <td colspan="2" class="text-end border-0">TOTAL</td>
                                        <td class="text-end border-top border-bottom border-dark" id="totalDebit">0.00</td>
                                        <td class="text-end border-top border-bottom border-dark" id="totalCredit">0.00</td>
                                        <td class="border-0"></td>
                                    </tr>
                                </tfoot>
                            </table>

                            <div class="d-flex justify-content-between mt-4">
                                <span></span>
                                <div>
                                    <a href="general_ledger.php?fullview=true" class="btn btn-light border fw-bold me-2">Cancel</a>
                                    <button type="submit" name="save_changes" value="1" class="btn btn-success fw-bold px-5">Save Changes</button>
                                </div>
                            </div>
                        </form>
                    </div>
                <?php endif; ?>
            </div>
        </div>
    </div>
    <?php $bootstrap->javascript(); ?>

    <?php if ($saveSucceeded): ?>
        <script>
            swal('Success!', 'General Ledger voucher updated successfully.', 'success').then(function() {
                window.location.href = 'general_ledger.php?fullview=true';
            });
        </script>
    <?php endif; ?>

    <?php if ($editable): ?>
        <script>
            let lineIndex = <?= count($formRows); ?>;
            const accountsOptions = <?= json_encode($accountOptions, JSON_HEX_TAG | JSON_HEX_APOS | JSON_HEX_QUOT | JSON_HEX_AMP); ?>;

            function addNewLine() {
                const tbody = document.getElementById('journalBody');
                const tr = document.createElement('tr');
                tr.innerHTML = `
                    <td><input type="text" name="lines[${lineIndex}][description]"></td>
                    <td><select name="lines[${lineIndex}][account_code]" required>${accountsOptions}</select></td>
                    <td><input type="number" step="0.01" min="0" name="lines[${lineIndex}][debit]" class="debit-input text-end" value="0.00"></td>
                    <td><input type="number" step="0.01" min="0" name="lines[${lineIndex}][credit]" class="credit-input text-end" value="0.00"></td>
                    <td class="text-center align-middle"><button type="button" class="remove-btn" aria-label="Remove line" onclick="this.closest('tr').remove(); calculateTotals();"><i class="bi bi-x-circle-fill"></i></button></td>
                `;
                tbody.appendChild(tr);
                lineIndex++;
                attachListeners();
            }

            function calculateTotals() {
                let totalDebit = 0;
                let totalCredit = 0;
                document.querySelectorAll('.debit-input').forEach(input => totalDebit += parseFloat(input.value) || 0);
                document.querySelectorAll('.credit-input').forEach(input => totalCredit += parseFloat(input.value) || 0);

                document.getElementById('totalDebit').innerText = totalDebit.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 });
                document.getElementById('totalCredit').innerText = totalCredit.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 });
                document.getElementById('totalDebit').dataset.total = totalDebit.toFixed(2);
                document.getElementById('totalCredit').dataset.total = totalCredit.toFixed(2);

                const color = (Math.round(totalDebit * 100) === Math.round(totalCredit * 100) && totalDebit > 0) ? '#15803d' : '#ef4444';
                document.getElementById('totalDebit').style.color = color;
                document.getElementById('totalCredit').style.color = color;
            }

            function attachListeners() {
                document.querySelectorAll('.debit-input, .credit-input').forEach(input => {
                    input.removeEventListener('input', calculateTotals);
                    input.addEventListener('input', calculateTotals);
                });
            }

            document.getElementById('journalForm').addEventListener('submit', function(event) {
                calculateTotals();
                const debit = parseFloat(document.getElementById('totalDebit').dataset.total);
                const credit = parseFloat(document.getElementById('totalCredit').dataset.total);
                const lineCount = document.querySelectorAll('#journalBody tr').length;
                if (lineCount < 2 || debit <= 0 || debit !== credit) {
                    event.preventDefault();
                    swal('Unable to Save', 'Enter at least two lines with equal debit and credit totals.', 'error');
                }
            });

            attachListeners();
            calculateTotals();
        </script>
    <?php endif; ?>
</body>

</html>
