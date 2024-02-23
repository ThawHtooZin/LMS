<?php

session_start();
include '../../Auth/authrize.ctr.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$query = new Query();


if($_GET['table_name'] == 'general_ledger'){
  if (!empty($_GET['date_from'])) {
    $date_from = $_GET['date_from'];
  }else{
    $date_from = false;
  }
  if (!empty($_GET['date_to'])) {
    $date_to = $_GET['date_to'];
  }else {
    $date_to = false;
  }
  if(!empty($_GET['ac_code'])){
    $ac_code = $_GET['ac_code'];
  }else{
    $ac_code = false;
  }
  header("Content-Type: application/xls");
  if($date_from !== false && $date_to !== false && $ac_code !== false){
    header("Content-Disposition: attachment; filename=GeneralLedger{$date_from}to{$date_to}and{$ac_code}.xls");
  }elseif($date_from !== false || $date_to !== false && $ac_code === false){
    if($date_from !== false){
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

      if(!empty($date_from) && !empty($date_to) && !empty($ac_code)){
        $acnamecountstmt = $pdo->prepare("SELECT COUNT(DISTINCT ac_code) FROM general_ledger  WHERE `date` BETWEEN '$date_from' AND '$date_to' AND ac_code='$ac_code'");
        $acnamecountstmt->execute();
        $acnamecount = $acnamecountstmt->fetchColumn();
        $acnamedontloop = 1;
      }elseif(!empty($date_from) && !empty($date_to) && empty($ac_code)){
        $acnamecountstmt = $pdo->prepare("SELECT COUNT(DISTINCT ac_code) FROM general_ledger  WHERE `date` BETWEEN '$date_from' AND '$date_to'");
        $acnamecountstmt->execute();
        $acnamecount = $acnamecountstmt->fetchColumn();
        $acnamedontloop = 2;
      }elseif(!empty($date_to) || !empty($date_from) && !empty($ac_code)){
        if(!empty($date_from)){
          $acnamecountstmt = $pdo->prepare("SELECT COUNT(DISTINCT ac_code) FROM general_ledger  WHERE `date`='$date_from' AND ac_code='$ac_code'");
          $acnamecountstmt->execute();
          $acnamecount = $acnamecountstmt->fetchColumn();
          $acnamedontloop = 1;
          $acnamecount = 1;
        }elseif(!empty($date_to)){
          $acnamecountstmt = $pdo->prepare("SELECT COUNT(DISTINCT ac_code) FROM general_ledger  WHERE `date`='$date_to' AND ac_code='$ac_code'");
          $acnamecountstmt->execute();
          $acnamecount = $acnamecountstmt->fetchColumn();
          $acnamedontloop = 1;
          $acnamecount = 1;
        }
      }elseif(!empty($date_to) || !empty($date_from) && empty($ac_code)){
        if(!empty($date_from)){
          $acnamecountstmt = $pdo->prepare("SELECT COUNT(DISTINCT ac_code) FROM general_ledger  WHERE `date`='$date_from'");
          $acnamecountstmt->execute();
          $acnamecount = $acnamecountstmt->fetchColumn();
          $acnamedontloop = 2;
        }elseif(!empty($date_to)){
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
        $accodestmt = $pdo->prepare("SELECT DISTINCT ac_code FROM general_ledger");
        $accodestmt->execute();
        $accodedata = $accodestmt->fetchall();
        $accode = $accodedata[$i]['ac_code'];

        if(!empty($acnamedontloop) && $acnamedontloop > 1){
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

if($_GET['table_name'] == 'daterangecharges'){
  header("Content-Type: application/xls");
  header("Content-Disposition: attachment; filename=hhktotalcharges.xls");
  header("Pragma: no-cache");
  header("Expires: 0");
  ?>
  <table class="table table-bordered" border="1">
    <tr style="font-size:19px;">
      <th>Date</th>
      <th>Commondity</th>
      <th>Total Cold Store Charges</th>
      <th>Total Labour Charges</th>
      <th>Total Processing Charges</th>
      <th>Repacking Charges</th>
      <th>Ice Charges</th>
      <th>OT Charges</th>
      <th>Total Charges</th>
      <th>Grand Total Charges</th>
      <th>Payment Date</th>
      <th>Payment Amount</th>
      <th>Balance Amount</th>
      <th>Remark</th>
    </tr>
    <?php
    $totalstmt = $pdo->prepare("SELECT * FROM total_charges");
    $totalstmt->execute();
    $totaldatas = $totalstmt->fetchall();
    $idd = 0;
    foreach ($totaldatas as $total_charges_data) {
      $idd++;
      $item_id = $total_charges_data['commondity_id'];
      $commonditydata = $query->select('category', $item_id, 'category_id');
    ?>
    <tr>
      <td><?php if($total_charges_data['date'] != "0000-00-00"){ echo date('d/m/Y', strtotime($total_charges_data['date']));} ; ?></td>
      <td><?php if(!empty($commonditydata['category_name'])){ echo $commonditydata['category_name'];} ; ?></td>
      <td><?php if($total_charges_data['total_coldstore_charges'] != "0"){ echo $total_charges_data['total_coldstore_charges'];} ; ?></td>
      <td><?php if($total_charges_data['total_labour_charges'] != "0"){ echo $total_charges_data['total_labour_charges'];} ; ?></td>
      <td><?php if($total_charges_data['total_processing_charges'] != "0"){ echo $total_charges_data['total_processing_charges'];} ; ?></td>
      <td data-bs-toggle="modal" data-bs-target="#updatetotalcharges<?php echo $total_charges_data['id']; ?>"><?php if($total_charges_data['repacking_charges'] != "0"){ echo $total_charges_data['repacking_charges'];} ; ?></td>
      <td data-bs-toggle="modal" data-bs-target="#updatetotalcharges<?php echo $total_charges_data['id']; ?>"><?php if($total_charges_data['ice_charges'] != "0"){ echo $total_charges_data['ice_charges'];} ; ?></td>
      <td data-bs-toggle="modal" data-bs-target="#updatetotalcharges<?php echo $total_charges_data['id']; ?>"><?php if($total_charges_data['ot_charges'] != "0"){ echo $total_charges_data['ot_charges'];} ; ?></td>
      <td><?php if($total_charges_data['total_charges'] != "0"){ echo $total_charges_data['total_charges'];} ; ?></td>
      <td><?php if($total_charges_data['grand_total_charges'] != "0"){ echo $total_charges_data['grand_total_charges'];} ; ?></td>
      <td><?php if($total_charges_data['payment_date'] != "0000-00-00"){ echo date('d-m-Y', strtotime($total_charges_data['payment_date'])); } ; ?></td>
      <td><?php if($total_charges_data['payment_amount'] != "0"){ echo $total_charges_data['payment_amount']; }; ?></td>
      <td><?php if($total_charges_data['balance_amount'] != "0"){ echo $total_charges_data['balance_amount'];}; ?></td>
      <td data-bs-toggle="modal" data-bs-target="#remark<?php echo $total_charges_data['id']; ?>"><?php if($total_charges_data['remark'] != "0"){ echo $total_charges_data['remark'];}; ?></td>
    </tr>
    <?php
    }
     ?>
  </table>
  <?php
}

if ($_GET['table_name'] == 'monthlycharges') {
  header("Content-Type: application/xls");
  header("Content-Disposition: attachment; filename=gfctotalcharges.xls");
  header("Pragma: no-cache");
  header("Expires: 0");
  ?>
  <table border="1">
    <tr style="font-size:19px;">
      <th style="padding-top: 17px;" class="text-center">Id</th>
      <th style="padding-top: 17px;" class="text-center">Date</th>
      <th class="text-center">Total Cold Store Charges</th>
      <th class="text-center">Total Labour Charges</th>
      <th class="text-center">Total Repacking Charges</th>
      <th class="text-center">Total Dry Fish CS Charges</th>
      <th class="text-center">Total Dry FIsh LB Charges</th>
      <th class="text-center">Plug On Charges</th>
      <th class="text-center">Total Charges</th>
      <th class="text-center">Payment Date</th>
      <th class="text-center">Payment Amount</th>
      <th class="text-center">Balance Amount</th>
    </tr>
    <?php
    $totaldatas = $query->selectall('gfctotal');
    $idd = 0;
    foreach ($totaldatas as $totaldata) {
      $idd++;
      ?>
      <tr>
        <td style="font-size:13px;"><?php if($totaldata['date'] != '0000-00-00'){echo $idd;} ?></td>
        <td style="font-size:13px;"><?php if($totaldata['date'] != '0000-00-00'){echo date('d-m-Y', strtotime($totaldata['date']));} ?></td>
        <td style="font-size:13px;"><?php if($totaldata['totalfishcoldstorecharges'] != '0'){echo $totaldata['totalfishcoldstorecharges'];} ?></td>
        <td style="font-size:13px;"><?php if($totaldata['totalfishlabourcharges'] != '0'){echo $totaldata['totalfishlabourcharges'];} ?></td>
        <td style="font-size:13px;"><?php if($totaldata['totalrepackingcharges'] != '0'){echo $totaldata['totalrepackingcharges'];} ?></td>
        <td style="font-size:13px;"><?php if($totaldata['totaldryfishcoldstorecharges'] != '0'){echo $totaldata['totaldryfishcoldstorecharges'];} ?></td>
        <td style="font-size:13px;"><?php if($totaldata['totaldryfishlabourcharges'] != '0'){echo $totaldata['totaldryfishlabourcharges'];} ?></td>
        <td style="font-size:13px;"><?php if($totaldata['plugoncharges'] != '0'){echo $totaldata['plugoncharges'];} ?></td>
        <td style="font-size:13px;"><?php if($totaldata['total_charges'] != '0'){echo $totaldata['total_charges'];} ?></td>
        <td style="font-size:13px;"><?php if($totaldata['payment_date'] != "0000-00-00"){ echo date('d-m-Y', strtotime($totaldata['payment_date'])); }; ?></td>
        <td style="font-size:13px;"><?php if($totaldata['payment_amount'] != "0"){ echo $totaldata['payment_amount']; }; ?></td>
        <td style="font-size:13px;"><?php echo $totaldata['balance_amount']; ?></td>
      </tr>
    <?php
    }
     ?>
  </table>
  <?php
}

if($_GET['table_name'] == 'sales'){
  header("Content-Type: application/xls");
  header("Content-Disposition: attachment; filename=salesexport.xls");
  header("Pragma: no-cache");
  header("Expires: 0");

?>
<table border="1">
<?php
  $acnamecountstmt = $pdo->prepare("SELECT COUNT(DISTINCT ac_code) FROM general_ledger WHERE ac_code LIKE '5000%'");
  $acnamecountstmt->execute();
  $acnamecount = $acnamecountstmt->fetchColumn();


  if(!empty($date_from) && !empty($date_to)){
    $date_from = $_GET['date_from'];
    $date_to = $_GET['date_to'];
    $acnamecountstmt = $pdo->prepare("SELECT COUNT(DISTINCT ac_code) FROM general_ledger  WHERE `date` BETWEEN '$date_from' AND '$date_to' AND ac_code LIKE '5000%'");
    $acnamecountstmt->execute();
    $acnamecount = $acnamecountstmt->fetchColumn();
    $acnamedontloop = 2;
  }elseif(!empty($date_to) || !empty($date_from)){
    if(!empty($date_from)){
      $date_from = $_GET['date_from'];
      $acnamecountstmt = $pdo->prepare("SELECT COUNT(DISTINCT ac_code) FROM general_ledger  WHERE `date`='$date_from' AND ac_code LIKE '5000%'");
      $acnamecountstmt->execute();
      $acnamecount = $acnamecountstmt->fetchColumn();
      $acnamedontloop = 2;
    }elseif(!empty($date_to)){
      $date_to = $_GET['date_to'];
      $acnamecountstmt = $pdo->prepare("SELECT COUNT(DISTINCT ac_code) FROM general_ledger  WHERE `date`='$date_to' AND ac_code LIKE '5000%'");
      $acnamecountstmt->execute();
      $acnamecount = $acnamecountstmt->fetchColumn();
      $acnamedontloop = 2;
    }
  }

  for ($i=0; $i < $acnamecount; $i++) {
    $accodestmt = $pdo->prepare("SELECT DISTINCT ac_code FROM general_ledger WHERE ac_code LIKE '5000%'");
    $accodestmt->execute();
    $accodedata = $accodestmt->fetchall();
    $accode = $accodedata[$i]['ac_code'];
  $gldatas = $query->search('general_ledger', 'ac_code', $accode);
  $acname = $query->select('acname', $accode, 'code_no');
 ?>
 <tr style="background-color: lightgray;">
   <th>Date</th>
   <th>Voucher No</th>
   <th>Account Name</th>
   <th>Description</th>
   <th>Debit</th>
   <th>Cerdit</th>
   <th>Balance</th>
 </tr>
<?php foreach($gldatas as $gldata) : ?>

  <?php
  // acnamechange
  $voucher_no = $gldata['voucherno'];
  $ac_code = $gldata['ac_code'];
  $acselectstmt = $pdo->prepare("SELECT * FROM transaction WHERE voucher_no='$voucher_no' AND ac_code!='$ac_code'");
  $acselectstmt->execute();
  $acselect = $acselectstmt->fetch(PDO::FETCH_ASSOC);
  if(!empty($acselect['ac_code'])){
    $accode = $acselect['ac_code'];

    $acname = $query->select('acname', $accode, 'code_no');
  }

  $dollarratestmt = $pdo->prepare("SELECT * FROM currency WHERE voucher_no='$voucher_no' AND debitorcredit='credit'");
  $dollarratestmt->execute();
  $dollarrate = $dollarratestmt->fetch(PDO::FETCH_ASSOC);

  // acnamechange

  $balance = $gldata['balance'] / $dollarrate['dollar_rate'];
   ?>
  <tr data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $gldata['id']; ?>">
    <td><?php echo date('d/m/Y', strtotime($gldata['date'])); ?></td>
    <td><?php echo $gldata['voucherno']; ?></td>
    <td><?php echo $acname['ac_name']; ?></td>
    <td><?php echo $gldata['narration']; ?></td>
    <td><?php echo $gldata['debit']; ?></td>
    <td><?php echo $dollarrate['usd_amount']; ?></td>
    <td><?php echo $balance; ?></td>
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

$totaldebit = $totaldebit['total_debit'] / $dollarrate['dollar_rate'];
$totalcredit = $totalcredit['total_credit'] / $dollarrate['dollar_rate'];
$totalbalance = $totalbalance / $dollarrate['dollar_rate'];
 ?>
 <tr style="font-weight:bold;">
   <td>Total:</td>
   <td></td>
   <td></td>
   <td></td>
   <td><?= $totaldebit; ?></td>
   <td><?= $totalcredit; ?></td>
   <td><?= $totalbalance; ?></td>
 </tr>
<?php }
?>
</table>
<?php
}

if($_GET['table_name'] == 'receivable'){
  header("Content-Type: application/xls");
  header("Content-Disposition: attachment; filename=receivablereport.xls");
  header("Pragma: no-cache");
  header("Expires: 0");
?>
  <table class="table table-hover table-striped table-bordered mt-3" border="1">
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
    </tr>
    <?php
    $accodeloopstmt = $pdo->prepare("SELECT DISTINCT ac_code FROM receivable");
    $accodeloopstmt->execute();
    $accodeloopdatas = $accodeloopstmt->fetchAll();
    foreach ($accodeloopdatas as $accodeloopdata) :
     if (empty($_GET['country']) || $_GET['country'] == "{$accodeloopdata['ac_code']}") {
       if(!empty($_GET['country'])){
         $receivabledatas = $query->search('receivable', 'ac_code', $_GET['country']);
       }else{
         $receivabledatas = [];
       }
     }
     endforeach;
     if(empty($receivabledatas)){
       $receivabledatas = [];
     }
    foreach($receivabledatas as $receivabledata) :
      $ac_name = $query->select('acname', $receivabledata['ac_code'], 'code_no');
    ?>
    <tr>
      <td><?php if($receivabledata['date'] != '0000-00-00'){ echo date('d-m-Y', strtotime($receivabledata['date'])); }; ?></td>
      <!-- <td><?php //if(!empty($receivabledata['invoice_amount'])){ if(!empty($ac_name['ac_name'])){ echo $ac_name['ac_name'];} } ?></td> -->
      <td><?php echo $receivabledata['sr_no']; ?></td>
      <td><?php echo $receivabledata['container_no']; ?></td>
      <td><?php echo $receivabledata['invoice_amount']; ?></td>
      <td><?php if($receivabledata['paid_date'] != '0000-00-00'){ echo date('d-m-Y', strtotime($receivabledata['paid_date'])); } ?></td>
      <td><?php echo $receivabledata['payment_no']; ?></td>
      <td><?php echo $receivabledata['particulars']; ?></td>
      <td><?php if($receivabledata['paid_amount'] != 0){ echo $receivabledata['paid_amount'];} ?></td>
      <td><?php echo $receivabledata['balance']; ?></td>
    </tr>
    <?php
    $ac_code = $receivabledata['ac_code'];
    endforeach;
     ?>
  </table>

<?php
}

if ($_GET['table_name'] == 'payable') {
  header("Content-Type: application/xls");
  header("Content-Disposition: attachment; filename=payableexport.xls");
  header("Pragma: no-cache");
  header("Expires: 0");
  ?>
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
                  $stmt = $pdo->prepare("SELECT DISTINCT supplier_id FROM payable WHERE date='$searchdate' OR paid_date='$searchdate'");
                  $stmt->execute();
                  $payablesuppliers = $stmt->fetchall();
                  // print_r($payablesuppliers);
                  $id = 0;
                  foreach ($payablesuppliers as $payablesupplier) :
                    $supplier_id = $payablesupplier['supplier_id'];

                    $date = date('Y-m-d', strtotime($searchdate . ' -1 day'));
                    $payablestmt = $pdo->prepare("SELECT * FROM payable WHERE supplier_id='$supplier_id' AND date='$searchdate'");
                    $payablestmt->execute();
                    $payabledata = $payablestmt->fetch(PDO::FETCH_ASSOC);
                    
                    $openingamountstmt = $pdo->prepare("SELECT closing_balance FROM payable WHERE supplier_id='$supplier_id' AND date='$date'");
                    $openingamountstmt->execute();
                    $openingamount = $openingamountstmt->fetch(PDO::FETCH_ASSOC);
                    // print_r($openingamount['closing_balance']);

                    $purchaseamtstmt = $pdo->prepare("SELECT SUM(purchase_amount) AS purchase_amount FROM payable WHERE supplier_id='$supplier_id' AND date='$date'");
                    $purchaseamtstmt->execute();
                    $purchaseamt = $purchaseamtstmt->fetch(PDO::FETCH_ASSOC);
                    // print_r($purchaseamt['purchase_amount']);

                    $paidamtstmt = $pdo->prepare("SELECT SUM(paid_amount) AS paid_amount FROM payable WHERE supplier_id='$supplier_id' AND paid_date='$date'");
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
                  if(isset($_POST['date_search'])){
                    $date = $_POST['date_search_inp'];

                    

                    $payablestmt = $pdo->prepare("SELECT SUM(closing_balance) AS total_closing_balance FROM payable WHERE date='$date'");
                    $payablestmt->execute();
                    $payabledata = $payablestmt->fetch(PDO::FETCH_ASSOC);

                    $purchaseamtstmt = $pdo->prepare("SELECT SUM(purchase_amount) AS total_purchase_amount FROM payable WHERE date='$date'");
                    $purchaseamtstmt->execute();
                    $purchaseamt = $purchaseamtstmt->fetch(PDO::FETCH_ASSOC);

                    $paidamtstmt = $pdo->prepare("SELECT SUM(paid_amount) AS total_paid_amount FROM payable WHERE date='$date'");
                    $paidamtstmt->execute();
                    $paidamt = $paidamtstmt->fetch(PDO::FETCH_ASSOC);

                    $openingamountstmt = $pdo->prepare("SELECT closing_balance FROM payable WHERE date='$date'");
                    $openingamountstmt->execute();
                    $openingamount = $openingamountstmt->fetch(PDO::FETCH_ASSOC);

                    if (!empty($openingamount['closing_balance'])) {
                      $openingamt = $openingamount['closing_balance'];
                    }else{
                      $openingamt = 0;
                    }
                    $balance = ($openingamt + $purchaseamt['total_purchase_amount']) - $paidamt['total_paid_amount'];
                    ?>
                    <tr>
                  <td>TOTAL</td>
                  <td></td>
                  <td><?= $payabledata['total_closing_balance']; ?></td>
                  <td><?= $purchaseamt['total_purchase_amount']; ?></td>
                  <td><?= $paidamt['total_paid_amount']; ?></td>
                  <td><?= $balance; ?></td>
                </tr>  
                    <?php
                  }
                ?>
                </table>
                <?php
              }
}

if ($_GET['table_name'] == 'actualinvoice') {
  header("Content-Type: application/xls");
  header("Content-Disposition: attachment; filename=actualinvoice.xls");
  header("Pragma: no-cache");
  header("Expires: 0");

  $infoid = $_GET['infoid'];
  $infostmt = $pdo->prepare("SELECT * FROM packingliststock WHERE id='$infoid'");
  $infostmt->execute();
  $infodata = $infostmt->fetch(PDO::FETCH_ASSOC);
?>
 <div class="row" style="font-weight: bold; display:flex !important;">
   <table>
    <tr>
      <td class="float-start" style="font-weight: bold;">
      <?php
       $customer_id = $infodata['customer_id'];
       $acnamedata = $query->select('acname', $customer_id, 'code_no');
       $customerdata = $query->select('customers', $customer_id, 'customer_id');
       echo $acnamedata['ac_name'];
       ?><br><?php
       echo $customerdata['customer_detail'];
       ?><br><?php
       echo $customerdata['customer_address'];
       ?>
      </td>
      <td colspan="6"></td>
      <td class="float-end" style="font-weight: bold;">
        Date : <?php echo date('d-m-Y', strtotime($infodata['date']));  ?>
     <br>
     Invoice No : <?php echo $infodata['invoiceno'];  ?>
     <br>
     CTNR No : <?php echo $infodata['containerno'];  ?>
     <br>
     VESSEL NAME : <?php echo $infodata['vessel_name']; ?>
     <br>
     VOY NAME : <?php echo $infodata['voyname']; ?>
     <br>
     FDA : <?php echo $infodata['fda']; ?></td>
    </tr>
   </table>
 </div>
  <table border="1">
     <tr>
       <th>No</th>
       <th>Commondity</th>
       <th>Size</th>
       <th>Packing Kg Per Box</th>
       <th>Mc</th>
       <th>Total Net Weight</th>
       <th>FOD/USD</th>
       <th>Total USD</th>
     </tr>
     <?php
     $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT commondity_id) FROM actualinvoice WHERE infoid='$infoid'");
     $commonditycountstmt->execute();
     $commonditycountdatas = $commonditycountstmt->fetchColumn();
     $no = 1;
     for ($i=0; $i < $commonditycountdatas; $i++) {
       $commonditystmt = $pdo->prepare("SELECT DISTINCT commondity_id FROM actualinvoice WHERE infoid='$infoid'");
       $commonditystmt->execute();
       $commonditydata = $commonditystmt->fetchall();
       $commondity_id = $commonditydata[$i]['commondity_id'];

       $stmt = $pdo->prepare("SELECT * FROM actualinvoice WHERE commondity_id='$commondity_id' AND infoid='$infoid' ORDER BY size");
       $stmt->execute();
       $datas = $stmt->fetchall();

       foreach ($datas as $packingstockinfodata) {

         $item_id = $packingstockinfodata['commondity_id'];
         $commonditydata = $query->select('item', $item_id, 'item_id');
         $lastid = $packingstockinfodata['id'];
         $size = $packingstockinfodata['size'];
         $infoid = $packingstockinfodata['infoid'];
         $checklast = $pdo->prepare("SELECT * FROM actualinvoice WHERE id < $lastid AND commondity_id='$item_id' AND size='$size' AND infoid='$infoid'");
         $checklast->execute();
         $checklastavaliable = $checklast->fetch(PDO::FETCH_ASSOC);
         $lastcommondity = $pdo->prepare("SELECT * FROM actualinvoice WHERE id < $lastid AND commondity_id='$item_id' AND infoid='$infoid'");
         $lastcommondity->execute();
         $lastcommondity = $lastcommondity->fetch(PDO::FETCH_ASSOC);

           ?>
           <tr>
             <td><?php if(empty($lastcommondity)){ echo $no; } ?></td>
             <td><?php if(empty($lastcommondity)){ echo $commonditydata['item_name'];}; ?></td>
             <td><?php if(empty($checklastavaliable)){ echo $packingstockinfodata['size'];}; ?></td>
             <td><?php echo $packingstockinfodata['packingkgperbox']; ?></td>
             <td><?php echo $packingstockinfodata['mc']; ?></td>
             <td><?php echo $packingstockinfodata['totalnetweight']; ?></td>
             <td data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $packingstockinfodata['id']; ?>"><?php if($packingstockinfodata['usd'] != 0 ){ echo $packingstockinfodata['usd'];} ?></td>
             <td <?php if(str_contains(strtolower($commonditydata['item_name']), 'bala')){ echo 'data-bs-toggle="modal"'; } ?> data-bs-target="#updatetotalusd<?php echo $packingstockinfodata['id']; ?>"><?php if($packingstockinfodata['total_usd'] != 0 ){ echo $packingstockinfodata['total_usd'];} ?></td>
           </tr>
         <?php
       }
       $item_id = $packingstockinfodata['commondity_id'];
       $totalmcstmt = $pdo->prepare("SELECT SUM(mc) AS totalmc FROM packingliststockinfo WHERE infoid='$infoid' AND commondity_id='$item_id'");
       $totalmcstmt->execute();
       $totalmcdata = $totalmcstmt->fetch(PDO::FETCH_ASSOC);
       $totalnetweightstmt = $pdo->prepare("SELECT SUM(totalnetweight) AS totalnetweight FROM packingliststockinfo WHERE infoid='$infoid' AND commondity_id='$item_id'");
       $totalnetweightstmt->execute();
       $totalnetweightdata = $totalnetweightstmt->fetch(PDO::FETCH_ASSOC);
       ?>
       <tr style="font-weight: bold !important; background-color:#D3D3D3;">
         <td></td>
         <td>Sub Total</td>
         <td></td>
         <td></td>
         <td><?php echo $totalmcdata['totalmc']; ?></td>
         <td><?php if(!empty($totalnetweightdata['totalnetweight'])){ echo $totalnetweightdata['totalnetweight']; }; ?></td>
         <td></td>
         <td></td>
       </tr>
       <?php
       $no++;
     }
     ?>
     <?php
     $item_id = $packingstockinfodata['commondity_id'];
     $totalusdstmt = $pdo->prepare("SELECT SUM(total_usd) AS total_usd FROM actualinvoice WHERE infoid='$infoid'");
     $totalusdstmt->execute();
     $totalusddata = $totalusdstmt->fetch(PDO::FETCH_ASSOC);
     ?>
     <tr>
       <td></td>
       <td style="font-weight:bold !important;">Grand Total</td>
       <td></td>
       <td></td>
       <td></td>
       <td></td>
       <td></td>
       <td><?php echo $totalusddata['total_usd']; ?></td>
     </tr>
   </table>
 <?php
}

if ($_GET['table_name'] == 'actualpackinglist') {
  header("Content-Type: application/xls");
  header("Content-Disposition: attachment; filename=actualinvoice.xls");
  header("Pragma: no-cache");
  header("Expires: 0");

  $infoid = $_GET['infoid'];
  $infostmt = $pdo->prepare("SELECT * FROM packingliststock WHERE id='$infoid'");
  $infostmt->execute();
  $infodata = $infostmt->fetch(PDO::FETCH_ASSOC);
?>
 <div class="row" style="font-weight: bold; display:flex !important;">
   <table>
    <tr>
      <td class="float-start" style="font-weight: bold;">
      <?php
       $customer_id = $infodata['customer_id'];
       $acnamedata = $query->select('acname', $customer_id, 'code_no');
       $customerdata = $query->select('customers', $customer_id, 'customer_id');
       echo $acnamedata['ac_name'];
       ?><br><?php
       echo $customerdata['customer_detail'];
       ?><br><?php
       echo $customerdata['customer_address'];
       ?>
      </td>
      <td colspan="6"></td>
      <td class="float-end" style="font-weight: bold;">
        Date : <?php echo date('d-m-Y', strtotime($infodata['date']));  ?>
     <br>
     Invoice No : <?php echo $infodata['invoiceno'];  ?>
     <br>
     CTNR No : <?php echo $infodata['containerno'];  ?>
     <br>
     VESSEL NAME : <?php echo $infodata['vessel_name']; ?>
     <br>
     VOY NAME : <?php echo $infodata['voyname']; ?>
     <br>
     FDA : <?php echo $infodata['fda']; ?></td>
    </tr>
   </table>
 </div>
  <table border="1">
     <tr>
       <th>No</th>
       <th>Commondity</th>
       <th>Size</th>
       <th>Packing Kg Per Box</th>
       <th>Mc</th>
       <th>Total Net Weight</th>
       <th>FOD/USD</th>
       <th>Total USD</th>
     </tr>
     <?php
     $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT commondity_id) FROM actualinvoice WHERE infoid='$infoid'");
     $commonditycountstmt->execute();
     $commonditycountdatas = $commonditycountstmt->fetchColumn();
     $no = 1;
     for ($i=0; $i < $commonditycountdatas; $i++) {
       $commonditystmt = $pdo->prepare("SELECT DISTINCT commondity_id FROM actualinvoice WHERE infoid='$infoid'");
       $commonditystmt->execute();
       $commonditydata = $commonditystmt->fetchall();
       $commondity_id = $commonditydata[$i]['commondity_id'];

       $stmt = $pdo->prepare("SELECT * FROM actualinvoice WHERE commondity_id='$commondity_id' AND infoid='$infoid' ORDER BY size");
       $stmt->execute();
       $datas = $stmt->fetchall();

       foreach ($datas as $packingstockinfodata) {

         $item_id = $packingstockinfodata['commondity_id'];
         $commonditydata = $query->select('item', $item_id, 'item_id');
         $lastid = $packingstockinfodata['id'];
         $size = $packingstockinfodata['size'];
         $infoid = $packingstockinfodata['infoid'];
         $checklast = $pdo->prepare("SELECT * FROM actualinvoice WHERE id < $lastid AND commondity_id='$item_id' AND size='$size' AND infoid='$infoid'");
         $checklast->execute();
         $checklastavaliable = $checklast->fetch(PDO::FETCH_ASSOC);
         $lastcommondity = $pdo->prepare("SELECT * FROM actualinvoice WHERE id < $lastid AND commondity_id='$item_id' AND infoid='$infoid'");
         $lastcommondity->execute();
         $lastcommondity = $lastcommondity->fetch(PDO::FETCH_ASSOC);

           ?>
           <tr>
             <td><?php if(empty($lastcommondity)){ echo $no; } ?></td>
             <td><?php if(empty($lastcommondity)){ echo $commonditydata['item_name'];}; ?></td>
             <td><?php if(empty($checklastavaliable)){ echo $packingstockinfodata['size'];}; ?></td>
             <td><?php echo $packingstockinfodata['packingkgperbox']; ?></td>
             <td><?php echo $packingstockinfodata['mc']; ?></td>
             <td><?php echo $packingstockinfodata['totalnetweight']; ?></td>
             <td data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $packingstockinfodata['id']; ?>"><?php if($packingstockinfodata['usd'] != 0 ){ echo $packingstockinfodata['usd'];} ?></td>
             <td <?php if(str_contains(strtolower($commonditydata['item_name']), 'bala')){ echo 'data-bs-toggle="modal"'; } ?> data-bs-target="#updatetotalusd<?php echo $packingstockinfodata['id']; ?>"><?php if($packingstockinfodata['total_usd'] != 0 ){ echo $packingstockinfodata['total_usd'];} ?></td>
           </tr>
         <?php
       }
       $item_id = $packingstockinfodata['commondity_id'];
       $totalmcstmt = $pdo->prepare("SELECT SUM(mc) AS totalmc FROM packingliststockinfo WHERE infoid='$infoid' AND commondity_id='$item_id'");
       $totalmcstmt->execute();
       $totalmcdata = $totalmcstmt->fetch(PDO::FETCH_ASSOC);
       $totalnetweightstmt = $pdo->prepare("SELECT SUM(totalnetweight) AS totalnetweight FROM packingliststockinfo WHERE infoid='$infoid' AND commondity_id='$item_id'");
       $totalnetweightstmt->execute();
       $totalnetweightdata = $totalnetweightstmt->fetch(PDO::FETCH_ASSOC);
       ?>
       <tr style="font-weight: bold !important; background-color:#D3D3D3;">
         <td></td>
         <td>Sub Total</td>
         <td></td>
         <td></td>
         <td><?php echo $totalmcdata['totalmc']; ?></td>
         <td><?php if(!empty($totalnetweightdata['totalnetweight'])){ echo $totalnetweightdata['totalnetweight']; }; ?></td>
         <td></td>
         <td></td>
       </tr>
       <?php
       $no++;
     }
     ?>
     <?php
     $item_id = $packingstockinfodata['commondity_id'];
     $totalusdstmt = $pdo->prepare("SELECT SUM(total_usd) AS total_usd FROM actualinvoice WHERE infoid='$infoid'");
     $totalusdstmt->execute();
     $totalusddata = $totalusdstmt->fetch(PDO::FETCH_ASSOC);
     ?>
     <tr>
       <td></td>
       <td style="font-weight:bold !important;">Grand Total</td>
       <td></td>
       <td></td>
       <td></td>
       <td></td>
       <td></td>
       <td><?php echo $totalusddata['total_usd']; ?></td>
     </tr>
   </table>
 <?php
}

if($_GET['table_name'] == 'mcstockreport'){
  header("Content-Type: application/xls");
  header("Content-Disposition: attachment; filename=mcstockreport.xls");
  header("Pragma: no-cache");
  header("Expires: 0");
  ?>
  <table border="1">
    <tr class="text-center">
      <th rowspan="2" style="padding-top:30px;">No</th>
      <th rowspan="2" style="padding-top:30px;">Fish Name</th>
      <th rowspan="2" style="padding-top:30px;">Country</th>
      <th rowspan="2" style="padding-top:30px;">Size</th>
      <th rowspan="2" style="padding-top:30px;">Kg</th>
      <th>HHK</th>
      <th>GFC</th>
      <th>Total</th>
    </tr>
    <tr class="text-center">
      <th>Mc</th>
      <th>Mc</th>
      <th>Mc</th>
    </tr>
    <?php
    $country = $_SESSION['tabs'];
    $id = 0;
    if(!empty($_GET['commondity_id'])){
      $searchcommondity = $_GET['commondity_id'];
      $hhkmcstockcommonditystmt = $pdo->prepare("SELECT DISTINCT commondity_id FROM hhkmcstock WHERE commondity_id='$searchcommondity' AND country='$country'");
      $hhkmcstockcommonditystmt->execute();
      $hhkmcstockcommonditydatas = $hhkmcstockcommonditystmt->rowCount();
    }else{
      $hhkmcstockcommonditystmt = $pdo->prepare("SELECT DISTINCT commondity_id FROM hhkmcstock WHERE country='$country'");
      $hhkmcstockcommonditystmt->execute();
      $hhkmcstockcommonditydatas = $hhkmcstockcommonditystmt->rowCount();
    }
    for ($i=0; $i < $hhkmcstockcommonditydatas; $i++) {
      $commonditystmt = $pdo->prepare("SELECT DISTINCT commondity_id FROM hhkmcstock WHERE country='$country'");
      $commonditystmt->execute();
      $commonditydata = $commonditystmt->fetchall();
      $commondity_id = $commonditydata[$i]['commondity_id'];

      if(isset($_POST['commonditybtn']) && !empty($_POST['commondity_id'])){
        $searchcommondity_id = $_POST['commondity_id'];
        $searchstmt = $pdo->prepare("SELECT * FROM hhkmcstock WHERE commondity_id='$searchcommondity_id' AND country='$country' AND particular LIKE '%from%'");
        $searchstmt->execute();
        $datas = $searchstmt->fetchall();
        //
        // echo "<pre>";
        // print_r($datas);
      }else{
        $stmt = $pdo->prepare("SELECT * FROM hhkmcstock WHERE commondity_id='$commondity_id' AND country='$country' AND particular NOT LIKE '%to%' ");
        $stmt->execute();
        $datas = $stmt->fetchall();
      }


      foreach ($datas as $hhkdata) {
        $id++;
        $size = $hhkdata['size'];
        $item_id = $hhkdata['commondity_id'];
        $country = $hhkdata['country'];
        $commonditydata = $query->select('item', $item_id, 'item_id');

        $hhkcommonditystmt = $pdo->prepare("SELECT DISTINCT commondity_id FROM hhkmcstock WHERE size='$size' AND commondity_id='$item_id'");
        $hhkcommonditystmt->execute();
        $hhkcommonditydatas = $hhkcommonditystmt->fetchall();

          $kg = $hhkdata['kg'];

          $fetchallstmt = $pdo->prepare("SELECT balance_mc FROM hhkmcstock WHERE size='$size' AND commondity_id='$item_id' AND kg='$kg' ORDER BY id DESC");
          $fetchallstmt->execute();
          $fetchalldata = $fetchallstmt->fetch(PDO::FETCH_ASSOC);

          $fetchallgfcstmt = $pdo->prepare("SELECT balance_mc FROM gfcmcstock WHERE size='$size' AND commondity_id='$item_id' AND kg='$kg' ORDER BY id DESC");
          $fetchallgfcstmt->execute();
          $fetchallgfcdata = $fetchallgfcstmt->fetch(PDO::FETCH_ASSOC);

          $lastid = $hhkdata['id'];
          $checklast = $pdo->prepare("SELECT * FROM hhkmcstock WHERE id < $lastid AND commondity_id='$item_id' AND size='$size'");
          $checklast->execute();
          $checklastavaliable = $checklast->fetch(PDO::FETCH_ASSOC);
          $lastcommondity = $pdo->prepare("SELECT * FROM hhkmcstock WHERE id < $lastid AND commondity_id='$item_id' AND country='$country'");
          $lastcommondity->execute();
          $lastcommondity = $lastcommondity->fetch(PDO::FETCH_ASSOC);

      // $country = $hhkmcstockdata['country'];
      // $size = $hhkmcstockdata['size'];
      // $kg = $hhkmcstockdata['kg'];
      // $gfcmcstockstmt = $pdo->prepare("SELECT balance_mc FROM gfcmcstock WHERE country='$country' AND commondity_id='$item_id' AND size='$size' AND kg='$kg' ORDER BY id DESC");
      // $gfcmcstockstmt->execute();
      // $gfcmcstockdata = $gfcmcstockstmt->fetch(PDO::FETCH_ASSOC);


      ?>
    <tr style="text-align:center !important;">
      <td><?php if(empty($lastcommondity)){ echo $id;} ?></td>
      <td><?php if(empty($lastcommondity)){ echo $commonditydata['item_name'];} ?></td>
      <td><?php if(empty($lastcommondity)){ echo $country; } ?></td>
      <td><?php if(empty($checklastavaliable)){ echo $size; } ?></td>
      <td><?php echo $kg; ?></td>
      <td><?php if($fetchalldata['balance_mc'] != 0){ echo $fetchalldata['balance_mc'];}else{echo "-";}; ?></td>
      <td><?php if(!empty($fetchallgfcdata['balance_mc'])){ echo $fetchallgfcdata['balance_mc'];}else{echo "-";};  ?></td>
      <td><?php if(!empty($fetchallgfcdata['balance_mc'])){echo $fetchalldata['balance_mc'] + $fetchallgfcdata['balance_mc'];}else{echo $fetchalldata['balance_mc'];};  ?></td>
    </tr>
    <?php
    }
    $hhktotalmcstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM hhkmcstock WHERE commondity_id='$item_id' AND particular LIKE '%from%' AND country='$country'");
    $hhktotalmcstmt->execute();
    $hhktotalmcnotsub = $hhktotalmcstmt->fetch(PDO::FETCH_ASSOC);
    $hhktotalmcsubnumstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM hhkmcstock WHERE commondity_id='$item_id' AND particular LIKE '%to%' AND country='$country'");
    $hhktotalmcsubnumstmt->execute();
    $hhktotalmcsubnum = $hhktotalmcsubnumstmt->fetch(PDO::FETCH_ASSOC);
    $hhktotalmc = $hhktotalmcnotsub['total_mc'] - $hhktotalmcsubnum['total_mc'];

    $gfctotalmcstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM gfcmcstock WHERE commondity_id='$item_id' AND particular LIKE '%to%' AND country='$country'");
    $gfctotalmcstmt->execute();
    $gfctotalmcnotsub = $gfctotalmcstmt->fetch(PDO::FETCH_ASSOC);
    $gfctotalmcsubnumstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM gfcmcstock WHERE commondity_id='$item_id' AND particular NOT LIKE '%to%' AND country='$country'");
    $gfctotalmcsubnumstmt->execute();
    $gfctotalmcsubnum = $gfctotalmcsubnumstmt->fetch(PDO::FETCH_ASSOC);
    $gfctotalmc = $gfctotalmcnotsub['total_mc'] - $gfctotalmcsubnum['total_mc'];

    ?>
    <!-- <tr style="background-color:#c1f5cf;"> -->
    <tr class="text-center">
      <td style="font-weight: bold;">Total</td>
      <td style="font-weight: bold;"></td>
      <td style="font-weight: bold;"></td>
      <td style="font-weight: bold;"></td>
      <td style="font-weight: bold;"></td>
      <td style="font-weight: bold;"><?php if($hhktotalmc != 0){echo $hhktotalmc;}else{echo "-";}; ?></td>
      <td style="font-weight: bold;"><?php if($gfctotalmc != 0){echo $gfctotalmc;}else{echo "-";}; ?></td>
      <td style="font-weight: bold;"><?php if($gfctotalmc != 0 || $hhktotalmc != 0){echo $hhktotalmc + $gfctotalmc;}else{echo "-";}; ?></td>
    </tr>
    <?php
    }
      ?>
  </table>
  <?php
}

if ($_GET['table_name'] == "tclmcstock" && !empty($_GET['date'])) {
     $date = $_GET['date'];
    header("Content-Type: application/xls");
    header("Content-Disposition: attachment; filename=tclmcstock{$date}.xls");
    header("Pragma: no-cache");
    header("Expires: 0");
    $headerstmt = $pdo->prepare("SELECT * FROM tclmcstock WHERE date='$date'");
    $headerstmt->execute();
    $headerdata = $headerstmt->fetch(PDO::FETCH_ASSOC);
    ?>
    <table class="table table-hover table-bordered table-striped" border="1">
      <tr>
        <th>Date</th>
        <th>Fish Name</th>
        <th>Size</th>
        <th>Pcs</th>
        <th>Kg</th>
        <th>Opening Mc</th>
        <th>Form-10 Mc</th>
        <th>Transfer to <?php echo $headerdata['transfer_to_where']; ?></th>
        <th>loading <?php if($headerdata['loading_no'] != 0){ echo $headerdata['loading_no']; }; ?></th>
        <th>Grand Total Mc</th>
      </tr>
    <?php
    $stmt = $pdo->prepare("SELECT * FROM tclmcstock WHERE date='$date'");
    $stmt->execute();
    $datas = $stmt->fetchall();
    foreach ($datas as $tclmcdata) {
      $lastid = $tclmcdata['id'];
      $item_id = $tclmcdata['item_id'];
      $commonditydata = $query->select('item', $item_id, 'item_id');
      $size = $tclmcdata['size'];
      $kg = $tclmcdata['kg'];
      $item_id = $tclmcdata['item_id'];

      $checklast = $pdo->prepare("SELECT * FROM tclmcstock WHERE id < $lastid AND item_id='$item_id' AND size='$size' AND date='$date'");
      $checklast->execute();
      $checklastavaliable = $checklast->fetch(PDO::FETCH_ASSOC);
      $lastcommondity = $pdo->prepare("SELECT * FROM tclmcstock WHERE id < $lastid AND item_id='$item_id' AND date='$date'");
      $lastcommondity->execute();
      $lastcommondity = $lastcommondity->fetch(PDO::FETCH_ASSOC);
      ?>
      <tr>
      <td style="text-align:right;"><?php if(empty($lastcommondity)){ echo date("d-m-Y", strtotime($tclmcdata['date'])); } ?></td>
      <td style="text-align:right;"><?php if(empty($lastcommondity)){ echo $commonditydata['item_name']; } ?></td>
      <td style="text-align:right;"><?php if(empty($checklastavaliable)){ echo $tclmcdata['size']; } ?></td>
      <td style="text-align:right;"><?php echo $tclmcdata['pcs']; ?></td>
      <td style="text-align:right;"><?php echo $tclmcdata['kg']; ?></td>
      <td style="text-align:right;"><?php if($tclmcdata['opening_mc'] != 0){ echo $tclmcdata['opening_mc']; }else{ echo "-";} ?></td>
      <td style="text-align:right;"><?php echo $tclmcdata['form10mc']; ?></td>
      <td style="text-align:right;"><?php if($tclmcdata['transfer_mc'] != 0){ echo $tclmcdata['transfer_mc']; }else{ echo "-";} ?></td>
      <td style="text-align:right;"><?php if($tclmcdata['loading_mc'] != 0){ echo $tclmcdata['loading_mc']; }else{ echo "-";} ?></td>
      <td style="text-align:right;"><?php if($tclmcdata['grandtotal_mc'] != 0){ echo $tclmcdata['grandtotal_mc']; }else{ echo "-";} ?></td>
      </tr>
      <?php
    }
    ?>
    <?php
      $openingmctotalstmt = $pdo->prepare("SELECT SUM(opening_mc) AS openingmc FROM tclmcstock WHERE date='$date'");
      $openingmctotalstmt->execute();
      $openingmctotaldatas = $openingmctotalstmt->fetch(PDO::FETCH_ASSOC);

      $form10mctotalstmt = $pdo->prepare("SELECT SUM(form10mc) AS totalform10mc FROM tclmcstock WHERE date='$date'");
      $form10mctotalstmt->execute();
      $form10mctotaldatas = $form10mctotalstmt->fetch(PDO::FETCH_ASSOC);

      $transfermctotalstmt = $pdo->prepare("SELECT SUM(transfer_mc) AS transfermc FROM tclmcstock WHERE date='$date'");
      $transfermctotalstmt->execute();
      $transfermctotaldatas = $transfermctotalstmt->fetch(PDO::FETCH_ASSOC);

      $loadingmctotalstmt = $pdo->prepare("SELECT SUM(loading_mc) AS loadingmc FROM tclmcstock WHERE date='$date'");
      $loadingmctotalstmt->execute();
      $loadingmctotaldatas = $loadingmctotalstmt->fetch(PDO::FETCH_ASSOC);

      $grandtotalmctotalstmt = $pdo->prepare("SELECT SUM(grandtotal_mc) AS grandtotalmc FROM tclmcstock WHERE date='$date'");
      $grandtotalmctotalstmt->execute();
      $grandtotalmctotaldatas = $grandtotalmctotalstmt->fetch(PDO::FETCH_ASSOC);
     ?>
    <tr>
      <td style="font-weight:bold; text-align:center;" colspan="5">Grand Total</td>
      <td style="font-weight:bold; text-align:right;"><?php if($openingmctotaldatas['openingmc'] != 0){ echo $openingmctotaldatas['openingmc']; }else{ echo "-";} ?></td>
      <td style="font-weight:bold; text-align:right;"><?php if($form10mctotaldatas['totalform10mc'] != 0){ echo $form10mctotaldatas['totalform10mc']; }else{ echo "-";} ?></td>
      <td style="font-weight:bold; text-align:right;"><?php if($transfermctotaldatas['transfermc'] != 0){ echo $transfermctotaldatas['transfermc']; }else{ echo "-";} ?></td>
      <td style="font-weight:bold; text-align:right;"><?php if($loadingmctotaldatas['loadingmc'] != 0){ echo $loadingmctotaldatas['loadingmc']; }else{ echo "-";} ?></td>
      <td style="font-weight:bold; text-align:right;"><?php if($grandtotalmctotaldatas['grandtotalmc'] != 0){ echo $grandtotalmctotaldatas['grandtotalmc']; }else{ echo "-";} ?></td>
    </tr>

    </table>
    <?php
}elseif ($_GET['table_name'] == "tclmcstock" && empty($_GET['date'])){
  header("Content-Type: application/xls");
  header("Content-Disposition: attachment; filename=tclmcstock.xls");
  header("Pragma: no-cache");
  header("Expires: 0");
  $datestmt = $pdo->prepare("SELECT DISTINCT (date) FROM tclmcstock");
  $datestmt->execute();
  $datedatas = $datestmt->fetchall();

  foreach ($datedatas as $datedata) {
    $date = $datedata['date'];

  $headerstmt = $pdo->prepare("SELECT * FROM tclmcstock WHERE date='$date'");
  $headerstmt->execute();
  $headerdata = $headerstmt->fetch(PDO::FETCH_ASSOC);
  ?>
  <table class="table table-hover table-bordered table-striped" border="1">
    <tr>
      <th>Date</th>
      <th>Fish Name</th>
      <th>Size</th>
      <th>Pcs</th>
      <th>Kg</th>
      <th>Opening Mc</th>
      <th>Form-10 Mc</th>
      <th>Transfer to <?php echo $headerdata['transfer_to_where']; ?></th>
      <th>loading <?php if($headerdata['loading_no'] != 0){ echo $headerdata['loading_no']; }; ?></th>
      <th>Grand Total Mc</th>
    </tr>
  <?php
  $stmt = $pdo->prepare("SELECT * FROM tclmcstock WHERE date='$date'");
  $stmt->execute();
  $datas = $stmt->fetchall();
  foreach ($datas as $tclmcdata) {
    $lastid = $tclmcdata['id'];
    $item_id = $tclmcdata['item_id'];
    $commonditydata = $query->select('item', $item_id, 'item_id');
    $size = $tclmcdata['size'];
    $kg = $tclmcdata['kg'];
    $item_id = $tclmcdata['item_id'];

    $checklast = $pdo->prepare("SELECT * FROM tclmcstock WHERE id < $lastid AND item_id='$item_id' AND size='$size' AND date='$date'");
    $checklast->execute();
    $checklastavaliable = $checklast->fetch(PDO::FETCH_ASSOC);
    $lastcommondity = $pdo->prepare("SELECT * FROM tclmcstock WHERE id < $lastid AND item_id='$item_id' AND date='$date'");
    $lastcommondity->execute();
    $lastcommondity = $lastcommondity->fetch(PDO::FETCH_ASSOC);
    ?>
    <tr>
    <td style="text-align:right;"><?php if(empty($lastcommondity)){ echo date("d-m-Y", strtotime($tclmcdata['date'])); } ?></td>
    <td style="text-align:right;"><?php if(empty($lastcommondity)){ echo $commonditydata['item_name']; } ?></td>
    <td style="text-align:right;"><?php if(empty($checklastavaliable)){ echo $tclmcdata['size']; } ?></td>
    <td style="text-align:right;"><?php echo $tclmcdata['pcs']; ?></td>
    <td style="text-align:right;"><?php echo $tclmcdata['kg']; ?></td>
    <td style="text-align:right;"><?php if($tclmcdata['opening_mc'] != 0){ echo $tclmcdata['opening_mc']; }else{ echo "-";} ?></td>
    <td style="text-align:right;"><?php echo $tclmcdata['form10mc']; ?></td>
    <td style="text-align:right;"><?php if($tclmcdata['transfer_mc'] != 0){ echo $tclmcdata['transfer_mc']; }else{ echo "-";} ?></td>
    <td style="text-align:right;"><?php if($tclmcdata['loading_mc'] != 0){ echo $tclmcdata['loading_mc']; }else{ echo "-";} ?></td>
    <td style="text-align:right;"><?php if($tclmcdata['grandtotal_mc'] != 0){ echo $tclmcdata['grandtotal_mc']; }else{ echo "-";} ?></td>
    </tr>
    <?php
  }
  ?>
  <?php
    $openingmctotalstmt = $pdo->prepare("SELECT SUM(opening_mc) AS openingmc FROM tclmcstock WHERE date='$date'");
    $openingmctotalstmt->execute();
    $openingmctotaldatas = $openingmctotalstmt->fetch(PDO::FETCH_ASSOC);

    $form10mctotalstmt = $pdo->prepare("SELECT SUM(form10mc) AS totalform10mc FROM tclmcstock WHERE date='$date'");
    $form10mctotalstmt->execute();
    $form10mctotaldatas = $form10mctotalstmt->fetch(PDO::FETCH_ASSOC);

    $transfermctotalstmt = $pdo->prepare("SELECT SUM(transfer_mc) AS transfermc FROM tclmcstock WHERE date='$date'");
    $transfermctotalstmt->execute();
    $transfermctotaldatas = $transfermctotalstmt->fetch(PDO::FETCH_ASSOC);

    $loadingmctotalstmt = $pdo->prepare("SELECT SUM(loading_mc) AS loadingmc FROM tclmcstock WHERE date='$date'");
    $loadingmctotalstmt->execute();
    $loadingmctotaldatas = $loadingmctotalstmt->fetch(PDO::FETCH_ASSOC);

    $grandtotalmctotalstmt = $pdo->prepare("SELECT SUM(grandtotal_mc) AS grandtotalmc FROM tclmcstock WHERE date='$date'");
    $grandtotalmctotalstmt->execute();
    $grandtotalmctotaldatas = $grandtotalmctotalstmt->fetch(PDO::FETCH_ASSOC);
   ?>
  <tr>
    <td style="font-weight:bold; text-align:center;" colspan="5">Grand Total</td>
    <td style="font-weight:bold; text-align:right;"><?php if($openingmctotaldatas['openingmc'] != 0){ echo $openingmctotaldatas['openingmc']; }else{ echo "-";} ?></td>
    <td style="font-weight:bold; text-align:right;"><?php if($form10mctotaldatas['totalform10mc'] != 0){ echo $form10mctotaldatas['totalform10mc']; }else{ echo "-";} ?></td>
    <td style="font-weight:bold; text-align:right;"><?php if($transfermctotaldatas['transfermc'] != 0){ echo $transfermctotaldatas['transfermc']; }else{ echo "-";} ?></td>
    <td style="font-weight:bold; text-align:right;"><?php if($loadingmctotaldatas['loadingmc'] != 0){ echo $loadingmctotaldatas['loadingmc']; }else{ echo "-";} ?></td>
    <td style="font-weight:bold; text-align:right;"><?php if($grandtotalmctotaldatas['grandtotalmc'] != 0){ echo $grandtotalmctotaldatas['grandtotalmc']; }else{ echo "-";} ?></td>
  </tr>

  </table>
  <?php
}
}

if($_GET['table_name'] == 'actualtruckinvoice'){
  header("Content-Type: application/xls");
  header("Content-Disposition: attachment; filename=actialinvoicetruck.xls");
  header("Pragma: no-cache");
  header("Expires: 0");


    $invoice_no = $_GET['invoice_no'];
    ?>
    <?php

    $infostmt = $pdo->prepare("SELECT * FROM truckpackingliststock WHERE invoice_no='$invoice_no'");
    $infostmt->execute();
    $infodata = $infostmt->fetch(PDO::FETCH_ASSOC);
    ?>
      <table>
        <tr>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td colspan="2"><h3>Actual Invoice</h3> </td>
        </tr>
      </table>
      <table>
        <tr>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td colspan="2">Yangon Loading Date _ <?php echo date('d-m-Y', strtotime($infodata['date']));  ?></td>
        </tr>
        <tr>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td colspan="2">Invoice No _ <?php echo $infodata['invoice_no'];  ?></td>
        </tr>
        <tr>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td colspan="2">Truck No _ <?php echo $infodata['truck_no'];  ?></td>
        </tr>
      </table>
      <div class="actualinvoicetable">
        <table class="table table-striped table-hover table-bordered" border="1">
          <tr>
            <th>No</th>
            <th>Commondity</th>
            <th>Size</th>
            <th>Pcs Per Box</th>
            <th>Packing Kg Per Box</th>
            <th>Mc</th>
            <th>Total Net Weight</th>
            <th>Preice Per Kg (USD)</th>
            <th>Total Value USD</th>
          </tr>
          <?php
          $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT item_id) FROM truckactualinvoice WHERE invoice_no='$invoice_no'");
          $commonditycountstmt->execute();
          $commonditycountdatas = $commonditycountstmt->fetchColumn();
          $no1 = 1;
          for ($i=0; $i < $commonditycountdatas; $i++) {
            $commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM truckactualinvoice WHERE invoice_no='$invoice_no'");
            $commonditystmt->execute();
            $commonditydata = $commonditystmt->fetchall();
            $item_id = $commonditydata[$i]['item_id'];
            $invoice_no = $_GET['invoice_no'];

            $stmt = $pdo->prepare("SELECT * FROM truckactualinvoice WHERE item_id='$item_id' AND invoice_no='$invoice_no' ORDER BY size");
            $stmt->execute();
            $datas = $stmt->fetchall();

            foreach ($datas as $packingstockinfodata) {
              $item_id = $packingstockinfodata['item_id'];
              $commonditydata = $query->select('item', $item_id, 'item_id');
              $lastid = $packingstockinfodata['id'];
              $size = $packingstockinfodata['size'];
              $checklast = $pdo->prepare("SELECT * FROM truckactualinvoice WHERE id < $lastid AND item_id='$item_id' AND size='$size' AND invoice_no='$invoice_no'");
              $checklast->execute();
              $checklastavaliable = $checklast->fetch(PDO::FETCH_ASSOC);
              $lastcommondity = $pdo->prepare("SELECT * FROM truckactualinvoice WHERE id < $lastid AND item_id='$item_id' AND invoice_no='$invoice_no'");
              $lastcommondity->execute();
              $lastcommondity = $lastcommondity->fetch(PDO::FETCH_ASSOC);
                ?>
                <tr data-bs-toggle="modal" data-bs-target="#usdadd<?php echo $packingstockinfodata['id']; ?>">
                  <td><?php if(empty($lastcommondity)){ echo $no1;}; ?></td>
                  <td><?php if(empty($lastcommondity)){ echo $commonditydata['item_name']; }; ?></td>
                  <td><?php if(empty($checklastavaliable)){echo $packingstockinfodata['size'];} ?></td>
                  <td><?php if(empty($checklastavaliable)){echo $packingstockinfodata['pcsperbox'];} ?></td>
                  <td><?php echo $packingstockinfodata['kgperbox']; ?></td>
                  <td><?php echo $packingstockinfodata['mc']; ?></td>
                  <td><?php echo $packingstockinfodata['netweight']; ?></td>
                  <td><?php if($packingstockinfodata['usd'] != 0){ echo $packingstockinfodata['usd'];} ; ?></td>
                  <td><?php if($packingstockinfodata['total_usd'] != 0){ echo $packingstockinfodata['total_usd'];} ; ?></td>
                </tr>
              <?php
              ?>
              <?php
              $item_id = $packingstockinfodata['item_id'];
            }
            $totalmcstmt = $pdo->prepare("SELECT SUM(mc) AS totalmc FROM truckpackingliststockinfo WHERE invoice_no='$invoice_no' AND item_id='$item_id'");
            $totalmcstmt->execute();
            $totalmcdata = $totalmcstmt->fetch(PDO::FETCH_ASSOC);
            $netweightstmt = $pdo->prepare("SELECT SUM(netweight) AS netweight FROM truckpackingliststockinfo WHERE invoice_no='$invoice_no' AND item_id='$item_id'");
            $netweightstmt->execute();
            $netweightdata = $netweightstmt->fetch(PDO::FETCH_ASSOC);
            $totalusdstmt = $pdo->prepare("SELECT SUM(total_usd) AS total_usd FROM truckactualinvoice WHERE invoice_no='$invoice_no' AND item_id='$item_id'");
            $totalusdstmt->execute();
            $totalusddata = $totalusdstmt->fetch(PDO::FETCH_ASSOC);
            ?>
            <tr style="font-weight:bold; background-color: lightgray;">
              <td></td>
              <td>Sub Total</td>
              <td></td>
              <td></td>
              <td></td>
              <td><?php echo $totalmcdata['totalmc']; ?></td>
              <td><?php if(!empty($netweightdata['netweight'])){ echo $netweightdata['netweight']; }; ?></td>
              <td></td>
              <td><?php if($totalusddata['total_usd'] != 0){ echo $totalusddata['total_usd'];} ; ?></td>
            </tr>
            <?php
            $no1++;
          }
          ?>
          <?php
          $item_id = $packingstockinfodata['item_id'];
          $totalusdstmt = $pdo->prepare("SELECT SUM(total_usd) AS total_usd FROM truckactualinvoice WHERE invoice_no='$invoice_no'");
          $totalusdstmt->execute();
          $totalusddata = $totalusdstmt->fetch(PDO::FETCH_ASSOC);
          $mcstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM truckactualinvoice WHERE invoice_no='$invoice_no'");
          $mcstmt->execute();
          $mcdata = $mcstmt->fetch(PDO::FETCH_ASSOC);
          $netweightstmt = $pdo->prepare("SELECT SUM(netweight) AS total_netweight FROM truckactualinvoice WHERE invoice_no='$invoice_no'");
          $netweightstmt->execute();
          $netweightdata = $netweightstmt->fetch(PDO::FETCH_ASSOC);
          $totalusdstmt = $pdo->prepare("SELECT SUM(total_usd) AS total_usd FROM truckactualinvoice WHERE invoice_no='$invoice_no'");
          $totalusdstmt->execute();
          $totalusddata = $totalusdstmt->fetch(PDO::FETCH_ASSOC);
          $foamboxstmt = $pdo->prepare("SELECT SUM(total_foambox_no) AS total_foambox_no FROM truckfoambox WHERE invoice_no='$invoice_no'");
          $foamboxstmt->execute();
          $foamboxdata = $foamboxstmt->fetch(PDO::FETCH_ASSOC);
          ?>
          <tr style="font-weight:bold !important; background-color: lightgray;">
            <td></td>
            <td>Grand Total</td>
            <td></td>
            <td></td>
            <td></td>
            <td><?php echo $mcdata['total_mc']; ?></td>
            <td><?php echo $netweightdata['total_netweight']; ?></td>
            <td></td>
            <td><?php echo $totalusddata['total_usd']; ?></td>
          </tr>
        </table>
        <h5 style="text-transform:uppercase;">Total Foam Box - <?php if(!empty($foamboxdata['total_foambox_no'])){ echo $foamboxdata['total_foambox_no'] . " Box"; }; ?></h5>
        <h5 style="text-transform:uppercase;">Total Net Weight - <?php if(!empty($netweightdata['total_netweight'])){ echo $netweightdata['total_netweight'] . " KGS"; }; ?></h5>
        <h5 style="text-transform:uppercase;">Total Value USD - <?php if(!empty($totalusddata['total_usd'])){ echo $totalusddata['total_usd'] . " USD"; }; ?></h5>
        <br><br>
      </div>
    <?php

}

if($_GET['table_name'] == 'foambox'){
  header("Content-Type: application/xls");
  header("Content-Disposition: attachment; filename=foamboxreport.xls");
  header("Pragma: no-cache");
  header("Expires: 0");

  $invoice_no = $_GET['invoice_no'];
  ?>
  <?php

$infostmt = $pdo->prepare("SELECT * FROM truckpackingliststock WHERE invoice_no='$invoice_no'");
$infostmt->execute();
$infodata = $infostmt->fetch(PDO::FETCH_ASSOC);
?>
  <table>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td colspan="2"><h3>Foam Box</h3></td>
    </tr>
  </table>
  <table>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td colspan="2">Yangon Loading Date _ <?php echo date('d-m-Y', strtotime($infodata['date']));  ?></td>
    </tr>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td colspan="2">Invoice No _ <?php echo $infodata['invoice_no'];  ?></td>
    </tr>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td colspan="2">Truck No _ <?php echo $infodata['truck_no'];  ?></td>
    </tr>
  </table>
  <div class="foamboxtable">
               <table class="table table-striped table-hover table-bordered" border="1">
                 <tr>
                   <th>No</th>
                   <th>Commondity</th>
                   <th>Size</th>
                   <th>Pcs Per Box</th>
                   <th>Kg Per Box</th>
                   <th>Mc</th>
                   <th>Net Weight</th>
                   <th>Foam Box No</th>
                 </tr>
                 <?php
                 $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT item_id) FROM truckfoambox WHERE invoice_no='$invoice_no'");
                 $commonditycountstmt->execute();
                 $commonditycountdatas = $commonditycountstmt->fetchColumn();
                 $no2 = 1;
                 for ($i=0; $i < $commonditycountdatas; $i++) {
                   $commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM truckfoambox WHERE invoice_no='$invoice_no'");
                   $commonditystmt->execute();
                   $commonditydata = $commonditystmt->fetchall();
                   $item_id = $commonditydata[$i]['item_id'];
                   $invoice_no = $_GET['invoice_no'];

                   $stmt = $pdo->prepare("SELECT * FROM truckfoambox WHERE item_id='$item_id' AND invoice_no='$invoice_no' ORDER BY size");
                   $stmt->execute();
                   $datas = $stmt->fetchall();
                   foreach ($datas as $packingstockinfodata) {
                     $item_id = $packingstockinfodata['item_id'];
                     $commonditydata = $query->select('item', $item_id, 'item_id');
                     $lastid = $packingstockinfodata['id'];
                     $size = $packingstockinfodata['size'];
                     $checklast = $pdo->prepare("SELECT * FROM truckfoambox WHERE id < $lastid AND item_id='$item_id' AND size='$size' AND invoice_no='$invoice_no'");
                     $checklast->execute();
                     $checklastavaliable = $checklast->fetch(PDO::FETCH_ASSOC);
                     $lastcommondity = $pdo->prepare("SELECT * FROM truckfoambox WHERE id < $lastid AND item_id='$item_id' AND invoice_no='$invoice_no'");
                     $lastcommondity->execute();
                     $lastcommondity = $lastcommondity->fetch(PDO::FETCH_ASSOC);
                  ?>
                 <tr>
                   <td><?php if(empty($lastcommondity)){ echo $no2;}; ?></td>
                   <td><?php if(empty($lastcommondity)){ echo $commonditydata['item_name']; }; ?></td>
                   <td><?php if(empty($checklastavaliable)){echo $packingstockinfodata['size'];} ?></td>
                   <td><?php echo $packingstockinfodata['pcsperbox']; ?></td>
                   <td><?php echo $packingstockinfodata['kgperbox']; ?></td>
                   <td><?php echo $packingstockinfodata['mc']; ?></td>
                   <td><?php echo $packingstockinfodata['netweight']; ?></td>
                   <td data-bs-toggle="modal" data-bs-target="#addfoambox<?php echo $packingstockinfodata['id']; ?>"><?php echo $packingstockinfodata['foambox_no']; ?></td>
                 </tr>
                 <?php
                 // print_r( explode(",", $packingstockinfodata['foambox_no']));
                  ?>
                 <?php
                 $item_id = $packingstockinfodata['item_id'];
                 }
                 $totalmcstmt = $pdo->prepare("SELECT SUM(mc) AS totalmc FROM truckpackingliststockinfo WHERE invoice_no='$invoice_no' AND item_id='$item_id'");
                 $totalmcstmt->execute();
                 $totalmcdata = $totalmcstmt->fetch(PDO::FETCH_ASSOC);
                 $netweightstmt = $pdo->prepare("SELECT SUM(netweight) AS netweight FROM truckfoambox WHERE invoice_no='$invoice_no' AND item_id='$item_id'");
                 $netweightstmt->execute();
                 $netweightdata = $netweightstmt->fetch(PDO::FETCH_ASSOC);
                 $totalkgperboxstmt = $pdo->prepare("SELECT SUM(kgperbox) AS total_kgperbox FROM truckfoambox WHERE invoice_no='$invoice_no' AND item_id='$item_id'");
                 $totalkgperboxstmt->execute();
                 $totalkgperboxdata = $totalkgperboxstmt->fetch(PDO::FETCH_ASSOC);
                 ?>
                 <tr style="font-weight:bold; background-color: lightgray; <?php if(empty($totalkgperboxdata['total_kgperbox'])){echo 'display:none;';} ?>">
                 <td></td>
                 <td>Sub Total</td>
                 <td></td>
                 <td></td>
                 <td><?php echo $totalkgperboxdata['total_kgperbox']; ?></td>
                 <td><?php echo $totalmcdata['totalmc']; ?></td>
                 <td><?php if(!empty($netweightdata['netweight'])){ echo $netweightdata['netweight']; }; ?></td>
                 <td></td>
                 </tr>
                 <?php
                 $no2++;
               }
                  ?>
                  <?php
                  $item_id = $packingstockinfodata['item_id'];
                  $totalmcstmt = $pdo->prepare("SELECT SUM(mc) AS totalmc FROM truckfoambox WHERE invoice_no='$invoice_no'");
                  $totalmcstmt->execute();
                  $totalmcdata = $totalmcstmt->fetch(PDO::FETCH_ASSOC);
                  $netweightstmt = $pdo->prepare("SELECT SUM(netweight) AS netweight FROM truckfoambox WHERE invoice_no='$invoice_no'");
                  $netweightstmt->execute();
                  $netweightdata = $netweightstmt->fetch(PDO::FETCH_ASSOC);
                  $totalkgperboxstmt = $pdo->prepare("SELECT SUM(kgperbox) AS total_kgperbox FROM truckfoambox WHERE invoice_no='$invoice_no'");
                  $totalkgperboxstmt->execute();
                  $totalkgperboxdata = $totalkgperboxstmt->fetch(PDO::FETCH_ASSOC);
                  $foamboxstmt = $pdo->prepare("SELECT SUM(total_foambox_no) AS total_foambox_no FROM truckfoambox WHERE invoice_no='$invoice_no'");
                  $foamboxstmt->execute();
                  $foamboxdata = $foamboxstmt->fetch(PDO::FETCH_ASSOC);
                   ?>
                  <tr style="font-weight:bold !important; background-color: lightgray;">
                    <td></td>
                    <td>Grand Total</td>
                    <td></td>
                    <td></td>
                    <td><?php echo $totalkgperboxdata['total_kgperbox']; ?></td>
                    <td><?php echo $totalmcdata['totalmc']; ?></td>
                    <td><?php if(!empty($netweightdata['netweight'])){ echo $netweightdata['netweight']; }; ?></td>
                    <td></td>
                  </tr>
               </table>
               <h5 style="text-transform:uppercase;">Total Foam Box - <?php if(!empty($foamboxdata['total_foambox_no'])){ echo $foamboxdata['total_foambox_no'] . " Box"; }; ?></h5>
               <h5 style="text-transform:uppercase;">Total Net Weight - <?php if(!empty($netweightdata['netweight'])){ echo $netweightdata['netweight'] . " KGS"; }; ?></h5>
             </div>
  <?php
}

if($_GET['table_name'] == 'declarepacking'){
  header("Content-Type: application/xls");
  header("Content-Disposition: attachment; filename=declarepackingreport.xls");
  header("Pragma: no-cache");
  header("Expires: 0");
  $invoice_no = $_GET['invoice_no'];
  $infoid = $_GET['infoid'];
  ?>
  <?php

$infostmt = $pdo->prepare("SELECT * FROM truckpackingliststock WHERE invoice_no='$invoice_no'");
$infostmt->execute();
$infodata = $infostmt->fetch(PDO::FETCH_ASSOC);
?>
  <table>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td colspan="2"><h3>Declare Packing List</h3></td>
    </tr>
  </table>
  <table>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td colspan="2">Yangon Loading Date _ <?php echo date('d-m-Y', strtotime($infodata['date']));  ?></td>
    </tr>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td colspan="2">Invoice No _ <?php echo $infodata['invoice_no'];  ?></td>
    </tr>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td colspan="2">Truck No _ <?php echo $infodata['truck_no'];  ?></td>
    </tr>
  </table>
<div class="declaretable">
               <table class="table table-striped table-hover table-bordered" border="1">
                 <tr>
                   <th>No</th>
                   <th>Commondity</th>
                   <th>Size</th>
                   <th>Pcs Per Box</th>
                   <th>Kg Per Box</th>
                   <th>Mc</th>
                   <th>Net Weight</th>
                 </tr>
                 <?php
                 $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT item_id) FROM truckdeclare WHERE invoice_no='$invoice_no'");
                 $commonditycountstmt->execute();
                 $commonditycountdatas = $commonditycountstmt->fetchColumn();
                 $no3 = 1;
                 for ($i=0; $i < $commonditycountdatas; $i++) {
                   $commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM truckdeclare WHERE invoice_no='$invoice_no'");
                   $commonditystmt->execute();
                   $commonditydata = $commonditystmt->fetchall();
                   $item_id = $commonditydata[$i]['item_id'];
                   $invoice_no = $_GET['invoice_no'];

                   $stmt = $pdo->prepare("SELECT * FROM truckdeclare WHERE item_id='$item_id' AND invoice_no='$invoice_no' ORDER BY size");
                   $stmt->execute();
                   $datas = $stmt->fetchall();
                   foreach ($datas as $packingstockinfodata) {
                     $item_id = $packingstockinfodata['item_id'];
                     $commonditydata = $query->select('item', $item_id, 'item_id');
                     $lastid = $packingstockinfodata['id'];
                     $size = $packingstockinfodata['size'];
                     $checklast = $pdo->prepare("SELECT * FROM truckdeclare WHERE id < $lastid AND item_id='$item_id' AND size='$size' AND invoice_no='$invoice_no'");
                     $checklast->execute();
                     $checklastavaliable = $checklast->fetch(PDO::FETCH_ASSOC);
                     $lastcommondity = $pdo->prepare("SELECT * FROM truckdeclare WHERE id < $lastid AND item_id='$item_id' AND invoice_no='$invoice_no'");
                     $lastcommondity->execute();
                     $lastcommondity = $lastcommondity->fetch(PDO::FETCH_ASSOC);
                  ?>
                 <tr data-bs-toggle="modal" data-bs-target="#updatekgperbox<?php echo $packingstockinfodata['id']; ?>">
                   <td><?php if(empty($lastcommondity)){ echo $no3;}; ?></td>
                   <td><?php if(empty($lastcommondity)){ echo $commonditydata['item_name']; }; ?></td>
                   <td><?php if(empty($checklastavaliable)){echo $packingstockinfodata['size'];} ?></td>
                   <td><?php echo $packingstockinfodata['pcsperbox']; ?></td>
                   <td><?php if($packingstockinfodata['kgperbox'] != 0){ echo $packingstockinfodata['kgperbox'];}else{ echo "-"; }; ?></td>
                   <td><?php echo $packingstockinfodata['mc']; ?></td>
                   <td><?php if($packingstockinfodata['netweight'] != 0){ echo $packingstockinfodata['netweight'];}else{ echo "-"; }; ?></td>
                 </tr>
                 <?php
                 // print_r( explode(",", $packingstockinfodata['foambox_no']));
                  ?>
                 <?php
                 $item_id = $packingstockinfodata['item_id'];
                 }
                 $totalmcstmt = $pdo->prepare("SELECT SUM(mc) AS totalmc FROM truckpackingliststockinfo WHERE invoice_no='$invoice_no' AND item_id='$item_id'");
                 $totalmcstmt->execute();
                 $totalmcdata = $totalmcstmt->fetch(PDO::FETCH_ASSOC);
                 $netweightstmt = $pdo->prepare("SELECT SUM(netweight) AS netweight FROM truckdeclare WHERE invoice_no='$invoice_no' AND item_id='$item_id'");
                 $netweightstmt->execute();
                 $netweightdata = $netweightstmt->fetch(PDO::FETCH_ASSOC);
                 $totalkgperboxstmt = $pdo->prepare("SELECT SUM(kgperbox) AS total_kgperbox FROM truckdeclare WHERE invoice_no='$invoice_no' AND item_id='$item_id'");
                 $totalkgperboxstmt->execute();
                 $totalkgperboxdata = $totalkgperboxstmt->fetch(PDO::FETCH_ASSOC);
                 ?>
                 <tr style="font-weight:bold;background-color: lightgray;">
                 <td></td>
                 <td>Sub Total</td>
                 <td></td>
                 <td></td>
                 <td><?php echo $totalkgperboxdata['total_kgperbox']; ?></td>
                 <td><?php echo $totalmcdata['totalmc']; ?></td>
                 <td><?php if(!empty($netweightdata['netweight'])){ echo $netweightdata['netweight']; }; ?></td>
                 </tr>
                 <?php
                 $no3++;
               }
                  ?>
                  <?php
                  $item_id = $packingstockinfodata['item_id'];
                  $totalmcstmt = $pdo->prepare("SELECT SUM(mc) AS totalmc FROM truckdeclare WHERE invoice_no='$invoice_no'");
                  $totalmcstmt->execute();
                  $totalmcdata = $totalmcstmt->fetch(PDO::FETCH_ASSOC);
                  $netweightstmt = $pdo->prepare("SELECT SUM(netweight) AS netweight FROM truckdeclare WHERE invoice_no='$invoice_no'");
                  $netweightstmt->execute();
                  $netweightdata = $netweightstmt->fetch(PDO::FETCH_ASSOC);
                  $totalkgperboxstmt = $pdo->prepare("SELECT SUM(kgperbox) AS total_kgperbox FROM truckdeclare WHERE invoice_no='$invoice_no'");
                  $totalkgperboxstmt->execute();
                  $totalkgperboxdata = $totalkgperboxstmt->fetch(PDO::FETCH_ASSOC);
                  $foamboxstmt = $pdo->prepare("SELECT SUM(total_foambox_no) AS total_foambox_no FROM truckfoambox WHERE invoice_no='$invoice_no'");
                  $foamboxstmt->execute();
                  $foamboxdata = $foamboxstmt->fetch(PDO::FETCH_ASSOC);
                   ?>
                  <tr style="font-weight:bold !important;background-color: lightgray;">
                    <td></td>
                    <td>Grand Total</td>
                    <td></td>
                    <td></td>
                    <td><?php echo $totalkgperboxdata['total_kgperbox']; ?></td>
                    <td><?php echo $totalmcdata['totalmc']; ?></td>
                    <td><?php if(!empty($netweightdata['netweight'])){ echo $netweightdata['netweight']; }; ?></td>
                  </tr>
               </table>
               <h5 style="text-transform:uppercase;">Total Foam Box - <?php if(!empty($foamboxdata['total_foambox_no'])){ echo $foamboxdata['total_foambox_no'] . " Box"; }; ?></h5>
               <h5 style="text-transform:uppercase;">Total Net Weight - <?php if(!empty($netweightdata['netweight'])){ echo $netweightdata['netweight'] . " KGS"; }; ?></h5>
             </div>
  <?php
}

if($_GET['table_name'] == 'truckactualpackinglist'){
  header("Content-Type: application/xls");
  header("Content-Disposition: attachment; filename=truckactualpackinglistreport.xls");
  header("Pragma: no-cache");
  header("Expires: 0");
  $invoice_no = $_GET['invoice_no'];
  ?>
  <?php

$infostmt = $pdo->prepare("SELECT * FROM truckpackingliststock WHERE invoice_no='$invoice_no'");
$infostmt->execute();
$infodata = $infostmt->fetch(PDO::FETCH_ASSOC);
?>
  <table>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td colspan="2"><h3>Actual Packing List</h3> </td>
    </tr>
  </table>
  <table>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td colspan="2">Yangon Loading Date _ <?php echo date('d-m-Y', strtotime($infodata['date']));  ?></td>
    </tr>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td colspan="2">Invoice No _ <?php echo $infodata['invoice_no'];  ?></td>
    </tr>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td colspan="2">Truck No _ <?php echo $infodata['truck_no'];  ?></td>
    </tr>
  </table>
  <div class="packingstocktable">
                  <table class="table table-striped table-hover table-bordered" border="1">
                    <tr>
                      <th>No</th>
                      <th>Commondity</th>
                      <th>Size</th>
                      <th>Pcs Per Box</th>
                      <th>Packing Kg Per Box</th>
                      <th>Mc</th>
                      <th>Total Net Weight</th>
                      <th>Total Gross Weight</th>
                      <th>Action</th>
                    </tr>
                    <?php
                    $invoice_no = $_GET['invoice_no'];
                    $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT item_id) FROM truckactualinvoice WHERE invoice_no='$invoice_no'");
                    $commonditycountstmt->execute();
                    $commonditycountdatas = $commonditycountstmt->fetchColumn();
                    $no = 1;
                    for ($i=0; $i < $commonditycountdatas; $i++) {
                      $commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM truckactualinvoice WHERE invoice_no='$invoice_no'");
                      $commonditystmt->execute();
                      $commonditydata = $commonditystmt->fetchall();
                      $item_id = $commonditydata[$i]['item_id'];
                      $invoice_no = $_GET['invoice_no'];

                          $stmt = $pdo->prepare("SELECT * FROM truckpackingliststockinfo WHERE item_id='$item_id' AND invoice_no='$invoice_no' ORDER BY size");
                          $stmt->execute();
                          $datas = $stmt->fetchall();
                          foreach ($datas as $packingstockinfodata) {
                            $item_id = $packingstockinfodata['item_id'];
                            $commonditydata = $query->select('item', $item_id, 'item_id');
                            $lastid = $packingstockinfodata['id'];
                            $size = $packingstockinfodata['size'];
                            $invoice_no = $packingstockinfodata['invoice_no'];
                            $checklast = $pdo->prepare("SELECT * FROM truckpackingliststockinfo WHERE id < $lastid AND item_id='$item_id' AND size='$size' AND invoice_no='$invoice_no'");
                            $checklast->execute();
                            $checklastavaliable = $checklast->fetch(PDO::FETCH_ASSOC);
                            $lastcommondity = $pdo->prepare("SELECT * FROM truckpackingliststockinfo WHERE id < $lastid AND item_id='$item_id' AND invoice_no='$invoice_no'");
                            $lastcommondity->execute();
                            $lastcommondity = $lastcommondity->fetch(PDO::FETCH_ASSOC);
                         ?>
                        <tr>
                          <td><?php if(empty($lastcommondity)){ echo $no;}; ?></td>
                          <td><?php if(empty($lastcommondity)){ echo $commonditydata['item_name']; }; ?></td>
                          <td><?php if(empty($checklastavaliable)){echo $packingstockinfodata['size'];} ?></td>
                          <td><?php if(empty($checklastavaliable)){echo $packingstockinfodata['pcsperbox'];} ?></td>
                          <td><?php echo $packingstockinfodata['kgperbox']; ?></td>
                          <td><?php echo $packingstockinfodata['mc']; ?></td>
                          <td><?php echo $packingstockinfodata['netweight']; ?></td>
                          <td><?php echo $packingstockinfodata['totalgrossweight']; ?></td>
                          <td>
                            <button type="button" data-bs-toggle="modal" data-bs-target="#actualpackinglisteditmodal<?= $packingstockinfodata['id']; ?>" class="btn btn-warning btn-sm text-light"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                              </svg></button>
                          </td>
                        </tr>
                        <?php
                        $item_id = $packingstockinfodata['item_id'];
                        }
                        $totalmcstmt = $pdo->prepare("SELECT SUM(mc) AS totalmc FROM truckpackingliststockinfo WHERE invoice_no='$invoice_no' AND item_id='$item_id'");
                        $totalmcstmt->execute();
                        $totalmcdata = $totalmcstmt->fetch(PDO::FETCH_ASSOC);
                        $netweightstmt = $pdo->prepare("SELECT SUM(netweight) AS netweight FROM truckpackingliststockinfo WHERE invoice_no='$invoice_no' AND item_id='$item_id'");
                        $netweightstmt->execute();
                        $netweightdata = $netweightstmt->fetch(PDO::FETCH_ASSOC);
                        $totalgrssweightstmt = $pdo->prepare("SELECT SUM(totalgrossweight) AS totalgrossweight FROM truckpackingliststockinfo WHERE invoice_no='$invoice_no' AND item_id='$item_id'");
                        $totalgrssweightstmt->execute();
                        $totalgrssweightdata = $totalgrssweightstmt->fetch(PDO::FETCH_ASSOC);
                        ?>
                        <tr style="font-weight:bold;background-color: lightgray;">
                        <td></td>
                        <td>Sub Total</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td><?php echo $totalmcdata['totalmc']; ?></td>
                        <td><?php if(!empty($netweightdata['netweight'])){ echo $netweightdata['netweight']; }; ?></td>
                        <td><?php if(!empty($totalgrssweightdata['totalgrossweight'])){ echo $totalgrssweightdata['totalgrossweight']; }; ?></td>
                        <td></td>
                        </tr>
                        <?php
                        $no++;
                      }
                     ?>
                     <?php
                     $item_id = $packingstockinfodata['item_id'];
                     $totalmcstmt = $pdo->prepare("SELECT SUM(mc) AS totalmc FROM truckpackingliststockinfo WHERE invoice_no='$invoice_no'");
                     $totalmcstmt->execute();
                     $totalmcdata = $totalmcstmt->fetch(PDO::FETCH_ASSOC);
                     $netweightstmt = $pdo->prepare("SELECT SUM(netweight) AS netweight FROM truckpackingliststockinfo WHERE invoice_no='$invoice_no'");
                     $netweightstmt->execute();
                     $netweightdata = $netweightstmt->fetch(PDO::FETCH_ASSOC);
                     $totalgrssweightstmt = $pdo->prepare("SELECT SUM(totalgrossweight) AS totalgrossweight FROM truckpackingliststockinfo WHERE invoice_no='$invoice_no'");
                     $totalgrssweightstmt->execute();
                     $totalgrssweightdata = $totalgrssweightstmt->fetch(PDO::FETCH_ASSOC);
                     $foamboxstmt = $pdo->prepare("SELECT SUM(total_foambox_no) AS total_foambox_no FROM truckfoambox WHERE invoice_no='$invoice_no'");
                     $foamboxstmt->execute();
                     $foamboxdata = $foamboxstmt->fetch(PDO::FETCH_ASSOC);
                      ?>
                     <tr style="background-color: lightgray;">
                       <td></td>
                       <td style="font-weight:bold !important;">Grand Total</td>
                       <td></td>
                       <td></td>
                       <td></td>
                       <td style="font-weight:bold !important;"><?php echo $totalmcdata['totalmc']; ?></td>
                       <td style="font-weight:bold !important;"><?php if(!empty($netweightdata['netweight'])){ echo $netweightdata['netweight']; }; ?></td>
                       <td style="font-weight:bold !important;"><?php if(!empty($totalgrssweightdata['totalgrossweight'])){ echo $totalgrssweightdata['totalgrossweight']; }; ?></td>
                       <td></td>
                     </tr>
                  </table>
                  <h5 style="text-transform:uppercase;">Total Foam Box - <?php if(!empty($foamboxdata['total_foambox_no'])){ echo $foamboxdata['total_foambox_no'] . " Box"; }; ?></h5>
                  <h5 style="text-transform:uppercase;">Total Net Weight - <?php if(!empty($netweightdata['netweight'])){ echo $netweightdata['netweight'] . " KGS"; }; ?></h5>
                  <h5 style="text-transform:uppercase;">Total Gross Weight - <?php if(!empty($totalgrssweightdata['totalgrossweight'])){ echo $totalgrssweightdata['totalgrossweight'] . " KGS"; }; ?></h5>
                </div>
<?php
}

  if ($_GET['table_name'] == 'form_10_tcl') {
    $commondity_id = $_GET['searchcommondity'];
    $searchdate = $_GET['searchdate'];
    header("Content-Type: application/xls");
    header("Content-Disposition: attachment; filename=%file{$searchdate}.xls");
    header("Pragma: no-cache");
    header("Expires: 0");
      ?>
      <table class="table table-hover table-striped table-bordered" border="1">
        <tr class="text-center">
          <th rowspan="2" style="padding-top:25px;">Receiving Date</th>
          <th rowspan="2" style="padding-top:25px;">Commondity</th>
          <!-- <th rowspan="2" style="padding-top:25px;">Country</th> -->
          <!-- <th rowspan="2" style="padding-top:25px;">Type</th> -->
          <th rowspan="2" style="padding-top:25px;">Size</th>
          <th rowspan="2" style="padding-top:25px;">Raw Viss</th>
          <th rowspan="2" style="padding-top:25px;">Pcs</th>
          <th rowspan="2" style="padding-top:25px;">Kg</th>
          <th colspan="4">Form 10</th>
          <th colspan="2">Loose In</th>
          <th colspan="2">Loose Out</th>
          <th colspan="2">CC Balance</th>
          <th colspan="2">လမ်းငါး</th>
          <th colspan="2">Cut Piece</th>
          <th colspan="2">HHK</th>
          <th colspan="2">MSL</th>
          <th>Total</th>
          <th rowspan="2" style="padding-top:25px;">%</th>
        </tr>
        <tr class="text-center">
          <th>Size</th>
          <th>MC</th>
          <th>KG</th>
          <th>Pcs</th>
          <th>Kg</th>
          <th>Pcs</th>
          <th>Kg</th>
          <th>Pcs</th>
          <th>Kg</th>
          <th>Pcs</th>
          <th>Kg</th>
          <th>Pcs</th>
          <th>Kg</th>
          <th>Pcs</th>
          <th>Kg</th>
          <th>Pcs</th>
          <th>Kg</th>
          <th>Pcs</th>
          <th>Kg</th>
        </tr>
        <?php
          $stmt = $pdo->prepare("SELECT * FROM form10stocktcl WHERE item_id='$commondity_id' AND date='$searchdate'");
          $stmt->execute();
          $datas = $stmt->fetchall();
          foreach ($datas as $data) {
            $item_id = $data['item_id'];
            $size = $data['size'];
            $commonditydata = $query->select('item', $item_id, 'item_id');
            $supplierid = $data['supplier_id'];
            $supplier_name = $query->select('acname', $supplierid, 'code_no');

            $raw_viss_tmt = $pdo->prepare("SELECT SUM(viss) AS raw_viss FROM form7stocktcl WHERE item_id='$item_id' AND size='$size'");
            $raw_viss_tmt->execute();
            $raw_viss_datas = $raw_viss_tmt->fetch(PDO::FETCH_ASSOC);

            $raw_kg_stmt = $pdo->prepare("SELECT SUM(kg) AS total_kg FROM form7stocktcl WHERE item_id='$item_id' AND size='$size'");
            $raw_kg_stmt->execute();
            $raw_kg_datas = $raw_kg_stmt->fetch(PDO::FETCH_ASSOC);
          ?>
          <tr>
            <td><?php echo date('d-m-Y', strtotime($data['date'])); ?></td>
            <td><?php echo $commonditydata['item_name']; ?></td>
            <td><?php echo $data['size']; ?></td>
            <td><?php echo $raw_viss_datas['raw_viss']; ?></td>
            <td><?php echo $data['size']; ?></td>
            <td><?php echo round($raw_kg_datas['total_kg'], 2); ?></td>
            <td><?php echo $data['size']; ?></td>
            <td><?php echo $data['mc']; ?></td>
            <td><?php echo $data['kg']; ?></td>
            <td><?php echo $data['pcs']; ?></td>
            <td><?php echo $data['looseinkg']; ?></td>
            <td><?php echo $data['looseinpcs']; ?></td>
            <td><?php echo $data['looseoutkg']; ?></td>
            <td><?php echo $data['looseoutpcs']; ?></td>
            <td><?php echo $data['cc_kg']; ?></td>
            <td><?php echo $data['cc_pcs']; ?></td>
            <td><?php echo $data['lanfish_kg']; ?></td>
            <td><?php echo $data['lanfish_pcs']; ?></td>
            <td><?php echo $data['cutpiece_kg']; ?></td>
            <td><?php echo $data['cutpiece_pcs']; ?></td>
            <td><?php echo $data['hhk_kg']; ?></td>
            <td><?php echo $data['hhk_pcs']; ?></td>
            <td><?php echo $data['msl_kg']; ?></td>
            <td><?php echo $data['msl_pcs']; ?></td>
            <td><?php echo round($data['total_kg'], 2); ?></td>
            <td></td>
          </tr>
          <?php
          }

          $lastsearchdatestmt = $pdo->prepare("SELECT * FROM form10stocktcl WHERE date<'$searchdate' ORDER BY id DESC");
          $lastsearchdatestmt->execute();
          $lastsearchdate = $lastsearchdatestmt->fetch(PDO::FETCH_ASSOC);
          if(!empty($lastsearchdate['date'])){
            $lastsearchdate = $lastsearchdate['date'];
          }else{
            $lastsearchdate = 0000-00-00;
          }
          $totalf7kgstmt = $pdo->prepare("SELECT SUM(kg) AS total_kg FROM form7stocktcl WHERE item_id='$commondity_id' AND date BETWEEN '$lastsearchdate' AND '$searchdate'");
          $totalf7kgstmt->execute();
          $totalf7kgdata = $totalf7kgstmt->fetch(PDO::FETCH_ASSOC);

          $totalf7vissstmt = $pdo->prepare("SELECT SUM(viss) AS raw_viss FROM form7stocktcl WHERE item_id='$commondity_id' AND date BETWEEN '$lastsearchdate' AND '$searchdate'");
          $totalf7vissstmt->execute();
          $totalf7vissdata = $totalf7vissstmt->fetch(PDO::FETCH_ASSOC);
          // echo $totalf7kgdata['total_kg'];
          $totalkgstmt = $pdo->prepare("SELECT SUM(total_kg) AS total_kg FROM form10stocktcl WHERE item_id='$commondity_id' AND date='$searchdate'");
          $totalkgstmt->execute();
          $totalkgdata = $totalkgstmt->fetch(PDO::FETCH_ASSOC);
          $result1 = round($totalkgdata['total_kg'], 2) - round($totalf7kgdata['total_kg'], 2);
          if(round($totalf7kgdata['total_kg']) == 0){
            $percentage = "";
          }else{
            $result2 = $result1 / round($totalf7kgdata['total_kg'], 2);
            $percentage = $result2 * 100;
          }


          $form10pcsstmt = $pdo->prepare("SELECT SUM(pcsform10) AS total_form10_pcs FROM form10stocktcl WHERE item_id='$commondity_id' AND date='$searchdate'");
          $form10pcsstmt->execute();
          $form10pcsdata = $form10pcsstmt->fetch(PDO::FETCH_ASSOC);

          $totalkgstmt = $pdo->prepare("SELECT SUM(total_kg) AS total_kg FROM form10stocktcl WHERE item_id='$commondity_id' AND date='$searchdate'");
          $totalkgstmt->execute();
          $totalkgdata = $totalkgstmt->fetch(PDO::FETCH_ASSOC);
          $totalkgdata['total_kg'];
          $mcstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM form10stocktcl WHERE item_id='$commondity_id'");
          $mcstmt->execute();
          $mcdata = $mcstmt->fetch(PDO::FETCH_ASSOC);

          $kgstmt = $pdo->prepare("SELECT SUM(kg) AS kg FROM form10stocktcl WHERE item_id='$commondity_id'");
          $kgstmt->execute();
          $kgdata = $kgstmt->fetch(PDO::FETCH_ASSOC);
          ?>
          <tr>
          <td style="font-weight:bold;">Total</td>
          <td></td>
          <td></td>
          <td><?php echo round($totalf7vissdata['raw_viss'], 2); ?></td>
          <td></td>
          <td></td>
          <td></td>
          <td style="font-weight:bold;"><?php echo round($mcdata['total_mc'], 2); ?></td>
          <td style="font-weight:bold;"><?php echo round($kgdata['kg'], 2); ?></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td style="font-weight:bold;"><?php echo round($totalkgdata['total_kg'], 2); ?></td>
            <td style="font-weight:bold; <?php if(strpos(round($percentage, 2), '-') !== false){echo 'color:red;';} ?>"><?php echo round($percentage, 2). "%"; ?></td>
          </tr>
      </table>
      <?php
  }



if($_GET['table_name'] == 'trucktotalcosting'){
  header("Content-Type: application/xls");
  header("Content-Disposition: attachment; filename=trucktotalcosting.xls");
  header("Pragma: no-cache");
  header("Expires: 0");
  $invoice_no = $_GET['invoice_no'];
?>
  <table>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td colspan="2"><h3>Total Cosing</h3></td>
    </tr>
  </table>
  <?php
        $invoice_no = $_GET['invoice_no'];

        $invoice_nostmt = $pdo->prepare("SELECT * FROM truckpackingliststock WHERE invoice_no='$invoice_no'");
        $invoice_nostmt->execute();
        $invoice_nodata = $invoice_nostmt->fetch(PDO::FETCH_ASSOC);
        ?>

        <table>
          <tr>
            <td colspan="14"></td>
            <td colspan="2">
              Date : <?php echo date('d-m-Y', strtotime($invoice_nodata['date']));  ?>
            </td>
          </tr>
          <tr>
            <td colspan="14"></td>
            <td colspan="2">
              Invoice No : <?php echo $invoice_nodata['invoice_no'];  ?>
            </td>
          </tr>
        </table>
          <br>
        <div class="total_charges">
          <table class="table table-striped table-hover table-bordered text-center" border>
            <tr>
              <!-- <th rowspan="2" style="padding-top:40px;">Date</th> -->
              <th style="padding-top:10px !important;">Commondity</th>
              <th style="padding-top:10px !important;">Size</th>
              <th style="padding-top:10px !important;">Export total_kg</th>
              <th style="padding-top:10px !important;">Price Per Viss</th>
              <th style="padding-top:10px !important;">Price Per Kg</th>
              <th style="padding-top:20px !important;">%</th>
              <th style="padding-top:10px !important;">Packing Charges</th>
              <th style="padding: 13px !important;">Grand Total</th>
              <th style="padding: 13px !important;">Dollar Rate</th>
              <th style="padding: 13px !important;">Costing USD</th>
              <th style="padding: 13px !important;">Selling Rate</th>
              <th style="padding: 13px !important;">Profit Per Kg</th>
              <?php
              $stmt = $pdo->prepare("SELECT * FROM trucktotalcosting WHERE invoice_no='$invoice_no'");
              $stmt->execute();
              $datas = $stmt->fetch(PDO::FETCH_ASSOC);
              if (!empty($datas)) {
                if ($datas['mtorst'] === "To MT") {
                  ?>
                  <th style="padding-top:10px !important;">YGN To MT</th>
                  <th style="padding-top:10px !important;">Mt To Technck</th>
                  <?php
                }else{
                  ?>
                  <th style="padding-top:10px !important;">YGN To ST</th>
                  <th style="padding-top:10px !important;">St To Technck</th>
                  <?php
                }
              }
                ?>
                <th style="padding-top:10px !important;">Labour Charges</th>
                <th style="padding-top:10px !important;">Packing & Transport</th>
              </tr>
            <?php
            $stmt = $pdo->prepare("SELECT * FROM trucktotalcosting WHERE invoice_no='$invoice_no' GROUP BY size,item_id ORDER BY id");
            $stmt->execute();
            $datas = $stmt->fetchall();
            foreach ($datas as $data) {
              $item_id = $data['item_id'];
              $commonditydata = $query->select('item', $item_id, 'item_id');
              $size = $data['size'];
              $lastid = $data['id'];
              $invoice_no = $_GET['invoice_no'];
              $ttlkgstmt = $pdo->prepare("SELECT SUM(total_kg) AS total_kg FROM trucktotalcosting WHERE size='$size' AND item_id='$item_id' AND invoice_no='$invoice_no'");
              $ttlkgstmt->execute();
              $ttlkgdata = $ttlkgstmt->fetch(PDO::FETCH_ASSOC);
              $checklast = $pdo->prepare("SELECT * FROM trucktotalcosting WHERE id < $lastid AND invoice_no='$invoice_no' AND item_id='$item_id' AND size='$size'");
              $checklast->execute();
              $checklastavaliable = $checklast->fetch(PDO::FETCH_ASSOC);
              $lastcommondity = $pdo->prepare("SELECT * FROM trucktotalcosting WHERE id < $lastid AND invoice_no='$invoice_no' AND item_id='$item_id'");
              $lastcommondity->execute();
              $lastcommondity = $lastcommondity->fetch(PDO::FETCH_ASSOC);
              ?>
              <tr data-bs-toggle='modal' data-bs-target="#updatetotalcosting<?php echo $data['id']; ?>">
                <td><?php if(empty($lastcommondity)){ echo $commonditydata['item_name']; }; ?></td>
                <td><?php if(empty($checklastavaliable)){echo $data['size'];} ?></td>
                <td><?php if($ttlkgdata['total_kg'] != 0){echo $ttlkgdata['total_kg'];}else{ echo "-";} ?></td>
                <td><?php if($data['priceperviss'] != 0){echo $data['priceperviss'];}else{ echo "-";} ?></td>
                <td><?php if($data['priceperkg'] != 0){echo $data['priceperkg'];}else{ echo "-";} ?></td>
                <td><?php if($data['percentage'] != 0){echo $data['percentage'];}else{ echo "-";} ?></td>
                <td><?php if($data['packing_charges'] != 0){echo $data['packing_charges'];}else{ echo "-";} ?></td>
                <td><?php if($data['ygntomtorst_charges'] != 0){echo $data['ygntomtorst_charges'];}else{ echo "-";} ?></td>
                <td><?php if($data['mtorsttotechnck_charges'] != 0){echo $data['mtorsttotechnck_charges'];}else{ echo "-";} ?></td>
                <td><?php if($data['labour_charges'] != 0){echo $data['labour_charges'];}else{ echo "-";} ?></td>
                <td><?php if($data['packingandtransport'] != 0){echo $data['packingandtransport'];}else{ echo "-";} ?></td>
                <td><?php if($data['grand_total'] != 0){ echo $data['grand_total']; }else{ echo '-';} ?></td>
                <td><?php if($data['rate'] != 0){ echo $data['rate']; }else{ echo '-';} ?></td>
                <td><?php if(round($data['costing_usd'], 2) != 0){ echo round($data['costing_usd'], 2); }else{ echo '-';} ?></td>
                <td><?php if($data['selling_rate'] != 0){ echo $data['selling_rate']; }else{ echo '-';} ?></td>
                <td><?php if($data['profitperkg'] != 0){ echo round($data['profitperkg'], 2); }else{ echo '-';} ?></td>
              </tr>
              <?php
            }
              ?>
          </table>
        </div>
  <?php
}

if($_GET['table_name'] == 'truckpackingmaterial'){
  header("Content-Type: application/xls");
  header("Content-Disposition: attachment; filename=truckpackingmaterial.xls");
  header("Pragma: no-cache");
  header("Expires: 0");
  $invoice_no = $_GET['invoice_no'];
?>
  <table>
    <tr>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td colspan="2"><h3>Truck Packing Material Charges</h3></td>
      <!-- <td colspan="2"><h3>Costing</h3></td> -->
    </tr>
  </table>
  <?php
        $invoice_no = $_GET['invoice_no'];

        $invoice_nostmt = $pdo->prepare("SELECT * FROM truckpackingliststock WHERE invoice_no='$invoice_no'");
        $invoice_nostmt->execute();
        $invoice_nodata = $invoice_nostmt->fetch(PDO::FETCH_ASSOC);
        ?>

        <table>
          <tr>
            <td colspan="11"></td>
            <td colspan="2">
              Date : <?php echo date('d-m-Y', strtotime($invoice_nodata['date']));  ?>
            </td>
          </tr>
          <tr>
            <td colspan="11"></td>
            <td colspan="2">
              Invoice No : <?php echo $invoice_nodata['invoice_no'];  ?>
            </td>
          </tr>
        </table>
        <table class="table table-striped table-hover table-bordered mt-2 text-center" border>
              <tr>
                <th rowspan="2" style="padding-top:30px;">No</th>
                <th rowspan="2" style="padding-top:30px; padding-left: 40px; padding-right:40px;">Date</th>
                <th colspan="2">Other</th>
                <th colspan="3">Packing Material</th>
                <th rowspan="2" style="padding-top:30px;">Total Charges</th>
                <th rowspan="2" style="padding-top:30px;">Total Viss</th>
                <th rowspan="2" style="padding-top:30px;">Form10 Kg</th>
                <th rowspan="2" style="padding-top:30px;">Cost</th>
                <th rowspan="2" style="padding-top:30px;">Remark</th>
              </tr>
              <tr>
                <th>Ice</th>
                <th>Miscellous</th>
                <th>Tape</th>
                <th>Foam Box</th>
                <th>Plastic</th>
              </tr>
              <?php
              $stmt = $pdo->prepare("SELECT * FROM truckpackingmaterial WHERE invoice_no='$invoice_no'");
              $stmt->execute();
              $datas = $stmt->fetchall();
              $i = 1;
              foreach ($datas as $data) {
               ?>
              <tr>
                <td><?php echo $i; ?></td>
                <td><?php echo date('d-m-Y', strtotime($data['date'])); ?></td>
                <td><?php echo $data['ice']; ?></td>
                <td><?php echo $data['miscellous']; ?></td>
                <td><?php echo $data['tape']; ?></td>
                <td><?php echo $data['foam_box']; ?></td>
                <td><?php echo $data['plastic']; ?></td>
                <td><?php echo $data['total_charges']; ?></td>
                <td><?php echo $data['total_viss']; ?></td>
                <td><?php echo $data['form10kg']; ?></td>
                <td></td>
                <td><?php echo $data['remark']; ?></td>
              </tr>
              <tr style="font-weight:bold;">
                <td></td>
                <td>Cost Per Kg</td>
                <td><?php echo round($data['ice'] / $data['form10kg'], 2); ?></td>
                <td><?php echo round($data['miscellous'] / $data['form10kg'], 2); ?></td>
                <td><?php echo round($data['tape'] / $data['form10kg'], 2); ?></td>
                <td><?php echo round($data['foam_box'] / $data['form10kg'], 2); ?></td>
                <td><?php echo round($data['plastic'] / $data['form10kg'], 2); ?></td>
                <td></td>
                <td></td>
                <td><?php echo $data['form10kg']; ?></td>
                <td><?php echo $data['costperkg']; ?></td>
                <td></td>
              </tr>
              <?php
              $i++;
              }
               ?>
            </table>
  <?php
}

if ($_GET['table_name'] == "form10frozen") {
  $commondity_id = $_GET['commondity'];
  $country = $_GET['country'];
  $searchdate = $_GET['searchdate'];
  header("Content-Type: application/xls");
  header("Content-Disposition: attachment; filename=percentage{$searchdate}.xls");
  header("Pragma: no-cache");
  header("Expires: 0");
  ?>
  <table>
    <tr>
      <th width="800px">
        <span style="font-weight:bold;">HHK Percentage</span>
      </th>
      <th></th>
      <th>
        <span style="font-weight:bold;"><?php echo date('d-m-Y', strtotime($_GET['searchdate'])); ?></span>
      </th>
    </tr>
  </table>
  <table class="table table-hover table-striped table-bordered" border="1">
    <tr class="text-center">
      <th rowspan="2">Date</th>
      <th rowspan="2">Fish Name</th>
      <th rowspan="2">Supplier Name</th>
      <th rowspan="2">Country</th>
      <th rowspan="2">Size</th>
      <th colspan="4">Raw</th>
      <th rowspan="2">Date</th>
      <th colspan="4">Production</th>
      <th colspan="2">Loose In</th>
      <th colspan="2">Loose Out</th>
      <th>Total</th>
      <th rowspan="2">%</th>
    </tr>
    <tr class="text-center">
      <th>Viss</th>
      <th>Kg</th>
      <th>Pcs/vr</th>
      <th>Pcs/f-7</th>
      <th>PCS/Form-10</th>
      <th>MC</th>
      <th>KG</th>
      <th>Pcs</th>
      <th>Kg</th>
      <th>Pcs</th>
      <th>Kg</th>
      <th>Pcs</th>
      <th>Kg</th>
    </tr>
    <?php
      $stmt = $pdo->prepare("SELECT * FROM form10stock WHERE item_id='$commondity_id' AND country='$country' AND date='$searchdate'");
      $stmt->execute();
      $datas = $stmt->fetchall();
      foreach ($datas as $data) {
        $item_id = $data['item_id'];
        $lastid = $data['id'];
        $country = $data['country'];
        $size = $data['size'];
        $date = $data['date'];
        $commonditydata = $query->select('item', $item_id, 'item_id');
        $supplierid = $data['supplier_id'];
        $supplier_name = $query->select('acname', $supplierid, 'code_no');

        $form7datastmt = $pdo->prepare("SELECT * FROM form7stock WHERE item_id='$item_id' AND country='$country' AND size='$size' AND supplier_name='$supplierid' AND date<'$date'");
        $form7datastmt->execute();
        $form7datas = $form7datastmt->fetch(PDO::FETCH_ASSOC);
        $itemid = $form7datas['item_id'];
        $supplierid = $form7datas['supplier_name'];
        $commonditydata2 = $query->select('item', $itemid, 'item_id');
        $supplier_name2 = $query->select('acname', $supplierid, 'code_no');

        $checklast = $pdo->prepare("SELECT * FROM form10stock WHERE id < $lastid AND item_id='$item_id' AND size='$size'");
        $checklast->execute();
        $checklastavaliable = $checklast->fetch(PDO::FETCH_ASSOC);
        $lastcommondity = $pdo->prepare("SELECT * FROM form10stock WHERE id < $lastid AND item_id='$item_id'");
        $lastcommondity->execute();
        $lastcommondity = $lastcommondity->fetch(PDO::FETCH_ASSOC);

        $checklast2 = $pdo->prepare("SELECT * FROM form7stock WHERE id < $lastid AND item_id='$item_id' AND size='$size'");
        $checklast2->execute();
        $checklastavaliable2 = $checklast2->fetch(PDO::FETCH_ASSOC);
        $lastcommondity2 = $pdo->prepare("SELECT * FROM form7stock WHERE id < $lastid AND item_id='$item_id'");
        $lastcommondity2->execute();
        $lastcommondity2 = $lastcommondity2->fetch(PDO::FETCH_ASSOC);
      ?>
      <tr>
        <td><?php if(empty($lastcommondity)){if($form7datas['date'] != "0000-00-00"){ echo date('d-m-Y', strtotime($form7datas['date'])); }} ?></td>
        <td><?php if(empty($lastcommondity)){  echo $commonditydata2['item_name']; } ?></td>
        <td><?php if(empty($lastcommondity)){ echo $supplier_name2['ac_name']; } ?></td>
        <td><?php if(empty($lastcommondity)){ echo $form7datas['country']; } ?></td>
        <td><?php echo $form7datas['size']; ?></td>
        <td><?php echo $form7datas['viss']; ?></td>
        <td><?php echo $form7datas['kg']; ?></td>
        <td><?php echo $form7datas['pcspervr']; ?></td>
        <td><?php echo $form7datas['pcsperf7']; ?></td>
        <td><?php if(empty($lastcommondity)){ echo $data['date']; } ?></td>
        <td><?php echo $data['pcsform10']; ?></td>
        <td><?php echo $data['mc']; ?></td>
        <td><?php echo $data['kg']; ?></td>
        <td><?php echo $data['pcs']; ?></td>
        <td><?php echo $data['looseinkg']; ?></td>
        <td><?php echo $data['looseinpcs']; ?></td>
        <td><?php echo $data['looseoutkg']; ?></td>
        <td><?php echo $data['looseoutpcs']; ?></td>
        <td><?php echo round($data['total_kg'], 2); ?></td>
        <td></td>
      </tr>
      <?php
      }

      $supplieridstmt = $pdo->prepare("SELECT * FROM form10stock WHERE item_id='$commondity_id' AND country='$country' AND date='$searchdate'");
      $supplieridstmt->execute();
      $supplierdata = $supplieridstmt->fetch(PDO::FETCH_ASSOC);
      $supplier_id = $supplierdata['supplier_id'];

      $totalf7kgstmt = $pdo->prepare("SELECT SUM(kg) AS total_kg FROM form7stock WHERE item_id='$commondity_id' AND country='$country' AND supplier_name='$supplier_id'");
      $totalf7kgstmt->execute();
      $totalf7kgdata = $totalf7kgstmt->fetch(PDO::FETCH_ASSOC);

      $totalform7pcs = $pdo->prepare("SELECT SUM(pcsperf7) AS totalform7pcs FROM form7stock WHERE item_id='$commondity_id' AND country='$country' AND supplier_name='$supplier_id'");
      $totalform7pcs->execute();
      $totalform7data = $totalform7pcs->fetch(PDO::FETCH_ASSOC);

      $totalkgstmt = $pdo->prepare("SELECT SUM(total_kg) AS total_kg FROM form10stock WHERE item_id='$commondity_id' AND country='$country' AND date='$searchdate'");
      $totalkgstmt->execute();
      $totalkgdata = $totalkgstmt->fetch(PDO::FETCH_ASSOC);
      $result1 = round($totalkgdata['total_kg'], 2) - round($totalf7kgdata['total_kg'], 2);
      if(round($totalf7kgdata['total_kg']) == 0){
        $percentage = "";
      }else{
        $result2 = $result1 / round($totalf7kgdata['total_kg'], 2);
        $percentage = $result2 * 100;
      }


      $form10pcsstmt = $pdo->prepare("SELECT SUM(pcsform10) AS total_form10_pcs FROM form10stock WHERE item_id='$commondity_id' AND country='$country'");
      $form10pcsstmt->execute();
      $form10pcsdata = $form10pcsstmt->fetch(PDO::FETCH_ASSOC);

      $totalkgstmt = $pdo->prepare("SELECT SUM(total_kg) AS total_kg FROM form10stock WHERE item_id='$commondity_id' AND country='$country'");
      $totalkgstmt->execute();
      $totalkgdata = $totalkgstmt->fetch(PDO::FETCH_ASSOC);

      $mcstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM form10stock WHERE item_id='$commondity_id' AND country='$country'");
      $mcstmt->execute();
      $mcdata = $mcstmt->fetch(PDO::FETCH_ASSOC);

      $kgstmt = $pdo->prepare("SELECT SUM(kg) AS kg FROM form10stock WHERE item_id='$commondity_id' AND country='$country'");
      $kgstmt->execute();
      $kgdata = $kgstmt->fetch(PDO::FETCH_ASSOC);
      ?>
      <tr>
      <td style="font-weight:bold; text-align:center;" colspan="8">Total</td>
      <td style="font-weight:bold;"><?php echo round($totalform7data['totalform7pcs'], 2); ?></td>
      <td></td>
      <td style="font-weight:bold;"><?php echo round($form10pcsdata['total_form10_pcs'], 2); ?></td>
      <td style="font-weight:bold;"><?php echo round($mcdata['total_mc'], 2); ?></td>
      <td style="font-weight:bold;"><?php echo round($kgdata['kg'], 2); ?></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td style="font-weight:bold;"><?php echo round($totalkgdata['total_kg'], 2); ?></td>
      <td style="font-weight:bold; <?php if(strpos(round($percentage, 2), '-') !== false){echo 'color:red;';} ?>"><?php echo round($percentage, 2). "%"; ?></td>
      </tr>
  </table>
    <?php
}

if ($_GET['table_name'] == "purchase") {
  header("Content-Type: application/xls");
  header("Content-Disposition: attachment; filename=purchase.xls");
  header("Pragma: no-cache");
  header("Expires: 0");

  ?>
  <table class="mt-1 table table-bordered table-striped rounded table-hover" border="1">
              <tr>
                <th>No.</th>
                <th>Date</th>
                <th>Voucher No</th>
                <th>Type</th>
                <th>Supplier Name</th>
                <th>Commodity</th>
                <th>Size</th>
                <th>Viss</th>
                <th>Kg</th>
                <th>Pcs</th>
                <th>Price</th>
                <th>Amount</th>
              </tr>
              <?php
              if(isset($_POST['total'])){
                $supplier_id = $_POST['supplier_id'];
                $total_amount = $query->selectsum('purchase', $supplier_id, 'supplier_id');
              }elseif(isset($_POST['commoditybtn'])){
                $item_id = $_POST['item_id'];
                $total_amount = $query->selectsum('purchase', $item_id, 'commodity');
              }else{
                $stmt = $pdo->prepare("SELECT * FROM purchase");
                $stmt->execute();
                $purchasedatas = $stmt->fetchAll();
              }
              $idd = 0;
              foreach ($purchasedatas as $purchasedata) {
                $idd++;
                $supplierid = $purchasedata['supplier_id'];
                $supplier_name = $query->select('supplier', $supplierid, 'supplier_id');
                $itemid = $purchasedata['commodity'];
                $item_name = $query->select('item', $itemid, 'item_id');
              ?>
              <input type="hidden" name="updateid" value="<?php echo $purchasedata['no']; ?>">

              <tr>
                <td><?php echo $idd; ?></td>
                <td><?php echo date('d-m-Y', strtotime($purchasedata['date'])); ?></td>
                <td><?php echo $purchasedata['voucher_no']; ?></td>
                <td><?php echo $purchasedata['tclfrozen']; ?></td>
                <td><?php echo $supplier_name['supplier_name']; ?></td>
                <td><?php echo $item_name['item_name']; ?></td>
                <td><?php echo $purchasedata['size']; ?></td>
                <td><?php echo $purchasedata['viss']; ?></td>
                <td><?php echo floatval($purchasedata['viss']) * 1.634; ?></td>
                <td><?php echo $purchasedata['pcs']; ?></td>
                <td><?php echo $purchasedata['price']; ?></td>
                <td><?php echo $purchasedata['amount']; ?></td>
              </tr>
              <?php
              };
              ?>
            </table>
  <?php
  

}
exit();


 ?>
