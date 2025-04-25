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
            $quantity = $_POST['quantity'];
            $description = $_POST['description'];

            $incheckstmt = $pdo->prepare("SELECT SUM(`in`) AS totalin FROM stock_output_group WHERE material_id = '$material'");
            $incheckstmt->execute();
            $incheckdata = $incheckstmt->fetch(PDO::FETCH_ASSOC);

            $outcheckstmt = $pdo->prepare("SELECT SUM(`out`) AS totalout FROM stock_output_group WHERE material_id = '$material'");
            $outcheckstmt->execute();
            $outcheckdata = $outcheckstmt->fetch(PDO::FETCH_ASSOC);

            $totalquantity = $incheckdata['totalin'] - $outcheckdata['totalout'];

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
                    <p style="font-size: 26px;font-weight: bold;margin-left:450px; display:inline;">Manage Packing Material (Gate Pass)</p>
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
                                                $coldstores = $coldstorestmt->fetchAll();
                                                foreach ($coldstores as $coldstore): ?>
                                                    <option value="<?= $coldstore['name'] ?>" style="text-transform: uppercase;"><?= $coldstore['name'] ?></option>
                                                <?php endforeach; ?>
                                            </select>
                                        </div>

                                        <label>Date</label>
                                        <input type="date" name="date" class="form-control">

                                        <label>Packing Material Item</label>
                                        <select name="material" id="" class="form-control">
                                            <?php
                                            $materialstmt = $pdo->prepare("SELECT material_id FROM stock_output_group GROUP BY material_id");
                                            $materialstmt->execute();
                                            $materials = $materialstmt->fetchAll();
                                            foreach ($materials as $material) {
                                                $materialid = $material['material_id'];
                                                $materialstmt = $pdo->prepare("SELECT * FROM materials WHERE id='$materialid'");
                                                $materialstmt->execute();
                                                $materialdata = $materialstmt->fetch(PDO::FETCH_ASSOC);
                                            ?>
                                                <option value="<?= $material['material_id']; ?>"><?= $materialdata['name']; ?></option>
                                            <?php
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
                                                <p class="text-danger"><?= $quantity_error; ?></p>
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
                        $pageno = $_GET['pageno'];
                    } else {
                        $pageno = 1;
                    }
                    $numOfrecs = 13;
                    $offset = ($pageno - 1) * $numOfrecs;
                    ?>

                    <div class="text-center">
                        <?php
                        ?>
                        <form action="" method="post">
                            <?php
                            $stmt = $pdo->prepare("SELECT stock_to FROM stock_output_group GROUP BY stock_to");
                            $stmt->execute();
                            $datas = $stmt->fetchAll();
                            foreach ($datas as $data) {
                                if (isset($_POST[$data['stock_to'] . 'btn'])) {
                                    $_SESSION['tabs'] = $data['stock_to'];
                                }
                            }
                            foreach ($datas as $data) {
                            ?>
                                <button type="submit" class="pb-2 pt-2 ps-4 pe-4 text-dark <?php if ($_SESSION['tabs'] == $data['stock_to']) {
                                                                                                echo 'color';
                                                                                            } else {
                                                                                                echo '';
                                                                                            } ?>" style="text-transform: uppercase; border:none;" name="<?= $data['stock_to']; ?>btn"><?= $data['stock_to']; ?></button>
                            <?php
                            }
                            ?>
                        </form>
                    </div>

                    <table class="mt-3 table table-bordered table-striped rounded">
                        <tr>
                            <!-- <th>Category Name</th> -->
                            <th style="width: 20px;">No.</th>
                            <th>Packing Material Item</th>
                            <th>In</th>
                            <th>Out</th>
                            <th>Balance</th>
                            <th>Detail</th>
                        </tr>

                        <?php
                        $stock_to = $_SESSION['tabs'];
                        $stmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE stock_to = '$stock_to' GROUP BY material_id ORDER BY id");
                        $stmt->execute();
                        $rawResult = $stmt->fetchAll();
                        $total_pages = ceil(count($rawResult) / $numOfrecs);

                        $stmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE stock_to = '$stock_to' GROUP BY material_id ORDER BY id LIMIT $offset,$numOfrecs ");
                        $stmt->execute();
                        $datas = $stmt->fetchAll();
                        ?>
                        <?php
                        $no = 1;
                        foreach ($datas as $data) {
                            $material_id = $data['material_id'];

                            $stmt = $pdo->prepare("SELECT * FROM materials WHERE id='$material_id'");
                            $stmt->execute();
                            $material = $stmt->fetch(PDO::FETCH_ASSOC);

                            $insumstmt = $pdo->prepare("SELECT SUM(`in`) as totalin FROM stock_output_group WHERE material_id='$material_id' AND stock_to = '$stock_to'");
                            $insumstmt->execute();
                            $totalin = $insumstmt->fetch(PDO::FETCH_ASSOC);

                            $outsumstmt = $pdo->prepare("SELECT SUM(`out`) as totalout FROM stock_output_group WHERE material_id='$material_id' AND stock_to = '$stock_to'");
                            $outsumstmt->execute();
                            $totalout = $outsumstmt->fetch(PDO::FETCH_ASSOC);

                            $balance = $totalin['totalin'] - $totalout['totalout'];
                        ?>

                            <tr>
                                <td><?php echo $no; ?></td>
                                <td><?php echo $material['name']; ?></td>
                                <td><?php if ($totalin['totalin'] == '') {
                                        echo '-';
                                    } else {
                                        echo $totalin['totalin'];
                                    }; ?></td>
                                <td><?php if ($totalout['totalout'] == '') {
                                        echo '-';
                                    } else {
                                        echo $totalout['totalout'];
                                    }; ?></td>
                                <td><?php if ($balance == '') {
                                        echo '-';
                                    } else {
                                        echo $balance;
                                    }; ?></td>
                                <td><a href="material_gatepass_detail.php?id=<?= $data['material_id']; ?>" class="btn btn-primary"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list-check" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3.854 2.146a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 3.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 7.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 0 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0z" />
                                        </svg></a></td>
                            </tr>
                            <!-- Data Update Modal -->
                            <div class="modal fade" id="updatemodal<?php echo $itemdata['id']; ?>" tabindex="-1" role="dialog">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header bg-warning text-light">
                                            <h5 class="modal-title" id="updatemodallabel">Update An Material</h5>
                                            <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true" class="h3">&times;</span>
                                            </button>
                                        </div>
                                        <form action="" method="post" autocomplete="off">
                                            <div class="modal-body">
                                                <?php
                                                $id = $itemdata['id'];
                                                $updatedata = $query->select('materials', $id, 'id');
                                                ?>
                                                <input type="hidden" name="id" value="<?php echo $itemdata['id']; ?>">
                                                <label>Material Name</label>
                                                <input type="text" name="name" class="form-control" placeholder="Name" value="<?php echo $updatedata['name']; ?>">
                                                <label>Description</label>
                                                <textarea name="description" class="form-control" placeholder="Description"><?php echo $updatedata['description']; ?></textarea>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-warning" name="updatebutton">Update</button>
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
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-success" name="addbutton">Add Material</button>
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