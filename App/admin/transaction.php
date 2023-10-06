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
        ac_code = ac_codepost.split('/');
        firstpart = ac_code[0];
        lastpart = ac_code[1];
        $('#addac_name').load('ac_name.php', {
          FirstPart : firstpart,
          LastPart: JSON.stringify(lastpart)
        });
        if(ac_codepost == '500/0004'){
          $('#receive').toggle();
          $('#receive2').toggle();
          $('#normal').toggle();
        }else{
          $('#receive').hide();
          $('#receive2').hide();
          $('#normal').show();
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
    $ac_name = '';
    // if($_POST && !isset($_POST['save']) && !isset($_POST['accept']) && !isset($_POST['update']) && !isset($_POST['delete'])){
    //   $_SESSION['adddate'] = $_POST['adddate'];
    //   $_SESSION['addvoucher_no'] = $_POST['addvoucher_no'];
    //   $_SESSION['addac_code'] = $_POST['addac_code'];
    //
    //   $ac_code = $_POST['addac_code'];
    //   $stmt = $pdo->prepare("SELECT * FROM acname WHERE code_no='$ac_code'");
    //   $stmt->execute();
    //   $datas = $stmt->fetch(PDO::FETCH_ASSOC);
    //   if(empty($datas['ac_name'])){
    //     echo "<script>swal('Error', 'A/C Name Doesn\'t Exist', 'warning');</script>";
    //   }else{
    //     $ac_name = $datas['ac_name'];
    //     $_SESSION['ac_name'] = $ac_name;
    //   }
    // }
    if(isset($_POST['save'])){
      $date = $_POST['adddate'];
      $voucher_no = $_POST['addvoucher_no'];
      $ac_code = $_POST['addac_code'];
      $description = $_POST['adddescription'];
      $currency = $_POST['addcurrency'];
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
      if($ac_code == '500/0004'){
        $sr_no = $_POST['addsr_no'];
        $container_no = $_POST['addcontainer_no'];
      }else{
        $sr_no = '';
        $container_no = '';
      }
      $_SESSION['description'] = $_POST['adddescription'];
      $_SESSION['adddate'] = $_POST['adddate'];
      $_SESSION['addvoucher_no'] = $_POST['addvoucher_no'];
      $_SESSION['addac_code'] = $_POST['addac_code'];
      $_SESSION['ac_name'] = $ac_name;

      $query->savetransaction($date, $voucher_no, $ac_code, $description, $currency, $rate, $debit, $credit, $sr_no, $container_no);
    }
    if (isset($_POST['update'])) {
      $id = $_POST['id'];
      $date = $_POST['date'];
      $voucher_no = $_POST['voucher_no'];
      $ac_code = $_POST['ac_code'];
      $description = $_POST['description'];
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

      if($ac_code == '500/0004'){
        $sr_no = $_POST['sr_no'];
        $container_no = $_POST['container_no'];
      }else{
        $sr_no = '';
        $container_no = '';
      }
      $query->updatetransaction($date, $voucher_no, $ac_code, $description, $currency, $rate, $debit, $credit, $id,  $sr_no, $container_no);
    }
    if (isset($_POST['delete'])) {
      $id = $_POST['id'];
      $voucher_no = $_POST['voucher_no'];

      $query->deletetransaction($id, $voucher_no);
    }
    if(isset($_POST['accept'])){
      $date = date('Y-m-d');
      $totaldebitstmt = $pdo->prepare("SELECT SUM(debit) AS total FROM transaction WHERE date='$date'");
      $totaldebitstmt->execute();
      $totaldebitdata = $totaldebitstmt->fetch(PDO::FETCH_ASSOC);
      $totalcreditstmt = $pdo->prepare("SELECT SUM(credit) AS total FROM transaction WHERE date='$date'");
      $totalcreditstmt->execute();
      $totalcreditdata = $totalcreditstmt->fetch(PDO::FETCH_ASSOC);

      if($totaldebitdata['total'] != $totalcreditdata['total']){
        echo "<script>swal('Dosen\'t Match', 'Debit Credit Dosen\'t Match, Please Check again', 'warning');</script>";
      }else{
        $date = date('Y-m-d');
        $query->accepttransaction($date);
        // echo "<script>swal('Success', 'Accepted Successfully.', 'success');</script>";
      }
    }
     ?>
    <div class="row">
      <div class="col-2" id="sidebar">
        <?php
        include 'sidebar.php';
        ?>
      </div>
      <div class="col-10" id="content">
        <form action="" method="post">
          <div class="panel-group" id="accordion">
        <div class="card">
          <form class="" action="index.html" method="post">
            <div class="card-header bg-info">
              <button type="button" class="btn btn-default btn-sm" id="menu">
                <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
                  <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
                </svg>
              </button>
              <h5 class="text-light d-inline">Add Transaction</h5>
              <button type="submit" id="acceptbtn" class="hide btn btn-primary btn-sm ms-2 float-end" name="accept">Accept</button>
              <button type="button" id="finishbtn" class="btn btn-success btn-sm ms-2 float-end">Finished</button>
              <button type="button" id="notfinishbtn" class="hide btn btn-danger btn-sm ms-2 float-end">Not Finished</button>
              <button type="button" class="btn btn-secondary btn-sm float-end" data-bs-toggle="collapse" data-bs-target="#adddiv" id="add">Add</button>
            </div>
          </form>
          <div class="card-body">
            <div id="adddiv" class="collapse mb-2 show" name="outsidething" data-bs-parent="#accordion">
            <form action="" method="post">
            <div class="row">
                <div class="col">
                  <label>Date</label>
                  <input type="date" name="adddate" class="form-control inpv2 mb-1" value="<?php if(!empty($_SESSION['adddate'])){echo $_SESSION['adddate']; } ?>" style="padding-top: 2px; padding-bottom: 2px;">
                </div>
                <div class="col">
                  <label>Vr. No</label>
                  <input type="text" name="addvoucher_no" class="form-control inpv2 mb-1" value="<?php if(!empty($_SESSION['addvoucher_no'])){echo $_SESSION['addvoucher_no']; } ?>" style="padding-top: 2px; padding-bottom: 2px;">
                </div>
                <div class="col">
                  <label>A/C Code</label>
                  <input type="text" id="addac_code" name="addac_code" class="form-control inpv2 mb-1" value="<?php if(!empty($_SESSION['addac_code'])){echo $_SESSION['addac_code']; } ?>" style="padding-top: 2px; padding-bottom: 2px;">
                </div>
                <div class="col">
                  <label>A/C Name</label>
                  <div id='addac_name'>
                    <input type="text" name="addac_name" disabled class="form-control inpv2 mb-1" value="<?php if(!empty($_SESSION['ac_name'])){echo $_SESSION['ac_name']; } ?>" style="padding-top: 2px; padding-bottom: 2px;">
                  </div>
                </div>
            </div>
            <button type="submit" style="display:none;"></button>
            <div class="row">
              <div id="receive" class="hide col-4">
                 <label>Description</label>
                 <textarea name="adddescription" rows="3" style="padding-bottom:10px; height:75px;" cols="80" class="form-control inpv2 mb-2"><?php if(!empty($_SESSION['description'])){echo $_SESSION['description']; } ?></textarea>
              </div>
               <div id="receive2" class="hide col-2">
                 <input type="text" class="form-control inpv2 mb-3 mt-4" style="padding-top: 2px; padding-bottom: 2px;" name="addsr_no" placeholder="Sr No.">
                 <input type="text" class="form-control inpv2 mb-2" style="padding-top: 2px; padding-bottom: 2px;" name="addcontainer_no" placeholder="Container No.">
               </div>
               <div id="normal" class="col-6">
                 <label>Description</label>
                 <textarea name="adddescription" rows="3" style="padding-bottom:10px; height:75px;" cols="80" class="form-control inpv2 mb-2"><?php if(!empty($_SESSION['description'])){echo $_SESSION['description']; } ?></textarea>
               </div>
              <div class="col-3">
                <label>Currency</label>
                <select class="form-control inpv2" name="addcurrency" onchange="addcheckrate();" id="addselectcurrecy" style="padding-top: 2px; padding-bottom: 2px;">
                  <option value="mmk">MMK</option>
                  <option value="usd">USD</option>
                </select>
                  <input type="text" name="adddebit" id="adddebitinp" class="form-control inpv2" placeholder="Debit" style="padding-top: 2px; padding-bottom: 2px; width: 45%; display:inline; margin-top:15px;">
                  <input type="text" name="addcredit" id="addcreditinp" class="form-control inpv2" placeholder="Credit" style="padding-top: 2px; padding-bottom: 2px; width: 45%; display:inline; margin-top:15px; margin-left:20px;">
              </div>
              <div class="col-3">
                <label>Rate</label>
                <input type="number" name="addrate" class="form-control inpv2" disabled id="addrate" style="padding-top: 2px; padding-bottom: 2px;">
                <button type="submit" class="btn btn-success mt-3 btn-sm" style="width: 100%;" name="save">Save</button>
              </div>
              </div>
            </form>
            </div>
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
              $date = date('Y-m-d');
              $stmt = $pdo->prepare("SELECT * FROM transaction WHERE date='$date'");
              $stmt->execute();
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
                $currencystmt = $pdo->prepare("SELECT * FROM currency WHERE voucher_no='$voucher_no' AND debitorcredit='$dorc'");
                $currencystmt->execute();
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
                <script type="text/javascript">
                $(document).ready(function(){
                  $('#upac_code<?php echo $data['id']; ?>').on('keyup', function(){
                    var upac_codepost = $('#upac_code<?php echo $data['id']; ?>').val();
                    upac_code = upac_codepost.split('/');
                    upfirstpart = upac_code[0];
                    uplastpart = upac_code[1];
                    $('#upac_name<?php echo $data['id']; ?>').load('ac_name.php', {
                      FirstPart : upfirstpart,
                      LastPart: JSON.stringify(uplastpart)
                    });
                    if(upac_codepost == '500/0004'){
                      $('#upreceive<?php echo $data['id']; ?>').toggle();
                      $('#upreceive2<?php echo $data['id']; ?>').toggle();
                      $('#upnormal<?php echo $data['id']; ?>').toggle();
                    }else{
                      $('#upreceive<?php echo $data['id']; ?>').hide();
                      $('#upreceive2<?php echo $data['id']; ?>').hide();
                      $('#upnormal<?php echo $data['id']; ?>').show();
                    }
                  });
                });
                </script>
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
                            <input type="text" name="voucher_no" class="form-control inpv2 mb-1" value="<?php echo $updata['voucher_no']; ?>" style="padding-top: 2px; padding-bottom: 2px;">
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
                        <div id="upreceive<?php echo $data['id']; ?>" class="<?php if($updata['ac_code'] != '500/0004'){ echo "hide";} ?> col-4">
                           <label>Description</label>
                           <textarea name="description" rows="3" style="padding-bottom:10px; height:75px;" cols="80" class="form-control inpv2 mb-2"><?php echo $updata['description']; ?></textarea>
                        </div>
                         <div id="upreceive2<?php echo $data['id']; ?>" class="<?php if($updata['ac_code'] != '500/0004'){ echo "hide";} ?> col-2">
                           <input type="text" class="form-control inpv2 mb-3 mt-4" style="padding-top: 2px; padding-bottom: 2px;" name="sr_no" placeholder="Sr No." value="<?php echo $updata['sr_no']; ?>">
                           <input type="text" class="form-control inpv2 mb-2" style="padding-top: 2px; padding-bottom: 2px;" name="container_no" placeholder="Container No." value="<?php echo $updata['container_no']; ?>">
                         </div>
                         <div id="upnormal<?php echo $data['id']; ?>" class="<?php if($updata['ac_code'] == '500/0004'){ echo "hide";} ?> col-6">
                           <label>Description</label>
                           <textarea name="description" rows="3" style="padding-bottom:10px; height:75px;" cols="80" class="form-control inpv2 mb-2"><?php echo $updata['description']; ?></textarea>
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
              $totaldebitstmt = $pdo->prepare("SELECT SUM(debit) AS total FROM transaction WHERE date='$date'");
              $totaldebitstmt->execute();
              $totaldebitdata = $totaldebitstmt->fetch(PDO::FETCH_ASSOC);
              $totalcreditstmt = $pdo->prepare("SELECT SUM(credit) AS total FROM transaction WHERE date='$date'");
              $totalcreditstmt->execute();
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
