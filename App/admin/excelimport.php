<?php

session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();

include '../../vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

if (isset($_REQUEST['excelimportbtn'])) {
  if (isset($_POST['importtable'])) {
    $file = $_FILES['excelfile']['tmp_name'];
    $extension = pathinfo($_FILES['excelfile']['name'], PATHINFO_EXTENSION);
    if ($extension == 'xlsx' || $extension == 'xls' || $extension == 'csv') {
      $obj = PhpOffice\PhpSpreadsheet\IOFactory::load($file);
      $data = $obj->getActiveSheet()->toArray();
      if ($_POST['importtable'] == 'transaction') {
        foreach ($data as $row) {
          $date = date('Y-m-d', strtotime($row[0]));
          $voucher_no = $row[1];
          $ac_code = $row[2];
          $description = $row[3];
          $debit = $row[4];
          $credit = $row[5];
          $currency = $row[6];
          $sr_no = $row[7];
          $container_no = $row[8];
          $bank_charges = $row[9];
          if (!empty($row[10])) {
            $rate = $row[10];
          } else {
            $rate = 1;
          }

          $stmt = $pdo->prepare("INSERT INTO transaction(date, voucher_no,ac_code,description,debit,credit,currency,sr_no,container_no,bank_charges) VALUES(:date, :voucher_no,:ac_code,:description,:debit,:credit,:currency,:sr_no,:container_no,:bank_charges)");
          $stmt->execute([
            ':date' => $date,
            ':voucher_no' => $voucher_no,
            ':ac_code' => $ac_code,
            ':description' => $description,
            ':debit' => $debit,
            ':credit' => $credit,
            ':currency' => $currency,
            ':sr_no' => $sr_no,
            ':container_no' => $container_no,
            ':bank_charges' => $bank_charges,
          ]);



          if (!empty($debit)) {
            $debitorcredit = 'debit';

            if ($currency == 'usd') {
              $mmk_amount = floatval($rate) * floatval($debit);
              $usd_amount = $debit;
            } elseif ($currency == 'mmk') {
              $mmk_amount = $debit;
              $usd_amount = 0;
            }
          } elseif (!empty($credit)) {
            $debitorcredit = 'credit';
            if ($currency == 'usd') {
              $mmk_amount = floatval($rate) * floatval($credit);
              $usd_amount = $credit;
            } elseif ($currency == 'mmk') {
              $mmk_amount = $credit;
              $usd_amount = 0;
            }
          }

          $idstmt = $pdo->prepare("SELECT * FROM transaction ORDER BY id DESC");
          $idstmt->execute();
          $iddata = $idstmt->fetch(PDO::FETCH_ASSOC);
          $transactionid = $iddata['id'];
          $currencystmt = $pdo->prepare("INSERT INTO currency(dollar_rate, debitorcredit, mmk_amount, usd_amount, voucher_no, transactionid) VALUES('$rate', '$debitorcredit', '$mmk_amount', '$usd_amount', :voucher_no, '$transactionid')");
          $currencystmt->execute([
            ':voucher_no' => $voucher_no,
          ]);
        }
      }

      if ($_POST['importtable'] == 'purchase') {
        foreach ($data as $row) {
          if ($row[0] != '' || $row[1] != '') {
            $no = $row[0];
            $date = date('Y-m-d', strtotime($row[1]));
            $voucher_no = $row[2];
            $supplier_name = $row[3];
            $tclfrozen = $row[4];
            $commondity = $row[5];
            $size = $row[6];
            $viss = $row[7];
            if (!empty($row[8])) {
              $pcs = $row[8];
            } else {
              $pcs = 0;
            }
            $price = $row[9];
            $amount = $row[10];

            $stmt = $pdo->prepare("INSERT INTO purchase(date,voucher_no,supplier_id,tclfrozen,commodity,size,viss,pcs,price,amount) VALUES(:date,:voucher_no,:supplier_id,:tclfrozen,:commondity,:size,:viss,:pcs,:price,:amount)");
            $stmt->execute([
              ':date' => $date,
              ':voucher_no' => $voucher_no,
              ':supplier_id' => $supplier_name,
              ':tclfrozen' => $tclfrozen,
              ':commondity' => $commondity,
              ':size' => $size,
              ':viss' => $viss,
              ':pcs' => $pcs,
              ':price' => $price,
              ':amount' => $amount,
            ]);
            $balstmt = $pdo->prepare("SELECT balance FROM payable WHERE supplier_id = '$supplier_name' ORDER BY id DESC");
            $balstmt->execute();
            $baldata = $balstmt->fetch(PDO::FETCH_ASSOC);
            if (!empty($baldata['balance'])) {
              $balance = $baldata['balance'];
            } else {
              $balance = 0;
            }
            if ($balance != 1) {
              $total_balance = $balance + $amount;
            } else {
              $total_balance = $balance;
            }
            $idstmt = $pdo->prepare("SELECT * FROM purchase ORDER BY no DESC");
            $idstmt->execute();
            $iddata = $idstmt->fetch(PDO::FETCH_ASSOC);
            $id = $iddata['no'];
            $payablestmt = $pdo->prepare("INSERT INTO payable(date, supplier_id, purchase_voucher_no, purchase_amount, balance, link_id) VALUES('$date', '$supplier_name', '$voucher_no', '$amount', '$total_balance', '$id')");
            $payablestmt->execute();
            $kg = floatval($viss) * 1.634;
            $link_id = $id;

            if ($tclfrozen === "tcl") {
              $formstmt = $pdo->prepare("INSERT INTO form7stocktcl(date, item_id, supplier_name, country, type, size, viss, kg, pcspervr, link_id) VALUES('$date', '$commondity', '$supplier_name', 'DAKA',  'TCl', '$size', '$viss', '$kg', '$pcs', '$link_id')");
              $formstmt->execute();
            } else {
              $formstmt = $pdo->prepare("INSERT INTO form7stock(date, item_id, supplier_name, type, size, viss, kg, pcspervr, link_id) VALUES('$date', '$commondity', '$supplier_name', 'Frozen', '$size', '$viss', '$kg', '$pcs', '$link_id')");
              $formstmt->execute();
            }

            $vouchercheckstmt = $pdo->prepare("SELECT * FROM general_ledger WHERE voucherno='$voucher_no' AND ac_code LIKE '4000%'");
            $vouchercheckstmt->execute();
            $vouchercheck = $vouchercheckstmt->fetch(PDO::FETCH_ASSOC);
            if (empty($vouchercheck)) {
              $balancecheckstmt = $pdo->prepare("SELECT * FROM general_ledger WHERE ac_code LIKE '4000%' ORDER BY id DESC");
              $balancecheckstmt->execute();
              $balancecheck = $balancecheckstmt->fetch(PDO::FETCH_ASSOC);
              $balance = $amount + $balancecheck['balance'];
              $glstmt = $pdo->prepare("INSERT INTO general_ledger(date, voucherno, ac_code, credit, balance) VALUES('$date', '$voucher_no', '$supplier_name', '$amount', '$balance')");
              $glstmt->execute();
            } else {
              $vouchercheckstmt = $pdo->prepare("SELECT SUM(credit) AS credit FROM general_ledger WHERE voucherno='$voucher_no' AND ac_code='$supplier_name'");
              $vouchercheckstmt->execute();
              $creditdata = $vouchercheckstmt->fetch(PDO::FETCH_ASSOC);
              $total_credit = $creditdata['credit'] + $amount;

              $nowid = $vouchercheck['id'];
              $balancestmt = $pdo->prepare("SELECT * FROM general_ledger WHERE id<'$nowid' AND ac_code LIKE '4000%' ORDER BY id DESC");
              $balancestmt->execute();
              $balancecheck = $balancestmt->fetch(PDO::FETCH_ASSOC);

              if (!empty($balancecheck)) {
                $balance = ($balancecheck['balance'] + floatval($vouchercheck['debit'])) - $total_credit;
              } else {
                $balance = (0 + floatval($vouchercheck['debit'])) - $total_credit;
              }

              $updatestmt = $pdo->prepare("UPDATE general_ledger SET credit='$total_credit', balance='$balance' WHERE voucherno='$voucher_no' AND ac_code LIKE '4000%'");
              $updatestmt->execute();
            }
          }
        }
      }
    }
  }
}
