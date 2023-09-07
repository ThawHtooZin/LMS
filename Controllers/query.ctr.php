<?php

include "database.db.php";

Class Query{

  function login($username, $password){
    global $pdo;
    $stmt = $pdo->prepare("SELECT * FROM accounts WHERE username='$username'");
    $stmt->execute();
    $userdata = $stmt->fetch(PDO::FETCH_ASSOC);

    if(!empty($userdata)){
      if($userdata['password'] == $password){
        if($userdata['role'] == 1){
          $_SESSION['role'] = 1;
          $_SESSION['username'] = $username;
          $_SESSION['logged_in'] = true;
          header('location:App/admin/');
        }
        if($userdata['role'] == 2){
          $_SESSION['role'] = 2;
          $_SESSION['username'] = $username;
          $_SESSION['logged_in'] = true;
          header('location:App/user/');
        }
        if($userdata['role'] == 3){
          $_SESSION['role'] = 3;
          $_SESSION['username'] = $username;
          $_SESSION['logged_in'] = true;
          header('location:App/sale/');
        }
        if($userdata['role'] == 4){
          $_SESSION['role'] = 4;
          $_SESSION['username'] = $username;
          $_SESSION['logged_in'] = true;
          header('location:App/purchase/');
        }
      }
    }
  }


  function selectall($table){
    global $pdo;
    $stmt = $pdo->prepare("SELECT * FROM $table");
    $stmt->execute();
    return $stmt->fetchall();
  }

  function selectdist($table){
    global $pdo;
    $stmt = $pdo->prepare("SELECT DISTINCT (voucher_no) FROM $table");
    $stmt->execute();
    return $stmt->fetchall();
  }

  function select($table, $id, $select_id){
    global $pdo;
    $stmt = $pdo->prepare("SELECT * FROM $table WHERE $select_id='$id'");
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }

  function search($table, $search_row, $serach_id){
    global $pdo;
    $stmt = $pdo->prepare("SELECT * FROM $table WHERE $search_row='$serach_id'");
    $stmt->execute();
    return $stmt->fetchall();
  }

  function createaccount($table, $username, $password, $email, $role){
    global $pdo;
    if(empty($username) || empty($password) || empty($email) || empty($role)){
      $errormessage = "The following field is required. ";
      if(empty($username)){
        $errormessage = $errormessage . "Username Field, ";
      }
      if(empty($password)){
        $errormessage = $errormessage . "Password Field, ";
      }
      if(empty($email)){
        $errormessage = $errormessage . "Email Field, ";
      }
      if(empty($role)){
        $errormessage = $errormessage . "Role Field. ";
      }
      return $errormessage;
    }else{
    $stmt = $pdo->prepare("INSERT INTO $table(username, password, email, role) VALUES('$username', '$password', '$email', '$role')");
    $stmt->execute();
    if($stmt){
      return $successmessage = "Account Created Successfully";
    }else{
      return $errmessage = "Error accors when creating Accounts";
    }
    }
  }

  function updateaccount($table, $username, $password, $email, $role, $updateid){
    global $pdo;
    if(empty($username) || empty($password) || empty($email) || empty($role)){
      $errormessage = "The following field is required. ";
      if(empty($username)){
        $errormessage = $errormessage . "Username Field, ";
      }
      if(empty($password)){
        $errormessage = $errormessage . "Password Field, ";
      }
      if(empty($email)){
        $errormessage = $errormessage . "Email Field, ";
      }
      if(empty($role)){
        $errormessage = $errormessage . "Role Field. ";
      }
      return $errormessage;
    }else{
    $stmt = $pdo->prepare("UPDATE $table SET username='$username', password='$password', email='$email', role='$role' WHERE id=$updateid ");
    $stmt->execute();
    if($stmt){
      return $successmessage = "Account Updated Successfully";
    }else{
      return $errmessage = "Error accors when updating Accounts";
    }
    }

  }

  function deleteaccount($table, $deleteid){
    global $pdo;
    $stmt = $pdo->prepare("DELETE FROM $table WHERE id=$deleteid");
    $stmt->execute();
    if($stmt){
      return $successmessage = "Account Deleted Successfully";
    }else{
      return $errmessage = "Error accors when deleted Accounts";
    }
  }

  function addcashbookdata($table, $date, $serial_no, $ac_name, $particular, $debit, $credit){
    global $pdo;
      $stmt = $pdo->prepare("SELECT balance FROM cashbook ORDER BY id DESC");
      $stmt->execute();
      $balance = $stmt->fetch(PDO::FETCH_ASSOC);
      if(!empty($debit)){
        $balance = $balance['balance'] + $debit;
      }elseif(!empty($credit)){
        $balance = $balance['balance'] - $credit;
      }
      $stmt = $pdo->prepare("INSERT INTO $table(date, serial_no, ac_name, particular, debit, credit, balance) VALUES('$date', '$serial_no', '$ac_name', '$particular', '$debit', '$credit', '$balance')");
      $stmt->execute();
      if($stmt){
        return $successmessage = "Data Added Successfully";
      }else{
        return $errmessage = "Error accors when adding Data";
      }
      // if(empty($date) || empty($account_no) || empty($voucher_no) || empty($account_type) || empty($debit) || empty($credit) || empty($description)){
      //   $errormessage = "The following field is required. ";
    //   if(empty($date)){
    //     $errormessage = $errormessage . "Date Field, ";
    //   }
    //   if(empty($account_no)){
    //     $errormessage = $errormessage . "Account No Field, ";
    //   }
    //   if(empty($voucher_no)){
    //     $errormessage = $errormessage . "Voucher No Field, ";
    //   }
    //   if(empty($account_type)){
    //     $errormessage = $errormessage . "Account Type Field. ";
    //   }
    //   if(empty($debit)){
    //     $errormessage = $errormessage . "Debit Field. ";
    //   }
    //   if(empty($credit)){
    //     $errormessage = $errormessage . "Credit Field. ";
    //   }
    //   if(empty($description)){
    //     $errormessage = $errormessage . "Description Field. ";
    //   }
    //   return $errormessage;
    // }else{
    //   $balance = 0;
    // }
  }

  function addcategory($table, $category_name){
    global $pdo;
    $stmt = $pdo->prepare("INSERT INTO $table(category_name) VALUES('$category_name');");
    $stmt->execute();
    if($stmt){
      return $successmessage = "Category Added Successfully";
    }else{
      return $errmessage = "Error accors when adding Category";
    }
  }

  function updatecategory($table, $category_name, $category_id){
    global $pdo;
    $stmt = $pdo->prepare("UPDATE $table SET category_name='$category_name' WHERE category_id=$category_id");
    $stmt->execute();
    if($stmt){
      return $successmessage = "Category Update Successfully";
    }else{
      return $errmessage = "Error accors when updating Category";
    }
  }

  function deletecategory($table, $deleteid){
    global $pdo;
    $stmt = $pdo->prepare("DELETE FROM $table WHERE category_id=$deleteid");
    $stmt->execute();
    if($stmt){
      return $successmessage = "Category Deleted Successfully";
    }else{
      return $errmessage = "Error accors when deleted Category";
    }
  }

  function additem($table, $category_id, $item_code, $item_name){
    global $pdo;
    $stmt = $pdo->prepare("INSERT INTO $table(category_id, item_id, item_name) VALUES('$category_id', '$item_code', '$item_name');");
    $stmt->execute();
    if($stmt){
      return $successmessage = "Item Added Successfully";
    }else{
      return $errmessage = "Error accors when adding Item";
    }
  }

  function updateitem($table, $category_id, $item_name, $item_code ,$item_id){
    global $pdo;
    $stmt = $pdo->prepare("UPDATE $table SET category_id='$category_id', item_name='$item_name', item_id='$item_code' WHERE item_id='$item_id'");
    $stmt->execute();
    if($stmt){
      return $successmessage = "Item Update Successfully";
    }else{
      return $errmessage = "Error accors when updating Item";
    }
  }

  function deleteitem($table, $deleteid){
    global $pdo;
    $stmt = $pdo->prepare("DELETE FROM $table WHERE item_id='$deleteid'");
    $stmt->execute();
    if($stmt){
      return $successmessage = "Item Deleted Successfully";
    }else{
      return $errmessage = "Error accors when deleted Item";
    }
  }

  function addcustomer($table, $customer_id, $customer_name, $customer_phone, $customer_address){
    global $pdo;
    $stmt = $pdo->prepare("INSERT INTO $table(customer_id, customer_name, customer_phone, customer_address) VALUES('$customer_id', '$customer_name', '$customer_phone', '$customer_address');");
    $stmt->execute();
    if($stmt){
      return $successmessage = "Customer Added Successfully";
    }else{
      return $errmessage = "Error accors when adding Customer";
    }
  }

  function updatecustomer($table, $customer_id, $customer_name, $customer_phone, $customer_address, $updateid){
    global $pdo;
    $stmt = $pdo->prepare("UPDATE $table SET customer_id='$customer_id', customer_name='$customer_name', customer_phone='$customer_phone', customer_address='$customer_address' WHERE customer_id='$updateid'");
    $stmt->execute();
    if($stmt){
      return $successmessage = "Item Update Successfully";
    }else{
      return $errmessage = "Error accors when updating Item";
    }
  }

  function deletecustomer($table, $deleteid){
    global $pdo;
    $stmt = $pdo->prepare("DELETE FROM $table WHERE customer_id='$deleteid'");
    $stmt->execute();
    if($stmt){
      return $successmessage = "Item Deleted Successfully";
    }else{
      return $errmessage = "Error accors when deleted Item";
    }
  }

  function addsupplier($table, $supplier_id, $supplier_name, $supplier_phone, $supplier_address){
    global $pdo;
    $stmt = $pdo->prepare("INSERT INTO $table(supplier_id, supplier_name, supplier_phone, supplier_address) VALUES('$supplier_id', '$supplier_name', '$supplier_phone', '$supplier_address');");
    $stmt->execute();
    if($stmt){
      return $successmessage = "Supplier Added Successfully";
    }else{
      return $errmessage = "Error accors when adding Supplier";
    }
  }

  function updatesupplier($table, $supplier_id, $supplier_name, $supplier_phone, $supplier_address, $updateid){
    global $pdo;
    $stmt = $pdo->prepare("UPDATE $table SET supplier_id='$supplier_id', supplier_name='$supplier_name', supplier_phone='$supplier_phone', supplier_address='$supplier_address' WHERE supplier_id='$updateid'");
    $stmt->execute();
    if($stmt){
      return $successmessage = "Supplier Update Successfully";
    }else{
      return $errmessage = "Error accors when updating Supplier";
    }
  }

  function deletesupplier($table, $deleteid){
    global $pdo;
    $stmt = $pdo->prepare("DELETE FROM $table WHERE supplier_id='$deleteid'");
    $stmt->execute();
    if($stmt){
      return $successmessage = "Supplier Deleted Successfully";
    }else{
      return $errmessage = "Error accors when deleted Supplier";
    }
  }

  function addpurchase($table, $date, $voucher_no, $tclfrozen, $supplier_name, $commodity, $size, $viss, $pcs, $price){
    global $pdo;
    if(!empty($viss) || !empty($price)){
      $amount = $price * $viss;
    }else{
      $amount = 0;
    }
    $idstmt = $pdo->prepare("SELECT no FROM $table ORDER BY no DESC");
    $idstmt->execute();
    $iddata = $idstmt->fetch(PDO::FETCH_ASSOC);
    $stmt = $pdo->prepare("INSERT INTO $table(date, voucher_no, tclfrozen, supplier_id, commodity, size, viss, pcs, price, amount) VALUES('$date', '$voucher_no', '$tclfrozen', '$supplier_name', '$commodity', '$size', '$viss', '$pcs', '$price', '$amount')");
    $stmt->execute();
    $balstmt = $pdo->prepare("SELECT balance FROM payable ORDER BY id DESC");
    $balstmt->execute();
    $baldata = $balstmt->fetch(PDO::FETCH_ASSOC);
    $balance = $baldata['balance'];
    if($balance != 1){
       $total_balance = $balance + $amount;
    }else{
      $total_balance = $balance;
    }
    $idstmt = $pdo->prepare("SELECT * FROM $table ORDER BY no DESC");
    $idstmt->execute();
    $iddata = $idstmt->fetch(PDO::FETCH_ASSOC);
    $id = $iddata['no'];
    $payablestmt = $pdo->prepare("INSERT INTO payable(supplier_id, purchase_voucher_no, purchase_amount, balance, link_id) VALUES('$supplier_name', '$voucher_no', '$amount', '$total_balance', '$id')");
    $payablestmt->execute();
    $kg = $viss * 1.634;
    $formstmt = $pdo->prepare("INSERT INTO form7stock(date, item_id, supplier_name, size, viss, kg, pcspervr) VALUES('$date', '$commodity', '$supplier_name', '$size', '$viss', '$kg', '$pcs')");
    $formstmt->execute();
    if($stmt){
      return $successmessage = "Purchase Voucher Added Successfully";
    }else{
      return $errmessage = "Error accors when added Purchase Voucher";
    }

  }

  function updatepurchase($table, $date, $voucher_no, $tclfrozen, $supplier_name, $commodity, $size, $viss, $pcs, $price, $no){
    global $pdo;
    $amount = $price * $viss;
    $stmt = $pdo->prepare("UPDATE $table SET date='$date', voucher_no='$voucher_no', tclfrozen='$tclfrozen', supplier_id='$supplier_name', commodity='$commodity', size='$size', viss='$viss', pcs='$pcs', price='$price', amount='$amount' WHERE no='$no'");
    $stmt->execute();
    if($stmt){
      return $successmessage = "Purchase Voucher Update Successfully";
    }else{
      return $errmessage = "Error accors when updating Purchase Voucher";
    }
  }

  function deletepurchase($table, $deleteid){
    global $pdo;
    $stmt = $pdo->prepare("DELETE FROM $table WHERE no='$deleteid'");
    $stmt->execute();
    if($stmt){
      return $successmessage = "Purchase Voucher Deleted Successfully";
    }else{
      return $errmessage = "Error accors when deleted Purchase Voucher";
    }
  }

  function deletepayable($table, $deleteid){
    global $pdo;
    $stmt = $pdo->prepare("DELETE FROM $table WHERE link_id='$deleteid'");
    $stmt->execute();
    if($stmt){
      return $successmessage = "Purchase Voucher Deleted Successfully";
    }else{
      return $errmessage = "Error accors when deleted Purchase Voucher";
    }
  }

  function addpayable($table, $supplier_id, $paid_date, $paid_voucher, $paid_amount){
    global $pdo;
    $stmt = $pdo->prepare("INSERT INTO $table(supplier_id ,paid_date, paid_voucher, paid_amount) VALUES('$supplier_id', '$paid_date', '$paid_voucher', '$paid_amount')");
    $stmt->execute();
    if($stmt){
      return $successmessage = "Payable Voucher Added Successfully";
    }else{
      return $errmessage = "Error accors when adding Payable Voucher";
    }
  }

  function updatepayable($paid_date, $paid_voucher, $paid_amount, $id)
  {
    global $pdo;
    $stmt = $pdo->prepare("UPDATE payable SET paid_date='$paid_date', paid_voucher='$paid_voucher', paid_amount='$paid_amount' WHERE id='$id';");
    $stmt->execute();
    if($stmt){
      return $successmessage = "Payable Voucher Updated Successfully";
    }else{
      return $errmessage = "Error accors when updaing Payable Voucher";
    }
  }

  function addcontainer($container_no, $country, $date){
    global $pdo;

    $addcontainerstmt = $pdo->prepare("INSERT INTO container(container_no, country, date) VALUES('$container_no', '$country', '$date')");
    $addcontainerstmt->execute();
  }

  // HHK QUERIES

  function addcoldstore($indate, $outdate, $commondity_id, $mc, $kg, $coldstorerate, $labourrate, $processingrate){
    global $pdo;

    $datastmt = $pdo->prepare("SELECT * FROM coldstore ORDER BY id DESC");
    $datastmt->execute();
    $data = $datastmt->fetch(PDO::FETCH_ASSOC);
    if(!empty($data)){
      if($commondity_id == '11'){
        $iqfemptystmt = $pdo->prepare("SELECT * FROM coldstore WHERE commondity_id='11' ORDER BY id DESC");
        $iqfemptystmt->execute();
        $iqfemptydata = $iqfemptystmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($iqfemptydata)) {
          $iqfstmt = $pdo->prepare("SELECT * FROM coldstore WHERE commondity_id='11' ORDER BY id DESC");
          $iqfstmt->execute();
          $iqfdata = $iqfstmt->fetch(PDO::FETCH_ASSOC);

          $dtotal_mc = intval($iqfdata['total_mc']) + intval($mc);
          $dtotal_kg = intval($iqfdata['total_kg']) + intval($kg);
          $date1 = strtotime($indate);
          $date2 = strtotime($outdate);
          $diff = $date2 - $date1;
          $day = floor($diff / (60 * 60 * 24)) + 1;
          $charges = $day * intval($coldstorerate) * intval($kg);
          $total_charges = intval($iqfdata['total_charges']) + intval($charges);
        }else{
          $dtotal_mc = intval($mc);
          $dtotal_kg = intval($kg);
          $date1 = strtotime($indate);
          $date2 = strtotime($outdate);
          $diff = $date2 - $date1;
          $day = floor($diff / (60 * 60 * 24));
          $charges = $day * intval($coldstorerate) * intval($kg);
          $total_charges = intval($charges);
        }
      }elseif($commondity_id == '12'){
        $blockemptystmt = $pdo->prepare("SELECT * FROM coldstore WHERE commondity_id='12' ORDER BY id DESC");
        $blockemptystmt->execute();
        $blockemptydata = $blockemptystmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($blockemptydata)) {
          $blockstmt = $pdo->prepare("SELECT * FROM coldstore WHERE commondity_id='12' ORDER BY id DESC");
          $blockstmt->execute();
          $blockdata = $blockstmt->fetch(PDO::FETCH_ASSOC);

          $dtotal_mc = intval($blockdata['total_mc']) + intval($mc);
          $dtotal_kg = intval($blockdata['total_kg']) + intval($kg);
          $date1 = strtotime($indate);
          $date2 = strtotime($outdate);
          $diff = $date2 - $date1;
          $day = floor($diff / (60 * 60 * 24)) + 1;
          $charges = $day * intval($coldstorerate) * intval($kg);
          $total_charges = intval($blockdata['total_charges']) + intval($charges);
        }else{
          $dtotal_mc = intval($mc);
          $dtotal_kg = intval($kg);
          $date1 = strtotime($indate);
          $date2 = strtotime($outdate);
          $diff = $date2 - $date1;
          $day = floor($diff / (60 * 60 * 24));
          $charges = $day * intval($coldstorerate) * intval($kg);
          $total_charges = intval($charges);
        }
      }elseif($commondity_id == '13'){
        $pjnemptystmt = $pdo->prepare("SELECT * FROM coldstore WHERE commondity_id='13' ORDER BY id DESC");
        $pjnemptystmt->execute();
        $pjnemptydata = $pjnemptystmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($pjnemptydata)) {
          $pjnstmt = $pdo->prepare("SELECT * FROM coldstore WHERE commondity_id='13' ORDER BY id DESC");
          $pjnstmt->execute();
          $pjndata = $pjnstmt->fetch(PDO::FETCH_ASSOC);

          $dtotal_mc = intval($pjndata['total_mc']) + intval($mc);
          $dtotal_kg = intval($pjndata['total_kg']) + intval($kg);
          $date1 = strtotime($indate);
          $date2 = strtotime($outdate);
          $diff = $date2 - $date1;
          $day = floor($diff / (60 * 60 * 24)) + 1;
          $charges = $day * intval($coldstorerate) * intval($kg);
          $total_charges = intval($pjndata['total_charges']) + intval($charges);
        }else{
          $dtotal_mc = intval($mc);
          $dtotal_kg = intval($kg);
          $date1 = strtotime($indate);
          $date2 = strtotime($outdate);
          $diff = $date2 - $date1;
          $day = floor($diff / (60 * 60 * 24));
          $charges = $day * intval($coldstorerate) * intval($kg);
          $total_charges = intval($charges);
        }
      }else{
        $dtotal_mc = intval($data['total_mc']) + intval($mc);
        $dtotal_kg = intval($data['total_kg']) + intval($kg);
        $date1 = strtotime($indate);
        $date2 = strtotime($outdate);
        $diff = $date2 - $date1;
        $day = floor($diff / (60 * 60 * 24)) + 1;
        $charges = $day * intval($coldstorerate) * intval($kg);
        $total_charges = intval($data['total_charges']) + intval($charges);
      }
    }else{
      $dtotal_mc = intval($mc);
      $dtotal_kg = intval($kg);
      $date1 = strtotime($indate);
      $date2 = strtotime($outdate);
      $diff = $date2 - $date1;
      $day = floor($diff / (60 * 60 * 24));
      $charges = $day * intval($coldstorerate) * intval($kg);
      $total_charges = intval($charges);
    }
    // Labour ADD
    $labourstmt = $pdo->prepare("SELECT * FROM labour ORDER BY id DESC");
    $labourstmt->execute();
    $labour = $labourstmt->fetch(PDO::FETCH_ASSOC);
    if(!empty($labour)){
      if($commondity_id == '11'){
        $iqfemptystmt = $pdo->prepare("SELECT * FROM labour WHERE commondity_id='11' ORDER BY id DESC");
        $iqfemptystmt->execute();
        $iqfemptydata = $iqfemptystmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($iqfemptydata)) {
          $iqfstmt = $pdo->prepare("SELECT * FROM labour WHERE commondity_id='11' ORDER BY id DESC");
          $iqfstmt->execute();
          $iqfdata = $iqfstmt->fetch(PDO::FETCH_ASSOC);

          $ltotal_mc = intval($iqfdata['total_mc']) + intval($mc);
          $ltotal_kg = intval($iqfdata['total_kg']) + intval($kg);
          $lcharges = intval($labourrate) * intval($kg);
          $totallabourcharges = intval($iqfdata['total_charges']) + intval($lcharges);
        }else{
          $ltotal_mc = intval($mc);
          $ltotal_kg = intval($kg);
          $lcharges = intval($labourrate) * intval($kg);
          $totallabourcharges = intval($lcharges);
        }
      }elseif($commondity_id == '12'){
        $blockemptystmt = $pdo->prepare("SELECT * FROM labour WHERE commondity_id='12' ORDER BY id DESC");
        $blockemptystmt->execute();
        $blockemptydata = $blockemptystmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($blockemptydata)) {
          $blockstmt = $pdo->prepare("SELECT * FROM labour WHERE commondity_id='12' ORDER BY id DESC");
          $blockstmt->execute();
          $blockdata = $blockstmt->fetch(PDO::FETCH_ASSOC);

          $ltotal_mc = intval($blockdata['total_mc']) + intval($mc);
          $ltotal_kg = intval($blockdata['total_kg']) + intval($kg);
          $lcharges = intval($labourrate) * intval($kg);
          $totallabourcharges = intval($blockdata['total_charges']) + intval($lcharges);
        }else{
          $ltotal_mc = intval($mc);
          $ltotal_kg = intval($kg);
          $lcharges = intval($labourrate) * intval($kg);
          $totallabourcharges = intval($lcharges);
        }
      }elseif($commondity_id == '13'){
        $pjnemptystmt = $pdo->prepare("SELECT * FROM labour WHERE commondity_id='13' ORDER BY id DESC");
        $pjnemptystmt->execute();
        $pjnemptydata = $pjnemptystmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($pjnemptydata)) {
          $pjnstmt = $pdo->prepare("SELECT * FROM labour WHERE commondity_id='13' ORDER BY id DESC");
          $pjnstmt->execute();
          $pjndata = $pjnstmt->fetch(PDO::FETCH_ASSOC);

          $ltotal_mc = intval($pjndata['total_mc']) + intval($mc);
          $ltotal_kg = intval($pjndata['total_kg']) + intval($kg);
          $lcharges = intval($labourrate) * intval($kg);
          $totallabourcharges = intval($pjndata['total_charges']) + intval($lcharges);
        }else{
          $ltotal_mc = intval($mc);
          $ltotal_kg = intval($kg);
          $lcharges = intval($labourrate) * intval($kg);
          $totallabourcharges = intval($lcharges);
        }
      }else{
        $pjnemptystmt = $pdo->prepare("SELECT * FROM labour WHERE commondity_id='4' ORDER BY id DESC");
        $pjnemptystmt->execute();
        $pjnemptydata = $pjnemptystmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($pjnemptydata)) {
          $pjnstmt = $pdo->prepare("SELECT * FROM labour WHERE commondity_id='4' ORDER BY id DESC");
          $pjnstmt->execute();
          $pjndata = $pjnstmt->fetch(PDO::FETCH_ASSOC);

          $ltotal_mc = intval($pjndata['total_mc']) + intval($mc);
          $ltotal_kg = intval($pjndata['total_kg']) + intval($kg);
          $lcharges = intval($labourrate) * intval($kg);
          $totallabourcharges = intval($pjndata['total_charges']) + intval($lcharges);
        }else{
          $ltotal_mc = intval($mc);
          $ltotal_kg = intval($kg);
          $lcharges = intval($labourrate) * intval($kg);
          $totallabourcharges = intval($lcharges);
        }
      }
    }else{
      $ltotal_mc = intval($mc);
      $ltotal_kg = intval($kg);
      $lcharges = intval($labourrate) * intval($kg);
      $totallabourcharges = intval($lcharges);
    }

    // Processing ADD
    $processingstmt = $pdo->prepare("SELECT * FROM processing ORDER BY id DESC");
    $processingstmt->execute();
    $processing = $processingstmt->fetch(PDO::FETCH_ASSOC);
    if(!empty($processing)){
      if($commondity_id == '11'){
        $processingemptystmt = $pdo->prepare("SELECT * FROM processing WHERE commondity_id='11' ORDER BY id DESC");
        $processingemptystmt->execute();
        $processingemptydata = $iqfemptystmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($processingemptydata)) {
          $processingstmt = $pdo->prepare("SELECT * FROM processing WHERE commondity_id='11' ORDER BY id DESC");
          $processingstmt->execute();
          $processingdata = $processingstmt->fetch(PDO::FETCH_ASSOC);

          $ptotal_mc = intval($processingdata['total_mc']) + intval($mc);
          $ptotal_kg = intval($processingdata['total_kg']) + intval($kg);
          $pcharges = intval($processingrate) * intval($kg);
          $totalprocessingcharges = intval($processingdata['total_charges']) + intval($pcharges);
        }else{
          $ptotal_mc = intval($mc);
          $ptotal_kg = intval($kg);
          $pcharges = intval($processingrate) * intval($kg);
          $totalprocessingcharges = intval($pcharges);
        }
      }elseif($commondity_id == '12'){
        $processingemptystmt = $pdo->prepare("SELECT * FROM processing WHERE commondity_id='12' ORDER BY id DESC");
        $processingemptystmt->execute();
        $processingemptydata = $processingemptystmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($processingemptydata)) {
          $processingstmt = $pdo->prepare("SELECT * FROM processing WHERE commondity_id='12' ORDER BY id DESC");
          $processingstmt->execute();
          $processingdata = $processingstmt->fetch(PDO::FETCH_ASSOC);

          $ptotal_mc = intval($processingdata['total_mc']) + intval($mc);
          $ptotal_kg = intval($processingdata['total_kg']) + intval($kg);
          $pcharges = intval($processingrate) * intval($kg);
          $totalprocessingcharges = intval($processingdata['total_charges']) + intval($pcharges);
        }else{
          $ptotal_mc = intval($mc);
          $ptotal_kg = intval($kg);
          $pcharges = intval($processingrate) * intval($kg);
          $totalprocessingcharges = intval($pcharges);
        }
      }elseif($commondity_id == '13'){
        $processingemptystmt = $pdo->prepare("SELECT * FROM processing WHERE commondity_id='13' ORDER BY id DESC");
        $processingemptystmt->execute();
        $processingemptydata = $processingemptystmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($processingemptydata)) {
          $processingstmt = $pdo->prepare("SELECT * FROM processing WHERE commondity_id='13' ORDER BY id DESC");
          $processingstmt->execute();
          $processingdata = $processingstmt->fetch(PDO::FETCH_ASSOC);

          $ptotal_mc = intval($processingdata['total_mc']) + intval($mc);
          $ptotal_kg = intval($processingdata['total_kg']) + intval($kg);
          $pcharges = intval($processingrate) * intval($kg);
          $totalprocessingcharges = intval($processingdata['total_charges']) + intval($pcharges);
        }else{
          $ptotal_mc = intval($mc);
          $ptotal_kg = intval($kg);
          $pcharges = intval($processingrate) * intval($kg);
          $totalprocessingcharges = intval($pcharges);
        }
      }else{
        $processingemptystmt = $pdo->prepare("SELECT * FROM processing WHERE commondity_id='4' ORDER BY id DESC");
        $processingemptystmt->execute();
        $processingemptydata = $processingemptystmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($processingemptydata)) {
          $processingstmt = $pdo->prepare("SELECT * FROM processing WHERE commondity_id='4' ORDER BY id DESC");
          $processingstmt->execute();
          $processingdata = $processingstmt->fetch(PDO::FETCH_ASSOC);

          $ptotal_mc = intval($processingdata['total_mc']) + intval($mc);
          $ptotal_kg = intval($processingdata['total_kg']) + intval($kg);
          $pcharges = intval($processingrate) * intval($kg);
          $totalprocessingcharges = intval($processingdata['total_charges']) + intval($pcharges);
        }else{
          $ptotal_mc = intval($mc);
          $ptotal_kg = intval($kg);
          $pcharges = intval($processingrate) * intval($kg);
          $totalprocessingcharges = intval($pcharges);
        }
      }
    }else{
      $ptotal_mc = intval($mc);
      $ptotal_kg = intval($kg);
      $pcharges = intval($processingrate) * intval($kg);
      $totalprocessingcharges = intval($pcharges);
    }

    // Add Stock
    $stockstmt = $pdo->prepare("SELECT * FROM hhkstock WHERE commondity_id='$commondity_id' ORDER BY id DESC");
    $stockstmt->execute();
    $stockdata = $stockstmt->fetch(PDO::FETCH_ASSOC);

    $smc = $mc;
    $skg = $kg;
    $total_mc = $stockdata['total_mc'] - $mc;
    $total_kg = $stockdata['total_kg'] - $kg;
    $balance = $stockdata['balance'] - $total_kg;

    $coldstorestmt = $pdo->prepare("INSERT INTO coldstore(indate, outdate, commondity_id, mc, total_mc, kg, total_kg, day, rate, charges, total_charges) VALUES('$indate','$outdate','$commondity_id', '$mc','$dtotal_mc','$kg','$dtotal_kg','$day','$coldstorerate','$charges','$total_charges')");
    $coldstorestmt->execute();
    $labourstmt = $pdo->prepare("INSERT INTO labour(indate, outdate, commondity_id, mc, total_mc, kg, total_kg, rate, charges, total_charges) VALUES('$indate','$outdate','$commondity_id', '$mc','$ltotal_mc','$kg','$ltotal_kg','$labourrate','$lcharges','$totallabourcharges')");
    $labourstmt->execute();
    $processingstmt = $pdo->prepare("INSERT INTO processing(indate, outdate, commondity_id, mc, total_mc, kg, total_kg, rate, charges, total_charges) VALUES('$indate','$outdate','$commondity_id', '$mc','$ptotal_mc','$kg','$ptotal_kg','$processingrate','$pcharges','$totalprocessingcharges')");
    $processingstmt->execute();
    $stockstmt = $pdo->prepare("INSERT INTO hhkstock(outdate, commondity_id, mc, total_mc, kg, total_kg, balance) VALUES('$outdate', '$commondity_id', '$smc', '$total_mc', '$skg', '$total_kg', '$balance')");
    $stockstmt->execute();

    $datastmt = $pdo->prepare("SELECT * FROM total_charges ORDER BY id DESC");
    $datastmt->execute();
    $data = $datastmt->fetch(PDO::FETCH_ASSOC);

    $totalcoldstorestmt = $pdo->prepare("SELECT total_charges FROM coldstore ORDER BY id DESC");
    $totalcoldstorestmt->execute();
    $totalcoldstoredata = $totalcoldstorestmt->fetch(PDO::FETCH_ASSOC);

    $totallabourstmt = $pdo->prepare("SELECT * FROM labour  ORDER BY id DESC");
    $totallabourstmt->execute();
    $totallabourdata = $totallabourstmt->fetch(PDO::FETCH_ASSOC);

    $totalprocessingstmt = $pdo->prepare("SELECT * FROM processing ORDER BY id DESC");
    $totalprocessingstmt->execute();
    $totalprocessingdata = $totalprocessingstmt->fetch(PDO::FETCH_ASSOC);

    $totalchargesstmt = $pdo->prepare("SELECT * FROM total_charges ORDER BY id DESC");
    $totalchargesstmt->execute();
    $totalchargesdata = $totalchargesstmt->fetch(PDO::FETCH_ASSOC);

    if(!empty($totalchargesdata)){
      $total_coldstore_charges = $totalcoldstoredata['total_charges'];
      $total_labour_charges = $totallabourdata['total_charges'];
      $total_processing_charges = $totalprocessingdata['total_charges'];
      $total_charges = $totalcoldstoredata['total_charges'] + $totallabourdata['total_charges'] + $totalprocessingdata['total_charges'];
      $grand_total_charges = $totalchargesdata['balance_amount'] + $total_charges;
      $balance_amount = intval($grand_total_charges);
    }else{
      $total_coldstore_charges = $totalcoldstoredata['total_charges'];
      $total_labour_charges = $totallabourdata['total_charges'];
      $total_processing_charges = $totalprocessingdata['total_charges'];
      $total_charges = $totalcoldstoredata['total_charges'] + $totallabourdata['total_charges'] + $totalprocessingdata['total_charges'];
      $grand_total_charges = $total_charges;
      $balance_amount = $grand_total_charges;
    }

    $stmt = $pdo->prepare("INSERT INTO total_charges(commondity_id, total_coldstore_charges, total_labour_charges, total_processing_charges, total_charges, grand_total_charges, balance_amount) VALUES('$commondity_id','$total_coldstore_charges', '$total_labour_charges', '$total_processing_charges', '$total_charges', '$grand_total_charges', '$balance_amount')");
    $stmt->execute();
  }

  function updatecoldstore($indate, $outdate, $commondity_id, $mc, $kg, $coldstorerate, $labourrate, $processingrate, $updateid){
    global $pdo;

    $datastmt = $pdo->prepare("SELECT * FROM coldstore WHERE id < '$updateid'");
    $datastmt->execute();
    $data = $datastmt->fetch(PDO::FETCH_ASSOC);
    if(!empty($data)){
      $dtotal_mc = $data['total_mc'] + intval($mc);
      $dtotal_kg = $data['total_kg'] + intval($kg);
      $date1 = strtotime($indate);
      $date2 = strtotime($outdate);
      $diff = $date2 - $date1;
      $day = floor($diff / (60 * 60 * 24)) + 1;
      $charges = $day * intval($coldstorerate) * intval($kg);
      $total_charges = intval($data['total_charges']) + intval($charges);
    }else{
      $dtotal_mc = intval($mc);
      $dtotal_kg = intval($kg);
      $date1 = strtotime($indate);
      $date2 = strtotime($outdate);
      $diff = $date2 - intval($date1);
      $day = floor($diff / (60 * 60 * 24)) + 1;
      $charges = $day * intval($coldstorerate) * intval($kg);
      $total_charges = intval($charges);
    }
    $labourstmt = $pdo->prepare("SELECT * FROM labour WHERE id < '$updateid'");
    $labourstmt->execute();
    $labour = $labourstmt->fetch(PDO::FETCH_ASSOC);
    if(!empty($labour)){
      $ltotal_mc = $labour['total_mc'] + intval($mc);
      $ltotal_kg = $labour['total_kg'] + intval($kg);
      $lcharges = intval($labourrate) * intval($kg);
      $totallabourcharges = intval($labour['total_charges']) + intval($lcharges);
    }else{
      $ltotal_mc = intval($mc);
      $ltotal_kg = intval($kg);
      $lcharges = $labourrate * intval($kg);
      $totallabourcharges = intval($lcharges);
    }

    $processingstmt = $pdo->prepare("SELECT * FROM processing WHERE id < '$updateid'");
    $processingstmt->execute();
    $processing = $processingstmt->fetch(PDO::FETCH_ASSOC);
    if(!empty($processing)){
      $ptotal_mc = $processingdata['total_mc'] + intval($mc);
      $ptotal_kg = $processingdata['total_kg'] + intval($kg);
      $pcharges = intval($processingrate) * intval($kg);
      $totalprocessingcharges = intval($processingdata['total_charges']) + intval($pcharges);
    }else{
      $ptotal_mc = intval($mc);
      $ptotal_kg = intval($kg);
      $pcharges = intval($processingrate) * intval($kg);
      $totalprocessingcharges = intval($pcharges);
    }

    $coldstorestmt = $pdo->prepare("UPDATE coldstore SET indate='$indate', outdate='$outdate',commondity_id='$commondity_id', mc='$mc', total_mc='$dtotal_mc', kg='$kg', total_kg='$dtotal_kg', day='$day', rate='$coldstorerate', charges='$charges', total_charges='$total_charges' WHERE id='$updateid'");
    $coldstorestmt->execute();
    $labourstmt = $pdo->prepare("UPDATE labour SET indate='$indate', outdate='$outdate',commondity_id='$commondity_id', mc='$mc', total_mc='$ltotal_mc', kg='$kg', total_kg='$ltotal_kg', rate='$labourrate', charges='$lcharges', total_charges='$totallabourcharges' WHERE id='$updateid'");
    $labourstmt->execute();
    $processingstmt = $pdo->prepare("UPDATE processing SET indate='$indate', outdate='$outdate',commondity_id='$commondity_id', mc='$mc', total_mc='$ptotal_mc', kg='$kg', total_kg='$ptotal_kg', rate='$processingrate', charges='$pcharges', total_charges='$totalprocessingcharges' WHERE id='$updateid'");
    $processingstmt->execute();



    $cstmt = $pdo->prepare("SELECT * FROM coldstore WHERE id > '$updateid'");
    $cstmt->execute();
    $cstmtdatas = $cstmt->fetchall();
      foreach ($cstmtdatas as $stmtdata) {
        $id = $stmtdata['id'] - 1;
        $stmt = $pdo->prepare("SELECT * FROM coldstore WHERE id='$id'");
        $stmt->execute();
        $data = $stmt->fetch(PDO::FETCH_ASSOC);
        $totalmc = $stmtdata['mc'] + $data['total_mc'];
        $totalkg = $stmtdata['kg'] + $data['total_kg'];
        $charges = $stmtdata['kg'] * $stmtdata['rate'] * $stmtdata['day'];
        $NewCharges = $stmtdata['charges'] + $data['total_charges'];
        $updatestmt = $pdo->prepare("UPDATE coldstore SET total_mc='$totalmc', total_kg='$totalkg', charges='$charges', total_charges='$NewCharges' WHERE id=". $stmtdata['id']);
        $updatestmt->execute();
      }

      $lstmt = $pdo->prepare("SELECT * FROM labour WHERE id > '$updateid'");
      $lstmt->execute();
      $lstmtdatas = $lstmt->fetchall();
        foreach ($lstmtdatas as $lstmtdata) {
          $id = $lstmtdata['id'] - 1;
          $stmt = $pdo->prepare("SELECT * FROM labour WHERE id='$id'");
          $stmt->execute();
          $data = $stmt->fetch(PDO::FETCH_ASSOC);
          $totalmc = $lstmtdata['mc'] + $data['total_mc'];
          $totalkg = $lstmtdata['kg'] + $data['total_kg'];
          $charges = $lstmtdata['kg'] * $lstmtdata['rate'];
          $lNewCharges = $lstmtdata['charges'] + $data['total_charges'];
          $updatestmt = $pdo->prepare("UPDATE labour SET total_mc='$totalmc', total_kg='$totalkg', charges='$charges', total_charges='$lNewCharges' WHERE id=". $lstmtdata['id']);
          $updatestmt->execute();
        }

        $pstmt = $pdo->prepare("SELECT * FROM processing WHERE id > '$updateid'");
        $pstmt->execute();
        $pstmtdatas = $pstmt->fetchall();
          foreach ($pstmtdatas as $pstmtdata) {
            $id = $pstmtdata['id'] - 1;
            $stmt = $pdo->prepare("SELECT * FROM processing WHERE id='$id'");
            $stmt->execute();
            $data = $stmt->fetch(PDO::FETCH_ASSOC);
            $totalmc = $pstmtdata['mc'] + $data['total_mc'];
            $totalkg = $pstmtdata['kg'] + $data['total_kg'];
            $charges = $pstmtdata['kg'] * $pstmtdata['rate'];
            $pNewCharges = $pstmtdata['charges'] + $data['total_charges'];
            $updatestmt = $pdo->prepare("UPDATE processing SET total_mc='$totalmc', total_kg='$totalkg', charges='$charges', total_charges='$pNewCharges' WHERE id=". $pstmtdata['id']);
            $updatestmt->execute();
          }
  }

  function updatecoldstoretotal($id, $repacking_charges, $ice_charges){
    global $pdo;

    $totalchargesstmt = $pdo->prepare("SELECT * FROM total_charges WHERE id='$id'");
    $totalchargesstmt->execute();
    $totalchargesdata =$totalchargesstmt->fetch(PDO::FETCH_ASSOC);

    $idd = $id - 1;
    $balancestmt = $pdo->prepare("SELECT * FROM total_charges WHERE id='$idd'");
    $balancestmt->execute();
    $balancedata= $balancestmt->fetch(PDO::FETCH_ASSOC);

    $total_charges = intval($repacking_charges) + intval($ice_charges) + $totalchargesdata['total_charges'];
    $grand_total_charges = $balancedata['balance_amount'] + $total_charges;
    $balance_amount = $grand_total_charges;
    $updatestmt = $pdo->prepare("UPDATE total_charges SET repacking_charges='$repacking_charges', ice_charges='$ice_charges', total_charges='$total_charges', grand_total_charges='$grand_total_charges', balance_amount='$balance_amount' WHERE id='$id'");
    $updatestmt->execute();
  }

  function addfishcharges($date, $ite, $mc, $kg, $coldstorerate, $labourrate, $damagekg){
    global $pdo;
    if($ite == 'balance'){
      $fishcoldstorestmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore ORDER BY id DESC");
      $fishcoldstorestmt->execute();
      $fishcoldstore = $fishcoldstorestmt->fetch(PDO::FETCH_ASSOC);

      if(!empty($fishcoldstore)){
        $total_mc = $fishcoldstore['total_mc'];
        $total_kg = $fishcoldstore['total_kg'];
        $charges = $coldstorerate * $total_kg;
        $total_charges = $charges + $fishcoldstore['total_charges'];

        $coldstorestmt = $pdo->prepare("INSERT INTO gfcfishcoldstore(date, ite, total_mc, total_kg, rate, charges, total_charges) VALUES('$date', '$ite', '$total_mc', '$total_kg', '$coldstorerate', '$charges', '$total_charges')");
        $coldstorestmt->execute();
      }else{
        $total_mc = 0;
        $total_kg = 0;
        $charges = 0;
        $total_charges = 0;

        $coldstorestmt = $pdo->prepare("INSERT INTO gfcfishcoldstore(date, ite, total_mc, total_kg, rate, charges, total_charges) VALUES('$date', '$ite', '$total_mc', '$total_kg', '$coldstorerate', '$charges', '$total_charges')");
        $coldstorestmt->execute();
      }
    }else{
      $fishcoldstorestmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore ORDER BY id DESC");
      $fishcoldstorestmt->execute();
      $fishcoldstore = $fishcoldstorestmt->fetch(PDO::FETCH_ASSOC);
      if(!empty($fishcoldstore)){
        if($fishcoldstore['date'] == $date){
          if($ite == 'import'){
            $total_mc = $fishcoldstore['total_mc'] + $mc;
            $total_kg = $fishcoldstore['total_kg'] + $kg;
          }
          if($ite == 'export'){
            $total_mc = $fishcoldstore['total_mc'] - $mc;
            $total_kg = $fishcoldstore['total_kg'] - $kg;
          }
          if($ite == 'takeout'){
            $total_mc = $fishcoldstore['total_mc'] - $mc;
            $total_kg = $fishcoldstore['total_kg'] - $kg;
          }
        }else{
          if($ite == 'import'){
            $total_mc = $fishcoldstore['total_mc'] + $mc;
            $total_kg = $fishcoldstore['total_kg'] + $kg;
          }
          if($ite == 'export'){
            $total_mc = $fishcoldstore['total_mc'] - $mc;
            $total_kg = $fishcoldstore['total_kg'] - $kg;
          }
        }
      }else{
        $total_mc = $mc;
        $total_kg = $kg;
      }

      $coldstorestmt = $pdo->prepare("INSERT INTO gfcfishcoldstore(date, ite, mc, total_mc, kg, total_kg, rate) VALUES('$date', '$ite', '$mc', '$total_mc', '$kg', '$total_kg', '$coldstorerate')");
      $coldstorestmt->execute();
      if(!empty($damagekg)){
        $fishcoldstorestmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore ORDER BY id DESC");
        $fishcoldstorestmt->execute();
        $fishcoldstore2 = $fishcoldstorestmt->fetch(PDO::FETCH_ASSOC);
        $total_kg_damage = $fishcoldstore2['total_kg'] - $damagekg;
        $coldstorestmt = $pdo->prepare("INSERT INTO gfcfishcoldstore(date, ite, total_mc, kg, total_kg, rate) VALUES('$date', '$ite', '$total_mc', '$damagekg', '$total_kg_damage', '$coldstorerate')");
        $coldstorestmt->execute();
      }


      if(!empty($fishcoldstore)){
        if($fishcoldstore['date'] == $date){

          $exportcheckstmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore WHERE date='$date' AND ite='export' OR ite='takeout'");
          $exportcheckstmt->execute();
          $exportcheck = $exportcheckstmt->fetchall();
          if(empty($exportcheck)){
            $totalchargesstmt2 = $pdo->prepare("SELECT total_kg FROM gfcfishcoldstore WHERE date='$date' ORDER BY id DESC");
            $totalchargesstmt2->execute();
            $totalchargesdata2 = $totalchargesstmt2->fetch(PDO::FETCH_ASSOC);

            $coldstorecharges = $coldstorerate * $totalchargesdata2['total_kg'];
            $total_charges = $coldstorecharges + $fishcoldstore['total_charges'];
          }else{

            $maxdatas = $pdo->prepare("SELECT MAX(total_kg) AS maxkg FROM gfcfishcoldstore WHERE date='$date'");
            $maxdatas->execute();
            $maxdata = $maxdatas->fetch(PDO::FETCH_ASSOC);

            $coldstorecharges = $coldstorerate * $maxdata['maxkg'];
            $total_charges = $coldstorecharges + $fishcoldstore['total_charges'];
          }
        }else{
          $coldstorecharges = $total_kg * $coldstorerate;
          $total_charges = $fishcoldstore['total_charges'] + $coldstorecharges;
        }

      }else{
        $coldstorecharges = $total_kg * $coldstorerate;
        $total_charges = $coldstorecharges;
      }

      $lastrowstmt = $pdo->prepare("SELECT id FROM gfcfishcoldstore WHERE date='$date' ORDER BY id DESC");
      $lastrowstmt->execute();
      $lastrowsdata = $lastrowstmt->fetch(PDO::FETCH_ASSOC);
      $id = $lastrowsdata['id'];

      if($ite == 'import'){
        $importrowstmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore WHERE date='$date' AND ite='import'");
        $importrowstmt->execute();
        $importrowsdata = $importrowstmt->fetch(PDO::FETCH_ASSOC);
        $total_charges = $importrowsdata['total_charges'] + $coldstorecharges;
        $coldstoreupdatestmt = $pdo->prepare("UPDATE gfcfishcoldstore SET charges='$coldstorecharges', total_charges='$total_charges' WHERE id='$id'");
        $coldstoreupdatestmt->execute();
      }else{
        $coldstoreupdatestmt = $pdo->prepare("UPDATE gfcfishcoldstore SET charges='$coldstorecharges' WHERE id='$id'");
        $coldstoreupdatestmt->execute();
      }


      // Labour Add
      $fishlabourstmt = $pdo->prepare("SELECT * FROM gfcfishlabour ORDER BY id DESC");
      $fishlabourstmt->execute();
      $fishlabour = $fishlabourstmt->fetch(PDO::FETCH_ASSOC);
      if(!empty($fishlabour)){
        if($ite == 'import'){
          $labourcharges = $labourrate * $kg;
          $ltotal_charges = $labourcharges + $fishlabour['total_charges'];
        }
        if($ite == 'export'){
          $labourcharges = $labourrate * $kg;
          $ltotal_charges = $labourcharges + $fishlabour['total_charges'];
        }
        if($ite == 'takeout'){
          $labourcharges = $labourrate * $kg;
          $ltotal_charges = $labourcharges + $fishlabour['total_charges'];
        }
      }else{
        $labourcharges = $labourrate * $kg;
        $ltotal_charges = $labourcharges;
      }

      $coldstorestmt = $pdo->prepare("INSERT INTO gfcfishlabour(date, ite, kg, rate, charges, total_charges) VALUES('$date', '$ite', '$kg', '$labourrate', '$labourcharges', '$ltotal_charges')");
      $coldstorestmt->execute();

    }


  }

  function adddryfishcharges($date, $ite, $kg, $drycoldstorerate, $labourrate, $damagekg){
    global $pdo;

    if($ite == 'balance'){
      $fishcoldstorestmt = $pdo->prepare("SELECT * FROM gfcdryfishcoldstore ORDER BY id DESC");
      $fishcoldstorestmt->execute();
      $fishcoldstore = $fishcoldstorestmt->fetch(PDO::FETCH_ASSOC);

      if(!empty($fishcoldstore)){
        $total_kg = $fishcoldstore['total_kg'];
        $charges = $drycoldstorerate * $total_kg;
        $total_charges = $charges + $fishcoldstore['total_charges'];

        $coldstorestmt = $pdo->prepare("INSERT INTO gfcdryfishcoldstore(date, ite, total_kg, rate, charges, total_charges) VALUES('$date', '$ite', '$total_kg', '$drycoldstorerate', '$charges', '$total_charges')");
        $coldstorestmt->execute();
      }else{
        $total_kg = 0;
        $charges = 0;
        $total_charges = 0;

        $coldstorestmt = $pdo->prepare("INSERT INTO gfcdryfishcoldstore(date, ite, total_kg, rate, charges, total_charges) VALUES('$date', '$ite', '$total_kg', '$drycoldstorerate', '$charges', '$total_charges')");
        $coldstorestmt->execute();
      }
    }else{
      $dryfishcoldstorestmt = $pdo->prepare("SELECT * FROM gfcdryfishcoldstore ORDER BY id DESC");
      $dryfishcoldstorestmt->execute();
      $dryfishcoldstore = $dryfishcoldstorestmt->fetch(PDO::FETCH_ASSOC);
      if(!empty($dryfishcoldstore)){
        if($dryfishcoldstore['date'] == $date){
          if($ite == 'import'){
            $total_kg = intval($dryfishcoldstore['total_kg']) + intval($kg);
          }
          if($ite == 'export'){
            $total_kg = intval($dryfishcoldstore['total_kg']) - intval($kg);
          }
          if($ite == 'takeout'){
            $total_kg = intval($dryfishcoldstore['total_kg']) - intval($kg);
          }
        }else{
          if($ite == 'import'){
            $total_kg = intval($dryfishcoldstore['total_kg']) + intval($kg);
          }
          if($ite == 'export'){
            $total_kg = intval($dryfishcoldstore['total_kg']) - intval($kg);
          }
        }
      }else{
        $total_kg = $kg;
      }

      $coldstorestmt = $pdo->prepare("INSERT INTO gfcdryfishcoldstore(date, ite, kg, total_kg, rate) VALUES('$date', '$ite', '$kg', '$total_kg', '$drycoldstorerate')");
      $coldstorestmt->execute();
      if(!empty($damagekg)){
        $dryfishcoldstorestmt = $pdo->prepare("SELECT * FROM gfcdryfishcoldstore ORDER BY id DESC");
        $dryfishcoldstorestmt->execute();
        $dryfishcoldstore2 = $dryfishcoldstorestmt->fetch(PDO::FETCH_ASSOC);
        $total_kg_damage = $dryfishcoldstore2['total_kg'] - $damagekg;
        $coldstorestmt = $pdo->prepare("INSERT INTO gfcdryfishcoldstore(date, ite, kg, total_kg, rate) VALUES('$date', '$ite', '$damagekg', '$total_kg_damage', '$drycoldstorerate')");
        $coldstorestmt->execute();
      }


      if(!empty($dryfishcoldstore)){
        if($dryfishcoldstore['date'] == $date){

          $exportcheckstmt = $pdo->prepare("SELECT * FROM gfcdryfishcoldstore WHERE date='$date' AND ite='export' OR ite='takeout'");
          $exportcheckstmt->execute();
          $exportcheck = $exportcheckstmt->fetchall();
          if(empty($exportcheck)){
            $totalchargesstmt2 = $pdo->prepare("SELECT total_kg FROM gfcdryfishcoldstore WHERE date='$date' ORDER BY id DESC");
            $totalchargesstmt2->execute();
            $totalchargesdata2 = $totalchargesstmt2->fetch(PDO::FETCH_ASSOC);

            $drycoldstorecharges = $drycoldstorerate * $totalchargesdata2['total_kg'];
            $total_charges = $drycoldstorecharges + $dryfishcoldstore['total_charges'];
          }else{

            $maxdatas = $pdo->prepare("SELECT MAX(total_kg) AS maxkg FROM gfcdryfishcoldstore WHERE date='$date'");
            $maxdatas->execute();
            $maxdata = $maxdatas->fetch(PDO::FETCH_ASSOC);

            $drycoldstorecharges = $drycoldstorerate * $maxdata['maxkg'];
            $total_charges = $drycoldstorecharges + $dryfishcoldstore['total_charges'];
          }
        }else{
          $drycoldstorecharges = $total_kg * $drycoldstorerate;
          $total_charges = $dryfishcoldstore['total_charges'] + $drycoldstorecharges;
        }

      }else{
        $drycoldstorecharges = $total_kg * $drycoldstorerate;
        $total_charges = $drycoldstorecharges;
      }

      $lastrowstmt = $pdo->prepare("SELECT id FROM gfcdryfishcoldstore WHERE date='$date' ORDER BY id DESC");
      $lastrowstmt->execute();
      $lastrowsdata = $lastrowstmt->fetch(PDO::FETCH_ASSOC);
      $id = $lastrowsdata['id'];

      if($ite == 'import'){
        $importrowstmt = $pdo->prepare("SELECT * FROM gfcdryfishcoldstore WHERE date='$date' AND ite='import'");
        $importrowstmt->execute();
        $importrowsdata = $importrowstmt->fetch(PDO::FETCH_ASSOC);
        $total_charges = $importrowsdata['total_charges'] + $drycoldstorecharges;
        $coldstoreupdatestmt = $pdo->prepare("UPDATE gfcdryfishcoldstore SET charges='$drycoldstorecharges', total_charges='$total_charges' WHERE id='$id'");
        $coldstoreupdatestmt->execute();
      }else{
        $coldstoreupdatestmt = $pdo->prepare("UPDATE gfcdryfishcoldstore SET charges='$drycoldstorecharges' WHERE id='$id'");
        $coldstoreupdatestmt->execute();
      }


      // Labour Add
      $dryfishlabourstmt = $pdo->prepare("SELECT * FROM gfcdryfishlabour ORDER BY id DESC");
      $dryfishlabourstmt->execute();
      $dryfishlabour = $dryfishlabourstmt->fetch(PDO::FETCH_ASSOC);
      if(!empty($dryfishlabour)){
        if($ite == 'import'){
          $labourcharges = $labourrate * $kg;
          $ltotal_charges = $labourcharges + $dryfishlabour['total_charges'];
        }
        if($ite == 'export'){
          $labourcharges = $labourrate * $kg;
          $ltotal_charges = $labourcharges + $dryfishlabour['total_charges'];
        }
        if($ite == 'takeout'){
          $labourcharges = $labourrate * $kg;
          $ltotal_charges = $labourcharges + $dryfishlabour['total_charges'];
        }
      }else{
        $labourcharges = $labourrate * $kg;
        $ltotal_charges = $labourcharges;
      }

      $coldstorestmt = $pdo->prepare("INSERT INTO gfcdryfishlabour(date, ite, kg, rate, charges, total_charges) VALUES('$date', '$ite', '$kg', '$labourrate', '$labourcharges', '$ltotal_charges')");
      $coldstorestmt->execute();

    }


  }

  function addrepackingout($date, $outkg, $rprate){
    global $pdo;

    $repackingoutstmt = $pdo->prepare("SELECT * FROM repackingout ORDER BY id DESC");
    $repackingoutstmt->execute();
    $repackingoutdata = $repackingoutstmt->fetch(PDO::FETCH_ASSOC);
    if(!empty($repackingoutdata)){
      $charges = $rprate * $outkg;
      $total_charges = $charges + $repackingoutdata['total_charges'];
    }else{
      $charges = $rprate * $outkg;
      $total_charges = $charges;
    }

    $addrepackingstmt = $pdo->prepare("INSERT INTO repackingout(date, outkg, rate, charges, total_charges) VALUES('$date', '$outkg', '$rprate', '$charges', '$total_charges')");
    $addrepackingstmt->execute();
  }

  function addtotal($date, $plugoncharges, $payment_date, $payment_amount){
    global $pdo;

    $totalbalancestmt = $pdo->prepare("SELECT * FROM gfctotal ORDER BY id DESC");
    $totalbalancestmt->execute();
    $totalbalancedata = $totalbalancestmt->fetch(PDO::FETCH_ASSOC);

    $fishcoldstorestmt = $pdo->prepare("SELECT total_charges FROM gfcfishcoldstore ORDER BY id DESC");
    $fishcoldstorestmt->execute();
    $fishcoldstoredata = $fishcoldstorestmt->fetch(PDO::FETCH_ASSOC);

    $fishlabourstmt = $pdo->prepare("SELECT total_charges FROM gfcfishlabour ORDER BY id DESC");
    $fishlabourstmt->execute();
    $fishlabourdata = $fishlabourstmt->fetch(PDO::FETCH_ASSOC);

    $repackingstmt = $pdo->prepare("SELECT total_charges FROM repackingout ORDER BY id DESC");
    $repackingstmt->execute();
    $repackingdata = $repackingstmt->fetch(PDO::FETCH_ASSOC);

    $dryfishcoldstorestmt = $pdo->prepare("SELECT total_charges FROM gfcdryfishcoldstore ORDER BY id DESC");
    $dryfishcoldstorestmt->execute();
    $dryfishcoldstoredata = $dryfishcoldstorestmt->fetch(PDO::FETCH_ASSOC);

    $dryfishlabourstmt = $pdo->prepare("SELECT total_charges FROM gfcdryfishlabour ORDER BY id DESC");
    $dryfishlabourstmt->execute();
    $dryfishlabourdata = $dryfishlabourstmt->fetch(PDO::FETCH_ASSOC);

    $totalfishcoldstorecharges = $fishcoldstoredata['total_charges'];
    $totalfishlabourcharges = $fishlabourdata['total_charges'];
    $totaldryfishcoldstorecharges = $dryfishcoldstoredata['total_charges'];
    $totaldryfishlabourcharges = $dryfishlabourdata['total_charges'];
    $totalrepackingcharges = $repackingdata['total_charges'];
    if(!empty($totalbalancedata)){
      if(!empty($payment_date) && !empty($payment_date)){

        $total_charges = $totalfishcoldstorecharges + $totalfishlabourcharges + $totaldryfishcoldstorecharges + $totaldryfishlabourcharges + $totalrepackingcharges + $plugoncharges;

        $balance = $totalbalancedata['balance_amount'] + $total_charges - $payment_amount;
        $addtotalstmt = $pdo->prepare("INSERT INTO gfctotal(date, totalfishcoldstorecharges, totalfishlabourcharges, totalrepackingcharges, totaldryfishcoldstorecharges, totaldryfishlabourcharges, plugoncharges, total_charges, payment_date, payment_amount, balance_amount) VALUES('$date', '$totalfishcoldstorecharges', '$totalfishlabourcharges', '$totalrepackingcharges', '$totaldryfishcoldstorecharges', '$totaldryfishlabourcharges', '$plugoncharges', '$total_charges','$payment_date','$payment_amount', '$balance')");
        $addtotalstmt->execute();
      }else{
        $total_charges = $totalfishcoldstorecharges + $totalfishlabourcharges + $totaldryfishcoldstorecharges + $totaldryfishlabourcharges + $totalrepackingcharges + $plugoncharges;

        $balance = $totalbalancedata['balance_amount'] + $total_charges;
        $addtotalstmt = $pdo->prepare("INSERT INTO gfctotal(date, totalfishcoldstorecharges, totalfishlabourcharges, totalrepackingcharges, totaldryfishcoldstorecharges, totaldryfishlabourcharges, plugoncharges, total_charges, balance_amount) VALUES('$date', '$totalfishcoldstorecharges', '$totalfishlabourcharges', '$totalrepackingcharges', '$totaldryfishcoldstorecharges', '$totaldryfishlabourcharges', '$plugoncharges', '$total_charges', '$balance')");
        $addtotalstmt->execute();
      }
    }else{
      $total_charges = $totalfishcoldstorecharges + $totalfishlabourcharges + $totaldryfishcoldstorecharges + $totaldryfishlabourcharges + $totalrepackingcharges + $plugoncharges;
      $balance = $total_charges;
      $addtotalstmt = $pdo->prepare("INSERT INTO gfctotal(date, totalfishcoldstorecharges, totalfishlabourcharges, totalrepackingcharges, totaldryfishcoldstorecharges, totaldryfishlabourcharges, plugoncharges, total_charges, balance_amount) VALUES('$date', '$totalfishcoldstorecharges', '$totalfishlabourcharges', '$totalrepackingcharges', '$totaldryfishcoldstorecharges', '$totaldryfishlabourcharges', '$plugoncharges', '$total_charges', '$balance')");
      $addtotalstmt->execute();
    }
  }

  function addpayment($payment_date, $payment_amount, $id){
    global $pdo;

    $totalchargesstmt = $pdo->prepare("SELECT * FROM gfctotal ORDER BY id DESC");
    $totalchargesstmt->execute();
    $totalchargesdata = $totalchargesstmt->fetch(PDO::FETCH_ASSOC);

    $balance = $totalchargesdata['balance_amount'] - $payment_amount;

    $addpaymentstmt = $pdo->prepare("INSERT INTO gfctotal(payment_date, payment_amount, balance_amount) VALUES('$payment_date', '$payment_amount', '$balance')");
    $addpaymentstmt->execute();
  }

  function addpackingmaterial($commondity_id, $fish_size, $plastic, $jcv, $inner_box, $sticker, $mc_plastic, $carton_box, $tape, $penon, $p_sticker, $plastic_rope, $micellion, $processing, $plastic_size, $pcsperlb, $pcspermc, $tdydollorprice){
    global $pdo;

    $plastic = intval($plastic) * intval($pcspermc) / intval($pcsperlb) / 20;
    $jcv = intval($jcv) * $tdydollorprice / 300 / 20;
    $sticker = intval($sticker) * intval($pcspermc) / 20;
    $mc_plastic = intval($mc_plastic) / 5 / 20;
    $carton_box = intval($carton_box) / 20;
    $tape = intval($tape) / 70 / 20;
    $penon = intval($penon) / 20;
    $p_sticker = intval($p_sticker) / 20;
    $plastic_rope = intval($plastic_rope) / 70 / 20;
    $total = intval($plastic) + intval($jcv) + intval($inner_box) + intval($sticker) + intval($mc_plastic) + intval($carton_box) + intval($tape) + intval($penon) + intval($p_sticker) + intval($plastic_rope) + intval($micellion) + intval($processing);
    $perkgcost = $total / $tdydollorprice;
    $perkgcost = round($perkgcost, 2);
    $addpackingmaterialstmt = $pdo->prepare("INSERT INTO packingmaterial(commondity_id, fish_size, plastic, jcv, inner_box, sticker, mc_plastic, carton_box, tape, penon, p_sticker, plastic_rope, micellion, processing, total, perkgcost, plastic_size, pcsperlb, pcspermc)
    VALUES('$commondity_id', '$fish_size', '$plastic', '$jcv', '$inner_box', '$sticker', '$mc_plastic', '$carton_box', '$tape', '$penon', '$p_sticker', '$plastic_rope', '$micellion', '$processing', '$total', '$perkgcost', '$plastic_size', '$pcsperlb', '$pcspermc')");
    $addpackingmaterialstmt->execute();
  }

  function addrepacking($date, $in_mc, $in_kg, $out_mc, $out_kg, $rate){
    global $pdo;

    $repackingstmt = $pdo->prepare("SELECT * FROM repacking ORDER BY id DESC");
    $repackingstmt->execute();
    $repackingdata = $repackingstmt->fetch(PDO::FETCH_ASSOC);
    if(!empty($repackingdata)) {
      $diff_mc = $in_mc - $out_mc;
      $diff_kg = $in_kg - $out_kg;
      $charges = $rate * $in_kg;
      $total_charges = $charges + $repackingdata['total_charges'];

      $repackingaddstmt = $pdo->prepare("INSERT INTO repacking(date,in_mc, in_kg, out_mc, out_kg, diff_mc, diff_kg, rate, charges, total_charges) VALUES('$date','$in_mc', '$in_kg', '$out_mc', '$out_kg', '$diff_mc', '$diff_kg', '$rate', '$charges', '$total_charges')");
      $repackingaddstmt->execute();
    }else{
      $diff_mc = $in_mc - $out_mc;
      $diff_kg = $in_kg - $out_kg;
      $charges = $rate * $in_kg;
      $total_charges = $charges;

      $repackingaddstmt = $pdo->prepare("INSERT INTO repacking(date,in_mc, in_kg, out_mc, out_kg, diff_mc, diff_kg, rate, charges, total_charges) VALUES('$date','$in_mc', '$in_kg', '$out_mc', '$out_kg', '$diff_mc', '$diff_kg', '$rate', '$charges', '$total_charges')");
      $repackingaddstmt->execute();
    }
  }

  function paytotalcharges($payment_date, $payment_amount){
    global $pdo;

    $balancestmt = $pdo->prepare("SELECT balance_amount FROM total_charges ORDER BY id DESC");
    $balancestmt->execute();
    $balancedata = $balancestmt->fetch(PDO::FETCH_ASSOC);
    $balance = $balancedata['balance_amount'] - $payment_amount;

    $paytotalchargesstmt = $pdo->prepare("INSERT INTO total_charges(payment_date, payment_amount, balance_amount) VALUES('$payment_date', '$payment_amount', '$balance')");
    $paytotalchargesstmt->execute();
  }

  function addnewstock($indate, $commondity_id, $mc, $kg){
    global $pdo;

    $stockstmt = $pdo->prepare("SELECT * FROM hhkstock WHERE commondity_id='$commondity_id' ORDER BY id DESC");
    $stockstmt->execute();
    $stockdata = $stockstmt->fetch(PDO::FETCH_ASSOC);

    if(!empty($stockdata)){
      $total_mc = $mc + $stockdata['total_mc'];
      $total_kg = $kg + $stockdata['total_kg'];

      $balance = $total_kg + $stockdata['balance'];
    }else{
      $total_mc = $mc;
      $total_kg = $kg;

      $balance = $kg;
    }

    $newstockstmt = $pdo->prepare("INSERT INTO hhkstock(indate, commondity_id, mc, total_mc, kg, total_kg, balance) VALUES('$indate', '$commondity_id', '$mc', '$total_mc', '$kg', '$total_kg', '$balance')");
    $newstockstmt->execute();
  }

  // HHK QUERIES

  // MSL QUERIES
  function addmslnewstock($indate, $item_id, $mc, $kg){
    global $pdo;

    $stockstmt = $pdo->prepare("SELECT * FROM mslstock WHERE item_id='$item_id' ORDER BY id DESC");
    $stockstmt->execute();
    $stockdata = $stockstmt->fetch(PDO::FETCH_ASSOC);

    if(!empty($stockdata)){
      $total_mc = $mc + $stockdata['total_mc'];
      $total_kg = $kg + $stockdata['total_kg'];

      $balance = $total_kg + $stockdata['balance'];
    }else{
      $total_mc = $mc;
      $total_kg = $kg;

      $balance = $kg;
    }

    $newstockstmt = $pdo->prepare("INSERT INTO mslstock(indate, item_id, mc, total_mc, kg, total_kg, balance) VALUES('$indate', '$item_id', '$mc', '$total_mc', '$kg', '$total_kg', '$balance')");
    $newstockstmt->execute();
  }

  function addmslcoldstore($indate, $outdate, $item_id, $mc, $kg, $coldstorerate, $freezingrate, $exportrate, $loose_kg, $loose_mc){
    global $pdo;

    $datastmt = $pdo->prepare("SELECT * FROM mslcoldstore ORDER BY id DESC");
    $datastmt->execute();
    $data = $datastmt->fetch(PDO::FETCH_ASSOC);
    if(!empty($data)){
      $emptystmt = $pdo->prepare("SELECT * FROM mslcoldstore WHERE item_id='$item_id' ORDER BY id DESC");
      $emptystmt->execute();
      $emptydata = $emptystmt->fetch(PDO::FETCH_ASSOC);
      if (!empty($emptydata)) {
        $stmt = $pdo->prepare("SELECT * FROM mslcoldstore WHERE item_id='$item_id' ORDER BY id DESC");
        $stmt->execute();
        $data = $stmt->fetch(PDO::FETCH_ASSOC);

        $dtotal_mc = intval($data['total_mc']) + intval($mc);
        $dtotal_kg = intval($data['total_kg']) + intval($kg);
        $date1 = strtotime($indate);
        $date2 = strtotime($outdate);
        $diff = $date2 - $date1;
        $day = floor($diff / (60 * 60 * 24)) + 1;
        $charges = $day * intval($coldstorerate) * intval($kg);
        $total_charges = intval($iqfdata['total_charges']) + intval($charges);
      }else{
        $dtotal_mc = intval($mc);
        $dtotal_kg = intval($kg);
        $date1 = strtotime($indate);
        $date2 = strtotime($outdate);
        $diff = $date2 - $date1;
        $day = floor($diff / (60 * 60 * 24));
        $charges = $day * intval($coldstorerate) * intval($kg);
        $total_charges = intval($charges);
      }
    }else{
      $dtotal_mc = intval($mc);
      $dtotal_kg = intval($kg);
      $date1 = strtotime($indate);
      $date2 = strtotime($outdate);
      $diff = $date2 - $date1;
      $day = floor($diff / (60 * 60 * 24));
      $charges = $day * intval($coldstorerate) * intval($kg);
      $total_charges = intval($charges);
    }
    // Freezing ADD
    $labourstmt = $pdo->prepare("SELECT * FROM mslfreezing ORDER BY id DESC");
    $labourstmt->execute();
    $labour = $labourstmt->fetch(PDO::FETCH_ASSOC);
    if(!empty($labour)){
      $emptystmt = $pdo->prepare("SELECT * FROM mslfreezing WHERE item_id='$item_id' ORDER BY id DESC");
      $emptystmt->execute();
      $emptydata = $emptystmt->fetch(PDO::FETCH_ASSOC);
      if (!empty($emptydata)) {
        $stmt = $pdo->prepare("SELECT * FROM mslfreezing WHERE item_id='$item_id' ORDER BY id DESC");
        $stmt->execute();
        $data = $stmt->fetch(PDO::FETCH_ASSOC);

        $ftotal_mc = intval($data['total_mc']) + intval($mc);
        $ftotal_kg = intval($data['total_kg']) + intval($kg);
        $fcharges = intval($freezingrate) * intval($kg);
        $totalfreezingcharges = intval($data['total_charges']) + intval($fcharges);
      }else{
        $ftotal_mc = intval($mc);
        $ftotal_kg = intval($kg);
        $fcharges = intval($freezingrate) * intval($kg);
        $totalfreezingcharges = intval($fcharges);
      }
    }else{
      $ftotal_mc = intval($mc);
      $ftotal_kg = intval($kg);
      $fcharges = intval($freezingrate) * intval($kg);
      $totalfreezingcharges = intval($fcharges);
    }

    // Export Handling ADD
    $exportstmt = $pdo->prepare("SELECT * FROM mslexportcharges ORDER BY id DESC");
    $exportstmt->execute();
    $export = $exportstmt->fetch(PDO::FETCH_ASSOC);
    if(!empty($export)){
      $exportemptystmt = $pdo->prepare("SELECT * FROM mslexportcharges WHERE item_id='$item_id' ORDER BY id DESC");
      $exportemptystmt->execute();
      $exportemptydata = $exportemptystmt->fetch(PDO::FETCH_ASSOC);
      if (!empty($exportemptydata)) {
        $exportstmt = $pdo->prepare("SELECT * FROM mslexportcharges WHERE item_id='$item_id' ORDER BY id DESC");
        $exportstmt->execute();
        $exportdata = $exportstmt->fetch(PDO::FETCH_ASSOC);

        $etotal_mc = intval($exportdata['total_mc']) + intval($mc);
        $etotal_kg = intval($exportdata['total_kg']) + intval($kg);
        $echarges = intval($exportrate) * intval($kg);
        $totalexportcharges = intval($exportdata['total_charges']) + intval($echarges);
      }else{
        $etotal_mc = intval($mc);
        $etotal_kg = intval($kg);
        $echarges = intval($exportrate) * intval($kg);
        $totalexportcharges = intval($echarges);
      }
    }else{
      $etotal_mc = intval($mc);
      $etotal_kg = intval($kg);
      $echarges = intval($exportrate) * intval($kg);
      $totalexportcharges = intval($echarges);
    }

    // Add Stock
    $stockstmt = $pdo->prepare("SELECT * FROM mslstock WHERE item_id='$item_id' ORDER BY id DESC");
    $stockstmt->execute();
    $stockdata = $stockstmt->fetch(PDO::FETCH_ASSOC);

    $smc = $mc;
    $skg = $kg;
    $total_mc = $stockdata['total_mc'] - $mc;
    $total_kg = $stockdata['total_kg'] - $kg;

    $coldstorestmt = $pdo->prepare("INSERT INTO mslcoldstore(indate, outdate, item_id, mc, total_mc, kg, total_kg, day, rate, charges, total_charges) VALUES('$indate','$outdate','$item_id', '$mc','$dtotal_mc','$kg','$dtotal_kg','$day','$coldstorerate','$charges','$total_charges')");
    $coldstorestmt->execute();
    $labourstmt = $pdo->prepare("INSERT INTO mslfreezing(indate, outdate, item_id, mc, total_mc, kg, total_kg, rate, charges, total_charges) VALUES('$indate','$outdate','$item_id', '$mc','$ftotal_mc','$kg','$ftotal_kg','$freezingrate','$fcharges','$totalfreezingcharges')");
    $labourstmt->execute();
    $processingstmt = $pdo->prepare("INSERT INTO mslexportcharges(indate, outdate, item_id, mc, total_mc, kg, total_kg, rate, charges, total_charges) VALUES('$indate','$outdate','$item_id', '$mc','$etotal_mc','$kg','$etotal_kg','$exportrate','$echarges','$totalexportcharges')");
    $processingstmt->execute();
    $stockstmt = $pdo->prepare("INSERT INTO mslstock(outdate, item_id, mc, total_mc, kg, total_kg) VALUES('$outdate', '$item_id', '$smc', '$total_mc', '$skg', '$total_kg')");
    $stockstmt->execute();

    $datastmt = $pdo->prepare("SELECT * FROM msl_total_charges ORDER BY id DESC");
    $datastmt->execute();
    $data = $datastmt->fetch(PDO::FETCH_ASSOC);

    if(!empty($loose_kg) && !empty($loose_mc)){
      $totalcoldstorestmt = $pdo->prepare("SELECT * FROM mslcoldstore ORDER BY id DESC");
      $totalcoldstorestmt->execute();
      $totalcoldstoredata = $totalcoldstorestmt->fetch(PDO::FETCH_ASSOC);

      $totalfreezingstmt = $pdo->prepare("SELECT * FROM mslfreezing  ORDER BY id DESC");
      $totalfreezingstmt->execute();
      $totalfreezingdata = $totalfreezingstmt->fetch(PDO::FETCH_ASSOC);

      $totalexportstmt = $pdo->prepare("SELECT * FROM mslexportcharges ORDER BY id DESC");
      $totalexportstmt->execute();
      $totalexportdata = $totalexportstmt->fetch(PDO::FETCH_ASSOC);
      $coldstoretotal_mc = $totalcoldstoredata['total_mc'] + intval($loose_mc);
      $coldstoretotal_kg = $totalcoldstoredata['total_kg'] + intval($loose_kg);
      $freezingtotal_mc = $totalfreezingdata['total_mc'] + intval($loose_mc);
      $freezingtotal_kg = $totalfreezingdata['total_kg'] + intval($loose_kg);
      $exporttotal_mc = $totalexportdata['total_mc'] + intval($loose_mc);
      $exporttotal_kg = $totalexportdata['total_kg'] + intval($loose_kg);

      $loose_total_charges = $loose_kg * $day * $coldstorerate;
      $loosetotalfreezingcharges = $loose_kg * $freezingrate;
      $loosetotalexportcharges = $loose_kg * $exportrate;

      $totalcoldstorecharges = $totalcoldstoredata['total_charges'] + $loose_total_charges;
      $totalfreezingdatacharges = $totalfreezingdata['total_charges'] + $loosetotalfreezingcharges;
      $totalexportdatacharges = $totalexportdata['total_charges'] + $loosetotalexportcharges;

      $coldstorestmt = $pdo->prepare("INSERT INTO mslcoldstore(indate, item_id, mc, total_mc, kg, total_kg, day, rate, charges, total_charges) VALUES('$indate','$item_id', '$loose_mc','$coldstoretotal_mc','$loose_kg','$coldstoretotal_kg','$day','$coldstorerate','$loose_total_charges','$totalcoldstorecharges')");
      $coldstorestmt->execute();
      $labourstmt = $pdo->prepare("INSERT INTO mslfreezing(indate, item_id, mc, total_mc, kg, total_kg, rate, charges, total_charges) VALUES('$indate','$item_id', '$loose_mc','$freezingtotal_mc','$loose_kg','$ftotal_kg','$freezingtotal_kg','$loosetotalfreezingcharges','$totalfreezingdatacharges')");
      $labourstmt->execute();
      $processingstmt = $pdo->prepare("INSERT INTO mslexportcharges(indate, item_id, mc, total_mc, kg, total_kg, rate, charges, total_charges) VALUES('$indate','$item_id', '$loose_mc','$exporttotal_mc','$loose_kg','$etotal_kg','$exporttotal_kg','$loosetotalexportcharges','$totalexportdatacharges')");
      $processingstmt->execute();
    }

    $totalcoldstorestmt = $pdo->prepare("SELECT * FROM mslcoldstore ORDER BY id DESC");
    $totalcoldstorestmt->execute();
    $totalcoldstoredata = $totalcoldstorestmt->fetch(PDO::FETCH_ASSOC);

    $totalfreezingstmt = $pdo->prepare("SELECT * FROM mslfreezing  ORDER BY id DESC");
    $totalfreezingstmt->execute();
    $totalfreezingdata = $totalfreezingstmt->fetch(PDO::FETCH_ASSOC);

    $totalexportstmt = $pdo->prepare("SELECT * FROM mslexportcharges ORDER BY id DESC");
    $totalexportstmt->execute();
    $totalexportdata = $totalexportstmt->fetch(PDO::FETCH_ASSOC);

    $totalchargesstmt = $pdo->prepare("SELECT * FROM msl_total_charges ORDER BY id DESC");
    $totalchargesstmt->execute();
    $totalchargesdata = $totalchargesstmt->fetch(PDO::FETCH_ASSOC);


    if(!empty($totalchargesdata)){
      $total_coldstore_charges = $totalcoldstoredata['total_charges'];
      $total_freezing_charges = $totalfreezingdata['total_charges'];
      $total_export_charges = $totalexportdata['total_charges'];
      $total_charges = $totalcoldstoredata['total_charges'] + $totalfreezingdata['total_charges'] + $totalexportdata['total_charges'];
      $grand_total_charges = $totalchargesdata['balance_amount'] + $total_charges;
      $balance_amount = intval($grand_total_charges);
    }else{
      $total_coldstore_charges = $totalcoldstoredata['total_charges'];
      $total_freezing_charges = $totalfreezingdata['total_charges'];
      $total_export_charges = $totalexportdata['total_charges'];
      $total_charges = $totalcoldstoredata['total_charges'] + $totalfreezingdata['total_charges'] + $totalexportdata['total_charges'];
      $grand_total_charges = $total_charges;
      $balance_amount = $grand_total_charges;
    }

    $stmt = $pdo->prepare("INSERT INTO msl_total_charges(item_id, total_coldstore_charges, total_freezing_charges, total_export_charges, total_charges, grand_total_charges, balance_amount) VALUES('$item_id','$total_coldstore_charges', '$total_freezing_charges', '$total_export_charges', '$total_charges', '$grand_total_charges', '$balance_amount')");
    $stmt->execute();
  }

  function updatemslcoldstoretotal($id, $repacking_charges, $ice_charges){
    global $pdo;

    $totalchargesstmt = $pdo->prepare("SELECT * FROM msl_total_charges WHERE id='$id'");
    $totalchargesstmt->execute();
    $totalchargesdata =$totalchargesstmt->fetch(PDO::FETCH_ASSOC);

    $idd = $id - 1;
    $balancestmt = $pdo->prepare("SELECT * FROM msl_total_charges WHERE id='$idd'");
    $balancestmt->execute();
    $balancedata= $balancestmt->fetch(PDO::FETCH_ASSOC);

    $total_charges = intval($repacking_charges) + intval($ice_charges) + $totalchargesdata['total_charges'];
    $grand_total_charges = $balancedata['balance_amount'] + $total_charges;
    $balance_amount = $grand_total_charges;
    $updatestmt = $pdo->prepare("UPDATE msl_total_charges SET repacking_charges='$repacking_charges', ice_charges='$ice_charges', total_charges='$total_charges', grand_total_charges='$grand_total_charges', balance_amount='$balance_amount' WHERE id='$id'");
    $updatestmt->execute();
  }

  function paymsltotalcharges($payment_date, $payment_amount){
    global $pdo;

    $balancestmt = $pdo->prepare("SELECT balance_amount FROM msl_total_charges ORDER BY id DESC");
    $balancestmt->execute();
    $balancedata = $balancestmt->fetch(PDO::FETCH_ASSOC);
    $balance = $balancedata['balance_amount'] - $payment_amount;

    $paytotalchargesstmt = $pdo->prepare("INSERT INTO msl_total_charges(payment_date, payment_amount, balance_amount) VALUES('$payment_date', '$payment_amount', '$balance')");
    $paytotalchargesstmt->execute();
  }

  function addmslrepacking($date, $description, $sheet, $plastic, $price){
    global $pdo;

    $repackingstmt = $pdo->prepare("SELECT * FROM mslrepacking ORDER BY id DESC");
    $repackingstmt->execute();
    $repackingdata = $repackingstmt->fetch(PDO::FETCH_ASSOC);
    if(!empty($repackingdata)) {
      if(!empty($sheet)){
        $amount = $sheet * $price;
        $total_charges = $amount + $repackingdata['total_charges'];

        $repackingaddstmt = $pdo->prepare("INSERT INTO mslrepacking(date, description, sheet, plastic, price, amount, total_charges) VALUES('$date','$description','$sheet', '$plastic','$price', '$amount', '$total_charges')");
        $repackingaddstmt->execute();
      }else{
        $amount = intval($plastic) * $price;
        $total_charges = $amount + $repackingdata['total_charges'];

        $repackingaddstmt = $pdo->prepare("INSERT INTO mslrepacking(date, description, sheet, plastic, price, amount, total_charges) VALUES('$date','$description','$sheet', '$plastic','$price', '$amount', '$total_charges')");
        $repackingaddstmt->execute();
      }
    }else{
      if(!empty($sheet)){
        $amount = $sheet * $price;
        $total_charges = $amount;

        $repackingaddstmt = $pdo->prepare("INSERT INTO mslrepacking(date, description, sheet, plastic, price, amount, total_charges) VALUES('$date','$description','$sheet', '$plastic','$price', '$amount', '$total_charges')");
        $repackingaddstmt->execute();
      }else{
        $amount = intval($plastic) * $price;
        $total_charges = $amount;

        $repackingaddstmt = $pdo->prepare("INSERT INTO mslrepacking(date, description, sheet, plastic, price, amount, total_charges) VALUES('$date','$description','$sheet', '$plastic','$price', '$amount', '$total_charges')");
        $repackingaddstmt->execute();
      }
    }
  }

  // MSL QUERIES

  function updatecountry($country, $pcsperf7, $updateid){
    global $pdo;

    $countryupdatestmt = $pdo->prepare("UPDATE form7stock SET country='$country', pcsperf7='$pcsperf7' WHERE id='$updateid'");
    $countryupdatestmt->execute();
  }

  function addform10($date, $item_id, $country, $size, $pcsform10, $mc, $pcs, $looseinkg, $looseinpcs, $looseoutkg, $looseoutpcs){
    global $pdo;

    $kg = $mc * 20;
    $total_kg = intval($kg) + intval($looseinkg) - intval($looseoutkg);
    $addform10stmt = $pdo->prepare("INSERT INTO form10stock(date, item_id, country, size, pcsform10, mc, kg, pcs, looseinkg, looseinpcs, looseoutkg, looseoutpcs, total_kg) VALUES('$date', '$item_id', '$country', '$size', '$pcsform10', '$mc', '$kg', '$pcs', '$looseinkg', '$looseinpcs', '$looseoutkg', '$looseoutpcs', '$total_kg')");
    $addform10stmt->execute();
  }

  function addpackinglist($date, $customer_id, $country, $invoiceno, $containerno){
    global $pdo;

    $addpackingliststmt = $pdo->prepare("INSERT INTO packingliststock(date, customer_id, country, invoiceno, containerno) VALUES('$date', '$customer_id', '$country', '$invoiceno', '$containerno')");
    $addpackingliststmt->execute();
  }

  function addpackinglistinfo($commondity, $size, $packingkgperbox, $mc, $infoid){
    global $pdo;

    $totalnetweight = $packingkgperbox * $mc;
    $totalgrossweight = $totalnetweight + $mc;

    $addpackingliststmt = $pdo->prepare("INSERT INTO packingliststockinfo(commondity_id, size, packingkgperbox, mc, totalnetweight, totalgrossweight, infoid) VALUES('$commondity', '$size', '$packingkgperbox', '$mc', '$totalnetweight', '$totalgrossweight', '$infoid')");
    $addpackingliststmt->execute();
  }

  // MORE SELECTS

  function selectsum($table, $id, $selectwhat){
    global $pdo;
    $stmt = $pdo->prepare("SELECT SUM(amount) AS total_amount FROM $table WHERE $selectwhat='$id'");
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }

  function selectsumviss($table, $id, $selectwhat){
    global $pdo;
    $stmt = $pdo->prepare("SELECT SUM(viss) AS total_viss FROM $table WHERE $selectwhat='$id'");
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }

  function selectallsum($table, $row, $selectas){
    global $pdo;
    $stmt = $pdo->prepare("SELECT SUM($row) AS $selectas FROM $table");
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }

  function selectallsumpayable($table, $row, $selectas, $supplier_id){
    global $pdo;
    $stmt = $pdo->prepare("SELECT SUM($row) AS $selectas FROM $table WHERE supplier_id='$supplier_id'");
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }

  function selectsumdbw($table, $row, $selectas, $startdate, $enddate){
    global $pdo;
    $stmt = $pdo->prepare("SELECT SUM($row) AS $selectas FROM $table WHERE `date` BETWEEN '$startdate' AND '$enddate'");
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }

  function selectdbw($table, $startdate, $enddate){
    global $pdo;
    $stmt = $pdo->prepare("SELECT * FROM $table WHERE `date` BETWEEN '$startdate' AND '$enddate'");
    $stmt->execute();
    return $stmt->fetchall();
  }

  function selectsupplierdbw($table, $supplier_id, $startdate, $enddate){
    global $pdo;
    $stmt = $pdo->prepare("SELECT * FROM $table WHERE supplier_id='$supplier_id' AND `date` BETWEEN '$startdate' AND '$enddate'");
    $stmt->execute();
    return $stmt->fetchall();
  }

  function selectsupplierdbwsum($table, $row, $selectas, $supplier_id, $startdate, $enddate){
    global $pdo;
    $stmt = $pdo->prepare("SELECT SUM($row) AS $selectas FROM $table WHERE supplier_id='$supplier_id' AND `date` BETWEEN '$startdate' AND '$enddate'");
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }

  function selectcommoditydbw($table, $commodity, $startdate, $enddate){
    global $pdo;
    $stmt = $pdo->prepare("SELECT * FROM $table WHERE commodity='$commodity' AND `date` BETWEEN '$startdate' AND '$enddate'");
    $stmt->execute();
    return $stmt->fetchall();
  }

  function selectcommoditydbwsum($table, $row, $selectas, $commodity, $startdate, $enddate){
    global $pdo;
    $stmt = $pdo->prepare("SELECT SUM($row) AS $selectas FROM $table WHERE commodity='$commodity' AND `date` BETWEEN '$startdate' AND '$enddate'");
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }

  function selectvoucher($table, $voucher_no){
    global $pdo;
    $stmt = $pdo->prepare("SELECT * FROM $table WHERE voucher_no='$voucher_no'");
    $stmt->execute();
    return $stmt->fetchall();
  }

  function selectvouchersum($table, $row, $selectas, $voucher_no){
    global $pdo;
    $stmt = $pdo->prepare("SELECT SUM($row) AS $selectas FROM $table WHERE voucher_no='$voucher_no'");
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }

  function selectcommodityandsize($table, $item_id, $size){
    global $pdo;
    $stmt = $pdo->prepare("SELECT * FROM $table WHERE commodity='$item_id' AND size='$size';");
    $stmt->execute();
    return $stmt->fetchall();
  }

  function selectcommodityandsizesum($table, $row, $selectas, $item_id, $size){
    global $pdo;
    $stmt = $pdo->prepare("SELECT SUM($row) AS $selectas FROM $table WHERE commodity='$item_id' AND size='$size';");
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }

  function selectsumvisswithsize($table, $item_id, $size){
    global $pdo;
    $stmt = $pdo->prepare("SELECT SUM(viss) AS total_viss FROM $table WHERE commodity='$item_id' AND size='$size'");
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }
}

?>
