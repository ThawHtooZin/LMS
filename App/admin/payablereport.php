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
      // $query->payablereport();
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

            <?php
              if(isset($_POST['date_search'])){
                ?>
                  <a href="export.php?table_name=payable&search_date=<?= $_POST['date_search_inp']; ?>" class="btn btn-success btn-sm ms-2 float-end">Export To Excel</a>
                <?php
              }else{
                ?>
                  <a href="export.php?table_name=payable" class="btn btn-success btn-sm ms-2 float-end">Export To Excel</a>
                <?php
              }
            ?>
            <form action="" method="post" class="d-inline">
              <!-- <button type="submit" name="print" class="btn btn-success float-end btn-sm d-inline" onclick="window.open('print/payablereportprint.php');">Print</button> -->
            <button type="submit" name="date_search" class="btn btn-primary float-end btn-sm ms-2 me-2">Search</button>
            <input type="date" name="date_search_inp" class="inpv2 form-control d-inline float-end ms-2" style=" width: 150px; padding: 2px;">
          </form>
          </div>
          <div class="card-body">
            <b>Payable for Supplier</b>
            <?php
              if(isset($_POST['date_search'])){
                $searchdate = $_POST['date_search_inp'];
                ?>
                  <div class="float-end">
                  <b>
                    Date :
                    <?php if(empty($searchdate)){ echo date('d-m-Y'); }else{ echo date('d-m-Y', strtotime($searchdate)); }; ?>
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
                  $stmt = $pdo->prepare("SELECT DISTINCT supplier_id FROM payable WHERE date='$searchdate' OR paid_date='$searchdate' OR date!='0000-00-00' AND paid_date='0000-00-00'");
                  $stmt->execute();
                  $payablesuppliers = $stmt->fetchall();
                  // print_r($payablesuppliers);
                  $id = 0;
                  foreach ($payablesuppliers as $payablesupplier) :
                    $supplier_id = $payablesupplier['supplier_id'];

                    // $date = date('Y-m-d', strtotime($searchdate . ' -1 day'));
                    $payablestmt = $pdo->prepare("SELECT * FROM payable WHERE supplier_id='$supplier_id' AND date='$searchdate'");
                    $payablestmt->execute();
                    $payabledata = $payablestmt->fetch(PDO::FETCH_ASSOC);

                    $openingamountstmt = $pdo->prepare("SELECT closing_balance FROM payable WHERE supplier_id='$supplier_id' AND date<'$searchdate' OR paid_date='$searchdate'");
                    $openingamountstmt->execute();
                    $openingamount = $openingamountstmt->fetch(PDO::FETCH_ASSOC);


                    $purchaseamtstmt = $pdo->prepare("SELECT SUM(purchase_amount) AS purchase_amount FROM payable WHERE supplier_id='$supplier_id' AND date<'$searchdate'");
                    $purchaseamtstmt->execute();
                    $purchaseamt = $purchaseamtstmt->fetch(PDO::FETCH_ASSOC);
                    // print_r($purchaseamt['purchase_amount']);

                    $paidamtstmt = $pdo->prepare("SELECT SUM(paid_amount) AS paid_amount FROM payable WHERE supplier_id='$supplier_id' AND paid_date<'$searchdate'");
                    $paidamtstmt->execute();
                    $paidamt = $paidamtstmt->fetch(PDO::FETCH_ASSOC);
                    // print_r($paidamt['paid_amount']);

                    // Add Amount Total
                    $addamountstmt = $pdo->prepare("SELECT SUM(purchase_amount) AS add_amount FROM payable WHERE supplier_id='$supplier_id' AND date='$searchdate'");
                    $addamountstmt->execute();
                    $addamountdata = $addamountstmt->fetch(PDO::FETCH_ASSOC);
                    $addamount = $addamountdata['add_amount'];

                    // Paid Amount Total
                    $paidamountstmt = $pdo->prepare("SELECT SUM(paid_amount) AS paid_amount FROM payable WHERE supplier_id='$supplier_id' AND paid_date='$searchdate'");
                    $paidamountstmt->execute();
                    $paidamountdata = $paidamountstmt->fetch(PDO::FETCH_ASSOC);
                    $paidamount = $paidamountdata['paid_amount'];


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
                  <tr style="<?php if($balance == 0 && $addamount == 0 && $paidamount == 0){ echo 'display:none;'; } ?>">
                    <td><?= $id; ?></td>
                    <td><?= $supplierdata['ac_name']; ?></td>
                    <td><?= $balance; ?></td>
                    <td><?php if($addamount != 0){echo $addamount;}; ?></td>
                    <td><?php if($paidamount != 0){echo $paidamount;}; ?></td>
                    <td><?= ($balance + $addamount) - $paidamount; ?></td>
                  </tr>
                  <?php
                  endforeach;
                  // if(isset($_POST['date_search'])){
                  //   $date = date('Y-m-d', strtotime($searchdate . ' -1 day'));
                  //   $payablestmt = $pdo->prepare("SELECT * FROM payable WHERE supplier_id='$supplier_id' AND date='$searchdate'");
                  //   $payablestmt->execute();
                  //   $payabledata = $payablestmt->fetch(PDO::FETCH_ASSOC);

                  //   $openingamountstmt = $pdo->prepare("SELECT closing_balance FROM payable WHERE supplier_id='$supplier_id' AND date='$date'");
                  //   $openingamountstmt->execute();
                  //   $openingamount = $openingamountstmt->fetch(PDO::FETCH_ASSOC);
                  //   // print_r($openingamount['closing_balance']);

                  //   $purchaseamtstmt = $pdo->prepare("SELECT SUM(purchase_amount) AS purchase_amount FROM payable WHERE supplier_id='$supplier_id' AND date='$date'");
                  //   $purchaseamtstmt->execute();
                  //   $purchaseamt = $purchaseamtstmt->fetch(PDO::FETCH_ASSOC);
                  //   // print_r($purchaseamt['purchase_amount']);

                  //   $paidamtstmt = $pdo->prepare("SELECT SUM(paid_amount) AS paid_amount FROM payable WHERE supplier_id='$supplier_id' AND paid_date='$date'");
                  //   $paidamtstmt->execute();
                  //   $paidamt = $paidamtstmt->fetch(PDO::FETCH_ASSOC);
                  //   // print_r($paidamt['paid_amount']);

                  //   // Add Amount Total
                  //   $addamountstmt = $pdo->prepare("SELECT SUM(purchase_amount) AS add_amount FROM payable WHERE supplier_id='$supplier_id' AND date='$searchdate'");
                  //   $addamountstmt->execute();
                  //   $addamountdata = $addamountstmt->fetch(PDO::FETCH_ASSOC);
                  //   $addamount = $addamountdata['add_amount'];

                  //   // Paid Amount Total
                  //   $paidamountstmt = $pdo->prepare("SELECT SUM(paid_amount) AS paid_amount FROM payable WHERE supplier_id='$supplier_id' AND paid_date='$searchdate'");
                  //   $paidamountstmt->execute();
                  //   $paidamountdata = $paidamountstmt->fetch(PDO::FETCH_ASSOC);
                  //   $paidamount = $paidamountdata['paid_amount'];


                  //   $id++;
                  //   if (!empty($openingamount['closing_balance'])) {
                  //     $openingamt = $openingamount['closing_balance'];
                  //   }else{
                  //     $openingamt = 0;
                  //   }
                  //   $balance =  ($openingamt + $purchaseamt['purchase_amount']) - $paidamt['paid_amount'];

                    ?>
                    <tr>
                  <!-- <td>TOTAL</td>
                  <td></td>
                  <td><?php// $balance; ?></td>
                  <td><?php// $addamount; ?></td>
                  <td><?php// $paidamount; ?></td>
                  <td><?php// ($balance + $addamount) - $paidamount; ?></td>
                </tr>   -->
                    <?php
                  // }
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
                  </tr>
                  <?php
                  $originalDate = date('Y-m-d');
                  $stmt = $pdo->prepare("SELECT DISTINCT supplier_id FROM payable WHERE date='$originalDate' OR paid_date='$originalDate'");
                  $stmt->execute();
                  $payablesuppliers = $stmt->fetchall();
                  $id = 0;
                  foreach ($payablesuppliers as $payablesupplier) :
                    $supplier_id = $payablesupplier['supplier_id'];
                    // $date = date('Y-m-d', strtotime($originalDate . ' -1 day'));
                    $payablestmt = $pdo->prepare("SELECT * FROM payable WHERE supplier_id='$supplier_id' AND date='$originalDate' AND paid_date<'$originalDate'");
                    $payablestmt->execute();
                    $payabledata = $payablestmt->fetch(PDO::FETCH_ASSOC);

                    $openingamountstmt = $pdo->prepare("SELECT closing_balance FROM payable WHERE supplier_id='$supplier_id' AND date<'$originalDate'");
                    $openingamountstmt->execute();
                    $openingamount = $openingamountstmt->fetch(PDO::FETCH_ASSOC);
                    // print_r($openingamount['closing_balance']);

                    $purchaseamtstmt = $pdo->prepare("SELECT SUM(purchase_amount) AS purchase_amount FROM payable WHERE supplier_id='$supplier_id' AND date<'$originalDate'");
                    $purchaseamtstmt->execute();
                    $purchaseamt = $purchaseamtstmt->fetch(PDO::FETCH_ASSOC);
                    // print_r($purchaseamt['purchase_amount']);

                    $paidamtstmt = $pdo->prepare("SELECT SUM(paid_amount) AS paid_amount FROM payable WHERE supplier_id='$supplier_id' AND paid_date<'$originalDate'");
                    $paidamtstmt->execute();
                    $paidamt = $paidamtstmt->fetch(PDO::FETCH_ASSOC);
                    // print_r($paidamt['paid_amount']);

                    // Add Amount Total
                    $addamountstmt = $pdo->prepare("SELECT SUM(purchase_amount) AS add_amount FROM payable WHERE supplier_id='$supplier_id' AND date='$originalDate'");
                    $addamountstmt->execute();
                    $addamountdata = $addamountstmt->fetch(PDO::FETCH_ASSOC);
                    $addamount = $addamountdata['add_amount'];

                    // Paid Amount Total
                    $paidamountstmt = $pdo->prepare("SELECT SUM(paid_amount) AS paid_amount FROM payable WHERE supplier_id='$supplier_id' AND paid_date='$originalDate'");
                    $paidamountstmt->execute();
                    $paidamountdata = $paidamountstmt->fetch(PDO::FETCH_ASSOC);
                    $paidamount = $paidamountdata['paid_amount'];


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
                  <tr>
                    <td><?= $id; ?></td>
                    <td><?= $supplierdata['ac_name']; ?></td>
                    <td><?= $balance; ?></td>
                    <td><?= $addamount; ?></td>
                    <td><?= $paidamount; ?></td>
                    <td><?= ($balance + $addamount) - $paidamount; ?></td>
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
    <!-- Opening Amount Modal -->



    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
