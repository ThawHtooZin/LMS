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
            <?php include 'sidebar.php'; ?>
        </div>
        <div class="contentcol" id="content">
            <?php require 'navbar.php'; ?>
            <div class="card">
                <div class="card-header bg-primary text-light" style="padding:-10px;">
                    <?php
                    $id = $_GET['id'];
                    // Query Unified Products Table
                    $materialstmt = $pdo->prepare("SELECT id, name FROM products WHERE id=?");
                    $materialstmt->execute([$id]);
                    $material = $materialstmt->fetch(PDO::FETCH_ASSOC);
                    ?>
                    <h5>Manage Store {<?= htmlspecialchars($material['name'] ?? 'Unknown'); ?>} Detail</h5>
                    <a href="material_gatepass.php" class="float-end btn btn-secondary btn-sm">Back</a>
                </div>
                <div class="card-body">
                    <?php
                    $pageno = !empty($_GET['pageno']) ? intval($_GET['pageno']) : 1;
                    $numOfrecs = 13;
                    $offset = ($pageno - 1) * $numOfrecs;
                    ?>
                    <table class="mt-3 table table-bordered table-striped rounded">
                        <tr>
                            <th>Id</th>
                            <th>Date</th>
                            <th>Voucher No</th>
                            <th>Description</th>
                            <th>Action</th>
                            <th>In</th>
                            <th>Out</th>
                            <th>Balance</th>
                        </tr>

                        <?php
                        $stock_to = $_SESSION['tabs'] ?? '';
                        $stmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE material_id=? AND stock_to = ? ORDER BY id");
                        $stmt->execute([$id, $stock_to]);
                        $rawResult = $stmt->fetchAll();
                        $total_pages = max(1, ceil(count($rawResult) / $numOfrecs));

                        $stmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE material_id=? AND stock_to = ? ORDER BY id LIMIT ?, ?");
                        $stmt->bindValue(1, $id);
                        $stmt->bindValue(2, $stock_to);
                        $stmt->bindValue(3, $offset, PDO::PARAM_INT);
                        $stmt->bindValue(4, $numOfrecs, PDO::PARAM_INT);
                        $stmt->execute();
                        $datas = $stmt->fetchAll(PDO::FETCH_ASSOC);

                        $no = $offset + 1;
                        $balance = 0;

                        foreach ($datas as $data) {
                            // Extract precisely from the new in_quantity and out_quantity schema
                            $in = (float)($data['in_quantity'] ?? 0);
                            $out = (float)($data['out_quantity'] ?? 0);
                            $balance += $in - $out;
                        ?>

                            <tr>
                                <td><?php echo $no; ?></td>
                                <td><?php echo date('d-m-Y', strtotime($data['date'])); ?></td>
                                <td><?php echo htmlspecialchars($data['voucher_no'] ?? ''); ?></td>
                                <td><?php echo htmlspecialchars($data['description'] ?? ''); ?></td>
                                <td><?php echo htmlspecialchars($data['action'] ?? ''); ?></td>
                                <td style="color: green; font-weight: bolder;"><?php echo ($in == 0) ? '-' : $in; ?></td>
                                <td style="color: red; font-weight: bolder;"><?php echo ($out == 0) ? '-' : $out; ?></td>
                                <td style="color: blue; font-weight: bolder;"><?php echo ($balance == 0) ? '-' : $balance; ?></td>
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
                            <li class="page-item <?php if ($pageno <= 1) echo 'disabled'; ?>">
                                <a class="page-link" href="<?php if ($pageno <= 1) echo '#';
                                                            else echo "?pageno=" . ($pageno - 1); ?>">Previous</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#"><?php echo $pageno; ?></a></li>
                            <li class="page-item <?php if ($pageno >= $total_pages) echo 'disabled'; ?>">
                                <a class="page-link" href="<?php if ($pageno >= $total_pages) echo '#';
                                                            else echo "?pageno=" . ($pageno + 1); ?>">Next</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="?pageno=<?php echo $total_pages; ?>">Last</a> </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Data Add Modal (Disabled to enforce unified Products table) -->
    <div class="modal fade" id="addmodal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header bg-secondary text-light">
                    <h5 class="modal-title" id="addmodellabel">Create New Material</h5>
                    <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="h3">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <label>Material Name</label>
                    <input type="text" class="form-control" disabled>
                    <label>Description</label>
                    <textarea class="form-control" disabled></textarea>
                    <small class="text-danger mt-2 d-block">Note: Please add new Materials via the Products module instead.</small>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <?php $bootstrap->javascript(); ?>
</body>

</html>