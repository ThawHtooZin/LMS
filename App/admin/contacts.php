<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <title>Manage Contacts</title>
    <?php $bootstrap->css(); ?>
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
                    <b>Manage Contacts</b>
                </div>
                <div class="card-body">
                    <?php
                    // POST ACTION HANDLERS
                    if (isset($_POST['deletebutton'])) {
                        $deleteid = $_POST['deleteid'];
                        $query->deletecontact($deleteid);
                    }
                    if (isset($_POST['updatebutton'])) {
                        $id = $_POST['updateid'];
                        $name = $_POST['name'];
                        $phone = $_POST['phone'];
                        $email = $_POST['email'];
                        $address = $_POST['address'];
                        $is_supplier = ($_POST['contact_role'] == 'supplier') ? 1 : 0;
                        $is_customer = ($_POST['contact_role'] == 'customer') ? 1 : 0;
                        
                        // NEW: Capture Contact Type
                        $contact_type = $_POST['contact_type'];

                        // We pass $contact_type as the 8th parameter (Phase 4 will update this function)
                        $query->updatecontact($id, $name, $phone, $email, $address, $is_supplier, $is_customer, $contact_type);
                    }
                    if (isset($_POST['addbutton'])) {
                        $name = $_POST['name'];
                        $phone = $_POST['phone'];
                        $email = $_POST['email'];
                        $address = $_POST['address'];
                        $is_supplier = ($_POST['contact_role'] == 'supplier') ? 1 : 0;
                        $is_customer = ($_POST['contact_role'] == 'customer') ? 1 : 0;
                        
                        // NEW: Capture Contact Type
                        $contact_type = $_POST['contact_type'];

                        // We pass $contact_type as the 7th parameter (Phase 4 will update this function)
                        $query->addcontact($name, $phone, $email, $address, $is_supplier, $is_customer, $contact_type);
                    }
                    ?>

                    <?php
                    // GET LOGIC FOR SEARCH & PAGINATION
                    if (!empty($_GET['pageno'])) {
                        $pageno = $_GET['pageno'];
                    } else {
                        $pageno = 1;
                    }
                    $numOfrecs = 12;
                    $offset = ($pageno - 1) * $numOfrecs;

                    $keyword = isset($_GET['search_keyword']) ? trim($_GET['search_keyword']) : '';
                    $role = isset($_GET['filter_role']) ? $_GET['filter_role'] : '';
                    $type_filter = isset($_GET['filter_type']) ? $_GET['filter_type'] : ''; // NEW FILTER

                    $qs = "";
                    if (!empty($keyword)) $qs .= "&search_keyword=" . urlencode($keyword);
                    if (!empty($role)) $qs .= "&filter_role=" . urlencode($role);
                    if (!empty($type_filter)) $qs .= "&filter_type=" . urlencode($type_filter);
                    if (isset($_GET['searchcontact'])) $qs .= "&searchcontact=Search";
                    ?>

                    <form action="contacts.php" method="get" class="d-inline">
                        <input type="text" name="search_keyword" class="form-control d-inline" placeholder="Search..." value="<?php echo htmlspecialchars($keyword); ?>" style="width:15%; padding: 0px 5px !important; margin: 0 !important; font-size: 15px !important;">

                        <select name="filter_role" class="form-control d-inline" style="width:15%; padding: 0px 5px !important; margin: 0 !important; font-size: 15px !important;">
                            <option value="">All Roles</option>
                            <option value="supplier" <?php if ($role == 'supplier') echo 'selected'; ?>>Supplier</option>
                            <option value="customer" <?php if ($role == 'customer') echo 'selected'; ?>>Customer</option>
                        </select>

                        <!-- NEW: Type Filter -->
                        <select name="filter_type" class="form-control d-inline" style="width:15%; padding: 0px 5px !important; margin: 0 !important; font-size: 15px !important;">
                            <option value="">All Types</option>
                            <option value="Fish Supplier" <?php if ($type_filter == 'Fish Supplier') echo 'selected'; ?>>Fish Supplier</option>
                            <option value="Material Supplier" <?php if ($type_filter == 'Material Supplier') echo 'selected'; ?>>Material Supplier</option>
                            <option value="Cold Store Factory" <?php if ($type_filter == 'Cold Store Factory') echo 'selected'; ?>>Cold Store Factory</option>
                            <option value="Other" <?php if ($type_filter == 'Other') echo 'selected'; ?>>Other</option>
                        </select>

                        <button type="submit" name="searchcontact" class="btn btn-info btn-sm">Search</button>
                        <?php if (!empty($keyword) || !empty($role) || !empty($type_filter)): ?>
                            <a href="contacts.php" class="btn btn-secondary btn-sm">Clear</a>
                        <?php endif; ?>
                    </form>

                    <button type="button" class="btn btn-success float-end btn-sm" data-bs-toggle="modal" data-bs-target="#addmodal">
                        Add Contact
                    </button>

                    <table class="mt-1 table table-bordered table-striped rounded">
                        <tr>
                            <th>ID</th>
                            <th>Contact Name</th>
                            <th>Type</th>
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Role</th>
                            <th>Action</th>
                        </tr>
                        <?php
                        $where = "1=1";
                        if ($keyword != '') {
                            $where .= " AND (name LIKE '%$keyword%' OR phone LIKE '%$keyword%' OR email LIKE '%$keyword%')";
                        }
                        if ($role == 'supplier') {
                            $where .= " AND is_supplier=1";
                        } elseif ($role == 'customer') {
                            $where .= " AND is_customer=1";
                        }
                        // NEW: Apply Type Filter
                        if ($type_filter != '') {
                            $where .= " AND contact_type='$type_filter'";
                        }

                        $stmt = $pdo->prepare("SELECT * FROM contacts WHERE $where ORDER BY id DESC");
                        $stmt->execute();
                        $rawResult = $stmt->fetchAll();
                        $total_pages = ceil(count($rawResult) / $numOfrecs);
                        if ($total_pages == 0) $total_pages = 1;

                        $stmt = $pdo->prepare("SELECT * FROM contacts WHERE $where ORDER BY id DESC LIMIT $offset, $numOfrecs");
                        $stmt->execute();
                        $contactdatas = $stmt->fetchAll();
                        ?>

                        <?php foreach ($contactdatas as $data) { ?>
                            <tr>
                                <td><?php echo $data['id']; ?></td>
                                <td><?php echo htmlspecialchars($data['name']); ?></td>
                                <!-- NEW: Show Type -->
                                <td class="fw-bold text-secondary"><?php echo htmlspecialchars($data['contact_type']); ?></td>
                                <td><?php echo htmlspecialchars($data['phone']); ?></td>
                                <td><?php echo htmlspecialchars($data['email']); ?></td>
                                <td>
                                    <?php
                                    if ($data['is_supplier'] == 1) echo "<span class='badge bg-primary'>Supplier</span> ";
                                    if ($data['is_customer'] == 1) echo "<span class='badge bg-info text-dark'>Customer</span> ";
                                    ?>
                                </td>
                                <td>
                                    <button type="button" class="btn btn-warning btn-sm text-light" data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $data['id']; ?>">Edit</button>
                                    <form action="" method="post" style="display: inline !important;">
                                        <input type="hidden" name="deleteid" value="<?php echo $data['id']; ?>">
                                        <button type="submit" name="deletebutton" class="btn btn-sm btn-danger" onclick="return confirm('Delete this contact?');">Delete</button>
                                    </form>
                                </td>
                            </tr>

                            <!-- Data Update Modal -->
                            <div class="modal fade" id="updatemodal<?php echo $data['id']; ?>" tabindex="-1" role="dialog">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header bg-warning text-light">
                                            <h5 class="modal-title">Update Contact</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <form action="contacts.php" method="post" autocomplete="off">
                                            <div class="modal-body">
                                                <input type="hidden" name="updateid" value="<?php echo $data['id']; ?>">

                                                <label class="fw-bold mt-2">Contact Name</label>
                                                <input type="text" name="name" class="form-control" value="<?php echo htmlspecialchars($data['name']); ?>" required>

                                                <!-- NEW: Update Contact Type -->
                                                <label class="fw-bold mt-2">Contact Type</label>
                                                <select name="contact_type" class="form-control" required>
                                                    <option value="Fish Supplier" <?php echo ($data['contact_type'] == 'Fish Supplier') ? 'selected' : ''; ?>>Fish Supplier</option>
                                                    <option value="Material Supplier" <?php echo ($data['contact_type'] == 'Material Supplier') ? 'selected' : ''; ?>>Material Supplier</option>
                                                    <option value="Cold Store Factory" <?php echo ($data['contact_type'] == 'Cold Store Factory') ? 'selected' : ''; ?>>Cold Store Factory</option>
                                                    <option value="Other" <?php echo ($data['contact_type'] == 'Other') ? 'selected' : ''; ?>>Other</option>
                                                </select>

                                                <label class="fw-bold mt-2">Contact Phone</label>
                                                <input type="text" name="phone" class="form-control" value="<?php echo htmlspecialchars($data['phone']); ?>">

                                                <label class="fw-bold mt-2">Contact Email</label>
                                                <input type="email" name="email" class="form-control" value="<?php echo htmlspecialchars($data['email']); ?>">

                                                <label class="fw-bold mt-2">Contact Address</label>
                                                <input type="text" name="address" class="form-control" value="<?php echo htmlspecialchars($data['address']); ?>">

                                                <label class="fw-bold mt-3">Role</label><br>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="contact_role" value="supplier" <?php echo ($data['is_supplier'] == 1) ? 'checked' : ''; ?> required>
                                                    <label class="form-check-label">Supplier</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="contact_role" value="customer" <?php echo ($data['is_customer'] == 1) ? 'checked' : ''; ?> required>
                                                    <label class="form-check-label">Customer</label>
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
                                <a class="page-link" href="<?php if ($pageno <= 1) { echo '#'; } else { echo "?pageno=" . ($pageno - 1) . $qs; } ?>">Previous</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#"><?php echo $pageno; ?></a></li>
                            <li class="page-item <?php if ($pageno >= $total_pages) echo 'disabled'; ?>">
                                <a class="page-link" href="<?php if ($pageno >= $total_pages) { echo '#'; } else { echo "?pageno=" . ($pageno + 1) . $qs; } ?>">Next</a>
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
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header bg-secondary text-light">
                    <h5 class="modal-title">Create New Contact</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="contacts.php" method="post" autocomplete="off">
                    <div class="modal-body">
                        <label class="fw-bold">Contact Name</label>
                        <input type="text" name="name" class="form-control" placeholder="e.g., Shwe Myay" required>
                        
                        <!-- NEW: Add Contact Type -->
                        <label class="fw-bold mt-2">Contact Type</label>
                        <select name="contact_type" class="form-control" required>
                            <option value="Fish Supplier" selected>Fish Supplier</option>
                            <option value="Material Supplier">Material Supplier</option>
                            <option value="Cold Store Factory">Cold Store Factory</option>
                            <option value="Other">Other</option>
                        </select>

                        <label class="fw-bold mt-2">Contact Phone</label>
                        <input type="text" name="phone" class="form-control" placeholder="09xxxxxxxxx">
                        
                        <label class="fw-bold mt-2">Contact Email</label>
                        <input type="email" name="email" class="form-control" placeholder="contact@example.com">
                        
                        <label class="fw-bold mt-2">Contact Address</label>
                        <input type="text" name="address" class="form-control" placeholder="Address Details">
                        
                        <label class="fw-bold mt-3">Role</label><br>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="contact_role" value="supplier" required checked>
                            <label class="form-check-label">Supplier</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="contact_role" value="customer" required>
                            <label class="form-check-label">Customer</label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-success" name="addbutton">Add Contact</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <?php $bootstrap->javascript(); ?>
</body>
</html>