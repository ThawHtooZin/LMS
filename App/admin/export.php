<?php

session_start();
include '../../Auth/authrize.ctr.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$query = new Query();


if($_GET['table_name'] == 'general_ledger'){
  $date_from = $_GET['date_from'];
  $date_to = $_GET['date_to'];
  $ac_code = $_GET['ac_code'];
  header("Content-Type: application/xls");
  if(!empty($date_from) && !empty($date_to) && empty($ac_code)){
    header("Content-Disposition: attachment; filename=GeneralLedger{$date_from}to{$date_to}and{$ac_code}.xls");
  }elseif(!empty($date_from) || !empty($date_to) && empty($ac_code)){
    if(!empty($date_from)){
      header("Content-Disposition: attachment; filename=GeneralLedger{$date_from}.xls");
    }else{
      header("Content-Disposition: attachment; filename=GeneralLedger{$date_to}.xls");
    }
  }else{
    header("Content-Disposition: attachment; filename=GeneralLedger{$ac_code}.xls");
  }
  header("Pragma: no-cache");
  header("Expires: 0");
  ?>

  <table class="table table-bordered" id="table" border='1'>
    <tr style="background-color: lightgray;">
      <th>Date</th>
      <th>Voucher No</th>
      <th>Account Name</th>
      <th>Description</th>
      <th>Debit</th>
      <th>Cerdit</th>
      <th>Balance</th>
    </tr>
    <?php
    if (isset($_GET['searchgeneralledger'])) {
      $date_from = $_GET['date_from'];
      $date_to = $_GET['date_to'];
      $ac_code = $_GET['ac_code'];

      if(!empty($date_from) && !empty($date_to) && empty($ac_code)){
        $acnamecountstmt = $pdo->prepare("SELECT COUNT(DISTINCT ac_code) FROM general_ledger  WHERE `date` BETWEEN '$date_from' AND '$date_to'");
        $acnamecountstmt->execute();
        $acnamecount = $acnamecountstmt->fetchColumn();

      }elseif(!empty($date_from) || !empty($date_to) && empty($ac_code)){
        if(!empty($date_from)){
          $acnamecountstmt = $pdo->prepare("SELECT COUNT(DISTINCT ac_code) FROM general_ledger  WHERE `date`='$date_from'");
          $acnamecountstmt->execute();
          $acnamecount = $acnamecountstmt->fetchColumn();
        }else{
          $acnamecountstmt = $pdo->prepare("SELECT COUNT(DISTINCT ac_code) FROM general_ledger  WHERE `date`='$date_to'");
          $acnamecountstmt->execute();
          $acnamecount = $acnamecountstmt->fetchColumn();
        }
        $acnamedontloop = 2;
      }else{
        $acnamecount = 1;
        $acnamedontloop = 1;
      }
      for ($i=0; $i < $acnamecount; $i++) {
        if(empty($acnamedontloop) || $acnamedontloop != 1){
          $accodestmt = $pdo->prepare("SELECT DISTINCT ac_code FROM general_ledger");
          $accodestmt->execute();
          $accodedata = $accodestmt->fetchall();
          $accode = $accodedata[$i]['ac_code'];
        } elseif(empty($acnamedontloop) || $acnamedontloop == 2){
          $accodestmt = $pdo->prepare("SELECT DISTINCT ac_code FROM general_ledger");
          $accodestmt->execute();
          $accodedata = $accodestmt->fetchall();
          $accode = $accodedata[$i]['ac_code'];
        }else {
          $accodestmt = $pdo->prepare("SELECT DISTINCT ac_code FROM general_ledger");
          $accodestmt->execute();
          $accodedata = $accodestmt->fetchall();
          $accode = $accodedata[$i]['ac_code'];
        }
        if(empty($acnamedontloop) || $acnamedontloop != 1){
          $gldatas = $query->search('general_ledger', 'ac_code', $accode);
          $acnametoshow = $query->select('acname', $accode, 'code_no');
        }else{
          $gldatas = $query->search('general_ledger', 'ac_code', $ac_code);
          $acnametoshow = $query->select('acname', $ac_code, 'code_no');
        }
        ?>
        <tr>
          <td colspan="7"><b><u><?php echo "Account No. : " . $ac_code . " - " . $acnametoshow['ac_name']; ?></u></b></td>
        </tr>
        <?php
        foreach($gldatas as $gldata) : ?>
          <?php
          $ac_code = $gldata['ac_code'];
          $acname = $query->select('acname', $ac_code, 'code_no');


          // acnamechange
          $voucher_no = $gldata['voucherno'];
          $ac_code = $gldata['ac_code'];
          $acselectstmt = $pdo->prepare("SELECT * FROM transaction WHERE voucher_no='$voucher_no' AND ac_code!='$ac_code'");
          $acselectstmt->execute();
          $acselect = $acselectstmt->fetch(PDO::FETCH_ASSOC);
          $accode = $acselect['ac_code'];
          if(str_contains($accode, '4000/')){
            $acname = 'Supplier';
          }else {
            $acnamedata = $query->select('acname', $accode, 'code_no');
            $acname = $acnamedata['ac_name'];
          }
          // acnamechange

          $balance = $gldata['debit'] - $gldata['credit'];
           ?>
          <tr>
            <td><?php echo date('d/m/Y', strtotime($gldata['date'])); ?></td>
            <td><?php echo $gldata['voucherno']; ?></td>
            <td><?php echo $acname; ?></td>
            <td><?php echo $gldata['narration']; ?></td>
            <td><?php echo $gldata['debit']; ?></td>
            <td><?php echo $gldata['credit']; ?></td>
            <td><?php echo $gldata['balance']; ?></td>
          </tr>
        <?php endforeach;
        $debitstmt = $pdo->prepare("SELECT SUM(debit) AS total_debit FROM general_ledger WHERE ac_code='$ac_code'");
        $debitstmt->execute();
        $totaldebit = $debitstmt->fetch(PDO::FETCH_ASSOC);
        $creditstmt = $pdo->prepare("SELECT SUM(credit) AS total_credit FROM general_ledger WHERE ac_code='$ac_code'");
        $creditstmt->execute();
        $totalcredit = $creditstmt->fetch(PDO::FETCH_ASSOC);
        $totalbalance = $totaldebit['total_debit'] - $totalcredit['total_credit'];
        $balance = $totaldebit['total_debit'] - $totalcredit['total_credit'];
        ?>
        <tr style="font-weight:bold;">
          <td>Total:</td>
          <td></td>
          <td></td>
          <td></td>
          <td><?= $totaldebit['total_debit']; ?></td>
          <td><?= $totalcredit['total_credit']; ?></td>
          <td><?= $totalbalance; ?></td>
        </tr>
        <?php
        }
    }else{
      $acnamecountstmt = $pdo->prepare("SELECT COUNT(DISTINCT ac_code) FROM general_ledger");
      $acnamecountstmt->execute();
      $acnamecount = $acnamecountstmt->fetchColumn();
      for ($i=0; $i < $acnamecount; $i++) {
        $accodestmt = $pdo->prepare("SELECT DISTINCT ac_code FROM general_ledger");
        $accodestmt->execute();
        $accodedata = $accodestmt->fetchall();
        $accode = $accodedata[$i]['ac_code'];
      $gldatas = $query->search('general_ledger', 'ac_code', $accode);
      $acname = $query->select('acname', $accode, 'code_no');
     ?>
     <tr>
       <td colspan="7"><b><u><?php echo "Account No. : " . $accode . " - " . $acname['ac_name']; ?></u></b></td>
     </tr>
    <?php foreach($gldatas as $gldata) : ?>
      <?php
      $ac_code = $gldata['ac_code'];
      $acname = $query->select('acname', $ac_code, 'code_no');

      // acnamechange
      $voucher_no = $gldata['voucherno'];
      $ac_code = $gldata['ac_code'];
      $acselectstmt = $pdo->prepare("SELECT * FROM transaction WHERE voucher_no='$voucher_no' AND ac_code!='$ac_code'");
      $acselectstmt->execute();
      $acselect = $acselectstmt->fetch(PDO::FETCH_ASSOC);
      $accode = $acselect['ac_code'];
      if(str_contains($accode, '4000/')){
        $acname = 'Supplier';
      }else {
        $acnamedata = $query->select('acname', $accode, 'code_no');
        $acname = $acnamedata['ac_name'];
      }
      // acnamechange

       ?>
      <tr data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $gldata['id']; ?>">
        <td><?php echo date('d/m/Y', strtotime($gldata['date'])); ?></td>
        <td><?php echo $gldata['voucherno']; ?></td>
        <td><?php echo $acname; ?></td>
        <td><?php echo $gldata['narration']; ?></td>
        <td><?php echo $gldata['debit']; ?></td>
        <td><?php echo $gldata['credit']; ?></td>
        <td><?php echo $gldata['balance']; ?></td>
      </tr>
    <?php endforeach; ?>
    <?php

    $ac_code = $gldata['ac_code'];
    $acname = $query->select('acname', $ac_code, 'code_no');
    $debitstmt = $pdo->prepare("SELECT SUM(debit) AS total_debit FROM general_ledger WHERE ac_code='$ac_code'");
    $debitstmt->execute();
    $totaldebit = $debitstmt->fetch(PDO::FETCH_ASSOC);
    $creditstmt = $pdo->prepare("SELECT SUM(credit) AS total_credit FROM general_ledger WHERE ac_code='$ac_code'");
    $creditstmt->execute();
    $totalcredit = $creditstmt->fetch(PDO::FETCH_ASSOC);
    $totalbalance = $totaldebit['total_debit'] - $totalcredit['total_credit'];

     ?>
     <tr style="font-weight:bold;">
       <td>Total:</td>
       <td></td>
       <td></td>
       <td></td>
       <td><?= $totaldebit['total_debit']; ?></td>
       <td><?= $totalcredit['total_credit']; ?></td>
       <td><?= $totalbalance; ?></td>
     </tr>
    <?php } } ?>
  </table>

  <?php
}
exit();


 ?>
