
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
            <h5>General Ledger</h5>
          </div>
          <div class="card-body">
            <div>
            <form class="border p-3" action="generalledgerreport.php" method="post">
              <div class="d-flex">
                <select class="form-control w-50 inpv2" name="reportselect">
                  <option value="">Select Report Method</option>
                  <option value="accountsearch">Account Name Search</option>
                  <option value="dbwsearch">Date Between Search</option>
                  <option value="datesearch">Today Search</option>
                  <option value="accountanddbwsearch">Account name and Date between Search</option>
                </select>
                <button type="submit" name="ok" class="btn btn-primary">Ok</button>
              </div>
              <br>
                <!-- Search Date Between -->
                <?php
                if(isset($_POST['ok']) && $_POST['reportselect'] == 'dbwsearch'){
                ?>
                <label>Date Between Search:</label>
                <br>
                <div class="row">
                  <div class="col-6">
                    <label>Start Date</label>
                    <input type="date" name="dbwstartdate" class="form-control inpv2">
                  </div>
                  <div class="col-1 text-center">
                    To
                  </div>
                  <div class="col-5">
                    <label>End Date</label>
                    <input type="date" name="dbwenddate" class="form-control inpv2">
                  </div>
                </div>
                <button type="submit" name="dbwsearch" class="btn btn-primary btn-sm">Check Reports</button>
                <?php
                }
                ?>
                <!-- Today Search -->
                <?php
                if(isset($_POST['ok']) && $_POST['reportselect'] == 'datesearch'){
                ?>
                <input type="date" name="date" class="form-control inpv2">
                <button type="submit" name="datesearch" class="btn btn-primary btn-sm">Search Date Report</button>
                <?php
                }
                ?>
                <!-- Account Search -->
                <?php
                  if(isset($_POST['ok']) && $_POST['reportselect'] == 'accountsearch'){
                ?>
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
                <button type="submit" name="accountsearch" class="btn btn-primary btn-sm">Check Reports</button>
                <?php  
                  }
                ?>
                <!-- Account And Dbw Search -->
                <?php
                if(isset($_POST['ok']) && $_POST['reportselect'] == 'accountanddbwsearch'){
                ?>
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
                <div class="row">
                  <div class="col-6">
                    <label>Start Date</label>
                    <input type="date" name="dbwstartdate" class="form-control inpv2">
                  </div>
                  <div class="col-6">
                    <label>End Date</label>
                    <input type="date" name="dbwenddate" class="form-control inpv2">
                  </div>
                </div>
                <button type="submit" name="accountanddbwsearch" class="btn btn-primary btn-sm">Check Reports</button>
                <?php
                }
                ?>
            </form>
            </div>
            <table class="table table-bordered">
              <tr style="background-color: lightgray;">
                <th>Date</th>
                <th>Voucher No</th>
                <th>Account Name</th>
                <th>Description</th>
                <th>Debit</th>
                <th>Credit</th>
                <th>Currency</th>
                <th>Balance</th>
                <th>Action</th>
              </tr>
              <?php
              $search = false;
              if ($search == true) {
                $date_from = $_POST['date_from'];
                $date_to = $_POST['date_to'];
                $ac_code = $_POST['ac_code'];
                if(isset($_POST['accountanddbwsearch'])){
                  $acnamecountstmt = $pdo->prepare("SELECT COUNT(DISTINCT ac_code) FROM general_ledger  WHERE `date` BETWEEN '$date_from' AND '$date_to' AND ac_code='$ac_code'");
                  $acnamecountstmt->execute();
                  $acnamecount = $acnamecountstmt->fetchColumn();
                  $acnamedontloop = 1;
                }
                if(isset($_POST['dbwsearch'])){
                  $acnamecountstmt = $pdo->prepare("SELECT COUNT(DISTINCT ac_code) FROM general_ledger  WHERE `date` BETWEEN '$date_from' AND '$date_to'");
                  $acnamecountstmt->execute();
                  $acnamecount = $acnamecountstmt->fetchColumn();
                  $acnamedontloop = 2;
                }
                if(isset($_POST['accountsearch'])){
                  $acnamecountstmt = $pdo->prepare("SELECT COUNT(DISTINCT ac_code) FROM general_ledger  WHERE ac_code='$ac_code'");
                  $acnamecountstmt->execute();
                  $acnamecount = $acnamecountstmt->fetchColumn();
                  $acnamedontloop = 1;
                  $acnamecount = 1;
                }
                if(isset($_POST['datesearch'])){
                  $date = $_POST['date'];
                  $acnamecountstmt = $pdo->prepare("SELECT COUNT(DISTINCT ac_code) FROM general_ledger  WHERE `date`='$date'");
                  $acnamecountstmt->execute();
                  $acnamecount = $acnamecountstmt->fetchColumn();
                  $acnamedontloop = 2;
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
                    $gldata['transactionid'];
                    $acname = $query->select('acname', $ac_code, 'code_no');


                    // acnamechange
                    $voucher_no = $gldata['voucherno'];
                    $ac_code = $gldata['ac_code'];
                    $acselectstmt = $pdo->prepare("SELECT * FROM transaction WHERE voucher_no=:voucher_no AND ac_code!='$ac_code'");
                    $acselectstmt->execute(
                      array(':voucher_no' => $voucher_no)
                    );
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

                    if($gldata['debit'] == 0 && $gldata['credit'] == 0){
                      $debitorcredit = 'balance';
                    }elseif($gldata['debit'] != 0){
                      $debitorcredit = 'debit';
                    }else{
                      $debitorcredit = 'credit';
                    }
                    $transactionid = $gldata['transactionid'];
                    if(str_contains($gldata['ac_code'], '3300/')){
                      $currencystmt = $pdo->prepare("SELECT * FROM currency WHERE voucher_no=:voucher_no AND debitorcredit='$debitorcredit'");
                    }else{
                      $currencystmt = $pdo->prepare("SELECT * FROM currency WHERE voucher_no=:voucher_no AND debitorcredit='$debitorcredit' AND transactionid='$transactionid'");
                    }
                    $currencystmt->execute(
                      array(':voucher_no' => $voucher_no )
                    );
                    $currencydata = $currencystmt->fetch(PDO::FETCH_ASSOC);
                     ?>
                    <tr>
                      <td><?php echo date('d/m/Y', strtotime($gldata['date'])); ?></td>
                      <td><?php echo $gldata['voucherno']; ?></td>
                      <td><?php echo $acname; ?></td>
                      <td><?php echo $gldata['narration']; ?></td>
                      <td><?php echo $gldata['debit']; ?></td>
                      <td><?php echo $gldata['credit']; ?></td>
                      <td><?php if($currencydata['usd_amount'] == 0){echo 'MMK'; }else{echo 'USD';} ?></td>
                      <td><?php echo $gldata['balance']; ?></td>
                      <td>
                        <a href="edittransaction.php?voucher_no=<?= $gldata['voucherno']; ?>&file=general_ledger&transactionid=<?= $gldata['transactionid']; ?>&id=<?= $gldata['id']; ?>" style="<?php if(str_contains(strtolower($acname), 'purchase')){ echo "display:none;"; } ?>">
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
              } ?>
            </table>
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
    </script>
  </body>
</html>
