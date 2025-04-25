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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
    href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@0,300;0,400;0,700;0,900;1,300;1,400;1,700;1,900&display=swap"
    rel="stylesheet">
<style>
    .merriweather-light {
        font-family: "Merriweather", serif;
        font-weight: 300;
        font-style: normal;
    }

    .merriweather-regular {
        font-family: "Merriweather", serif;
        font-weight: 400;
        font-style: normal;
    }

    .merriweather-bold {
        font-family: "Merriweather", serif;
        font-weight: 700;
        font-style: normal;
    }

    .merriweather-black {
        font-family: "Merriweather", serif;
        font-weight: 900;
        font-style: normal;
    }

    .merriweather-light-italic {
        font-family: "Merriweather", serif;
        font-weight: 300;
        font-style: italic;
    }

    .merriweather-regular-italic {
        font-family: "Merriweather", serif;
        font-weight: 400;
        font-style: italic;
    }

    .merriweather-bold-italic {
        font-family: "Merriweather", serif;
        font-weight: 700;
        font-style: italic;
    }

    .merriweather-black-italic {
        font-family: "Merriweather", serif;
        font-weight: 900;
        font-style: italic;
    }
</style>

<body>
    <div class="modal" id="filter">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">SELECT REPORT</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="" method="POST">
                    <div class="modal-body">

                        <label>Stock To:</label>
                        <select name="stock_to" class="form-control inpv2 mt-2" required>
                            <?php
                            $stockstmt = $pdo->prepare("SELECT stock_to FROM stock_output_group GROUP BY stock_to");
                            $stockstmt->execute();
                            $stocktodatas = $stockstmt->fetchAll();
                            foreach ($stocktodatas as $stocktodata) {
                            ?>
                                <option value="<?= $stocktodata['stock_to'] ?>"
                                    style="font-weight: bold; text-transform: uppercase;"><?= $stocktodata['stock_to'] ?>
                                </option>
                            <?php
                            }
                            ?>
                        </select>

                        <div class="row">
                            <div class="col">
                                <label>Start Date:</label>
                                <input type="date" name="startdate" class="form-control inpv2"
                                    value="<?= $_SESSION['startdate']; ?>">
                            </div>
                            <div class="col">
                                <label>End Date:</label>
                                <input type="date" name="enddate" class="form-control inpv2"
                                    value="<?= $_SESSION['enddate']; ?>">
                            </div>
                        </div>

                        <label>Type of Reports:</label>
                        <select name="filterinp" class="form-control inpv2 mt-2" id="filterinp" required>
                            <option value="all" style="font-weight: bold;">All Data</option>
                            <option value="eachmaterialtotalinout" style="font-weight: bold;">Each Material Total
                                In/Out</option>
                            <option value="eachmaterialbalance" style="font-weight: bold;">Each Material Balance
                            </option>
                            <option value="eachmaterialbalanceamount" style="font-weight: bold;">Each Material Balance
                                Amount</option>
                        </select>

                        <label id="packingmateriallabel" style="display: none;">Packing Material</label>
                        <select name="material" class="form-control inpv2" style="display: none;"
                            id="packingmaterialinp">
                            <option value="all">All</option>
                            <?php
                            $stmt = $pdo->prepare("SELECT * FROM stock_output_group GROUP BY material_id");
                            $stmt->execute();
                            $datas = $stmt->fetchAll();
                            foreach ($datas as $data) {
                                $material_id = $data['material_id'];
                                $stmt = $pdo->prepare("SELECT * FROM materials WHERE id='$material_id'");
                                $stmt->execute();
                                $material = $stmt->fetch(PDO::FETCH_ASSOC);
                            ?>
                                <option value="<?= $material['id']; ?>" style="padding-left:20px !important;">
                                    <?= $material['name']; ?></option>
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
    <div class="row">
        <div class="sidebarcol" id="sidebar">
            <?php
            include 'sidebar.php';
            ?>
        </div>
        <div class="contentcol" id="content">
            <?php require 'navbar.php'; ?>
            <div class="card">
                <div class="card-header bg-info text-light" style="padding:-10px;">
                    <h1 class="merriweather-light text-center">*Packing Material Temp Stock*</h1>
                    <h4>Report of Records</h4>
                    <button data-bs-toggle="modal" data-bs-target="#filter" class="ms-2 btn btn-warning float-end "
                        style="font-weight:bold;">Select Report</button>
                </div>

                <script>
                    document.getElementById('filterinp').addEventListener('change', function() {

                        var filterValue = document.getElementById('filterinp').value;
                        var packingMaterialInp = document.getElementById('packingmaterialinp');
                        var packingMaterialLabel = document.getElementById('packingmateriallabel');

                        if (filterValue === 'all') {
                            packingMaterialInp.style.display = 'none';
                            packingMaterialLabel.style.display = 'none';
                        } else {
                            packingMaterialInp.style.display = 'block';
                            packingMaterialLabel.style.display = 'block';
                        }
                    });
                </script>
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
                    <?php
                    if (isset($_POST['savefilter'])) {
                        $_SESSION['stock_to'] = $_POST['stock_to'];
                        if (!empty($_POST['material'])) {
                            $_SESSION['material'] = $_POST['material'];
                        } else {
                            echo "<script>swal('Error', 'No Stock To', 'error');</script>";
                        }
                        $_SESSION['filtertype'] = $_POST['filterinp'];
                        $_SESSION['startdate'] = $_POST['startdate'];
                        $_SESSION['enddate'] = $_POST['enddate'];
                        if (!empty($_POST['material'])) {
                            $_SESSION['material'] = $_POST['material'];
                        } else {
                            echo "<script>swal('Error', 'No Material Added', 'error');</script>";
                        }
                    }
                    ?>

                    <table class="mt-3 table table-bordered table-striped rounded">
                        <?php
                        if (!empty($_SESSION['filtertype'])) {
                            $filtertype = $_SESSION['filtertype'];
                            if ($filtertype == 'all') {
                        ?>
                                <th>Id</th>
                                <th>Date</th>
                                <th>Stock To</th>
                                <th>Voucher No</th>
                                <th>Material</th>
                                <th>In</th>
                                <th>Out</th>
                                <th>Balance</th>
                            <?php
                            }
                            if ($filtertype == 'eachmaterialtotalinout') {
                            ?>
                                <th>Id</th>
                                <th>Date</th>
                                <th>Stock To</th>
                                <th>Material</th>
                                <th>In</th>
                                <th>Out</th>
                                <th>Balance</th>
                            <?php
                            }
                            if ($filtertype == 'eachmaterialbalance') {
                            ?>
                                <th>Id</th>
                                <th>Date</th>
                                <th>Stock To</th>
                                <th>Material</th>
                                <th>Balance</th>
                            <?php
                            }
                            if ($filtertype == 'eachmaterialbalanceamount') {
                            ?>
                                <th>Id</th>
                                <th>Date</th>
                                <th>Stock To</th>
                                <th>Material</th>
                                <th>Balance Amount</th>
                            <?php
                            }
                        } else {
                            ?>
                            <th>Id</th>
                            <th>Date</th>
                            <th>Stock To</th>
                            <th>Voucher No</th>
                            <th>Material</th>
                            <th>In</th>
                            <th>Out</th>
                            <th>Balance</th>
                        <?php
                        }
                        ?>

                        <?php

                        if (!empty($_SESSION['filtertype'])) {
                            $startdate = $_SESSION['startdate'];
                            $enddate = $_SESSION['enddate'];
                            $stock_to = $_SESSION['stock_to'];
                            $filtertype = $_SESSION['filtertype'];
                            $material = $_SESSION['material'];

                            if ($filtertype == 'all') {
                                $stmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE `date` BETWEEN '$startdate' AND '$enddate' AND stock_to = '$stock_to' ORDER BY stock_to");
                                $stmt->execute();
                                $rawResult = $stmt->fetchAll();
                                $total_pages = ceil(count($rawResult) / $numOfrecs);

                                $stmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE `date` BETWEEN '$startdate' AND '$enddate' ORDER BY stock_to LIMIT :offset, :numOfrecs");
                                $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
                                $stmt->bindValue(':numOfrecs', $numOfrecs, PDO::PARAM_INT);
                                $stmt->execute();
                            }
                            if ($filtertype == 'eachmaterialtotalinout') {
                                if ($material == 'all') {
                                    $stmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE `date` BETWEEN '$startdate' AND '$enddate' AND stock_to = '$stock_to' GROUP BY material_id ORDER BY stock_to");
                                } else {
                                    $stmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE `date` BETWEEN '$startdate' AND '$enddate' AND stock_to = '$stock_to' AND material_id='$material' GROUP BY material_id ORDER BY stock_to");
                                }

                                $stmt->execute();
                                $rawResult = $stmt->fetchAll();
                                $total_pages = ceil(count($rawResult) / $numOfrecs);

                                if ($material == 'all') {
                                    $stmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE `date` BETWEEN '$startdate' AND '$enddate' GROUP BY material_id ORDER BY stock_to LIMIT :offset, :numOfrecs");
                                } else {
                                    $stmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE `date` BETWEEN '$startdate' AND '$enddate' AND material_id='$material' GROUP BY material_id ORDER BY stock_to LIMIT :offset, :numOfrecs");
                                }
                                $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
                                $stmt->bindValue(':numOfrecs', $numOfrecs, PDO::PARAM_INT);
                                $stmt->execute();
                            }
                            if ($filtertype == 'eachmaterialbalance') {
                                if ($material == 'all') {
                                    $stmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE `date` BETWEEN '$startdate' AND '$enddate' AND stock_to = '$stock_to' GROUP BY material_id ORDER BY stock_to");
                                } else {
                                    $stmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE `date` BETWEEN '$startdate' AND '$enddate' AND stock_to = '$stock_to' AND material_id='$material' GROUP BY material_id ORDER BY stock_to");
                                }

                                $stmt->execute();
                                $rawResult = $stmt->fetchAll();
                                $total_pages = ceil(count($rawResult) / $numOfrecs);

                                if ($material == 'all') {
                                    $stmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE `date` BETWEEN '$startdate' AND '$enddate' GROUP BY material_id ORDER BY stock_to LIMIT :offset, :numOfrecs");
                                } else {
                                    $stmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE `date` BETWEEN '$startdate' AND '$enddate' AND material_id='$material' GROUP BY material_id ORDER BY stock_to LIMIT :offset, :numOfrecs");
                                }
                                $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
                                $stmt->bindValue(':numOfrecs', $numOfrecs, PDO::PARAM_INT);
                                $stmt->execute();
                            }
                            if ($filtertype == 'eachmaterialbalanceamount') {
                                if ($material == 'all') {
                                    $stmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE `date` BETWEEN '$startdate' AND '$enddate' AND stock_to = '$stock_to' GROUP BY material_id ORDER BY stock_to");
                                } else {
                                    $stmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE `date` BETWEEN '$startdate' AND '$enddate' AND stock_to = '$stock_to' AND material_id='$material' GROUP BY material_id ORDER BY stock_to");
                                }

                                $stmt->execute();
                                $rawResult = $stmt->fetchAll();
                                $total_pages = ceil(count($rawResult) / $numOfrecs);

                                if ($material == 'all') {
                                    $stmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE `date` BETWEEN '$startdate' AND '$enddate' GROUP BY material_id ORDER BY stock_to LIMIT :offset, :numOfrecs");
                                } else {
                                    $stmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE `date` BETWEEN '$startdate' AND '$enddate' AND material_id='$material' GROUP BY material_id ORDER BY stock_to LIMIT :offset, :numOfrecs");
                                }
                                $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
                                $stmt->bindValue(':numOfrecs', $numOfrecs, PDO::PARAM_INT);
                                $stmt->execute();
                            }
                        }
                        $datas = $stmt->fetchAll();

                        ?>
                        <?php
                        $no = 1;
                        $inbalance = 0;
                        $outbalance = 0;
                        $balance = 0;
                        foreach ($datas as $data) {
                            $material_id = $data['material_id'];

                            $stmt = $pdo->prepare("SELECT * FROM materials WHERE id='$material_id'");
                            $stmt->execute();
                            $material = $stmt->fetch(PDO::FETCH_ASSOC);

                            // $supplierstmt = $pdo->prepare("SELECT * FROM supplier WHERE supplier_id='$supplier_id'");
                            // $supplierstmt->execute();
                            // $supplier = $supplierstmt->fetch(PDO::FETCH_ASSOC);

                            // if(empty($_SESSION['in']) || empty($_SESSION['out'])){
                            //   $totalinstmt = $pdo->prepare("SELECT SUM(`in`) as totalin FROM stock_output_group WHERE material_id='$material_id'");
                            //   $totalinstmt->execute();
                            //   $totalin = $totalinstmt->fetch(PDO::FETCH_ASSOC);

                            //   $totaloutstmt = $pdo->prepare("SELECT SUM(`out`) as totalout FROM stock_output_group WHERE material_id='$material_id'");
                            //   $totaloutstmt->execute();
                            //   $totalout = $totaloutstmt->fetch(PDO::FETCH_ASSOC);
                            //   $balance = $totalin['totalin'] - $totalout['totalout'];
                            // }else{
                            //   $outbalance +=  $out;
                            //   $inbalance +=  $in;
                            //   $balance += $in - $out;
                            // }

                            if (!empty($_SESSION['filtertype'])) {
                                $filtertype = $_SESSION['filtertype'];
                                if ($filtertype == 'all') {
                                    $balance += $data['quantity'];
                                }
                                if ($filtertype == 'eachmaterialtotalinout') {
                                    $instmt = $pdo->prepare("SELECT SUM(quantity) as totalin FROM stock_output_group WHERE stock_to='$stock_to' AND material_id = '$material_id' GROUP BY material_id ORDER BY id");
                                    $instmt->execute();
                                    $indata = $instmt->fetch(PDO::FETCH_ASSOC);

                                    $balance += $indata['totalin'];
                                }
                                if ($filtertype == 'eachmaterialbalance') {
                                    $instmt = $pdo->prepare("SELECT SUM(quantity) as totalin FROM stock_output_group WHERE stock_to='$stock_to' AND material_id = '$material_id' GROUP BY material_id ORDER BY id");
                                    $instmt->execute();
                                    $indata = $instmt->fetch(PDO::FETCH_ASSOC);

                                    $balance = $indata['totalin'];
                                }
                                if ($filtertype == 'eachmaterialbalanceamount') {
                                    $purchasestmt = $pdo->prepare("SELECT * FROM material_purchase WHERE material_id='$material_id' AND `date` BETWEEN '$startdate' AND '$enddate'");
                                    $purchasestmt->execute();
                                    $purchasedatas = $purchasestmt->fetchAll();
                                    $totalamount = 0;

                                    foreach ($purchasedatas as $purchasedata) {
                                        $totalamount += $purchasedata['quantity'] * $purchasedata['rate'];
                                    }
                                }
                            }

                        ?>

                            <tr>
                                <?php
                                if (!empty($_SESSION['filtertype'])) {
                                    $filtertype = $_SESSION['filtertype'];

                                    if ($filtertype == 'all') {
                                ?>
                                        <td><?= $no; ?></td>
                                        <td><?= $data['date']; ?></td>
                                        <td><?= $data['stock_to']; ?></td>
                                        <td><?= $data['voucher_no']; ?></td>
                                        <td><?= $material['name']; ?></td>
                                        <td><?= $data['quantity']; ?></td>
                                        <td><?= '-' ?></td>
                                        <td><?= $balance; ?></td>
                                    <?php
                                    }
                                    if ($filtertype == 'eachmaterialtotalinout') {
                                    ?>
                                        <td><?= $no; ?></td>
                                        <td><?= $data['date']; ?></td>
                                        <td><?= $data['stock_to']; ?></td>
                                        <td><?= $material['name']; ?></td>
                                        <td><?= $indata['totalin']; ?></td>
                                        <td><?= '-' ?></td>
                                        <td><?= $balance ?></td>
                                    <?php
                                    }
                                    if ($filtertype == 'eachmaterialbalance') {
                                    ?>
                                        <td><?= $no; ?></td>
                                        <td><?= $data['date']; ?></td>
                                        <td><?= $data['stock_to']; ?></td>
                                        <td><?= $material['name']; ?></td>
                                        <td><?= $balance; ?></td>
                                    <?php
                                    }
                                    if ($filtertype == 'eachmaterialbalanceamount') {
                                    ?>
                                        <td><?= $no; ?></td>
                                        <td><?= $data['date']; ?></td>
                                        <td><?= $data['stock_to']; ?></td>
                                        <td><?= $material['name']; ?></td>
                                        <td><?= $totalamount ?></td>
                                <?php
                                    }
                                }
                                ?>
                            </tr>
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
    <?php
    $bootstrap->javascript();
    ?>
</body>

</html>