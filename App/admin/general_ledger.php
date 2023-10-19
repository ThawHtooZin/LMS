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
          <div class="card-header bg-warning text-light">
            <button type="button" class="btn btn-primary btn-sm float-end" data-bs-toggle="modal" data-bs-target="#reportsmodal">Reports</button>
            <h5>General Ledger</h5>
          </div>
          <div class="card-body">
            <table class="table table-bordered" id="table">
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
              if (isset($_POST['searchgeneralledger'])) {
                $date_from = $_POST['date_from'];
                $date_to = $_POST['date_to'];
                $ac_code = $_POST['ac_code'];

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
                <tr>
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
          </div>
        </div>
        <div class="modal fade" id="reportsmodal">
          <div class="modal-dialog">
            <div class="modal-content" style=" margin-top:70px !important;">
              <div class="modal-header bg-warning text-light">
                <h1 class="modal-title fs-5">General Ledger Reports</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
            <form action="general_ledger.php" method="post">
              <div class="modal-body">
                <div class="row">
                  <div class="col">
                    <label>Date From</label>
                    <input type="date" name="date_from" class="form-control inpv2 mb-2">
                  </div>
                  <div class="col">
                    <label>Date To</label>
                    <input type="date" name="date_to" class="form-control inpv2 mb-2">
                  </div>
                </div>
                <div class="row">
                  <div class="col">
                    <label>Account No</label>
                    <input type="text" name="ac_code" class="form-control inpv2 mb-2" id="ac_code">
                  </div>
                  <div class="col">
                    <label>Account Name</label>
                    <div class="" id="ac_name">
                      <input type="text" disabled class="form-control inpv2 mb-2">
                    </div>
                  </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" name="button" class="btn btn-secondary" data-bs-toggle="modal">Cancel</button>
                <button type="submit" name="searchgeneralledger" class="btn btn-success">Search</button>
              </div>
            </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <?php
    $bootstrap->javascript();
    ?>
    <script type="text/javascript">
    let loadnumber = 1;
    $(document).ready(function(){
      $('#ac_code').on('keyup', function(){
        var ac_codepost = $('#ac_code').val();
        var type = "";
        if(ac_codepost.includes('/')){
          ac_code = ac_codepost.split('/');
          type = "slash";
        }else{
          ac_code = ac_codepost.split('-');
          type = "dash";
        }
        firstpart = ac_code[0];
        lastpart = ac_code[1];
        $('#ac_name').load('ac_name.php', {
          FirstPart : firstpart,
          LastPart: JSON.stringify(lastpart),
          Type: type
        });
      });
      $('#reportsmodal').on('hidden.bs.modal', function(){
        $('#table').show();
      })
    });
    $(window).on('load', function(){
      <?php if($_SERVER['REQUEST_METHOD'] != 'POST') : ?>
      $('#reportsmodal').modal('show');
      $('#table').hide();
      <?php endif; ?>
    });
    </script>
  </body>
</html>
