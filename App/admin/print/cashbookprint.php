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
    <title>CashBook Print | Link Mark</title>
  </head>
  <?php
  $bootstrap->cssprint();
  ?>
  <body onload="window.print()">
    <?php
    if(!empty($_GET['monthly'])){
      $month = $_GET['monthly'];
      $year = date('Y');
      $search = $year . "-" . $month;
      $stmt = $pdo->prepare("SELECT * FROM CASHBOOK WHERE date LIKE '%$search%'");
      $stmt->execute();
      $bootstrap->css();
      $cashdatas = $stmt->fetchall();
    }

    if(!empty($_GET['startdate'])){
      $startdate = $_GET['startdate'];
      $enddate = $_GET['enddate'];
      $cashdatas = $query->selectdbw('cashbook', $startdate, $enddate);
    }
     ?>
     <div class="container mt-5">
       <h5>CashBook Report</h5>
       <table class="table table-bordered table-striped rounded">
         <tr>
           <th>#</th>
           <th>Date</th>
           <th>Sr.No</th>
           <th>A/C Name</th>
           <th>Particular</th>
           <th>Debit</th>
           <th>Credit</th>
           <th>Balance</th>
         </tr>
       <?php
       foreach ($cashdatas as $cashdata) {
         ?>
       <tr>
         <td><?php echo $cashdata['id']; ?></td>
         <td><?php echo $cashdata['date']; ?></td>
         <td><?php echo $cashdata['serial_no']; ?></td>
         <td><?php echo $cashdata['ac_name']; ?></td>
         <td><?php echo $cashdata['particular']; ?></td>
         <td><?php if($cashdata['debit'] == 0){echo "";}else{echo $cashdata['debit'];}; ?></td>
         <td><?php if($cashdata['credit'] == 0){echo "";}else{echo $cashdata['credit'];}; ?></td>
         <td><?php echo $cashdata['balance']; ?></td>
       </tr>
       <?php
       }
       ?>
     </table>
     </div>
   <?php
   $bootstrap->javascript();
   ?>
  </body>
</html>
