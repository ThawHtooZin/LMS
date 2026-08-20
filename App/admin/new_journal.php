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
    $result = $query->saveManualJournal($_POST['narration'], $_POST['journal_date'], $_POST['action'], $_POST['lines'] ?? []);

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
                        <div class="row mb-4">
                            <div class="col-md-8">
                                <label class="fw-bold small mb-1">Narration</label>
                                <input type="text" name="narration" class="form-control" required placeholder="Reason for adjustment...">
                            </div>
                            <div class="col-md-4">
                                <label class="fw-bold small mb-1">Date</label>
                                <input type="date" name="journal_date" class="form-control" value="<?= date('Y-m-d') ?>" required>
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
                                <tr>
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
                                    <td><input type="number" step="0.01" min="0" name="lines[0][debit]" class="debit-input text-end" value="0.00"></td>
                                    <td><input type="number" step="0.01" min="0" name="lines[0][credit]" class="credit-input text-end" value="0.00"></td>
                                    <td class="text-center"></td>
                                </tr>
                                <tr>
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
                                    <td><input type="number" step="0.01" min="0" name="lines[1][debit]" class="debit-input text-end" value="0.00"></td>
                                    <td><input type="number" step="0.01" min="0" name="lines[1][credit]" class="credit-input text-end" value="0.00"></td>
                                    <td class="text-center"></td>
                                </tr>
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
                <td><input type="text" name="lines[${lineIndex}][description]"></td>
                <td><select name="lines[${lineIndex}][account_code]" required>${accountsOptions}</select></td>
                <td><input type="number" step="0.01" min="0" name="lines[${lineIndex}][debit]" class="debit-input text-end" value="0.00"></td>
                <td><input type="number" step="0.01" min="0" name="lines[${lineIndex}][credit]" class="credit-input text-end" value="0.00"></td>
                <td class="text-center align-middle"><button type="button" class="remove-btn" onclick="this.closest('tr').remove(); calculateTotals();"><i class="bi bi-x-circle-fill"></i></button></td>
            `;
            tbody.appendChild(tr);
            lineIndex++;
            attachListeners();
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

        document.getElementById('journalForm').addEventListener('submit', function(e) {
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

        attachListeners();
    </script>
</body>

</html>