<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['action_type'])) {
    $contact_id = $_POST['contact_id'];
    $date = $_POST['date'];
    $tclfrozen = $_POST['tclfrozen'];
    $due_date = !empty($_POST['due_date']) ? $_POST['due_date'] : NULL;
    $voucher_no = $_POST['voucher_no'];
    $currency = $_POST['currency'];

    $action_type = $_POST['action_type'];

    $status = 'DRAFT';
    if (in_array($action_type, ['submit_approval'])) {
        $status = 'AWAITING_APPROVAL';
    } elseif (in_array($action_type, ['approve', 'approve_add_another'])) {
        $status = 'AUTHORISED';
    }

    $subtotal = 0;
    $lines = [];
    if (isset($_POST['account_code'])) {
        for ($i = 0; $i < count($_POST['account_code']); $i++) {
            $viss = floatval($_POST['viss'][$i]);
            $price = floatval($_POST['unit_price'][$i]);
            $acc = $_POST['account_code'][$i];

            if (!empty($acc) && $viss > 0) {
                $line_total = $viss * $price;
                $subtotal += $line_total;
                $lines[] = [
                    'product_id' => !empty($_POST['product_id'][$i]) ? $_POST['product_id'][$i] : NULL,
                    'account_id' => $acc,
                    'description' => $_POST['description'][$i],
                    'size' => $_POST['size'][$i],
                    'viss' => $viss,
                    'pcs' => intval($_POST['pcs'][$i]),
                    'unit_price' => $price,
                    'line_amount' => $line_total
                ];
            }
        }
    }

    $ctrl_action = 'standard';
    if ($action_type == 'save_continue') $ctrl_action = 'continue_editing';
    if ($action_type == 'save_add_another' || $action_type == 'approve_add_another') $ctrl_action = 'add_another';

    $query->savePurchase(null, $contact_id, $date, $tclfrozen, $due_date, $voucher_no, $currency, $status, $subtotal, $subtotal, $lines, $ctrl_action);
}

$suppliers = $pdo->query("SELECT id, name FROM contacts WHERE is_supplier = 1 ORDER BY name ASC")->fetchAll(PDO::FETCH_ASSOC);
$products = $pdo->query("SELECT id, code, name, purchase_account FROM products WHERE is_purchased = 1 ORDER BY name ASC")->fetchAll(PDO::FETCH_ASSOC);
$currencies = $pdo->query("SELECT code, name FROM system_currencies ORDER BY code ASC")->fetchAll(PDO::FETCH_ASSOC);

$prod_map = [];
foreach ($products as $p) {
    $prod_map[$p['id']] = $p['purchase_account'];
}

$accounts = $pdo->query("SELECT code, name, class FROM accodes WHERE class IN ('EXPENSES', 'ASSETS', 'LIABILITIES') ORDER BY class ASC, code ASC")->fetchAll(PDO::FETCH_ASSOC);
$grouped_accs = [];
foreach ($accounts as $acc) {
    $grouped_accs[ucfirst(strtolower($acc['class']))][] = $acc;
}
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <title>New Bill</title>
    <?php $bootstrap->css(); ?>
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

        .line-total {
            padding-top: 10px !important;
            font-weight: bold;
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

        .dropdown-item {
            font-size: 14px;
            cursor: pointer;
        }
    </style>
</head>

<body>
    <div class="row">
        <div class="sidebarcol" id="sidebar">
            <?php include 'sidebar.php'; ?>
        </div>
        <div class="contentcol" id="content">
            <?php require 'navbar.php'; ?>

            <form action="" method="post" id="billForm">
                <input type="hidden" name="action_type" id="action_type" value="save_draft">

                <div class="bg-white p-4 shadow-sm rounded">
                    <div class="text-muted small"><a href="purchase.php" class="text-decoration-none">Purchases overview</a> > Bills to pay ></div>
                    <div class="xero-title">New Bill</div>

                    <div class="row mb-4 gx-3">
                        <div class="col-md-3">
                            <label class="fw-bold small mb-1">From</label>
                            <select name="contact_id" class="form-control chosen-select" data-placeholder="Select supplier..." required>
                                <option value=""></option>
                                <?php foreach ($suppliers as $sup): ?>
                                    <option value="<?php echo $sup['id']; ?>"><?php echo htmlspecialchars($sup['name']); ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <label class="fw-bold small mb-1">Date</label>
                            <input type="date" name="date" class="form-control" value="<?php echo date('Y-m-d'); ?>" required>
                        </div>
                        <div class="col-md-2">
                            <label class="fw-bold small mb-1">Type</label>
                            <select name="tclfrozen" class="form-select form-select-sm" style="height: 38px;">
                                <option value="Frozen">Frozen</option>
                                <option value="tcl">TCL</option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <label class="fw-bold small mb-1">Due Date</label>
                            <input type="date" name="due_date" class="form-control">
                        </div>
                        <div class="col-md-3">
                            <label class="fw-bold small mb-1">Reference</label>
                            <input type="text" name="voucher_no" class="form-control" placeholder="Supplier Slip No" required>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-3">
                            <select name="currency" class="form-select form-select-sm">
                                <option value="MMK">MMK (Base)</option>
                                <?php foreach ($currencies as $c): ?>
                                    <option value="<?php echo $c['code']; ?>"><?php echo $c['code']; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                    </div>

                    <table class="table table-borderless table-lines" id="linesTable">
                        <thead>
                            <tr>
                                <th width="15%">Item</th>
                                <th width="15%">Description</th>
                                <th width="10%">Size</th>
                                <th width="10%">Viss</th>
                                <th width="10%">Pcs</th>
                                <th width="15%">Unit Price</th>
                                <th width="15%">Account</th>
                                <th width="10%" class="text-end">Amount</th>
                            </tr>
                        </thead>
                        <tbody id="linesBody">
                        </tbody>
                    </table>

                    <button type="button" class="btn btn-outline-primary btn-sm fw-bold" id="addLineBtn">Add a new line</button>

                    <div class="row mt-4">
                        <div class="col-md-7"></div>
                        <div class="col-md-5">
                            <div class="d-flex justify-content-between mb-2">
                                <span class="fw-bold text-muted">Subtotal</span>
                                <span id="subtotalDisplay">0.00</span>
                            </div>
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
                                <li><a class="dropdown-item text-info" onclick="submitForm('submit_approval')">Save & submit for approval</a></li>
                                <li><a class="dropdown-item text-info" onclick="submitForm('save_add_another')">Save & add another</a></li>
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
                            <a href="purchase.php" class="btn btn-secondary">Cancel</a>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <select id="accTpl" style="display:none;">
        <option value="">- Account -</option>
        <?php foreach ($grouped_accs as $class => $accs): ?>
            <optgroup label="<?php echo htmlspecialchars($class); ?>">
                <?php foreach ($accs as $a): ?>
                    <option value="<?php echo $a['code']; ?>"><?php echo $a['code'] . ' - ' . htmlspecialchars($a['name']); ?></option>
                <?php endforeach; ?>
            </optgroup>
        <?php endforeach; ?>
    </select>
    <select id="prodTpl" style="display:none;">
        <option value="">- Product -</option>
        <?php foreach ($products as $p): ?>
            <option value="<?php echo $p['id']; ?>"><?php echo htmlspecialchars($p['code'] . ' - ' . $p['name']); ?></option>
        <?php endforeach; ?>
    </select>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <?php $bootstrap->javascript(); ?>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.min.js"></script>
    <script>
        const prodMap = <?php echo json_encode($prod_map); ?>;

        $(document).ready(function() {
            $('.chosen-select').chosen({
                width: '100%',
                search_contains: true
            });
            addNewLine();
            addNewLine();
            addNewLine();

            $('#addLineBtn').click(addNewLine);
            $('#linesBody').on('input', '.calc-input', calcTotals);

            $('#linesBody').on('change', '.prod-select', function() {
                let row = $(this).closest('tr');
                let pId = $(this).val();
                let accCode = prodMap[pId];
                if (accCode) {
                    row.find('.acc-select').val(accCode).trigger('chosen:updated');
                }
            });
        });

        function addNewLine() {
            let tr = `
                <tr>
                    <td><select name="product_id[]" class="form-control chosen-select prod-select">${$('#prodTpl').html()}</select></td>
                    <td><input type="text" name="description[]"></td>
                    <td><input type="text" name="size[]" placeholder="e.g. 1up"></td>
                    <td><input type="number" name="viss[]" step="0.01" class="calc-input viss-input"></td>
                    <td><input type="number" name="pcs[]" class="calc-input pcs-input"></td>
                    <td><input type="number" name="unit_price[]" step="0.01" class="calc-input price-input"></td>
                    <td><select name="account_code[]" class="form-control chosen-select acc-select">${$('#accTpl').html()}</select></td>
                    <td class="line-total text-end">0.00</td>
                </tr>
            `;
            $('#linesBody').append(tr);
            $('#linesBody tr:last-child .chosen-select').chosen({
                width: '100%',
                search_contains: true
            });
        }

        function calcTotals() {
            let total = 0;
            $('#linesBody tr').each(function() {
                let v = parseFloat($(this).find('.viss-input').val()) || 0;
                let p = parseFloat($(this).find('.price-input').val()) || 0;
                let t = v * p;
                $(this).find('.line-total').text(t.toLocaleString(undefined, {
                    minimumFractionDigits: 2,
                    maximumFractionDigits: 2
                }));
                total += t;
            });
            let fTotal = total.toLocaleString(undefined, {
                minimumFractionDigits: 2,
                maximumFractionDigits: 2
            });
            $('#subtotalDisplay').text(fTotal);
            $('#grandTotalDisplay').text(fTotal);
        }

        function submitForm(action) {
            document.getElementById('action_type').value = action;
            document.getElementById('billForm').submit();
        }
    </script>
</body>

</html>