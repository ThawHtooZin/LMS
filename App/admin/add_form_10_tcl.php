<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();

// Handle Form 10 TCL Submission
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['add'])) {
    $date    = $_POST['date'] ?? '';
    $country = $_POST['country'] ?? '';

    $item_ids       = $_POST['item_id'] ?? [];
    $sizes          = $_POST['size'] ?? [];
    $mcs            = $_POST['mc'] ?? [];
    $kgs            = $_POST['kg'] ?? [];
    $pcss           = $_POST['pcs'] ?? [];
    $loose_in_kgs   = $_POST['loose_in_kg'] ?? [];
    $loose_in_pcss  = $_POST['loose_in_pcs'] ?? [];
    $loose_out_kgs  = $_POST['loose_out_kg'] ?? [];
    $loose_out_pcss = $_POST['loose_out_pcs'] ?? [];
    $cc_kgs         = $_POST['cc_kg'] ?? [];
    $cc_pcss        = $_POST['cc_pcs'] ?? [];
    $cutpiece_kgs   = $_POST['cutpiece_kg'] ?? [];
    $cutpiece_pcss  = $_POST['cutpiece_pcs'] ?? [];
    $hhk_kgs        = $_POST['hhk_kg'] ?? [];
    $hhk_pcss       = $_POST['hhk_pcs'] ?? [];
    $msl_kgs        = $_POST['msl_kg'] ?? [];
    $msl_pcss       = $_POST['msl_pcs'] ?? [];
    $lanfish_kgs    = $_POST['lanfish_kg'] ?? [];
    $lanfish_pcss   = $_POST['lanfish_pcs'] ?? [];

    $saved_count = 0;

    foreach ($item_ids as $index => $item_id) {
        $item_id = trim($item_id);
        if (empty($item_id)) {
            continue;
        }

        $size        = isset($sizes[$index]) ? trim($sizes[$index]) : '';
        $mc          = isset($mcs[$index]) ? trim($mcs[$index]) : '';
        $kg          = isset($kgs[$index]) ? trim($kgs[$index]) : '';
        $pcs         = isset($pcss[$index]) ? trim($pcss[$index]) : '';
        $looseinkg   = isset($loose_in_kgs[$index]) ? trim($loose_in_kgs[$index]) : '';
        $looseinpcs  = isset($loose_in_pcss[$index]) ? trim($loose_in_pcss[$index]) : '';
        $looseoutkg  = isset($loose_out_kgs[$index]) ? trim($loose_out_kgs[$index]) : '';
        $looseoutpcs = isset($loose_out_pcss[$index]) ? trim($loose_out_pcss[$index]) : '';
        $cckg        = isset($cc_kgs[$index]) ? trim($cc_kgs[$index]) : '';
        $ccpcs       = isset($cc_pcss[$index]) ? trim($cc_pcss[$index]) : '';
        $cutpiecekg  = isset($cutpiece_kgs[$index]) ? trim($cutpiece_kgs[$index]) : '';
        $cutpiecepcs = isset($cutpiece_pcss[$index]) ? trim($cutpiece_pcss[$index]) : '';
        $hhkkg       = isset($hhk_kgs[$index]) ? trim($hhk_kgs[$index]) : '';
        $hhkpcs      = isset($hhk_pcss[$index]) ? trim($hhk_pcss[$index]) : '';
        $mslkg       = isset($msl_kgs[$index]) ? trim($msl_kgs[$index]) : '';
        $mslpcs      = isset($msl_pcss[$index]) ? trim($msl_pcss[$index]) : '';
        $lanfishkg   = isset($lanfish_kgs[$index]) ? trim($lanfish_kgs[$index]) : '';
        $lanfishpcs  = isset($lanfish_pcss[$index]) ? trim($lanfish_pcss[$index]) : '';

        $query->addform10tcl(
            $date, $item_id, $country, $size, $mc, $kg, $pcs,
            $looseinkg, $looseinpcs, $looseoutkg, $looseoutpcs,
            $cckg, $ccpcs, $cutpiecekg, $cutpiecepcs,
            $hhkkg, $hhkpcs, $mslkg, $mslpcs, $lanfishkg, $lanfishpcs
        );
        $saved_count++;
    }

    if ($saved_count > 0) {
        $_SESSION['date']    = $date;
        $_SESSION['country'] = $country;

        $saveResult = [
            'status'   => true,
            'title'    => 'Success!',
            'message'  => "Form 10 TCL ($saved_count items) saved successfully.",
            'redirect' => 'form_10_tcl.php'
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

// Fetch commodities for select option list
$prodFilterStmt = $pdo->query("SELECT id, name FROM products ORDER BY name ASC");
$prodFilterDatas = $prodFilterStmt ? $prodFilterStmt->fetchAll(PDO::FETCH_ASSOC) : [];
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <title>Add Form 10 TCL Data</title>
    <?php $bootstrap->css(); ?>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.min.css">

    <style>
        .table-responsive {
            overflow-y: visible !important;
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
            font-size: 12px;
            color: #6c757d;
            border-bottom: 2px solid #ddd;
            text-transform: uppercase;
        }

        .table-lines input,
        .table-lines select {
            font-size: 13px;
            border-radius: 4px;
            border: 1px solid #ced4da;
            width: 100%;
            height: 34px;
            padding: 4px 6px;
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

            <form action="" method="post" id="form10TclForm" autocomplete="off">
                <input type="hidden" name="add" value="1">

                <div class="bg-white p-4 shadow-sm rounded">
                    <div class="text-muted small"><a href="form_10_tcl.php" class="text-decoration-none">Form 10 TCL Overview</a> > Add Form 10 TCL ></div>
                    <div class="xero-title">Add Form 10 TCL Data</div>

                    <div class="row mb-4 gx-3">
                        <div class="col-md-3">
                            <label class="fw-bold small mb-1">Date</label>
                            <input type="date" name="date" class="form-control req-input" value="<?php echo !empty($_SESSION['date']) ? $_SESSION['date'] : date('Y-m-d'); ?>">
                        </div>
                        <div class="col-md-3">
                            <label class="fw-bold small mb-1">Country</label>
                            <input type="text" name="country" class="form-control req-input" value="<?php echo !empty($_SESSION['country']) ? htmlspecialchars($_SESSION['country']) : ''; ?>" placeholder="e.g. Thailand">
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-borderless table-lines" id="linesTable" style="min-width: 1600px;">
                            <thead>
                                <tr>
                                    <th width="12%">Commodity</th>
                                    <th width="5%">Size</th>
                                    <th width="4%">MC</th>
                                    <th width="5%">Kg</th>
                                    <th width="5%">Pcs</th>
                                    <th width="5%">L-Out Kg</th>
                                    <th width="5%">L-Out Pcs</th>
                                    <th width="5%">L-In Kg</th>
                                    <th width="5%">L-In Pcs</th>
                                    <th width="5%">CC Kg</th>
                                    <th width="5%">CC Pcs</th>
                                    <th width="5%">Cut Kg</th>
                                    <th width="5%">Cut Pcs</th>
                                    <th width="5%">HHK Kg</th>
                                    <th width="5%">HHK Pcs</th>
                                    <th width="5%">MSL Kg</th>
                                    <th width="5%">MSL Pcs</th>
                                    <th width="5%">Lan Kg</th>
                                    <th width="5%">Lan Pcs</th>
                                    <th width="4%" class="text-center">Action</th>
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
                                        <td><input type="text" name="size[]"></td>
                                        <td><input type="number" name="mc[]"></td>
                                        <td><input type="text" name="kg[]"></td>
                                        <td><input type="text" name="pcs[]"></td>
                                        <td><input type="text" name="loose_out_kg[]"></td>
                                        <td><input type="number" name="loose_out_pcs[]"></td>
                                        <td><input type="text" name="loose_in_kg[]"></td>
                                        <td><input type="number" name="loose_in_pcs[]"></td>
                                        <td><input type="text" name="cc_kg[]"></td>
                                        <td><input type="number" name="cc_pcs[]"></td>
                                        <td><input type="text" name="cutpiece_kg[]"></td>
                                        <td><input type="number" name="cutpiece_pcs[]"></td>
                                        <td><input type="text" name="hhk_kg[]"></td>
                                        <td><input type="number" name="hhk_pcs[]"></td>
                                        <td><input type="text" name="msl_kg[]"></td>
                                        <td><input type="number" name="msl_pcs[]"></td>
                                        <td><input type="text" name="lanfish_kg[]"></td>
                                        <td><input type="number" name="lanfish_pcs[]"></td>
                                        <td class="text-center"><button type="button" class="btn btn-outline-danger btn-sm fw-bold" onclick="removeForm10Line(this);">×</button></td>
                                    </tr>
                                <?php endfor; ?>
                            </tbody>
                        </table>
                    </div>

                    <button type="button" class="btn btn-outline-primary btn-sm fw-bold mt-2" onclick="addForm10Line();">Add a new line</button>

                    <hr class="mt-5">
                    <div class="d-flex justify-content-end gap-2">
                        <a href="form_10_tcl.php" class="btn btn-secondary">Cancel</a>
                        <button type="button" class="btn btn-success fw-bold px-4" onclick="validateAndSubmit();">Save Form 10 TCL</button>
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
                    <td><input type="text" name="size[]"></td>
                    <td><input type="number" name="mc[]"></td>
                    <td><input type="text" name="kg[]"></td>
                    <td><input type="text" name="pcs[]"></td>
                    <td><input type="text" name="loose_out_kg[]"></td>
                    <td><input type="number" name="loose_out_pcs[]"></td>
                    <td><input type="text" name="loose_in_kg[]"></td>
                    <td><input type="number" name="loose_in_pcs[]"></td>
                    <td><input type="text" name="cc_kg[]"></td>
                    <td><input type="number" name="cc_pcs[]"></td>
                    <td><input type="text" name="cutpiece_kg[]"></td>
                    <td><input type="number" name="cutpiece_pcs[]"></td>
                    <td><input type="text" name="hhk_kg[]"></td>
                    <td><input type="number" name="hhk_pcs[]"></td>
                    <td><input type="text" name="msl_kg[]"></td>
                    <td><input type="number" name="msl_pcs[]"></td>
                    <td><input type="text" name="lanfish_kg[]"></td>
                    <td><input type="number" name="lanfish_pcs[]"></td>
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
            document.getElementById('form10TclForm').submit();
        }
    </script>
</body>

</html>