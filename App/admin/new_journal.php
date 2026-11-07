<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();

// Handle Form Submission directly inside the file
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action'])) {
    $result = $query->saveManualJournal(
        $_POST['narration'] ?? '',
        $_POST['journal_date'] ?? '',
        $_POST['action'],
        $_POST['lines'] ?? [],
        $_POST['exchange_rate'] ?? null
    );

    echo "<!DOCTYPE html><html lang='en'><head><title>Processing...</title>";
    $bootstrap->css();
    $bootstrap->javascript();
    echo "</head><body>";

    if ($result['status']) {
        $msg = addslashes($result['message']);
        echo "<script>
            $(document).ready(function() {
                swal('Success!', '$msg', 'success').then(function() {
                    window.location.href = 'manual_journals.php';
                });
            });
        </script>";
    } else {
        $error = addslashes($result['message']);
        echo "<script>
            $(document).ready(function() {
                swal('Error!', '$error', 'error').then(function() {
                    window.history.back();
                });
            });
        </script>";
    }
    echo "</body></html>";
    exit;
}

// Fetch all active accounts grouped by type
$stmt = $pdo->query("SELECT code, name, type FROM accodes ORDER BY type ASC, code ASC");
$accounts = $stmt->fetchAll(PDO::FETCH_ASSOC);
$grouped_accounts = [];
foreach ($accounts as $acc) {
    $type = !empty($acc['type']) ? $acc['type'] : 'General Accounts';
    $grouped_accounts[$type][] = $acc;
}
$rateStmt = $pdo->prepare("
    SELECT rate FROM exchange_rates
    WHERE currency_code = 'USD' AND effective_date <= ?
    ORDER BY effective_date DESC LIMIT 1
");
$rateStmt->execute([date('Y-m-d')]);
$usd_rate = $rateStmt->fetchColumn();
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <title>New Manual Journal</title>
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

        .journal-table input:focus,
        .journal-table select:focus {
            outline: none;
            border-color: #3b82f6;
        }

        .converted-amount {
            display: block;
            min-height: 1rem;
            color: #475569;
            font-size: 11px;
            white-space: nowrap;
        }

        .posted-total {
            display: block;
            color: #475569;
            font-size: 11px;
            font-weight: normal;
            white-space: normal;
            overflow-wrap: anywhere;
        }

        .journal-header-field {
            width: 80%;
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
                <h4 class="fw-bold mb-3">New Manual Journal</h4>
                <div class="alert alert-warning py-2 small fw-bold">
                    <i class="bi bi-info-circle-fill me-2"></i> We recommend that only your accountant or bookkeeper create journals.
                </div>

                <div class="xero-card">
                    <form action="" method="POST" id="journalForm">
                        <div class="row mb-4 align-items-start">
                            <div class="col-md-9">
                                <label class="fw-bold small mb-1">Narration</label>
                                <textarea name="narration" class="form-control" rows="2" required placeholder="Reason for adjustment..."></textarea>
                            </div>
                            <div class="col-md-3 d-flex flex-column align-items-end gap-1">
                                <div class="journal-header-field">
                                    <label class="fw-bold small mb-1">Date</label>
                                    <input type="date" name="journal_date" id="journalDate" class="form-control" value="<?= date('Y-m-d') ?>" required>
                                </div>
                                <div class="journal-header-field">
                                    <label class="fw-bold small mb-1">USD Exchange Rate</label>
                                    <input type="number" step="0.0001" min="0.0001" name="exchange_rate" id="exchangeRate" class="form-control" value="<?= htmlspecialchars((string) ($usd_rate === false ? '' : $usd_rate), ENT_QUOTES, 'UTF-8') ?>">
                                </div>
                            </div>
                        </div>

                        <table class="table journal-table" id="journalTable">
                            <thead>
                                <tr>
                                    <th width="14%">Voucher No.</th>
                                    <th width="22%">Description</th>
                                    <th width="21%">Account</th>
                                    <th width="14%" class="text-end">Debit (MMK)</th>
                                    <th width="14%" class="text-end">Credit (MMK)</th>
                                    <th width="10%">Currency</th>
                                    <th width="5%"></th>
                                </tr>
                            </thead>
                            <tbody id="journalBody">
                                <tr>
                                    <td><input type="text" name="lines[0][voucher_no]" required></td>
                                    <td><input type="text" name="lines[0][description]"></td>
                                    <td>
                                        <select name="lines[0][account_code]" required>
                                            <option value="">Select account...</option>
                                            <?php foreach ($grouped_accounts as $type_name => $type_accounts): ?>
                                                <optgroup label="<?= htmlspecialchars($type_name) ?>">
                                                    <?php foreach ($type_accounts as $acc): ?>
                                                        <option value="<?= $acc['code'] ?>"><?= $acc['code'] ?> - <?= htmlspecialchars($acc['name']) ?></option>
                                                    <?php endforeach; ?>
                                                </optgroup>
                                            <?php endforeach; ?>
                                        </select>
                                    </td>
                                    <td>
                                        <input type="number" step="0.01" min="0" name="lines[0][debit]" class="debit-input text-end" value="0.00">
                                        <small class="debit-converted converted-amount"></small>
                                    </td>
                                    <td>
                                        <input type="number" step="0.01" min="0" name="lines[0][credit]" class="credit-input text-end" value="0.00">
                                        <small class="credit-converted converted-amount"></small>
                                    </td>
                                    <td>
                                        <select name="lines[0][currency]" class="currency-select">
                                            <option value="MMK" selected>MMK</option>
                                            <option value="USD">USD</option>
                                        </select>
                                    </td>
                                    <td class="text-center"></td>
                                </tr>
                                <tr>
                                    <td><input type="text" name="lines[1][voucher_no]" required></td>
                                    <td><input type="text" name="lines[1][description]"></td>
                                    <td>
                                        <select name="lines[1][account_code]" required>
                                            <option value="">Select account...</option>
                                            <?php foreach ($grouped_accounts as $type_name => $type_accounts): ?>
                                                <optgroup label="<?= htmlspecialchars($type_name) ?>">
                                                    <?php foreach ($type_accounts as $acc): ?>
                                                        <option value="<?= $acc['code'] ?>"><?= $acc['code'] ?> - <?= htmlspecialchars($acc['name']) ?></option>
                                                    <?php endforeach; ?>
                                                </optgroup>
                                            <?php endforeach; ?>
                                        </select>
                                    </td>
                                    <td>
                                        <input type="number" step="0.01" min="0" name="lines[1][debit]" class="debit-input text-end" value="0.00">
                                        <small class="debit-converted converted-amount"></small>
                                    </td>
                                    <td>
                                        <input type="number" step="0.01" min="0" name="lines[1][credit]" class="credit-input text-end" value="0.00">
                                        <small class="credit-converted converted-amount"></small>
                                    </td>
                                    <td>
                                        <select name="lines[1][currency]" class="currency-select">
                                            <option value="MMK" selected>MMK</option>
                                            <option value="USD">USD</option>
                                        </select>
                                    </td>
                                    <td class="text-center"></td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="7" class="border-0 pt-3">
                                        <button type="button" class="btn btn-outline-primary btn-sm fw-bold" onclick="addNewLine()">
                                            <i class="bi bi-plus-lg"></i> Add a new line
                                        </button>
                                    </td>
                                </tr>
                                <tr class="totals-row">
                                    <td colspan="3" class="text-end border-0">TOTAL (MMK INPUT)</td>
                                    <td class="text-end border-top border-bottom border-dark">
                                        <div id="totalDebit">0.00</div>
                                        <small class="posted-total" id="totalDebitPosted"></small>
                                    </td>
                                    <td class="text-end border-top border-bottom border-dark">
                                        <div id="totalCredit">0.00</div>
                                        <small class="posted-total" id="totalCreditPosted"></small>
                                    </td>
                                    <td colspan="2" class="border-0"></td>
                                </tr>
                            </tfoot>
                        </table>

                        <div class="d-flex justify-content-between mt-4">
                            <button type="submit" name="action" value="draft" class="btn btn-secondary fw-bold px-4">Save as draft</button>
                            <div>
                                <a href="manual_journals.php" class="btn btn-light border fw-bold me-2">Cancel</a>
                                <button type="submit" name="action" value="post" class="btn btn-success fw-bold px-5">Post</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <?php $bootstrap->javascript(); ?>

    <script>
        let lineIndex = 2;
        const accountsOptions = `
            <option value="">Select account...</option>
            <?php foreach ($grouped_accounts as $type_name => $type_accounts): ?>
                <optgroup label="<?= htmlspecialchars($type_name) ?>">
                    <?php foreach ($type_accounts as $acc): ?>
                        <option value="<?= $acc['code'] ?>"><?= $acc['code'] ?> - <?= addslashes(htmlspecialchars($acc['name'])) ?></option>
                    <?php endforeach; ?>
                </optgroup>
            <?php endforeach; ?>
        `;

        function addNewLine() {
            const tbody = document.getElementById('journalBody');
            const tr = document.createElement('tr');
            tr.innerHTML = `
                <td><input type="text" name="lines[${lineIndex}][voucher_no]" required></td>
                <td><input type="text" name="lines[${lineIndex}][description]"></td>
                <td><select name="lines[${lineIndex}][account_code]" required>${accountsOptions}</select></td>
                <td>
                    <input type="number" step="0.01" min="0" name="lines[${lineIndex}][debit]" class="debit-input text-end" value="0.00">
                    <small class="debit-converted converted-amount"></small>
                </td>
                <td>
                    <input type="number" step="0.01" min="0" name="lines[${lineIndex}][credit]" class="credit-input text-end" value="0.00">
                    <small class="credit-converted converted-amount"></small>
                </td>
                <td>
                    <select name="lines[${lineIndex}][currency]" class="currency-select">
                        <option value="MMK" selected>MMK</option>
                        <option value="USD">USD</option>
                    </select>
                </td>
                <td class="text-center align-middle"><button type="button" class="remove-btn" onclick="this.closest('tr').remove(); calculateTotals();"><i class="bi bi-x-circle-fill"></i></button></td>
            `;
            tbody.appendChild(tr);
            lineIndex++;
            attachListeners();
            calculateTotals();
        }

        function calculateTotals() {
            const voucherTotals = {};
            const totals = { debit: 0, credit: 0, postedDebit: {}, postedCredit: {}, rateMissing: false, hasAmount: false };
            document.querySelectorAll('#journalBody tr').forEach(row => {
                const voucher = row.querySelector('[name$="[voucher_no]"]').value.trim();
                if (voucher && !voucherTotals[voucher]) {
                    voucherTotals[voucher] = { debit: 0, credit: 0, count: 0 };
                }
                const debit = parseFloat(row.querySelector('.debit-input').value) || 0;
                const credit = parseFloat(row.querySelector('.credit-input').value) || 0;
                const currency = row.querySelector('.currency-select').value;
                const rate = parseFloat(document.getElementById('exchangeRate').value) || 0;
                totals.debit += debit;
                totals.credit += credit;
                if (voucher) {
                    voucherTotals[voucher].debit += debit;
                    voucherTotals[voucher].credit += credit;
                    if (debit > 0 || credit > 0) voucherTotals[voucher].count++;
                }
                if (currency !== 'USD' || rate > 0) {
                    const divisor = currency === 'USD' ? rate : 1;
                    totals.postedDebit[currency] = (totals.postedDebit[currency] || 0) + Math.round((debit / divisor) * 100) / 100;
                    totals.postedCredit[currency] = (totals.postedCredit[currency] || 0) + Math.round((credit / divisor) * 100) / 100;
                } else if (debit > 0 || credit > 0) {
                    totals.rateMissing = true;
                }
                if (debit > 0 || credit > 0) totals.hasAmount = true;
                updateConvertedAmount(row, '.debit-input', '.debit-converted');
                updateConvertedAmount(row, '.credit-input', '.credit-converted');
            });

            let balanced = true;
            Object.values(voucherTotals).forEach(group => {
                if (group.count < 2 || Math.round(group.debit * 100) !== Math.round(group.credit * 100)) balanced = false;
            });

            document.getElementById('totalDebit').textContent = totals.debit.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 });
            document.getElementById('totalCredit').textContent = totals.credit.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 });
            document.getElementById('totalDebitPosted').textContent = formatCurrencyTotals(totals.postedDebit, totals.rateMissing);
            document.getElementById('totalCreditPosted').textContent = formatCurrencyTotals(totals.postedCredit, totals.rateMissing);

            const color = balanced && totals.hasAmount ? '#15803d' : '#ef4444';
            document.getElementById('totalDebit').style.color = color;
            document.getElementById('totalCredit').style.color = color;
            return balanced && totals.hasAmount;
        }

        function formatCurrencyTotals(totals, rateMissing) {
            const entries = Object.keys(totals).sort().map(currency =>
                `${currency} ${totals[currency].toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 })}`
            );
            if (rateMissing) entries.push('USD rate required');
            const summary = entries.join(', ');
            return summary ? `Posted: ${summary}` : (rateMissing ? 'USD rate required' : '');
        }

        function updateConvertedAmount(row, inputSelector, previewSelector) {
            const inputAmount = parseFloat(row.querySelector(inputSelector).value) || 0;
            const currency = row.querySelector('.currency-select').value;
            const rate = parseFloat(document.getElementById('exchangeRate').value) || 0;
            const preview = row.querySelector(previewSelector);
            if (inputAmount <= 0) {
                preview.textContent = '';
                return;
            }
            if (currency === 'USD') {
                preview.textContent = rate > 0
                    ? `= USD ${(inputAmount / rate).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 })}`
                    : '= USD rate required';
                return;
            }
            preview.textContent = `= MMK ${inputAmount.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 })}`;
        }

        function attachListeners() {
            document.querySelectorAll('.debit-input, .credit-input, .currency-select, #exchangeRate, [name$="[voucher_no]"]').forEach(input => {
                input.removeEventListener('input', calculateTotals);
                input.removeEventListener('change', calculateTotals);
                input.addEventListener('input', calculateTotals);
                input.addEventListener('change', calculateTotals);
            });
        }

        document.getElementById('journalForm').addEventListener('submit', function(e) {
            const action = e.submitter.value;
            const hasUsdAmount = Array.from(document.querySelectorAll('#journalBody tr')).some(row =>
                row.querySelector('.currency-select').value === 'USD' &&
                ((parseFloat(row.querySelector('.debit-input').value) || 0) > 0 ||
                 (parseFloat(row.querySelector('.credit-input').value) || 0) > 0)
            );
            const rate = parseFloat(document.getElementById('exchangeRate').value) || 0;
            if (hasUsdAmount && rate <= 0) {
                e.preventDefault();
                swal('Exchange rate required', 'Enter a positive MMK-per-USD rate for the journal date.', 'error');
                return false;
            }
            const groups = {};
            document.querySelectorAll('#journalBody tr').forEach(row => {
                const voucher = row.querySelector('[name$="[voucher_no]"]').value.trim();
                if (!voucher) return;
                if (!groups[voucher]) groups[voucher] = 0;
                if ((parseFloat(row.querySelector('.debit-input').value) || 0) > 0 ||
                    (parseFloat(row.querySelector('.credit-input').value) || 0) > 0) groups[voucher]++;
            });
            if (Object.values(groups).some(count => count < 2)) {
                e.preventDefault();
                swal('Invalid voucher groups', 'Each voucher number must be used on at least two amount-bearing rows.', 'error');
                return false;
            }
            if (action === 'post') {
                if (!calculateTotals()) {
                    e.preventDefault();
                    swal('Imbalance Detected', 'Each voucher must contain at least two rows and balance its debit and credit totals in MMK.', 'error');
                    return false;
                }
            }
        });

        document.getElementById('journalDate').addEventListener('change', async function() {
            try {
                const response = await fetch(`manual_journal_rate.php?date=${encodeURIComponent(this.value)}`);
                if (!response.ok) throw new Error('Rate lookup failed.');
                const result = await response.json();
                document.getElementById('exchangeRate').value = result.rate ?? '';
                calculateTotals();
            } catch (error) {
                console.error(error);
                swal('Rate unavailable', 'Could not load the USD rate for this date. Enter the rate manually.', 'error');
            }
        });

        attachListeners();
        calculateTotals();
    </script>
</body>

</html>