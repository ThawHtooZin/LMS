<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();

// Handle Form 10 Submission
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['add'])) {
    $date        = $_POST['date'] ?? '';
    $supplier_id = $_POST['supplier_id'] ?? '';
    $country     = $_POST['country'] ?? '';
    $type        = $_POST['type'] ?? 'frozen';

    $item_ids       = $_POST['item_id'] ?? [];
    $fish_types     = $_POST['fish_type'] ?? [];
    $sizes          = $_POST['size'] ?? [];
    $mcs            = $_POST['mc'] ?? [];
    $kgs            = $_POST['kg'] ?? [];
    $pcss           = $_POST['pcs'] ?? [];
    $loose_in_kgs   = $_POST['loose_in_kg'] ?? [];
    $loose_in_pcss  = $_POST['loose_in_pcs'] ?? [];
    $loose_out_kgs  = $_POST['loose_out_kg'] ?? [];
    $loose_out_pcss = $_POST['loose_out_pcs'] ?? [];

    $saved_count = 0;

    foreach ($item_ids as $index => $item_id) {
        $item_id = trim($item_id);
        if (empty($item_id)) {
            continue;
        }

        $fish_type   = isset($fish_types[$index]) ? trim($fish_types[$index]) : '';
        $size        = isset($sizes[$index]) ? trim($sizes[$index]) : '';
        $mc          = isset($mcs[$index]) ? trim($mcs[$index]) : '';
        $kg          = isset($kgs[$index]) ? trim($kgs[$index]) : '';
        $pcs         = isset($pcss[$index]) ? trim($pcss[$index]) : '';
        $looseinkg   = isset($loose_in_kgs[$index]) ? trim($loose_in_kgs[$index]) : '';
        $looseinpcs  = isset($loose_in_pcss[$index]) ? trim($loose_in_pcss[$index]) : '';
        $looseoutkg  = isset($loose_out_kgs[$index]) ? trim($loose_out_kgs[$index]) : '';
        $looseoutpcs = isset($loose_out_pcss[$index]) ? trim($loose_out_pcss[$index]) : '';

        // Execute DB insertion directly via Query controller class
        $query->addform10(
            $date, 
            $item_id, 
            $fish_type, 
            $supplier_id, 
            $country, 
            $type, 
            $size, 
            $mc, 
            $kg, 
            $pcs, 
            $looseinkg, 
            $looseinpcs, 
            $looseoutkg, 
            $looseoutpcs
        );
        $saved_count++;
    }

    if ($saved_count > 0) {
        $_SESSION['date']        = $date;
        $_SESSION['supplier_id'] = $supplier_id;
        $_SESSION['country']     = $country;

        $saveResult = [
            'status'   => true,
            'title'    => 'Success!',
            'message'  => "Form 10 ($saved_count items) saved successfully.",
            'redirect' => 'form_10_frozen.php'
        ];
    } else {
        $saveResult = [
            'status'   => false,
            'title'    => 'Error!',
            'message'  => "No items were selected to save.",
            'redirect' => ''
        ];
    }
}

// Fetch suppliers & commodities
$suppliers = $pdo->query("SELECT id, name FROM contacts WHERE is_supplier = 1 OR is_supplier = 0 ORDER BY name ASC")->fetchAll(PDO::FETCH_ASSOC);
$prodFilterStmt = $pdo->query("SELECT id, name FROM products ORDER BY name ASC");
$prodFilterDatas = $prodFilterStmt ? $prodFilterStmt->fetchAll(PDO::FETCH_ASSOC) : [];
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <title>Add Form 10 Data</title>
    <?php $bootstrap->css(); ?>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.min.css">
    
    <style>
        .table-responsive {
            overflow-y: hidden !important;
        }

        .chosen-container-single .chosen-single {
            height: 34px !important;
            border: 1px solid #ced4da !important;
            border-radius: 0.375rem !important;
            line-height: 32px !important;
            background: #fff !important;
            box-shadow: none !important;
        }

        .table-lines th, 
        .table-lines td {
            vertical-align: middle;
            padding: 6px 4px;
        }

        .table-lines th {
            font-size: 13px;
            color: #6c757d;
            border-bottom: 2px solid #ddd;
        }

        .table-lines input, 
        .table-lines select {
            font-size: 14px;
            border-radius: 4px;
            border: 1px solid #ced4da;
            width: 100%;
            height: 34px;
            padding: 4px 8px;
            box-sizing: border-box;
        }

        .xero-title {
            font-size: 24px;
            font-weight: normal;
            color: #202e3c;
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

    <?php $bootstrap->javascriptindex(); ?>

    <?php if (!empty($saveResult)): ?>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            swal({
                title: <?= json_encode($saveResult['title']); ?>,
                text: <?= json_encode($saveResult['message']); ?>,
                icon: <?= json_encode($saveResult['status'] ? 'success' : 'error'); ?>
            }).then(function() {
                <?php if (!empty($saveResult['redirect'])): ?>
                    window.location.href = <?= json_encode($saveResult['redirect']); ?>;
                <?php endif; ?>
            });
        });
    </script>
    <?php endif; ?>

    <div class="row">
        <div class="sidebarcol" id="sidebar">
            <?php include 'sidebar.php'; ?>
        </div>
        <div class="contentcol" id="content">
            <?php require 'navbar.php'; ?>

            <form action="" method="post" id="form10Form" autocomplete="off">
                <input type="hidden" name="add" value="1">

                <div class="bg-white p-4 shadow-sm rounded">
                    <div class="text-muted small"><a href="form_10_frozen.php" class="text-decoration-none">Form 10 Overview</a> > Add Form 10 ></div>
                    <div class="xero-title">Add Form 10 Data</div>

                    <div class="row mb-4 gx-3">
                        <div class="col-md-3">
                            <label class="fw-bold small mb-1">Date</label>
                            <input type="date" name="date" class="form-control req-input" value="<?php echo !empty($_SESSION['date']) ? $_SESSION['date'] : date('Y-m-d'); ?>">
                        </div>
                        <div class="col-md-3">
                            <label class="fw-bold small mb-1">Type</label>
                            <select class="form-select form-select-sm" name="type">
                                <option value="frozen">Frozen</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label class="fw-bold small mb-1">Supplier</label><br>
                            <select name="supplier_id" class="form-control chosen-select req-input" data-placeholder="Select Supplier">
                                <option value=""></option>
                                <?php foreach ($suppliers as $sup): ?>
                                    <option value="<?php echo $sup['id']; ?>" <?php echo (!empty($_SESSION['supplier_id']) && $_SESSION['supplier_id'] == $sup['id']) ? 'selected' : ''; ?>>
                                        <?php echo htmlspecialchars($sup['name']); ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <label class="fw-bold small mb-1">Country</label>
                            <input type="text" name="country" class="form-control req-input" value="<?php echo !empty($_SESSION['country']) ? htmlspecialchars($_SESSION['country']) : ''; ?>" placeholder="e.g. Thailand">
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-borderless table-lines" id="linesTable" style="min-width: 1100px;">
                            <thead>
                                <tr>
                                    <th width="15%">Commodity</th>
                                    <th width="10%">Fish Type</th>
                                    <th width="8%">Size</th>
                                    <th width="8%">MC</th>
                                    <th width="8%">Kg</th>
                                    <th width="8%">Pcs</th>
                                    <th width="9%">L-In Kg</th>
                                    <th width="9%">L-In Pcs</th>
                                    <th width="9%">L-Out Kg</th>
                                    <th width="9%">L-Out Pcs</th>
                                    <th width="5%" class="text-center">Action</th>
                                </tr>
                            </thead>
                            <tbody id="form10-lines">
                                <?php for ($i = 0; $i < 5; $i++): ?>
                                <tr>
                                    <td>
                                        <select name="item_id[]" class="form-control chosen-select item-select">
                                            <option value="">- Select Item -</option>
                                            <?php foreach ($prodFilterDatas as $commonditydata): ?>
                                                <option value="<?php echo htmlspecialchars($commonditydata['id']); ?>">
                                                    <?php echo htmlspecialchars($commonditydata['name']); ?>
                                                </option>
                                            <?php endforeach; ?>
                                        </select>
                                    </td>
                                    <td>
                                        <select name="fish_type[]" class="form-select form-select-sm">
                                            <option value="G">G</option>
                                            <option value="egg">egg</option>
                                            <option value="ggs">ggs</option>
                                            <option value="fillet">fillet</option>
                                            <option value="W">W</option>
                                            <option value="Cut_piece">Cut Piece</option>
                                            <option value="Scaless">Scaless</option>
                                            <option value="Bls">Bl's</option>
                                            <option value="iqf">IQF</option>
                                        </select>
                                    </td>
                                    <td><input type="text" name="size[]"></td>
                                    <td><input type="number" name="mc[]"></td>
                                    <td><input type="text" name="kg[]"></td>
                                    <td><input type="text" name="pcs[]"></td>
                                    <td><input type="text" name="loose_in_kg[]"></td>
                                    <td><input type="number" name="loose_in_pcs[]"></td>
                                    <td><input type="text" name="loose_out_kg[]"></td>
                                    <td><input type="number" name="loose_out_pcs[]"></td>
                                    <td class="text-center"><button type="button" class="btn btn-outline-danger btn-sm fw-bold" onclick="removeForm10Line(this);">×</button></td>
                                </tr>
                                <?php endfor; ?>
                            </tbody>
                        </table>
                    </div>

                    <button type="button" class="btn btn-outline-primary btn-sm fw-bold mt-2" onclick="addForm10Line();">Add a new line</button>

                    <hr class="mt-5">
                    <div class="d-flex justify-content-end gap-2">
                        <a href="form_10_frozen.php" class="btn btn-secondary">Cancel</a>
                        <button type="button" class="btn btn-success fw-bold px-4" onclick="validateAndSubmit();">Save Form 10</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- Hidden Commodity Options Template -->
    <select id="itemTpl" style="display:none;">
        <option value="">- Select Item -</option>
        <?php foreach ($prodFilterDatas as $commonditydata): ?>
            <option value="<?php echo htmlspecialchars($commonditydata['id']); ?>"><?php echo htmlspecialchars($commonditydata['name']); ?></option>
        <?php endforeach; ?>
    </select>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <?php $bootstrap->javascript(); ?>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.min.js"></script>
    <script>
        $(document).ready(function() {
            $('.chosen-select').chosen({
                width: '100%',
                search_contains: true
            });

            $(document).on('input change', '.req-input, .error-border, select', function() {
                $(this).removeClass('error-border');
                if ($(this).is('select')) {
                    $(this).next('.chosen-container').removeClass('error-border');
                }
            });
        });

        function addForm10Line() {
            let tr = `
                <tr>
                    <td>
                        <select name="item_id[]" class="form-control chosen-select item-select">${$('#itemTpl').html()}</select>
                    </td>
                    <td>
                        <select name="fish_type[]" class="form-select form-select-sm">
                            <option value="G">G</option>
                            <option value="egg">egg</option>
                            <option value="ggs">ggs</option>
                            <option value="fillet">fillet</option>
                            <option value="W">W</option>
                            <option value="Cut_piece">Cut Piece</option>
                            <option value="Scaless">Scaless</option>
                            <option value="Bls">Bl's</option>
                            <option value="iqf">IQF</option>
                        </select>
                    </td>
                    <td><input type="text" name="size[]"></td>
                    <td><input type="number" name="mc[]"></td>
                    <td><input type="text" name="kg[]"></td>
                    <td><input type="text" name="pcs[]"></td>
                    <td><input type="text" name="loose_in_kg[]"></td>
                    <td><input type="number" name="loose_in_pcs[]"></td>
                    <td><input type="text" name="loose_out_kg[]"></td>
                    <td><input type="number" name="loose_out_pcs[]"></td>
                    <td class="text-center"><button type="button" class="btn btn-outline-danger btn-sm fw-bold" onclick="removeForm10Line(this);">×</button></td>
                </tr>
            `;
            $('#form10-lines').append(tr);
            $('#form10-lines tr:last-child .chosen-select').chosen({
                width: '100%',
                search_contains: true
            });
        }

        function removeForm10Line(button) {
            let tbody = $('#form10-lines');
            if (tbody.find('tr').length > 1) {
                $(button).closest('tr').remove();
            } else {
                swal('Warning!', 'You must keep at least one line item.', 'warning');
            }
        }

        function validateAndSubmit() {
            let isValid = true;
            $('.error-border').removeClass('error-border');

            let supplier = $('select[name="supplier_id"]');
            if (!supplier.val()) {
                supplier.next('.chosen-container').addClass('error-border');
                isValid = false;
            }

            let dateField = $('input[name="date"]');
            if (!dateField.val()) {
                dateField.addClass('error-border');
                isValid = false;
            }

            let countryField = $('input[name="country"]');
            if (!countryField.val().trim()) {
                countryField.addClass('error-border');
                isValid = false;
            }

            let hasActiveLines = false;
            $('#form10-lines tr').each(function() {
                let itemSelect = $(this).find('select[name="item_id[]"]');
                let itemId = itemSelect.val();

                if (itemId) {
                    hasActiveLines = true;
                }
            });

            if (!hasActiveLines) {
                $('#form10-lines tr:first-child select[name="item_id[]"]').next('.chosen-container').addClass('error-border');
                swal('Warning!', 'Please select at least one Commodity item.', 'warning');
                return;
            }

            if (!isValid) {
                swal('Warning!', 'Please fill in all mandatory fields indicated by red borders.', 'warning');
                return;
            }

            $('.chosen-select').trigger('chosen:updated');
            document.getElementById('form10Form').submit();
        }
    </script>
</body>

</html>