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
    <?php
    if(isset($_POST['searchsupplier'])){
      if(!empty($_POST['search_id'])){
        $search_id = $_POST['search_id'];
        $supplierdatas = $query->search('supplier', 'supplier_id', $search_id);
      }else {
        $supplierdatas = $query->selectall('supplier');
      }
    }else {
      $supplierdatas = $query->selectall('supplier');
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
                <div class="card-header bg-warning text-light" style="padding:-10px;">

                    <b>Manage Supplier</b>
                </div>
                <div class="card-body">
                    <?php
            if(isset($_POST['deletebutton'])){
              $deleteid = $_POST['deleteid'];
              $message = $query->deletesupplier('supplier', $deleteid);
            }
            if(isset($_POST['updatebutton'])){
              $supplier_name = $_POST['supplier_name'];
              $supplier_phone = $_POST['supplier_phone'];
              $supplier_address = $_POST['supplier_address'];
              $updateid = $_POST['updateid'];

              $message = $query->updatesupplier('supplier', $supplier_name, $supplier_phone, $supplier_address, $updateid);
            }
            if(isset($_POST['addbutton'])){
              $supplier_id = $_POST['supplier_id'];
              $supplier_name= $_POST['supplier_name'];
              $supplier_phone = $_POST['supplier_phone'];
              $supplier_address = $_POST['supplier_address'];

              $message = $query->addsupplier('supplier', $supplier_id, $supplier_name,  $supplier_phone, $supplier_address);
            }
            ?>
                    <?php
            if (!empty($_GET['pageno'])) {
              $pageno = $_GET['pageno'];
            }else{
              $pageno = 1;
            }
            $numOfrecs = 10;
            $offset = ($pageno -1) * $numOfrecs;
            ?>
                    <form action="supplier.php" method="post" class=" d-inline">
                        <select name="search_id" class="form-control d-inline"
                            style="width:15%; padding: 0px !important; margin: 0 !important; font-size: 15px !important;">
                            <?php
                $supplierdatasfs = $query->selectall('supplier');
                foreach ($supplierdatasfs as $supplierdatafs) {
                  ?>
                            <option value="<?php echo $supplierdatafs['supplier_id']; ?>">
                                <?php echo $supplierdatafs['supplier_name']; ?></option>
                            <?php
                }
                 ?>
                        </select>
                        <button type="submit" name="searchsupplier" class="btn btn-info btn-sm">Search</button>
                        <a href="supplier_report.php" class="btn btn-primary btn-sm">Report</a>
                    </form>
                    <button type="button" class="btn btn-success float-end btn-sm" data-bs-toggle="modal"
                        data-bs-target="#addmodal">
                        Add Supplier
                    </button>
                    <table class="mt-1 table table-bordered table-striped rounded">
                        <tr>
                            <th>Supplier A/C Code</th>
                            <th>Supplier Name</th>
                            <th>Supplier Phone</th>
                            <th>Supplier Address</th>
                            <th>Action</th>
                        </tr>
                        <?php
              if(!isset($_POST['search_id'])){

              $stmt = $pdo->prepare("SELECT * FROM supplier ORDER BY supplier_id");
              $stmt->execute();
              $rawResult = $stmt->fetchAll();
              $total_pages = ceil(count($rawResult) / $numOfrecs);

              $stmt = $pdo->prepare("SELECT * FROM supplier ORDER BY supplier_id LIMIT $offset,$numOfrecs ");
              $stmt->execute();
              $supplierdatas = $stmt->fetchAll();
            }
              ?>
                        <?php
              foreach ($supplierdatas as $supplierdata) {
              ?>

                        <tr>
                            <td><?php echo $supplierdata['supplier_id']; ?></td>
                            <td><?php echo $supplierdata['supplier_name']; ?></td>
                            <td><?php echo $supplierdata['supplier_phone']; ?></td>
                            <td><?php echo $supplierdata['supplier_address']; ?></td>
                            <td>
                                <input type="hidden" name="updateid"
                                    value="<?php echo $supplierdata['supplier_id']; ?>">
                                <button type="submit" class="btn btn-warning btn-sm text-light" data-bs-toggle="modal"
                                    data-bs-target="#updatemodal<?php echo $supplierdata['supplier_id']; ?>">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                        class="bi bi-pencil-square" viewBox="0 0 16 16">
                                        <path
                                            d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                        <path fill-rule="evenodd"
                                            d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                                    </svg>
                                </button>
                                <form action="supplier.php" method="post" style="display: inline !important;">
                                    <input type="hidden" name="deleteid"
                                        value="<?php echo $supplierdata['supplier_id']; ?>">
                                    <button type="submit" name="deletebutton" class="btn btn-sm btn-danger">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                            fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
                                            <path
                                                d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z" />
                                        </svg>
                                    </button>
                                </form>
                            </td>
                        </tr>
                        <!-- Data Update Modal -->
                        <div class="modal fade" id="updatemodal<?php echo $supplierdata['supplier_id']; ?>"
                            tabindex="-1" role="dialog">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header bg-warning text-light">
                                        <h5 class="modal-title" id="updatemodallabel">Update An Item</h5>
                                        <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true" class="h3">&times;</span>
                                        </button>
                                    </div>
                                    <form action="" method="post" autocomplete="off">
                                        <div class="modal-body">
                                            <?php
                          $id = $supplierdata['supplier_id'];
                          $updatedata = $query->select('supplier', $id, 'supplier_id');
                        ?>
                                            <input type="hidden" name="updateid"
                                                value="<?php echo $supplierdata['supplier_id']; ?>">
                                            <label>Supplier ID</label>
                                            <input type="text" name="supplier_id" disabled class="form-control"
                                                placeholder="Supplier ID"
                                                value="<?php echo $supplierdata['supplier_id']; ?>">
                                            <label>Supplier Name</label>
                                            <input type="text" name="supplier_name" class="form-control"
                                                placeholder="Supplier Name"
                                                value="<?php echo $supplierdata['supplier_name']; ?>">
                                            <label>Supplier Phone</label>
                                            <input type="number" name="supplier_phone" class="form-control"
                                                placeholder="Supplier Phone"
                                                value="<?php echo $supplierdata['supplier_phone']; ?>">
                                            <label>Supplier Address</label>
                                            <input type="text" name="supplier_address" class="form-control"
                                                placeholder="Supplier Address"
                                                value="<?php echo $supplierdata['supplier_address']; ?>">
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary"
                                                data-bs-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-warning"
                                                name="updatebutton">Update</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- Update Modal -->
                        <?php
              };
              ?>

                    </table>
                    <br>
                    <div aria-label="Page navigation example" style="float:right;">
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link" href="?pageno=1">First</a></li>
                            <li class="page-item <?php if($pageno <= 1){echo 'disabled';} ?>">
                                <a class="page-link"
                                    href="<?php if($pageno <= 1){echo '#';} else {echo "?pageno=".($pageno-1);} ?>">Previous</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#"><?php echo $pageno; ?></a></li>
                            <li class="page-item <?php if($pageno >= $total_pages){echo 'disabled';}; ?>">
                                <a class="page-link"
                                    href="<?php if($pageno >= $total_pages){echo '#';}else{echo "?pageno=".($pageno+1);} ?>">Next</a>
                            </li>
                            <li class="page-item"><a class="page-link"
                                    href="?pageno=<?php echo $total_pages; ?>">Last</a> </li>
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
                    <h5 class="modal-title" id="addmodellabel">Create New Supplier</h5>
                    <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="h3">&times;</span>
                    </button>
                </div>
                <form action="supplier.php" method="post" autocomplete="off">
                    <div class="modal-body">
                        <label>Supplier ID</label>
                        <input type="text" name="supplier_id" class="form-control" placeholder="Supplier ID">
                        <label>Supplier Name</label>
                        <input type="text" name="supplier_name" class="form-control" placeholder="Supplier Name">
                        <label>Supplier Phone</label>
                        <input type="number" name="supplier_phone" class="form-control" placeholder="Supplier Phone">
                        <label>Supplier Address</label>
                        <input type="text" name="supplier_address" class="form-control" placeholder="Supplier Address">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-success" name="addbutton">Add Supplier</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Add Modal -->

    <?php
  $bootstrap->javascript();
  ?>
</body>

</html>