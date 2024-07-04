<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();


if(!empty($_GET['startdate'])){
  $startdate = $_GET['startdate'];
}else{
  $startdate = '';
}

if(!empty($_GET['enddate'])){
  $enddate = $_GET['enddate'];
}else{
  $enddate = '';
}

if(!empty($_GET['searchacname'])){
  echo $acnamesearch = $_GET['searchacname'];
}else{
  $acnamesearch = '';
}

if($_GET['forment'] == 'excel'){
  header("Content-Type: application/xls");
  header("Content-Disposition: attachment; filename=CashBookMMK.xls");
  header("Pragma: no-cache");
  header("Expires: 0");

  ?>
  <table class="table table-bordered table-striped rounded mt-3" border="1">
    <tr>
        <th>No.</th>
        <th>Date</th>
        <th>Voucher No</th>
        <th>A/C Name</th>
        <th>Particular</th>
        <th>Debit</th>
        <th>Credit</th>
        <th>Balance</th>
    </tr>
    <?php 
        if($acnamesearch != ''){
            if (empty($_SESSION['cashbooktype']) || $_SESSION['cashbooktype'] == 'ks') {
                $cashbookstmt = $pdo->prepare("SELECT * FROM cashbook WHERE ac_name='3600/001' AND crossac_name = '$acnamesearch'");
            }else{
                $cashbookstmt = $pdo->prepare("SELECT * FROM cashbook WHERE ac_name='3600/002' AND crossac_name = '$acnamesearch'");
            } 
        }elseif($startdate != '' && $enddate != ''){
            if (empty($_SESSION['cashbooktype']) || $_SESSION['cashbooktype'] == 'ks') {
                $cashbookstmt = $pdo->prepare("SELECT * FROM cashbook WHERE ac_name='3600/001' AND date BETWEEN '$startdate' AND '$enddate'");
            }else{
                $cashbookstmt = $pdo->prepare("SELECT * FROM cashbook WHERE ac_name='3600/002' AND date BETWEEN '$startdate' AND '$enddate'");
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

    </tr>
    <!-- Data Update Modal -->
    <?php
    if(empty($cashbookdata['crossac_name']) && empty($cashbookdata['voucher_no'])){
    ?>
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
    if(empty($_SESSION['cashbooktype']) || $_SESSION['cashbooktype'] != 'usd'){
            if(!empty($acnamesearch)){
                $crossac_name = $acnamesearch;
                $totaldebitstmt = $pdo->prepare("SELECT SUM(debit) AS total_debit FROM cashbook WHERE crossac_name = '$crossac_name' AND ac_name='3600/001'");
                $totaldebitstmt->execute();
                $total_debit = $totaldebitstmt->fetch(PDO::FETCH_ASSOC);

                $totalcreditstmt = $pdo->prepare("SELECT SUM(credit) AS total_credit FROM cashbook WHERE ac_name='$ac_name' AND crossac_name = '$crossac_name' AND ac_name='3600/001'");
                $totalcreditstmt->execute();
                $total_credit = $totalcreditstmt->fetch(PDO::FETCH_ASSOC);
                
                $balance = $total_debit['total_debit'] - $total_credit['total_credit'];
            }elseif(!empty($startdate) && !empty($enddate)){
              $totaldebitstmt = $pdo->prepare("SELECT SUM(debit) AS total_debit FROM cashbook WHERE ac_name='3600/001' AND date BETWEEN '$startdate' AND '$enddate'");
              $totaldebitstmt->execute();
              $total_debit = $totaldebitstmt->fetch(PDO::FETCH_ASSOC);
              $totalcreditstmt = $pdo->prepare("SELECT SUM(credit) AS total_credit FROM cashbook WHERE ac_name='3600/001' AND date BETWEEN '$startdate' AND '$enddate'");
              $totalcreditstmt->execute();
              $total_credit = $totalcreditstmt->fetch(PDO::FETCH_ASSOC);
              
              $balance = $total_debit['total_debit'] - $total_credit['total_credit'];
          }else{
                $total_debit = $query->selectallsumcheck('cashbook', 'debit', 'total_debit', 'ac_name', $ac_name);
                $total_credit = $query->selectallsumcheck('cashbook', 'credit', 'total_credit', 'ac_name', $ac_name);
                $openingamtstmt = $pdo->prepare("SELECT * FROM cashbook ORDER BY id ASC");
                $openingamtstmt->execute();
                $openingbalance = $openingamtstmt->fetch(PDO::FETCH_ASSOC);
                $balance = ($total_debit['total_debit'] + $openingbalance['balance']) - $total_credit['total_credit'];
            }
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
            </tr>
            <?php
        }elseif(!empty($_SESSION['cashbooktype']) && $_SESSION['cashbooktype'] == 'usd'){
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
            </tr>
            <?php
        }
    ?>
</table>
  <?php
}else{
  header('location:cashbook.php');
}
  exit();


?>
