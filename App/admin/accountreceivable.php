<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();

if(isset($_POST['addpaymentbtn'])){
  $id = $_POST['id'];
  $paid_date = $_POST['paid_date'];
  $payment_no = $_POST['payment_no'];
  $particular = $_POST['particular'];
  $paid_amount = $_POST['paid_amount'];

  $query->addpaymentofreceivable($id, $paid_date, $payment_no, $particular, $paid_amount);
}

if(isset($_POST['addbalance'])){
  $balance = $_POST['balance'];

  $query->addbalance($balance);
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
      <div class="col-2" id="sidebar">
        <?php
        include 'sidebar.php';
        ?>
      </div>
      <div class="col-10" id="content">
        <div class="card">
          <div class="card-header bg-warning text-light">
            <button type="button" class="btn btn-default btn-sm" id="menu">
              <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
              </svg>
            </button>
            <h5 class="d-inline">Account Receivable</h5>
            <button type="button" class="btn btn-primary btn-sm float-end" data-bs-toggle="modal" data-bs-target="#addbalance">Add Balance</button>
          </div>
          <div class="card-body">
            <table class="table table-hover table-striped table-bordered">
              <tr>
                <th>Date</th>
                <th>Sr No.</th>
                <th>Contianer No</th>
                <th>Invoice Amount($)</th>
                <th>Paid Date</th>
                <th>Payment No</th>
                <th>Particulars</th>
                <th>Paid Amount($)</th>
                <th>Balance($)</th>
              </tr>
              <?php
              $receivabledatas = $query->selectall('receivable');
              foreach($receivabledatas as $receivabledata) :
              ?>
              <tr <?php if($receivabledata['sr_no']){ ?>data-bs-toggle="modal" data-bs-target="#paymentmodal<?php echo $receivabledata['id']; ?>"<?php } ?>>
                <td><?php if($receivabledata['date'] != '0000-00-00'){ echo date('d-m-Y', strtotime($receivabledata['date'])); }; ?></td>
                <td><?php echo $receivabledata['sr_no']; ?></td>
                <td><?php echo $receivabledata['container_no']; ?></td>
                <td><?php echo $receivabledata['invoice_amount']; ?></td>
                <td><?php if($receivabledata['paid_date'] != '0000-00-00'){ echo $receivabledata['paid_date'];} ?></td>
                <td><?php echo $receivabledata['payment_no']; ?></td>
                <td><?php echo $receivabledata['particulars']; ?></td>
                <td><?php if($receivabledata['paid_amount'] != 0){ echo $receivabledata['paid_amount'];} ?></td>
                <td><?php echo $receivabledata['balance']; ?></td>
              </tr>
              <div class="modal fade" id="paymentmodal<?php echo $receivabledata['id']; ?>">
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
              </div>
              <?php
              endforeach;
               ?>
            </table>
          </div>
        </div>
      </div>
    </div>
    <div class="modal fade" id="addbalance">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header bg-secondary text-light">
            <h1 class="modal-title fs-5">Add Balance</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
        <form action="" method="post">
          <div class="modal-body">
            <label>Balance</label>
            <input type="number" name="balance" class="form-control inpv2 mb-2">
          </div>
          <div class="modal-footer">
            <button type="button" name="button" class="btn btn-secondary" data-bs-toggle="modal">Cancel</button>
            <button type="submit" name="addbalance" class="btn btn-success">Update</button>
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
