<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();

$id = $_GET['id'] ?? null;
if (!$id) {
    header("Location: manual_journals.php");
    exit;
}

// Handle Form Submission (Self-contained, just like standard project forms)
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action'])) {
    $result = $query->updateManualJournal($_POST['journal_id'], $_POST['narration'], $_POST['journal_date'], $_POST['action'], $_POST['lines'] ?? []);

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
$stmt = $pdo->prepare("SELECT * FROM manual_journals WHERE id = ?");
$stmt->execute([$id]);
$journal = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$journal) {
    header("Location: manual_journals.php");
    exit;
}

// Fetch Lines
$lineStmt = $pdo->prepare("SELECT * FROM manual_journal_lines WHERE journal_id = ?");
$lineStmt->execute([$id]);
$lines = $lineStmt->fetchAll(PDO::FETCH_ASSOC);

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
    <title><?= $journal['status'] === 'POSTED' ? 'View' : 'Edit' ?> Manual Journal</title>
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
                        <a href="manual_journals.php" class="text-decoration-none small fw-bold text-secondary"><i class="bi bi-arrow-left"></i> Back to Manual Journals</a>
                        <h4 class="fw-bold m-0 mt-1">Manual Journal #<?= $journal['id'] ?></h4>
                    </div>
                    <div>
                        <?php if ($journal['status'] === 'POSTED'): ?>
                            <span class="status-badge-posted"><i class="bi bi-check-circle-fill me-1"></i> Posted</span>
                        <?php else: ?>
                            <span class="status-badge-draft"><i class="bi bi-pencil-fill me-1"></i> Draft</span>
                        <?php endif; ?>
                    </div>
                </div>

                <div class="xero-card">
                    <?php if ($journal['status'] === 'POSTED'): ?>
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
                                    <th>Description</th>
                                    <th>Account</th>
                                    <th class="text-end">Debit</th>
                                    <th class="text-end">Credit</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                $tot_d = 0;
                                $tot_c = 0;
                                foreach ($lines as $l):
                                    $tot_d += $l['debit'];
                                    $tot_c += $l['credit'];
                                    $acc_info = $query->select('accodes', $l['account_code'], 'code');
                                    $acc_display = $l['account_code'] . ' - ' . ($acc_info['name'] ?? '');
                                ?>
                                    <tr>
                                        <td><?= htmlspecialchars($l['description']) ?></td>
                                        <td><?= htmlspecialchars($acc_display) ?></td>
                                        <td class="text-end"><?= number_format($l['debit'], 2) ?></td>
                                        <td class="text-end"><?= number_format($l['credit'], 2) ?></td>
                                    </tr>
                                <?php endforeach; ?>
                            </tbody>
                            <tfoot>
                                <tr class="fw-bold border-top border-dark">
                                    <td colspan="2" class="text-end">TOTAL</td>
                                    <td class="text-end"><?= number_format($tot_d, 2) ?></td>
                                    <td class="text-end"><?= number_format($tot_c, 2) ?></td>
                                </tr>
                            </tfoot>
                        </table>
                        <div class="mt-4">
                            <a href="manual_journals.php" class="btn btn-secondary btn-sm fw-bold px-4">Back</a>
                        </div>

                    <?php else: ?>
                        <!-- EDIT / POST DRAFT MODE -->
                        <form action="" method="POST" id="journalForm">
                            <input type="hidden" name="journal_id" value="<?= $journal['id'] ?>">

                            <div class="row mb-4">
                                <div class="col-md-8">
                                    <label class="fw-bold small mb-1">Narration</label>
                                    <input type="text" name="narration" class="form-control" required value="<?= htmlspecialchars($journal['narration']) ?>">
                                </div>
                                <div class="col-md-4">
                                    <label class="fw-bold small mb-1">Date</label>
                                    <input type="date" name="journal_date" class="form-control" value="<?= $journal['journal_date'] ?>" required>
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
                                    <?php foreach ($lines as $index => $l): ?>
                                        <tr>
                                            <td><input type="text" name="lines[<?= $index ?>][description]" value="<?= htmlspecialchars($l['description']) ?>"></td>
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
                                            <td><input type="number" step="0.01" min="0" name="lines[<?= $index ?>][debit]" class="debit-input text-end" value="<?= $l['debit'] ?>"></td>
                                            <td><input type="number" step="0.01" min="0" name="lines[<?= $index ?>][credit]" class="credit-input text-end" value="<?= $l['credit'] ?>"></td>
                                            <td class="text-center align-middle"><button type="button" class="remove-btn" onclick="this.closest('tr').remove(); calculateTotals();"><i class="bi bi-x-circle-fill"></i></button></td>
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
                                <button type="submit" name="action" value="draft" class="btn btn-secondary fw-bold px-4">Update draft</button>
                                <div>
                                    <a href="manual_journals.php" class="btn btn-light border fw-bold me-2">Cancel</a>
                                    <button type="submit" name="action" value="post" class="btn btn-success fw-bold px-5">Post to Ledger</button>
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
        let lineIndex = <?= count($lines) ?>;
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
                <td><input type="text" name="lines[${lineIndex}][description]"></td>
                <td><select name="lines[${lineIndex}][account_code]" required>${accountsOptions}</select></td>
                <td><input type="number" step="0.01" min="0" name="lines[${lineIndex}][debit]" class="debit-input text-end" value="0.00"></td>
                <td><input type="number" step="0.01" min="0" name="lines[${lineIndex}][credit]" class="credit-input text-end" value="0.00"></td>
                <td class="text-center align-middle"><button type="button" class="remove-btn" onclick="this.closest('tr').remove(); calculateTotals();"><i class="bi bi-x-circle-fill"></i></button></td>
            `;
            tbody.appendChild(tr);
            lineIndex++;
            attachListeners();
            calculateTotals();
        }

        function calculateTotals() {
            let totalDebit = 0;
            let totalCredit = 0;
            document.querySelectorAll('.debit-input').forEach(input => {
                totalDebit += parseFloat(input.value) || 0;
            });
            document.querySelectorAll('.credit-input').forEach(input => {
                totalCredit += parseFloat(input.value) || 0;
            });

            document.getElementById('totalDebit').innerText = totalDebit.toFixed(2);
            document.getElementById('totalCredit').innerText = totalCredit.toFixed(2);

            const color = (totalDebit === totalCredit && totalDebit !== 0) ? '#15803d' : '#ef4444';
            document.getElementById('totalDebit').style.color = color;
            document.getElementById('totalCredit').style.color = color;
        }

        function attachListeners() {
            document.querySelectorAll('.debit-input, .credit-input').forEach(input => {
                input.removeEventListener('input', calculateTotals);
                input.addEventListener('input', calculateTotals);
            });
        }

        const form = document.getElementById('journalForm');
        if (form) {
            form.addEventListener('submit', function(e) {
                const action = e.submitter.value;
                if (action === 'post') {
                    const debits = parseFloat(document.getElementById('totalDebit').innerText);
                    const credits = parseFloat(document.getElementById('totalCredit').innerText);
                    if (debits !== credits) {
                        e.preventDefault();
                        swal('Imbalance Detected', 'Total Debits must equal Total Credits before you can Post this journal.', 'error');
                        return false;
                    }
                }
            });
            calculateTotals();
            attachListeners();
        }
    </script>
</body>

</html>