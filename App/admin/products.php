<?php
if (isset($_GET['action']) && $_GET['action'] == 'check_duplicate') {
    include '../../Controllers/query.ctr.php';
    $query = new Query();
    $table = $_GET['table'];
    $column = $_GET['column'];
    $value = $_GET['value'];
    echo $query->isDuplicate($table, $column, $value) ? '1' : '0';
    exit;
}
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();

// Fetch Core Data for Dropdowns
$types_stmt = $pdo->prepare("SELECT * FROM product_types ORDER BY name ASC");
$types_stmt->execute();
$product_types = $types_stmt->fetchAll();

// Fetch ALL accounts and group them by Class to replicate Xero's Headers
$accounts_stmt = $pdo->prepare("SELECT code, name, class FROM accodes ORDER BY FIELD(class, 'REVENUE', 'EXPENSES', 'ASSETS', 'LIABILITIES', 'EQUITY'), code ASC");
$accounts_stmt->execute();
$all_accounts = $accounts_stmt->fetchAll(PDO::FETCH_ASSOC);

$grouped_accounts = [];
foreach ($all_accounts as $acc) {
    // Capitalize only the first letter for the header to match Xero (e.g., "Expenses")
    $className = ucfirst(strtolower($acc['class']));
    $grouped_accounts[$className][] = $acc;
}
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <title>Manage Products & Services</title>
    <?php $bootstrap->css(); ?>
    <!-- Chosen CSS for Snappy Searchable Dropdowns -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.min.css">
    <style>
        /* Bootstrap 5 & Xero Theme Tweaks for Chosen */
        .chosen-container-single .chosen-single {
            height: 38px !important;
            border: 1px solid #ced4da !important;
            border-radius: 0.375rem !important;
            line-height: 36px !important;
            background: #fff !important;
            box-shadow: none !important;
        }

        .chosen-container-single .chosen-single div b {
            background-position: 0px 7px !important;
        }

        .chosen-container .chosen-results li.group-result {
            font-size: 11px;
            font-weight: 700;
            color: #888;
            padding-top: 10px;
            padding-bottom: 5px;
            border-bottom: 1px solid #f0f0f0;
            text-transform: capitalize;
        }

        .chosen-container .chosen-results li.group-option {
            padding-left: 20px;
        }

        .chosen-container {
            width: 100% !important;
        }

        .chosen-container-single .chosen-search input[type="text"] {
            border-radius: 4px;
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
            <div class="card">
                <div class="card-header bg-warning text-light" style="padding:-10px;">
                    <b>Manage Products & Services</b>
                </div>
                <div class="card-body">
                    <?php
                    // POST ACTION HANDLERS
                    if (isset($_POST['deletebutton'])) {
                        $deleteid = $_POST['deleteid'];
                        $query->deleteproduct($deleteid);
                    }
                    if (isset($_POST['updatebutton'])) {
                        $id = $_POST['updateid'];
                        $code = $_POST['code'];
                        $name = $_POST['name'];
                        $type_id = $_POST['type_id'];
                        $unit = $_POST['unit'];
                        $description = $_POST['description'];

                        $is_purchased = isset($_POST['is_purchased']) ? 1 : 0;
                        $purchase_account = $is_purchased ? $_POST['purchase_account'] : NULL;

                        $is_sold = isset($_POST['is_sold']) ? 1 : 0;
                        $sales_account = $is_sold ? $_POST['sales_account'] : NULL;

                        $query->updateproduct($id, $code, $name, $description, $type_id, $unit, $is_purchased, $purchase_account, $is_sold, $sales_account);
                    }
                    if (isset($_POST['addbutton'])) {
                        $code = $_POST['code'];
                        $name = $_POST['name'];
                        $type_id = $_POST['type_id'];
                        $unit = $_POST['unit'];
                        $description = $_POST['description'];

                        $is_purchased = isset($_POST['is_purchased']) ? 1 : 0;
                        $purchase_account = $is_purchased ? $_POST['purchase_account'] : NULL;

                        $is_sold = isset($_POST['is_sold']) ? 1 : 0;
                        $sales_account = $is_sold ? $_POST['sales_account'] : NULL;

                        $query->addproduct($code, $name, $description, $type_id, $unit, $is_purchased, $purchase_account, $is_sold, $sales_account);
                    }

                    // GET LOGIC FOR SEARCH & PAGINATION
                    $pageno = !empty($_GET['pageno']) ? $_GET['pageno'] : 1;
                    $numOfrecs = 12;
                    $offset = ($pageno - 1) * $numOfrecs;

                    $keyword = isset($_GET['search_keyword']) ? trim($_GET['search_keyword']) : '';
                    $filter_type = isset($_GET['filter_type']) ? $_GET['filter_type'] : '';

                    $qs = "";
                    if (!empty($keyword)) $qs .= "&search_keyword=" . urlencode($keyword);
                    if (!empty($filter_type)) $qs .= "&filter_type=" . urlencode($filter_type);
                    if (isset($_GET['searchproduct'])) $qs .= "&searchproduct=Search";
                    ?>

                    <form action="products.php" method="get" class="d-inline">
                        <input type="text" name="search_keyword" class="form-control d-inline" placeholder="Search Code or Name" value="<?php echo htmlspecialchars($keyword); ?>" style="width:20%; padding: 0px 5px !important; margin: 0 !important; font-size: 15px !important;">

                        <select name="filter_type" class="form-control d-inline" style="width:15%; padding: 0px 5px !important; margin: 0 !important; font-size: 15px !important;">
                            <option value="">All Types</option>
                            <?php foreach ($product_types as $pt): ?>
                                <option value="<?php echo $pt['id']; ?>" <?php echo ($filter_type == $pt['id']) ? 'selected' : ''; ?>><?php echo htmlspecialchars($pt['name']); ?></option>
                            <?php endforeach; ?>
                        </select>

                        <button type="submit" name="searchproduct" class="btn btn-info btn-sm">Search</button>
                        <?php if (!empty($keyword) || !empty($filter_type)): ?>
                            <a href="products.php" class="btn btn-secondary btn-sm">Clear</a>
                        <?php endif; ?>
                    </form>

                    <button type="button" class="btn btn-success float-end btn-sm mb-2" data-bs-toggle="modal" data-bs-target="#addmodal">
                        New Product/Service
                    </button>

                    <table class="mt-1 table table-bordered table-striped rounded">
                        <tr>
                            <th width="10%">Code</th>
                            <th width="25%">Product Name</th>
                            <th width="15%">Type</th>
                            <th width="20%">Purchase A/C</th>
                            <th width="20%">Sales A/C</th>
                            <th width="10%">Action</th>
                        </tr>
                        <?php
                        // DYNAMIC QUERY
                        $where = "1=1";
                        if ($keyword != '') {
                            $where .= " AND (products.name LIKE '%$keyword%' OR products.code LIKE '%$keyword%')";
                        }
                        if ($filter_type != '') {
                            $where .= " AND products.type_id = '$filter_type'";
                        }

                        $stmt = $pdo->prepare("
                            SELECT products.*, product_types.name AS type_name 
                            FROM products 
                            LEFT JOIN product_types ON products.type_id = product_types.id 
                            WHERE $where ORDER BY products.id DESC
                        ");
                        $stmt->execute();
                        $rawResult = $stmt->fetchAll();
                        $total_pages = ceil(count($rawResult) / $numOfrecs);
                        if ($total_pages == 0) $total_pages = 1;

                        $stmt = $pdo->prepare("
                            SELECT products.*, product_types.name AS type_name 
                            FROM products 
                            LEFT JOIN product_types ON products.type_id = product_types.id 
                            WHERE $where ORDER BY products.id DESC LIMIT $offset, $numOfrecs
                        ");
                        $stmt->execute();
                        $productdatas = $stmt->fetchAll();
                        ?>

                        <?php foreach ($productdatas as $data) { ?>
                            <tr>
                                <td class="fw-bold"><?php echo htmlspecialchars($data['code']); ?></td>
                                <td><?php echo htmlspecialchars($data['name']); ?></td>
                                <td><?php echo htmlspecialchars($data['type_name']); ?></td>
                                <td><?php echo ($data['is_purchased']) ? htmlspecialchars($data['purchase_account']) : '<span class="text-muted">-</span>'; ?></td>
                                <td><?php echo ($data['is_sold']) ? htmlspecialchars($data['sales_account']) : '<span class="text-muted">-</span>'; ?></td>
                                <td>
                                    <button type="button" class="btn btn-warning btn-sm text-light" data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $data['id']; ?>">Edit</button>
                                    <form action="products.php" method="post" style="display: inline !important;">
                                        <input type="hidden" name="deleteid" value="<?php echo $data['id']; ?>">
                                        <button type="submit" name="deletebutton" class="btn btn-sm btn-danger" onclick="return confirm('Delete this product?');">Delete</button>
                                    </form>
                                </td>
                            </tr>

                            <!-- Data Update Modal -->
                            <div class="modal fade" id="updatemodal<?php echo $data['id']; ?>" tabindex="-1" role="dialog">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header bg-warning text-light">
                                            <h5 class="modal-title">Edit Product/Service</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <form action="products.php" method="post" autocomplete="off">
                                            <div class="modal-body">
                                                <input type="hidden" name="updateid" value="<?php echo $data['id']; ?>">

                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <label>Item Code</label>
                                                        <input type="text" name="code" class="form-control" value="<?php echo htmlspecialchars($data['code']); ?>" required>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <label>Item Name</label>
                                                        <input type="text" name="name" class="form-control" value="<?php echo htmlspecialchars($data['name']); ?>" required>
                                                    </div>
                                                </div>
                                                <br>

                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <label>Product Type</label>
                                                        <select name="type_id" class="form-control" required>
                                                            <?php foreach ($product_types as $pt): ?>
                                                                <option value="<?php echo $pt['id']; ?>" <?php echo ($data['type_id'] == $pt['id']) ? 'selected' : ''; ?>><?php echo htmlspecialchars($pt['name']); ?></option>
                                                            <?php endforeach; ?>
                                                        </select>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label>Unit (Optional)</label>
                                                        <input type="text" name="unit" class="form-control" placeholder="e.g. Kg, Pcs, Lb" value="<?php echo htmlspecialchars($data['unit']); ?>">
                                                    </div>
                                                </div>
                                                <br>

                                                <label>Description</label>
                                                <textarea name="description" class="form-control" rows="2"><?php echo htmlspecialchars($data['description']); ?></textarea>
                                                <hr>

                                                <!-- XERO STYLE PURCHASE CHECKBOX -->
                                                <div class="mb-3 border p-3 rounded">
                                                    <div class="form-check fw-bold mb-2">
                                                        <input class="form-check-input check-purchase" type="checkbox" name="is_purchased" data-target="edit_pur_ac_<?php echo $data['id']; ?>" id="edit_pur_<?php echo $data['id']; ?>" value="1" <?php echo ($data['is_purchased'] == 1) ? 'checked' : ''; ?>>
                                                        <label class="form-check-label" for="edit_pur_<?php echo $data['id']; ?>">I purchase this item</label>
                                                    </div>
                                                    <label class="text-muted" style="font-size:12px;">Purchase Account</label>
                                                    <select name="purchase_account" id="edit_pur_ac_<?php echo $data['id']; ?>" class="form-control chosen-select" data-placeholder="-- Select Account --" <?php echo ($data['is_purchased'] == 1) ? '' : 'disabled'; ?>>
                                                        <option value=""></option>
                                                        <?php foreach ($grouped_accounts as $class => $accounts): ?>
                                                            <optgroup label="<?php echo htmlspecialchars($class); ?>">
                                                                <?php foreach ($accounts as $acc): ?>
                                                                    <option value="<?php echo $acc['code']; ?>" <?php echo ($data['purchase_account'] == $acc['code']) ? 'selected' : ''; ?>><?php echo $acc['code'] . ' - ' . $acc['name']; ?></option>
                                                                <?php endforeach; ?>
                                                            </optgroup>
                                                        <?php endforeach; ?>
                                                    </select>
                                                </div>

                                                <!-- XERO STYLE SALES CHECKBOX -->
                                                <div class="mb-3 border p-3 rounded">
                                                    <div class="form-check fw-bold mb-2">
                                                        <input class="form-check-input check-sales" type="checkbox" name="is_sold" data-target="edit_sal_ac_<?php echo $data['id']; ?>" id="edit_sal_<?php echo $data['id']; ?>" value="1" <?php echo ($data['is_sold'] == 1) ? 'checked' : ''; ?>>
                                                        <label class="form-check-label" for="edit_sal_<?php echo $data['id']; ?>">I sell this item</label>
                                                    </div>
                                                    <label class="text-muted" style="font-size:12px;">Sales Account</label>
                                                    <select name="sales_account" id="edit_sal_ac_<?php echo $data['id']; ?>" class="form-control chosen-select" data-placeholder="-- Select Account --" <?php echo ($data['is_sold'] == 1) ? '' : 'disabled'; ?>>
                                                        <option value=""></option>
                                                        <?php foreach ($grouped_accounts as $class => $accounts): ?>
                                                            <optgroup label="<?php echo htmlspecialchars($class); ?>">
                                                                <?php foreach ($accounts as $acc): ?>
                                                                    <option value="<?php echo $acc['code']; ?>" <?php echo ($data['sales_account'] == $acc['code']) ? 'selected' : ''; ?>><?php echo $acc['code'] . ' - ' . $acc['name']; ?></option>
                                                                <?php endforeach; ?>
                                                            </optgroup>
                                                        <?php endforeach; ?>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-warning" name="updatebutton">Save Changes</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        <?php }; ?>
                    </table>
                    <br>

                    <!-- Pagination -->
                    <div aria-label="Page navigation example" style="float:right;">
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link" href="?pageno=1<?php echo $qs; ?>">First</a></li>
                            <li class="page-item <?php if ($pageno <= 1) echo 'disabled'; ?>">
                                <a class="page-link" href="<?php if ($pageno <= 1) {
                                                                echo '#';
                                                            } else {
                                                                echo "?pageno=" . ($pageno - 1) . $qs;
                                                            } ?>">Previous</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#"><?php echo $pageno; ?></a></li>
                            <li class="page-item <?php if ($pageno >= $total_pages) echo 'disabled'; ?>">
                                <a class="page-link" href="<?php if ($pageno >= $total_pages) {
                                                                echo '#';
                                                            } else {
                                                                echo "?pageno=" . ($pageno + 1) . $qs;
                                                            } ?>">Next</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="?pageno=<?php echo $total_pages . $qs; ?>">Last</a> </li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </div>

    <!-- Data Add Modal -->
    <div class="modal fade" id="addmodal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header bg-secondary text-light">
                    <h5 class="modal-title">New Product or Service</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="products.php" method="post" autocomplete="off">
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-4">
                                <label>Item Code</label>
                                <input type="text" name="code" class="form-control" oninput="validateInput('products', 'code', this.value, 'code_error')" required>
                                <span id="code_error" class="text-danger small"></span>
                            </div>
                            <div class="col-md-8">
                                <label>Item Name</label>
                                <input type="text" name="name" class="form-control" required>
                            </div>
                        </div>
                        <br>

                        <div class="row">
                            <div class="col-md-6">
                                <label>Product Type</label>
                                <select name="type_id" class="form-control" required>
                                    <option value="" disabled selected>-- Select --</option>
                                    <?php foreach ($product_types as $pt): ?>
                                        <option value="<?php echo $pt['id']; ?>"><?php echo htmlspecialchars($pt['name']); ?></option>
                                    <?php endforeach; ?>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label>Unit (Optional)</label>
                                <input type="text" name="unit" class="form-control" placeholder="e.g. Kg, Pcs, Lb">
                            </div>
                        </div>
                        <br>

                        <label>Description (Optional)</label>
                        <textarea name="description" class="form-control" rows="2"></textarea>
                        <hr>

                        <!-- Purchase Section -->
                        <div class="mb-3 border p-3 rounded">
                            <div class="form-check fw-bold mb-2">
                                <input class="form-check-input check-purchase" type="checkbox" name="is_purchased" data-target="add_pur_ac" id="add_pur" value="1">
                                <label class="form-check-label" for="add_pur">I purchase this item</label>
                            </div>
                            <label class="text-muted" style="font-size:12px;">Purchase Account</label>
                            <select name="purchase_account" id="add_pur_ac" class="form-control chosen-select" data-placeholder="Search or Select Account..." disabled>
                                <option value=""></option>
                                <?php foreach ($grouped_accounts as $class => $accounts): ?>
                                    <optgroup label="<?php echo htmlspecialchars($class); ?>">
                                        <?php foreach ($accounts as $acc): ?>
                                            <option value="<?php echo $acc['code']; ?>"><?php echo $acc['code'] . ' - ' . $acc['name']; ?></option>
                                        <?php endforeach; ?>
                                    </optgroup>
                                <?php endforeach; ?>
                            </select>
                        </div>

                        <!-- Sales Section -->
                        <div class="mb-3 border p-3 rounded">
                            <div class="form-check fw-bold mb-2">
                                <input class="form-check-input check-sales" type="checkbox" name="is_sold" data-target="add_sal_ac" id="add_sal" value="1">
                                <label class="form-check-label" for="add_sal">I sell this item</label>
                            </div>
                            <label class="text-muted" style="font-size:12px;">Sales Account</label>
                            <select name="sales_account" id="add_sal_ac" class="form-control chosen-select" data-placeholder="Search or Select Account..." disabled>
                                <option value=""></option>
                                <?php foreach ($grouped_accounts as $class => $accounts): ?>
                                    <optgroup label="<?php echo htmlspecialchars($class); ?>">
                                        <?php foreach ($accounts as $acc): ?>
                                            <option value="<?php echo $acc['code']; ?>"><?php echo $acc['code'] . ' - ' . $acc['name']; ?></option>
                                        <?php endforeach; ?>
                                    </optgroup>
                                <?php endforeach; ?>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-success" name="addbutton">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <?php $bootstrap->javascript(); ?>

    <!-- Chosen JS for Snappy Search -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.min.js"></script>

    <script>
        $(document).ready(function() {
            // Initialize Chosen natively
            $('.chosen-select').chosen({
                width: '100%',
                search_contains: true,
                no_results_text: "No account found matching:"
            });

            // Re-initialize chosen when Modals open to correct dynamic width rendering bugs
            $('.modal').on('shown.bs.modal', function() {
                $(this).find('.chosen-select').chosen('destroy').chosen({
                    width: '100%',
                    search_contains: true,
                    no_results_text: "No account found matching:"
                });
            });

            // Checkbox logic: Enable/Disable Chosen dropdowns dynamically
            $('.check-purchase, .check-sales').on('change', function() {
                var targetId = $(this).data('target');
                var selectEl = $('#' + targetId);

                if (this.checked) {
                    selectEl.prop('disabled', false);
                } else {
                    selectEl.prop('disabled', true);
                    selectEl.val(''); // clear selection internally when disabled
                }

                // Tell chosen.js to instantly update its visual state
                selectEl.trigger('chosen:updated');
            });
        });

        // Backend Duplicate Code Checker
        function validateInput(table, column, value, errorId) {
            if (value.length === 0) {
                document.getElementById(errorId).innerText = "";
                return;
            }
            fetch(`products.php?action=check_duplicate&table=${table}&column=${column}&value=${encodeURIComponent(value)}`)
                .then(response => response.text())
                .then(data => {
                    if (data === '1') {
                        document.getElementById(errorId).innerText = "This code is already taken.";
                    } else {
                        document.getElementById(errorId).innerText = "";
                    }
                });
        }
    </script>
</body>

</html>