<?php
session_start();
include '../../Controllers/query.ctr.php';

if($_GET['filter'] == 'dbwsearch'){
  $startdate = $_GET['startdate'];
  $enddate = $_GET['enddate'];

  if (empty($_SESSION['cashbookcurrency']) || $_SESSION['cashbookcurrency'] == 'ks') {
    $stmt = $pdo->prepare("SELECT * FROM cashbook WHERE `date` BETWEEN '$startdate' AND '$enddate' AND ac_name='3600/001'");
  }else{
    $stmt = $pdo->prepare("SELECT * FROM cashbook WHERE `date` BETWEEN '$startdate' AND '$enddate' AND ac_name='3600/002'");
  }
}
if($_GET['filter'] == 'monthlysearch'){
  $searchmonth = $_GET['month'];
  if (empty($_SESSION['cashbookcurrency']) || $_SESSION['cashbookcurrency'] == 'ks') {
    $stmt = $pdo->prepare("SELECT * FROM cashbook WHERE date LIKE '%$searchmonth%' AND ac_name='3600/001'");
  }else{
    $stmt = $pdo->prepare("SELECT * FROM cashbook WHERE date LIKE '%$searchmonth%' AND ac_name='3600/002'");
  }
}
if($_GET['filter'] == 'normal'){
  if (empty($_SESSION['cashbookcurrency']) || $_SESSION['cashbookcurrency'] == 'ks') {
    $stmt = $pdo->prepare("SELECT * FROM cashbook WHERE ac_name='3600/001'");
  }else{
    $stmt = $pdo->prepare("SELECT * FROM cashbook WHERE ac_name='3600/002'");
  }
}
$stmt->execute();
$cashdatas = $stmt->fetchAll();

if($_GET['forment'] == 'excel'){
  header("Content-Type: application/xls");
  if ($_SESSION['cashbookcurrency'] == 'ks') {
    header("Content-Disposition: attachment; filename=CashBookMMK.xls");
    if($_GET['filter'] == 'dbwsearch'){
      header("Content-Disposition: attachment; filename=CashBookMMK".$startdate."to".$enddate.".xls");
    }elseif($_GET['filter'] == 'monthlysearch'){
      header("Content-Disposition: attachment; filename=CashBookMMK".$searchmonth.".xls");
    }
  }else{
    header("Content-Disposition: attachment; filename=CashBookUSD.xls");
    if($_GET['filter'] == 'dbwsearch'){
      header("Content-Disposition: attachment; filename=CashBookUSD".$startdate."to".$enddate.".xls");
    }elseif($_GET['filter'] == 'monthlysearch'){
      header("Content-Disposition: attachment; filename=CashBookUSD".$searchmonth.".xls");
    }
  }
  header("Pragma: no-cache");
  header("Expires: 0");

  ?>
  <table class="mt-5 table table-bordered table-striped rounded" border="1">
    <tr>
      <th>#</th>
      <th>Date</th>
      <th>Voucher No</th>
      <th>A/C Name</th>
      <th>Particular</th>
      <th>Debit</th>
      <th>Credit</th>
      <th>Balance</th>
    </tr>
    <?php
    $idd = 1;
    foreach ($cashdatas as $cashdata) {
      $voucher_no = $cashdata['voucher_no'];
      $ac_code = $cashdata['ac_name'];
      $acselectstmt = $pdo->prepare("SELECT * FROM transaction WHERE voucher_no='$voucher_no' AND ac_code!='$ac_code'");
      $acselectstmt->execute();
      $acselect = $acselectstmt->fetch(PDO::FETCH_ASSOC);
      $accode = $acselect['ac_code'];
      if(str_contains($accode, '4000/')){
        $acname = 'Supplier';
      }else {
        $acnamestmt = $pdo->prepare("SELECT * FROM acname WHERE code_no='$accode'");
        $acnamestmt->execute();
        $acnamedata = $acnamestmt->fetch(PDO::FETCH_ASSOC);
        $acname = $acnamedata['ac_name'];
      }
      if (empty($_SESSION['cashbookcurrency']) || $_SESSION['cashbookcurrency'] == 'ks') {
        $debit = $cashdata['debit'];
        $credit = $cashdata['credit'];
        $balance = $cashdata['balance'];
      }else{
        if($acselect['debit'] != 0){
          $debitorcredit = 'debit';
        }else{
          $debitorcredit = 'credit';
        }
        $acselectstmt = $pdo->prepare("SELECT * FROM currency WHERE voucher_no='$voucher_no' AND debitorcredit='$debitorcredit'");
        $acselectstmt->execute();
        $rateselect = $acselectstmt->fetch(PDO::FETCH_ASSOC);

        if($cashdata['debit'] != 0){
          $debit = $cashdata['debit'] / $rateselect['dollar_rate'];
        }else{
          $credit = $cashdata['credit'] / $rateselect['dollar_rate'];
        }

        $balance = $cashdata['balance'] / $rateselect['dollar_rate'];
      }

      ?>
    <tr>
      <td><?php echo $idd; ?></td>
      <td><?php echo date('d-m-Y', strtotime($cashdata['date'])); ?></td>
      <td><?php echo $cashdata['voucher_no']; ?></td>
      <td><?php echo $acname; ?></td>
      <td><?php echo $cashdata['particular']; ?></td>
      <td><?php if($cashdata['debit'] == 0){echo "";}else{echo round($debit, 2);}; ?></td>
      <td><?php if($cashdata['credit'] == 0){echo "";}else{echo round($credit, 2);}; ?></td>
      <td><?php echo round($balance, 2); ?></td>
    </tr>
    <?php
    $idd++;
    }
    ?>
  </table>
  <?php
}else{
  header('location:cashbook.php');
}
  exit();


?>
