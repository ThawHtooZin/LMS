<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();

$sale_id = isset($_GET['id']) ? intval($_GET['id']) : 0;

if ($sale_id === 0) {
    header("Location: sales.php");
    exit;
}

$stmt = $pdo->prepare("SELECT * FROM sales WHERE id = ?");
$stmt->execute([$sale_id]);
$sale = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$sale) {
    header("Location: sales.php");
    exit;
}

$is_locked = floatval($sale['paid_amount']) > 0;
$current_status = $sale['status'];

$lStmt = $pdo->prepare("SELECT * FROM sale_lines WHERE sale_id = ? ORDER BY id ASC");
$lStmt->execute([$sale_id]);
$existing_lines = $lStmt->fetchAll(PDO::FETCH_ASSOC);

$saveResult = null;

if ($_SERVER['REQUEST_METHOD'] == 'POST' and isset($_POST['action_type'])) {
    $action_type = $_POST['action_type'];

    if ($action_type == 'delete') {
        $saveResult = $query->deleteSale($sale_id);
    } elseif ($action_type == 'void') {
        $saveResult = $query->voidSale($sale_id);
    } else {
        $contact_id   = $_POST['contact_id'];
        $date         = $_POST['date'];
        $due_date     = !empty($_POST['due_date']) ? $_POST['due_date'] : NULL;
        $voucher_no   = $_POST['voucher_no'];
        $currency     = $_POST['currency'];

        $status = $current_status;
        if (in_array($action_type, ['submit_approval'])) {
            $status = 'AWAITING_APPROVAL';
        }
        if (in_array($action_type, ['approve', 'approve_add_another', 'update_approved'])) {
            $status = 'AWAITING_PAYMENT';
        }
        if ($action_type == 'save_draft') {
            $status = ($current_status === 'AWAITING_PAYMENT') ? 'AWAITING_PAYMENT' : 'DRAFT';
        }

        $grand_total = 0;
        $lines = [];
        if (isset($_POST['line_amount'])) {
            for ($i = 0; $i < count($_POST['line_amount']); $i++) {
                $amt   = floatval($_POST['line_amount'][$i]);
                $acc   = isset($_POST['account_code'][$i]) ? $_POST['account_code'][$i] : '';
                $c_no  = isset($_POST['container_no'][$i]) ? $_POST['container_no'][$i] : '';

                if (!empty($c_no) or !empty($acc) or $amt > 0) {
                    $grand_total += $amt;
                    $lines[] = [
                        'container_no' => $c_no,
                        'account_id'  => !empty($acc) ? $acc : NULL,
                        'line_amount' => $amt
                    ];
                }
            }
        }

        $ctrl_action = 'standard';
        if ($action_type == 'save_continue') {
            $ctrl_action = 'continue_editing';
        }
        if ($action_type == 'save_add_another' or $action_type == 'approve_add_another') {
            $ctrl_action = 'add_another';
        }

        $saveResult = $query->updateSale($sale_id, $contact_id, $date, $due_date, $voucher_no, $currency, $status, $grand_total, $lines, $ctrl_action);
    }
}

$stmt = $pdo->prepare("SELECT * FROM sales WHERE id = ?");
$stmt->execute([$sale_id]);
$sale = $stmt->fetch(PDO::FETCH_ASSOC);
$current_status = $sale['status'];

$customers = $pdo->query("SELECT id, name FROM contacts WHERE is_customer = 1 ORDER BY name ASC")->fetchAll(PDO::FETCH_ASSOC);
$currencies = $pdo->query("SELECT code, name FROM system_currencies ORDER BY code ASC")->fetchAll(PDO::FETCH_ASSOC);
$accounts = $pdo->query("SELECT code, name, class FROM accodes WHERE class = 'REVENUE' ORDER BY code ASC")->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <title>Edit Sale</title>
    <?php echo $bootstrap->css(); ?>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.min.css">
    <style>
        .chosen-container-single .chosen-single {
            height: 38px !important;
            border: 1px solid #ced4da !important;
            border-radius: 0.375rem !important;
            line-height: 36px !important;
            background: #fff !important;
            box-shadow: none !important;
        }

        .table-lines input {
            font-size: 14px;
            border-radius: 4px;
            border: 1px solid #ced4da;
            width: 100%;
            padding: 6px;
        }

        .xero-title {
            font-size: 24px;
            font-weight: normal;
            color: #202e3c;
            margin-bottom: 20px;
        }

        .total-box {
            border-top: 2px solid #000;
            border-bottom: 2px solid #000;
            padding: 10px 0;
            margin-top: 20px;
        }

        .btn-group .btn-main {
            border-top-right-radius: 0;
            border-bottom-right-radius: 0;
        }

        .btn-group .btn-drop {
            border-top-left-radius: 0;
            border-bottom-left-radius: 0;
            border-left: 1px solid rgba(255, 255, 255, 0.3);
        }

        .status-header {
            font-size: 14px;
            font-weight: bold;
            color: #666;
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        .error-border {
            border-bottom: 2px solid #dc3545 !important;
            box-shadow: 0 1px 0 0 #dc3545 !important;
        }

        .chosen-container.error-border .chosen-single {
            border-bottom: 2px solid #dc3545 !important;
            box-shadow: 0 1px 0 0 #dc3545 !important;
        }
    </style>
</head>

<body>
    <?php echo $bootstrap->javascriptindex(); ?>

    <?php if (!empty($saveResult)): ?>
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                <?php if ($saveResult['status'] === true): ?>
                    swal({
                        title: <?= json_encode($saveResult['title']); ?>,
                        text: <?= json_encode($saveResult['message']); ?>,
                        icon: "success"
                    }).then(() => {
                        window.location.href = <?= json_encode($saveResult['redirect'] ?? 'sales.php'); ?>;
                    });
                <?php else: ?>
                    swal({
                        title: <?= json_encode($saveResult['title']); ?>,
                        text: <?= json_encode($saveResult['message']); ?>,
                        icon: <?= json_encode($saveResult['type'] ?? 'error'); ?>
                    }).then(() => {
                        <?php if (isset($saveResult['redirect'])): ?> window.location.href = <?= json_encode($saveResult['redirect']); ?>;
                        <?php endif; ?>
                    });
                <?php endif; ?>
            });
        </script>
    <?php endif; ?>

    <div class="row">
        <div class="sidebarcol" id="sidebar"><?php include 'sidebar.php'; ?></div>
        <div class="contentcol" id="content">
            <?php require 'navbar.php'; ?>
            <form action="" method="post" id="saleForm">
                <input type="hidden" name="action_type" id="action_type" value="save_draft">
                <div class="bg-white p-4 shadow-sm rounded m-2">
                    <div class="text-muted small"><a href="sales.php" class="text-decoration-none">Sales overview</a> > Invoices ></div>
                    <div class="xero-title">Edit Invoice <?= htmlspecialchars($sale['voucher_no']); ?></div>

                    <div class="d-flex justify-content-between align-items-center status-header">
                        <div>
                            Status: <span class="badge bg-secondary"><?php echo ucfirst(strtolower(str_replace('_', ' ', $current_status))); ?></span>
                            <?php if ($is_locked): ?>
                                <span class="badge bg-danger ms-2">Locked (Paid / Partially Paid)</span>
                            <?php endif; ?>
                        </div>
                        <div class="btn-group">
                            <button type="button" class="btn btn-outline-secondary btn-sm dropdown-toggle fw-bold ms-2" data-bs-toggle="dropdown" aria-expanded="false">Invoice Options</button>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <?php if ($current_status === 'DRAFT' || $current_status === 'AWAITING_APPROVAL'): ?>
                                    <li><a class="dropdown-item text-danger" onclick="confirmAction('delete', 'Are you sure you want to delete this draft?')"><i class="bi bi-trash"></i> Delete</a></li>
                                <?php elseif ($current_status === 'AWAITING_PAYMENT'): ?>
                                    <li><a class="dropdown-item text-warning" onclick="confirmAction('void', 'Are you sure you want to void this approved invoice?')"><i class="bi bi-x-circle"></i> Void</a></li>
                                <?php endif; ?>
                            </ul>
                        </div>
                    </div>

                    <div class="row mb-4 gx-3 mt-3">
                        <div class="col-md-3">
                            <label class="fw-bold small mb-1">To</label>
                            <select name="contact_id" class="form-control chosen-select req-input" <?= $is_locked ? 'disabled' : ''; ?>>
                                <option value=""></option>
                                <?php foreach ($customers as $cust): ?>
                                    <option value="<?= $cust['id']; ?>" <?= ($sale['contact_id'] == $cust['id']) ? 'selected' : ''; ?>><?= htmlspecialchars($cust['name']); ?></option>
                                <?php endforeach; ?>
                            </select>
                            <?php if ($is_locked): ?><input type="hidden" name="contact_id" value="<?= $sale['contact_id']; ?>"><?php endif; ?>
                        </div>
                        <div class="col-md-3">
                            <label class="fw-bold small mb-1">Date</label>
                            <input type="date" name="date" class="form-control req-input" value="<?= htmlspecialchars($sale['date']); ?>" <?= $is_locked ? 'readonly' : ''; ?>>
                        </div>
                        <div class="col-md-3">
                            <label class="fw-bold small mb-1">Due Date</label>
                            <input type="date" name="due_date" class="form-control" value="<?= htmlspecialchars($sale['due_date']); ?>" <?= $is_locked ? 'readonly' : ''; ?>>
                        </div>
                        <div class="col-md-3">
                            <label class="fw-bold small mb-1">Invoice #</label>
                            <input type="text" name="voucher_no" class="form-control req-input" value="<?= htmlspecialchars($sale['voucher_no']); ?>" <?= $is_locked ? 'readonly' : ''; ?>>
                        </div>
                    </div>

                    <div class="row mb-4">
                        <div class="col-md-3">
                            <label class="fw-bold small mb-1">Currency</label>
                            <select name="currency" class="form-select form-select-sm" style="height: 38px;" <?= $is_locked ? 'disabled' : ''; ?>>
                                <option value="USD" <?= ($sale['currency'] == 'USD') ? 'selected' : ''; ?>>USD (Base)</option>
                                <?php foreach ($currencies as $c): ?>
                                    <option value="<?= htmlspecialchars($c['code']); ?>" <?= ($sale['currency'] == $c['code']) ? 'selected' : ''; ?>><?= htmlspecialchars($c['code']); ?></option>
                                <?php endforeach; ?>
                            </select>
                            <?php if ($is_locked): ?><input type="hidden" name="currency" value="<?= $sale['currency']; ?>"><?php endif; ?>
                        </div>
                    </div>

                    <div style="overflow: visible;">
                        <table class="table table-borderless table-lines" id="linesTable">
                            <thead class="table-dark">
                                <tr>
                                    <th width="35%">Container Reference</th>
                                    <th width="40%">Revenue Account</th>
                                    <th width="25%" class="text-end">Amount</th>
                                </tr>
                            </thead>
                            <tbody id="linesBody"></tbody>
                        </table>
                    </div>

                    <?php if (!$is_locked): ?>
                        <button type="button" class="btn btn-outline-primary btn-sm fw-bold mt-2" id="addLineBtn">Add a new line</button>
                    <?php endif; ?>

                    <div class="row mt-4">
                        <div class="col-md-7"></div>
                        <div class="col-md-5">
                            <div class="d-flex justify-content-between align-items-center total-box">
                                <h3 class="mb-0 fw-bold">TOTAL</h3>
                                <h3 class="mb-0 fw-bold" id="grandTotalDisplay">0.00</h3>
                            </div>
                        </div>
                    </div>

                    <hr class="mt-5">
                    <div class="d-flex justify-content-between">
                        <?php if (!$is_locked): ?>
                            <div>
                                <?php if ($current_status === 'AWAITING_PAYMENT'): ?>
                                    <button type="button" class="btn btn-success fw-bold px-4" onclick="submitForm('update_approved')">Update Invoice</button>
                                <?php else: ?>
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-info text-white fw-bold px-4 btn-main" onclick="submitForm('save_draft')">Save</button>
                                        <button type="button" class="btn btn-info text-white dropdown-toggle btn-drop" data-bs-toggle="dropdown" aria-expanded="false"></button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item text-info" onclick="submitForm('save_draft')">Save as draft</a></li>
                                            <li><a class="dropdown-item text-info" onclick="submitForm('save_continue')">Save (continue editing)</a></li>
                                            <li><a class="dropdown-item text-info" onclick="submitForm('submit_approval')">Save & submit for approval</a></li>
                                        </ul>
                                    </div>
                                <?php endif; ?>
                            </div>

                            <div>
                                <?php if ($current_status !== 'AWAITING_PAYMENT'): ?>
                                    <div class="btn-group me-2">
                                        <button type="button" class="btn btn-success fw-bold px-4 btn-main" onclick="submitForm('approve')">Approve</button>
                                        <button type="button" class="btn btn-success dropdown-toggle btn-drop" data-bs-toggle="dropdown" aria-expanded="false"></button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item text-success" onclick="submitForm('approve')">Approve</a></li>
                                            <li><a class="dropdown-item text-success" onclick="submitForm('approve_add_another')">Approve & add another</a></li>
                                        </ul>
                                    </div>
                                <?php endif; ?>
                                <a href="sales.php" class="btn btn-secondary">Cancel</a>
                            </div>
                        <?php else: ?>
                            <div class="text-danger fw-bold"><i class="bi bi-lock-fill"></i> This invoice has payments applied. Editing and updating are completely locked.</div>
                            <a href="sales.php" class="btn btn-secondary">Back to Sales</a>
                        <?php endif; ?>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <select id="accTpl" style="display:none;">
        <option value="">- Account -</option>
        <?php foreach ($accounts as $a): ?>
            <option value="<?= htmlspecialchars($a['code']); ?>"><?= htmlspecialchars($a['code'] . ' - ' . $a['name']); ?></option>
        <?php endforeach; ?>
    </select>

    <?php echo $bootstrap->javascript(); ?>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.min.js"></script>
    <script>
        const isLocked = <?= $is_locked ? 'true' : 'false'; ?>;
        const existingLines = <?= json_encode($existing_lines); ?>;

        $(document).ready(function() {
            if (!isLocked) {
                $('.chosen-select').chosen({
                    width: '100%',
                    search_contains: true
                });
            }

            if (existingLines.length > 0) {
                existingLines.forEach(function(line) {
                    addNewLine(line);
                });
            } else {
                addNewLine();
                addNewLine();
            }

            calcTotals();
            if (!isLocked) {
                $('#addLineBtn').click(function() {
                    addNewLine();
                });
            }
            $('#linesBody').on('input', '.calc-input', calcTotals);

            $(document).on('input change', '.req-input, .error-border, select', function() {
                $(this).removeClass('error-border');
                if ($(this).is('select')) {
                    $(this).next('.chosen-container').removeClass('error-border');
                }
            });
        });

        function addNewLine(data) {
            if (isLocked && typeof data === 'undefined') return;
            if (typeof data === 'undefined') {
                data = {};
            }

            let cNo = data.container_no ? data.container_no : '';
            let accCode = data.account_id ? data.account_id : '';
            let amt = data.line_amount ? data.line_amount : '';

            let accHtml = $('#accTpl').html();
            if (accCode !== '') {
                let searchStr = 'value="' + accCode + '"';
                accHtml = accHtml.replace(searchStr, searchStr + ' selected');
            }

            let isLck = false;
            if (typeof isLocked !== 'undefined') {
                if (isLocked === true) {
                    isLck = true;
                }
            }

            let readonlyAttr = isLck ? 'readonly' : '';
            let disabledAttr = isLck ? 'disabled' : '';

            let hiddenInput = '';
            if (isLck) {
                if (accCode !== '') {
                    hiddenInput = '<input type="hidden" name="account_code[]" value="' + accCode + '">';
                }
            }

            let tr = `
                <tr>
                    <td><input type="text" name="container_no[]" class="form-control" placeholder="C-001" value="${cNo}" ${readonlyAttr}></td>
                    <td>
                        <select name="account_code[]" class="form-control chosen-select acc-select" ${disabledAttr}>
                            ${accHtml}
                        </select>
                        ${hiddenInput}
                    </td>
                    <td><input type="number" name="line_amount[]" step="0.01" class="form-control calc-input amount-input text-end" placeholder="0.00" value="${amt}" ${readonlyAttr}></td>
                </tr>
            `;
            $('#linesBody').append(tr);
            if ($.fn.chosen && !isLck) {
                $('#linesBody tr:last-child .chosen-select').chosen({
                    width: '100%',
                    search_contains: true
                });
            }
        }

        function calcTotals() {
            let total = 0;
            $('#linesBody tr').each(function() {
                let amt = parseFloat($(this).find('.amount-input').val());
                if (!isNaN(amt)) {
                    total += amt;
                }
            });
            let fTotal = total.toLocaleString(undefined, {
                minimumFractionDigits: 2,
                maximumFractionDigits: 2
            });
            $('#grandTotalDisplay').text(fTotal);
        }

        function confirmAction(action, message) {
            swal({
                title: "Are you sure?",
                text: message,
                icon: "warning",
                buttons: ["Cancel", "Yes, Proceed"],
                dangerMode: true,
            }).then((willProceed) => {
                if (willProceed) {
                    submitForm(action);
                }
            });
        }

        function submitForm(action) {
            if (typeof isLocked !== 'undefined') {
                if (isLocked === true) {
                    swal('Strict Audit Block!', 'You cannot update paid or partially paid invoices.', 'error');
                    return;
                }
            }

            let isValid = true;
            let firstErrorField = null;
            $('.error-border').removeClass('error-border');

            $('.req-input').each(function() {
                let val = $(this).val();
                if (!val) {
                    isValid = false;
                    $(this).addClass('error-border');
                    if ($(this).is('select')) {
                        $(this).next('.chosen-container').addClass('error-border');
                    }
                    if (!firstErrorField) {
                        firstErrorField = $(this);
                    }
                } else if (val.trim() === "") {
                    isValid = false;
                    $(this).addClass('error-border');
                    if ($(this).is('select')) {
                        $(this).next('.chosen-container').addClass('error-border');
                    }
                    if (!firstErrorField) {
                        firstErrorField = $(this);
                    }
                }
            });

            let hasValidLine = false;
            $('#linesBody tr').each(function() {
                let acc = $(this).find('.acc-select');
                let amt = parseFloat($(this).find('.amount-input').val());

                if (acc.val() && acc.val() !== "") {
                    hasValidLine = true;
                    if (isNaN(amt) || amt <= 0) {
                        isValid = false;
                        $(this).find('.amount-input').addClass('error-border');
                        if (!firstErrorField) {
                            firstErrorField = $(this).find('.amount-input');
                        }
                    }
                }
            });

            if (!hasValidLine) {
                swal("Validation Error", "You must fill out at least one line item.", "warning");
                return;
            }
            if (!isValid) {
                if (firstErrorField) {
                    firstErrorField.focus();
                }
                swal("Validation Error", "Please complete the highlighted fields.", "warning");
                return;
            }

            document.getElementById('action_type').value = action;
            document.getElementById('saleForm').submit();
        }
    </script>
</body>

</html>