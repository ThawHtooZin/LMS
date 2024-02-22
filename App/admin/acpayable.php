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
    <title>Admin | Dashboard</title>
  </head>
  <?php
  $bootstrap->css();
  ?>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Caprasimo&family=Cormorant+Garamond:wght@300&family=Teko:wght@700&display=swap" rel="stylesheet">
  <body>
    <?php
    if(isset($_POST['print'])){
      $query->payablereport();
    }
    if (isset($_POST['addbalance'])) {
      $date = $_POST['date'];
      $supplier_id = $_POST['supplier_name'];
      $description = $_POST['description'];
      $amount = $_POST['amount'];

      $query->addbalancepayable($date, $supplier_id, $description, $amount);

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
          <div class="card-header bg-info text-light">
            <h5>Payable Reports</h5>
            <a href="export.php?table_name=payable" class="btn btn-success btn-sm ms-2 float-end">Export To Excel</a>
            <form action="" method="post" class="d-inline">
              <button type="submit" name="print" class="btn btn-success float-end btn-sm d-inline" onclick="window.open('print/payablereportprint.php');">Print</button>
              <button type="button" class="btn btn-secondary float-end btn-sm me-2" data-bs-toggle="modal"
              data-bs-target="#addbalancemodal">
              Add Balance
            </button>
            <input type="date" name="date_search_inp" class="inpv2 form-control d-inline float-end me-2" style=" width: 150px; padding: 2px;">
            <button type="submit" name="date_search" class="btn btn-primary float-end btn-sm me-2">Search</button>
          </form>
          </div>
          <div class="card-body">
            <b>Payable for Supplier</b>
            <?php
              if(isset($_POST['date_search'])){
                $date = $_POST['date_search_inp'];
                if(empty($date)){
                  $payablesuppliersstmt = $pdo->prepare("SELECT DISTINCT supplier_id FROM payable");
                }else{
                  $payablesuppliersstmt = $pdo->prepare("SELECT DISTINCT supplier_id FROM payable WHERE date='$date'"); 
                }
                ?>
                  <div class="float-end">
                  <b>
                    Date :
                    <?php if(empty($date)){ echo date('d-m-Y'); }else{ date('d-m-Y', strtotime($date)); }; ?>
                  </b>
                </div>
                <table class="mt-3 table table-bordered table-striped rounded">
                  <tr>
                    <th>No</th>
                    <th>Supplier Name</th>
                    <th>Opening Amount</th>
                    <th>Add Amt</th>
                    <th>Paid Amt</th>
                    <th>Balance</th>
                    <th>Detail</th>
                  </tr>
                  <?php
                  $payablesuppliersstmt->execute();
                  $payablesuppliers = $payablesuppliersstmt->fetchall();
                  $id = 0;
                  foreach ($payablesuppliers as $payablesupplier) :
                    $supplier_id = $payablesupplier['supplier_id'];
                    $payablestmt = $pdo->prepare("SELECT * FROM payable WHERE supplier_id='$supplier_id'");
                    $payablestmt->execute();
                    $payabledata = $payablestmt->fetch(PDO::FETCH_ASSOC);

                    $idofrow = $payabledata['id'];
                    $openingamountstmt = $pdo->prepare("SELECT closing_balance FROM payable WHERE supplier_id='$supplier_id'");
                    $openingamountstmt->execute();
                    $openingamount = $openingamountstmt->fetch(PDO::FETCH_ASSOC);

                    $purchaseamtstmt = $pdo->prepare("SELECT SUM(purchase_amount) AS purchase_amount FROM payable WHERE supplier_id='$supplier_id'");
                    $purchaseamtstmt->execute();
                    $purchaseamt = $purchaseamtstmt->fetch(PDO::FETCH_ASSOC);

                    $paidamtstmt = $pdo->prepare("SELECT SUM(paid_amount) AS paid_amount FROM payable WHERE supplier_id='$supplier_id'");
                    $paidamtstmt->execute();
                    $paidamt = $paidamtstmt->fetch(PDO::FETCH_ASSOC);

                    $id++;
                    if (!empty($openingamount['closing_balance'])) {
                      $openingamt = $openingamount['closing_balance'];
                    }else{
                      $openingamt = 0;
                    }
                    $balance =  ($openingamt + $purchaseamt['purchase_amount']) - $paidamt['paid_amount'];

                    $supplier_id = $payablesupplier['supplier_id'];
                    $supplierdata = $query->select('acname', $supplier_id, 'code_no');

                  ?>
                  <tr style="<?php if($balance == 0){ echo "display:none;";} ?>">
                    <td><?= $id; ?></td>
                    <td><?= $supplierdata['ac_name']; ?></td>
                    <!-- <td<?php if(empty($openingamount['closing_balance'])){ echo "data-bs-toggle='modal' data-bs-target='#addbalancemodal'";} ?>><?php if(!empty($openingamount['closing_balance'])){ echo $openingamount['closing_balance']; } ?></td> -->
                    <td><?= $payabledata['closing_balance']; ?></td>
                    <td><?= $purchaseamt['purchase_amount']; ?></td>
                    <td><?= $paidamt['paid_amount']; ?></td>
                    <td><?= $balance; ?></td>
                    <td><a href="acpayabledetail.php?supplier_id=<?= $supplier_id; ?>" class="btn btn-primary btn-sm">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list-check" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3.854 2.146a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 3.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 7.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 0 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0z"/></svg>
                    </a></td>
                  </tr>
                  <?php
                  endforeach;
                  ?>
                </table>
                <?php
              }else{
                ?>  
                <div class="float-end">
                  <b>
                    Date :
                    <?= date('d-m-Y'); ?>
                  </b>
                </div>
                <table class="mt-3 table table-bordered table-striped rounded">
                  <tr>
                    <th>No</th>
                    <th>Supplier Name</th>
                    <th>Opening Amount</th>
                    <th>Add Amt</th>
                    <th>Paid Amt</th>
                    <th>Balance</th>
                    <th>Detail</th>
                  </tr>
                  <?php
                  $payablesuppliers = $query->selectdis('payable', 'supplier_id');
                  $id = 0;
                  foreach ($payablesuppliers as $payablesupplier) :
                    $supplier_id = $payablesupplier['supplier_id'];
                    $payablestmt = $pdo->prepare("SELECT * FROM payable WHERE supplier_id='$supplier_id'");
                    $payablestmt->execute();
                    $payabledata = $payablestmt->fetch(PDO::FETCH_ASSOC);

                    $idofrow = $payabledata['id'];
                    $openingamountstmt = $pdo->prepare("SELECT closing_balance FROM payable WHERE supplier_id='$supplier_id'");
                    $openingamountstmt->execute();
                    $openingamount = $openingamountstmt->fetch(PDO::FETCH_ASSOC);

                    $purchaseamtstmt = $pdo->prepare("SELECT SUM(purchase_amount) AS purchase_amount FROM payable WHERE supplier_id='$supplier_id'");
                    $purchaseamtstmt->execute();
                    $purchaseamt = $purchaseamtstmt->fetch(PDO::FETCH_ASSOC);

                    $paidamtstmt = $pdo->prepare("SELECT SUM(paid_amount) AS paid_amount FROM payable WHERE supplier_id='$supplier_id'");
                    $paidamtstmt->execute();
                    $paidamt = $paidamtstmt->fetch(PDO::FETCH_ASSOC);

                    $id++;
                    if (!empty($openingamount['closing_balance'])) {
                      $openingamt = $openingamount['closing_balance'];
                    }else{
                      $openingamt = 0;
                    }
                    $balance =  ($openingamt + $purchaseamt['purchase_amount']) - $paidamt['paid_amount'];

                    $supplier_id = $payablesupplier['supplier_id'];
                    $supplierdata = $query->select('acname', $supplier_id, 'code_no');

                  ?>
                  <tr style="<?php if($balance == 0){ echo "display:none;";} ?>">
                    <td><?= $id; ?></td>
                    <td><?= $supplierdata['ac_name']; ?></td>
                    <!-- <td<?php if(empty($openingamount['closing_balance'])){ echo "data-bs-toggle='modal' data-bs-target='#addbalancemodal'";} ?>><?php if(!empty($openingamount['closing_balance'])){ echo $openingamount['closing_balance']; } ?></td> -->
                    <td><?= $payabledata['closing_balance']; ?></td>
                    <td><?= $purchaseamt['purchase_amount']; ?></td>
                    <td><?= $paidamt['paid_amount']; ?></td>
                    <td><?= $balance; ?></td>
                    <td><a href="acpayabledetail.php?supplier_id=<?= $supplier_id; ?>" class="btn btn-primary btn-sm">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list-check" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3.854 2.146a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 3.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 7.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 0 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0z"/></svg>
                    </a></td>
                  </tr>
                  <?php
                  endforeach;
                  ?>
                </table>
                <?php
              }
            ?>
          </div>
        </div>
      </div>
    </div>
    <div class="modal fade" id="addbalancemodal">
      <div class="modal-dialog">
        <div class="modal-content" style="width: 650px !important; margin-top:70px !important;">
          <div class="modal-header bg-secondary text-light">
            <h1 class="modal-title fs-5">Add Balance</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
        <form action="acpayable.php" method="post">
          <div class="modal-body">
            <div class="row">
              <div class="col">
                <label>Date</label>
                <input type="date" name="date" class="form-control inpv2 mb-2">
              </div>
              <div class="col">
                <label>Supplier Name</label>
                <select class="form-control inpv2" name="supplier_name">
                  <?php
                  $supplierdatasfs = $query->selectall('supplier');
                    foreach ($supplierdatasfs as $supplierdatafs) {
                      ?>
                      <option value="<?php echo $supplierdatafs['supplier_id']; ?>"><?php echo $supplierdatafs['supplier_name']; ?></option>
                        <?php
                      }
                      ?>
                </select>
              </div>
            </div>
            <div class="row">
              <div class="col-6">
                <label>Description</label>
                <textarea name="description" rows="4" cols="80" class="form-control inpv2"></textarea>
              </div>
              <div class="col-6">
                <div class="col">
                  <label>Opening Amount</label>
                  <input type="text" name="amount" class="form-control inpv2">
                </div>
                <div class="col mt-4">
                  <button type="button" name="button" class="btn btn-secondary" data-bs-toggle="modal">Cancel</button>
                  <button type="submit" name="addbalance" class="btn btn-success">Add</button>
                </div>
              </div>
            </div>
            </div>
          </div>
        </form>
        </div>
      </div>
    </div>
    <!-- Opening Amount Modal -->



    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
