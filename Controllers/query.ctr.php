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

  function selectdesc($table){
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

  function addcashbookdata($table, $date, $account_no, $voucher_no, $account_type, $debit, $credit, $description){
    global $pdo;
    if(empty($date) || empty($account_no) || empty($voucher_no) || empty($account_type) || empty($debit) || empty($credit) || empty($description)){
      $errormessage = "The following field is required. ";
      if(empty($date)){
        $errormessage = $errormessage . "Date Field, ";
      }
      if(empty($account_no)){
        $errormessage = $errormessage . "Account No Field, ";
      }
      if(empty($voucher_no)){
        $errormessage = $errormessage . "Voucher No Field, ";
      }
      if(empty($account_type)){
        $errormessage = $errormessage . "Account Type Field. ";
      }
      if(empty($debit)){
        $errormessage = $errormessage . "Debit Field. ";
      }
      if(empty($credit)){
        $errormessage = $errormessage . "Credit Field. ";
      }
      if(empty($description)){
        $errormessage = $errormessage . "Description Field. ";
      }
      return $errormessage;
    }else{
      $balance = 0;
      $stmt = $pdo->prepare("INSERT INTO $table(date, account_no, voucher_no, account_type, debit, credit, description, balance) VALUES('$date', '$account_no', '$voucher_no', '$account_type', '$debit', '$credit', '$description', '$balance')");
      $stmt->execute();
      if($stmt){
        return $successmessage = "Account Deleted Successfully";
      }else{
        return $errmessage = "Error accors when deleted Accounts";
      }
    }
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
    $stmt = $pdo->prepare("INSERT INTO $table(date, voucher_no, tclfrozen, supplier_id, commodity, size, viss, pcs, price, amount) VALUES('$date', '$voucher_no', '$tclfrozen', '$supplier_name', '$commodity', '$size', '$viss', '$pcs', '$price', '$amount')");
    $stmt->execute();
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
}

?>
