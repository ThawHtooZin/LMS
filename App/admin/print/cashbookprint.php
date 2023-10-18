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
      if (empty($_SESSION['cashbookcurrency']) || $_SESSION['cashbookcurrency'] == 'ks') {
        $stmt = $pdo->prepare("SELECT * FROM cashbook WHERE date LIKE '%$search%' AND ac_name='3600/001'");
      }else{
        $stmt = $pdo->prepare("SELECT * FROM cashbook WHERE date LIKE '%$search%' AND ac_name='3600/002'");
      }
      $stmt->execute();
      $cashdatas = $stmt->fetchall();
    }

    if(!empty($_GET['startdate'])){
      $startdate = $_GET['startdate'];
      $enddate = $_GET['enddate'];
      if (empty($_SESSION['cashbookcurrency']) || $_SESSION['cashbookcurrency'] == 'ks') {
        $cashstmt = $pdo->prepare("SELECT * FROM cashbook WHERE `date` BETWEEN '$startdate' AND '$enddate' AND ac_name='3600/001'");
      }else{
        $cashstmt = $pdo->prepare("SELECT * FROM cashbook WHERE `date` BETWEEN '$startdate' AND '$enddate' AND ac_name='3600/002'");
      }
      $cashstmt->execute();
      $cashdatas = $cashstmt->fetchall();

    }
     ?>
     <div class="m-0">
       <h5>CashBook Report</h5>
       <table class="table table-bordered table-striped rounded">
         <tr>
           <th>No.</th>
           <th>Date</th>
           <th>Sr.No</th>
           <th>A/C Name</th>
           <th>Particular</th>
           <th>Debit</th>
           <th>Credit</th>
           <th>Balance</th>
         </tr>
       <?php
       $idd = 0;
       foreach ($cashdatas as $cashdata) {
         $voucher_no = $cashdata['voucher_no'];
         $ac_code = $cashdata['ac_name'];
         $acselectstmt = $pdo->prepare("SELECT ac_code FROM transaction WHERE voucher_no='$voucher_no' AND ac_code!='$ac_code'");
         $acselectstmt->execute();
         $acselect = $acselectstmt->fetch(PDO::FETCH_ASSOC);
         $accode = $acselect['ac_code'];
         if(str_contains($accode, '4000/')){
           $acname = 'Supplier';
         }else {
           $acnamedata = $query->select('acname', $accode, 'code_no');
           $acname = $acnamedata['ac_name'];
         }
         $idd++;
         ?>
       <tr>
         <td><?php echo $idd; ?></td>
         <td><?php echo date('d-m-Y', strtotime($cashdata['date'])); ?></td>
         <td><?php echo $cashdata['sr_no']; ?></td>
         <td><?php echo $acname; ?></td>
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
