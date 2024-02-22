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
  <style media="screen">
    #ac_nameinput{
      padding-top: 2px !important;
      padding-bottom: 2px !important;
    }
  </style>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Caprasimo&family=Cormorant+Garamond:wght@300&family=Teko:wght@700&display=swap" rel="stylesheet">
  <script type="text/javascript">
  function sweetConfirm(title, message, callback) {
      swal({
          title: title,
          text: message,
          type: 'warning',
          showCancelButton: true
      }).then((confirmed) => {
          callback(confirmed && confirmed.value == true);
      });
  }
    $(document).ready(function(){
      $('#addac_code').on('keyup', function(){
        var ac_codepost = $('#addac_code').val();
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
        $('#addac_name').load('ac_name.php', {
          FirstPart : firstpart,
          LastPart: JSON.stringify(lastpart),
          Type: type
        });
        if(ac_codepost.includes('3300')){
          $('#normal').hide();
          $('#receive').show();
          $('#receive2').show();
        }else{
          $('#receive').hide();
          $('#receive2').hide();
          $('#normal').show();
          if(ac_codepost.includes('3600')){
            $('#bankchargesdesc').show();
            $('#bankcharges').show();
            $('#normal').hide();
          }else{
            $('#bankchargesdesc').hide();
            $('#bankcharges').hide();
            $('#normal').show();
          }
        }
      });
      $('#finishbtn').on('click', function(){
        swal({
          title: "Are you Finish?",
          text: "If you are really finish just click the accept button!",
          icon: "warning",
          buttons: [
            'No, Not Finished!',
            'Yes, I am Done!'
          ],
        }).then(function(isConfirm) {
          if (isConfirm) {
            $('#notfinishbtn').show();
            $('#acceptbtn').show();
            $("#finishbtn").hide();
          }
        })
      });
      $('#notfinishbtn').on('click', function(){
        $('#acceptbtn').hide();
        $('#notfinishbtn').hide();
        $('#finishbtn').show();
      });
    });
  </script>
  <body>
    <?php
    $searchvoucher_no = $_GET['voucher_no'];
    $ac_name = '';
    if(isset($_POST['save'])){
      $date = $_POST['adddate'];
      $voucher_no = $_POST['addvoucher_no'];
      $ac_code = $_POST['addac_code'];
      if(str_contains($ac_code, '3600')){
        $description = $_POST['adddescriptionbank'];
        $_SESSION['description'] = '';
        $_SESSION['descriptionrec'] = '';
        $_SESSION['descriptionbank'] = $_POST['adddescriptionbank'];
      }elseif(str_contains($ac_code, '3300')){
        $description = $_POST['adddescriptionrec'];
        $_SESSION['description'] = '';
        $_SESSION['descriptionbank'] = '';
        $_SESSION['descriptionrec'] = $_POST['adddescriptionrec'];
      }else{
        $description = $_POST['adddescription'];
        $_SESSION['descriptionrec'] = '';
        $_SESSION['descriptionbank'] = '';
        $_SESSION['description'] = $_POST['adddescription'];
      }
      $currency = $_POST['addcurrency'];
      $bank_charges = $_POST['bank_charges'];
      if(!empty($_POST['addrate'])){
        $rate = $_POST['addrate'];
      }else{
        $rate = "";
      }
      if(!empty($_POST['adddebit'])){
        $debit = $_POST['adddebit'];
      }else{
        $debit = 0;
      }
      if(!empty($_POST['addcredit'])){
        $credit = $_POST['addcredit'];
      }else{
        $credit = 0;
      }
      if(!empty($_POST['addsr_no']) && !empty($_POST['addcontainer_no'])){
        $sr_no = $_POST['addsr_no'];
        $container_no = $_POST['addcontainer_no'];
      }else{
        $sr_no = '';
        $container_no = '';
      }
      $_SESSION['adddate'] = $_POST['adddate'];
      $_SESSION['addvoucher_no'] = $_POST['addvoucher_no'];
      $_SESSION['addac_code'] = $_POST['addac_code'];
      $_SESSION['ac_name'] = $ac_name;
      $query->savetransaction($date, $voucher_no, $ac_code, $description, $currency, $rate, $debit, $credit, $sr_no, $container_no, $bank_charges);
    }
    if (isset($_POST['update'])) {
      $id = $_POST['id'];
      $date = $_POST['date'];
      $voucher_no = $_POST['voucher_no'];
      $ac_code = $_POST['ac_code'];
      if(str_contains($ac_code, '3600')){
        $description = $_POST['bankdescription'];
      }
      if(str_contains($ac_code, '3300')){
        $description = $_POST['recdescription'];
      }
      if(!str_contains($ac_code, '3600') && !str_contains($ac_code, '3300')){
        $description = $_POST['description'];
      }

      $currency = $_POST['currency'];
      if(!empty($_POST['rate'])){
        $rate = $_POST['rate'];
      }else{
        $rate = "";
      }
      if(!empty($_POST['debit'])){
        $debit = $_POST['debit'];
      }else{
        $debit = 0;
      }
      if(!empty($_POST['credit'])){
        $credit = $_POST['credit'];
      }else{
        $credit = 0;
      }

      if($ac_code == 'ca-001'){
        $sr_no = $_POST['sr_no'];
        $container_no = $_POST['container_no'];
      }else{
        $sr_no = '';
        $container_no = '';
      }
      $bank_charges = $_POST['bank_charges'];
      $query->updatetransaction($date, $voucher_no, $ac_code, $description, $currency, $rate, $debit, $credit, $id,  $sr_no, $container_no, $bank_charges);
    }
    if (isset($_POST['delete'])) {
      $id = $_POST['id'];
      $voucher_no = $_POST['voucher_no'];

      $query->deletetransaction($id, $voucher_no);
    }
    if(isset($_POST['accept'])){
      $totaldebitstmt = $pdo->prepare("SELECT SUM(debit) AS total FROM transaction WHERE voucher_no='$searchvoucher_no'");
      $totaldebitstmt->execute();
      $totaldebitdata = $totaldebitstmt->fetch(PDO::FETCH_ASSOC);
      $totalcreditstmt = $pdo->prepare("SELECT SUM(credit) AS total FROM transaction WHERE voucher_no='$searchvoucher_no'");
      $totalcreditstmt->execute();
      $totalcreditdata = $totalcreditstmt->fetch(PDO::FETCH_ASSOC);
      $datestmt = $pdo->prepare("SELECT * FROM transaction WHERE voucher_no='$searchvoucher_no'");
      $datestmt->execute();
      $datedata = $datestmt->fetch(PDO::FETCH_ASSOC);

      if($totaldebitdata['total'] != $totalcreditdata['total']){
        echo "<script>swal('Dosen\'t Match', 'Debit Credit Dosen\'t Match, Please Check again', 'warning');</script>";
      }else{
        $date = $datedata['date'];
        $voucher_no = $_GET['voucher_no'];
        $query->deloldtransaction($voucher_no);
        $query->delaccepttransaction($date, $voucher_no);
        // echo "<script>swal('Success', 'Accepted Successfully.', 'success');</script>";
      }
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
        <div class="panel-group" id="accordion">
          <form action="" method="post">
            <div class="card">
            <div class="card-header bg-info">

              <h5 class="text-light d-inline">Edit Transaction</h5>
              <button type="submit" class="btn btn-primary btn-sm ms-2 float-end" name="accept">Accept</button>
              <a href="<?php if ($_GET['file'] == 'payable') {echo 'acpayable.php';} if ($_GET['file'] == 'receivable') {echo 'accountreceivable.php';} if ($_GET['file'] == 'cashbook') {echo 'cashbook.php';} if ($_GET['file'] == 'general_ledger') {echo 'general_ledger.php';} ?>" class="btn btn-danger btn-sm float-end">Exit</a>
              <!-- <button type="button" class="btn btn-secondary btn-sm float-end" data-bs-toggle="collapse" data-bs-target="#adddiv" id="add">Add</button> -->
            </div>
          </form>
          <div class="card-body">
            <!-- TABLEEEEEEEEEEEEEEEEEEEE -->
            <table class="table table-hover table-striped">
              <tr>
                <th>No</th>
                <th>Date</th>
                <th>Voucher No</th>
                <th>Account Name</th>
                <th>Debit</th>
                <th>Credit</th>
              </tr>
              <?php
              $searchvoucher_no = $_GET['voucher_no'];
              if($searchvoucher_no != ''){
                $stmt = $pdo->prepare("SELECT * FROM transaction WHERE voucher_no=:searchvoucher_no");
                $stmt->execute(
                  array(':searchvoucher_no' => $searchvoucher_no)
                );
              }else{
                $searchsr_no = $_GET['sr_no'];
                $stmt = $pdo->prepare("SELECT * FROM transaction WHERE sr_no=:sr_name");
                $stmt->execute(
                  array(':sr_name' => $searchsr_no)
                );
              }
              $datas = $stmt->fetchall();
              $no = 0;
              foreach ($datas as $data) {
                $no++;
                $acname = $query->select('acname', $data['ac_code'], 'code_no');
                if($data['debit'] != 0){
                  $dorc = 'debit';
                }else{
                  $dorc = 'credit';
                }
                $voucher_no = $data['voucher_no'];
                $currencystmt = $pdo->prepare("SELECT * FROM currency WHERE voucher_no=:voucher_no AND debitorcredit='$dorc'");
                $currencystmt->execute(
                  array(':voucher_no' => $voucher_no )
                );
                $currencydata = $currencystmt->fetch(PDO::FETCH_ASSOC);

                ?>
                  <tr data-bs-toggle="collapse" data-bs-target="#updatecollapse<?php echo $data['id'];  ?>" id="collapsebtn">
                    <button type="button" class="btn btn-primary btn-sm float-end hide" data-bs-toggle="collapse" data-bs-target="#adddiv">Add</button>
                    <td><?php echo $no; ?></td>
                    <td><?php if($data['date'] != 0){ echo date('d-m-Y', strtotime($data['date'])); } ?></td>
                    <td><?php if($data['voucher_no'] != 0){ echo $data['voucher_no']; } ?></td>
                    <td><?php if($data['ac_code'] != 0){ echo $acname['ac_name']; } ?></td>
                    <td><?php if($data['debit'] != 0){ echo $data['debit']; } ?></td>
                    <td><?php if($data['credit'] != 0){ echo $data['credit']; } ?></td>
                  </tr>
                <?php
                $date = $data['date'];
                $id = $data['id'];
                $voucher_no = $data['voucher_no'];
                $updatastmt = $pdo->prepare("SELECT * FROM transaction WHERE id='$id'");
                $updatastmt->execute();
                $updata = $updatastmt->fetch(PDO::FETCH_ASSOC);
                $datas = $query->select('acname', $updata['ac_code'], 'code_no');
                $ac_name = $datas['ac_name'];
                $voucher_no = $data['voucher_no'];
                ?>
                  <div id='collapseofupdate'>
                      <div id="updatecollapse<?php echo $data['id']; ?>" class="collapse mb-2" data-bs-parent="#accordion">
                      <form action="" method="post">
                        <input type="hidden" name="id" value="<?php echo $data['id']; ?>">
                        <input type="hidden" name="voucher_no" value="<?php echo $data['voucher_no']; ?>">
                      <div class="row">
                          <div class="col">
                            <label>Date</label>
                            <input type="date" name="date" class="form-control inpv2 mb-1" value="<?php echo $updata['date']; ?>" style="padding-top: 2px; padding-bottom: 2px;">
                          </div>
                          <div class="col">
                            <label>Vr. No</label>
                            <input type="text" disabled name="voucher_no" class="form-control inpv2 mb-1" value="<?php echo $updata['voucher_no']; ?>" style="padding-top: 2px; padding-bottom: 2px;">
                          </div>
                          <div class="col">
                            <label>A/C Code</label>
                            <input type="text" name="ac_code" id="upac_code<?php echo $data['id']; ?>" class="form-control inpv2 mb-1" value="<?php echo $updata['ac_code']; ?>" style="padding-top: 2px; padding-bottom: 2px;">
                          </div>
                          <div class="col">
                            <label>A/C Name</label>
                            <div id="upac_name<?php echo $data['id']; ?>">
                              <input type="text" name="ac_name" disabled class="form-control inpv2 mb-1" value="<?php if($ac_name != ''){echo $ac_name;} ?>" style="padding-top: 2px; padding-bottom: 2px;">
                            </div>
                          </div>
                      </div>
                      <div class="row">
                        <div id="upreceive<?php echo $data['id']; ?>" class="<?php if(!str_contains($updata['ac_code'], 3600) && !str_contains($updata['ac_code'], 3300)){ echo "hide";} ?> col-4">
                           <label>Description</label>
                           <textarea name="bankdescription" rows="3" style="padding-bottom:10px; height:75px;" cols="80" class="form-control inpv2 mb-2"><?php if(str_contains($updata['ac_code'], '3600')){echo $updata['description'];} ?></textarea>
                        </div>
                         <div id="upreceive2<?php echo $data['id']; ?>" class="<?php if(!str_contains($updata['ac_code'], 3300)){ echo "hide";} ?> col-2">
                           <input type="text" class="form-control inpv2 mb-3 mt-4" style="padding-top: 2px; padding-bottom: 2px;" name="sr_no" placeholder="Sr No." value="<?php echo $updata['sr_no']; ?>">
                           <input type="text" class="form-control inpv2 mb-2" style="padding-top: 2px; padding-bottom: 2px;" name="container_no" placeholder="Container No." value="<?php echo $updata['container_no']; ?>">
                         </div>
                         <div id="upnormal<?php echo $data['id']; ?>" class="<?php if(str_contains($updata['ac_code'], 3300) || str_contains($updata['ac_code'], 3600)){ echo "hide";} ?> col-6">
                           <label>Description</label>
                           <textarea name="description" rows="3" style="padding-bottom:10px; height:75px;" cols="80" class="form-control inpv2 mb-2"><?php  if(!str_contains($updata['ac_code'], '3600') && !str_contains($updata['ac_code'], '3300')){echo $updata['description'];}?></textarea>
                         </div>
                          <div id="bankchargesdesc<?php echo $data['id']; ?>" class="hide col-4">
                            <label>Description</label>
                            <textarea name="recdescription" rows="3" style="padding-bottom:10px; height:75px;" cols="80" class="form-control inpv2 mb-2"><?php if(str_contains($updata['ad_code'], '3300')){ echo $updata['description']; } ?></textarea>
                          </div>
                          <div id="bankcharges<?php echo $data['id']; ?>" class="<?php if(!str_contains($updata['ac_code'], 3600)){ echo "hide";} ?>" style="width: 16.66666667%">
                            <input type="number" class="form-control inpv2 mb-3 mt-4" style="padding-top: 2px; padding-bottom: 2px;" name="bank_charges" placeholder="Bank Charges" value="<?php if($updata['bank_charges'] != "0"){ echo $updata['bank_charges'];} ?>">
                          </div>
                        <div class="col-3">
                          <label>Currency</label>
                          <select class="form-control inpv2" name="currency" onchange="check<?php echo $data['id']; ?>rate();" id="selectcurrecy<?php echo $data['id']; ?>" style="padding-top: 2px; padding-bottom: 2px;">
                            <option value="usd" <?php if($updata['currency'] == 'usd'){ echo 'selected'; } ?>>USD</option>
                            <option value="mmk" <?php if($updata['currency'] == 'mmk'){ echo 'selected'; } ?>>MMK</option>
                          </select>
                          <input type="text" id="debitinp<?php echo $id; ?>" name="debit" class="form-control inpv2 mt-3" value="<?php if(!empty($updata['debit'])){if($updata['currency'] != 'usd'){ echo $updata['debit']; }else{echo $currencydata['usd_amount'];};} ?>" placeholder="Debit" style="padding-top: 2px; padding-bottom: 2px; width:45%; display:inline;">
                          <input type="text" id="creditinp<?php echo $id; ?>" name="credit" class="form-control inpv2 mt-3" placeholder="Credit" value="<?php if(!empty($updata['credit'])){if($updata['currency'] != 'usd'){ echo $updata['credit']; }else{echo $currencydata['usd_amount'];};} ?>" style="padding-top: 2px; padding-bottom: 2px; width:45%; margin-left:20px; display:inline;">
                        </div>
                        <div class="col-3">
                          <label>Rate</label>
                          <input type="number" name="rate" class="form-control inpv2" id="rate<?php echo $data['id']; ?>" value="<?php if($updata['currency'] == 'usd'){ echo $currencydata['dollar_rate'];} ?>" <?php if($updata['currency'] != 'usd'){echo 'disabled';} ?> style="padding-top: 2px; padding-bottom: 2px;">
                          <button type="submit" class="btn btn-warning mt-3 btn-sm" style="width: 47%; " name="update">Update</button>
                          <button type="submit" class="btn btn-danger mt-3 btn-sm" style="width: 47%; margin-left:10px;" name="delete">Delete</button>
                        </div>
                      </div>
                      </div>
                  </div>
                  </form>
                  </div>
                  <script type="text/javascript">
                    $('#upac_code<?php echo $data['id']; ?>').on('blur', function(){
                      var upac_codepost = $('#upac_code<?php echo $data['id']; ?>').val();
                      var type = "";
                      if(upac_codepost.includes('/')){
                        upac_code = upac_codepost.split('/');
                        type = "slash";
                      }else{
                        upac_code = upac_codepost.split('-');
                        type = "dash";
                      }
                      upfirstpart = upac_code[0];
                      uplastpart = upac_code[1];
                      $('#upac_name<?php echo $data['id']; ?>').load('ac_name.php', {
                        FirstPart : upfirstpart,
                        LastPart: JSON.stringify(uplastpart),
                        Type: type
                      });
                      if(upac_codepost.includes('3300')){
                        $('#upreceive<?php echo $data['id']; ?>').toggle();
                        $('#upreceive2<?php echo $data['id']; ?>').toggle();
                        $('#upnormal<?php echo $data['id']; ?>').toggle();
                      }else{
                        $('#upreceive<?php echo $data['id']; ?>').hide();
                        $('#upreceive2<?php echo $data['id']; ?>').hide();
                        $('#upnormal<?php echo $data['id']; ?>').show();
                        if(upac_codepost.str_contains('3600')){
                          $('#bankchargesdesc<?php echo $data['id']; ?>').show();
                          $('#bankcharges<?php echo $data['id']; ?>').show();
                          $('#upnormal<?php echo $data['id']; ?>').hide();
                        }else{
                          $('#bankchargesdesc<?php echo $data['id']; ?>').hide();
                          $('#bankcharges<?php echo $data['id']; ?>').hide();
                          $('#upnormal<?php echo $data['id']; ?>').show();
                        }
                      }
                    });

                  $('#debitinp<?php echo $id; ?>').on('keyup', function(){
                    if($('#debitinp<?php echo $id; ?>').val() == ''){
                      document.getElementById('creditinp<?php echo $id; ?>').disabled = false;
                    }else{
                      document.getElementById('creditinp<?php echo $id; ?>').disabled = true;
                    }
                  });
                  $('#creditinp<?php echo $id; ?>').on('keyup', function(){
                    if($('#creditinp<?php echo $id; ?>').val() == ''){
                      document.getElementById('debitinp<?php echo $id; ?>').disabled = false;
                    }else{
                      document.getElementById('debitinp<?php echo $id; ?>').disabled = true;
                    }
                  });
                  if($('#debitinp<?php echo $id; ?>').val() == ''){
                    document.getElementById('creditinp<?php echo $id; ?>').disabled = false;
                  }else{
                    document.getElementById('creditinp<?php echo $id; ?>').disabled = true;
                  }
                  if($('#creditinp<?php echo $id; ?>').val() == ''){
                    document.getElementById('debitinp<?php echo $id; ?>').disabled = false;
                  }else{
                    document.getElementById('debitinp<?php echo $id; ?>').disabled = true;
                  }
                  function check<?php echo $data['id']; ?>rate(){
                    let rateinp = document.getElementById('rate<?php echo $data['id']; ?>');
                    let selectcurrecy = document.getElementById('selectcurrecy<?php echo $data['id']; ?>');
                    if(selectcurrecy.value == 'mmk'){
                      rateinp.disabled = true;
                      rateinp.value = "";
                    }else if(selectcurrecy.value == 'usd'){
                      rateinp.disabled = false;
                    }
                  }
                  </script>
                <?php
              }
              $totaldebitstmt = $pdo->prepare("SELECT SUM(debit) AS total FROM transaction WHERE voucher_no=:searchvoucher_no");
              $totaldebitstmt->execute(
                array(':searchvoucher_no' => $searchvoucher_no)
              );
              $totaldebitdata = $totaldebitstmt->fetch(PDO::FETCH_ASSOC);
              $totalcreditstmt = $pdo->prepare("SELECT SUM(credit) AS total FROM transaction WHERE voucher_no=:searchvoucher_no");
              $totalcreditstmt->execute(
                array(':searchvoucher_no' => $searchvoucher_no)
              );
              $totalcreditdata = $totalcreditstmt->fetch(PDO::FETCH_ASSOC);
               ?>
               <tr style="font-weight:bold;">
                 <td colspan="4">Balance</td>
                 <td style="<?php if($totaldebitdata['total'] != $totalcreditdata['total']){ echo "color:red;"; } ?>"><?php echo $totaldebitdata['total']; ?></td>
                 <td style="<?php if($totaldebitdata['total'] != $totalcreditdata['total']){ echo "color:red;"; } ?>"><?php echo $totalcreditdata['total']; ?></td>
               </tr>
            </table>
          </div>
            <!-- TABLEEEEEEEEEEEEEEEEEEEE -->
          </div>
        </div>
      </div>

    <script type="text/javascript">
    $(document).ready(function(){
      $('#adddebitinp').on('keyup', function(){
        if($('#adddebitinp').val() == ''){
          document.getElementById('addcreditinp').disabled = false;
        }else{
          document.getElementById('addcreditinp').disabled = true;
        }
      });
      $('#addcreditinp').on('keyup', function(){
        if($('#addcreditinp').val() == ''){
          document.getElementById('adddebitinp').disabled = false;
        }else{
          document.getElementById('adddebitinp').disabled = true;
        }
      });
    });
      function addcheckrate(){
        let addrateinp = document.getElementById('addrate');
        let addselectcurrecy = document.getElementById('addselectcurrecy');

        if(addselectcurrecy.value == 'mmk'){
          addrateinp.disabled = true;
        }else if(addselectcurrecy.value == 'usd'){
          addrateinp.disabled = false;
        }
      }
    </script>
    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
