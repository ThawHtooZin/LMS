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
    <title>Manage Product Types</title>
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
                    <b>Manage Product Types</b>
                </div>
                <div class="card-body">
                    <?php
                    if (isset($_POST['deletebutton'])) {
                        $query->deleteproducttype($_POST['deleteid']);
                    }
                    if (isset($_POST['updatebutton'])) {
                        $query->updateproducttype($_POST['updateid'], $_POST['name']);
                    }
                    if (isset($_POST['addbutton'])) {
                        $query->addproducttype($_POST['name']);
                    }

                    $pageno = !empty($_GET['pageno']) ? $_GET['pageno'] : 1;
                    $numOfrecs = 12;
                    $offset = ($pageno - 1) * $numOfrecs;
                    ?>

                    <button type="button" class="btn btn-success float-end btn-sm mb-3" data-bs-toggle="modal" data-bs-target="#addmodal">
                        Add Product Type
                    </button>
                    <div class="clearfix"></div>

                    <table class="table table-bordered table-striped rounded">
                        <tr>
                            <th width="15%">ID</th>
                            <th width="60%">Product Type Name</th>
                            <th width="25%">Action</th>
                        </tr>
                        <?php
                        $stmt = $pdo->prepare("SELECT * FROM product_types ORDER BY id DESC");
                        $stmt->execute();
                        $rawResult = $stmt->fetchAll();
                        $total_pages = ceil(count($rawResult) / $numOfrecs);
                        if ($total_pages == 0) $total_pages = 1;

                        $stmt = $pdo->prepare("SELECT * FROM product_types ORDER BY id DESC LIMIT $offset, $numOfrecs");
                        $stmt->execute();
                        $typedatas = $stmt->fetchAll();

                        foreach ($typedatas as $data) { ?>
                            <tr>
                                <td><?php echo $data['id']; ?></td>
                                <td class="fw-bold text-primary"><?php echo htmlspecialchars($data['name']); ?></td>
                                <td>
                                    <button type="button" class="btn btn-warning btn-sm text-light" data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $data['id']; ?>">Edit</button>
                                    <form action="product_types.php" method="post" style="display: inline !important;">
                                        <input type="hidden" name="deleteid" value="<?php echo $data['id']; ?>">
                                        <button type="submit" name="deletebutton" class="btn btn-sm btn-danger">Delete</button>
                                    </form>
                                </td>
                            </tr>

                            <!-- Update Modal -->
                            <div class="modal fade" id="updatemodal<?php echo $data['id']; ?>" tabindex="-1" role="dialog">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header bg-warning text-light">
                                            <h5 class="modal-title">Update Product Type</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <form action="product_types.php" method="post" autocomplete="off">
                                            <div class="modal-body">
                                                <input type="hidden" name="updateid" value="<?php echo $data['id']; ?>">
                                                <label>Product Type Name</label>
                                                <input type="text" name="name" class="form-control" value="<?php echo htmlspecialchars($data['name']); ?>" required>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-warning" name="updatebutton">Update</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        <?php } ?>
                    </table>
                    <br>

                    <div aria-label="Page navigation example" style="float:right;">
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link" href="?pageno=1">First</a></li>
                            <li class="page-item <?php if ($pageno <= 1) echo 'disabled'; ?>">
                                <a class="page-link" href="<?php if ($pageno <= 1) {
                                                                echo '#';
                                                            } else {
                                                                echo "?pageno=" . ($pageno - 1);
                                                            } ?>">Previous</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#"><?php echo $pageno; ?></a></li>
                            <li class="page-item <?php if ($pageno >= $total_pages) echo 'disabled'; ?>">
                                <a class="page-link" href="<?php if ($pageno >= $total_pages) {
                                                                echo '#';
                                                            } else {
                                                                echo "?pageno=" . ($pageno + 1);
                                                            } ?>">Next</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="?pageno=<?php echo $total_pages; ?>">Last</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Add Modal -->
    <div class="modal fade" id="addmodal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header bg-secondary text-light">
                    <h5 class="modal-title">Create New Product Type</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="product_types.php" method="post" autocomplete="off">
                    <div class="modal-body">
                        <label>Product Type Name</label>
                        <input type="text" name="name" class="form-control" placeholder="e.g. Fish, Packing Material, Services" required>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-success" name="addbutton">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <?php $bootstrap->javascript(); ?>
</body>

</html>