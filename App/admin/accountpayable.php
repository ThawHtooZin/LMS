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
    <title>Admin | Cash Book</title>
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
            <h5>Manage Account Payable</h5>
          </div>
          <div class="card-body">
            <?php
            if(isset($_POST['deletebutton'])){
              $deleteid = $_POST['deleteid'];
              $message = $query->deleteaccount('accounts', $deleteid);
            }
            if(isset($_POST['updateaccount'])){
              $username = $_POST['username'];
              $password = $_POST['password'];
              $email = $_POST['email'];
              $role = $_POST['role'];
              $id = $_POST['updateid'];

              $message = $query->updateaccount('accounts', $username, $password, $email, $role, $id);
            }
            ?>
            <?php
            if(isset($_POST['adddata'])){
              $purchase_date = $_POST['purchase_date'];
              $supplier_id = $_POST['supplier_id'];
              $voucher_no = $_POST['voucher_no'];
              $amount = $_POST['amount'];
              $paid_date = $_POST['paid_date'];
              $paid_amount = $_POST['paid_amount'];

              $message = $query->addpayabledata('payable', $purchase_date, $supplier_id, $voucher_no, $amount, $paid_date, $paid_amount);
            }
            ?>
            <?php
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
            <?php

            if (!empty($_GET['pageno'])) {
              $pageno = $_GET['pageno'];
            }else{
              $pageno = 1;
            }
            $numOfrecs = 5;
            $offset = ($pageno -1) * $numOfrecs;
            ?>
            <!-- <button type="button" class="btn btn-success float-end" data-bs-toggle="modal" data-bs-target="#addmodal">
              Add Payable Data
            </button> -->
            <table class="mt-5 table table-bordered table-striped rounded">
              <tr>
                <th>#</th>
                <th>Supplier</th>
                <th>Voucher No</th>
                <th>Amount</th>
                <th>Action</th>
              </tr>
              <?php
              if(!empty($_POST['pageno'])){
                $stmt = $pdo->prepare("SELECT * FROM payable ORDER BY id");
                $stmt->execute();
                $rawResult = $stmt->fetchAll();
                $total_pages = ceil(count($rawResult) / $numOfrecs);

                $stmt = $pdo->prepare("SELECT * FROM payable ORDER BY id LIMIT $offset,$numOfrecs ");
                $stmt->execute();
                $paydatas = $stmt->fetchAll();
              }else{


                $purchasestmt = $pdo->prepare("SELECT DISTINCT voucher_no FROM purchase ");
                $purchasestmt->execute();
                $purchaseDatas = $purchasestmt->fetchall();
              }
              ?>
              <?php
              $i=1;
              foreach ($purchaseDatas as $purchasedata) {
                $voucher_no = $purchasedata['voucher_no'];
                $stmt = $pdo->prepare("SELECT SUM(amount) AS amount FROM purchase WHERE voucher_no='$voucher_no'");
                $stmt->execute();
                $purchasedatasum = $stmt->fetchall();

                $supplierstmt = $pdo->prepare("SELECT supplier_id FROM purchase WHERE voucher_no='$voucher_no'");
                $supplierstmt->execute();
                $supplier_id = $supplierstmt->fetch(PDO::FETCH_ASSOC);


                $supplier_id = $supplier_id['supplier_id'];
                $suppliernamestmt = $pdo->prepare("SELECT supplier_name FROM supplier WHERE supplier_id='$supplier_id'");
                $suppliernamestmt->execute();
                $supplier_name = $suppliernamestmt->fetch(PDO::FETCH_ASSOC);

                $stmt = $pdo->prepare("SELECT balance FROM payable WHERE voucher_no='$voucher_no' ORDER BY id DESC");
                $stmt->execute();
                $payableamount = $stmt->fetch(PDO::FETCH_ASSOC);
                ?>
              <tr>
                <td><?php echo $i; ?></td>
                <td><?php echo $supplier_name['supplier_name']; ?></td>
                <td><?php echo $purchasedata['voucher_no']; ?></td>
                <td><?php if(empty($payableamount)){ echo $purchasedatasum[0]['amount']; }else{ echo $payableamount['balance']; } ?></td>
                <td class="text-center">
                  <a href="payableinfo.php?voucher_no=<?php echo $purchasedata['voucher_no']; ?>" class="btn btn-info btn-sm text-light" data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $cashdata['id']; ?>">
                    Detail
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list-check" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3.854 2.146a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 3.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 7.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 0 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0z"/>
</svg>
                  </button>
              </td>
              </tr>
              <!-- Update Modal -->
              <?php
              $i++;
              }
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
  <!-- <div class="modal fade" id="addmodal" tabindex="-1" role="dialog" aria-hidden="true" style="margin-left:auto !important; margin-right: auto !important;">
    <div class="modal-dialog" role="document">
      <div class="modal-content" style="width: 750px; !important; margin-top:70px !important;">
        <div class="modal-header bg-primary text-light">
          <h5 class="modal-title" id="addmodellabel">Create New Data</h5>
          <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true" class="h3">&times;</span>
          </button>
        </div>
        <form action="accountpayable.php" method="post" autocomplete="off">
          <div class="modal-body">
            <div class="row">
              <div class="col">
                <label style="font-weight:bold;">Date</label>
                <input type="date" name="purchase_date" class="form-control inpv2" placeholder="Date">
              </div>
              <div class="col">
                <label style="font-weight:bold;">Supplier Name</label>
                <select class="form-control inpv2 mb-2" name="supplier_id">
                  <?php
                  // $supplierdatas = $query->selectall('supplier');
                  // foreach ($supplierdatas as $supplierdata) {
                    ?>
                    <option value="<?php //echo $supplierdata['supplier_id']; ?>"><?php //echo $supplierdata['supplier_name']; ?></option>
                    <?php
                  // }
                  ?>
                </select>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label class="mt-2" style="font-weight:bold;">Voucher No</label>
                <select class="form-control inpv2 mb-2" name="voucher_no">
                  <?php
                  // $voucherdatas = $query->selectdesc('purchase', 'voucher_no');
                  // foreach ($voucherdatas as $voucherdata) {
                    ?>
                    <option value="<?php //echo $voucherdata['voucher_no']; ?>"><?php //echo $voucherdata['voucher_no']; ?></option>
                    <?php
                  // }
                  ?>
                </select>
              </div>
              <div class="col">
                <label class="mt-2" style="font-weight:bold;">Amount</label>
                <input type="number" name="amount" class="form-control inpv2" placeholder="Amount">
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label class="mt-2" style="font-weight:bold;">Paid Date</label>
                <input type="date" name="paid_date" class="form-control inpv2">
              </div>
              <div class="col">
                <label class="mt-2" style="font-weight:bold;">Paid Amount</label>
                <input type="number" name="paid_amount" class="form-control inpv2" placeholder="Paid Amount">
              </div>
            </div>
            <div class="mt-2">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-success" name="adddata">Add Data</button>
            </div>
          </div>
          <div class="modal-footer">
          </div>
        </form>
      </div>
    </div>
  </div> -->
  <!-- Add Modal -->

    <script type="text/javascript">
      function inoroutchange(){

      }
    </script>
    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
