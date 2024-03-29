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
    <title>Admin | Cash Book</title>
  </head>
  <?php
  $bootstrap->css();
  ?>
  <body>
    <?php
      if(isset($_POST['addbalance'])){
        $balanceamount = $_POST['balanceamount'];
        $ac_code = $_POST['balanceac'];
        $particular = $_POST['balanceparticular'];
        $date = $_POST['balancedate'];
        $query->cashbookaddbalance($date, $balanceamount, $ac_code, $particular);
      }
      if(isset($_POST['updatebalance'])){
        $id = $_POST['updatebalanceid'];
        $balanceamount = $_POST['updatebalanceamount'];
        $ac_code = $_POST['updatebalanceaccode'];
        $particular = $_POST['updatebalanceparticular'];
        $date = $_POST['updatebalancedate'];
        $query->cashbookupdatebalance($id, $balanceamount, $ac_code, $particular, $date);
      }

      if(isset($_POST['usdbtn'])){
        $_SESSION['cashbooktype'] = 'usd';
      }
      if(isset($_POST['ksbtn'])){
        $_SESSION['cashbooktype'] = 'ks';
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
        <form action="" method="POST">
        <div class="card">
          <div class="card-header bg-info text-light"  style="padding:-10px;">
            <?php
            if(empty($_SESSION['cashbooktype'])){
              ?>
                <h5 class="d-inline">Manage Cash Book (MMK)</h5>

                <button type="submit" name="usdbtn" class="btn btn-light text-dark float-end ms-2">
                  Main Cash (USD)
                </button>
              <?php
            }else{
              if($_SESSION['cashbooktype'] == 'usd'){
                ?>
                <h5 class="d-inline">Manage Cash Book (USD)</h5>

                <button type="submit" name="ksbtn" class="btn btn-light text-dark float-end ms-2">
                  Main Cash (MMK)
                </button>
              <?php
              }else{
                ?>
                <h5 class="d-inline">Manage Cash Book (MMK)</h5>

                <button type="submit" name="usdbtn" class="btn btn-light text-dark float-end ms-2">
                  Main Cash (USD)
                </button>
              <?php
              }
            }
              ?>

              <?php
              if(isset($_POST['dbwsearch'])){
                $startdate = $_POST['startdate'];
                $enddate = $_POST['enddate'];
                ?>
                <a href="cashbookexport.php?forment=excel&filter=dbwsearch&startdate=<?= $startdate; ?>&enddate=<?= $enddate; ?>" class="btn btn-success float-end ms-2">Export to Excel</a>
                <?php
              }
              if(isset($_POST['monthlysearch'])){
                $month = $_POST['monthlysearch'];
                $year = date('Y');
                $searchmonth = $year . "-" . $month;
                ?>
                <a href="cashbookexport.php?forment=excel&filter=monthlysearch&month=<?= $searchmonth; ?>" class="btn btn-success float-end ms-2">Export to Excel</a>
                <?php
              }
              if(!isset($_POST['dbwsearch']) && !isset($_POST['monthlysearch'])){
                ?>
                <a href="cashbookexport.php?forment=excel&filter=normal" class="btn btn-success float-end ms-2">Export to Excel</a>
                <?php
              }
              ?>
              <button class="btn btn-secondary float-end" data-bs-toggle="modal" data-bs-target="#addbalance"> Add Balance</button>
            <!-- <div class="float-end">
              <form action="" method="post">
                <?php
                $cashnames = $query->selectdis("cashbook", 'ac_name');
                foreach ($cashnames as $cashname) {
                  if($cashname['ac_name'] == '3600/001'){
                    $btnid = 'ks';
                  }elseif($cashname['ac_name'] == '3600/002'){
                    $btnid = "usd";
                  }
                  $acnamedata = $query->select('acname', $cashname['ac_name'], 'code_no');
                  if(!empty($acnamedata['ac_name'])){
                    $acname = $acnamedata['ac_name'];
                  }else{
                    $acname = '';
                  }
                  ?>
                  <button type="submit" class="btn btn-light btn-sm" name="<?= $btnid; ?>btn" id="<?= $btnid; ?>btn"><i><?= $acname; ?></i></button>
                  <?php
                }
                ?>
              <?php
                if($_POST){
                  if (!empty($_POST['startdate']) || !empty($_POST['enddate'])) {
                    ?>
                    <a href="#" class="btn btn-light ms-2 btn-sm float-end" onclick="window.open('print/cashbookprint.php?startdate=<?php echo $_POST['startdate']; ?>&enddate=<?php echo $_POST['enddate']; ?>')"><i>Print</i></a>
                    <?php
                  }elseif(!empty($_POST['monthlysearch'])){
                    ?>
                    <a href="#" class="btn btn-light ms-2 btn-sm float-end" onclick="window.open('print/cashbookprint.php?monthly=<?php echo $_POST['monthlysearch']; ?>')"><i>Print</i></a>
                    <?php
                  }
                }else{
                  ?>
                  <?php
                }
               ?>
            </div> -->
          </div>
          </form>
          <div class="modal fade" id="addbalance">
                <div class="modal-dialog" role="document">
                  <div class="modal-content text-dark">
                    <div class="modal-header bg-secondary">
                      <h5 class="text-light">Add Opening Amount</h5>
                    </div>
                    <form method="POST">
                      <div class="modal-body">
                        <h6>Date</h6>
                        <input type="date" name="balancedate" class="form-control inpv2 mb-2 mt-2">
                        <h6>Opening Amount</h6>
                        <input type="number" name="balanceamount" class="form-control inpv2 mb-2 mt-2">
                        <h6>AC Code</h6>
                        <select name="balanceac" class="form-control inpv2">
                          <?php
                            $acstmt = $pdo->prepare("SELECT * FROM acname WHERE code_no LIKE '3600%'");
                            $acstmt->execute();
                            $acdatas = $acstmt->fetchAll();
                            foreach($acdatas as $acdata){
                              ?>
                                <option value="<?= $acdata['code_no']; ?>"><?= $acdata['ac_name']; ?></option>
                              <?php
                            }
                          ?>
                        </select>
                        <h6>Particular</h6>
                        <input type="text" name="balanceparticular" class="form-control inpv2">
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" name="addbalance">Add Opening Amount</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
          <div class="card-body">
            <?php
            // if(isset($_POST['deletebutton'])){
            //   $deleteid = $_POST['deleteid'];
            //   $message = $query->deleteaccount('accounts', $deleteid);
            // }
            if(isset($_POST['updatebutton'])){
              $date = $_POST['dateup'];
              $voucher_no = $_POST['voucher_noup'];
              $particular = $_POST['particularup'];
              $debit = $_POST['debitup'];
              $credit = $_POST['creditup'];
              $id = $_POST['updateid'];

              $message = $query->updatecashbookdata($date, $voucher_no, $particular, $debit, $credit, $id);
            }
            // if(isset($_POST['adddata'])){
            //   $date = $_POST['date'];
            //   $serial_no = $_POST['serial_no'];
            //   $ac_name = $_POST['ac_name'];
            //   $particular = $_POST['particular'];
            //   $debit = $_POST['debit'];
            //   $credit = $_POST['credit'];
            //
            //   $message = $query->addcashbookdata('cashbook', $date, $serial_no, $ac_name, $particular, $debit, $credit);
            // }
            ?>
            <?php
              if(!empty($errormessage)){
              ?>
              <div class="alert alert-danger alert-dismissible fade show">
                <strong>Error! </strong> <?php echo $errormessage; ?>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
              </div>
              <?php
            }
            if(!empty($errmessage)){
              ?>
              <div class="alert alert-danger alert-dismissible fade show">
                <strong>Error! </strong> <?php echo $errmessage; ?>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
              </div>
              <?php
            }
            if(!empty($successmessage)){
              ?>
              <div class="alert alert-success alert-dismissible fade show">
                <strong>Success! </strong> <?php echo $successmessage; ?>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
              </div>
              <?php
            }
            ?>
            <div class="row">
              <div class="col-3">
                <form class="d-flex" action="cashbook.php" method="post">
                  <select class="form-control w-50" name="monthlysearch">
                    <option value="">Select Month</option>
                    <option value="01">January</option>
                    <option value="02">Feburary</option>
                    <option value="03">March</option>
                    <option value="04">April</option>
                    <option value="05">May</option>
                    <option value="06">June</option>
                    <option value="07">July</option>
                    <option value="08">August</option>
                    <option value="09">September</option>
                    <option value="10">October</option>
                    <option value="11">November</option>
                    <option value="12">December</option>
                  </select>
                  <button type="submit" name="monthsearchbtn" class="btn btn-primary btn-sm">Search Monthly</button>
                </form>
              </div>
              <div class="col-9">
                <form class="d-flex" action="cashbook.php" method="post">
                  <span class="mt-2">Start Date:</span>
                  <input type="date" name="startdate" class="form-control" style="width: 35%;">
                  <span class="mt-2">End Date</span>
                  <input type="date" name="enddate" class="form-control" style="width: 35%;">
                  <button type="submit" name="dbwsearch" class="btn btn-primary btn-sm">Search</button>
                </form>
              </div>
            </div>
            <br>
            <!-- <button type="button" class="btn btn-success float-end" data-bs-toggle="modal" data-bs-target="#addmodal">
              Add New Cash Data
            </button> -->
            <table class="table table-bordered table-striped rounded">
              <tr>
                <th>No.</th>
                <th>Date</th>
                <th>Voucher No</th>
                <th>A/C Name</th>
                <th>Particular</th>
                <th>Debit</th>
                <th>Credit</th>
                <th>Balance</th>
                <th>Action</th>
              </tr>
              <?php
              if(isset($_POST['dbwsearch'])){
                $startdate = $_POST['startdate'];
                $enddate = $_POST['enddate'];
                // $cashdatas = $query->selectdbw('cashbook', $startdate, $enddate);
                if (empty($_SESSION['cashbooktype']) || $_SESSION['cashbooktype'] == 'ks') {
                  $cashstmt = $pdo->prepare("SELECT * FROM cashbook WHERE `date` BETWEEN '$startdate' AND '$enddate' AND ac_name='3600/001'");
                }else{
                  $cashstmt = $pdo->prepare("SELECT * FROM cashbook WHERE `date` BETWEEN '$startdate' AND '$enddate' AND ac_name='3600/002'");
                }

                $cashstmt->execute();
                $cashdatas = $cashstmt->fetchall();
              }elseif(isset($_POST['monthsearchbtn'])){
                $stmt = $pdo->prepare("SELECT * FROM cashbook WHERE date LIKE '%$search%'");
                $stmt->execute();
                $cashdatas = $stmt->fetchall();
              }else{
                if (empty($_SESSION['cashbooktype']) || $_SESSION['cashbooktype'] == 'ks') {
                  $stmt = $pdo->prepare("SELECT * FROM cashbook WHERE ac_name='3600/001' ORDER BY date, id");
                }else{
                  $stmt = $pdo->prepare("SELECT * FROM cashbook WHERE ac_name='3600/002' ORDER BY date, id");
                }
                $stmt->execute();
                $cashdatas = $stmt->fetchAll();
              }
              ?>
              <?php
              $idd = 1;
              foreach ($cashdatas as $cashdata) {
                $rowid = $cashdata['id'];
                $interfacerowid = $cashdata['interfacerowid'];
                $idupdatestmt = $pdo->prepare("UPDATE cashbook SET interfacerowid = '$idd' WHERE id='$rowid'");
                $idupdatestmt->execute();
                $date = $cashdata['date'];
                 if(empty($cashdata['voucher_no'])){
                  // balancecalculate
                 $transactionid = $cashdata['transactionid'];

                 $lastrowstmt = $pdo->prepare("SELECT balance FROM cashbook WHERE interfacerowid>'$interfacerowid'");

                 $lastrowstmt->execute();
                 $lastrowdata = $lastrowstmt->fetch(PDO::FETCH_ASSOC);
                 }else{
                  // balancecalculate
                 $transactionid = $cashdata['transactionid'];

                 $lastrowstmt = $pdo->prepare("SELECT balance FROM cashbook WHERE interfacerowid<'$interfacerowid' ORDER BY id DESC");

                 $lastrowstmt->execute();
                 $lastrowdata = $lastrowstmt->fetch(PDO::FETCH_ASSOC);
                 }
                if(!empty($cashdata['voucher_no'])){
                  if(!empty($cashdata['ac_name'])){
                    $voucher_no = $cashdata['voucher_no'];
                  $ac_code = $cashdata['ac_name'];
                  $acselectstmt = $pdo->prepare("SELECT * FROM transaction WHERE voucher_no=:voucher_no AND ac_code!='$ac_code'");
                  $acselectstmt->execute([
                    ':voucher_no' => $voucher_no
                  ]);
                  $acselect = $acselectstmt->fetch(PDO::FETCH_ASSOC);
                  $accode = $acselect['ac_code'];
                  if (empty($_SESSION['cashbooktype']) || $_SESSION['cashbooktype'] == 'ks') {
                    $debit = $cashdata['debit'];
                    $credit = $cashdata['credit'];
                    // $balance = $cashdata['balance'];
                    if(!empty($lastrowdata)){
                      $balance = ($debit + $lastrowdata['balance']) - $credit;
                    }else{
                      $balance = ($debit + 0) - $credit;
                    }
                    // balancecalculate

                    // balanceupdate
                    if($cashdata['balance'] != $balance){
                      $balanceupdatestmt = $pdo->prepare("UPDATE cashbook SET balance='$balance' WHERE id='$rowid'");
                      $balanceupdatestmt->execute();
                    }else{
                      $balance = $cashdata['balance'];
                    }
                    // balanceupdate
                  }else{
                    if($acselect['debit'] != 0){
                      $debitorcredit = 'debit';
                    }else{
                      $debitorcredit = 'credit';
                    }


                    // Dollor Change
                    $transactionid = $cashdata['transactionid'];
                    $acselectstmt = $pdo->prepare("SELECT * FROM currency WHERE voucher_no=:voucher_no AND debitorcredit='$debitorcredit' AND transactionid='$transactionid'");
                    $acselectstmt->execute([
                      ':voucher_no' => $voucher_no
                    ]);
                    $rateselect = $acselectstmt->fetch(PDO::FETCH_ASSOC);

                    if(!empty($rateselect['dollar_rate'])){
                      if($cashdata['debit'] != 0){
                        $debit = $cashdata['debit'] / $rateselect['dollar_rate'];
                      }else{
                        $credit = $cashdata['credit'] / $rateselect['dollar_rate'];
                      }
                    }else{
                      if($cashdata['debit'] != 0){
                        echo $debit = $cashdata['debit'];

                      }else{
                        echo "";
                        $credit = $cashdata['credit'];
                      }
                    }



                    if(!empty($rateselect['dollar_rate'])){
                      $balance = $cashdata['balance'];
                    }
                    // Dollor Change
                  }
                  }else{
                    $balance = $cashdata['balance'];
                  }
                }else{
                  $balance = $cashdata['balance'];
                }

                $crossac_nameid = $cashdata['crossac_name'];
                $crossacnamestmt = $pdo->prepare("SELECT * FROM acname WHERE code_no='$crossac_nameid'");
                $crossacnamestmt->execute();
                $crossacnamedata = $crossacnamestmt->fetch(PDO::FETCH_ASSOC);

                ?>
                <tr>
                  <td><?php echo $idd; ?></td>
                  <td><?php echo date('d-m-Y', strtotime($cashdata['date'])); ?></td>
                  <td><?php echo $cashdata['voucher_no']; ?></td>
                  <td><?php if(!empty($crossacnamedata['ac_name'])){ echo $crossacnamedata['ac_name'];}; ?></td>
                  <td><?php echo $cashdata['particular']; ?></td>
                  <td><?php if($cashdata['debit'] == 0){echo "";}else{echo round($debit, 2);}; ?></td>
                  <td><?php if($cashdata['credit'] == 0){echo "";}else{echo round($credit, 2);}; ?></td>
                  <td><?php echo round($cashdata['balance'], 2); ?></td>
                  <td>
                    <?php
                      if(!empty($crossacnamedata['ac_name'])){
                        ?>
                        <a href="edittransaction.php?voucher_no=<?= $cashdata['voucher_no']; ?>&file=cashbook&transactionid=<?php if(!empty($cashdata['transactionid'])){echo $cashdata['transactionid'];}; ?>&id=<?= $cashdata['id']; ?>&ac_code=<?php if(!empty($cashdata['ac_name'])){ echo $cashdata['ac_name']; } ?>&crossac_code=<?php if(!empty($crossac_nameid)){ echo $crossac_nameid; } ?>">
                          <button type="button" class="btn btn-warning btn-sm text-light"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                              <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                              <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                            </svg>
                          </button>
                        </a>
                        <?php
                      }else{
                        ?>
                          <button type="button" class="btn btn-warning btn-sm text-light" data-bs-toggle="modal" data-bs-target="#updatebalance<?= $cashdata['id']; ?>"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                              <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                              <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                            </svg>
                          </button>
                        <?php
                      }
                    ?>
                  </td>
                </tr>
              <!-- Data Update Modal -->
              <div class="modal fade" id="updatebalance<?= $cashdata['id']; ?>">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header bg-warning">
                      <h5 class="modal-title text-light">Update Opening Amount</h5>
                    </div>
                    <div class="modal-body">
                      <!-- Your modal content goes here -->
                      <form method="POST" action="">
                        <input type="hidden" name="updatebalanceid" value="<?= $cashdata['id']; ?>">
                        <div class="form-group">
                          <h6>Date</h6>
                          <input type="date" name="updatebalancedate" class="form-control inpv2 mb-2 mt-2" value="<?= $cashdata['date']; ?>">
                          <label for="newBalance">Opening Amount</label>
                          <input type="number" class="form-control inpv2" name="updatebalanceamount" value="<?= $cashdata['balance']; ?>">
                          <h6>AC Code</h6>
                          <select name="updatebalanceaccode" class="form-control inpv2">
                            <?php
                              $acstmt = $pdo->prepare("SELECT * FROM acname WHERE code_no LIKE '3600%'");
                              $acstmt->execute();
                              $acdatas = $acstmt->fetchAll();
                              foreach($acdatas as $acdata){
                                ?>
                                  <option value="<?= $acdata['code_no']; ?>" <?php if($acdata['ac_name'] == $cashdata['ac_name']){ echo "selected";} ?>><?= $acdata['ac_name']; ?></option>
                                <?php
                              }
                            ?>
                          </select>
                          <h6>Particular</h6>
                          <input type="text" name="updatebalanceparticular" class="form-control inpv2" value="<?= $cashdata['particular']; ?>">
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" name="updatebalance">Update</button>
                      </form>
                      </div>
                  </div>
                </div>
              </div>
              <div class="modal fade" id="updatemodal<?php echo $cashdata['id']; ?>" tabindex="-1" role="dialog" aria-hidden="true">
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
                        $id = $cashdata['id'];
                        $updatedata = $query->select('cashbook', $id, 'id');
                        $voucher_no = $updatedata['voucher_no'];
                        $acstmt = $pdo->prepare("SELECT ac_code FROM transaction WHERE voucher_no=:voucher_no");
                        $acstmt->execute([
                          ':voucher_no' => $voucher_no
                        ]);
                        $acdata = $acstmt->fetch(PDO::FETCH_ASSOC);
                        $ac_code = $acdata['ac_code'];
                        $acnamedata = $query->select('acname', $ac_code, 'code_no');

                        ?>
                        <input type="hidden" name="updateid" value="<?php echo $cashdata['id']; ?>">
                        <div class="row">
                          <div class="col">
                            <label>Date</label>
                            <input type="date" name="dateup" class="form-control inpv2 mb-2" value="<?= $updatedata['date']; ?>">
                          </div>
                          <div class="col">
                            <label>Voucher No</label>
                            <input type="text" name="voucher_noup" class="form-control inpv2 mb-2" value="<?= $updatedata['voucher_no']; ?>">
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <label>A/C Name</label>
                            <input type="text" name="ac_nameup" class="form-control inpv2 mb-2" disabled value="<?= $acnamedata['ac_name']; ?>">
                          </div>
                          <div class="col">
                            <label>Particular</label>
                            <input type="text" name="particularup" class="form-control inpv2 mb-2" value="<?= $updatedata['particular']; ?>">
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <label>Debit</label>
                            <input type="number" name="debitup" class="form-control inpv2 mb-2" value="<?= $updatedata['debit']; ?>">
                          </div>
                          <div class="col">
                            <label>Credit</label>
                            <input type="number" name="creditup" class="form-control inpv2 mb-2" value="<?= $updatedata['credit']; ?>">
                          </div>
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-warning" name="updatebutton">Update</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
              <!-- Update Modal -->
              <?php
              $idd++;
              };
              if(!empty($cashdata['ac_name'])){
                $ac_name = $cashdata['ac_name'];
              }else{
                $ac_name = '';
              }
                  if(!empty($_SESSION['cashbooktype']) && $_SESSION['cashbooktype'] != 'usd'){
                    $total_debit = $query->selectallsumcheck('cashbook', 'debit', 'total_debit', 'ac_name', $ac_name);
                    $total_credit = $query->selectallsumcheck('cashbook', 'credit', 'total_credit', 'ac_name', $ac_name);
                    $balancestmt = $pdo->prepare("SELECT balance FROM cashbook WHERE ac_name='$ac_name' ORDER BY id DESC");
                    $balancestmt->execute();
                    $balance = $balancestmt->fetch(PDO::FETCH_ASSOC);
                    ?>
                    <tr style="font-weight: bold;">
                      <td>Total:</td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td><?php echo $total_debit['total_debit'] ?></td>
                      <td><?php if($total_credit['total_credit'] != 0){ echo $total_credit['total_credit'];} ?></td>
                      <td><?php if(!empty($balance['balance'])){echo $balance['balance'];}; ?></td>
                      <td></td>
                    </tr>
                    <?php
                  }elseif(empty($_SESSION['cashbooktype']) || $_SESSION['cashbooktype'] == 'usd'){
                    // echo $ac_name;
                    $total_debit = $query->selectallsumcheck('cashbook', 'debit', 'total_debit', 'ac_name', $ac_name);
                    $total_credit = $query->selectallsumcheck('cashbook', 'credit', 'total_credit', 'ac_name', $ac_name);
                    // print_r($total_debit);





                    // Dollor Change
                    ?>
                    <tr style="font-weight: bold;">
                      <td>Total:</td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td><?php if(!empty($total_debit['total_debit'])){ echo $total_debit['total_debit'];} ?></td>
                      <td><?php if(!empty($total_credit['total_credit'])){ echo $total_credit['total_credit'];} ?></td>
                      <td><?php echo $total_debit['total_debit'] - $total_credit['total_credit']; ?></td>
                      <td></td>
                    </tr>
                    <?php
                  }
                  ?>
            </table>
          </div>
        </div>
      </div>
    </div>

  <!-- Data Add Modal -->
  <div class="modal fade" id="addmodal" tabindex="-1" role="dialog" aria-hidden="true" style="margin-left:auto !important; margin-right: auto !important;">
    <div class="modal-dialog" role="document">
      <div class="modal-content" style="width: 750px !important; margin-top:70px !important;">
        <div class="modal-header bg-primary text-light">
          <h5 class="modal-title" id="addmodellabel">Create New Data</h5>
          <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true" class="h3">&times;</span>
          </button>
        </div>
        <form action="cashbook.php" method="post" autocomplete="off">
          <div class="modal-body">
            <div class="row">
              <div class="col">
                <label style="font-weight:bold;">Date</label>
                <input type="date" name="date" class="form-control inpv2" placeholder="Date">
              </div>
              <div class="col">
                <label style="font-weight:bold;">Voucher No</label>
                <input type="text" name="serial_no" class="form-control inpv2" placeholder="Voucher No">
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label class="mt-2" style="font-weight:bold;">A/C Name</label>
                <input type="text" name="ac_name" class="form-control inpv2" placeholder="A/C Name">
                <label class="mt-2" style="font-weight:bold;">Debit</label>
                <input type="number" name="debit" class="form-control inpv2" placeholder="Debit">
              </div>
              <div class="col">
                <label class="mt-2" style="font-weight:bold;">Particular</label>
                <textarea name="particular" rows="4" cols="80" class="form-control inpv2" placeholder="Particular"></textarea>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label class="mt-2" style="font-weight:bold;">Credit</label>
                <input type="number" name="credit" class="form-control inpv2" placeholder="Credit">
              </div>
              <div class="col mt-4">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-success" name="adddata">Add Data</button>
              </div>
            </div>
          </div>
          <div class="modal-footer">
          </div>
        </form>
      </div>
    </div>
  </div>
  <!-- Add Modal -->

  <script type="text/javascript">
    $(document).ready(function(){
      <?php
      if(!empty($_SESSION['cashbooktype'])){
        if($_SESSION['cashbooktype'] == 'usd'){
          ?>
          $('#usdbtn').hide();
          $('#ksbtn').show();
          <?php
        }else{
          ?>
          $('#usdbtn').show();
          $('#ksbtn').hide();
          <?php
        }
      }else{
        ?>
        $('#usdbtn').hide();
        $('#ksbtn').show();
        <?php
      }
       ?>
    });
  </script>
    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
