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
    if(isset($_POST['searchcustomer'])){
      if(!empty($_POST['search_id'])){
        $search_id = $_POST['search_id'];
        $customerdatas = $query->search('customers', 'customer_id', $search_id);
      }else {
        $customerdatas = $query->selectall('customers');
      }
    }else {
      $customerdatas = $query->selectall('customers');
    }
     ?>
    <div class="row">
      <div class="col-2">
        <?php
        include 'sidebar.php';
        ?>
      </div>
      <div class="col-10">
        <div class="card mt-3">
          <div class="card-header bg-warning text-light"  style="padding:-10px;">
            <h5>Payable Detail Info</h5>
          </div>
          <div class="card-body">
            <?php
            if(isset($_POST['deletebutton'])){
              $deleteid = $_POST['deleteid'];
              $message = $query->deletecustomer('customers', $deleteid);
            }
            if(isset($_POST['updatebutton'])){
              $customer_id = $_POST['customer_id'];
              $customer_name = $_POST['customer_name'];
              $customer_phone = $_POST['customer_phone'];
              $customer_address = $_POST['customer_address'];
              $updateid = $_POST['updateid'];

              $message = $query->updatecustomer('customers', $customer_id, $customer_name, $customer_phone, $customer_address, $updateid);
            }
            if(isset($_POST['addbutton'])){
              $paid_date = $_POST['paid_date'];
              $paid_voucher = $_POST['paid_voucher'];
              $paid_amount = $_POST['paid_amount'];

              $message = $query->addpayable('payable',$paid_date, $paid_voucher, $paid_amount);
            }
            ?>
            <?php include 'message.php'; ?>
            <?php

            if (!empty($_GET['pageno'])) {
              $pageno = $_GET['pageno'];
            }else{
              $pageno = 1;
            }
            $numOfrecs = 2;
            $offset = ($pageno -1) * $numOfrecs;
            ?>
            <button type="button" class="btn btn-success float-end d-inline" data-bs-toggle="modal" data-bs-target="#addmodal">
              Add Pay Amount
            </button>
            <?php
              if(!empty($_GET['pageno'])){
                $stmt = $pdo->prepare("SELECT * FROM payable ORDER BY id");
                $stmt->execute();
                $rawResult = $stmt->fetchAll();
                $total_pages = ceil(count($rawResult) / $numOfrecs);

                $stmt = $pdo->prepare("SELECT * FROM payable ORDER BY id LIMIT $offset,$numOfrecs ");
                $stmt->execute();
                $customerdatas = $stmt->fetchAll();
              }else{
                $payabledatas = $query->selectall('purchase');
              }
            ?>
            <table class="mt-5 table table-bordered table-striped rounded">
              <tr>
                <th>#</th>
                <th>Supplier</th>
                <th>Purchase <br> Voucher No</th>
                <th>Purchase <br> Amount</th>
                <th>Paid Date</th>
                <th>Paid Voucher</th>
                <th>Paid Amount</th>
                <th>Action</th>
              </tr>
              <?php
              foreach ($payabledatas as $payabledata) {

                $supplier = $query->select('purchase', $payabledata['supplier_id'] , 'supplier_id');
                $supplier_name = $query->select('supplier', $supplier['supplier_id'], 'supplier_id');
                // $purchase_voucher_no = $query->select('purchase', $payabledata['purchase_voucher_no'] , 'voucher_no');
                // $purchase_amount = $query->select('purchase', $payabledata['purchase_amount'] , 'amount');
                // $total_balance = $query->selectsum('purchase', $payabledata['voucher_no'], 'voucher_no');
                $link_id = $query->select('payable', $payabledata['no'], 'link_id');
                $paid_date = $query->select('payable', $payabledata['no'], 'link_id');
                $paid_voucher = $query->select('payable', $payabledata['no'], 'link_id');
                $paid_amount = $query->select('payable', $payabledata['no'], 'link_id');
              ?>
              <tr>

                <td><?php echo $link_id['link_id']; ?></td>
                <td><?php echo $supplier_name['supplier_name']; ?></td>
                <td><?php echo $payabledata['voucher_no']; ?></td>
                <td><?php echo $payabledata['amount']; ?></td>
                <td></td>
                <td></td>
                <td></td>
                <td>
                  <input type="hidden" name="updateid" value="<?php echo $customerdata['customer_id']; ?>">
                  <button type="submit" class="btn btn-warning text-light" data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $customerdata['customer_id']; ?>">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
</svg>
                  </button>
              </td>
              </tr>
              <!-- Data Update Modal -->
              <div class="modal fade" id="updatemodal<?php echo $customerdata['customer_id']; ?>" tabindex="-1" role="dialog" >
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
                          $id = $customerdata['customer_id'];
                          $updatedata = $query->select('customers', $id, 'customer_id');
                        ?>
                        <input type="hidden" name="updateid" value="<?php echo $customerdata['customer_id']; ?>">
                        <label>Customer ID</label>
                        <input type="text" name="customer_id" class="form-control" placeholder="Customer ID" value="<?php echo $updatedata['customer_id']; ?>">
                        <label>Customer Name</label>
                        <input type="text" name="customer_name" class="form-control" placeholder="Customer Name" value="<?php echo $updatedata['customer_name']; ?>">
                        <label>Customer Phone</label>
                        <input type="number" name="customer_phone" class="form-control" placeholder="Customer Phone" value="<?php echo $updatedata['customer_phone']; ?>">
                        <label>Customer Address</label>
                        <input type="text" name="customer_address" class="form-control" placeholder="Customer Address" value="<?php echo $updatedata['customer_address']; ?>">
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
              $voucher_no = $payabledata['voucher_no'];
              };
              ?>
              <?php
              $payableamountdatas = $query->selectall('payable');
              foreach ($payableamountdatas as $payableamountdata)
              {
               ?>
              <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><?php echo $payableamountdata['paid_date']; ?></td>
                <td><?php echo $payableamountdata['paid_voucher']; ?></td>
                <td><?php echo $payableamountdata['paid_amount']; ?></td>
                <td></td>
              </tr>
              <?php
                }
               ?>
              <?php
                $stmt = $pdo->prepare("SELECT SUM(amount) AS total_purchase_amount FROM purchase WHERE voucher_no='$voucher_no'");
                $stmt->execute();
                $total_amount = $stmt->fetch(PDO::FETCH_ASSOC);

                ?>
                <tr>
                  <td></td>
                  <td></td>
                  <td>Total Purchase Amount</td>
                  <td><?php echo $total_amount['total_purchase_amount'] ?></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
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
  <div class="modal fade" id="addmodal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header bg-secondary text-light">
          <h5 class="modal-title" id="addmodellabel">Add Pay Amount</h5>
          <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true" class="h3">&times;</span>
          </button>
        </div>
        <form action="accountpayable.php" method="post" autocomplete="off">
          <!-- <input type="hidden" name="supplier_id" value="<?php //echo $supplier_id; ?>"> -->
          <div class="modal-body">
            <label>Paid Date</label>
            <input type="date" name="paid_date" class="form-control">
            <label>Paid Voucher</label>
            <input type="text" name="paid_voucher" class="form-control" placeholder="Paid Voucher">
            <label>Paid Amount</label>
            <input type="number" name="paid_amount" class="form-control" placeholder="Paid Amount">
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-success" name="addbutton">Add Pay Amount</button>
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
