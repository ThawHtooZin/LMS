<?php
session_start();
include '../../../Auth/authrize.ctr.php';
include '../../../Resources/resource.boot.php';
include '../../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <?php
  $bootstrap->cssprint();
  ?>

  <body onload="window.print()">
    <h4>Link Mark Supplier Statement</h4>
    <b><u>Payable for Supplier</u></b>

    <b class="float-end">Date : <?= date('d-m-Y'); ?></b>
    <table class="mt-3 table table-bordered rounded" style="border: black;">
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
    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
