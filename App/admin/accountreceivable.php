<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();

if (isset($_POST['addpaymentbtn'])) {
  $id = $_POST['id'];
  $paid_date = $_POST['paid_date'];
  $payment_no = $_POST['payment_no'];
  $particular = $_POST['particular'];
  $paid_amount = $_POST['paid_amount'];

  $query->addpaymentofreceivable($id, $paid_date, $payment_no, $particular, $paid_amount);
}

if (isset($_POST['addbalance'])) {
  $ac_name = $_POST['ac_name'];
  $balance = $_POST['balance'];
  $date = $_POST['date'];
  $description = $_POST['description'];

  $query->addaccountreceivablebalance($date, $ac_name, $balance, $description);
}

if (isset($_POST['updatebalance'])) {
  $id = $_POST['id'];
  $ac_nameupdate = $_POST['ac_nameupdate'];
  $dateupdate = $_POST['dateupdate'];
  $balanceamount = $_POST['updatebalanceamount'];
  $description = $_POST['updatedescription'];
  $query->updateaccountreceivablebalance($id, $dateupdate, $ac_nameupdate, $balanceamount, $description);
}
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
      <?php
      include 'sidebar.php';
      ?>
    </div>
    <div class="contentcol" id="content">
      <?php require 'navbar.php'; ?>
      <div class="card">
        <div class="card-header bg-warning text-light">
          <h5 class="d-inline">Account Receivable</h5>
          <!-- <form class="float-end" action="" method="post">

              <select class="chzn-select" name="ac_codeinp" style="width:100%;" data-placeholder="Supplier name">
                <option value=""></option>
                <?php
                $acdatastmt = $pdo->prepare("SELECT DISTINCT ac_code FROM receivable");
                $acdatastmt->execute();
                $acdatas = $acdatastmt->fetchall();
                foreach ($acdatas as $acdata) {
                  $supplier_name = $query->select('acname', $acdata['ac_code'], 'code_no');
                ?>
                  <option value="<?php echo $acdata['ac_code']; ?>"><?php echo $supplier_name['ac_name']; ?> - <?php echo $acdata['ac_code']; ?></option>
                  <?php
                }
                  ?>
              </select>
              <button type="submit" name="search" class="btn btn-primary btn-sm">Search</button>
            </form> -->
          <?php
          if (!empty($_SESSION['acreceivabletabs'])) {
          ?>
            <a href="export.php?table_name=receivable&country=<?= $_SESSION['acreceivabletabs']; ?>" class="btn btn-success btn-sm float-end ms-2">Export</a>
          <?php
          }
          ?>
          <button type="button" class="btn btn-primary btn-sm float-end ms-2" data-bs-toggle="modal" data-bs-target="#addbalance">Add Balance</button>
        </div>
        <div class="card-body">
          <div class="text-center">
            <form action="" method="post">
              <?php
              $accodeloopstmt = $pdo->prepare("SELECT DISTINCT ac_code FROM receivable");
              $accodeloopstmt->execute();
              $accodeloopdatas = $accodeloopstmt->fetchAll();
              foreach ($accodeloopdatas as $accodeloopdata) :
                if (isset($_POST[$accodeloopdata['ac_code'] . 'btn'])) {
                  $_SESSION['acreceivabletabs'] = "{$accodeloopdata['ac_code']}";
                }
              endforeach;

              if (!empty($accodeloopdatas)) { // Check if the array is not empty
                foreach ($accodeloopdatas as $accodeloopdata) :
                  $acname = $query->select('acname', $accodeloopdata['ac_code'], 'code_no');
              ?>
                  <button type="submit" class="pb-2 pt-2 ps-4 pe-4 text-dark <?php if (!empty($_SESSION['acreceivabletabs']) && $_SESSION['acreceivabletabs'] == $accodeloopdata['ac_code']) {
                                                                                echo "color";
                                                                              } else {
                                                                                echo "";
                                                                              }; ?>" style="text-decoration:none; border:none;" name="<?= $accodeloopdata['ac_code']; ?>btn"><?= $acname['ac_name']; ?></button>
              <?php
                endforeach;
              }
              ?>
            </form>
            <table class="table table-hover table-striped table-bordered mt-3">
              <tr>
                <th>Date</th>
                <!-- <th>A/C Name</th> -->
                <th>Sr No.</th>
                <th>Contianer No</th>
                <th>Invoice Amount($)</th>
                <th>Paid Date</th>
                <th>Voucher No</th>
                <th>Particulars</th>
                <th>Paid Amount($)</th>
                <th>Balance($)</th>
                <th>Action</th>
              </tr>
              <?php
              $accodeloopstmt = $pdo->prepare("SELECT DISTINCT ac_code FROM receivable");
              $accodeloopstmt->execute();
              $accodeloopdatas = $accodeloopstmt->fetchAll();
              foreach ($accodeloopdatas as $accodeloopdata) :
                if (empty($_SESSION['acreceivabletabs']) || $_SESSION['acreceivabletabs'] == "{$accodeloopdata['ac_code']}") {
                  if (!empty($_SESSION['acreceivabletabs'])) {
                    $receivabledatas = $query->search('receivable', 'ac_code', $_SESSION['acreceivabletabs']);
                  } else {
                    $receivabledatas = [];
                  }
                }
              endforeach;
              if (empty($receivabledatas)) {
                $receivabledatas = [];
              }
              foreach ($receivabledatas as $receivabledata) :
                $ac_name = $query->select('acname', $receivabledata['ac_code'], 'code_no');
              ?>
                <!-- <tr <?php // if($receivabledata['sr_no']){ 
                          ?>data-bs-toggle="modal" data-bs-target="#paymentmodal<?php // echo $receivabledata['id']; 
                                                                                ?>"<?php //} 
                                                                                    ?>> -->
                <tr>
                  <td><?php if ($receivabledata['date'] != '0000-00-00') {
                        echo date('d-m-Y', strtotime($receivabledata['date']));
                      }; ?></td>
                  <!-- <td><?php //if(!empty($receivabledata['invoice_amount'])){ if(!empty($ac_name['ac_name'])){ echo $ac_name['ac_name'];} } 
                            ?></td> -->
                  <td><?php echo $receivabledata['sr_no']; ?></td>
                  <td><?php echo $receivabledata['container_no']; ?></td>
                  <td><?php echo $receivabledata['invoice_amount']; ?></td>
                  <td><?php if ($receivabledata['paid_date'] != '0000-00-00') {
                        echo date('d-m-Y', strtotime($receivabledata['paid_date']));
                      } ?></td>
                  <td><?php echo $receivabledata['payment_no']; ?></td>
                  <td><?php echo $receivabledata['particulars']; ?></td>
                  <td><?php if ($receivabledata['paid_amount'] != 0) {
                        echo $receivabledata['paid_amount'];
                      } ?></td>
                  <td><?php echo round($receivabledata['balance'], 2); ?></td>
                  <td>
                    <?php
                    if (!empty($receivabledata['sr_no']) || !empty($receivabledata['payment_no'])) {
                    ?>
                      <a href="edittransaction.php?voucher_no=<?= $receivabledata['payment_no']; ?>&sr_no=<?= $receivabledata['sr_no']; ?>&file=receivable&transactionid=<?= $receivabledata['transactionid'] ?>">
                        <button type="submit" class="btn btn-warning btn-sm text-light" name="updatebutton"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                            <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                          </svg>
                        </button>
                      </a>
                    <?php
                    } else {
                    ?>
                      <button class="btn btn-warning btn-sm text-light" data-bs-toggle="modal" data-bs-target="#updatebalance"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                          <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                          <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                        </svg>
                      </button>
                    <?php
                    }

                    ?>
                  </td>
                </tr>
                <!-- <div class="modal fade" id="paymentmodal<?php echo $receivabledata['id']; ?>">
                <div class="modal-dialog">
                  <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
                    <div class="modal-header bg-secondary text-light">
                      <h1 class="modal-title fs-5">Add Payment</h1>
                       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                     </div>
                     <form action="" method="post">
                     <input type="hidden" name="id" value="<?php echo $receivabledata['id']; ?>">
                     <div class="modal-body">
                       <div class="row">
                         <div class="col">
                           <label>Paid Date</label>
                           <input type="date" name="paid_date" class="form-control inpv2 mb-2">
                         </div>
                         <div class="col">
                           <label>Payment No</label>
                           <input type="text" name="payment_no" class="form-control inpv2 mb-2">
                         </div>
                       </div>
                       <div class="row">
                         <div class="col">
                           <label>Particular</label>
                           <input type="text" name="particular" class="form-control inpv2 mb-2">
                         </div>
                         <div class="col">
                           <label>Paid Amount</label>
                           <input type="number" name="paid_amount" class="form-control inpv2 mb-2">
                         </div>
                       </div>
                     </div>
                     <div class="modal-footer">
                       <button type="button" name="button" class="btn btn-secondary" data-bs-toggle="modal">Cancel</button>
                       <button type="submit" name="addpaymentbtn" class="btn btn-success">Update</button>
                     </div>
                   </form>
                   </div>
                 </div>
               </div> -->
              <?php
                $ac_code = $receivabledata['ac_code'];
              endforeach;
              ?>

              <?php
              if (isset($_POST['search'])) {
                $total_invoice_amount = $query->selectallsumreceivable('receivable', 'invoice_amount', 'total_invoice_amount', $ac_code);

                $total_paid_amount = $query->selectallsumreceivable('receivable', 'paid_amount', 'total_paid_amount', $ac_code);


              ?>
                <tr style="font-weight: bold;">
                  <td>Total:</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td><?php echo $total_invoice_amount['total_invoice_amount'] ?></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td><?php if ($total_paid_amount['total_paid_amount'] != 0) {
                        echo $total_paid_amount['total_paid_amount'];
                      } ?></td>
                  <td><?php echo $total_invoice_amount['total_invoice_amount'] - $total_paid_amount['total_paid_amount']; ?></td>
                </tr>
              <?php
              }
              ?>
            </table>
            <div class="modal fade" id="updatebalance">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header bg-warning">
                    <h5 class="modal-title">Update Opening Amount</h5>
                  </div>
                  <div class="modal-body">
                    <!-- Your modal content goes here -->
                    <form method="POST" action="">
                      <input type="hidden" name="id" value="<?= $receivabledata['id']; ?>">
                      <label class="float-start">Date</label>
                      <input type="date" name="dateupdate" class="form-control inpv2 mb-2" value="<?= $receivabledata['date']; ?>">
                      <label class="float-start">Account Name</label>
                      <select name="ac_nameupdate" class="form-control inpv2 mb-2">
                        <?php

                        $stmt = $pdo->prepare("SELECT * FROM customers");
                        $stmt->execute();
                        $acnamedatas = $stmt->fetchall();
                        foreach ($acnamedatas as $acnamedata) {
                        ?>
                          <option value="<?= $acnamedata['customer_id']; ?>" <?php if ($acnamedata['customer_id'] == $receivabledata['ac_code']) {
                                                                                echo "selected";
                                                                              } ?>><?= $acnamedata['customer_name']; ?></option>
                        <?php
                        }
                        ?>
                      </select>
                      <div class="row">
                        <div class="col">
                          <label for="description" class="float-start">Description</label>
                          <textarea name="updatedescription" id="description" rows="4" class="form-control inpv2"><?= $receivabledata['particulars']; ?></textarea>
                        </div>
                        <div class="col">
                          <label for="newBalance" class="float-start">Balance</label>
                          <input type="text" class="form-control inpv2" name="updatebalanceamount" value="<?= $receivabledata['balance']; ?>">
                          <button type="button" class="btn btn-secondary mt-4 float-start me-1" data-dismiss="modal">Close</button>
                          <button type="submit" class="btn btn-primary mt-4 float-start" name="updatebalance">Update</button>
                        </div>
                      </div>
                  </div>
                  <div class="modal-footer">
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="modal fade" id="addbalance">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header bg-secondary text-light">
          <h1 class="modal-title fs-5">Add Opening Amount</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form action="" method="post">
          <div class="modal-body">
            <label>Date</label>
            <input type="date" name="date" class="form-control inpv2 mb-2">
            <label>Account Name</label>
            <select name="ac_name" class="form-control inpv2 mb-2">
              <?php

              $stmt = $pdo->prepare("SELECT * FROM customers");
              $stmt->execute();
              $acnamedatas = $stmt->fetchall();
              foreach ($acnamedatas as $acnamedata) {
              ?>
                <option value="<?= $acnamedata['customer_id']; ?>"><?= $acnamedata['customer_name']; ?></option>
              <?php
              }

              ?>
            </select>
            <div class="row">
              <div class="col">
                <label>Description</label>
                <textarea name="description" id="description" rows="4" class="form-control inpv2"></textarea>
              </div>
              <div class="col">
                <label>Balance</label>
                <input type="text" name="balance" class="form-control inpv2 mb-2">
                <button type="button" name="button" class="btn btn-secondary mt-4" data-bs-toggle="modal">Cancel</button>
                <button type="submit" name="addbalance" class="btn btn-success mt-4">Add</button>
              </div>
            </div>
          </div>
          <div class="modal-footer">
          </div>
        </form>
      </div>
    </div>
  </div>
  <?php
  $bootstrap->javascript();
  ?>
</body>

</html>