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
      <div class="col-2">
        <?php
        include 'sidebar.php';
        ?>
      </div>
      <div class="col-10">
        <div class="card mt-3">
          <div class="card-header bg-warning text-light"  style="padding:-10px;">
            <h5>Manage Purchase</h5>
          </div>
          <div class="card-body">
            <?php
            if(isset($_POST['deletebutton'])){
              $deleteid = $_POST['deleteid'];
              $message = $query->deletepurchase('category', $deleteid);
            }
            if(isset($_POST['updatebutton'])){
              $category_name = $_POST['category_name'];
              $category_id = $_POST['category_id'];

              $message = $query->updatecategory('category', $category_name, $category_id);
            }
            if(isset($_POST['addbutton'])){
              $date = $_POST['date'];
              $voucher_no = $_POST['voucher_no'];
              $tclfrozen = $_POST['tclfrozen'];
              $commodity = $_POST['commodity'];
              $size = $_POST['size'];
              $viss = $_POST['viss'];
              $pcs = $_POST['pcs'];
              $price = $_POST['price'];

              $message = $query->addpurchase('purchase', $date, $voucher_no, $tclfrozen, $commodity, $size, $viss, $pcs, $price);
            }
            if(!empty($message)){
              if(strpos($message, 'Successfully')){
                $successmessage = $message;
              }

              if(strpos($message, 'Error')){
                $errmessage = $message;
              }

              if(strpos($message, 'following')){
                $errormessage = $message;
              }
            }

            ?>

            <?php
              if(!empty($errormessage)){
              ?>
              <div class="alert alert-danger alert-dismissible fade show">
                <strong>Error! </strong> <?php echo $errormessage; ?>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
              </div>
              <?php
            }
            if(!empty($errmessage)){
              ?>
              <div class="alert alert-danger alert-dismissible fade show">
                <strong>Error! </strong> <?php echo $errmessage; ?>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
              </div>
              <?php
            }
            if(!empty($successmessage)){
              ?>
              <div class="alert alert-success alert-dismissible fade show">
                <strong>Success! </strong> <?php echo $successmessage; ?>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
              </div>
              <?php
            }
            ?>

            <button type="button" class="btn btn-success float-end" data-bs-toggle="modal" data-bs-target="#addmodal">
              Add Purchase Voucher
            </button>
            <?php

            if (!empty($_GET['pageno'])) {
              $pageno = $_GET['pageno'];
            }else{
              $pageno = 1;
            }
            $numOfrecs = 2;
            $offset = ($pageno -1) * $numOfrecs;
            ?>
            <table class="mt-5 table table-bordered table-striped rounded">
              <tr>
                <th>#</th>
                <th>Date</th>
                <th>Voucher No</th>
                <th>TCL (or) Frozen</th>
                <th>Supplier Name</th>
                <th>Commodity</th>
                <th>Size</th>
                <th>Viss</th>
                <th>Pcs</th>
                <th>Price</th>
                <th>Amount</th>
                <th>Action</th>
              </tr>
              <?php
              // $stmt = $pdo->prepare("SELECT * FROM category ORDER BY category_id");
              // $stmt->execute();
              // $rawResult = $stmt->fetchAll();
              // $total_pages = ceil(count($rawResult) / $numOfrecs);
              //
              // $stmt = $pdo->prepare("SELECT * FROM category ORDER BY category_id LIMIT $offset,$numOfrecs ");
              // $stmt->execute();
              // $categorydatas = $stmt->fetchAll();
              // foreach ($categorydatas as $categorydata) {
              ?>

              <tr>
                <td>1</td>
                <td>2/2/23</td>
                <td>2852</td>
                <td>Frozen</td>
                <td>Mg Phyu</td>
                <td>Hialsa</td>
                <td>10/12</td>
                <td>289.6</td>
                <td>1</td>
                <td>18000</td>
                <td>18000</td>
                <td>
                  <input type="hidden" name="updateid" value="<?php// echo $categorydata['category_id']; ?>">
                  <button type="submit" class="btn btn-warning text-light" data-bs-toggle="modal" data-bs-target="#updatemodal">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
</svg>
                  </button>
                <form action="category.php" method="post" style="display: inline !important;">
                  <input type="hidden" name="deleteid" value="<?php// echo $categorydata['category_id']; ?>">
                  <button type="submit" name="deletebutton" class="btn btn-danger">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16"><path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/></svg>
                  </button>
                </form>
              </td>
              </tr>
              <!-- Data Update Modal -->
              <div class="modal fade" id="updatemodal" tabindex="-1" role="dialog" >
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header bg-warning text-light">
                      <h5 class="modal-title" id="updatemodallabel">Update An Category</h5>
                      <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="h3">&times;</span>
                      </button>
                    </div>
                    <form action="" method="post" autocomplete="off">
                      <div class="modal-body">
                        <?php
                        //  $id = $categorydata['category_id'];
                        //  $updatedata = $query->select('category', $id, 'category_id');
                        ?>
                        <input type="hidden" name="category_id" value="">
                        <label>Category Name</label>
                        <input type="text" name="category_name" class="form-control" placeholder="Category Name" value="">
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
              // };
              ?>

            </table>
            <br>
            <div aria-label="Page navigation example" style="float:right;">
              <ul class="pagination">
                <li class="page-item"><a class="page-link" href="?pageno=1">First</a></li>
                <li class="page-item <?php if($pageno <= 1){echo 'disabled';} ?>">
                  <a class="page-link" href="<?php if($pageno <= 1){echo '#';} else {echo "?pageno=".($pageno-1);} ?>">Previous</a>
                </li>
                <li class="page-item"><a class="page-link" href="#"><?php echo $pageno; ?></a></li>
                <li class="page-item <?php if($pageno >= $total_pages){echo 'disabled';}; ?>">
                  <a class="page-link" href="<?php if($pageno >= $total_pages){echo '#';}else{echo "?pageno=".($pageno+1);} ?>">Next</a>
                </li>
                <li class="page-item"><a class="page-link" href="?pageno=<?php echo $total_pages; ?>">Last</a> </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  <!-- Data Add Modal -->
  <div class="modal fade" id="addmodal" tabindex="-1" role="dialog" aria-hidden="true" style="margin-left:auto !important; margin-right: auto !important;">
    <div class="modal-dialog" role="document">
      <div class="modal-content"  style="width: 750px; !important; margin-top:70px !important;">
        <div class="modal-header bg-secondary text-light">
          <h5 class="modal-title" id="addmodellabel">Create New Purchase Voucher</h5>
          <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true" class="h3">&times;</span>
          </button>
        </div>
        <form action="purchase.php" method="post" autocomplete="off">
          <div class="modal-body">
            <div class="row">
              <div class="col">
                <label style="font-weight: bold;">Date</label>
                <input type="date" name="date" class="form-control inpv2">
              </div>
              <div class="col">
                <label style="font-weight: bold;">Voucher No</label>
                <input type="number" name="voucher_no" class="form-control inpv2 mb-2">
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label style="font-weight: bold;">TCL (or) Frozen</label>
                <select class="form-control inpv2 mb-2" name="tclfrozen">
                  <option value="">Select</option>
                  <option value="tcl">TCL</option>
                  <option value="frozen">Frozen</option>
                </select>
              </div>
              <div class="col">
                <label style="font-weight: bold;">Supplier Name</label>
                <select class="form-control inpv2 mb-2" name="supplier_name">
                  <?php
                  $supplierdatas = $query->selectall('supplier');
                  foreach ($supplierdatas as $supplierdata) {
                    ?>
                    <option value="<?php echo $supplierdata['id']; ?>"><?php echo $supplierdata['supplier_name']; ?></option>
                    <?php
                  }
                  ?>
                </select>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label style="font-weight: bold;">Commodity</label>
                <select class="form-control inpv2 mb-2" name="commodity">
                  <?php
                  $itemdatas = $query->selectall('item');
                  foreach ($itemdatas as $itemdata) {
                    ?>
                    <option value="<?php echo $itemdata['id']; ?>"><?php echo $itemdata['item_name']; ?></option>
                    <?php
                  }
                  ?>
                </select>
              </div>
              <div class="col">
                <label style="font-weight: bold;">Size</label>
                <input type="text" name="size" class="form-control inpv2 mb-2">
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label style="font-weight: bold;">Viss</label>
                <input type="text" name="viss" class="form-control inpv2 mb-2">
              </div>
              <div class="col">
                <label style="font-weight: bold;">Pcs</label>
                <input type="number" name="pcs" class="form-control inpv2 mb-2">
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label style="font-weight: bold;">Price</label>
                <input type="number" name="price" class="form-control inpv2 mb-2">
              </div>
              <div class="col mt-4">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-success" name="addbutton">Create Voucher</button>
              </div>
            </div>
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
