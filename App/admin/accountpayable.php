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
       <div class="sidebarcol" id="sidebar">
         <?php
         include 'sidebar.php';
         ?>
       </div>
       <div class="contentcol" id="content">
         <?php require 'navbar.php'; ?>
        <div class="card">
          <div class="card-header bg-warning text-light">
            <h5>Account Payablex</h5>
          </div>
          <div class="card-body">
            <?php
            if(isset($_POST['deletebutton'])){
              $deleteid = $_POST['deleteid'];
              $message = $query->deletecustomer('customers', $deleteid);
            }
            if(isset($_POST['updatebutton'])){
              $paid_date = $_POST['paid_date'];
              $paid_voucher = $_POST['paid_voucher'];
              $paid_amount = $_POST['paid_amount'];
              $updateid = $_POST['updateid'];

              $message = $query->updatepayable($paid_date, $paid_voucher, $paid_amount, $updateid);
            }
            if(isset($_POST['addbutton'])){
              $supplier_id = $_POST['supplier_id'];
              $paid_date = $_POST['paid_date'];
              $paid_voucher = $_POST['paid_voucher'];
              $paid_amount = $_POST['paid_amount'];

              $message = $query->addpayable('payable',$supplier_id, $paid_date, $paid_voucher, $paid_amount);
            }
            if(isset($_POST['search'])){
              $supplier_id = $_POST['supplier_id'];
              $purchasedatas = $query->search('purchase', 'supplier_id', $supplier_id);
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
            <form  action="payable.php" method="post" class="d-inline">
              <span>Supplier Name:</span>
              <select class="form-control d-inline" name="supplier_id" style="width:15%;">
                <?php
                $supplierdatas = $query->selectall('supplier');
                foreach ($supplierdatas as $supplierdata) {
                  ?>
                  <option value="<?php echo $supplierdata['supplier_id']; ?>"><?php echo $supplierdata['supplier_name']; ?></option>
                  <?php
                }
                ?>
              </select>
              <button type="submit" name="search" class="btn btn-primary btn-sm">Search</button>
            <button type="button" class="btn btn-success float-end d-inline" data-bs-toggle="modal" data-bs-target="#addmodal">
              Add Pay Amount
            </button>
            <?php
              if(isset($_POST['search'])){
                $supplier_id = $_POST['supplier_id'];
                $payabledatas = $query->search('payable', 'supplier_id', $supplier_id);
              }elseif(!empty($_GET['pageno'])){
                $stmt = $pdo->prepare("SELECT * FROM payable ORDER BY id");
                $stmt->execute();
                $rawResult = $stmt->fetchAll();
                $total_pages = ceil(count($rawResult) / $numOfrecs);

                $stmt = $pdo->prepare("SELECT * FROM payable ORDER BY id LIMIT $offset,$numOfrecs ");
                $stmt->execute();
                $customerdatas = $stmt->fetchAll();
              }else{
                $payabledatas = $query->selectall('payable');
              }
            ?>
            <table class="mt-5 table table-bordered table-striped rounded">
              <tr>
                <th>Supplier</th>
                <th>Purchase <br> Voucher No</th>
                <th>Purchase <br> Amount</th>
                <th>Paid Date</th>
                <th>Paid Voucher</th>
                <th>Paid Amount</th>
                <!-- <th>Action</th> -->
              </tr>
              <?php
              foreach ($payabledatas as $payabledata) {

                $supplier = $query->select('payable', $payabledata['supplier_id'] , 'supplier_id');
                $supplier_name = $query->select('supplier', $supplier['supplier_id'], 'supplier_id');
                $linkstmt = $pdo->prepare("SELECT link_id FROM payable WHERE ");
                $link_id = $linkstmt->fetch(PDO::FETCH_ASSOC);
              ?>
              <tr>
                <td><?php if(!empty($payabledata['purchase_voucher_no'])){ echo $supplier_name['supplier_name']; }; ?></td>
                <td><?php echo $payabledata['purchase_voucher_no']; ?></td>
                <td><?php if(!empty($payabledata['purchase_amount'])){ echo $payabledata['purchase_amount'];}; ?></td>
                <td><?php if($payabledata['paid_date'] != "0000-00-00"){ echo $payabledata['paid_date']; }; ?></td>
                <td><?php echo $payabledata['paid_voucher']; ?></td>
                <td><?php if(!empty($payabledata['paid_amount'])){ echo $payabledata['paid_amount'];}; ?></td>
                <!-- <td style="<?php// if($payabledata['paid_date'] == "0000-00-00"){ echo "display:none;"; }; ?>">
                  <input type="hidden" name="updateid" value="<?php// echo $payabledata['id']; ?>">
                  <button type="submit" class="btn btn-warning text-light" data-bs-toggle="modal" data-bs-target="#updatemodal<?php //echo $payabledata['id']; ?>">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
</svg>
                  </button>
              </td> -->
              </tr>

              <!-- Data Update Modal -->
              <div class="modal fade" id="updatemodal<?php echo $payabledata['id']; ?>" tabindex="-1" role="dialog" >
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
                          $id = $payabledata['id'];
                          $updatedata = $query->select('payable', $id, 'id');
                        ?>
                        <input type="hidden" name="updateid" value="<?php echo $payabledata['id']; ?>">
                        <label>Paid Date</label>
                        <input type="date" name="paid_date" class="form-control" value="<?php echo $payabledata['paid_date']; ?>">
                        <label>Paid Voucher</label>
                        <input type="text" name="paid_voucher" class="form-control" value="<?php echo $payabledata['paid_voucher']; ?>">
                        <label>Paid Amount</label>
                        <input type="number" name="paid_amount" class="form-control" value="<?php echo $payabledata['paid_amount']; ?>">
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
              $voucher_no = $payabledata['purchase_voucher_no'];
              $supplier_id = $payabledata['supplier_id'];
              };
              ?>

              <?php
                if(isset($_POST['search'])){
                  $total_purchase_amount = $query->selectallsumpayable('payable', 'purchase_amount', 'total_purchase_amount', $supplier_id);

                  $total_paid_amount = $query->selectallsumpayable('payable', 'paid_amount', 'total_paid_amount', $supplier_id);
                  ?>
                  <tr>
                    <td></td>
                    <td></td>
                    <td>Total Purchase Amount</td>
                    <td><?php echo $total_purchase_amount['total_purchase_amount'] ?></td>
                    <td></td>
                    <td>Total Paid Amount</td>
                    <td><?php echo $total_paid_amount['total_paid_amount'] ?></td>
                  </tr>
                  <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td>Balance</td>
                    <td><?php echo $total_purchase_amount['total_purchase_amount'] - $total_paid_amount['total_paid_amount']; ?></td>
                  </tr>
                  <?php
                }
                ?>

            </table>
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
        <form action="payable.php" method="post" autocomplete="off">
          <input type="hidden" name="supplier_id" value="<?php echo $supplier_id; ?>">
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
