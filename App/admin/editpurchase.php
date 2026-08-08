<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();

$purchase_id = isset($_GET['id']) ? intval($_GET['id']) : 0;

if ($purchase_id === 0) {
    header("Location: purchase.php");
    exit;
}

$stmt = $pdo->prepare("SELECT * FROM purchases WHERE id = ?");
$stmt->execute([$purchase_id]);
$purchase = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$purchase) {
    header("Location: purchase.php");
    exit;
}

$line_stmt = $pdo->prepare("SELECT * FROM purchase_lines WHERE purchase_id = ?");
$line_stmt->execute([$purchase_id]);
$existing_lines = $line_stmt->fetchAll(PDO::FETCH_ASSOC);

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['action_type'])) {
    $action_type = $_POST['action_type'];

    if ($action_type == 'delete') {
        $query->deletePurchase($purchase_id);
        exit;
    }

    if ($action_type == 'void') {
        $query->voidPurchase($purchase_id);
        exit;
    }

    $contact_id = $_POST['contact_id'];
    $date = $_POST['date'];
    $tclfrozen = $_POST['tclfrozen'];
    $due_date = !empty($_POST['due_date']) ? $_POST['due_date'] : NULL;
    $voucher_no = $_POST['voucher_no'];
    $currency = $_POST['currency'];

    $status = (isset($purchase['status'])) ? $purchase['status'] : 'DRAFT';
    if (in_array($action_type, ['submit_approval'])) {
        $status = 'AWAITING_APPROVAL';
    } elseif (in_array($action_type, ['approve', 'approve_add_another'])) {
        $status = 'AUTHORISED';
    } elseif (in_array($action_type, ['save_draft', 'save_continue', 'save_add_another'])) {
        $status = 'DRAFT';
    }

    $subtotal = 0;
    $lines = [];
    if (isset($_POST['unit_price'])) {
        for ($i = 0; $i < count($_POST['unit_price']); $i++) {
            $viss = floatval($_POST['viss'][$i]);
            $pcs = intval($_POST['pcs'][$i]);
            $price = floatval($_POST['unit_price'][$i]);
            $acc = isset($_POST['account_code'][$i]) ? $_POST['account_code'][$i] : '';
            $desc = isset($_POST['description'][$i]) ? $_POST['description'][$i] : '';
            $prod = isset($_POST['product_id'][$i]) ? $_POST['product_id'][$i] : '';

            $multiplier = (strtolower($tclfrozen) === 'material') ? $pcs : $viss;

            if (!empty($prod) || !empty($desc) || !empty($acc) || $multiplier > 0 || $price > 0) {
                $line_total = $multiplier * $price;
                $subtotal += $line_total;
                $lines[] = [
                    'product_id' => !empty($prod) ? $prod : NULL,
                    'account_id' => !empty($acc) ? $acc : NULL,
                    'description' => $desc,
                    'size' => $_POST['size'][$i],
                    'viss' => $viss,
                    'pcs' => $pcs,
                    'unit_price' => $price,
                    'line_amount' => $line_total
                ];
            }
        }
    }

    $ctrl_action = 'standard';
    if ($action_type == 'save_continue') $ctrl_action = 'continue_editing';
    if ($action_type == 'save_add_another' || $action_type == 'approve_add_another') $ctrl_action = 'add_another';

    $query->savePurchase($purchase_id, $contact_id, $date, $tclfrozen, $due_date, $voucher_no, $currency, $status, $subtotal, $subtotal, $lines, $ctrl_action);
}

$suppliers = $pdo->query("SELECT id, name FROM contacts WHERE is_supplier = 1 OR is_supplier = 0 ORDER BY name ASC")->fetchAll(PDO::FETCH_ASSOC);
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
    <title>Edit Purchase</title>
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

        .status-header {
            font-size: 14px;
            font-weight: bold;
            color: #666;
            border-bottom: 1px solid #eee;
            padding-bottom: 10px;
            margin-bottom: 20px;
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
                    <div class="xero-title">Edit Purchase</div>

                    <div class="d-flex justify-content-between align-items-center status-header">
                        <div>
                            <?php echo ucfirst(strtolower(str_replace('_', ' ', $purchase['status']))); ?>
                        </div>
                        <div class="btn-group">
                            <a href="print_purchase.php?id=<?php echo $purchase_id; ?>" target="_blank" class="btn btn-outline-secondary btn-sm fw-bold"><i class="bi bi-printer"></i> Print PDF</a>
                            <button type="button" class="btn btn-outline-secondary btn-sm dropdown-toggle fw-bold ms-2" data-bs-toggle="dropdown" aria-expanded="false">
                                Purchase Options
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <?php if ($purchase['status'] === 'DRAFT' || $purchase['status'] === 'AWAITING_APPROVAL'): ?>
                                    <li><a class="dropdown-item text-danger" onclick="if(confirm('Are you sure you want to delete this draft?')){ submitForm('delete'); }"><i class="bi bi-trash"></i> Delete</a></li>
                                <?php elseif ($purchase['status'] === 'AUTHORISED'): ?>
                                    <li><a class="dropdown-item text-warning" onclick="if(confirm('Are you sure you want to void this approved bill?')){ submitForm('void'); }"><i class="bi bi-x-circle"></i> Void</a></li>
                                <?php elseif ($purchase['status'] === 'PAID'): ?>
                                    <li><span class="dropdown-item text-muted"><i class="bi bi-lock"></i> Locked (Payment Applied)</span></li>
                                <?php endif; ?>
                            </ul>
                        </div>
                    </div>

                    <div class="row mb-4 gx-3">
                        <div class="col-md-3">
                            <label class="fw-bold small mb-1">From</label>
                            <select name="contact_id" class="form-control chosen-select" data-placeholder="Select supplier..." required>
                                <option value=""></option>
                                <?php foreach ($suppliers as $sup): ?>
                                    <option value="<?php echo $sup['id']; ?>" <?php echo ($purchase['contact_id'] == $sup['id']) ? 'selected' : ''; ?>><?php echo htmlspecialchars($sup['name']); ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <label class="fw-bold small mb-1">Date</label>
                            <input type="date" name="date" class="form-control" value="<?php echo htmlspecialchars($purchase['date']); ?>" required>
                        </div>
                        <div class="col-md-2">
                            <label class="fw-bold small mb-1">Type</label>
                            <select name="tclfrozen" id="tclfrozenTypeSelect" class="form-select form-select-sm" style="height: 38px;">
                                <option value="Frozen" <?php echo ($purchase['tclfrozen'] == 'Frozen') ? 'selected' : ''; ?>>Frozen</option>
                                <option value="tcl" <?php echo ($purchase['tclfrozen'] == 'tcl') ? 'selected' : ''; ?>>TCL</option>
                                <option value="Material" <?php echo ($purchase['tclfrozen'] == 'Material') ? 'selected' : ''; ?>>Material</option>
                                <option value="Other" <?php echo ($purchase['tclfrozen'] == 'Other') ? 'selected' : ''; ?>>Other</option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <label class="fw-bold small mb-1">Due Date</label>
                            <input type="date" name="due_date" class="form-control" value="<?php echo htmlspecialchars($purchase['due_date']); ?>">
                        </div>
                        <div class="col-md-3">
                            <label class="fw-bold small mb-1">Reference</label>
                            <input type="text" name="voucher_no" class="form-control" value="<?php echo htmlspecialchars($purchase['voucher_no']); ?>" required>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-3">
                            <select name="currency" class="form-select form-select-sm">
                                <option value="MMK" <?php echo ($purchase['currency'] == 'MMK') ? 'selected' : ''; ?>>MMK (Base)</option>
                                <?php foreach ($currencies as $c): ?>
                                    <option value="<?php echo $c['code']; ?>" <?php echo ($purchase['currency'] == $c['code']) ? 'selected' : ''; ?>><?php echo $c['code']; ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                    </div>

                    <table class="table table-borderless table-lines" id="linesTable">
                        <thead>
                            <tr>
                                <th width="15%">Item</th>
                                <th width="15%">Description</th>
                                <th width="10%" class="col-fish-only">Size</th>
                                <th width="10%" class="col-fish-only">Viss</th>
                                <th width="10%" id="qtyHeaderTh">Pcs</th>
                                <th width="15%">Unit Price</th>
                                <th width="15%">Account</th>
                                <th width="10%" class="text-end">Amount</th>
                            </tr>
                        </thead>
                        <tbody id="linesBody">
                            <?php foreach ($existing_lines as $line): ?>
                                <tr>
                                    <td>
                                        <select name="product_id[]" class="form-control chosen-select prod-select">
                                            <option value="">- Product -</option>
                                            <?php foreach ($products as $p): ?>
                                                <option value="<?php echo $p['id']; ?>" <?php echo ($line['product_id'] == $p['id']) ? 'selected' : ''; ?>><?php echo htmlspecialchars($p['code'] . ' - ' . $p['name']); ?></option>
                                            <?php endforeach; ?>
                                        </select>
                                    </td>
                                    <td><input type="text" name="description[]" value="<?php echo htmlspecialchars($line['description']); ?>"></td>
                                    <td class="col-fish-only"><input type="text" name="size[]" value="<?php echo htmlspecialchars($line['size']); ?>"></td>
                                    <td class="col-fish-only"><input type="number" name="viss[]" step="0.01" class="calc-input viss-input" value="<?php echo htmlspecialchars($line['viss']); ?>"></td>
                                    <td><input type="number" name="pcs[]" class="calc-input pcs-input" value="<?php echo htmlspecialchars($line['pcs']); ?>"></td>
                                    <td><input type="number" name="unit_price[]" step="0.01" class="calc-input price-input" value="<?php echo htmlspecialchars($line['unit_price']); ?>"></td>
                                    <td>
                                        <select name="account_code[]" class="form-control chosen-select acc-select">
                                            <option value="">- Account -</option>
                                            <?php foreach ($grouped_accs as $class => $accs): ?>
                                                <optgroup label="<?php echo htmlspecialchars($class); ?>">
                                                    <?php foreach ($accs as $a): ?>
                                                        <option value="<?php echo $a['code']; ?>" <?php echo ($line['account_id'] == $a['code']) ? 'selected' : ''; ?>><?php echo $a['code'] . ' - ' . htmlspecialchars($a['name']); ?></option>
                                                    <?php endforeach; ?>
                                                </optgroup>
                                            <?php endforeach; ?>
                                        </select>
                                    </td>
                                    <td class="line-total text-end">0.00</td>
                                </tr>
                            <?php endforeach; ?>
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

            toggleMaterialColumns($('#tclfrozenTypeSelect').val());

            $('#tclfrozenTypeSelect').change(function() {
                toggleMaterialColumns($(this).val());
                calcTotals();
            });

            if ($('#linesBody tr').length === 0) {
                addNewLine();
            } else {
                calcTotals();
                if ($('#tclfrozenTypeSelect').val() === 'Material') {
                    $('.col-fish-only').hide();
                    $('#qtyHeaderTh').text('Quantity');
                }
            }

            $('#addLineBtn').click(addNewLine);
            $('#linesBody').on('input', '.calc-input', calcTotals);

            $('#linesBody').on('change', '.prod-select', function() {
                let row = $(this).closest('tr');
                let pId = $(this).val();
                let accCode = prodMap[pId];
                if (accCode) {
                    row.find('.acc-select').val(accCode).trigger('chosen:updated');
                } else {
                    row.find('.acc-select').val('').trigger('chosen:updated');
                }
            });
        });

        function toggleMaterialColumns(selectedType) {
            if (selectedType === 'Material') {
                $('.col-fish-only').hide();
                $('#qtyHeaderTh').text('Quantity');
            } else {
                $('.col-fish-only').show();
                $('#qtyHeaderTh').text('Pcs');
            }
        }

        function addNewLine() {
            let selectedType = $('#tclfrozenTypeSelect').val();
            let displayStyle = (selectedType === 'Material') ? 'style="display:none;"' : '';

            let tr = `
                <tr>
                    <td><select name="product_id[]" class="form-control chosen-select prod-select">${$('#prodTpl').html()}</select></td>
                    <td><input type="text" name="description[]"></td>
                    <td class="col-fish-only" ${displayStyle}><input type="text" name="size[]" placeholder="e.g. 1up"></td>
                    <td class="col-fish-only" ${displayStyle}><input type="number" name="viss[]" step="0.01" class="calc-input viss-input" value="0"></td>
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
            if (selectedType === 'Material') {
                $('.col-fish-only').hide();
            }
        }

        function calcTotals() {
            let total = 0;
            let selectedType = $('#tclfrozenTypeSelect').val();

            $('#linesBody tr').each(function() {
                let multiplier = 0;
                let p = parseFloat($(this).find('.price-input').val()) || 0;

                if (selectedType === 'Material') {
                    multiplier = parseFloat($(this).find('.pcs-input').val()) || 0;
                } else {
                    multiplier = parseFloat($(this).find('.viss-input').val()) || 0;
                }

                let t = multiplier * p;
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