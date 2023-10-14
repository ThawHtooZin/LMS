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
            <button type="button" class="btn btn-success float-end btn-sm" onclick="window.open('print/payablereportprint.php');">Print</button>
          </div>
          <div class="card-body">
            <b>Payable for Supplier</b>
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
              </tr>
              <?php
              $payablesuppliers = $query->selectdis('payable', 'supplier_id');
              $id = 0;
              foreach ($payablesuppliers as $payablesupplier) :
                $supplier_id = $payablesupplier['supplier_id'];
                $payablestmt = $pdo->prepare("SELECT * FROM payable WHERE supplier_id='$supplier_id'");
                $payablestmt->execute();
                $payabledata = $payablestmt->fetch(PDO::FETCH_ASSOC);

                $openingamountstmt = $pdo->prepare("SELECT SUM(balance) AS balance FROM payable WHERE supplier_id='$supplier_id' AND report_date!='0000-00-00' ORDER BY id DESC");
                $openingamountstmt->execute();
                $openingamount = $openingamountstmt->fetch(PDO::FETCH_ASSOC);

                $purchaseamtstmt = $pdo->prepare("SELECT SUM(purchase_amount) AS purchase_amount FROM payable WHERE supplier_id='$supplier_id'");
                $purchaseamtstmt->execute();
                $purchaseamt = $purchaseamtstmt->fetch(PDO::FETCH_ASSOC);

                $paidamtstmt = $pdo->prepare("SELECT SUM(paid_amount) AS paid_amount FROM payable WHERE supplier_id='$supplier_id'");
                $paidamtstmt->execute();
                $paidamt = $paidamtstmt->fetch(PDO::FETCH_ASSOC);

                $balancestmt = $pdo->prepare("SELECT SUM(balance) AS balance FROM payable WHERE supplier_id='$supplier_id'");
                $balancestmt->execute();
                $balanceamt = $balancestmt->fetch(PDO::FETCH_ASSOC);

                $id++;

                $supplier_id = $payablesupplier['supplier_id'];
                $supplierdata = $query->select('acname', $supplier_id, 'code_no');

              ?>
              <tr style="<?php if($balance['balance'] == 0){ echo "display:none;";} ?>">
                <td><?= $id; ?></td>
                <td><?= $supplierdata['ac_name']; ?></td>
                <td <?php if(empty($openingamount['balance'])){ echo "data-bs-toggle='modal' data-bs-target='#addbalancemodal'";} ?>><?= $openingamount['balance']; ?></td>
                <td><?= $purchaseamt['purchase_amount']; ?></td>
                <td><?= $paidamt['paid_amount']; ?></td>
                <td><?= $balanceamt['balance']; ?></td>
              </tr>
              <?php
              endforeach;
               ?>
            </table>
          </div>
        </div>
      </div>
    </div>
    <!--  -->
    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
