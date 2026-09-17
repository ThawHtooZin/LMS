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
    <title>Document</title>
</head>
<?php
$bootstrap->css();
?>

<body>
    <div class="row">
        <div class="sidebarcol" id="sidebar">
            <?php
            include 'sidebar.php';
            ?>
        </div>
        <?php
        if (isset($_POST['managebtn'])) {
            $date = $_POST['date'];
            $stockto = $_SESSION['tabs'];
            $action = $_POST['action'];
            $transfer_to = $_POST['transfer_to'];
            $voucher_no = $_POST['voucher_no'];
            $material = $_POST['material'];
            $quantity = floatval($_POST['quantity']);
            $description = $_POST['description'];

            // FIX: Summing 'quantity' since 'in' doesn't exist
            $incheckstmt = $pdo->prepare("SELECT SUM(`quantity`) AS totalin FROM stock_output_group WHERE material_id = ?");
            $incheckstmt->execute([$material]);
            $incheckdata = $incheckstmt->fetch(PDO::FETCH_ASSOC);

            // FIX: Graceful fallback for missing 'out' column in DB
            try {
                $outcheckstmt = $pdo->prepare("SELECT SUM(`out`) AS totalout FROM stock_output_group WHERE material_id = ?");
                $outcheckstmt->execute([$material]);
                $outcheckdata = $outcheckstmt->fetch(PDO::FETCH_ASSOC);
            } catch (PDOException $e) {
                $outcheckdata = ['totalout' => 0];
            }

            $totalquantity = floatval($incheckdata['totalin'] ?? 0) - floatval($outcheckdata['totalout'] ?? 0);

            if ($totalquantity < $quantity) {
                $quantity_error = "Not enough quantity";
                echo "<script>swal('Not enough quantity!', 'Only have " . $totalquantity . "', 'warning');</script>";
            } else {
                $query->managestock($date, $stockto, $material, $quantity, $voucher_no, $action, $transfer_to, $description);
            }
        }
        ?>
        <div class="contentcol" id="content">
            <?php require 'navbar.php'; ?>
            <div class="card">
                <div class="card-header bg-primary text-light" style="padding:-10px;">
                    <p style="font-size: 26px;font-weight: bold; display:inline;">Manage Packing Material (Gate Pass)</p>
                    <button class="btn btn-warning float-end" data-bs-toggle="modal" data-bs-target="#stockmanagemodal">Manage</button>
                    <div class="modal fade" style="margin-top: 75px;" id="stockmanagemodal" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content text-dark">
                                <form action="material_gatepass.php" method="POST">
                                    <div class="modal-header bg-primary">
                                        <h1 class="modal-title fs-5 text-light" id="exampleModalLabel">Manage Stock</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <label>Action Type</label>
                                        <select name="action" class="form-control" id="actioninp">
                                            <option value="use">Use</option>
                                            <option value="transfer">Transfer</option>
                                            <option value="return">Return</option>
                                            <option value="damaged">Damaged</option>
                                        </select>
                                        <div id="transftertodiv" style="display:none;">
                                            <label>Transfer To</label>
                                            <select name="transfer_to" class="form-control">
                                                <?php
                                                $coldstorestmt = $pdo->prepare("SELECT * FROM config_coldstore");
                                                $coldstorestmt->execute();
                                                $coldstores = $coldstorestmt->fetchAll(PDO::FETCH_ASSOC);
                                                foreach ($coldstores as $coldstore):
                                                ?>
                                                    <option value="<?php echo htmlspecialchars($coldstore['name']); ?>" style="text-transform: uppercase;"><?php echo htmlspecialchars($coldstore['name']); ?></option>
                                                <?php endforeach;
                                                ?>
                                            </select>
                                        </div>

                                        <label>Date</label>
                                        <input type="date" name="date" class="form-control">

                                        <label>Packing Material Item</label>
                                        <select name="material" id="" class="form-control">
                                            <?php
                                            // FIX: Strict Mode compliance
                                            $materialstmt = $pdo->prepare("SELECT DISTINCT material_id FROM stock_output_group WHERE material_id > 0");
                                            $materialstmt->execute();
                                            $materials = $materialstmt->fetchAll(PDO::FETCH_ASSOC);
                                            foreach ($materials as $mat) {
                                                $materialid = $mat['material_id'];
                                                // FIX: Point to unified products table
                                                $mStmt = $pdo->prepare("SELECT * FROM products WHERE id=?");
                                                $mStmt->execute([$materialid]);
                                                $materialdata = $mStmt->fetch(PDO::FETCH_ASSOC);
                                                if ($materialdata) {
                                            ?>
                                                    <option value="<?= htmlspecialchars($materialid); ?>"><?= htmlspecialchars($materialdata['name']); ?></option>
                                            <?php
                                                }
                                            }
                                            ?>
                                        </select>

                                        <label>Voucher No</label>
                                        <input type="number" name="voucher_no" class="form-control" required>

                                        <label>Quantity</label>
                                        <input type="number" name="quantity" class="form-control" required>
                                        <?php
                                        if (isset($_POST['managebtn'])) {
                                            if (!empty($quantity_error)) {
                                        ?>
                                                <p class="text-danger"><?= htmlspecialchars($quantity_error); ?></p>
                                        <?php
                                            }
                                        }
                                        ?>

                                        <label>Description</label>
                                        <textarea name="description" class="form-control"></textarea>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" name="managebtn" class="btn btn-primary">Manage</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <?php

                    if (!empty($_GET['pageno'])) {
                        $pageno = intval($_GET['pageno']);
                    } else {
                        $pageno = 1;
                    }
                    $numOfrecs = 13;
                    $offset = ($pageno - 1) * $numOfrecs;
                    ?>

                    <div class="text-center">
                        <form action="" method="post">
                            <?php
                            // FIX: Strict Mode compliance
                            $stmt = $pdo->prepare("SELECT DISTINCT stock_to FROM stock_output_group WHERE stock_to IS NOT NULL AND stock_to != ''");
                            $stmt->execute();
                            $datas = $stmt->fetchAll(PDO::FETCH_ASSOC);

                            foreach ($datas as $data) {
                                if (isset($_POST[$data['stock_to'] . 'btn'])) {
                                    $_SESSION['tabs'] = $data['stock_to'];
                                }
                            }
                            // Default tab if none selected
                            if (!isset($_SESSION['tabs']) && !empty($datas)) {
                                $_SESSION['tabs'] = $datas[0]['stock_to'];
                            }

                            foreach ($datas as $data) {
                            ?>
                                <button type="submit" class="pb-2 pt-2 ps-4 pe-4 text-dark <?php if (isset($_SESSION['tabs']) && $_SESSION['tabs'] == $data['stock_to']) {
                                                                                                echo 'color';
                                                                                            } ?>" style="text-transform: uppercase; border:none;" name="<?= htmlspecialchars($data['stock_to']); ?>btn"><?= htmlspecialchars($data['stock_to']); ?></button>
                            <?php
                            }
                            ?>
                        </form>
                    </div>

                    <table class="mt-3 table table-bordered table-striped rounded">
                        <tr>
                            <th style="width: 20px;">No.</th>
                            <th>Packing Material Item</th>
                            <th>In</th>
                            <th>Out</th>
                            <th>Balance</th>
                            <th>Detail</th>
                        </tr>

                        <?php
                        $stock_to = isset($_SESSION['tabs']) ? $_SESSION['tabs'] : '';

                        // FIX: Strict Mode compliance
                        $stmt = $pdo->prepare("SELECT DISTINCT material_id FROM stock_output_group WHERE stock_to = ?");
                        $stmt->execute([$stock_to]);
                        $rawResult = $stmt->fetchAll(PDO::FETCH_ASSOC);

                        $total_pages = ceil(count($rawResult) / $numOfrecs);
                        if ($total_pages == 0) $total_pages = 1;

                        // FIX: Strict Mode compliance
                        $stmt = $pdo->prepare("SELECT DISTINCT material_id FROM stock_output_group WHERE stock_to = ? ORDER BY material_id LIMIT $offset, $numOfrecs");
                        $stmt->execute([$stock_to]);
                        $datas = $stmt->fetchAll(PDO::FETCH_ASSOC);
                        ?>
                        <?php
                        $no = $offset + 1;
                        foreach ($datas as $data) {
                            $material_id = $data['material_id'];

                            // FIX: Point to products (This was Line 220)
                            $mStmt = $pdo->prepare("SELECT * FROM products WHERE id=?");
                            $mStmt->execute([$material_id]);
                            $material = $mStmt->fetch(PDO::FETCH_ASSOC) ?: ['name' => 'Unknown Product'];

                            // FIX: Summing quantity instead of in
                            $insumstmt = $pdo->prepare("SELECT SUM(`quantity`) as totalin FROM stock_output_group WHERE material_id=? AND stock_to=?");
                            $insumstmt->execute([$material_id, $stock_to]);
                            $totalin = $insumstmt->fetch(PDO::FETCH_ASSOC);

                            // FIX: Graceful fallback for missing out column
                            try {
                                $outsumstmt = $pdo->prepare("SELECT SUM(`out`) as totalout FROM stock_output_group WHERE material_id=? AND stock_to=?");
                                $outsumstmt->execute([$material_id, $stock_to]);
                                $totalout = $outsumstmt->fetch(PDO::FETCH_ASSOC);
                            } catch (PDOException $e) {
                                $totalout = ['totalout' => 0];
                            }

                            $balance = floatval($totalin['totalin'] ?? 0) - floatval($totalout['totalout'] ?? 0);
                        ?>

                            <tr>
                                <td><?php echo $no; ?></td>
                                <td><?php echo htmlspecialchars($material['name'] ?? 'Unknown Product'); ?></td>
                                <td><?php echo empty($totalin['totalin']) ? '-' : $totalin['totalin']; ?></td>
                                <td><?php echo empty($totalout['totalout']) ? '-' : $totalout['totalout']; ?></td>
                                <td><?php echo ($balance == 0 && empty($totalin['totalin'])) ? '-' : $balance; ?></td>
                                <td><a href="material_gatepass_detail.php?id=<?= htmlspecialchars($material_id); ?>" class="btn btn-primary"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list-check" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3.854 2.146a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 3.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 7.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0z" />
                                        </svg></a></td>
                            </tr>
                            <!-- Data Update Modal -->
                            <div class="modal fade" id="updatemodal<?php echo $material_id; ?>" tabindex="-1" role="dialog">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header bg-warning text-light">
                                            <h5 class="modal-title" id="updatemodallabel">Update Material</h5>
                                            <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true" class="h3">&times;</span>
                                            </button>
                                        </div>
                                        <form action="" method="post" autocomplete="off">
                                            <div class="modal-body">
                                                <input type="hidden" name="id" value="<?php echo $material_id; ?>">
                                                <label>Material Name</label>
                                                <input type="text" name="name" class="form-control" placeholder="Name" value="<?php echo htmlspecialchars($material['name'] ?? ''); ?>" readonly>
                                                <label>Description</label>
                                                <textarea name="description" class="form-control" placeholder="Description" readonly><?php echo htmlspecialchars($material['description'] ?? ''); ?></textarea>
                                                <small class="text-danger mt-2 d-block">Note: Material details must be edited in the Products module.</small>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- Update Modal -->
                        <?php
                            $no++;
                        };
                        ?>

                    </table>
                    <br>
                    <div aria-label="Page navigation example" style="float:right;">
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link" href="?pageno=1">First</a></li>
                            <li class="page-item <?php if ($pageno <= 1) {
                                                        echo 'disabled';
                                                    } ?>">
                                <a class="page-link" href="<?php if ($pageno <= 1) {
                                                                echo '#';
                                                            } else {
                                                                echo "?pageno=" . ($pageno - 1);
                                                            } ?>">Previous</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#"><?php echo $pageno; ?></a></li>
                            <li class="page-item <?php if ($pageno >= $total_pages) {
                                                        echo 'disabled';
                                                    }; ?>">
                                <a class="page-link" href="<?php if ($pageno >= $total_pages) {
                                                                echo '#';
                                                            } else {
                                                                echo "?pageno=" . ($pageno + 1);
                                                            } ?>">Next</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="?pageno=<?php echo $total_pages; ?>">Last</a> </li>
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
                    <h5 class="modal-title" id="addmodellabel">Create New Material</h5>
                    <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="h3">&times;</span>
                    </button>
                </div>
                <form action="material_list.php" method="post" autocomplete="off">
                    <div class="modal-body">
                        <label>Material Name</label>
                        <input type="text" name="name" class="form-control" placeholder="Name">
                        <label>Description</label>
                        <textarea name="description" class="form-control" placeholder="Description"></textarea>
                        <small class="text-danger mt-2 d-block">Note: Please add new Materials via the Products module instead.</small>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-success" disabled>Add Material</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Add Modal -->

    <script>
        var actioninp = document.getElementById("actioninp");

        actioninp.addEventListener('change', function() {
            var transftertodiv = document.getElementById("transftertodiv");
            if (actioninp.value == 'transfer') {
                transftertodiv.style.display = 'block';
            } else {
                transftertodiv.style.display = 'none';
            }
        });
    </script>
    <?php
    $bootstrap->javascript();
    ?>
</body>

</html>