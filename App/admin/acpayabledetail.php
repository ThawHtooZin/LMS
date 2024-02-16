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
          <div class="card-header bg-info text-light">
            <a href="acpayable.php" class="btn btn-secondary btn-sm float-end">Back</a>
            <h5><?php $supplier_name = $query->select('acname', $_GET['supplier_id'], 'code_no'); echo $supplier_name['ac_name']; ?> Payable Detail Info</h5>
            <!-- <form class="float-end" action="" method="post">

              <select class="chzn-select" name="supplier_id" style="width:100%;" data-placeholder="Supplier name">
                <option value=""></option>
                <?php
                $supplierdatastmt = $pdo->prepare("SELECT DISTINCT supplier_id FROM payable");
                $supplierdatastmt->execute();
                $supplierdatas = $supplierdatastmt->fetchall();
                foreach ($supplierdatas as $supplierdata) {
                  $supplier_name = $query->select('acname', $supplierdata['supplier_id'], 'code_no');
                  ?>
                  <option value="<?php echo $supplierdata['supplier_id']; ?>"><?php echo $supplier_name['ac_name']; ?> - <?php echo $supplierdata['supplier_id']; ?></option>
                  <?php
                }
                ?>
              </select>
              <button type="submit" name="search" class="btn btn-primary btn-sm">Search</button> -->
            </form>
          </div>
          <div class="card-body">
            <?php
            // if(isset($_POST['updatebutton'])){
            //   $paid_date = $_POST['paid_date'];
            //   $paid_voucher = $_POST['paid_voucher'];
            //   $paid_amount = $_POST['paid_amount'];
            //   $updateid = $_POST['updateid'];
            //
            //   $message = $query->updatepayable($paid_date, $paid_voucher, $paid_amount, $updateid);
            // }
            // if(isset($_POST['addbutton'])){
            //   $supplier_id = $_POST['supplier_id'];
            //   $paid_date = $_POST['paid_date'];
            //   $paid_voucher = $_POST['paid_voucher'];
            //   $paid_amount = $_POST['paid_amount'];
            //
            //   $message = $query->addpayable('payable',$supplier_id, $paid_date, $paid_voucher, $paid_amount);
            // }
            // if(isset($_POST['search'])){
            //   $supplier_id = $_POST['supplier_id'];
            //   $purchasedatas = $query->search('purchase', 'supplier_id', $supplier_id);
            // }
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
            <?php
              $supplier_id = $_GET['supplier_id'];
              $payablestmt = $pdo->prepare("SELECT * FROM payable WHERE supplier_id='$supplier_id' GROUP BY purchase_voucher_no");
              $payablestmt->execute();
              $payabledatas = $payablestmt->fetchall();
            ?>
            <table class="mt-1 table table-bordered table-striped rounded">
              <tr>
                <th class="pt-3">Date</th>
                <th>Purchase <br> Voucher No</th>
                <th>Purchase <br> Amount</th>
                <th class="pt-3">Paid Date</th>
                <th class="pt-3">Paid Voucher</th>
                <th class="pt-3">Particular</th>
                <th class="pt-3">Paid Amount</th>
                <th class="pt-3">Balance</th>
                <th>Action</th>
              </tr>
              <?php
              $idd = 0;
              foreach ($payabledatas as $payabledata) {
                $purchase_voucher_no = $payabledata['purchase_voucher_no'];
                $totalpurchaseamountstmt = $pdo->prepare("SELECT SUM(purchase_amount) AS total_purchase_amount FROM payable WHERE supplier_id='$supplier_id' AND purchase_voucher_no='$purchase_voucher_no'");
                $totalpurchaseamountstmt->execute();
                $totalpurchaseamount = $totalpurchaseamountstmt->fetch(PDO::FETCH_ASSOC);

                if($payabledata['purchase_voucher_no'] == ''){
                  $balanceamountstmt = $pdo->prepare("SELECT closing_balance FROM payable WHERE supplier_id='$supplier_id'");
                  $balanceamountstmt->execute();
                  $balanceamount = $balanceamountstmt->fetch(PDO::FETCH_ASSOC);
                  $totalpurchaseamount['total_purchase_amount'] = 0;
                }else{
                  if($idd <= 1){
                    $balanceamountstmt = $pdo->prepare("SELECT closing_balance FROM payable WHERE supplier_id='$supplier_id' AND closing_balance != 0 ORDER BY id DESC");
                    $balanceamountstmt->execute();
                    $balanceamount = $balanceamountstmt->fetch(PDO::FETCH_ASSOC);
                    $balanceamount['closing_balance'] = $totalpurchaseamount['total_purchase_amount'] + $balanceamount['closing_balance'];
                  }else{
                    $balanceamountstmt = $pdo->prepare("SELECT balance FROM payable WHERE supplier_id='$supplier_id' AND purchase_voucher_no='$purchase_voucher_no' ORDER BY id DESC");
                    $balanceamountstmt->execute();
                    $balanceamount = $balanceamountstmt->fetch(PDO::FETCH_ASSOC);
                    $balanceamount['closing_balance'] = $balanceamount['balance'];
                  }
                }

                $idd++;
              ?>
              <tr>
                <td><?php if($payabledata['date'] != '0000-00-00'){echo date('d-m-Y', strtotime($payabledata['date'])); }; ?></td>
                <td><?php if($payabledata['purchase_voucher_no'] == 	999999999){}else{echo $payabledata['purchase_voucher_no'];} ?></td>
                <td><?php if($totalpurchaseamount['total_purchase_amount'] != 0){ echo $totalpurchaseamount['total_purchase_amount']; }; ?></td>
                <td><?php if($payabledata['paid_date'] != "0000-00-00"){ echo date('d-m-Y', strtotime($payabledata['paid_date'])); }; ?></td>
                <td><?php echo $payabledata['paid_voucher']; ?></td>
                <td><?php echo $payabledata['remark']; ?></td>
                <td><?php if(!empty($payabledata['paid_amount'])){ echo $payabledata['paid_amount'];}; ?></td>
                <td><?php if(!empty($balanceamount['closing_balance'])){ echo $balanceamount['closing_balance']; } ?></td>
                <td>
                  <a href="edittransaction.php?voucher_no=<?= $payabledata['paid_voucher']; ?>&file=payable" style="<?php if(empty($payabledata['paid_amount'])){ echo "display:none;"; } ?>">
                    <button type="submit" class="btn btn-warning btn-sm text-light" name="updatebutton"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                      </svg>
                    </button>
                  </a>
                </td>
              </tr>

              <!-- Data Update Modal -->
              <!-- <div class="modal fade" id="updatemodal<?php echo $payabledata['id']; ?>" tabindex="-1" role="dialog" >
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
              </div> -->
              <!-- Update Modal -->
              <?php
              $voucher_no = $payabledata['purchase_voucher_no'];
              $supplier_id = $payabledata['supplier_id'];
              };
              ?>

              <?php
                  $total_purchase_amount = $query->selectallsumpayable('payable', 'purchase_amount', 'total_purchase_amount', $supplier_id);
                  $total_paid_amount = $query->selectallsumpayable('payable', 'paid_amount', 'total_paid_amount', $supplier_id);

                  $balanceamountstmt = $pdo->prepare("SELECT SUM(closing_balance) AS closing_balance FROM payable WHERE supplier_id='$supplier_id'");
                  $balanceamountstmt->execute();
                  $balanceamount = $balanceamountstmt->fetch(PDO::FETCH_ASSOC);


                  ?>
                  <tr style="font-weight: bold;">
                    <td>Total:</td>
                    <td></td>
                    <td><?php echo $total_purchase_amount['total_purchase_amount'] ?></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><?php if($total_paid_amount['total_paid_amount'] != 0){ echo $total_paid_amount['total_paid_amount'];} ?></td>
                    <td><?php echo ($balanceamount['closing_balance'] + $total_purchase_amount['total_purchase_amount']) - $total_paid_amount['total_paid_amount']; ?></td>
                    <td></td>
                  </tr>
                  <?php
                ?>

            </table>
          </div>
        </div>
      </div>
    </div>

  <!-- Data Add Modal -->
  <!-- <div class="modal fade" id="addmodal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header bg-secondary text-light">
          <h5 class="modal-title" id="addmodellabel">Add Pay Amount</h5>
          <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true" class="h3">&times;</span>
          </button>
        </div>
        <form action="accountpayable.php" method="post" autocomplete="off">
          <input type="hidden" name="supplier_id" value="<?php //echo $supplier_id; ?>">
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
  </div> -->
  <!-- Add Modal -->

  <?php
  $bootstrap->javascript();
  ?>
  </body>
</html>
