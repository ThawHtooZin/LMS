<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

require '../../Controllers/ValidatorInstance.php';

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
    <?php
    $stmt = $pdo->prepare("SELECT * FROM stock_output_group GROUP BY stock_to");
    $stmt->execute();
    $stocktodatas = $stmt->fetchAll();

    foreach ($stocktodatas as $stocktodata) {
        $btnname = $stocktodata['stock_to'] . 'btn';
        if (isset($_POST[$btnname])) {
            $_SESSION['stock_to'] = $stocktodata['stock_to'];
        }
    }
    ?>
    <div class="row">
        <div class="sidebarcol" id="sidebar">
            <?php
            include 'sidebar.php';
            ?>
        </div>
        <div class="contentcol" id="content">
            <?php require 'navbar.php'; ?>
            <div class="card">
                <div class="card-header bg-primary text-light" style="padding:-10px;">

                    <h1 class="merriweather-light text-center">*Packing Material Temp Stock*</h1>
                    <h4 style="text-transform: capitalize;" class="d-inline"><span style="font-size: 16px;">From <?= date('d-m-Y', strtotime($_SESSION['startdate'])) . ' to ' . date('d-m-Y', strtotime($_SESSION['enddate'])) ?></span></h4>
                    <button data-bs-toggle="modal" data-bs-target="#filter" class="ms-2 btn btn-warning float-end d-inline" style="font-weight:bold;">Select Filter</button>

                    <div class="modal" id="filter">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title text-dark">Select Filter Methods</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <form action="" method="POST">
                                    <div class="modal-body">

                                        <div class="row">
                                            <div class="col">
                                                <label>Start Date:</label>
                                                <input type="date" name="startdate" class="form-control inpv2" value="<?= $_SESSION['startdate']; ?>">
                                            </div>
                                            <div class="col">
                                                <label>End Date:</label>
                                                <input type="date" name="enddate" class="form-control inpv2" value="<?= $_SESSION['enddate']; ?>">
                                            </div>
                                        </div>

                                        <label>Type of Reports</label>
                                        <select name="filterinp" class="form-control inpv2 mt-2" id="filterinp" required>
                                            <option value="all" style="font-weight: bold;">All Material Balance</option>
                                            <option value="eachmaterialinout" style="font-weight: bold;">Each Material In/Out</option>
                                            <option value="eachmaterialbalanceamount" style="font-weight: bold;">Each Material Balance Amount</option>
                                        </select>

                                        <label id="packingmateriallabel" style="display: none;">Packing Material</label>
                                        <select name="material" class="form-control inpv2" style="display: none;" id="packingmaterialinp">
                                            <?php
                                            $stmt = $pdo->prepare("SELECT * FROM material_store_house GROUP BY material_id");
                                            $stmt->execute();
                                            $datas = $stmt->fetchAll();
                                            foreach ($datas as $data) {
                                                $material_id = $data['material_id'];
                                                $stmt = $pdo->prepare("SELECT * FROM materials WHERE id='$material_id'");
                                                $stmt->execute();
                                                $material = $stmt->fetch(PDO::FETCH_ASSOC);
                                            ?>
                                                <option value="<?= $material['id']; ?>" style="padding-left:20px !important;"><?= $material['name']; ?></option>
                                            <?php
                                            }
                                            ?>
                                        </select>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" name="savefilter" class="btn btn-primary">Show</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <form class="text-center" method="POST" action="">
                        <?php
                        $stmt = $pdo->prepare("SELECT * FROM stock_output_group GROUP BY stock_to");
                        $stmt->execute();
                        $stocktodatas = $stmt->fetchAll();

                        foreach ($stocktodatas as $stocktodata) {
                        ?>
                            <button type="submit" class="pb-2 pt-2 ps-4 pe-4 text-dark remainingstocklink <?php if ($_SESSION['stock_to'] == $stocktodata['stock_to']) {
                                                                                                                echo "color";
                                                                                                            } ?>" style="text-decoration:none; border:none; text-transform: uppercase;" name="<?= $stocktodata['stock_to'] . 'btn'; ?>"><?= $stocktodata['stock_to']; ?></button>
                        <?php
                        }
                        ?>
                    </form>

                    <?php
                    $no = 1;
                    $balance = 0;
                    if (!empty($_GET['pageno'])) {
                        $pageno = $_GET['pageno'];
                    } else {
                        $pageno = 1;
                    }
                    $numOfrecs = 13;
                    $offset = ($pageno - 1) * $numOfrecs;
                    ?>

                    <table class="mt-3 table table-bordered table-striped rounded">
                        <?php
                        if (isset($_POST['savefilter'])) {
                            $_SESSION['startdate'] = $_POST['startdate'];
                            $_SESSION['enddate'] = $_POST['enddate'];
                            $_SESSION['filtertype'] = $_POST['filterinp'];
                            $_SESSION['material_id'] = $_POST['material'];
                        }
                        $stock_to = $_SESSION['stock_to'];
                        $startdate = $_SESSION['startdate'];
                        $enddate = $_SESSION['enddate'];
                        $material_id = $_SESSION['material_id'];
                        if (!empty($_SESSION['filtertype'])) {
                            $filtertype = $_SESSION['filtertype'];
                            if ($filtertype == 'all') {
                                $stmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE stock_to = '$stock_to' AND `date` BETWEEN '$startdate' AND '$enddate' GROUP BY material_id ORDER BY stock_to");
                                $stmt->execute();
                                $rawResult = $stmt->fetchAll();
                                $total_pages = ceil(count($rawResult) / $numOfrecs);

                                $stmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE stock_to = '$stock_to' AND `date` BETWEEN '$startdate' AND '$enddate' GROUP BY material_id LIMIT :offset, :numOfrecs");
                                $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
                                $stmt->bindValue(':numOfrecs', $numOfrecs, PDO::PARAM_INT);
                                $stmt->execute();
                            } elseif ($filtertype == 'eachmaterialinout') {
                                $stmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE stock_to = '$stock_to' AND material_id='$material_id' AND `date` BETWEEN '$startdate' AND '$enddate' ORDER BY stock_to");
                                $stmt->execute();
                                $rawResult = $stmt->fetchAll();
                                $total_pages = ceil(count($rawResult) / $numOfrecs);

                                $stmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE stock_to = '$stock_to' AND material_id='$material_id' AND `date` BETWEEN '$startdate' AND '$enddate' LIMIT :offset, :numOfrecs");
                                $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
                                $stmt->bindValue(':numOfrecs', $numOfrecs, PDO::PARAM_INT);
                                $stmt->execute();
                            } elseif ($filtertype == 'eachmaterialbalanceamount') {
                                $stmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE stock_to = '$stock_to' AND `date` BETWEEN '$startdate' AND '$enddate' ORDER BY stock_to");
                                $stmt->execute();
                                $rawResult = $stmt->fetchAll();
                                $total_pages = ceil(count($rawResult) / $numOfrecs);

                                $stmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE stock_to = '$stock_to' AND `date` BETWEEN '$startdate' AND '$enddate' LIMIT :offset, :numOfrecs");
                                $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
                                $stmt->bindValue(':numOfrecs', $numOfrecs, PDO::PARAM_INT);
                                $stmt->execute();
                            }
                        } else {
                            $stmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE stock_to = '$stock_to' AND `date` BETWEEN '$startdate' AND '$enddate' ORDER BY stock_to");
                            $stmt->execute();
                            $rawResult = $stmt->fetchAll();
                            $total_pages = ceil(count($rawResult) / $numOfrecs);

                            $stmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE stock_to = '$stock_to' AND `date` BETWEEN '$startdate' AND '$enddate' LIMIT :offset, :numOfrecs");
                            $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
                            $stmt->bindValue(':numOfrecs', $numOfrecs, PDO::PARAM_INT);
                            $stmt->execute();
                        }

                        $datas = $stmt->fetchAll();
                        ?>
                        <tr>
                            <th>No.</th>
                            <?php if ($filtertype != 'all') {
                            ?>
                                <th>Date</th>
                            <?php
                            } ?>
                            <?php if ($filtertype != 'all') {
                            ?>
                                <th>G/P Voucher</th>
                            <?php
                            } ?>
                            <th>Item Name</th>
                            <th>Unit</th>
                            <th>In</th>
                            <th>Out</th>
                            <?php
                            // if ($filtertype != 'all') {
                            ?>
                            <th>Balance</th>
                            <?php
                            // }
                            ?>
                        </tr>
                        <?php
                        foreach ($datas as $data) {
                            $material_id = $data['material_id'];
                            $stmt = $pdo->prepare("SELECT * FROM materials WHERE id = $material_id");
                            $stmt->execute();
                            $material = $stmt->fetch(PDO::FETCH_ASSOC);
                            $unit = $material['unit'];

                            if ($filtertype == 'all') {
                                $intotalstmt = $pdo->prepare("SELECT SUM(`in`) as totalin FROM stock_output_group WHERE material_id = '$material_id' AND stock_to = '$stock_to'");
                                $intotalstmt->execute();
                                $totalin = $intotalstmt->fetch(PDO::FETCH_ASSOC);
                                $outtotalstmt = $pdo->prepare("SELECT SUM(`out`) as totalout FROM stock_output_group WHERE material_id = '$material_id' AND stock_to = '$stock_to'");
                                $outtotalstmt->execute();
                                $totalout = $outtotalstmt->fetch(PDO::FETCH_ASSOC);

                                $balance = $totalin['totalin'] - $totalout['totalout'];
                            } elseif ($filtertype == 'eachmaterialinout') {
                                $balance += $data['in'] - $data['out'];
                            }
                        ?>
                            <tr>
                                <?php
                                if ($filtertype == 'all') {
                                ?>
                                    <td><?= $no; ?></td>
                                    <td><?= $material['name']; ?></td>
                                    <td><?= $unit; ?></td>
                                    <td><?= $totalin['totalin']; ?></td>
                                    <td><?= $totalout['totalout']; ?></td>
                                    <td><?= $balance; ?></td>
                                <?php
                                } elseif ($filtertype == 'eachmaterialinout') {
                                ?>
                                    <td><?= $no; ?></td>
                                    <td><?= date('d-m-Y', strtotime($data['date'])); ?></td>
                                    <td><?= $material['name']; ?></td>
                                    <td><?= $data['voucher_no']; ?></td>
                                    <td><?= $unit; ?></td>
                                    <td><?= $data['in']; ?></td>
                                    <td><?= $data['out']; ?></td>
                                    <td><?= $balance; ?></td>
                                <?php
                                }
                                ?>
                            </tr>
                        <?php
                            $no++;
                        };
                        ?>
                    </table>
                    <div aria-label="Page navigation example" style="float:right;">
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link" href="?pageno=1">First</a></li>
                            <li class="page-item <?php if ($pageno <= 1) {
                                                        echo 'disabled';
                                                    } ?>">
                                <a class="page-link"
                                    href="<?php if ($pageno <= 1) {
                                                echo '#';
                                            } else {
                                                echo "?pageno=" . ($pageno - 1);
                                            } ?>">Previous</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#"><?php echo $pageno; ?></a></li>
                            <li class="page-item <?php if ($pageno >= $total_pages) {
                                                        echo 'disabled';
                                                    }; ?>">
                                <a class="page-link"
                                    href="<?php if ($pageno >= $total_pages) {
                                                echo '#';
                                            } else {
                                                echo "?pageno=" . ($pageno + 1);
                                            } ?>">Next</a>
                            </li>
                            <li class="page-item"><a class="page-link"
                                    href="?pageno=<?php echo $total_pages; ?>">Last</a> </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.getElementById('filterinp').addEventListener('change', function() {

            var filterValue = document.getElementById('filterinp').value;
            var packingMaterialInp = document.getElementById('packingmaterialinp');
            var packingMaterialLabel = document.getElementById('packingmateriallabel');

            if (filterValue === 'all' || filterValue === 'totalin' || filterValue === 'totalout') {
                packingMaterialInp.style.display = 'none';
                packingMaterialLabel.style.display = 'none';
            } else {
                packingMaterialInp.style.display = 'block';
                packingMaterialLabel.style.display = 'block';
            }
        });
    </script>

    <?php
    $bootstrap->javascript();
    ?>
</body>

</html>