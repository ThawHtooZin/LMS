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

    $query->savePurchase(null, $contact_id, $date, $tclfrozen, $due_date, $voucher_no, $currency, $status, $subtotal, $subtotal, $lines, $ctrl_action);
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

        /* Error Validation Styling */
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
                            <select name="contact_id" class="form-control chosen-select req-input" data-placeholder="Select supplier...">
                                <option value=""></option>
                                <?php foreach ($suppliers as $sup): ?>
                                    <option value="<?php echo $sup['id']; ?>"><?php echo htmlspecialchars($sup['name']); ?></option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <label class="fw-bold small mb-1">Date</label>
                            <input type="date" name="date" class="form-control req-input" value="<?php echo date('Y-m-d'); ?>">
                        </div>
                        <div class="col-md-2">
                            <label class="fw-bold small mb-1">Type</label>
                            <select name="tclfrozen" id="tclfrozenTypeSelect" class="form-select form-select-sm" style="height: 38px;">
                                <option value="Frozen">Frozen</option>
                                <option value="tcl">TCL</option>
                                <option value="Material">Material</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <label class="fw-bold small mb-1">Due Date</label>
                            <input type="date" name="due_date" class="form-control">
                        </div>
                        <div class="col-md-3">
                            <label class="fw-bold small mb-1">Reference</label>
                            <input type="text" name="voucher_no" class="form-control req-input" placeholder="Supplier Slip No">
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
                                <th width="10%" class="col-fish-only">Size</th>
                                <th width="10%" class="col-fish-only">Viss</th>
                                <th width="10%" id="qtyHeaderTh">Pcs</th>
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

            toggleMaterialColumns($('#tclfrozenTypeSelect').val());

            $('#tclfrozenTypeSelect').change(function() {
                toggleMaterialColumns($(this).val());
                calcTotals();
            });

            if ($('#linesBody tr').length === 0) {
                addNewLine();
                addNewLine();
                addNewLine();
            } else {
                calcTotals();
            }

            $('#addLineBtn').click(addNewLine);
            $('#linesBody').on('input', '.calc-input', calcTotals);

            // Clean error classes on user input
            $(document).on('input change', '.req-input, .error-border, select', function() {
                $(this).removeClass('error-border');
                if ($(this).is('select')) {
                    $(this).next('.chosen-container').removeClass('error-border');
                }
            });

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
            let isValid = true;
            let selectedType = $('#tclfrozenTypeSelect').val();

            // Clear previous errors
            $('.error-border').removeClass('error-border');

            // 1. Validate Main Header Fields
            let contact = $('select[name="contact_id"]');
            if (!contact.val()) {
                contact.next('.chosen-container').addClass('error-border');
                isValid = false;
            }

            let dateField = $('input[name="date"]');
            if (!dateField.val()) {
                dateField.addClass('error-border');
                isValid = false;
            }

            let refField = $('input[name="voucher_no"]');
            if (!refField.val().trim()) {
                refField.addClass('error-border');
                isValid = false;
            }

            // 2. Validate Lines
            let hasActiveLines = false;
            $('#linesBody tr').each(function() {
                let prodSelect = $(this).find('select[name="product_id[]"]');
                let sizeInput = $(this).find('input[name="size[]"]');
                let vissInput = $(this).find('input[name="viss[]"]');
                let pcsInput = $(this).find('input[name="pcs[]"]');
                let priceInput = $(this).find('input[name="unit_price[]"]');
                let accSelect = $(this).find('select[name="account_code[]"]');
                let descInput = $(this).find('input[name="description[]"]');

                let prod = prodSelect.val();
                let size = sizeInput.val().trim();
                let viss = parseFloat(vissInput.val());
                let pcs = parseFloat(pcsInput.val());
                let price = parseFloat(priceInput.val());
                let acc = accSelect.val();
                let desc = descInput.val().trim();

                // Determine if this row has any content inputted
                let isRowActive = prod || size || (!isNaN(viss) && viss > 0) || (!isNaN(pcs) && pcs > 0) || (!isNaN(price) && price > 0) || acc || desc;

                if (isRowActive) {
                    hasActiveLines = true;

                    if (!prod) {
                        prodSelect.next('.chosen-container').addClass('error-border');
                        isValid = false;
                    }

                    if (selectedType !== 'Material') {
                        if (!size) {
                            sizeInput.addClass('error-border');
                            isValid = false;
                        }
                        if (isNaN(viss) || viss <= 0) {
                            vissInput.addClass('error-border');
                            isValid = false;
                        }
                    }

                    if (isNaN(pcs) || pcs <= 0) {
                        pcsInput.addClass('error-border');
                        isValid = false;
                    }
                    if (isNaN(price) || price <= 0) {
                        priceInput.addClass('error-border');
                        isValid = false;
                    }

                    if (!acc) {
                        accSelect.next('.chosen-container').addClass('error-border');
                        isValid = false;
                    }
                }
            });

            if (!hasActiveLines) {
                alert("Please add at least one valid line item.");
                return;
            }

            if (!isValid) {
                alert("Please fill in all mandatory fields indicated by the red lines.");
                return;
            }

            // If everything is perfectly valid, submit.
            document.getElementById('action_type').value = action;
            document.getElementById('billForm').submit();
        }
    </script>
</body>

</html>