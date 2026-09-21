<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();

$saveResult = null;

if ($_SERVER['REQUEST_METHOD'] == 'POST' and isset($_POST['action_type'])) {
    $_SESSION['old_sale'] = $_POST;

    $contact_id   = $_POST['contact_id'];
    $date         = $_POST['date'];
    $due_date     = !empty($_POST['due_date']) ? $_POST['due_date'] : NULL;
    $voucher_no   = $_POST['voucher_no'];
    $currency     = $_POST['currency'];
    $action_type  = $_POST['action_type'];

    $status = 'DRAFT';
    if (in_array($action_type, ['submit_approval'])) {
        $status = 'AWAITING_APPROVAL';
    }
    if (in_array($action_type, ['approve', 'approve_add_another'])) {
        $status = 'AWAITING_PAYMENT';
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
    $saveResult = $query->saveSale($contact_id, $date, $due_date, $voucher_no, $currency, $status, $grand_total, $lines, $ctrl_action);

    if ($saveResult['status'] === true) {
        unset($_SESSION['old_sale']);
    }
}

$old = isset($_SESSION['old_sale']) ? $_SESSION['old_sale'] : [];
unset($_SESSION['old_sale']);

$customers = $pdo->query("SELECT id, name FROM contacts WHERE is_customer = 1 ORDER BY name ASC")->fetchAll(PDO::FETCH_ASSOC);
$currencies = $pdo->query("SELECT code, name FROM system_currencies ORDER BY code ASC")->fetchAll(PDO::FETCH_ASSOC);
$accounts = $pdo->query("SELECT code, name, class FROM accodes WHERE class = 'REVENUE' ORDER BY code ASC")->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <title>New Sale</title>
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

        .table-lines th {
            font-size: 13px;
            color: #6c757d;
            border-bottom: 2px solid #ddd;
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
                    <div class="xero-title">New Invoice</div>

                    <div class="row mb-4 gx-3">
                        <div class="col-md-3">
                            <label class="fw-bold small mb-1">To</label>
                            <select name="contact_id" class="form-control chosen-select req-input" data-placeholder="Select customer...">
                                <option value=""></option>
                                <?php foreach ($customers as $cust): ?>
                                    <option value="<?= $cust['id']; ?>" <?= (isset($old['contact_id']) and $old['contact_id'] == $cust['id']) ? 'selected' : ''; ?>><?= htmlspecialchars($cust['name']); ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label class="fw-bold small mb-1">Date</label>
                            <input type="date" name="date" class="form-control req-input" value="<?= htmlspecialchars($old['date'] ?? date('Y-m-d')); ?>">
                        </div>
                        <div class="col-md-3">
                            <label class="fw-bold small mb-1">Due Date</label>
                            <input type="date" name="due_date" class="form-control" value="<?= htmlspecialchars($old['due_date'] ?? ''); ?>">
                        </div>
                        <div class="col-md-3">
                            <label class="fw-bold small mb-1">Invoice #</label>
                            <input type="text" name="voucher_no" class="form-control req-input" placeholder="INV-0001" value="<?= htmlspecialchars($old['voucher_no'] ?? ''); ?>">
                        </div>
                    </div>

                    <div class="row mb-4">
                        <div class="col-md-3">
                            <label class="fw-bold small mb-1">Currency</label>
                            <select name="currency" class="form-select form-select-sm" style="height: 38px;">
                                <option value="USD" <?= (isset($old['currency']) and $old['currency'] == 'USD') ? 'selected' : ''; ?>>USD (Base)</option>
                                <?php foreach ($currencies as $c): ?>
                                    <option value="<?= htmlspecialchars($c['code']); ?>" <?= (isset($old['currency']) and $old['currency'] == $c['code']) ? 'selected' : ''; ?>><?= htmlspecialchars($c['code']); ?></option>
                                <?php endforeach; ?>
                            </select>
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

                    <button type="button" class="btn btn-outline-primary btn-sm fw-bold mt-2" id="addLineBtn">Add a new line</button>

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
                        <div class="btn-group">
                            <button type="button" class="btn btn-info text-white fw-bold px-4 btn-main" onclick="submitForm('save_draft')">Save</button>
                            <button type="button" class="btn btn-info text-white dropdown-toggle btn-drop" data-bs-toggle="dropdown" aria-expanded="false"></button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item text-info" onclick="submitForm('save_draft')">Save as draft</a></li>
                                <li><a class="dropdown-item text-info" onclick="submitForm('save_continue')">Save (continue editing)</a></li>
                            </ul>
                        </div>
                        <div>
                            <div class="btn-group me-2">
                                <button type="button" class="btn btn-success fw-bold px-4 btn-main" onclick="submitForm('approve')">Approve</button>
                                <button type="button" class="btn btn-success dropdown-toggle btn-drop" data-bs-toggle="dropdown" aria-expanded="false"></button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item text-success" onclick="submitForm('approve')">Approve</a></li>
                                    <li><a class="dropdown-item text-success" onclick="submitForm('approve_add_another')">Approve & add another</a></li>
                                </ul>
                            </div>
                            <a href="sales.php" class="btn btn-secondary">Cancel</a>
                        </div>
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
        const oldCno = <?= json_encode($old['container_no'] ?? []); ?>;
        const oldAmts = <?= json_encode($old['line_amount'] ?? []); ?>;
        const oldAccounts = <?= json_encode($old['account_code'] ?? []); ?>;

        $(document).ready(function() {
            $('.chosen-select').chosen({
                width: '100%',
                search_contains: true
            });

            if (oldAmts.length > 0) {
                for (let i = 0; i < oldAmts.length; i++) {
                    let oC = oldCno[i] ? oldCno[i] : '';
                    let oA = oldAmts[i] ? oldAmts[i] : '';
                    let oAcc = oldAccounts[i] ? oldAccounts[i] : '';
                    addNewLine({
                        container_no: oC,
                        line_amount: oA,
                        account_code: oAcc
                    });
                }
            } else {
                addNewLine();
                addNewLine();
            }

            calcTotals();
            $('#addLineBtn').click(function() {
                addNewLine();
            });
            $('#linesBody').on('input', '.calc-input', calcTotals);

            $(document).on('input change', '.req-input, .error-border, select', function() {
                $(this).removeClass('error-border');
                if ($(this).is('select')) {
                    $(this).next('.chosen-container').removeClass('error-border');
                }
            });
        });

        function addNewLine(data) {
            if (typeof data === 'undefined') {
                data = {};
            }
            let cNo = data.container_no ? data.container_no : '';
            let accCode = data.account_code ? data.account_code : '';
            let amt = data.line_amount ? data.line_amount : '';

            let accHtml = $('#accTpl').html();
            if (accCode !== '') {
                let searchStr = 'value="' + accCode + '"';
                accHtml = accHtml.replace(searchStr, searchStr + ' selected');
            }

            let tr = `
                <tr>
                    <td><input type="text" name="container_no[]" class="form-control" placeholder="C-001" value="${cNo}"></td>
                    <td><select name="account_code[]" class="form-control chosen-select acc-select">${accHtml}</select></td>
                    <td><input type="number" name="line_amount[]" step="0.01" class="form-control calc-input amount-input text-end" placeholder="0.00" value="${amt}"></td>
                </tr>
            `;
            $('#linesBody').append(tr);
            if ($.fn.chosen) {
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

        function submitForm(action) {
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