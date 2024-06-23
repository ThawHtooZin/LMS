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

      if(isset($_POST['searchacnamebtn'])){
        $_SESSION['search']['acnamesearch'] = $_POST['searchacname'];
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
                <div class="card-header text-light bg-info">
                    
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

            </div>
        </form>

                <div class="card-body">
                <div class="row">
                    <!-- <div class="col-3">
                        <form class="d-flex" action="cashbook.php" method="post">
                            <select class="form-control w-50" name="searchacname">
                                <option value="">Select Ac Name</option>
                                <?php
                                    $acnamestmt = $pdo->prepare("SELECT * FROM acname WHERE code_no NOT LIKE '%3600/%'");
                                    $acnamestmt->execute();
                                    $acnamedatas = $acnamestmt->fetchAll();
                                    foreach($acnamedatas as $acnamedata){
                                        ?>
                                            <option value="<?= $acnamedata['code_no']; ?>"><?= $acnamedata['ac_name']; ?></option>
                                        <?php
                                    }
                                ?>
                            </select>
                            <button type="submit" name="searchacnamebtn" class="btn btn-primary btn-sm">Search Ac Name</button>
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
                    </div> -->
                </div>
                    <?php
                        // if(!empty($_SESSION['search'])){
                            ?>
                                <table class="table table-bordered table-striped rounded mt-3">
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
                                        if(!empty($_SESSION['search']['acnamesearch'])){
                                            $acnamesearch = $_SESSION['search']['acnamesearch'];
                                            if (empty($_SESSION['cashbooktype']) || $_SESSION['cashbooktype'] == 'ks') {
                                                $cashbookstmt = $pdo->prepare("SELECT * FROM cashbook WHERE ac_name='3600/001' AND crossac_name = '$acnamesearch'");
                                            }else{
                                                $cashbookstmt = $pdo->prepare("SELECT * FROM cashbook WHERE ac_name='3600/002' AND crossac_name = '$acnamesearch'");
                                            } 
                                        }else{
                                            if (empty($_SESSION['cashbooktype']) || $_SESSION['cashbooktype'] == 'ks') {
                                                $cashbookstmt = $pdo->prepare("SELECT * FROM cashbook WHERE ac_name='3600/001'");
                                            }else{
                                                $cashbookstmt = $pdo->prepare("SELECT * FROM cashbook WHERE ac_name='3600/002'");
                                            } 
                                        }
                                        $cashbookstmt->execute();
                                        $cashbookdatas = $cashbookstmt->fetchAll();
                                        $iddd = 1;
                                        foreach($cashbookdatas as $cashbookdata){
                                            $rowid = $cashbookdata['id'];
                                            // Get name of cross ac_name
                                            $ac_name = $query->selectacname($cashbookdata['crossac_name']);
                                            if(!empty($ac_name)){
                                                $ac_name = $ac_name['ac_name'];
                                            }
                                            if($cashbookdata['debit'] != 0){
                                                $debitorcredit = 'debit';
                                            }else{
                                                $debitorcredit = 'credit';
                                            }
                                            $voucher_no = $cashbookdata['voucher_no'];
                        
                                            

                                            
                                            if (empty($_SESSION['cashbooktype']) || $_SESSION['cashbooktype'] == 'ks') {
                                                // Dollor Change
                                                
                                                // Check if row is balance
                                                if(empty($cashbookdata['crossac_name']) && empty($cashbookdata['voucher_no'])){
                                                    $rowname = 'balance';
                                                    $balance = $cashbookdata['balance'];
                                                }else{
                                                    $rowname = '';
                                                }

                                                if($iddd == 1){
                                                    $firstrow = true;
                                                }else{
                                                    $firstrow = false;
                                                }
                                                
                                                // --- Balance Calculate
                                                if($rowname != 'balance'){
                                                    $debit = $cashbookdata['debit'];
                                                    $credit = $cashbookdata['credit'];
                                                    
                                                    // Calculate balance
                                                    if($firstrow !== true){
                                                        $balance += intval($debit) - intval($credit);
                                                    }else{
                                                        $balance = intval($debit) - intval($credit);
                                                    }
                                                    $balanceupdatestmt = $pdo->prepare("UPDATE cashbook SET balance='$balance' WHERE id='$rowid'");
                                                    $balanceupdatestmt->execute();
                                                }
                                            }else{
                                                // Dollor Change
                                                $transactionid = $cashbookdata['transactionid'];
                                                $acselectstmt = $pdo->prepare("SELECT * FROM currency WHERE voucher_no=:voucher_no AND debitorcredit='$debitorcredit' AND transactionid='$transactionid'");
                                                $acselectstmt->execute([
                                                    ':voucher_no' => $voucher_no
                                                ]);
                                                $rateselect = $acselectstmt->fetch(PDO::FETCH_ASSOC);
                            
                                                if(!empty($rateselect['dollar_rate'])){
                                                    if($cashbookdata['debit'] != 0){
                                                    $debit = $cashbookdata['debit'] / $rateselect['dollar_rate'];
                                                    }else{
                                                    $credit = $cashbookdata['credit'] / $rateselect['dollar_rate'];
                                                    }
                                                }else{
                                                    if($cashbookdata['debit'] != 0){
                                                    $debit = $cashbookdata['debit'];
                            
                                                    }else{
                                                    $credit = $cashbookdata['credit'];
                                                    }
                                                }
                            
                            
                            
                                                if(!empty($rateselect['dollar_rate'])){
                                                    $balance = $cashbookdata['balance'];
                                                }
                                            }
                                            // ---
                                        ?>
                                    <tr>
                                        <td><?= $iddd; ?></td>
                                        <td><?= date('d-m-Y', strtotime($cashbookdata['date'])); ?></td>
                                        <td><?= $cashbookdata['voucher_no']; ?></td>
                                        <td><?= $ac_name; ?></td>
                                        <td><?= $cashbookdata['particular']; ?></td>
                                        <td><?php if($cashbookdata['debit'] == 0){echo "";}else{echo round($debit, 2);}; ?></td>
                                        <td><?php if($cashbookdata['credit'] == 0){echo "";}else{echo round($credit, 2);}; ?></td>
                                        <td><?php echo round($cashbookdata['balance'], 2); ?></td>
                                        <td>
                                            <?php
                                            if(!empty($ac_name)){
                                                ?>
                                                <a href="edittransaction.php?voucher_no=<?= $cashbookdata['voucher_no']; ?>&file=cashbook&transactionid=<?php if(!empty($cashbookdata['transactionid'])){echo $cashbookdata['transactionid'];}; ?>&id=<?= $cashbookdata['id']; ?>&ac_code=<?php if(!empty($cashbookdata['ac_name'])){ echo $cashbookdata['ac_name']; } ?>&crossac_code=<?php if(!empty($cashbookdata['crossac_name'])){ echo $cashbookdata['crossac_name']; } ?>">
                                                <button type="button" class="btn btn-warning btn-sm text-light"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                                    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                                    <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                                    </svg>
                                                </button>
                                                </a>
                                                <?php
                                            }else{
                                                ?>
                                                <button type="button" class="btn btn-warning btn-sm text-light" data-bs-toggle="modal" data-bs-target="#updatebalance<?= $cashbookdata['id']; ?>"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
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
                                    <?php
                                    if(empty($cashbookdata['crossac_name']) && empty($cashbookdata['voucher_no'])){
                                    ?>
                                    <div class="modal fade" id="updatebalance<?= $cashbookdata['id']; ?>">
                                        <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header bg-warning">
                                            <h5 class="modal-title text-light">Update Opening Amount</h5>
                                            </div>
                                            <div class="modal-body">
                                            <!-- Your modal content goes here -->
                                            <form method="POST" action="">
                                                <input type="hidden" name="updatebalanceid" value="<?= $cashbookdata['id']; ?>">
                                                <div class="form-group">
                                                <h6>Date</h6>
                                                <input type="date" name="updatebalancedate" class="form-control inpv2 mb-2 mt-2" value="<?= $cashbookdata['date']; ?>">
                                                <label for="newBalance">Opening Amount</label>
                                                <input type="number" class="form-control inpv2" name="updatebalanceamount" value="<?= $cashbookdata['balance']; ?>">
                                                <h6>AC Code</h6>
                                                <select name="updatebalanceaccode" class="form-control inpv2">
                                                    <?php
                                                    $acstmt = $pdo->prepare("SELECT * FROM acname WHERE code_no LIKE '3600%'");
                                                    $acstmt->execute();
                                                    $acdatas = $acstmt->fetchAll();
                                                    foreach($acdatas as $acdata){
                                                        ?>
                                                        <option value="<?= $acdata['code_no']; ?>" <?php if($acdata['ac_name'] == $cashbookdata['ac_name']){ echo "selected";} ?>><?= $acdata['ac_name']; ?></option>
                                                        <?php
                                                    }
                                                    ?>
                                                </select>
                                                <h6>Particular</h6>
                                                <input type="text" name="updatebalanceparticular" class="form-control inpv2" value="<?= $cashbookdata['particular']; ?>">
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
                                    <?php
                                    }
                                    ?>
                                    <?php
                                    $iddd++;
                                    }
                                    if(!empty($cashbookdata['ac_name'])){
                                        $ac_name = $cashbookdata['ac_name'];
                                    }else{
                                        $ac_name = '';
                                    }
                                        if(!empty($_SESSION['cashbooktype']) && $_SESSION['cashbooktype'] != 'usd'){
                                            if(!empty($_SESSION['search']['acnamesearch'])){
                                                $crossac_name = $_SESSION['search']['acnamesearch'];
                                                $totaldebitstmt = $pdo->prepare("SELECT SUM(debit) AS total_debit FROM cashbook WHERE ac_name='$ac_name' AND crossac_name = '$crossac_name'");
                                                $totaldebitstmt->execute();
                                                $total_debit = $totaldebitstmt->fetch(PDO::FETCH_ASSOC);

                                                $totalcreditstmt = $pdo->prepare("SELECT SUM(debit) AS total_debit FROM cashbook WHERE ac_name='$ac_name' AND crossac_name = '$crossac_name'");
                                                $totalcreditstmt->execute();
                                                $total_credit = $totalcreditstmt->fetch(PDO::FETCH_ASSOC);
                                                
                                                $balancestmt = $pdo->prepare("SELECT * FROM cashbook WHERE interfacerowid='1'");
                                                $balancestmt->execute();
                                                $balancedata = $balancestmt->fetch(PDO::FETCH_ASSOC);
                                            }else{
                                                $total_debit = $query->selectallsumcheck('cashbook', 'debit', 'total_debit', 'ac_name', $ac_name);
                                                $total_credit = $query->selectallsumcheck('cashbook', 'credit', 'total_credit', 'ac_name', $ac_name);
                                                $balancestmt = $pdo->prepare("SELECT * FROM cashbook WHERE interfacerowid='1'");
                                                $balancestmt->execute();
                                                $balancedata = $balancestmt->fetch(PDO::FETCH_ASSOC);
                                            }
                                            $balance = ($total_debit['total_debit'] + $balancedata['balance']) - $total_credit['total_credit'];
                                            ?>
                                            <tr style="font-weight: bold;">
                                            <td>Total:</td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td><?php echo $total_debit['total_debit'] ?></td>
                                            <td><?php if($total_credit['total_credit'] != 0){ echo $total_credit['total_credit'];} ?></td>
                                            <td><?php if(!empty($balance)){echo $balance;}; ?></td>
                                            <td></td>
                                            </tr>
                                            <?php
                                        }elseif(empty($_SESSION['cashbooktype']) || $_SESSION['cashbooktype'] == 'usd'){
                                            // echo $ac_name;
                                            $total_debit = $query->selectallsumcheck('cashbook', 'debit', 'total_debit', 'ac_name', $ac_name);
                                            $total_credit = $query->selectallsumcheck('cashbook', 'credit', 'total_credit', 'ac_name', $ac_name);
                                            // print_r($total_debit);
                                            $opening_amountstmt = $pdo->prepare("SELECT * FROM cashbook ORDER BY id asc");
                                            $opening_amountstmt->execute();
                                            $opening_amount = $opening_amountstmt->fetch(PDO::FETCH_ASSOC);
                        
                        
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
                                            <td><?php echo $opening_amount['balance']+ $total_debit['total_debit'] - $total_credit['total_credit']; ?></td>
                                            <td></td>
                                            </tr>
                                            <?php
                                        }
                                    ?>
                                </table>
                            <?php
                        // }else{
                            ?>
                            <!-- <h4 class="text-center mt-5 text-info">Search To See Result!</h4> -->
                            <?php
                        // }
                    ?>
                </div>
            </div>

        </div>
    </div>
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