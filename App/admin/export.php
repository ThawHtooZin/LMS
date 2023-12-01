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
    <!-- <tr <?php// if($receivabledata['sr_no']){ ?>data-bs-toggle="modal" data-bs-target="#paymentmodal<?php// echo $receivabledata['id']; ?>"<?php //} ?>> -->
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
      $openingamountstmt = $pdo->prepare("SELECT balance FROM payable WHERE supplier_id='$supplier_id' AND id < '$idofrow' AND report_date!='0000-00-00' ORDER BY id DESC");
      $openingamountstmt->execute();
      $openingamount = $openingamountstmt->fetch(PDO::FETCH_ASSOC);

      $purchaseamtstmt = $pdo->prepare("SELECT SUM(purchase_amount) AS purchase_amount FROM payable WHERE supplier_id='$supplier_id'");
      $purchaseamtstmt->execute();
      $purchaseamt = $purchaseamtstmt->fetch(PDO::FETCH_ASSOC);

      $paidamtstmt = $pdo->prepare("SELECT SUM(paid_amount) AS paid_amount FROM payable WHERE supplier_id='$supplier_id'");
      $paidamtstmt->execute();
      $paidamt = $paidamtstmt->fetch(PDO::FETCH_ASSOC);

      $id++;
      if (!empty($openingamount['balance'])) {
        $openingamt = $openingamount['balance'];
      }else{
        $openingamt = 0;
      }
      $balance =  ($openingamt + $purchaseamt['purchase_amount']) - $paidamt['paid_amount'];

      $supplier_id = $payablesupplier['supplier_id'];
      $supplierdata = $query->select('acname', $supplier_id, 'code_no');

    ?>
    <tr style="<?php if($balance['balance'] == 0){ echo "display:none;";} ?>">
      <td><?= $id; ?></td>
      <td><?= $supplierdata['ac_name']; ?></td>
      <td <?php if(empty($openingamount['balance'])){ echo "data-bs-toggle='modal' data-bs-target='#addbalancemodal'";} ?>><?php if(!empty($openingamount['balance'])){ echo $openingamount['balance']; } ?></td>
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

// if ($_GET['table_name'] = 'truckpackingstockinfo') {
  
// }

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
    $hhktotalmcstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM hhkmcstock WHERE commondity_id='$item_id' AND particular LIKE '%from%'");
    $hhktotalmcstmt->execute();
    $hhktotalmcnotsub = $hhktotalmcstmt->fetch(PDO::FETCH_ASSOC);
    $hhktotalmcsubnumstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM hhkmcstock WHERE commondity_id='$item_id' AND particular LIKE '%to%'");
    $hhktotalmcsubnumstmt->execute();
    $hhktotalmcsubnum = $hhktotalmcsubnumstmt->fetch(PDO::FETCH_ASSOC);
    $hhktotalmc = $hhktotalmcnotsub['total_mc'] - $hhktotalmcsubnum['total_mc'];

    $gfctotalmcstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM gfcmcstock WHERE commondity_id='$item_id' AND particular LIKE '%to%'");
    $gfctotalmcstmt->execute();
    $gfctotalmcnotsub = $gfctotalmcstmt->fetch(PDO::FETCH_ASSOC);
    $gfctotalmcsubnumstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM gfcmcstock WHERE commondity_id='$item_id' AND particular NOT LIKE '%to%'");
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

// exit();


 ?>
