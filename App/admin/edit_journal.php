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
$ledger_edit_mode = $voucher_no !== '' && (
    $_SERVER['REQUEST_METHOD'] !== 'POST' ||
    ($_POST['ledger_edit_mode'] ?? '') === '1'
);
$id = isset($_GET['id']) ? filter_var($_GET['id'], FILTER_VALIDATE_INT) : null;
$gl_edit_mode = ($_GET['mode'] ?? $_POST['mode'] ?? '') === 'gl';
if ($ledger_edit_mode && $_SERVER['REQUEST_METHOD'] !== 'POST') {
    $manualJournalStmt = $pdo->prepare("
        SELECT mjl.journal_id
        FROM general_ledger gl
        INNER JOIN manual_journal_lines mjl ON mjl.id = gl.manual_journal_line_id
        INNER JOIN manual_journals mj ON mj.id = mjl.journal_id
        WHERE gl.voucherno = ? AND mj.status = 'POSTED'
        LIMIT 1
    ");
    $manualJournalStmt->execute([$voucher_no]);
    $manualJournalId = $manualJournalStmt->fetchColumn();
    if ($manualJournalId !== false) {
        $id = (int) $manualJournalId;
        $gl_edit_mode = true;
        $ledger_edit_mode = false;
    } else {
        header('Location: general_ledger.php?fullview=true');
        exit;
    }
}
if (!$id && !$ledger_edit_mode) {
    header("Location: manual_journals.php");
    exit;
}

// Handle Form Submission (Self-contained, just like standard project forms)
if ($_SERVER['REQUEST_METHOD'] === 'POST' && ($ledger_edit_mode || isset($_POST['action']))) {
    if ($ledger_edit_mode) {
        $result = $query->updateGeneralLedgerVoucher(
            $voucher_no,
            $_POST['journal_date'] ?? '',
            $_POST['lines'] ?? []
        );
    } else {
        $result = $gl_edit_mode
            ? $query->updatePostedManualJournal(
                $_POST['journal_id'] ?? 0,
                $_POST['narration'] ?? '',
                $_POST['journal_date'] ?? '',
                $_POST['lines'] ?? [],
                $_POST['exchange_rate'] ?? null
            )
            : $query->updateManualJournal(
                $_POST['journal_id'] ?? 0,
                $_POST['narration'] ?? '',
                $_POST['journal_date'] ?? '',
                $_POST['action'],
                $_POST['lines'] ?? [],
                $_POST['exchange_rate'] ?? null
            );
    }

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

// Fetch Header
$journal = null;
$ledgerRows = [];
$transactionDate = '';
$editable = false;
$errorMessage = '';
$transaction_usd_rate = 0.0;
if ($ledger_edit_mode) {
    $voucherStmt = $pdo->prepare("
        SELECT id, date, voucherno, ac_code AS account_code, debit, credit,
               narration AS description, currency, manual_journal_line_id
        FROM general_ledger
        WHERE voucherno = ?
        ORDER BY id
    ");
    $voucherStmt->execute([$voucher_no]);
    $ledgerRows = $voucherStmt->fetchAll(PDO::FETCH_ASSOC);
    $transactionDate = $ledgerRows[0]['date'] ?? '';
    $editable = count($ledgerRows) >= 2 && substr($transactionDate, 0, 7) === date('Y-m');
    foreach ($ledgerRows as $row) {
        if ($row['date'] !== $transactionDate || $row['manual_journal_line_id'] !== null) {
            $editable = false;
        }
    }
    if ($voucher_no === '') {
        $errorMessage = 'Voucher number is required.';
    } elseif (!$ledgerRows) {
        $errorMessage = 'No General Ledger rows were found for this voucher.';
    } elseif (!$editable) {
        $errorMessage = 'Only complete, unlinked vouchers dated in the current month can be edited.';
    }
} else {
    $stmt = $pdo->prepare("SELECT * FROM manual_journals WHERE id = ?");
    $stmt->execute([$id]);
    $journal = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$journal) {
        header("Location: manual_journals.php");
        exit;
    }
}

$lines = [];
$usd_rate = '';
$has_gl_link = false;
if (!$ledger_edit_mode) {
    $lineStmt = $pdo->prepare("SELECT * FROM manual_journal_lines WHERE journal_id = ?");
    $lineStmt->execute([$id]);
    $lines = $lineStmt->fetchAll(PDO::FETCH_ASSOC);
    $rateStmt = $pdo->prepare("
        SELECT rate FROM exchange_rates
        WHERE currency_code = 'USD' AND effective_date <= ?
        ORDER BY effective_date DESC LIMIT 1
    ");
    $rateStmt->execute([$journal['journal_date']]);
    $configured_usd_rate = $rateStmt->fetchColumn();
    $usd_rate = $configured_usd_rate === false ? ($journal['usd_exchange_rate'] ?? '') : $configured_usd_rate;
    $transaction_usd_rate = is_numeric($usd_rate) ? (float) $usd_rate : 0.0;
}
if ($gl_edit_mode && !$ledger_edit_mode) {
    $linkStmt = $pdo->prepare("
        SELECT
            (SELECT COUNT(*) FROM manual_journal_lines WHERE journal_id = ?) AS line_count,
            (SELECT COUNT(*)
             FROM manual_journal_lines mjl
             INNER JOIN general_ledger gl ON gl.manual_journal_line_id = mjl.id
             WHERE mjl.journal_id = ? AND gl.voucherno = mjl.voucher_no) AS linked_count,
            (SELECT COUNT(*)
             FROM general_ledger gl
             WHERE gl.voucherno IN (SELECT voucher_no FROM manual_journal_lines WHERE journal_id = ?)
               AND (gl.manual_journal_line_id IS NULL
                    OR gl.manual_journal_line_id NOT IN (SELECT id FROM manual_journal_lines WHERE journal_id = ?))) AS extra_count
    ");
    $linkStmt->execute([$id, $id, $id, $id]);
    $linkCounts = $linkStmt->fetch(PDO::FETCH_ASSOC);
    $has_gl_link = (int) $linkCounts['line_count'] > 0
        && (int) $linkCounts['line_count'] === (int) $linkCounts['linked_count']
        && (int) $linkCounts['extra_count'] === 0;
}
$can_edit_posted_gl = $gl_edit_mode
    && $journal['status'] === 'POSTED'
    && $has_gl_link
    && substr($journal['journal_date'], 0, 7) === date('Y-m');

// Fetch accounts for dropdowns
$accStmt = $pdo->query("SELECT code, name, type FROM accodes ORDER BY type ASC, code ASC");
$accounts = $accStmt->fetchAll(PDO::FETCH_ASSOC);
$grouped_accounts = [];
foreach ($accounts as $acc) {
    $type = !empty($acc['type']) ? $acc['type'] : 'General Accounts';
    $grouped_accounts[$type][] = $acc;
}
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <title>Edit Journal</title>
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

        .status-badge-posted {
            background-color: #bbf7d0;
            color: #166534;
            padding: 5px 12px;
            border-radius: 4px;
            font-size: 13px;
            font-weight: bold;
            display: inline-block;
        }

        .status-badge-draft {
            background-color: #fef08a;
            color: #9a3412;
            padding: 5px 12px;
            border-radius: 4px;
            font-size: 13px;
            font-weight: bold;
            display: inline-block;
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

        .converted-amount {
            display: block;
            min-height: 1rem;
            color: #475569;
            font-size: 11px;
            white-space: nowrap;
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
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <div>
                        <a href="<?= $ledger_edit_mode ? 'general_ledger.php?fullview=true' : 'manual_journals.php' ?>" class="text-decoration-none small fw-bold text-secondary"><i class="bi bi-arrow-left"></i> Back</a>
                        <h4 class="fw-bold m-0 mt-1"><?= $ledger_edit_mode ? 'Edit Journal - ' . htmlspecialchars($voucher_no, ENT_QUOTES, 'UTF-8') : 'Edit Journal #' . (int) $journal['id'] ?></h4>
                    </div>
                    <div>
                        <?php if (!$ledger_edit_mode): ?>
                            <?php if ($journal['status'] === 'POSTED'): ?>
                                <span class="status-badge-posted"><i class="bi bi-check-circle-fill me-1"></i> Posted</span>
                            <?php else: ?>
                                <span class="status-badge-draft"><i class="bi bi-pencil-fill me-1"></i> Draft</span>
                            <?php endif; ?>
                        <?php endif; ?>
                    </div>
                </div>

                <div class="xero-card">
                    <?php if ($ledger_edit_mode && $editable): ?>
                        <form action="" method="POST" id="journalForm">
                            <input type="hidden" name="ledger_edit_mode" value="1">
                            <input type="hidden" name="voucherno" value="<?= htmlspecialchars($voucher_no, ENT_QUOTES, 'UTF-8') ?>">
                            <div class="row mb-4">
                                <div class="col-md-4">
                                    <label class="fw-bold small mb-1">Date</label>
                                    <input type="date" name="journal_date" id="ledgerJournalDate" class="form-control"
                                        value="<?= htmlspecialchars($transactionDate, ENT_QUOTES, 'UTF-8') ?>"
                                        min="<?= date('Y-m-01') ?>" max="<?= date('Y-m-t') ?>" required>
                                    <small class="text-muted" id="ledgerRateLabel">USD rate: <?= $transaction_usd_rate > 0 ? htmlspecialchars(number_format($transaction_usd_rate, 4, '.', ''), ENT_QUOTES, 'UTF-8') . ' MMK per USD' : 'not configured for this date' ?></small>
                                </div>
                            </div>

                            <table class="table journal-table" id="journalTable">
                                <thead>
                                    <tr>
                                        <th width="14%">Voucher No.</th>
                                        <th width="22%">Description</th>
                                        <th width="21%">Account</th>
                                        <th width="14%" class="text-end">Debit</th>
                                        <th width="14%" class="text-end">Credit</th>
                                        <th width="10%">Currency</th>
                                        <th width="5%"></th>
                                    </tr>
                                </thead>
                                <tbody id="journalBody">
                                    <?php foreach ($ledgerRows as $index => $line): ?>
                                        <?php $currency = $line['currency'] ?? 'MMK'; ?>
                                        <tr>
                                            <td>
                                                <input type="text" name="lines[<?= $index ?>][voucher_no]" value="<?= htmlspecialchars((string) $line['voucherno'], ENT_QUOTES, 'UTF-8') ?>" required>
                                            </td>
                                            <td>
                                                <input type="hidden" name="lines[<?= $index ?>][id]" value="<?= (int) $line['id'] ?>">
                                                <input type="text" name="lines[<?= $index ?>][description]" value="<?= htmlspecialchars((string) $line['description'], ENT_QUOTES, 'UTF-8') ?>">
                                            </td>
                                            <td>
                                                <select name="lines[<?= $index ?>][account_code]" required>
                                                    <option value="">Select account...</option>
                                                    <?php foreach ($grouped_accounts as $type_name => $type_accounts): ?>
                                                        <optgroup label="<?= htmlspecialchars($type_name, ENT_QUOTES, 'UTF-8') ?>">
                                                            <?php foreach ($type_accounts as $account): ?>
                                                                <option value="<?= htmlspecialchars($account['code'], ENT_QUOTES, 'UTF-8') ?>" <?= $account['code'] === $line['account_code'] ? 'selected' : '' ?>>
                                                                    <?= htmlspecialchars($account['code'] . ' - ' . $account['name'], ENT_QUOTES, 'UTF-8') ?>
                                                                </option>
                                                            <?php endforeach; ?>
                                                        </optgroup>
                                                    <?php endforeach; ?>
                                                </select>
                                            </td>
                                            <td>
                                                <input type="number" step="0.01" min="0" name="lines[<?= $index ?>][debit]" class="debit-input text-end" value="<?= htmlspecialchars((string) $line['debit'], ENT_QUOTES, 'UTF-8') ?>">
                                                <small class="debit-converted converted-amount"></small>
                                            </td>
                                            <td>
                                                <input type="number" step="0.01" min="0" name="lines[<?= $index ?>][credit]" class="credit-input text-end" value="<?= htmlspecialchars((string) $line['credit'], ENT_QUOTES, 'UTF-8') ?>">
                                                <small class="credit-converted converted-amount"></small>
                                            </td>
                                            <td>
                                                <select name="lines[<?= $index ?>][currency]" class="currency-select" required>
                                                    <option value="MMK" <?= $currency === 'MMK' ? 'selected' : '' ?>>MMK</option>
                                                    <option value="USD" <?= $currency === 'USD' ? 'selected' : '' ?>>USD</option>
                                                </select>
                                            </td>
                                            <td class="text-center align-middle">
                                                <button type="button" class="remove-btn" aria-label="Remove line" onclick="this.closest('tr').remove(); calculateTotals();"><i class="bi bi-x-circle-fill"></i></button>
                                            </td>
                                        </tr>
                                    <?php endforeach; ?>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="7" class="border-0 pt-3">
                                            <button type="button" class="btn btn-outline-primary btn-sm fw-bold" onclick="addNewLine()">Add a new line</button>
                                        </td>
                                    </tr>
                                    <tr class="totals-row">
                                        <td colspan="3" class="text-end border-0">TOTAL</td>
                                        <td class="text-end border-top border-bottom border-dark" id="totalDebit">0.00</td>
                                        <td class="text-end border-top border-bottom border-dark" id="totalCredit">0.00</td>
                                        <td colspan="2" class="border-0"></td>
                                    </tr>
                                </tfoot>
                            </table>
                            <div class="d-flex justify-content-between mt-4">
                                <a href="general_ledger.php?fullview=true" class="btn btn-light border fw-bold">Cancel</a>
                                <button type="submit" name="save_ledger_changes" value="1" class="btn btn-success fw-bold px-5">Save Journal</button>
                            </div>
                        </form>
                    <?php elseif ($ledger_edit_mode): ?>
                        <?php if ($errorMessage !== ''): ?>
                            <div class="alert alert-danger"><?= htmlspecialchars($errorMessage, ENT_QUOTES, 'UTF-8') ?></div>
                        <?php endif; ?>
                        <a href="general_ledger.php?fullview=true" class="btn btn-light border fw-bold">Back to General Ledger</a>
                    <?php elseif ($journal['status'] === 'POSTED' && !$can_edit_posted_gl): ?>
                        <!-- VIEW ONLY MODE -->
                        <div class="row mb-4 bg-light p-3 rounded">
                            <div class="col-md-6">
                                <span class="text-secondary small fw-bold d-block">Narration</span>
                                <span class="fw-bold fs-6 text-dark"><?= htmlspecialchars($journal['narration']) ?></span>
                            </div>
                            <div class="col-md-6 text-end">
                                <span class="text-secondary small fw-bold d-block">Date</span>
                                <span class="fw-bold fs-6 text-dark"><?= date('j M Y', strtotime($journal['journal_date'])) ?></span>
                            </div>
                        </div>

                        <table class="table align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>Voucher No.</th>
                                    <th>Description</th>
                                    <th>Account</th>
                                    <th class="text-end">Debit</th>
                                    <th class="text-end">Credit</th>
                                    <th>Currency</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $totals_by_currency = [];
                                foreach ($lines as $l):
                                    $currency = $l['currency'] ?? 'MMK';
                                    $lineDebit = (float) $l['debit'];
                                    $lineCredit = (float) $l['credit'];
                                    $lineDebitMmk = $currency === 'USD' && $transaction_usd_rate > 0
                                        ? round($lineDebit * $transaction_usd_rate, 2)
                                        : null;
                                    $lineCreditMmk = $currency === 'USD' && $transaction_usd_rate > 0
                                        ? round($lineCredit * $transaction_usd_rate, 2)
                                        : null;
                                    if (!isset($totals_by_currency[$currency])) {
                                        $totals_by_currency[$currency] = ['debit' => 0, 'credit' => 0, 'debit_mmk' => 0, 'credit_mmk' => 0];
                                    }
                                    $totals_by_currency[$currency]['debit'] += $lineDebit;
                                    $totals_by_currency[$currency]['credit'] += $lineCredit;
                                    if ($lineDebitMmk !== null && $lineCreditMmk !== null) {
                                        $totals_by_currency[$currency]['debit_mmk'] += $lineDebitMmk;
                                        $totals_by_currency[$currency]['credit_mmk'] += $lineCreditMmk;
                                    }
                                    $acc_info = $query->select('accodes', $l['account_code'], 'code');
                                    $acc_display = $l['account_code'] . ' - ' . ($acc_info['name'] ?? '');
                                ?>
                                    <tr>
                                        <td><?= htmlspecialchars((string) ($l['voucher_no'] ?? '')) ?></td>
                                        <td><?= htmlspecialchars($l['description']) ?></td>
                                        <td><?= htmlspecialchars($acc_display) ?></td>
                                        <td class="text-end">
                                            <?= format_lms_amount($lineDebit) ?>
                                            <?php if ($lineDebitMmk !== null): ?><small class="converted-amount">MMK <?= format_lms_amount($lineDebitMmk) ?> at transaction-date rate</small><?php endif; ?>
                                        </td>
                                        <td class="text-end">
                                            <?= format_lms_amount($lineCredit) ?>
                                            <?php if ($lineCreditMmk !== null): ?><small class="converted-amount">MMK <?= format_lms_amount($lineCreditMmk) ?> at transaction-date rate</small><?php endif; ?>
                                        </td>
                                        <td><?= htmlspecialchars($currency) ?></td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                            <tfoot>
                                <tr class="fw-bold border-top border-dark">
                                    <td colspan="3" class="text-end">TOTAL BY CURRENCY</td>
                                    <td colspan="3">
                                        <?php foreach ($totals_by_currency as $currency => $totals): ?>
                                            <?= htmlspecialchars($currency) ?>:
                                            Dr <?= format_lms_amount($totals['debit']) ?> /
                                            Cr <?= format_lms_amount($totals['credit']) ?><br>
                                            <?php if ($currency === 'USD' && $transaction_usd_rate > 0): ?>
                                                MMK equivalent: Dr <?= format_lms_amount($totals['debit_mmk']) ?> /
                                                Cr <?= format_lms_amount($totals['credit_mmk']) ?><br>
                                            <?php endif; ?>
                                        <?php endforeach; ?>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                        <div class="mt-4">
                            <a href="manual_journals.php" class="btn btn-secondary btn-sm fw-bold px-4">Back</a>
                        </div>

                    <?php else: ?>
                        <!-- Draft editing and linked General Ledger editing use the same journal form. -->
                        <form action="" method="POST" id="journalForm">
                            <input type="hidden" name="journal_id" value="<?= $journal['id'] ?>">
                            <?php if ($gl_edit_mode): ?>
                                <input type="hidden" name="mode" value="gl">
                            <?php endif; ?>

                            <div class="row mb-4 align-items-start">
                                <div class="col-md-9">
                                    <label class="fw-bold small mb-1">Narration</label>
                                    <textarea name="narration" class="form-control" rows="2" required><?= htmlspecialchars($journal['narration']) ?></textarea>
                                </div>
                                <div class="col-md-3 d-flex flex-column align-items-end gap-1">
                                    <div class="journal-header-field">
                                        <label class="fw-bold small mb-1">Date</label>
                                        <input type="date" name="journal_date" id="journalDate" class="form-control" value="<?= $journal['journal_date'] ?>" required>
                                    </div>
                                    <div class="journal-header-field">
                                        <label class="fw-bold small mb-1">USD Exchange Rate</label>
                                        <input type="number" step="0.0001" min="0.0001" name="exchange_rate" id="exchangeRate" class="form-control" value="<?= htmlspecialchars((string) $usd_rate, ENT_QUOTES, 'UTF-8') ?>">
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
                                    <?php foreach ($lines as $index => $l): ?>
                                        <?php
                                        $currency = $l['currency'] ?? 'MMK';
                                        $debitMmk = $currency === 'USD' && $transaction_usd_rate > 0
                                            ? round((float) $l['debit'] * $transaction_usd_rate, 2)
                                            : ($l['debit_mmk'] !== null ? (float) $l['debit_mmk'] : (float) $l['debit']);
                                        $creditMmk = $currency === 'USD' && $transaction_usd_rate > 0
                                            ? round((float) $l['credit'] * $transaction_usd_rate, 2)
                                            : ($l['credit_mmk'] !== null ? (float) $l['credit_mmk'] : (float) $l['credit']);
                                        ?>
                                        <tr>
                                            <td><input type="text" name="lines[<?= $index ?>][voucher_no]" value="<?= htmlspecialchars((string) ($l['voucher_no'] ?? ''), ENT_QUOTES, 'UTF-8') ?>" required></td>
                                            <td><input type="text" name="lines[<?= $index ?>][description]" value="<?= htmlspecialchars((string) $l['description'], ENT_QUOTES, 'UTF-8') ?>"></td>
                                            <td>
                                                <select name="lines[<?= $index ?>][account_code]" required>
                                                    <option value="">Select account...</option>
                                                    <?php foreach ($grouped_accounts as $type_name => $type_accounts): ?>
                                                        <optgroup label="<?= htmlspecialchars($type_name) ?>">
                                                            <?php foreach ($type_accounts as $acc): ?>
                                                                <option value="<?= $acc['code'] ?>" <?= $acc['code'] == $l['account_code'] ? 'selected' : '' ?>>
                                                                    <?= $acc['code'] ?> - <?= htmlspecialchars($acc['name']) ?>
                                                                </option>
                                                            <?php endforeach; ?>
                                                        </optgroup>
                                                    <?php endforeach; ?>
                                                </select>
                                            </td>
                                            <td>
                                                <input type="number" step="0.01" min="0" name="lines[<?= $index ?>][debit]" class="debit-input text-end" value="<?= number_format($debitMmk, 2, '.', '') ?>">
                                                <small class="debit-converted converted-amount"></small>
                                            </td>
                                            <td>
                                                <input type="number" step="0.01" min="0" name="lines[<?= $index ?>][credit]" class="credit-input text-end" value="<?= number_format($creditMmk, 2, '.', '') ?>">
                                                <small class="credit-converted converted-amount"></small>
                                            </td>
                                            <td>
                                                <select name="lines[<?= $index ?>][currency]" class="currency-select">
                                                    <option value="MMK" <?= ($l['currency'] ?? 'MMK') === 'MMK' ? 'selected' : '' ?>>MMK</option>
                                                    <option value="USD" <?= ($l['currency'] ?? 'MMK') === 'USD' ? 'selected' : '' ?>>USD</option>
                                                </select>
                                            </td>
                                            <td class="text-center align-middle"><button type="button" class="remove-btn" onclick="this.closest('tr').remove(); calculateTotals();"><i class="bi bi-x-circle-fill"></i></button></td>
                                        </tr>
                                    <?php endforeach; ?>
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
                                            <h4>Debit</h4>
                                            <div id="totalDebit">0.00</div>
                                            <small class="posted-total" id="totalDebitPosted"></small>
                                        </td>
                                        <td class="text-end border-top border-bottom border-dark">
                                            <h4>Credit</h4>
                                            <div id="totalCredit">0.00</div>
                                            <small class="posted-total" id="totalCreditPosted"></small>
                                        </td>
                                        <td colspan="2" class="border-0"></td>
                                    </tr>
                                </tfoot>
                            </table>

                            <div class="d-flex justify-content-between mt-4">
                                <?php if (!$can_edit_posted_gl): ?>
                                    <button type="submit" name="action" value="draft" class="btn btn-secondary fw-bold px-4">Update draft</button>
                                <?php endif; ?>
                                <div>
                                    <a href="manual_journals.php" class="btn btn-light border fw-bold me-2">Cancel</a>
                                    <button type="submit" name="action" value="post" class="btn btn-success fw-bold px-5"><?= $can_edit_posted_gl ? 'Save Journal' : 'Post to Ledger' ?></button>
                                </div>
                            </div>
                        </form>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
    <?php $bootstrap->javascript(); ?>

    <script>
        const ledgerEditMode = <?= $ledger_edit_mode ? 'true' : 'false' ?>;
        let ledgerUsdRate = <?= json_encode($transaction_usd_rate) ?>;
        let lineIndex = <?= $ledger_edit_mode ? count($ledgerRows) : count($lines) ?>;
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
            if (ledgerEditMode) {
                tr.innerHTML = `
                    <td><input type="text" name="lines[${lineIndex}][voucher_no]" required></td>
                    <td><input type="text" name="lines[${lineIndex}][description]"></td>
                    <td><select name="lines[${lineIndex}][account_code]" required>${accountsOptions}</select></td>
                    <td><input type="number" step="0.01" min="0" name="lines[${lineIndex}][debit]" class="debit-input text-end" value="0.00"><small class="debit-converted converted-amount"></small></td>
                    <td><input type="number" step="0.01" min="0" name="lines[${lineIndex}][credit]" class="credit-input text-end" value="0.00"><small class="credit-converted converted-amount"></small></td>
                    <td><select name="lines[${lineIndex}][currency]" class="currency-select" required><option value="MMK" selected>MMK</option><option value="USD">USD</option></select></td>
                    <td class="text-center align-middle"><button type="button" class="remove-btn" aria-label="Remove line" onclick="this.closest('tr').remove(); calculateTotals();"><i class="bi bi-x-circle-fill"></i></button></td>
                `;
                tbody.appendChild(tr);
                lineIndex++;
                attachListeners();
                calculateTotals();
                return;
            }
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
            if (ledgerEditMode) {
                let debitTotalMmk = 0;
                let creditTotalMmk = 0;
                let missingUsdRate = false;
                let balanced = true;
                const voucherTotals = {};
                document.querySelectorAll('#journalBody tr').forEach(row => {
                    const debit = parseFloat(row.querySelector('.debit-input').value) || 0;
                    const credit = parseFloat(row.querySelector('.credit-input').value) || 0;
                    const voucher = row.querySelector('[name$="[voucher_no]"]').value.trim();
                    const isUsd = row.querySelector('.currency-select').value === 'USD';
                    const rate = isUsd ? ledgerUsdRate : 1;
                    if (isUsd && rate <= 0 && (debit > 0 || credit > 0)) missingUsdRate = true;
                    const debitMmk = Math.round(debit * rate * 100) / 100;
                    const creditMmk = Math.round(credit * rate * 100) / 100;
                    debitTotalMmk += debitMmk;
                    creditTotalMmk += creditMmk;
                    if (voucher) {
                        if (!voucherTotals[voucher]) voucherTotals[voucher] = { debit: 0, credit: 0, count: 0 };
                        voucherTotals[voucher].debit += debitMmk;
                        voucherTotals[voucher].credit += creditMmk;
                        if (debit > 0 || credit > 0) voucherTotals[voucher].count++;
                    }
                    updateLedgerConvertedAmount(row, '.debit-input', '.debit-converted', rate);
                    updateLedgerConvertedAmount(row, '.credit-input', '.credit-converted', rate);
                });
                Object.values(voucherTotals).forEach(group => {
                    if (group.count < 2 || Math.round(group.debit * 100) !== Math.round(group.credit * 100) || group.debit <= 0) {
                        balanced = false;
                    }
                });
                document.getElementById('totalDebit').textContent = `MMK ${debitTotalMmk.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 })}`;
                document.getElementById('totalCredit').textContent = `MMK ${creditTotalMmk.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 })}`;
                balanced = balanced && !missingUsdRate && debitTotalMmk > 0;
                const color = balanced ? '#15803d' : '#ef4444';
                document.getElementById('totalDebit').style.color = color;
                document.getElementById('totalCredit').style.color = color;
                return balanced;
            }
            const voucherTotals = {};
            const totals = {
                debit: 0,
                credit: 0,
                postedDebit: {},
                postedCredit: {},
                rateMissing: false,
                hasAmount: false
            };
            document.querySelectorAll('#journalBody tr').forEach(row => {
                const voucher = row.querySelector('[name$="[voucher_no]"]').value.trim();
                if (voucher && !voucherTotals[voucher]) {
                    voucherTotals[voucher] = {
                        debit: 0,
                        credit: 0,
                        count: 0
                    };
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

            document.getElementById('totalDebit').textContent = totals.debit.toLocaleString(undefined, {
                minimumFractionDigits: 2,
                maximumFractionDigits: 2
            });
            document.getElementById('totalCredit').textContent = totals.credit.toLocaleString(undefined, {
                minimumFractionDigits: 2,
                maximumFractionDigits: 2
            });
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
                preview.textContent = rate > 0 ?
                    `= USD ${(inputAmount / rate).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 })}` :
                    '= USD rate required';
                return;
            }
            preview.textContent = `= MMK ${inputAmount.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 })}`;
        }

        function updateLedgerConvertedAmount(row, inputSelector, previewSelector, rate) {
            const amount = parseFloat(row.querySelector(inputSelector).value) || 0;
            const preview = row.querySelector(previewSelector);
            if (amount <= 0) {
                preview.textContent = '';
            } else if (row.querySelector('.currency-select').value === 'USD') {
                preview.textContent = rate > 0
                    ? `= MMK ${(amount * rate).toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 })}`
                    : '= Transaction-date USD rate unavailable';
            } else {
                preview.textContent = `= MMK ${amount.toLocaleString(undefined, { minimumFractionDigits: 2, maximumFractionDigits: 2 })}`;
            }
        }

        function attachListeners() {
            document.querySelectorAll('.debit-input, .credit-input, .currency-select, #exchangeRate, [name$="[voucher_no]"]').forEach(input => {
                input.removeEventListener('input', calculateTotals);
                input.removeEventListener('change', calculateTotals);
                input.addEventListener('input', calculateTotals);
                input.addEventListener('change', calculateTotals);
            });
        }

        const form = document.getElementById('journalForm');
        if (form && ledgerEditMode) {
            form.addEventListener('submit', function(event) {
                if (!calculateTotals()) {
                    event.preventDefault();
                    swal('Invalid voucher totals', 'Each voucher must have at least two amount-bearing rows and balance in MMK.', 'error');
                }
            });
        }
        if (form && !ledgerEditMode) {
            form.addEventListener('submit', function(e) {
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
            calculateTotals();
            attachListeners();
        }
        if (ledgerEditMode) {
            const journalDateInput = document.getElementById('ledgerJournalDate');
            journalDateInput.addEventListener('change', async function() {
                try {
                    const response = await fetch(`manual_journal_rate.php?date=${encodeURIComponent(this.value)}`);
                    if (!response.ok) throw new Error('Rate lookup failed.');
                    const result = await response.json();
                    if (result.rate === null) {
                        ledgerUsdRate = 0;
                        document.getElementById('ledgerRateLabel').textContent = 'USD rate: not configured for this date';
                        calculateTotals();
                        swal('Rate unavailable', 'No USD rate is configured for this transaction date.', 'error');
                        return;
                    }
                    ledgerUsdRate = Number(result.rate);
                    document.getElementById('ledgerRateLabel').textContent = `USD rate: ${ledgerUsdRate.toFixed(4)} MMK per USD`;
                    calculateTotals();
                } catch (error) {
                    console.error(error);
                    swal('Rate unavailable', 'Could not load the USD rate for this transaction date.', 'error');
                }
            });
            attachListeners();
            calculateTotals();
        }
        const journalDateInput = document.getElementById('journalDate');
        if (journalDateInput) {
            journalDateInput.addEventListener('change', async function() {
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
        }
    </script>
</body>

</html>