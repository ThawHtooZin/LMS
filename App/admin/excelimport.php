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

if(isset($_REQUEST['excelimportbtn'])){
    if(isset($_POST['importtable'])){
        $file = $_FILES['excelfile']['tmp_name'];
        $extension = pathinfo($_FILES['excelfile']['name'], PATHINFO_EXTENSION);
        if($extension == 'xlsx' || $extension=='xls' || $extension=='csv'){
          $obj = PhpOffice\PhpSpreadsheet\IOFactory::load($file);
          $data = $obj->getActiveSheet()->toArray();
          if($_POST['importtable'] == 'transaction'){
            foreach($data as $row){
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
                if(!empty($row[10])){
                  $rate = $row[10];
                }else{
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



                if(!empty($debit)){
                  $debitorcredit = 'debit';
            
                  if($currency == 'usd'){
                    $mmk_amount = floatval($rate) * floatval($debit);
                    $usd_amount = $debit;
                  }elseif($currency == 'mmk'){
                    $mmk_amount = $debit;
                    $usd_amount = 0;
                  }
                }elseif(!empty($credit)){
                  $debitorcredit = 'credit';
                  if($currency == 'usd'){
                    $mmk_amount = floatval($rate) * floatval($credit);
                    $usd_amount = $credit;
                  }elseif($currency == 'mmk'){
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

          if($_POST['importtable'] == 'purchase'){
            foreach($data as $row){
                if($row[0] != '' || $row[1] != ''){
                $no = $row[0];
                $date = date('Y-m-d', strtotime($row[1]));
                $voucher_no = $row[2];
                $supplier_id = $row[3];
                $tclfrozen = $row[4];
                $commondity = $row[5];
                $size = $row[6];
                $viss = $row[7];
                if(!empty($row[8])){
                  $pcs = $row[8];
                }else{
                  $pcs = 0;
                }
                $price = $row[9];
                $amount = $row[10];

                $stmt = $pdo->prepare("INSERT INTO purchase(date,voucher_no,supplier_id,tclfrozen,commodity,size,viss,pcs,price,amount) VALUES(:date,:voucher_no,:supplier_id,:tclfrozen,:commondity,:size,:viss,:pcs,:price,:amount)");
                $stmt->execute([
                    ':date' => $date,
                    ':voucher_no' => $voucher_no,
                    ':supplier_id' => $supplier_id,
                    ':tclfrozen' => $tclfrozen,
                    ':commondity' => $commondity,
                    ':size' => $size,
                    ':viss' => $viss,
                    ':pcs' => $pcs,
                    ':price' => $price,
                    ':amount' => $amount,
                ]);
                }

            }
          }

          if($_POST['importtable'] == 'form7stock'){
            foreach($data as $row){
                $date = $row[0];
                $item_id = $row[1];
                $supplier_name = $row[2];
                $country = NULL;
                $type = $row[3];
                $size = $row[4];
                $viss = $row[5];
                $kg = $row[6] * 1.634;
                $pcspervr = $row[6];
                $pcsperf7 = 0;

                $stmt = $pdo->prepare("INSERT INTO form7stock(date,item_id,supplier_name,country,type,size,viss,kg,pcspervr,pcsperf7) VALUES(:date,:item_id,:supplier_name,:country,:type,:size,:viss,:kg,:pcspervr,:pcsperf7)");
                $stmt->execute([
                    ':date' => $date,
                    ':item_id' => $item_id,
                    ':supplier_name' => $supplier_name,
                    ':country' => $country,
                    ':type' => $type,
                    ':size' => $size,
                    ':viss' => $viss,
                    ':kg' => $kg,
                    ':pcspervr' => $pcspervr,
                    ':pcsperf7' => $pcsperf7,
                ]);
            }
          }
        }
  }
}