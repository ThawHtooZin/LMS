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
            <form action="" class="d-inline" method="post">
              <?php
              if(isset($_POST['searchgeneralledger'])){
                ?>
                <a href="export.php?table_name=general_ledger&searchgeneralledger=true&date_from=<?= $_POST['date_from']; ?>&date_to=<?= $_POST['date_to']; ?>&ac_code=<?= $_POST['ac_code'] ?>" class="btn btn-sm ms-2 btn-success float-end">Export</a>
                <?php
              }else{
                ?>
                <a href="export.php?table_name=general_ledger" class="btn btn-sm ms-2 btn-success float-end">Export</a>
                <?php
              }
               ?>
            </form>
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
                <th>Action</th>
              </tr>
              <?php
              if (isset($_POST['searchgeneralledger'])) {
                $date_from = $_POST['date_from'];
                $date_to = $_POST['date_to'];
                $ac_code = $_POST['ac_code'];

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
                    $acnamedontloop = 2;
                  }
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
                    <td colspan="8"><b><u><?php echo "Account No. : " . $ac_code . " - " . $acnametoshow['ac_name']; ?></u></b></td>
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
                      <td>
                        <a href="edittransaction.php?voucher_no=<?= $gldata['paid_voucher']; ?>&file=general_ledger" style="<?php if(str_contains(strtolower($acname), 'purchase')){ echo "display:none;"; } ?>">
                          <button type="submit" class="btn btn-warning btn-sm text-light" name="updatebutton"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                              <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                              <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                            </svg>
                          </button>
                        </a>
                      </td>
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
                    <td></td>
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
                if(!empty($acselect['ac_code'])){
                  $accode = $acselect['ac_code'];

                  if(str_contains($accode, '4000/')){
                    $acname = 'Supplier';
                  }else {
                    $acnamedata = $query->select('acname', $accode, 'code_no');
                    $acname = $acnamedata['ac_name'];
                  }
                }else{
                  if(str_contains($accode, '4000/')){
                    $acname = 'Purchase';
                  }else {
                    $acnamedata = $query->select('acname', $accode, 'code_no');
                    $acname = $acnamedata['ac_name'];
                  }
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
                  <td>
                    <a href="edittransaction.php?voucher_no=<?= $gldata['voucherno']; ?>&file=general_ledger" style="<?php if(str_contains(strtolower($acname), 'purchase')){ echo "display:none;"; } ?>">
                      <button type="submit" class="btn btn-warning btn-sm text-light" name="updatebutton"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                          <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                          <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                        </svg>
                      </button>
                    </a>
                  </td>
                </tr>

                <!-- Data Update Modal -->
                <!-- <div class="modal fade" id="updatemodal<?php echo $gldata['id']; ?>" tabindex="-1" role="dialog" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content" style="width:600px !important;">
                      <div class="modal-header bg-warning text-light">
                        <h5 class="modal-title" id="updatemodallabel">Update An Account</h5>
                        <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true" class="h3">&times;</span>
                        </button>
                      </div>
                      <form action="" method="post" autocomplete="off">
                        <div class="modal-body">
                          <?php
                          $id = $gldata['id'];
                          $updatedata = $query->select('general_ledger', $id, 'id');
                          $voucher_no = $updatedata['voucherno'];
                          $acstmt = $pdo->prepare("SELECT ac_code FROM transaction WHERE voucher_no='$voucher_no'");
                          $acstmt->execute();
                          $acdata = $acstmt->fetch(PDO::FETCH_ASSOC);
                          if(!empty($acdata)){
                            $ac_code = $acdata['ac_code'];
                          }else{

                          }
                          $acnamedata = $query->select('acname', $ac_code, 'code_no');

                          ?>
                          <input type="hidden" name="updateid" value="<?php echo $cashdata['id']; ?>">
                          <div class="row">
                            <div class="col">
                              <label>Date</label>
                              <input type="date" name="date" class="form-control inpv2 mb-2" value="<?= $gldata['date']; ?>">
                            </div>
                            <div class="col">
                              <label>Voucher No</label>
                              <input type="text" name="voucher_no" class="form-control inpv2 mb-2" value="<?= $gldata['voucherno']; ?>">
                            </div>
                          </div>
                          <div class="row">
                            <div class="col">
                              <label>A/C Name</label>
                              <input type="text" name="ac_name" class="form-control inpv2 mb-2" value="<?= $acnamedata['ac_name']; ?>">
                            </div>
                            <div class="col">
                              <label>Particular</label>
                              <input type="text" name="particular" class="form-control inpv2 mb-2" value="<?= $gldata['narration']; ?>">
                            </div>
                          </div>
                          <div class="row">
                            <div class="col">
                              <label>Debit</label>
                              <input type="number" name="debit" class="form-control inpv2 mb-2" value="<?= $gldata['debit']; ?>">
                            </div>
                            <div class="col">
                              <label>Credit</label>
                              <input type="number" name="credit" class="form-control inpv2 mb-2" value="<?= $gldata['credit']; ?>">
                            </div>
                          </div>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                          <button type="submit" class="btn btn-warning" name="updateaccount">Update</button>
                        </div>
                      </form>
                    </div>
                  </div>
                </div> -->
                <!-- Update Modal -->
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
                 <td></td>
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
