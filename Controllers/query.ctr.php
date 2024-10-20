<?php

include "database.db.php";

require 'ValidatorInstance.php';

class Query
{

  function __construct()
  {
    global $pdo;
    $nowdate = new DateTime();
    $nowdate->modify('-6 months');

    $deletedate = $nowdate->format('d-m-Y');
  }

  function login($username, $password)
  {
    global $pdo;
    $stmt = $pdo->prepare("SELECT * FROM accounts WHERE username='$username'");
    $stmt->execute();
    $userdata = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!empty($userdata)) {
      if ($userdata['password'] == $password) {
        $_SESSION['role'] = $userdata['role'];
        $_SESSION['username'] = $username;
        $_SESSION['logged_in'] = true;
        $status = "Login Success";
      } else {
        $status = "Login Password Invalid";
      }
    } else {
      $status = "Login Failed";
    }
    date_default_timezone_set('Asia/Yangon');
    $login_time = date('h:i:s');
    $login_date = date('Y:m:d');
    $login_username = $username;
    $login_password = $password;

    $logstmt = $pdo->prepare("INSERT INTO userlogs(login_time, login_date, login_username, login_password, status)  VALUES('$login_time', '$login_date', '$login_username', '$login_password', '$status')");
    $logstmt->execute();

    if ($status == 'Login Success') {
      header('location:App/admin/Index.php');
    }
  }

  function logout()
  {
    global $pdo;

    date_default_timezone_set('Asia/Yangon');
    $logout_time = date('h:i:s');
    $logout_date = date('Y:m:d');
    $username = $_SESSION['username'];
    $status = "Logout Success";

    $logstmt = $pdo->prepare("INSERT INTO userlogs(login_time, login_date, login_username, status)  VALUES('$logout_time', '$logout_date', '$username', '$status')");
    $logstmt->execute();

    session_destroy();

    header('location:../../Login.php');
  }

  function selectall($table)
  {
    global $pdo;
    $stmt = $pdo->prepare("SELECT * FROM $table");
    $stmt->execute();
    return $stmt->fetchall();
  }

  function selectdist($table)
  {
    global $pdo;
    $stmt = $pdo->prepare("SELECT DISTINCT (voucher_no) FROM $table");
    $stmt->execute();
    return $stmt->fetchall();
  }

  function select($table, $id, $select_id)
  {
    global $pdo;
    $stmt = $pdo->prepare("SELECT * FROM $table WHERE $select_id='$id'");
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }

  function selectcontain($table, $column, $containwhat)
  {
    global $pdo;
    $stmt = $pdo->prepare("SELECT * FROM $table WHERE $column LIKE '%$containwhat%'");
    $stmt->execute();
    return $stmt->fetchall();
  }

  function selectoncecontain($table, $column, $containwhat)
  {
    global $pdo;
    $stmt = $pdo->prepare("SELECT * FROM $table WHERE $column LIKE '%$containwhat%'");
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }

  function search($table, $search_row, $serach_id)
  {
    global $pdo;
    $stmt = $pdo->prepare("SELECT * FROM $table WHERE $search_row='$serach_id'");
    $stmt->execute();
    return $stmt->fetchall();
  }

  function createaccount($table, $username, $password, $email, $role)
  {
    global $pdo;
    if (empty($username) || empty($password) || empty($email) || empty($role)) {
      $errormessage = "The following field is required. ";
      if (empty($username)) {
        $errormessage = $errormessage . "Username Field, ";
      }
      if (empty($password)) {
        $errormessage = $errormessage . "Password Field, ";
      }
      if (empty($email)) {
        $errormessage = $errormessage . "Email Field, ";
      }
      if (empty($role)) {
        $errormessage = $errormessage . "Role Field. ";
      }
      return $errormessage;
    } else {
      $stmt = $pdo->prepare("INSERT INTO $table(username, password, email, role) VALUES('$username', '$password', '$email', '$role')");
      $stmt->execute();
      if ($stmt) {
        return $successmessage = "Account Created Successfully";
      } else {
        return $errmessage = "Error accors when creating Accounts";
      }
    }
  }

  function updateaccount($table, $username, $password, $email, $role, $updateid)
  {
    global $pdo;
    if (empty($username) || empty($password) || empty($email) || empty($role)) {
      $errormessage = "The following field is required. ";
      if (empty($username)) {
        $errormessage = $errormessage . "Username Field, ";
      }
      if (empty($password)) {
        $errormessage = $errormessage . "Password Field, ";
      }
      if (empty($email)) {
        $errormessage = $errormessage . "Email Field, ";
      }
      if (empty($role)) {
        $errormessage = $errormessage . "Role Field. ";
      }
      return $errormessage;
    } else {
      $stmt = $pdo->prepare("UPDATE $table SET username='$username', password='$password', email='$email', role='$role' WHERE id=$updateid ");
      $stmt->execute();
      if ($stmt) {
        return $successmessage = "Account Updated Successfully";
      } else {
        return $errmessage = "Error accors when updating Accounts";
      }
    }
  }

  function deleteaccount($table, $deleteid)
  {
    global $pdo;
    $stmt = $pdo->prepare("DELETE FROM $table WHERE id=$deleteid");
    $stmt->execute();
    if ($stmt) {
      return $successmessage = "Account Deleted Successfully";
    } else {
      return $errmessage = "Error accors when deleted Accounts";
    }
  }

  function addrole($role_name)
  {
    global $pdo;

    $addrole = $pdo->prepare("INSERT INTO role(role_name) VALUES('$role_name')");
    $addrole->execute();
  }

  function updaterole($role_id, $role_name)
  {
    global $pdo;

    $updaterole = $pdo->prepare("UPDATE role SET role_name='$role_name' WHERE role_id='$role_id'");
    $updaterole->execute();
  }

  function deleterole($delete_role_id)
  {
    global $pdo;

    $deleterole = $pdo->prepare("DELETE FROM role WHERE role_id='$delete_role_id'");
    $deleterole->execute();
  }

  function addcashbookdata($table, $date, $serial_no, $ac_name, $particular, $debit, $credit)
  {
    global $pdo;
    $stmt = $pdo->prepare("SELECT balance FROM cashbook ORDER BY id DESC");
    $stmt->execute();
    $balance = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!empty($debit)) {
      $balance = $balance['balance'] + $debit;
    } elseif (!empty($credit)) {
      $balance = $balance['balance'] - $credit;
    }
    $stmt = $pdo->prepare("INSERT INTO $table(date, serial_no, ac_name, particular, debit, credit, balance) VALUES('$date', '$serial_no', '$ac_name', '$particular', '$debit', '$credit', '$balance')");
    $stmt->execute();
    if ($stmt) {
      return $successmessage = "Data Added Successfully";
    } else {
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

  function updatecashbookdata($date, $voucher_no, $particular, $debit, $credit, $id)
  {
    global $pdo;

    $balancestmt = $pdo->prepare("SELECT balance FROM cashbook WHERE id<'$id' ORDER BY id DESC");
    $balancestmt->execute();
    $balancedata = $balancestmt->fetch(PDO::FETCH_ASSOC);

    if (!empty($balancedata)) {
      $balance = ($balancedata['balance'] + floatval($debit)) - floatval($credit);
    } else {
      $balance = floatval($debit) - floatval($credit);
    }

    $stmt = $pdo->prepare("UPDATE cashbook SET date='$date', voucher_no='$voucher_no', particular='$particular', debit='$debit', credit='$credit', balance='$balance' WHERE id='$id'");
    $stmt->execute();
  }

  function addcategory($table, $item_id, $item_name, $rate)
  {
    global $pdo;
    $stmt = $pdo->prepare("INSERT INTO $table(category_id, category_name, rate) VALUES('$item_id', '$item_name', '$rate');");
    $stmt->execute();
    if ($stmt) {
      return $successmessage = "Category Added Successfully";
    } else {
      return $errmessage = "Error accors when adding Category";
    }
  }

  function updatecategory($table, $category_id, $category_name, $rate, $updateid)
  {
    global $pdo;
    $stmt = $pdo->prepare("UPDATE $table SET category_id='$category_id', category_name='$category_name', rate='$rate' WHERE id='$updateid'");
    $stmt->execute();
    if ($stmt) {
      return $successmessage = "Category Update Successfully";
    } else {
      return $errmessage = "Error accors when updating Category";
    }
  }

  function deletecategory($table, $deleteid)
  {
    global $pdo;
    $stmt = $pdo->prepare("DELETE FROM $table WHERE id=$deleteid");
    $stmt->execute();
    if ($stmt) {
      return $successmessage = "Category Deleted Successfully";
    } else {
      return $errmessage = "Error accors when deleted Category";
    }
  }
  function additem($table, $item_name)
  {
    global $pdo;
    $checkstmt = $pdo->prepare("SELECT * FROM $table");
    $checkstmt->execute();
    $checkdata = $checkstmt->fetchall();
    if (empty($checkdata)) {
      $stmt = $pdo->prepare("INSERT INTO $table(item_id, item_name) VALUES(1001, '$item_name');");
      $stmt->execute();
    } else {
      $stmt = $pdo->prepare("INSERT INTO $table(item_name) VALUES('$item_name');");
      $stmt->execute();
    }
    if ($stmt) {
      return $successmessage = "Item Added Successfully";
    } else {
      return $errmessage = "Error accors when adding Item";
    }
  }

  function updateitem($table, $item_name, $item_id)
  {
    global $pdo;
    $stmt = $pdo->prepare("UPDATE $table SET item_name='$item_name' WHERE item_id='$item_id'");
    $stmt->execute();
    if ($stmt) {
      return $successmessage = "Item Update Successfully";
    } else {
      return $errmessage = "Error accors when updating Item";
    }
  }

  function deleteitem($table, $deleteid)
  {
    global $pdo;
    $stmt = $pdo->prepare("DELETE FROM $table WHERE item_id='$deleteid'");
    $stmt->execute();
    if ($stmt) {
      return $successmessage = "Item Deleted Successfully";
    } else {
      return $errmessage = "Error accors when deleted Item";
    }
  }

  function addcustomer($table, $customer_id, $customer_name, $customer_detail, $customer_address)
  {
    global $pdo;

    $acstmt = $pdo->prepare("SELECT acid FROM actype WHERE ac_type='Current Asset'");
    $acstmt->execute();
    $actype = $acstmt->fetch(PDO::FETCH_ASSOC);

    if (!empty($actype)) {
      $acstmt = $pdo->prepare("SELECT acid FROM actype WHERE ac_type='Current Asset'");
      $acstmt->execute();
      $actype = $acstmt->fetch(PDO::FETCH_ASSOC);
      $actype = $actype['acid'];
    } else {
      $actypestmt = $pdo->prepare("INSERT INTO actype(ac_type) VALUES('Current Asset')");
      $actypestmt->execute();
      $acstmt = $pdo->prepare("SELECT acid FROM actype WHERE ac_type='Current Asset'");
      $acstmt->execute();
      $actype = $acstmt->fetch(PDO::FETCH_ASSOC);
      $actype = $actype['acid'];
    }

    $acvalidcheckstmt = $pdo->prepare("SELECT * FROM customers WHERE customer_id='$customer_id'");
    $acvalidcheckstmt->execute();
    $acvalidcheck = $acvalidcheckstmt->fetchall();

    if (empty($acvalidcheck)) {
      if (!empty($customer_id)) {
        if (str_contains($customer_id, "3300")) {
          $stmt = $pdo->prepare("INSERT INTO $table(customer_id, customer_name, customer_detail, customer_address) VALUES('$customer_id', '$customer_name', '$customer_detail', '$customer_address');");
          $stmt->execute();
          $acstmt = $pdo->prepare("INSERT INTO acname(code_no, ac_type, ac_name) VALUES('$customer_id', '$actype', '$customer_name');");
          $acstmt->execute();
          echo "<script>swal('Success!', 'Customer added success!', 'success');</script>";
        } else {
          echo "<script>swal('Error!', 'Not a valid code for customer', 'warning');</script>";
        }
      } else {
        echo "<script>swal('Error!', 'Invalid Fields', 'warning');</script>";
      }
    } else {
      echo "<script>swal('Error!', 'Sorry, customer already exists', 'warning');</script>";
    }
  }

  function updatecustomer($table, $customer_name, $customer_detail, $customer_address, $updateid)
  {
    global $pdo;
    $stmt = $pdo->prepare("UPDATE $table SET customer_name='$customer_name', customer_detail='$customer_detail', customer_address='$customer_address' WHERE customer_id='$updateid'");
    $stmt->execute();
    $acstmt = $pdo->prepare("UPDATE acname SET ac_name='$customer_name' WHERE code_no='$updateid'");
    $acstmt->execute();
    if ($stmt) {
      echo "<script>swal('Success!', 'Customer updated successfully', 'success');</script>";
    } else {
      echo "<script>swal('Error!', 'Error accour', 'warning');</script>";
    }
  }

  function deletecustomer($table, $deleteid)
  {
    global $pdo;
    $stmt = $pdo->prepare("DELETE FROM $table WHERE customer_id='$deleteid'");
    $stmt->execute();
    $acstmt = $pdo->prepare("DELETE FROM acname WHERE code_no='$deleteid'");
    $acstmt->execute();
    if ($stmt) {
      echo "<script>swal('Success!', 'Customer deleted successfully', 'success');</script>";
    } else {
      echo "<script>swal('Error!', 'Error accour', 'warning');</script>";
    }
  }

  function addsupplier($table, $supplier_id, $supplier_name, $supplier_phone, $supplier_address)
  {
    global $pdo;

    $accheckstmt = $pdo->prepare("SELECT * FROM acname WHERE code_no='$supplier_id'");
    $accheckstmt->execute();
    $accheck = $accheckstmt->fetchAll();

    $stmt = $pdo->prepare("INSERT INTO $table(supplier_id, supplier_name, supplier_phone, supplier_address) VALUES('$supplier_id', '$supplier_name', '$supplier_phone', '$supplier_address');");


    $acstmt = $pdo->prepare("SELECT acid FROM actype WHERE ac_type='Current Liabilities'");
    $acstmt->execute();
    $actype = $acstmt->fetch(PDO::FETCH_ASSOC);

    if (!empty($actype)) {
      $acstmt = $pdo->prepare("SELECT acid FROM actype WHERE ac_type='Current Liabilities'");
      $acstmt->execute();
      $actype = $acstmt->fetch(PDO::FETCH_ASSOC);
      $actype = $actype['acid'];
    } else {
      $actypestmt = $pdo->prepare("INSERT INTO actype(ac_type) VALUES('Current Liabilities')");
      if (empty($accheck)) {
        $actypestmt->execute();
      }
      $acstmt = $pdo->prepare("SELECT acid FROM actype WHERE ac_type='Current Liabilities'");
      if (empty($accheck)) {
        $acstmt->execute();
      }
      $actype = $acstmt->fetch(PDO::FETCH_ASSOC);
      $actype = $actype['acid'];
    }
    $acstmt = $pdo->prepare("INSERT INTO acname(code_no, ac_type, ac_name) VALUES('$supplier_id', '$actype', '$supplier_name');");

    if (empty($accheck)) {
      $stmt->execute();
      $acstmt->execute();
      echo '<script>swal("Success!", "Supplier Added Successfully", "success");</script>';
    } else {
      echo '<script>swal("Error!", "Sorry, this ac_code is already exits", "warning");</script>';
    }
  }

  function updatesupplier($table, $supplier_name, $supplier_phone, $supplier_address, $updateid)
  {
    global $pdo;

    $accheckstmt = $pdo->prepare("SELECT * FROM acname WHERE code_no='$supplier_name'");
    $accheckstmt->execute();
    $accheck = $accheckstmt->fetchAll();

    $stmt = $pdo->prepare("UPDATE $table SET supplier_name='$supplier_name', supplier_phone='$supplier_phone', supplier_address='$supplier_address' WHERE supplier_id='$updateid'");
    $acstmt = $pdo->prepare("UPDATE acname SET ac_name='$supplier_name' WHERE code_no='$updateid'");

    if (empty($accheck)) {
      $stmt->execute();
      $acstmt->execute();
      echo '<script>swal("Success!", "Supplier Updated Successfully", "success");</script>';
    } else {
      echo "<script>swal('Error', 'Duplicate A/C Name' , 'error')</script>";
    }
  }

  function deletesupplier($table, $deleteid)
  {
    global $pdo;
    $stmt = $pdo->prepare("DELETE FROM $table WHERE supplier_id='$deleteid'");
    $stmt->execute();
    $acstmt = $pdo->prepare("DELETE FROM acname WHERE code_no='$deleteid'");
    $acstmt->execute();
    if ($stmt) {
      echo '<script>swal("success!", "Supplier Deleted Successfully", "success");</script>';
    } else {
      echo "<script>swal('Warning', 'Error accors when deleted Supplier', 'warning');</script>";
    }
  }

  function addpurchase($table, $date, $voucher_no, $tclfrozen, $supplier_name, $commodity, $size, $viss, $pcs, $price)
  {
    global $pdo;
    if (!empty($viss) || !empty($price)) {
      $amount = floatval($price) * floatval($viss);
    } else {
      $amount = 0;
    }
    $idstmt = $pdo->prepare("SELECT no FROM $table ORDER BY no DESC");
    $idstmt->execute();
    $iddata = $idstmt->fetch(PDO::FETCH_ASSOC);
    $stmt = $pdo->prepare("INSERT INTO $table(date, voucher_no, tclfrozen, supplier_id, commodity, size, viss, pcs, price, amount) VALUES('$date', '$voucher_no', '$tclfrozen', '$supplier_name', '$commodity', '$size', '$viss', '$pcs', '$price', '$amount')");
    $stmt->execute();
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
    $idstmt = $pdo->prepare("SELECT * FROM $table ORDER BY no DESC");
    $idstmt->execute();
    $iddata = $idstmt->fetch(PDO::FETCH_ASSOC);
    $id = $iddata['no'];
    $payablestmt = $pdo->prepare("INSERT INTO payable(date, supplier_id, purchase_voucher_no, purchase_amount, balance, link_id) VALUES('$date', '$supplier_name', '$voucher_no', '$amount', '$total_balance', '$id')");
    $payablestmt->execute();
    $kg = floatval($viss) * 1.634;
    $link_id = $id;

    if ($tclfrozen === "tcl") {
      $formstmt = $pdo->prepare("INSERT INTO form7stocktcl(date, item_id, supplier_name, country, type, size, viss, kg, pcspervr, link_id) VALUES('$date', '$commodity', '$supplier_name', 'DAKA',  'TCl', '$size', '$viss', '$kg', '$pcs', '$link_id')");
      $formstmt->execute();
    } else {
      $formstmt = $pdo->prepare("INSERT INTO form7stock(date, item_id, supplier_name, type, size, viss, kg, pcspervr, link_id) VALUES('$date', '$commodity', '$supplier_name', 'Frozen', '$size', '$viss', '$kg', '$pcs', '$link_id')");
      $formstmt->execute();
    }
    if ($stmt) {
      echo '<script>swal("Success!", "Purchase Voucher Added Successfully", "success");</script>';
    } else {
      echo '<script>swal("Error!", "Error accors when added Purchase Voucher", "error");</script>';
    }

    // General Ledger Add
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

  function updatepurchase($table, $date, $voucher_no, $supplier_name, $tclfrozen, $commodity, $size, $viss, $pcs, $price, $no)
  {
    global $pdo;
    $amount = $price * floatval($viss);
    $stmt = $pdo->prepare("UPDATE $table SET date='$date', voucher_no='$voucher_no', supplier_id='$supplier_name', commodity='$commodity', size='$size', viss='$viss', pcs='$pcs', price='$price', amount='$amount' WHERE no='$no'");
    $stmt->execute();
    // $payablebalancestmt = $pdo->prepare("SELECT * FROM payable WHERE supplier_id='$supplier_name', link_id<'$no' ORDER BY id DESC");
    // $payablebalancestmt->execute();
    // $payablebalancedata = $payablebalancestmt->fetch(PDO::FETCH_ASSOC);
    //
    // print_r($payablebalancedata['balance']);
    // exit
    $stmt = $pdo->prepare("UPDATE payable SET date='$date', purchase_voucher_no='$voucher_no', supplier_id='$supplier_name', purchase_amount='$amount' WHERE link_id='$no'");
    $stmt->execute();

    $kg = floatval($viss) * 1.634;

    if ($tclfrozen == 'tcl') {
      $stmt = $pdo->prepare("UPDATE form7stocktcl SET date='$date', supplier_name='$supplier_name', item_id='$commodity', size='$size', viss='$viss', kg='$kg', pcspervr='$pcs' WHERE link_id='$no'");
      $stmt->execute();
    } else {
      $stmt = $pdo->prepare("UPDATE form7stock SET date='$date', supplier_name='$supplier_name', item_id='$commodity', size='$size', viss='$viss', kg='$kg', pcspervr='$pcs' WHERE link_id='$no'");
      $stmt->execute();
    }

    if ($stmt) {
      echo '<script>swal("Success!", "Updated Successfully!", "success");</script>';
    } else {
      return $errmessage = "";
      echo '<script>swal("Warning!", "Error accors when updating Purchase Voucher", "warning");</script>';
    }
  }

  function deletepurchase($table, $deleteid)
  {
    global $pdo;
    $stmt = $pdo->prepare("DELETE FROM $table WHERE no='$deleteid'");
    $stmt->execute();
    if ($stmt) {
      return $successmessage = "Purchase Voucher Deleted Successfully";
    } else {
      return $errmessage = "Error accors when deleted Purchase Voucher";
    }
  }

  function deletepayable($table, $deleteid)
  {
    global $pdo;
    $stmt = $pdo->prepare("DELETE FROM $table WHERE link_id='$deleteid'");
    $stmt->execute();
    if ($stmt) {
      return $successmessage = "Payable Voucher Deleted Successfully";
    } else {
      return $errmessage = "Error accors when deleted Payable Voucher";
    }
  }

  function addpayable($table, $supplier_id, $paid_date, $paid_voucher, $paid_amount)
  {
    global $pdo;
    $stmt = $pdo->prepare("INSERT INTO $table(supplier_id ,paid_date, paid_voucher, paid_amount) VALUES('$supplier_id', '$paid_date', '$paid_voucher', '$paid_amount')");
    $stmt->execute();
    if ($stmt) {
      return $successmessage = "Payable Voucher Added Successfully";
    } else {
      return $errmessage = "Error accors when adding Payable Voucher";
    }
  }

  function updatepayable($paid_date, $paid_voucher, $paid_amount, $id)
  {
    global $pdo;
    $stmt = $pdo->prepare("UPDATE payable SET paid_date='$paid_date', paid_voucher='$paid_voucher', paid_amount='$paid_amount' WHERE id='$id';");
    $stmt->execute();
    if ($stmt) {
      return $successmessage = "Payable Voucher Updated Successfully";
    } else {
      return $errmessage = "Error accors when updaing Payable Voucher";
    }
  }

  function addcontainer($container_no, $country, $date)
  {
    global $pdo;

    $addcontainerstmt = $pdo->prepare("INSERT INTO container(container_no, country, date) VALUES('$container_no', '$country', '$date')");
    $addcontainerstmt->execute();
  }

  // HHK QUERIES

  function updatehhkmcstock($newdate, $newparticular, $newcommondity_id, $newfish_type, $newsize, $newkg, $newmc, $newcountry, $updateid)
  {
    global $pdo;
    // echo $updateid;
    $olddatastmt = $pdo->prepare("SELECT balance_mc FROM hhkmcstock WHERE commondity_id='$newcommondity_id' AND size='$newsize' AND kg='$newkg' AND id < '$updateid' ORDER BY id DESC");
    $olddatastmt->execute();
    $olddata = $olddatastmt->fetch(PDO::FETCH_ASSOC);

    if (!empty($olddata)) {
      if (str_contains($newparticular, "GFC") || str_contains($newparticular, "gfc")) {
        $balance_mc = $olddata['balance_mc'] - $newmc;
      } else {
        $balance_mc = $olddata['balance_mc'] + $newmc;
      }
    } else {
      $balance_mc = $newmc;
    }

    $stmt = $pdo->prepare("UPDATE hhkmcstock SET date='$newdate', particular='$newparticular', commondity_id='$newcommondity_id', fish_type='$newfish_type', size='$newsize', kg='$newkg', mc='$newmc', country='$newcountry', balance_mc='$balance_mc' WHERE id='$updateid'");
    $stmt->execute();

    $updatedatastmt = $pdo->prepare("SELECT * FROM hhkmcstock WHERE commondity_id = '$newcommondity_id' AND size = '$newsize' AND kg='$newkg' AND id > '$updateid'");
    $updatedatastmt->execute();
    $updatedatas = $updatedatastmt->fetchAll();

    //update hhkmc for more rows
    foreach ($updatedatas as $updatedata) {
      $id = $updatedata['id'];
      $mc = $updatedata['mc'];
      $datasstmt = $pdo->prepare("SELECT * FROM hhkmcstock WHERE commondity_id = '$newcommondity_id' AND size = '$newsize' AND kg = '$newkg' AND id < '$id' ORDER BY id DESC");
      $datasstmt->execute();
      $datas = $datasstmt->fetch(PDO::FETCH_ASSOC);
      if (str_contains($updatedata['particular'], "GFC") || str_contains($updatedata['particular'], "gfc")) {
        $balance_mc = $datas['balance_mc'] - $mc;
      } else {
        $balance_mc = $datas['balance_mc'] + $mc;
      }

      $updatestmt = $pdo->prepare("UPDATE hhkmcstock SET balance_mc='$balance_mc' WHERE id='$id'");
      $updatestmt->execute();
    }


    // gfc update

    if (str_contains($newparticular, "GFC") || str_contains($newparticular, "GFC")) {
      $gfc_id_stmt = $pdo->prepare("SELECT * FROM gfcmcstock WHERE hhk_id = '$updateid'");
      $gfc_id_stmt->execute();
      $gfc_id_datas = $gfc_id_stmt->fetch(PDO::FETCH_ASSOC);
      if (!empty($gfc_id_datas)) {
        $gfc_id = $gfc_id_datas['id'];

        $gfcolddatastmt = $pdo->prepare("SELECT balance_mc FROM gfcmcstock WHERE commondity_id='$newcommondity_id' AND size='$newsize' AND kg='$newkg' AND id < '$gfc_id' ORDER BY id DESC");
        $gfcolddatastmt->execute();
        $gfcolddata = $gfcolddatastmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($gfcolddata)) {
          if (str_contains($newparticular, "GFC") || str_contains($newparticular, "gfc")) {
            $balance_mc = $gfcolddata['balance_mc'] + $mc;
          } else {
            $balance_mc = $gfcolddata['balance_mc'] - $mc;
          }
        } else {
          $balance_mc = $newmc;
        }
        $stmt = $pdo->prepare("UPDATE gfcmcstock SET date='$newdate', particular='$newparticular', commondity_id='$newcommondity_id', fish_type='$newfish_type', size='$newsize', kg='$newkg', mc='$newmc', country='$newcountry', mc='$newmc', balance_mc='$balance_mc' WHERE hhk_id='$updateid'");
        $stmt->execute();

        $updatedatastmt = $pdo->prepare("SELECT * FROM gfcmcstock WHERE commondity_id = '$newcommondity_id' AND size = '$newsize' AND kg='$newkg' AND id > '$gfc_id'");
        $updatedatastmt->execute();
        $updatedatas = $updatedatastmt->fetchAll();
        //update gfcmc for more rows
        foreach ($updatedatas as $updatedata) {
          $id = $updatedata['id'];
          $mc = $updatedata['mc'];
          $datasstmt = $pdo->prepare("SELECT * FROM gfcmcstock WHERE commondity_id = '$newcommondity_id' AND size = '$newsize' AND kg = '$newkg' AND id < '$id' ORDER BY id DESC");
          $datasstmt->execute();
          $datas = $datasstmt->fetch(PDO::FETCH_ASSOC);
          if (str_contains($updatedata['particular'], "GFC") || str_contains($updatedata['particular'], "gfc")) {
            $balance_mc = $datas['balance_mc'] + $mc;
          } else {
            $balance_mc = $datas['balance_mc'] - $mc;
          }

          $updatestmt = $pdo->prepare("UPDATE gfcmcstock SET balance_mc='$balance_mc' WHERE id='$id'");
          $updatestmt->execute();
        }
      }
    }
    echo "<script>window.location.href=\"?sizeinfo=$newsize&commondity=$newcommondity_id&country=$newcountry\"</script>";
  }


  function addcoldstore($indate, $outdate, $commondity_id, $mc, $kg, $coldstorerate, $labourrate, $processingrate, $pcharges)
  {
    global $pdo;
    $datastmt = $pdo->prepare("SELECT * FROM coldstore WHERE commondity_id='$commondity_id' ORDER BY id DESC");
    $datastmt->execute();
    $data = $datastmt->fetch(PDO::FETCH_ASSOC);
    $commonditystmt = $pdo->prepare("SELECT * FROM category WHERE category_id='$commondity_id'");
    $commonditystmt->execute();
    $commondity_name = $commonditystmt->fetch(PDO::FETCH_ASSOC);

    $comname = $commondity_name['category_name'];
    if (!empty($data)) {
      if (str_contains(strtolower($comname), 'iqf')) {
        $iqfemptystmt = $pdo->prepare("SELECT * FROM coldstore WHERE commondity_id='$commondity_id' ORDER BY id DESC");
        $iqfemptystmt->execute();
        $iqfemptydata = $iqfemptystmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($iqfemptydata)) {
          $iqfstmt = $pdo->prepare("SELECT * FROM coldstore WHERE commondity_id='$commondity_id' ORDER BY id DESC");
          $iqfstmt->execute();
          $iqfdata = $iqfstmt->fetch(PDO::FETCH_ASSOC);

          $dtotal_mc = floatval($iqfdata['total_mc']) + floatval($mc);
          $dtotal_kg = floatval($iqfdata['total_kg']) + floatval($kg);
          $date1 = strtotime($indate);
          $date2 = strtotime($outdate);
          $diff = $date2 - $date1;
          $day = floor($diff / (60 * 60 * 24)) + 1;
          $charges = $day * floatval($coldstorerate) * floatval($kg);
          $total_charges = floatval($iqfdata['total_charges']) + floatval($charges);
        } else {
          $dtotal_mc = floatval($mc);
          $dtotal_kg = floatval($kg);
          $date1 = strtotime($indate);
          $date2 = strtotime($outdate);
          $diff = $date2 - $date1;
          $day = floor($diff / (60 * 60 * 24)) + 1;
          $charges = $day * floatval($coldstorerate) * floatval($kg);
          $total_charges = floatval($charges);
        }
      } elseif (str_contains(strtolower($comname), 'block')) {
        $blockemptystmt = $pdo->prepare("SELECT * FROM coldstore WHERE commondity_id='$commondity_id' ORDER BY id DESC");
        $blockemptystmt->execute();
        $blockemptydata = $blockemptystmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($blockemptydata)) {
          $blockstmt = $pdo->prepare("SELECT * FROM coldstore WHERE commondity_id='$commondity_id' ORDER BY id DESC");
          $blockstmt->execute();
          $blockdata = $blockstmt->fetch(PDO::FETCH_ASSOC);

          $dtotal_mc = floatval($blockdata['total_mc']) + floatval($mc);
          $dtotal_kg = floatval($blockdata['total_kg']) + floatval($kg);
          $date1 = strtotime($indate);
          $date2 = strtotime($outdate);
          $diff = $date2 - $date1;
          $day = floor($diff / (60 * 60 * 24)) + 1;
          $charges = $day * floatval($coldstorerate) * floatval($kg);
          $total_charges = floatval($blockdata['total_charges']) + floatval($charges);
        } else {
          $dtotal_mc = floatval($mc);
          $dtotal_kg = floatval($kg);
          $date1 = strtotime($indate);
          $date2 = strtotime($outdate);
          $diff = $date2 - $date1;
          $day = floor($diff / (60 * 60 * 24)) + 1;
          $charges = $day * floatval($coldstorerate) * floatval($kg);
          $total_charges = floatval($charges);
        }
      } elseif (str_contains(strtolower($comname), 'pujanut')) {
        $pjnemptystmt = $pdo->prepare("SELECT * FROM coldstore WHERE commondity_id='$commondity_id' ORDER BY id DESC");
        $pjnemptystmt->execute();
        $pjnemptydata = $pjnemptystmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($pjnemptydata)) {
          $pjnstmt = $pdo->prepare("SELECT * FROM coldstore WHERE commondity_id='$commondity_id' ORDER BY id DESC");
          $pjnstmt->execute();
          $pjndata = $pjnstmt->fetch(PDO::FETCH_ASSOC);

          $dtotal_mc = floatval($pjndata['total_mc']) + floatval($mc);
          $dtotal_kg = floatval($pjndata['total_kg']) + floatval($kg);
          $date1 = strtotime($indate);
          $date2 = strtotime($outdate);
          $diff = $date2 - $date1;
          $day = floor($diff / (60 * 60 * 24)) + 1;
          $charges = $day * floatval($coldstorerate) * floatval($kg);
          $total_charges = floatval($pjndata['total_charges']) + floatval($charges);
        } else {
          $dtotal_mc = floatval($mc);
          $dtotal_kg = floatval($kg);
          $date1 = strtotime($indate);
          $date2 = strtotime($outdate);
          $diff = $date2 - $date1;
          $day = floor($diff / (60 * 60 * 24)) + 1;
          $charges = $day * floatval($coldstorerate) * floatval($kg);
          $total_charges = floatval($charges);
        }
      } else {
        $dtotal_mc = floatval($data['total_mc']) + floatval($mc);
        $dtotal_kg = floatval($data['total_kg']) + floatval($kg);
        $date1 = strtotime($indate);
        $date2 = strtotime($outdate);
        $diff = $date2 - $date1;
        $day = floor($diff / (60 * 60 * 24)) + 1;
        $charges = $day * floatval($coldstorerate) * floatval($kg);
        $total_charges = floatval($data['total_charges']) + floatval($charges);
      }
    } else {
      $dtotal_mc = floatval($mc);
      $dtotal_kg = floatval($kg);
      $date1 = strtotime($indate);
      $date2 = strtotime($outdate);
      $diff = $date2 - $date1;
      $day = floor($diff / (60 * 60 * 24)) + 1;
      $charges = $day * floatval($coldstorerate) * floatval($kg);
      $total_charges = floatval($charges);
    }
    // Labour ADD
    $labourstmt = $pdo->prepare("SELECT * FROM labour WHERE commondity_id='$commondity_id' ORDER BY id DESC");
    $labourstmt->execute();
    $labour = $labourstmt->fetch(PDO::FETCH_ASSOC);
    if (!empty($labour)) {
      if (str_contains(strtolower($comname), 'iqf')) {
        $iqfemptystmt = $pdo->prepare("SELECT * FROM labour WHERE commondity_id='$commondity_id' ORDER BY id DESC");
        $iqfemptystmt->execute();
        $iqfemptydata = $iqfemptystmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($iqfemptydata)) {
          $iqfstmt = $pdo->prepare("SELECT * FROM labour WHERE commondity_id='$commondity_id' ORDER BY id DESC");
          $iqfstmt->execute();
          $iqfdata = $iqfstmt->fetch(PDO::FETCH_ASSOC);

          $ltotal_mc = floatval($iqfdata['total_mc']) + floatval($mc);
          $ltotal_kg = floatval($iqfdata['total_kg']) + floatval($kg);
          $lcharges = floatval($labourrate) * floatval($kg);
          $totallabourcharges = floatval($iqfdata['total_charges']) + floatval($lcharges);
        } else {
          $ltotal_mc = floatval($mc);
          $ltotal_kg = floatval($kg);
          $lcharges = floatval($labourrate) * floatval($kg);
          $totallabourcharges = floatval($lcharges);
        }
      } elseif (str_contains(strtolower($comname), 'block')) {
        $blockemptystmt = $pdo->prepare("SELECT * FROM labour WHERE commondity_id='$commondity_id' ORDER BY id DESC");
        $blockemptystmt->execute();
        $blockemptydata = $blockemptystmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($blockemptydata)) {
          $blockstmt = $pdo->prepare("SELECT * FROM labour WHERE commondity_id='$commondity_id' ORDER BY id DESC");
          $blockstmt->execute();
          $blockdata = $blockstmt->fetch(PDO::FETCH_ASSOC);

          $ltotal_mc = floatval($blockdata['total_mc']) + floatval($mc);
          $ltotal_kg = floatval($blockdata['total_kg']) + floatval($kg);
          $lcharges = floatval($labourrate) * floatval($kg);
          $totallabourcharges = floatval($blockdata['total_charges']) + floatval($lcharges);
        } else {
          $ltotal_mc = floatval($mc);
          $ltotal_kg = floatval($kg);
          $lcharges = floatval($labourrate) * floatval($kg);
          $totallabourcharges = floatval($lcharges);
        }
      } elseif (str_contains(strtolower($comname), 'pujanut')) {
        $pjnemptystmt = $pdo->prepare("SELECT * FROM labour WHERE commondity_id='$commondity_id' ORDER BY id DESC");
        $pjnemptystmt->execute();
        $pjnemptydata = $pjnemptystmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($pjnemptydata)) {
          $pjnstmt = $pdo->prepare("SELECT * FROM labour WHERE commondity_id='$commondity_id' ORDER BY id DESC");
          $pjnstmt->execute();
          $pjndata = $pjnstmt->fetch(PDO::FETCH_ASSOC);

          $ltotal_mc = floatval($pjndata['total_mc']) + floatval($mc);
          $ltotal_kg = floatval($pjndata['total_kg']) + floatval($kg);
          $lcharges = floatval($labourrate) * floatval($kg);
          $totallabourcharges = floatval($pjndata['total_charges']) + floatval($lcharges);
        } else {
          $ltotal_mc = floatval($mc);
          $ltotal_kg = floatval($kg);
          $lcharges = floatval($labourrate) * floatval($kg);
          $totallabourcharges = floatval($lcharges);
        }
      } else {
        $pjnemptystmt = $pdo->prepare("SELECT * FROM labour WHERE commondity_id='$commondity_id' ORDER BY id DESC");
        $pjnemptystmt->execute();
        $pjnemptydata = $pjnemptystmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($pjnemptydata)) {
          $pjnstmt = $pdo->prepare("SELECT * FROM labour WHERE commondity_id='$commondity_id' ORDER BY id DESC");
          $pjnstmt->execute();
          $pjndata = $pjnstmt->fetch(PDO::FETCH_ASSOC);

          $ltotal_mc = floatval($pjndata['total_mc']) + floatval($mc);
          $ltotal_kg = floatval($pjndata['total_kg']) + floatval($kg);
          $lcharges = floatval($labourrate) * floatval($kg);
          $totallabourcharges = floatval($pjndata['total_charges']) + floatval($lcharges);
        } else {
          $ltotal_mc = floatval($mc);
          $ltotal_kg = floatval($kg);
          $lcharges = floatval($labourrate) * floatval($kg);
          $totallabourcharges = floatval($lcharges);
        }
      }
    } else {
      $ltotal_mc = floatval($mc);
      $ltotal_kg = floatval($kg);
      $lcharges = floatval($labourrate) * floatval($kg);
      $totallabourcharges = floatval($lcharges);
    }

    // Processing ADD
    $processingstmt = $pdo->prepare("SELECT * FROM processing WHERE commondity_id='$commondity_id' ORDER BY id DESC");
    $processingstmt->execute();
    $processing = $processingstmt->fetch(PDO::FETCH_ASSOC);
    if (!empty($processing)) {
      if (str_contains(strtolower($comname), 'iqf')) {
        $processingemptystmt = $pdo->prepare("SELECT * FROM processing WHERE commondity_id='$commondity_id' ORDER BY id DESC");
        $processingemptystmt->execute();
        $processingemptydata = $processingemptystmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($processingemptydata)) {
          $processingstmt = $pdo->prepare("SELECT * FROM processing WHERE commondity_id='$commondity_id' ORDER BY id DESC");
          $processingstmt->execute();
          $processingdata = $processingstmt->fetch(PDO::FETCH_ASSOC);

          $ptotal_mc = floatval($processingdata['total_mc']) + floatval($mc);
          $ptotal_kg = floatval($processingdata['total_kg']) + floatval($kg);
          $pcharges = floatval($processingrate) * floatval($kg);
          $totalprocessingcharges = floatval($processingdata['total_charges']) + floatval($pcharges);
        } else {
          $ptotal_mc = floatval($mc);
          $ptotal_kg = floatval($kg);
          $pcharges = floatval($processingrate) * floatval($kg);
          $totalprocessingcharges = floatval($pcharges);
        }
      } elseif (str_contains(strtolower($comname), 'block')) {
        // echo "Yes";
        $processingemptystmt = $pdo->prepare("SELECT * FROM processing WHERE commondity_id='$commondity_id' ORDER BY id DESC");
        $processingemptystmt->execute();
        $processingemptydata = $processingemptystmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($processingemptydata)) {
          $processingstmt = $pdo->prepare("SELECT * FROM processing WHERE commondity_id='$commondity_id' ORDER BY id DESC");
          $processingstmt->execute();
          $processingdata = $processingstmt->fetch(PDO::FETCH_ASSOC);

          $ptotal_mc = floatval($processingdata['total_mc']) + floatval($mc);
        } else {
          $ptotal_mc = floatval($mc);
          $ptotal_kg = floatval($kg);
          $totalprocessingcharges = floatval($pcharges);
        }
      } elseif (str_contains(strtolower($comname), 'pujanut')) {
        $processingemptystmt = $pdo->prepare("SELECT * FROM processing WHERE commondity_id='$commondity_id' ORDER BY id DESC");
        $processingemptystmt->execute();
        $processingemptydata = $processingemptystmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($processingemptydata)) {
          $processingstmt = $pdo->prepare("SELECT * FROM processing WHERE commondity_id='$commondity_id' ORDER BY id DESC");
          $processingstmt->execute();
          $processingdata = $processingstmt->fetch(PDO::FETCH_ASSOC);

          $ptotal_mc = floatval($processingdata['total_mc']) + floatval($mc);
          $ptotal_kg = floatval($processingdata['total_kg']) + floatval($kg);
          $pcharges = floatval($processingrate) * floatval($kg);
          $totalprocessingcharges = floatval($processingdata['total_charges']) + floatval($pcharges);
        } else {
          $ptotal_mc = floatval($mc);
          $ptotal_kg = floatval($kg);
          $pcharges = floatval($processingrate) * floatval($kg);
          $totalprocessingcharges = floatval($pcharges);
        }
      } else {
        $processingemptystmt = $pdo->prepare("SELECT * FROM processing WHERE commondity_id='$commondity_id' ORDER BY id DESC");
        $processingemptystmt->execute();
        $processingemptydata = $processingemptystmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($processingemptydata)) {
          $processingstmt = $pdo->prepare("SELECT * FROM processing WHERE commondity_id='$commondity_id' ORDER BY id DESC");
          $processingstmt->execute();
          $processingdata = $processingstmt->fetch(PDO::FETCH_ASSOC);

          $ptotal_mc = floatval($processingdata['total_mc']) + floatval($mc);
          $ptotal_kg = floatval($processingdata['total_kg']) + floatval($kg);
          $pcharges = floatval($processingrate) * floatval($kg);
          $totalprocessingcharges = floatval($processingdata['total_charges']) + floatval($pcharges);
        } else {
          $ptotal_mc = floatval($mc);
          $ptotal_kg = floatval($kg);
          $pcharges = floatval($processingrate) * floatval($kg);
          $totalprocessingcharges = floatval($pcharges);
        }
      }
    } else {
      if (str_contains(strtolower($comname), 'block')) {
        $ptotal_mc = floatval($mc);
        $ptotal_kg = floatval($kg);
        $pcharges = floatval($pcharges);
        $totalprocessingcharges = floatval($pcharges);
      } else {
        $ptotal_mc = floatval($mc);
        $ptotal_kg = floatval($kg);
        $pcharges = floatval($processingrate) * floatval($kg);
        $totalprocessingcharges = floatval($pcharges);
      }
    }

    // Add Stock
    $stockstmt = $pdo->prepare("SELECT * FROM hhkstock WHERE commondity_id='$commondity_id' AND indate='$indate' ORDER BY id DESC");
    $stockstmt->execute();
    $stockdata = $stockstmt->fetch(PDO::FETCH_ASSOC);
    // print_r($stockdata);
    if (!empty($stockdata)) {
      $smc = $mc;
      $skg = $kg;
      $total_mc = $stockdata['total_mc'] - $smc;
      $total_kg = $stockdata['total_kg'] - $skg;
      $balance = $stockdata['balance'] - $total_kg;
    } else {
      $smc = $mc;
      $skg = $kg;
      $total_mc = $smc;
      $total_kg = $skg;
      $balance = $total_kg;
    }

    $coldstorestmt = $pdo->prepare("INSERT INTO coldstore(indate, outdate, commondity_id, mc, total_mc, kg, total_kg, day, rate, charges, total_charges) VALUES('$indate','$outdate','$commondity_id', '$mc','$dtotal_mc','$kg','$dtotal_kg','$day','$coldstorerate','$charges','$total_charges')");
    $coldstorestmt->execute();
    $labourstmt = $pdo->prepare("INSERT INTO labour(indate, outdate, commondity_id, mc, total_mc, kg, total_kg, rate, charges, total_charges) VALUES('$indate','$outdate','$commondity_id', '$mc','$ltotal_mc','$kg','$ltotal_kg','$labourrate','$lcharges','$totallabourcharges')");
    $labourstmt->execute();
    $item_id = $commondity_id;
    $commonditydata = $this->select('category', $item_id, 'category_id');
    if (str_contains(strtolower($commonditydata['category_name']), 'block')) {
      $processingstmt = $pdo->prepare("INSERT INTO processing(indate, outdate, commondity_id, mc, total_mc) VALUES('$indate','$outdate','$commondity_id', '$mc','$ptotal_mc')");
      $processingstmt->execute();
    } else {
      $processingstmt = $pdo->prepare("INSERT INTO processing(indate, outdate, commondity_id, mc, total_mc, kg, total_kg, rate, charges, total_charges) VALUES('$indate','$outdate','$commondity_id', '$mc','$ptotal_mc','$kg','$ptotal_kg','$processingrate','$pcharges','$totalprocessingcharges')");
      $processingstmt->execute();
    }
    $coldstoredatas = $this->selectdesc('coldstore');
    $coldstoreid = $coldstoredatas[0]['id'];

    $stockstmt = $pdo->prepare("INSERT INTO hhkstock(indate, outdate, commondity_id, mc, total_mc, kg, total_kg, balance, link_id) VALUES('$indate', '$outdate', '$commondity_id', '$smc', '$total_mc', '$skg', '$total_kg', '$balance', '$coldstoreid')");
    $stockstmt->execute();
    // echo "execute";
    $datastmt = $pdo->prepare("SELECT * FROM total_charges ORDER BY id DESC");
    $datastmt->execute();
    $data = $datastmt->fetch(PDO::FETCH_ASSOC);

    $totalcoldstorestmt = $pdo->prepare("SELECT * FROM coldstore ORDER BY id DESC");
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

    if (!empty($totalchargesdata)) {
      $total_coldstore_charges = $totalcoldstoredata['charges'];
      $total_labour_charges = $totallabourdata['charges'];
      $total_processing_charges = $totalprocessingdata['charges'];
      // $total_charges = $totalcoldstoredata['charges'] + $totallabourdata['charges'];
      $total_charges = $totalcoldstoredata['charges'] + $totallabourdata['charges'] + $totalprocessingdata['charges'];
      $grand_total_charges = $totalchargesdata['balance_amount'] + $total_charges;
      $balance_amount = floatval($grand_total_charges);
    } else {
      $total_coldstore_charges = $totalcoldstoredata['charges'];
      $total_labour_charges = $totallabourdata['charges'];
      $total_processing_charges = $totalprocessingdata['charges'];
      $total_charges = $totalcoldstoredata['charges'] + $totallabourdata['charges'] + $totalprocessingdata['charges'];
      // $total_charges = $totalcoldstoredata['charges'] + $totallabourdata['charges'];
      $grand_total_charges = $total_charges;
      $balance_amount = $grand_total_charges;
    }
    // echo $total_processing_charges;
    $stmt = $pdo->prepare("INSERT INTO total_charges(date, commondity_id, total_coldstore_charges, total_labour_charges, total_processing_charges, total_charges, grand_total_charges, balance_amount, link_id) VALUES('$outdate', '$commondity_id','$total_coldstore_charges', '$total_labour_charges', '$total_processing_charges', '$total_charges', '$grand_total_charges', '$balance_amount', '$coldstoreid')");
    $stmt->execute();
  }

  function updatecoldstore($indate, $outdate, $commondity_id, $mc, $kg, $coldstorerate, $labourrate, $processingrate, $updateid)
  {
    global $pdo;
    $commonditystmt = $pdo->prepare("SELECT * FROM category WHERE category_id='$commondity_id'");
    $commonditystmt->execute();
    $commondity_name = $commonditystmt->fetch(PDO::FETCH_ASSOC);

    $comname = $commondity_name['category_name'];

    // ColdStore
    $datastmt = $pdo->prepare("SELECT * FROM coldstore WHERE id < '$updateid' AND commondity_id='$commondity_id'");
    $datastmt->execute();
    $data = $datastmt->fetch(PDO::FETCH_ASSOC);
    if (!empty($data)) {
      $dtotal_mc = $data['total_mc'] + floatval($mc);
      $dtotal_kg = $data['total_kg'] + floatval($kg);
      $date1 = strtotime($indate);
      $date2 = strtotime($outdate);
      $diff = $date2 - $date1;
      $day = floor($diff / (60 * 60 * 24)) + 1;
      $charges = $day * floatval($coldstorerate) * floatval($kg);
      $total_charges = floatval($data['total_charges']) + floatval($charges);
    } else {
      $dtotal_mc = floatval($mc);
      $dtotal_kg = floatval($kg);
      $date1 = strtotime($indate);
      $date2 = strtotime($outdate);
      $diff = $date2 - floatval($date1);
      $day = floor($diff / (60 * 60 * 24)) + 1;
      $charges = $day * floatval($coldstorerate) * floatval($kg);
      $total_charges = floatval($charges);
    }

    // Labour
    $labourstmt = $pdo->prepare("SELECT * FROM labour WHERE id < '$updateid' AND commondity_id='$commondity_id'");
    $labourstmt->execute();
    $labour = $labourstmt->fetch(PDO::FETCH_ASSOC);
    if (!empty($labour)) {
      $ltotal_mc = $labour['total_mc'] + floatval($mc);
      $ltotal_kg = $labour['total_kg'] + floatval($kg);
      $lcharges = floatval($labourrate) * floatval($kg);
      $totallabourcharges = floatval($labour['total_charges']) + floatval($lcharges);
    } else {
      $ltotal_mc = floatval($mc);
      $ltotal_kg = floatval($kg);
      $lcharges = $labourrate * floatval($kg);
      $totallabourcharges = floatval($lcharges);
    }

    // Processing
    $processingstmt = $pdo->prepare("SELECT * FROM processing WHERE id < '$updateid' AND commondity_id='$commondity_id'");
    $processingstmt->execute();
    $processing = $processingstmt->fetch(PDO::FETCH_ASSOC);
    if (!str_contains(strtolower($comname), 'block')) {
      if (!empty($processing)) {
        $ptotal_mc = $processing['total_mc'] + floatval($mc);
        $ptotal_kg = $processing['total_kg'] + floatval($kg);
        $pcharges = floatval($processingrate) * floatval($kg);
        $totalprocessingcharges = floatval($processing['total_charges']) + floatval($pcharges);
      } else {
        $ptotal_mc = floatval($mc);
        $ptotal_kg = floatval($kg);
        $pcharges = floatval($processingrate) * floatval($kg);
        $totalprocessingcharges = floatval($pcharges);
      }
    } else {
      if (!empty($processing)) {
        $ptotal_mc = $processing['total_mc'] + floatval($mc);
        $ptotal_kg = $processing['total_kg'] + floatval($kg);
        $pcharges = 0;
        $totalprocessingcharges = floatval($processing['total_charges']) + floatval($pcharges);
      } else {
        $ptotal_mc = floatval($mc);
        $ptotal_kg = floatval($kg);
        $pcharges = 0;
        $totalprocessingcharges = floatval($pcharges);
      }
    }

    // Stock
    $stockstmt = $pdo->prepare("SELECT * FROM hhkstock WHERE link_id < '$updateid' ORDER BY id DESC");
    $stockstmt->execute();
    $stock = $stockstmt->fetch(PDO::FETCH_ASSOC);
    if (!empty($stock)) {
      $stotal_mc = $stock['total_mc'] - floatval($mc);
      $stotal_kg = $stock['total_kg'] - floatval($kg);
    } else {
      $stotal_mc = floatval($mc);
      $stotal_kg = floatval($kg);
    }

    //Total Charges
    $totalidstmt = $pdo->prepare("SELECT id FROM total_charges WHERE commondity_id='$commondity_id' AND date='$outdate'");
    $totalidstmt->execute();
    $totalid = $totalidstmt->fetch(PDO::FETCH_ASSOC);
    if ($totalid) {
      $totalid = $totalid['id'];
      $totalstmt = $pdo->prepare("SELECT * FROM total_charges WHERE id='$totalid'");
      $totalstmt->execute();
      $totaldata = $totalstmt->fetch(PDO::FETCH_ASSOC);
    }
    if (!empty($totaldata)) {
      $total_processing_charges = $totaldata['total_processing_charges'];
      $total_repacking_charges = $totaldata['repacking_charges'];
      $ice_charges = $totaldata['ice_charges'];
      $ot_charges = $totaldata['ot_charges'];
    } else {
      $total_processing_charges = 0;
      $total_repacking_charges = 0;
      $ice_charges = 0;
      $ot_charges = 0;
    }

    $total_coldstore_charges = $charges;
    $total_labour_charges = $lcharges;
    $total_charges_of_total = $total_coldstore_charges + $total_labour_charges + $total_repacking_charges + $total_processing_charges + $total_repacking_charges + $ice_charges + $ot_charges;


    $coldstorestmt = $pdo->prepare("UPDATE coldstore SET indate='$indate', outdate='$outdate',commondity_id='$commondity_id', mc='$mc', total_mc='$dtotal_mc', kg='$kg', total_kg='$dtotal_kg', day='$day', rate='$coldstorerate', charges='$charges', total_charges='$total_charges' WHERE id='$updateid'");
    $coldstorestmt->execute();
    $labourstmt = $pdo->prepare("UPDATE labour SET indate='$indate', outdate='$outdate',commondity_id='$commondity_id', mc='$mc', total_mc='$ltotal_mc', kg='$kg', total_kg='$ltotal_kg', rate='$labourrate', charges='$lcharges', total_charges='$totallabourcharges' WHERE id='$updateid'");
    $labourstmt->execute();
    $commonditydata = $this->select('category', $commondity_id, 'category_id');
    if (str_contains($commonditydata['category_name'], 'stock')) {
      $labourstmt = $pdo->prepare("UPDATE processing SET indate='$indate', outdate='$outdate',commondity_id='$commondity_id', mc='$mc', total_mc='$ltotal_mc', total_charges='$totallabourcharges' WHERE id='$updateid'");
      $labourstmt->execute();
    } else {
      $labourstmt = $pdo->prepare("UPDATE processing SET indate='$indate', outdate='$outdate',commondity_id='$commondity_id', mc='$mc', total_mc='$ptotal_mc', kg='$kg', total_kg='$ptotal_kg', rate='$processingrate', charges='$pcharges', total_charges='$totalprocessingcharges' WHERE id='$updateid'");
      $labourstmt->execute();
    }
    $stockstmt = $pdo->prepare("UPDATE hhkstock SET indate='$indate', mc='$mc', total_mc='$stotal_mc', kg='$kg', total_kg='$stotal_kg' WHERE link_id='$updateid'");
    $stockstmt->execute();
    $totalupdatestmt = $pdo->prepare("UPDATE total_charges SET commondity_id='$commondity_id', total_coldstore_charges='$total_coldstore_charges', total_labour_charges='$total_labour_charges', total_processing_charges='$total_processing_charges', total_charges='$total_charges_of_total' WHERE link_id='$updateid'");
    $totalupdatestmt->execute();

    // ColdStore Update
    $cstmt = $pdo->prepare("SELECT * FROM coldstore WHERE id > '$updateid' AND commondity_id='$commondity_id'");
    $cstmt->execute();
    $cstmtdatas = $cstmt->fetchall();
    foreach ($cstmtdatas as $stmtdata) {
      $id = $stmtdata['id'] - 1;
      $stmt = $pdo->prepare("SELECT * FROM coldstore WHERE id='$id'");
      $stmt->execute();
      $data = $stmt->fetch(PDO::FETCH_ASSOC);
      if (!empty($data)) {
        $totalmc = $stmtdata['mc'] + $data['total_mc'];
        $totalkg = $stmtdata['kg'] + $data['total_kg'];
        $charges = floatval($stmtdata['kg']) * floatval($stmtdata['rate']) * floatval($stmtdata['day']);
        $NewCharges = $stmtdata['charges'] + $data['total_charges'];
      } else {
        $totalmc = $stmtdata['mc'];
        $totalkg = $stmtdata['kg'];
        $charges = $stmtdata['kg'] * $stmtdata['rate'] * $stmtdata['day'];
        $NewCharges = $stmtdata['charges'];
      }
      $updatestmt = $pdo->prepare("UPDATE coldstore SET total_mc='$totalmc', total_kg='$totalkg', charges='$charges', total_charges='$NewCharges' WHERE id=" . $stmtdata['id']);
      $updatestmt->execute();
    }

    // Labour Update
    $lstmt = $pdo->prepare("SELECT * FROM labour WHERE id > '$updateid' AND commondity_id='$commondity_id'");
    $lstmt->execute();
    $lstmtdatas = $lstmt->fetchall();
    foreach ($lstmtdatas as $lstmtdata) {
      $id = $lstmtdata['id'] - 1;
      $stmt = $pdo->prepare("SELECT * FROM labour WHERE id='$id' AND commondity_id='$commondity_id'");
      $stmt->execute();
      $data = $stmt->fetch(PDO::FETCH_ASSOC);
      if (!empty($data)) {
        $totalmc = $lstmtdata['mc'] + $data['total_mc'];
        $totalkg = $lstmtdata['kg'] + $data['total_kg'];
        $charges = $lstmtdata['kg'] * $lstmtdata['rate'];
        $lNewCharges = $lstmtdata['charges'] + $data['total_charges'];
      } else {
        $totalmc = $lstmtdata['mc'];
        $totalkg = $lstmtdata['kg'];
        $charges = $lstmtdata['kg'] * $lstmtdata['rate'];
        $lNewCharges = $lstmtdata['charges'];
      }
      $updatestmt = $pdo->prepare("UPDATE labour SET total_mc='$totalmc', total_kg='$totalkg', charges='$charges', total_charges='$lNewCharges' WHERE id=" . $lstmtdata['id']);
      $updatestmt->execute();
    }

    // Processing Update
    $pstmt = $pdo->prepare("SELECT * FROM processing WHERE id > '$updateid' AND commondity_id='$commondity_id'");
    $pstmt->execute();
    $pstmtdatas = $pstmt->fetchall();
    foreach ($pstmtdatas as $pstmtdata) {
      $id = $pstmtdata['id'] - 1;
      $stmt = $pdo->prepare("SELECT * FROM processing WHERE id='$id' AND commondity_id='$commondity_id'");
      $stmt->execute();
      $data = $stmt->fetch(PDO::FETCH_ASSOC);
      if (!empty($data)) {
        $totalmc = $pstmtdata['mc'] + $data['total_mc'];
        $totalkg = floatval($pstmtdata['kg']) + floatval($data['total_kg']);
        $charges = floatval($pstmtdata['kg']) * floatval($pstmtdata['rate']);
        $pNewCharges = $pstmtdata['charges'] + $data['total_charges'];
      } else {
        $totalmc = $pstmtdata['mc'];
        $totalkg = floatval($pstmtdata['kg']);
        $charges = floatval($pstmtdata['kg']) * floatval($pstmtdata['rate']);
        $pNewCharges = $pstmtdata['charges'];
      }
      $updatestmt = $pdo->prepare("UPDATE processing SET total_mc='$totalmc', total_kg='$totalkg', charges='$charges', total_charges='$pNewCharges' WHERE id=" . $pstmtdata['id']);
      $updatestmt->execute();
    }
  }

  function updatecoldstoretotal($id, $repacking_charges, $ice_charges, $ot_charges, $total_processing_charges, $extra_charges)
  {
    global $pdo;

    $totalchargesstmt = $pdo->prepare("SELECT * FROM total_charges WHERE id='$id'");
    $totalchargesstmt->execute();
    $totalchargesdata = $totalchargesstmt->fetch(PDO::FETCH_ASSOC);

    $link_id = $totalchargesdata['link_id'];

    $coldstorestmt = $pdo->prepare("SELECT * FROM coldstore WHERE id='$link_id'");
    $coldstorestmt->execute();
    $coldstoredata = $coldstorestmt->fetch(PDO::FETCH_ASSOC);

    $labourstmt = $pdo->prepare("SELECT * FROM labour WHERE id='$link_id'");
    $labourstmt->execute();
    $labourdata = $labourstmt->fetch(PDO::FETCH_ASSOC);


    $balancestmt = $pdo->prepare("SELECT * FROM total_charges WHERE id<'$id' ORDER BY id DESC");
    $balancestmt->execute();
    $balancedata = $balancestmt->fetch(PDO::FETCH_ASSOC);

    $total_charges = floatval($repacking_charges) + floatval($ice_charges) + floatval($ot_charges) + floatval($total_processing_charges) + floatval($extra_charges) + floatval($coldstoredata['charges']) + floatval($labourdata['charges']);

    if (!empty($balancedata['balance_amount'])) {
      $grand_total_charges = $balancedata['balance_amount'] + $total_charges;
    } else {
      $grand_total_charges = $total_charges;
    }
    $balance_amount = $grand_total_charges;
    $updatestmt = $pdo->prepare("UPDATE total_charges SET repacking_charges='$repacking_charges', ice_charges='$ice_charges', ot_charges='$ot_charges', extra_charges='$extra_charges', total_processing_charges='$total_processing_charges', total_charges='$total_charges', grand_total_charges='$grand_total_charges', balance_amount='$balance_amount' WHERE id='$id'");
    $updatestmt->execute();
  }

  function addfishcharges($date, $ite, $mc, $kg, $coldstorerate, $labourrate, $inkg, $outkg)
  {
    global $pdo;

    if ($ite == 'import') {
      $lastrowdatastmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore WHERE date='$date' AND ite='import' ORDER BY id DESC");
      $lastrowdatastmt->execute();
      $lastrowdatas = $lastrowdatastmt->fetch(PDO::FETCH_ASSOC);

      if (!empty($lastrowdatas['id'])) {
        $lastid = $lastrowdatas['id'];
        $lastrowstmt = $pdo->prepare("UPDATE gfcfishcoldstore SET charges=0, total_charges=0  WHERE id='$lastid'");
        $lastrowstmt->execute();
      }
    }

    $fishcoldstorestmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore WHERE date<'$date' ORDER BY id DESC");
    $fishcoldstorestmt->execute();
    $fishcoldstore = $fishcoldstorestmt->fetch(PDO::FETCH_ASSOC);

    $checkfishcoldstorestmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore ORDER BY id DESC");
    $checkfishcoldstorestmt->execute();
    $checkfishcoldstore = $checkfishcoldstorestmt->fetch(PDO::FETCH_ASSOC);

    if (!empty($checkfishcoldstore)) {
      $lastdate = $checkfishcoldstore['date'];
    } else {
      $lastdate = '0000-00-00';
    }

    $nowtimestamp = strtotime($date);
    $nowyearmonth = date("Y-m", $nowtimestamp);

    $lasttimestamp = strtotime($lastdate);
    $lastyearmonth = date("Y-m", $lasttimestamp);

    if ($nowyearmonth == $lastyearmonth) {
      $monthsameornot = true;
    } else {
      $monthsameornot = false;
    }
    if ($ite == 'balance') {
      if (!empty($fishcoldstore)) {
        $total_mc = $fishcoldstore['total_mc'];
        $total_kg = floatval($fishcoldstore['total_kg']);
        if (!empty($coldstorerate)) {
          $charges = floatval($coldstorerate) * floatval($total_kg);
        } else {
          $charges = floatval($fishcoldstore['rate']) * floatval($total_kg);
        }
        if ($monthsameornot === false) {
          $total_charges = $charges;
        } else {
          $total_charges = $charges + $fishcoldstore['total_charges'];
        }

        if (!empty($coldstorerate)) {
          $coldstorestmt = $pdo->prepare("INSERT INTO gfcfishcoldstore(date, ite, total_mc, total_kg, rate, charges, total_charges) VALUES('$date', '$ite', '$total_mc', '$total_kg', '$coldstorerate', '$charges', '$total_charges')");
        } else {
          $coldstorerate = $fishcoldstore['rate'];
          $coldstorestmt = $pdo->prepare("INSERT INTO gfcfishcoldstore(date, ite, total_mc, total_kg, rate, charges, total_charges) VALUES('$date', '$ite', '$total_mc', '$total_kg', '$coldstorerate', '$charges', '$total_charges')");
        }
        $coldstorestmt->execute();
      } else {
        if (!empty($mc) && !empty($kg)) {
          $total_mc = $mc;
          $total_kg = $kg;
          $charges = $total_kg * $coldstorerate;
          $total_charges = $charges;

          $coldstorestmt = $pdo->prepare("INSERT INTO gfcfishcoldstore(date, ite, mc, total_mc, kg, total_kg, rate, charges, total_charges) VALUES('$date', '$ite', '$mc', '$total_mc', '$kg', '$total_kg', '$coldstorerate', '$charges', '$total_charges')");
          $coldstorestmt->execute();
        } else {
          $total_mc = 0;
          $total_kg = 0;
          $charges = 0;
          $total_charges = 0;

          $coldstorestmt = $pdo->prepare("INSERT INTO gfcfishcoldstore(date, ite, total_mc, total_kg, rate, charges, total_charges) VALUES('$date', '$ite', '$total_mc', '$total_kg', '$coldstorerate', '$charges', '$total_charges')");
          $coldstorestmt->execute();
        }
      }
    } else {
      if (!empty($fishcoldstore)) {
        if ($fishcoldstore['date'] == $date) {
          if ($ite == 'import') {
            $total_mc = floatval($fishcoldstore['total_mc']) + floatval($mc);
            $total_kg = floatval($fishcoldstore['total_kg']) + floatval($kg);
          }
          if ($ite == 'export') {
            $total_mc = floatval($fishcoldstore['total_mc']) - floatval($mc);
            $total_kg = floatval($fishcoldstore['total_kg']) - floatval($kg);
          }
          if ($ite == 'takeout') {
            $total_mc = floatval($fishcoldstore['total_mc']) - floatval($mc);
            $total_kg = floatval($fishcoldstore['total_kg']) - floatval($kg);
          }
        } else {
          $samedatestmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore ORDER BY id DESC");
          $samedatestmt->execute();
          $samedatedata = $samedatestmt->fetch(PDO::FETCH_ASSOC);

          if ($samedatedata['date'] == $date) {
            if ($ite == 'import') {
              $total_mc = floatval($samedatedata['total_mc']) + floatval($mc);
              $total_kg = floatval($samedatedata['total_kg']) + floatval($kg);
            }
            if ($ite == 'export') {
              $total_mc = floatval($samedatedata['total_mc']) - floatval($mc);
              $total_kg = floatval($samedatedata['total_kg']) - floatval($kg);
            }
            if ($ite == 'takeout') {
              $total_mc = floatval($samedatedata['total_mc']) - floatval($mc);
              $total_kg = floatval($samedatedata['total_kg']) - floatval($kg);
            }
          } else {
            if ($ite == 'import') {
              $total_mc = floatval($fishcoldstore['total_mc']) + floatval($mc);
              $total_kg = floatval($fishcoldstore['total_kg']) + floatval($kg);
            }
            if ($ite == 'export') {
              $total_mc = floatval($fishcoldstore['total_mc']) - floatval($mc);
              $total_kg = floatval($fishcoldstore['total_kg']) - floatval($kg);
            }
            if ($ite == 'takeout') {
              $total_mc = floatval($fishcoldstore['total_mc']) - floatval($mc);
              $total_kg = floatval($fishcoldstore['total_kg']) - floatval($kg);
            }
          }
        }
      } else {
        $total_mc = $mc;
        $total_kg = floatval($kg);
      }


      $coldstorestmt = $pdo->prepare("INSERT INTO gfcfishcoldstore(date, ite, mc, total_mc, kg, total_kg, rate) VALUES('$date', '$ite', '$mc', '$total_mc', '$kg', '$total_kg', '$coldstorerate')");
      $coldstorestmt->execute();
      if (!empty($outkg)) {
        $fishcoldstorestmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore ORDER BY id DESC");
        $fishcoldstorestmt->execute();
        $fishcoldstore2 = $fishcoldstorestmt->fetch(PDO::FETCH_ASSOC);
        $total_kg_out = floatval($fishcoldstore2['total_kg']) - floatval($outkg);
        $coldstorestmt = $pdo->prepare("INSERT INTO gfcfishcoldstore(date, ite, total_mc, kg, total_kg, rate) VALUES('$date', '$ite', '$total_mc', '$outkg', '$total_kg_out', '$coldstorerate')");
        $coldstorestmt->execute();
      }
      if (!empty($inkg)) {
        $fishcoldstorestmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore ORDER BY id DESC");
        $fishcoldstorestmt->execute();
        $fishcoldstore2 = $fishcoldstorestmt->fetch(PDO::FETCH_ASSOC);
        $total_kg_out = floatval($fishcoldstore2['total_kg']) + floatval($inkg);
        $coldstorestmt = $pdo->prepare("INSERT INTO gfcfishcoldstore(date, ite, total_mc, kg, total_kg, rate) VALUES('$date', '$ite', '$total_mc', '$inkg', '$total_kg_out', '$coldstorerate')");
        $coldstorestmt->execute();
      }
      $nowid = $this->selectdesc('gfcfishcoldstore');
      $nowid = $nowid[0]['id'];
      $balancecheckstmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore WHERE date='$date' AND ite='balance' AND id<'$nowid'");
      $balancecheckstmt->execute();
      $balancecheck = $balancecheckstmt->fetch(PDO::FETCH_ASSOC);

      $fishcoldstorestmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore ORDER BY id DESC");
      $fishcoldstorestmt->execute();
      $fishcoldstore = $fishcoldstorestmt->fetch(PDO::FETCH_ASSOC);
      if (!empty($fishcoldstore)) {
        if ($fishcoldstore['date'] == $date) {

          $exportcheckstmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore WHERE date='$date' AND ite='export' OR ite='takeout'");
          $exportcheckstmt->execute();
          $exportcheck = $exportcheckstmt->fetchall();
          if (empty($exportcheck)) {
            $totalchargesstmt2 = $pdo->prepare("SELECT total_kg FROM gfcfishcoldstore WHERE date='$date' ORDER BY id DESC");
            $totalchargesstmt2->execute();
            $totalchargesdata2 = $totalchargesstmt2->fetch(PDO::FETCH_ASSOC);

            $coldstorecharges = $coldstorerate * $totalchargesdata2['total_kg'];
            if ($monthsameornot === false) {
              $total_charges = $coldstorecharges;
            } else {
              $total_charges = $coldstorecharges + $fishcoldstore['total_charges'];
            }
          } else {

            $maxdatas = $pdo->prepare("SELECT MAX(total_kg) AS maxkg FROM gfcfishcoldstore WHERE date='$date'");
            $maxdatas->execute();
            $maxdata = $maxdatas->fetch(PDO::FETCH_ASSOC);

            $coldstorecharges = floatval($coldstorerate) * floatval($maxdata['maxkg']);
            if ($monthsameornot === false) {
              $total_charges = $coldstorecharges;
            } else {
              $total_charges = $coldstorecharges + $fishcoldstore['total_charges'];
            }
          }
        } else {
          $coldstorecharges = floatval($total_kg) * $coldstorerate;
          if ($monthsameornot === false) {
            $total_charges = $coldstorecharges;
          } else {
            $total_charges = $coldstorecharges + $fishcoldstore['total_charges'];
          }
        }
      } else {
        $coldstorecharges = $total_kg * $coldstorerate;
        $total_charges = $coldstorecharges;
      }

      $lastrowstmt = $pdo->prepare("SELECT id FROM gfcfishcoldstore WHERE date='$date' ORDER BY id DESC");
      $lastrowstmt->execute();
      $lastrowsdata = $lastrowstmt->fetch(PDO::FETCH_ASSOC);
      $id = $lastrowsdata['id'];

      $rowcount = $pdo->prepare("SELECT COUNT(*) FROM gfcfishcoldstore WHERE date='$date'");
      $rowcount->execute();
      $rowcount = $rowcount->fetchColumn();

      if ($ite == 'import') {
        if (!empty($balancecheck)) {
          $balanceid = $balancecheck['id'];
          $balancestmt = $pdo->prepare("UPDATE gfcfishcoldstore SET charges='0', total_charges='0' WHERE id='$balanceid'");
          $balancestmt->execute();
        }
        $importrowstmt = $pdo->prepare("SELECT total_kg FROM gfcfishcoldstore WHERE date='$date' AND ite='import'");
        $importrowstmt->execute();
        $importrowsdatas = $importrowstmt->fetchall();
        $numbers = array();
        foreach ($importrowsdatas as $importrowsdata) {
          $numbers[] = $importrowsdata['total_kg']; // Add total_kg values to the $numbers array
        }
        if (!empty($numbers)) {
          $total_kg = max($numbers);
        } else {
          $total_kg = 0;
        }
        $lasttottalstmt = $pdo->prepare("SELECT total_charges FROM gfcfishcoldstore WHERE total_charges!=0 AND id < $id ORDER BY id DESC");
        $lasttottalstmt->execute();
        $lasttotalcharges = $lasttottalstmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($importrowsdatas)) {
          $coldstorecharges2 = $coldstorerate * $total_kg;
          if ($lasttotalcharges == '') {
            $total_charges = $coldstorecharges2;
          } else {
            if ($monthsameornot === false) {
              $total_charges = $coldstorecharges2;
            } else {
              $total_charges = $lasttotalcharges['total_charges'] + $coldstorecharges2;
            }
          }
        } else {
          $coldstorecharges2 = $coldstorerate * $total_kg;
          if ($lasttotalcharges == '') {
            $total_charges = 0 + $coldstorecharges2;
          } else {
            if ($monthsameornot === false) {
              $total_charges = $coldstorecharges2;
            } else {
              $total_charges = $lasttotalcharges['total_charges'] + $coldstorecharges2;
            }
          }
        }
        $coldstoreupdatestmt = $pdo->prepare("UPDATE gfcfishcoldstore SET charges='$coldstorecharges2', total_charges='$total_charges' WHERE id='$id'");
        $coldstoreupdatestmt->execute();
      } elseif ($rowcount == 1) {
        if ($ite == 'export') {
          $importrowstmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore WHERE id < $id ORDER BY id DESC");
          $importrowstmt->execute();
          $importrowsdata = $importrowstmt->fetch(PDO::FETCH_ASSOC);
          $lasttottalstmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore WHERE total_charges!=0 AND id < $id ORDER BY id DESC");
          $lasttottalstmt->execute();
          $lasttotalcharges = $lasttottalstmt->fetchall();
          $coldstorecharges2 = $coldstorerate * $fishcoldstore['total_kg'];
          if ($monthsameornot === false) {
            $total_charges = $coldstorecharges2;
          } else {
            $total_charges = $lasttotalcharges[0]['total_charges'] + $coldstorecharges2;
          }
          $coldstoreupdatestmt = $pdo->prepare("UPDATE gfcfishcoldstore SET charges='$coldstorecharges2', total_charges='$total_charges' WHERE id='$id'");
          $coldstoreupdatestmt->execute();
        } elseif ($ite == 'takeout') {
          $importrowstmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore WHERE date!='$date' AND id < $id ORDER BY id DESC");
          $importrowstmt->execute();
          $importrowsdata = $importrowstmt->fetchall();
          $lasttottalstmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore WHERE total_charges!=0 AND id < $id AND date!='$date' ORDER BY id DESC");
          $lasttottalstmt->execute();
          $lasttotalcharges = $lasttottalstmt->fetchall();
          if (!empty($fishcoldstore['total_kg'])) {
            $coldstorecharges2 = $coldstorerate * $fishcoldstore['total_kg'];
          } else {
            $coldstorecharges2 = 0;
          }
          if (!empty($lasttotalcharges[0]['total_charges'])) {
            if ($monthsameornot === false) {
              $total_charges = $coldstorecharges2;
            } else {
              $total_charges = $lasttotalcharges[0]['total_charges'] + $coldstorecharges2;
            }
          } else {
            $total_charges = $coldstorecharges2;
          }
          $coldstoreupdatestmt = $pdo->prepare("UPDATE gfcfishcoldstore SET charges='$coldstorecharges2', total_charges='$total_charges' WHERE id='$id'");
          $coldstoreupdatestmt->execute();
        } else {
          $importrowstmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore WHERE date='$date'");
          $importrowstmt->execute();
          $importrowsdata = $importrowstmt->fetch(PDO::FETCH_ASSOC);
          $lasttottalstmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore WHERE total_charges!=0 OR id < $id ORDER BY id DESC");
          $lasttottalstmt->execute();
          $lasttotalcharges = $lasttottalstmt->fetch(PDO::FETCH_ASSOC);
          $importrowsdata['total_kg'];
          $coldstorecharges2 = $coldstorerate * $fishcoldstore['total_kg'];
          if ($monthsameornot === false) {
            $total_charges = $coldstorecharges2;
          } else {
            $total_charges = $lasttotalcharges['total_charges'] + $coldstorecharges2;
          }
          $coldstoreupdatestmt = $pdo->prepare("UPDATE gfcfishcoldstore SET charges='$coldstorecharges2', total_charges='$total_charges' WHERE id='$id'");
          $coldstoreupdatestmt->execute();
        }
      } elseif ($rowcount >= 2 && $ite == 'takeout') {
        $takeoutstmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore WHERE id<$id AND date='$date' AND ite!='$ite' ORDER BY id DESC");
        $takeoutstmt->execute();
        $takeoutcheck = $takeoutstmt->fetchall();
        if (!empty($takeoutcheck)) {
          $fishcoldstorestmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore WHERE id<$id AND date='$date' ORDER BY id DESC");
          $fishcoldstorestmt->execute();
          $fishcoldstore = $fishcoldstorestmt->fetch(PDO::FETCH_ASSOC);
          $coldstorecharges2 = 0;

          $total_charges = 0;
        } else {
          $fishcoldstorestmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore WHERE id<$id AND date='$date' ORDER BY id DESC");
          $fishcoldstorestmt->execute();
          $fishcoldstore = $fishcoldstorestmt->fetch(PDO::FETCH_ASSOC);
          $coldstorecharges2 = $coldstorerate * $fishcoldstore['total_kg'];

          $lasttottalstmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore WHERE total_charges!=0 AND id < $id AND date!='$date' ORDER BY id DESC");
          $lasttottalstmt->execute();
          $lasttotalcharges = $lasttottalstmt->fetchall();
          if ($monthsameornot === false) {
            $total_charges = $coldstorecharges2;
          } else {
            $total_charges = $lasttotalcharges[0]['total_charges'] + $coldstorecharges2;
          }
        }

        $coldstoreupdatestmt = $pdo->prepare("UPDATE gfcfishcoldstore SET charges='$coldstorecharges2', total_charges='$total_charges' WHERE id='$id'");
        $coldstoreupdatestmt->execute();
      } else {
        if ($ite != 'export' && $ite != 'takeout') {
          $coldstoreupdatestmt = $pdo->prepare("UPDATE gfcfishcoldstore SET charges='$coldstorecharges' WHERE id='$id'");
          $coldstoreupdatestmt->execute();
        }
      }

      // Labour Add

      $fishlabourstmt = $pdo->prepare("SELECT * FROM gfcfishlabour ORDER BY id DESC");
      $fishlabourstmt->execute();
      $fishlabour = $fishlabourstmt->fetch(PDO::FETCH_ASSOC);
      if (!empty($fishlabour)) {
        $lastdate = $fishlabour['date'];
      } else {
        $lastdate = '0000-00-00';
      }

      $nowtimestamp = strtotime($date);
      $nowyearmonth = date("Y-m", $nowtimestamp);

      $lasttimestamp = strtotime($lastdate);
      $lastyearmonth = date("Y-m", $lasttimestamp);

      if ($nowyearmonth == $lastyearmonth) {
        $monthsameornot = true;
      } else {
        $monthsameornot = false;
      }
      $fishlabourstmt = $pdo->prepare("SELECT * FROM gfcfishlabour ORDER BY id DESC");
      $fishlabourstmt->execute();
      $fishlabour = $fishlabourstmt->fetch(PDO::FETCH_ASSOC);
      if (!empty($fishlabour)) {
        if ($ite == 'import') {
          $labourcharges = floatval($labourrate) * floatval($kg);
          if ($monthsameornot === false) {
            $ltotal_charges = $labourcharges;
          } else {
            $ltotal_charges = $labourcharges + $fishlabour['total_charges'];
          }
        }
        if ($ite == 'export') {
          $labourcharges = floatval($labourrate) * floatval($kg);
          if ($monthsameornot === false) {
            $ltotal_charges = $labourcharges;
          } else {
            $ltotal_charges = $labourcharges + $fishlabour['total_charges'];
          }
        }
        if ($ite == 'takeout') {
          $labourcharges = floatval($labourrate) * floatval($kg);
          if ($monthsameornot === false) {
            $ltotal_charges = $labourcharges;
          } else {
            $ltotal_charges = $labourcharges + $fishlabour['total_charges'];
          }
        }
      } else {
        $labourcharges = floatval($labourrate) * floatval($kg);
        $ltotal_charges = $labourcharges;
      }

      $coldstorestmt = $pdo->prepare("INSERT INTO gfcfishlabour(date, ite, kg, rate, charges, total_charges) VALUES('$date', '$ite', '$kg', '$labourrate', '$labourcharges', '$ltotal_charges')");
      $coldstorestmt->execute();
    }
  }

  function updatefishcoldstore($newdate, $upite, $upmc, $upkg, $upcoldstorerate, $uplabourrate, $upid)
  {
    global $pdo;

    // fishcoldstore 1 row update
    $oldcoldstoredatastmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore WHERE id < $upid AND date != '$newdate' ORDER BY id DESC");
    $oldcoldstoredatastmt->execute();
    $oldcoldstoredata = $oldcoldstoredatastmt->fetch(PDO::FETCH_ASSOC);

    $oldchargescoldstoredatastmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore WHERE id < $upid AND date != '$newdate' AND total_charges!='0' ORDER BY id DESC");
    $oldchargescoldstoredatastmt->execute();
    $oldchargescoldstoredata = $oldchargescoldstoredatastmt->fetch(PDO::FETCH_ASSOC);

    if (!empty($oldcoldstoredata)) {
      if (str_contains(strtolower($upite), 'import')) {
        $total_mc = $upmc + $oldcoldstoredata['total_mc'];
        $total_kg = $upkg + $oldcoldstoredata['total_kg'];
      }
      if (str_contains(strtolower($upite), 'export')) {
        $total_mc = $oldcoldstoredata['total_mc'] - $upmc;
        $total_kg = $oldcoldstoredata['total_kg'] - $upkg;
      }
      if (str_contains(strtolower($upite), 'takeout')) {
        $total_mc = $oldcoldstoredata['total_mc'] - $upmc;
        $total_kg = $oldcoldstoredata['total_kg'] - $upkg;
      }
      if (str_contains(strtolower($upite), 'balance')) {
        $total_mc = $oldcoldstoredata['total_mc'];
        $total_kg = $oldcoldstoredata['total_kg'];
      }
    } else {
      $total_mc = $upmc;
      $total_kg = $upkg;
    }

    if (!empty($oldchargescoldstoredata)) {
      if (str_contains(strtolower($upite), 'import')) {
        $charges = $upcoldstorerate * $total_kg;
        $total_charges = $charges + $oldchargescoldstoredata['total_charges'];
      }
      if (str_contains(strtolower($upite), 'export')) {
        $charges = $upcoldstorerate * $total_kg;
        $total_charges = $charges + $oldchargescoldstoredata['total_charges'];
      }
      if (str_contains(strtolower($upite), 'takeout')) {
        $charges = $upcoldstorerate * $total_kg;
        $total_charges = $charges + $oldchargescoldstoredata['total_charges'];
      }
      if (str_contains(strtolower($upite), 'balance')) {
        $charges = $upcoldstorerate * $total_kg;
        $total_charges = $charges + $oldchargescoldstoredata['total_charges'];
      }
    } else {
      $charges = $upcoldstorerate * $total_kg;
      $total_charges = $charges;
    }

    // fishcoldstore 1 row update


    // fishlabour 1 row update

    $dataforlabourstmt = $pdo->prepare("SELECT * FROM gfcfishcoldstore WHERE id='$upid'");
    $dataforlabourstmt->execute();
    $dataforlabour = $dataforlabourstmt->fetch(PDO::FETCH_ASSOC);

    $coldstoredate = $dataforlabour['date'];
    $coldstoreite = $dataforlabour['ite'];

    $uplabourstmt = $pdo->prepare("SELECT id FROM gfcfishlabour WHERE date='$coldstoredate' AND ite='$coldstoreite'");
    $uplabourstmt->execute();
    $uplabour = $uplabourstmt->fetch(PDO::FETCH_ASSOC);
    if (!empty($uplabour)) {
      $uplabourid = $uplabour['id'];
    } else {
      $uplabourid = 0;
    }

    $oldlabourdatastmt = $pdo->prepare("SELECT * FROM gfcfishlabour WHERE id < '$uplabourid' AND date != '$newdate' ORDER BY id DESC");
    $oldlabourdatastmt->execute();
    $oldlabourdata = $oldlabourdatastmt->fetch(PDO::FETCH_ASSOC);

    if (!empty($oldlabourdata)) {
      $labourcharges = floatval($uplabourrate) * floatval($upkg);
      $labourtotal_charges = $labourcharges + $oldlabourdata['total_charges'];
    } else {
      $labourcharges = floatval($uplabourrate) * floatval($total_kg);
      $labourtotal_charges = $labourcharges;
    }

    // fishlabour 1 row update

    // Labour
    $upfishcoldstorestmt = $pdo->prepare("UPDATE gfcfishlabour SET date='$newdate', ite='$upite', kg='$upkg', rate='$uplabourrate', charges='$labourcharges', total_charges='$labourtotal_charges' WHERE date = '$coldstoredate' AND ite = '$coldstoreite'");
    $upfishcoldstorestmt->execute();

    // Coldstore
    if ($upite == 'balance') {
      $upfishcoldstorestmt = $pdo->prepare("UPDATE gfcfishcoldstore SET date='$newdate', ite='$upite', mc='0', total_mc='$total_mc', kg='0', total_kg='$total_kg', rate='$upcoldstorerate', charges='$charges', total_charges='$total_charges' WHERE id = '$upid'");
      $upfishcoldstorestmt->execute();
    } else {
      $upfishcoldstorestmt = $pdo->prepare("UPDATE gfcfishcoldstore SET date='$newdate', ite='$upite', mc='$upmc', total_mc='$total_mc', kg='$upkg', total_kg='$total_kg', rate='$upcoldstorerate', charges='$charges', total_charges='$total_charges' WHERE id = '$upid'");
      $upfishcoldstorestmt->execute();
    }
  }

  function adddryfishcharges($date, $ite, $kg, $drycoldstorerate, $labourrate, $outkg)
  {
    global $pdo;

    if ($ite == 'balance') {
      $fishcoldstorestmt = $pdo->prepare("SELECT * FROM gfcdryfishcoldstore ORDER BY id DESC");
      $fishcoldstorestmt->execute();
      $fishcoldstore = $fishcoldstorestmt->fetch(PDO::FETCH_ASSOC);

      if (!empty($fishcoldstore)) {
        $total_kg = $fishcoldstore['total_kg'];
        $charges = $drycoldstorerate * $total_kg;
        $total_charges = $charges + $fishcoldstore['total_charges'];

        $coldstorestmt = $pdo->prepare("INSERT INTO gfcdryfishcoldstore(date, ite, total_kg, rate, charges, total_charges) VALUES('$date', '$ite', '$total_kg', '$drycoldstorerate', '$charges', '$total_charges')");
        $coldstorestmt->execute();
      } else {
        $total_kg = 0;
        $charges = 0;
        $total_charges = 0;

        $coldstorestmt = $pdo->prepare("INSERT INTO gfcdryfishcoldstore(date, ite, total_kg, rate, charges, total_charges) VALUES('$date', '$ite', '$total_kg', '$drycoldstorerate', '$charges', '$total_charges')");
        $coldstorestmt->execute();
      }
    } else {
      $dryfishcoldstorestmt = $pdo->prepare("SELECT * FROM gfcdryfishcoldstore ORDER BY id DESC");
      $dryfishcoldstorestmt->execute();
      $dryfishcoldstore = $dryfishcoldstorestmt->fetch(PDO::FETCH_ASSOC);
      if (!empty($dryfishcoldstore)) {
        if ($ite == 'import') {
          $total_kg = floatval($dryfishcoldstore['total_kg']) + floatval($kg);
        }
        if ($ite == 'export') {
          $total_kg = floatval($dryfishcoldstore['total_kg']) - floatval($kg);
        }
        if ($ite == 'takeout') {
          $total_kg = floatval($dryfishcoldstore['total_kg']) - floatval($kg);
        }
      } else {
        $total_kg = $kg;
      }

      $coldstorestmt = $pdo->prepare("INSERT INTO gfcdryfishcoldstore(date, ite, kg, total_kg, rate) VALUES('$date', '$ite', '$kg', '$total_kg', '$drycoldstorerate')");
      $coldstorestmt->execute();
      if (!empty($outkg)) {
        $dryfishcoldstorestmt = $pdo->prepare("SELECT * FROM gfcdryfishcoldstore ORDER BY id DESC");
        $dryfishcoldstorestmt->execute();
        $dryfishcoldstore2 = $dryfishcoldstorestmt->fetch(PDO::FETCH_ASSOC);
        $total_kg_out = floatval($dryfishcoldstore2['total_kg']) - floatval($outkg);
        $coldstorestmt = $pdo->prepare("INSERT INTO gfcdryfishcoldstore(date, ite, kg, total_kg, rate) VALUES('$date', '$ite', '$outkg', '$total_kg_out', '$drycoldstorerate')");
        $coldstorestmt->execute();
      }

      if (!empty($dryfishcoldstore)) {
        if ($dryfishcoldstore['date'] == $date) {

          $exportcheckstmt = $pdo->prepare("SELECT * FROM gfcdryfishcoldstore WHERE date='$date' AND ite='export' OR ite='takeout'");
          $exportcheckstmt->execute();
          $exportcheck = $exportcheckstmt->fetchall();
          if (empty($exportcheck)) {
            $totalchargesstmt2 = $pdo->prepare("SELECT total_kg FROM gfcdryfishcoldstore WHERE date='$date' ORDER BY id DESC");
            $totalchargesstmt2->execute();
            $totalchargesdata2 = $totalchargesstmt2->fetch(PDO::FETCH_ASSOC);

            $coldstorecharges = $drycoldstorerate * $totalchargesdata2['total_kg'];
            $total_charges = $coldstorecharges + $dryfishcoldstore['total_charges'];
          } else {

            $maxdatas = $pdo->prepare("SELECT MAX(total_kg) AS maxkg FROM gfcdryfishcoldstore WHERE date='$date'");
            $maxdatas->execute();
            $maxdata = $maxdatas->fetch(PDO::FETCH_ASSOC);

            $coldstorecharges = floatval($drycoldstorerate) * floatval($maxdata['maxkg']);
            $total_charges = $coldstorecharges + $dryfishcoldstore['total_charges'];
          }
        } else {
          $coldstorecharges = floatval($total_kg) * $drycoldstorerate;
          $total_charges = $dryfishcoldstore['total_charges'] + $coldstorecharges;
        }
      } else {
        $coldstorecharges = $total_kg * $drycoldstorerate;
        $total_charges = $coldstorecharges;
      }

      $lastrowstmt = $pdo->prepare("SELECT id FROM gfcdryfishcoldstore WHERE date='$date' ORDER BY id DESC");
      $lastrowstmt->execute();
      $lastrowsdata = $lastrowstmt->fetch(PDO::FETCH_ASSOC);
      $id = $lastrowsdata['id'];

      $rowcount = $pdo->prepare("SELECT COUNT(*) FROM gfcdryfishcoldstore WHERE date='$date'");
      $rowcount->execute();
      $rowcount = $rowcount->fetchColumn();
      if ($ite == 'import') {
        $importrowstmt = $pdo->prepare("SELECT * FROM gfcdryfishcoldstore WHERE date='$date' AND ite='import'");
        $importrowstmt->execute();
        $importrowsdata = $importrowstmt->fetch(PDO::FETCH_ASSOC);
        $lasttottalstmt = $pdo->prepare("SELECT total_charges FROM gfcdryfishcoldstore WHERE total_charges!=0 AND id < $id ORDER BY id DESC");
        $lasttottalstmt->execute();
        $lasttotalcharges = $lasttottalstmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($importrowsdata)) {
          $coldstorecharges2 = $drycoldstorerate * $importrowsdata['total_kg'];
          if ($lasttotalcharges == '') {
            $total_charges = 0 + $coldstorecharges2;
          } else {
            $total_charges = $lasttotalcharges['total_charges'] + $coldstorecharges2;
          }
        } else {
          $coldstorecharges2 = $drycoldstorerate * $importrowsdata['total_kg'];
          if ($lasttotalcharges == '') {
            $total_charges = 0 + $coldstorecharges2;
          } else {
            $total_charges = $lasttotalcharges['total_charges'] + $coldstorecharges2;
          }
        }
        $coldstoreupdatestmt = $pdo->prepare("UPDATE gfcdryfishcoldstore SET charges='$coldstorecharges2', total_charges='$total_charges' WHERE id='$id'");
        $coldstoreupdatestmt->execute();
      } elseif ($rowcount == 1) {
        if ($ite == 'export') {
          $importrowstmt = $pdo->prepare("SELECT * FROM gfcdryfishcoldstore WHERE id < $id ORDER BY id DESC");
          $importrowstmt->execute();
          $importrowsdata = $importrowstmt->fetch(PDO::FETCH_ASSOC);
          $lasttottalstmt = $pdo->prepare("SELECT * FROM gfcdryfishcoldstore WHERE total_charges!=0 AND id < $id ORDER BY id DESC");
          $lasttottalstmt->execute();
          $lasttotalcharges = $lasttottalstmt->fetchall();
          $coldstorecharges2 = $drycoldstorerate * $importrowsdata['total_kg'];
          $total_charges = $lasttotalcharges[0]['total_charges'] + $coldstorecharges2;
          $coldstoreupdatestmt = $pdo->prepare("UPDATE gfcdryfishcoldstore SET charges='$coldstorecharges2', total_charges='$total_charges' WHERE id='$id'");
          $coldstoreupdatestmt->execute();
        } elseif ($ite == 'takeout') {
          $importrowstmt = $pdo->prepare("SELECT * FROM gfcdryfishcoldstore WHERE date!='$date' AND id < $id ORDER BY id DESC");
          $importrowstmt->execute();
          $importrowsdata = $importrowstmt->fetchall();
          $lasttottalstmt = $pdo->prepare("SELECT * FROM gfcdryfishcoldstore WHERE total_charges!=0 AND id < $id AND date!='$date' ORDER BY id DESC");
          $lasttottalstmt->execute();
          $lasttotalcharges = $lasttottalstmt->fetchall();
          if (!empty($importrowsdata[0]['total_kg'])) {
            $coldstorecharges2 = $drycoldstorerate * $importrowsdata[0]['total_kg'];
          } else {
            $coldstorecharges2 = $drycoldstorerate;
          }
          if (!empty($lasttotalcharges[0]['total_charges'])) {
            $total_charges = $lasttotalcharges[0]['total_charges'] + $coldstorecharges2;
          } else {
            $total_charges = $coldstorecharges2;
          }
          $coldstoreupdatestmt = $pdo->prepare("UPDATE gfcdryfishcoldstore SET charges='$coldstorecharges2', total_charges='$total_charges' WHERE id='$id'");
          $coldstoreupdatestmt->execute();
        } else {
          $importrowstmt = $pdo->prepare("SELECT * FROM gfcdryfishcoldstore WHERE date='$date'");
          $importrowstmt->execute();
          $importrowsdata = $importrowstmt->fetch(PDO::FETCH_ASSOC);
          $lasttottalstmt = $pdo->prepare("SELECT * FROM gfcdryfishcoldstore WHERE total_charges!=0 OR id < $id ORDER BY id DESC");
          $lasttottalstmt->execute();
          $lasttotalcharges = $lasttottalstmt->fetch(PDO::FETCH_ASSOC);
          $importrowsdata['total_kg'];
          $coldstorecharges2 = $drycoldstorerate * $importrowsdata['total_kg'];
          $total_charges = $lasttotalcharges['total_charges'] + $coldstorecharges2;
          $coldstoreupdatestmt = $pdo->prepare("UPDATE gfcdryfishcoldstore SET charges='$coldstorecharges2', total_charges='$total_charges' WHERE id='$id'");
          $coldstoreupdatestmt->execute();
        }
      } elseif ($rowcount == 2 && $ite == 'takeout') {
        $importrowstmt = $pdo->prepare("SELECT * FROM gfcdryfishcoldstore WHERE date!='$date' AND id < $id ORDER BY id DESC");
        $importrowstmt->execute();
        $importrowsdata = $importrowstmt->fetchall();
        $lasttottalstmt = $pdo->prepare("SELECT * FROM gfcdryfishcoldstore WHERE total_charges!=0 AND id < $id AND date!='$date' ORDER BY id DESC");
        $lasttottalstmt->execute();
        $lasttotalcharges = $lasttottalstmt->fetchall();
        if (!empty($importrowsdata[0]['total_kg'])) {
          $coldstorecharges2 = $drycoldstorerate * $importrowsdata[0]['total_kg'];
        } else {
          $coldstorecharges2 = $drycoldstorerate;
        }
        if (!empty($lasttotalcharges[0]['total_charges'])) {
          $total_charges = $lasttotalcharges[0]['total_charges'] + $coldstorecharges2;
        } else {
          $total_charges = $coldstorecharges2;
        }
        $coldstoreupdatestmt = $pdo->prepare("UPDATE gfcdryfishcoldstore SET charges='$coldstorecharges2', total_charges='$total_charges' WHERE id='$id'");
        $coldstoreupdatestmt->execute();
      } else {
        if ($ite != 'export' && $ite != 'takeout') {
          $coldstoreupdatestmt = $pdo->prepare("UPDATE gfcdryfishcoldstore SET charges='$coldstorecharges' WHERE id='$id'");
          $coldstoreupdatestmt->execute();
        }
      }



      // Labour Add
      $dryfishlabourstmt = $pdo->prepare("SELECT * FROM gfcdryfishlabour ORDER BY id DESC");
      $dryfishlabourstmt->execute();
      $dryfishlabour = $dryfishlabourstmt->fetch(PDO::FETCH_ASSOC);
      if (!empty($dryfishlabour)) {
        if ($ite == 'import') {
          $labourcharges = $labourrate * $kg;
          $ltotal_charges = $labourcharges + $dryfishlabour['total_charges'];
        }
        if ($ite == 'export') {
          $labourcharges = $labourrate * $kg;
          $ltotal_charges = $labourcharges + $dryfishlabour['total_charges'];
        }
        if ($ite == 'takeout') {
          $labourcharges = $labourrate * $kg;
          $ltotal_charges = $labourcharges + $dryfishlabour['total_charges'];
        }
      } else {
        $labourcharges = $labourrate * $kg;
        $ltotal_charges = $labourcharges;
      }

      $coldstorestmt = $pdo->prepare("INSERT INTO gfcdryfishlabour(date, ite, kg, rate, charges, total_charges) VALUES('$date', '$ite', '$kg', '$labourrate', '$labourcharges', '$ltotal_charges')");
      $coldstorestmt->execute();
    }
  }

  function updatedryfishcoldstore($newdate, $upite, $upkg, $upcoldstorerate, $uplabourrate, $upid)
  {
    global $pdo;

    // dryfishcoldstore 1 row update
    $oldcoldstoredatastmt = $pdo->prepare("SELECT * FROM gfcdryfishcoldstore WHERE id < $upid AND date != '$newdate' ORDER BY id DESC");
    $oldcoldstoredatastmt->execute();
    $oldcoldstoredata = $oldcoldstoredatastmt->fetch(PDO::FETCH_ASSOC);

    $oldchargescoldstoredatastmt = $pdo->prepare("SELECT * FROM gfcdryfishcoldstore WHERE id < $upid AND date != '$newdate' AND total_charges!='0' ORDER BY id DESC");
    $oldchargescoldstoredatastmt->execute();
    $oldchargescoldstoredata = $oldchargescoldstoredatastmt->fetch(PDO::FETCH_ASSOC);

    if (!empty($oldcoldstoredata)) {
      if (str_contains(strtolower($upite), 'import')) {
        $total_kg = $upkg + $oldcoldstoredata['total_kg'];
      }
      if (str_contains(strtolower($upite), 'export')) {
        $total_kg = $oldcoldstoredata['total_kg'] - $upkg;
      }
      if (str_contains(strtolower($upite), 'takeout')) {
        $total_kg = $oldcoldstoredata['total_kg'] - $upkg;
      }
      if (str_contains(strtolower($upite), 'balance')) {
        $total_kg = $oldcoldstoredata['total_kg'];
      }
    } else {
      $total_kg = $upkg;
    }

    if (!empty($oldchargescoldstoredata)) {
      if (str_contains(strtolower($upite), 'import')) {
        $charges = $upcoldstorerate * $total_kg;
        $total_charges = $charges + $oldchargescoldstoredata['total_charges'];
      }
      if (str_contains(strtolower($upite), 'export')) {
        $charges = $upcoldstorerate * $total_kg;
        $total_charges = $charges + $oldchargescoldstoredata['total_charges'];
      }
      if (str_contains(strtolower($upite), 'takeout')) {
        $charges = $upcoldstorerate * $total_kg;
        $total_charges = $charges + $oldchargescoldstoredata['total_charges'];
      }
      if (str_contains(strtolower($upite), 'balance')) {
        $charges = $upcoldstorerate * $total_kg;
        $total_charges = $charges + $oldchargescoldstoredata['total_charges'];
      }
    } else {
      $charges = $upcoldstorerate * $total_kg;
      $total_charges = $charges;
    }

    // dryfishcoldstore 1 row update


    // dryfishlabour 1 row update

    $dataforlabourstmt = $pdo->prepare("SELECT * FROM gfcdryfishcoldstore WHERE id='$upid'");
    $dataforlabourstmt->execute();
    $dataforlabour = $dataforlabourstmt->fetch(PDO::FETCH_ASSOC);

    $coldstoredate = $dataforlabour['date'];
    $coldstoreite = $dataforlabour['ite'];

    $uplabourstmt = $pdo->prepare("SELECT id FROM gfcdryfishlabour WHERE date='$coldstoredate' AND ite='$coldstoreite'");
    $uplabourstmt->execute();
    $uplabour = $uplabourstmt->fetch(PDO::FETCH_ASSOC);
    if (!empty($uplabour)) {
      $uplabourid = $uplabour['id'];
    } else {
      $uplabourid = 0;
    }

    $oldlabourdatastmt = $pdo->prepare("SELECT * FROM gfcdryfishlabour WHERE id < '$uplabourid' AND date != '$newdate' ORDER BY id DESC");
    $oldlabourdatastmt->execute();
    $oldlabourdata = $oldlabourdatastmt->fetch(PDO::FETCH_ASSOC);

    if (!empty($oldlabourdata)) {
      $labourcharges = floatval($uplabourrate) * floatval($upkg);
      $labourtotal_charges = $labourcharges + $oldlabourdata['total_charges'];
    } else {
      $labourcharges = floatval($uplabourrate) * floatval($total_kg);
      $labourtotal_charges = $labourcharges;
    }

    // dryfishlabour 1 row update

    // Labour
    $updryfishcoldstorestmt = $pdo->prepare("UPDATE gfcdryfishlabour SET date='$newdate', ite='$upite', kg='$upkg', rate='$uplabourrate', charges='$labourcharges', total_charges='$labourtotal_charges' WHERE date = '$coldstoredate' AND ite = '$coldstoreite'");
    $updryfishcoldstorestmt->execute();

    // Coldstore
    if ($upite == 'balance') {
      $updryfishcoldstorestmt = $pdo->prepare("UPDATE gfcdryfishcoldstore SET date='$newdate', ite='$upite', kg='0', total_kg='$total_kg', rate='$upcoldstorerate', charges='$charges', total_charges='$total_charges' WHERE id = '$upid'");
      $updryfishcoldstorestmt->execute();
    } else {
      $updryfishcoldstorestmt = $pdo->prepare("UPDATE gfcdryfishcoldstore SET date='$newdate', ite='$upite', kg='$upkg', total_kg='$total_kg', rate='$upcoldstorerate', charges='$charges', total_charges='$total_charges' WHERE id = '$upid'");
      $updryfishcoldstorestmt->execute();
    }
  }

  function addrepackingout($date, $outkg, $rprate)
  {
    global $pdo;

    $repackingoutstmt = $pdo->prepare("SELECT * FROM repackingout ORDER BY id DESC");
    $repackingoutstmt->execute();
    $repackingoutdata = $repackingoutstmt->fetch(PDO::FETCH_ASSOC);
    if (!empty($repackingoutdata)) {
      $charges = $rprate * $outkg;
      $total_charges = $charges + $repackingoutdata['total_charges'];
    } else {
      $charges = $rprate * $outkg;
      $total_charges = $charges;
    }

    $addrepackingstmt = $pdo->prepare("INSERT INTO repackingout(date, outkg, rate, charges, total_charges) VALUES('$date', '$outkg', '$rprate', '$charges', '$total_charges')");
    $addrepackingstmt->execute();
  }

  function addtotal($date, $plugoncharges)
  {
    global $pdo;

    if (empty($plugoncharges)) {
      $plugoncharges = 0;
    }

    $totalbalancestmt = $pdo->prepare("SELECT * FROM gfctotal ORDER BY id DESC");
    $totalbalancestmt->execute();
    $totalbalancedata = $totalbalancestmt->fetch(PDO::FETCH_ASSOC);

    $fishcoldstorestmt = $pdo->prepare("SELECT total_charges FROM gfcfishcoldstore WHERE date='$date' AND total_charges!='0'");
    $fishcoldstorestmt->execute();
    $fishcoldstoredata = $fishcoldstorestmt->fetch(PDO::FETCH_ASSOC);

    $fishlabourstmt = $pdo->prepare("SELECT total_charges FROM gfcfishlabour WHERE date='$date' AND total_charges!='0'");
    $fishlabourstmt->execute();
    $fishlabourdata = $fishlabourstmt->fetch(PDO::FETCH_ASSOC);

    $repackingstmt = $pdo->prepare("SELECT total_charges FROM repackingout WHERE date='$date' AND total_charges!='0'");
    $repackingstmt->execute();
    $repackingdata = $repackingstmt->fetch(PDO::FETCH_ASSOC);

    $dryfishcoldstorestmt = $pdo->prepare("SELECT total_charges FROM gfcdryfishcoldstore WHERE date='$date'");
    $dryfishcoldstorestmt->execute();
    $dryfishcoldstoredata = $dryfishcoldstorestmt->fetch(PDO::FETCH_ASSOC);

    $dryfishlabourstmt = $pdo->prepare("SELECT total_charges FROM gfcdryfishlabour WHERE date='$date'");
    $dryfishlabourstmt->execute();
    $dryfishlabourdata = $dryfishlabourstmt->fetch(PDO::FETCH_ASSOC);

    $laststmt = $pdo->prepare("SELECT * FROM gfctotal ORDER BY id DESC");
    $laststmt->execute();
    $lastdata = $laststmt->fetch(PDO::FETCH_ASSOC);

    if (!empty($lastdata)) {
      if (!empty($fishcoldstoredata['total_charges'])) {
        // $totalfishcoldstorecharges = $lastdata['totalfishcoldstorecharges'] - $fishcoldstoredata['total_charges'];
        $totalfishcoldstorecharges = $fishcoldstoredata['total_charges'];
      } else {
        $totalfishcoldstorecharges = 0;
      }
      if (!empty($fishlabourdata['total_charges'])) {
        // $totalfishlabourcharges = $lastdata['totalfishlabourcharges'] - $fishlabourdata['total_charges'];
        $totalfishlabourcharges = $fishlabourdata['total_charges'];
      } else {
        $totalfishlabourcharges = 0;
      }
      if (!empty($dryfishcoldstoredata['total_charges'])) {
        // $totaldryfishcoldstorecharges = $dryfishcoldstoredata['total_charges'] - $lastdata['totaldryfishcoldstorecharges'];
        $totaldryfishcoldstorecharges = $dryfishcoldstoredata['total_charges'];
      } else {
        $totaldryfishcoldstorecharges = 0;
      }
      if (!empty($dryfishlabourdata['total_charges'])) {
        // $totaldryfishlabourcharges = $dryfishlabourdata['total_charges'] - $lastdata['totaldryfishlabourcharges'];
        $totaldryfishlabourcharges = $dryfishlabourdata['total_charges'];
      } else {
        $totaldryfishlabourcharges = 0;
      }
      if (!empty($repackingdata['total_charges'])) {
        $totalrepackingcharges = $repackingdata['total_charges'];
      } else {
        $totalrepackingcharges = 0;
      }
    } else {
      if (!empty($fishcoldstoredata['total_charges'])) {
        $totalfishcoldstorecharges = $fishcoldstoredata['total_charges'];
      } else {
        $totalfishcoldstorecharges = 0;
      }
      if (!empty($fishlabourdata['total_charges'])) {
        $totalfishlabourcharges = $fishlabourdata['total_charges'];
      } else {
        $totalfishlabourcharges = 0;
      }
      if (!empty($dryfishcoldstoredata['total_charges'])) {
        $totaldryfishcoldstorecharges = $dryfishcoldstoredata['total_charges'];
      } else {
        $totaldryfishcoldstorecharges = 0;
      }
      if (!empty($dryfishlabourdata['total_charges'])) {
        $totaldryfishlabourcharges = $dryfishlabourdata['total_charges'];
      } else {
        $totaldryfishlabourcharges = 0;
      }
      if (!empty($repackingdata['total_charges'])) {
        $totalrepackingcharges = $repackingdata['total_charges'];
      } else {
        $totalrepackingcharges = 0;
      }
    }


    if (!empty($totalbalancedata)) {
      $total_charges = floatval($totalfishcoldstorecharges) + floatval($totalfishlabourcharges) + floatval($totaldryfishcoldstorecharges) + floatval($totaldryfishlabourcharges) + floatval($totalrepackingcharges) + floatval($plugoncharges);

      $balance = $totalbalancedata['balance_amount'] + $total_charges;
      $addtotalstmt = $pdo->prepare("INSERT INTO gfctotal(date, totalfishcoldstorecharges, totalfishlabourcharges, totalrepackingcharges, totaldryfishcoldstorecharges, totaldryfishlabourcharges, plugoncharges, total_charges, balance_amount) VALUES('$date', '$totalfishcoldstorecharges', '$totalfishlabourcharges', '$totalrepackingcharges', '$totaldryfishcoldstorecharges', '$totaldryfishlabourcharges', '$plugoncharges', '$total_charges', '$balance')");
      $addtotalstmt->execute();
    } else {
      $total_charges = $totalfishcoldstorecharges + $totalfishlabourcharges + $totaldryfishcoldstorecharges + $totaldryfishlabourcharges + $totalrepackingcharges + floatval($plugoncharges);
      $balance = $total_charges;
      $addtotalstmt = $pdo->prepare("INSERT INTO gfctotal(date, totalfishcoldstorecharges, totalfishlabourcharges, totalrepackingcharges, totaldryfishcoldstorecharges, totaldryfishlabourcharges, plugoncharges, total_charges, balance_amount) VALUES('$date', '$totalfishcoldstorecharges', '$totalfishlabourcharges', '$totalrepackingcharges', '$totaldryfishcoldstorecharges', '$totaldryfishlabourcharges', '$plugoncharges', '$total_charges', '$balance')");
      $addtotalstmt->execute();
    }
  }

  function addpayment($payment_date, $payment_amount, $id)
  {
    global $pdo;

    $totalchargesstmt = $pdo->prepare("SELECT * FROM gfctotal ORDER BY id DESC");
    $totalchargesstmt->execute();
    $totalchargesdata = $totalchargesstmt->fetch(PDO::FETCH_ASSOC);

    $balance = floatval($totalchargesdata['balance_amount']) - floatval($payment_amount);

    $addpaymentstmt = $pdo->prepare("INSERT INTO gfctotal(payment_date, payment_amount, balance_amount) VALUES('$payment_date', '$payment_amount', '$balance')");
    $addpaymentstmt->execute();
  }

  function updatepackingmaterial($upid, $plastic, $jcv, $inner_box, $sticker, $mc_plastic, $carton_box, $tape, $penon, $p_sticker, $plastic_rope, $micellion, $processing, $plastic_size, $pcsperlb, $pcspermc, $tdydollorprice)
  {
    global $pdo;

    $plastic = floatval($plastic) * floatval($pcspermc) / floatval($pcsperlb) / 20;
    $jcv = floatval($jcv) * $tdydollorprice / 300 / 20;
    $sticker = floatval($sticker) * floatval($pcspermc) / 20;
    $mc_plastic = floatval($mc_plastic) / 5 / 20;
    $carton_box = floatval($carton_box) / 20;
    $tape = floatval($tape) / 70 / 20;
    $penon = floatval($penon) / 20;
    $p_sticker = floatval($p_sticker) / 20;
    $plastic_rope = floatval($plastic_rope) / 70 / 20;
    $total = floatval($plastic) + floatval($jcv) + floatval($inner_box) + floatval($sticker) + floatval($mc_plastic) + floatval($carton_box) + floatval($tape) + floatval($penon) + floatval($p_sticker) + floatval($plastic_rope) + floatval($micellion) + floatval($processing);
    $perkgcost = $total / $tdydollorprice;
    $perkgcost = round($perkgcost, 2);
    // $addpackingmaterialstmt = $pdo->prepare("INSERT INTO packingmaterial(commondity_id, fish_size, plastic, jcv, inner_box, sticker, mc_plastic, carton_box, tape, penon, p_sticker, plastic_rope, micellion, processing, total, perkgcost, plastic_size, pcsperlb, pcspermc)
    // VALUES('$commondity_id', '$fish_size', '$plastic', '$jcv', '$inner_box', '$sticker', '$mc_plastic', '$carton_box', '$tape', '$penon', '$p_sticker', '$plastic_rope', '$micellion', '$processing', '$total', '$perkgcost', '$plastic_size', '$pcsperlb', '$pcspermc')");
    // $addpackingmaterialstmt->execute();
    echo $upid;
    $addpackingmaterialstmt = $pdo->prepare("UPDATE packingmaterial SET plastic='$plastic', jcv='$jcv', inner_box='$inner_box', sticker='$sticker', mc_plastic='$mc_plastic', carton_box='$carton_box', tape='$tape', penon='$penon', p_sticker='$p_sticker', plastic_rope='$plastic_rope', micellion='$micellion', processing='$processing', total='$total', perkgcost='$perkgcost', plastic_size='$plastic_size', pcsperlb='$pcsperlb', pcspermc='$pcspermc' WHERE id='$upid'");
    $addpackingmaterialstmt->execute();
  }

  function addrepacking($date, $in_mc, $in_kg, $out_mc, $out_kg, $rate)
  {
    global $pdo;

    $repackingstmt = $pdo->prepare("SELECT * FROM repacking ORDER BY id DESC");
    $repackingstmt->execute();
    $repackingdata = $repackingstmt->fetch(PDO::FETCH_ASSOC);
    if (!empty($repackingdata)) {
      $diff_mc = $in_mc - $out_mc;
      $diff_kg = $in_kg - $out_kg;
      $charges = $rate * $out_kg;
      $total_charges = $charges + $repackingdata['total_charges'];

      $repackingaddstmt = $pdo->prepare("INSERT INTO repacking(date,in_mc, in_kg, out_mc, out_kg, diff_mc, diff_kg, rate, charges, total_charges) VALUES('$date','$in_mc', '$in_kg', '$out_mc', '$out_kg', '$diff_mc', '$diff_kg', '$rate', '$charges', '$total_charges')");
      $repackingaddstmt->execute();
    } else {
      $diff_mc = $in_mc - $out_mc;
      $diff_kg = $in_kg - $out_kg;
      $charges = $rate * $out_kg;
      $total_charges = $charges;

      $repackingaddstmt = $pdo->prepare("INSERT INTO repacking(date,in_mc, in_kg, out_mc, out_kg, diff_mc, diff_kg, rate, charges, total_charges) VALUES('$date','$in_mc', '$in_kg', '$out_mc', '$out_kg', '$diff_mc', '$diff_kg', '$rate', '$charges', '$total_charges')");
      $repackingaddstmt->execute();
    }
  }

  function paytotalcharges($payment_date, $payment_amount)
  {
    global $pdo;

    $balancestmt = $pdo->prepare("SELECT balance_amount FROM total_charges ORDER BY id DESC");
    $balancestmt->execute();
    $balancedata = $balancestmt->fetch(PDO::FETCH_ASSOC);
    $balance = $balancedata['balance_amount'] - $payment_amount;

    $paytotalchargesstmt = $pdo->prepare("INSERT INTO total_charges(payment_date, payment_amount, balance_amount) VALUES('$payment_date', '$payment_amount', '$balance')");
    $paytotalchargesstmt->execute();
  }

  function addnewstock($indate, $commondity_id, $mc, $kg)
  {
    global $pdo;

    $stockstmt = $pdo->prepare("SELECT * FROM hhkstock WHERE commondity_id='$commondity_id' ORDER BY id DESC");
    $stockstmt->execute();
    $stockdata = $stockstmt->fetch(PDO::FETCH_ASSOC);

    if (!empty($stockdata)) {
      $total_mc = floatval($mc) + $stockdata['total_mc'];
      $total_kg = floatval($kg) + $stockdata['total_kg'];

      $balance = $total_kg + $stockdata['balance'];
    } else {
      $total_mc = $mc;
      $total_kg = $kg;

      $balance = $kg;
    }

    $newstockstmt = $pdo->prepare("INSERT INTO hhkstock(indate, commondity_id, mc, total_mc, kg, total_kg, balance_kg, balance_mc, balance) VALUES('$indate', '$commondity_id', '$mc', '$total_mc', '$kg', '$total_kg', '$kg', '$mc', '$balance')");
    $newstockstmt->execute();
  }

  // HHK QUERIES

  // MSL QUERIES
  function addmslnewstock($indate, $item_id, $mc, $kg)
  {
    global $pdo;

    $stockstmt = $pdo->prepare("SELECT * FROM mslstock WHERE item_id='$item_id' ORDER BY id DESC");
    $stockstmt->execute();
    $stockdata = $stockstmt->fetch(PDO::FETCH_ASSOC);

    if (!empty($stockdata)) {
      $total_mc = $mc + $stockdata['total_mc'];
      $total_kg = $kg + $stockdata['total_kg'];

      $balance = $total_kg + $stockdata['balance'];
    } else {
      $total_mc = $mc;
      $total_kg = $kg;

      $balance = $kg;
    }

    $newstockstmt = $pdo->prepare("INSERT INTO mslstock(indate, item_id, mc, total_mc, kg, total_kg, balance) VALUES('$indate', '$item_id', '$mc', '$total_mc', '$kg', '$total_kg', '$balance')");
    $newstockstmt->execute();
  }

  function addmslcoldstore($indate, $outdate, $item_id, $mc, $kg, $coldstorerate, $freezingrate, $exportrate, $loose_kg, $loose_mc)
  {
    global $pdo;

    $datastmt = $pdo->prepare("SELECT * FROM mslcoldstore ORDER BY id DESC");
    $datastmt->execute();
    $data = $datastmt->fetch(PDO::FETCH_ASSOC);
    if (!empty($data)) {
      $emptystmt = $pdo->prepare("SELECT * FROM mslcoldstore WHERE item_id='$item_id' ORDER BY id DESC");
      $emptystmt->execute();
      $emptydata = $emptystmt->fetch(PDO::FETCH_ASSOC);
      if (!empty($emptydata)) {
        $stmt = $pdo->prepare("SELECT * FROM mslcoldstore WHERE item_id='$item_id' ORDER BY id DESC");
        $stmt->execute();
        $data = $stmt->fetch(PDO::FETCH_ASSOC);

        $dtotal_mc = floatval($data['total_mc']) + floatval($mc);
        $dtotal_kg = floatval($data['total_kg']) + floatval($kg);
        $date1 = strtotime($indate);
        $date2 = strtotime($outdate);
        $diff = $date2 - $date1;
        $day = floor($diff / (60 * 60 * 24)) + 1;
        $charges = $day * floatval($coldstorerate) * floatval($kg);
        $total_charges = floatval($data['total_charges']) + floatval($charges);
      } else {
        $dtotal_mc = floatval($mc);
        $dtotal_kg = floatval($kg);
        $date1 = strtotime($indate);
        $date2 = strtotime($outdate);
        $diff = $date2 - $date1;
        $day = floor($diff / (60 * 60 * 24));
        $charges = $day * floatval($coldstorerate) * floatval($kg);
        $total_charges = floatval($charges);
      }
    } else {
      $dtotal_mc = floatval($mc);
      $dtotal_kg = floatval($kg);
      $date1 = strtotime($indate);
      $date2 = strtotime($outdate);
      $diff = $date2 - $date1;
      $day = floor($diff / (60 * 60 * 24));
      $charges = $day * floatval($coldstorerate) * floatval($kg);
      $total_charges = floatval($charges);
    }
    // Freezing ADD
    $labourstmt = $pdo->prepare("SELECT * FROM mslfreezing ORDER BY id DESC");
    $labourstmt->execute();
    $labour = $labourstmt->fetch(PDO::FETCH_ASSOC);
    if (!empty($labour)) {
      $emptystmt = $pdo->prepare("SELECT * FROM mslfreezing WHERE item_id='$item_id' ORDER BY id DESC");
      $emptystmt->execute();
      $emptydata = $emptystmt->fetch(PDO::FETCH_ASSOC);
      if (!empty($emptydata)) {
        $stmt = $pdo->prepare("SELECT * FROM mslfreezing WHERE item_id='$item_id' ORDER BY id DESC");
        $stmt->execute();
        $data = $stmt->fetch(PDO::FETCH_ASSOC);

        $ftotal_mc = floatval($data['total_mc']) + floatval($mc);
        $ftotal_kg = floatval($data['total_kg']) + floatval($kg);
        $fcharges = floatval($freezingrate) * floatval($kg);
        $totalfreezingcharges = floatval($data['total_charges']) + floatval($fcharges);
      } else {
        $ftotal_mc = floatval($mc);
        $ftotal_kg = floatval($kg);
        $fcharges = floatval($freezingrate) * floatval($kg);
        $totalfreezingcharges = floatval($fcharges);
      }
    } else {
      $ftotal_mc = floatval($mc);
      $ftotal_kg = floatval($kg);
      $fcharges = floatval($freezingrate) * floatval($kg);
      $totalfreezingcharges = floatval($fcharges);
    }

    // Export Handling ADD
    $exportstmt = $pdo->prepare("SELECT * FROM mslexportcharges ORDER BY id DESC");
    $exportstmt->execute();
    $export = $exportstmt->fetch(PDO::FETCH_ASSOC);
    if (!empty($export)) {
      $exportemptystmt = $pdo->prepare("SELECT * FROM mslexportcharges WHERE item_id='$item_id' ORDER BY id DESC");
      $exportemptystmt->execute();
      $exportemptydata = $exportemptystmt->fetch(PDO::FETCH_ASSOC);
      if (!empty($exportemptydata)) {
        $exportstmt = $pdo->prepare("SELECT * FROM mslexportcharges WHERE item_id='$item_id' ORDER BY id DESC");
        $exportstmt->execute();
        $exportdata = $exportstmt->fetch(PDO::FETCH_ASSOC);

        $etotal_mc = floatval($exportdata['total_mc']) + floatval($mc);
        $etotal_kg = floatval($exportdata['total_kg']) + floatval($kg);
        $echarges = floatval($exportrate) * floatval($kg);
        $totalexportcharges = floatval($exportdata['total_charges']) + floatval($echarges);
      } else {
        $etotal_mc = floatval($mc);
        $etotal_kg = floatval($kg);
        $echarges = floatval($exportrate) * floatval($kg);
        $totalexportcharges = floatval($echarges);
      }
    } else {
      $etotal_mc = floatval($mc);
      $etotal_kg = floatval($kg);
      $echarges = floatval($exportrate) * floatval($kg);
      $totalexportcharges = floatval($echarges);
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

    if (!empty($loose_kg) && !empty($loose_mc)) {
      $totalcoldstorestmt = $pdo->prepare("SELECT * FROM mslcoldstore ORDER BY id DESC");
      $totalcoldstorestmt->execute();
      $totalcoldstoredata = $totalcoldstorestmt->fetch(PDO::FETCH_ASSOC);

      $totalfreezingstmt = $pdo->prepare("SELECT * FROM mslfreezing  ORDER BY id DESC");
      $totalfreezingstmt->execute();
      $totalfreezingdata = $totalfreezingstmt->fetch(PDO::FETCH_ASSOC);

      $totalexportstmt = $pdo->prepare("SELECT * FROM mslexportcharges ORDER BY id DESC");
      $totalexportstmt->execute();
      $totalexportdata = $totalexportstmt->fetch(PDO::FETCH_ASSOC);
      $coldstoretotal_mc = $totalcoldstoredata['total_mc'] + floatval($loose_mc);
      $coldstoretotal_kg = $totalcoldstoredata['total_kg'] + floatval($loose_kg);
      $freezingtotal_mc = $totalfreezingdata['total_mc'] + floatval($loose_mc);
      $freezingtotal_kg = $totalfreezingdata['total_kg'] + floatval($loose_kg);
      $exporttotal_mc = $totalexportdata['total_mc'] + floatval($loose_mc);
      $exporttotal_kg = $totalexportdata['total_kg'] + floatval($loose_kg);

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


    if (!empty($totalchargesdata)) {
      $total_coldstore_charges = $totalcoldstoredata['total_charges'];
      $total_freezing_charges = $totalfreezingdata['total_charges'];
      $total_export_charges = $totalexportdata['total_charges'];
      $total_charges = $totalcoldstoredata['total_charges'] + $totalfreezingdata['total_charges'] + $totalexportdata['total_charges'];
      $grand_total_charges = $totalchargesdata['balance_amount'] + $total_charges;
      $balance_amount = floatval($grand_total_charges);
    } else {
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

  function updatemslcoldstoretotal($id, $repacking_charges, $ice_charges)
  {
    global $pdo;

    $totalchargesstmt = $pdo->prepare("SELECT * FROM msl_total_charges WHERE id='$id'");
    $totalchargesstmt->execute();
    $totalchargesdata = $totalchargesstmt->fetch(PDO::FETCH_ASSOC);

    $idd = $id - 1;
    $balancestmt = $pdo->prepare("SELECT * FROM msl_total_charges WHERE id='$idd'");
    $balancestmt->execute();
    $balancedata = $balancestmt->fetch(PDO::FETCH_ASSOC);

    $total_charges = floatval($repacking_charges) + floatval($ice_charges) + $totalchargesdata['total_charges'];
    $grand_total_charges = $balancedata['balance_amount'] + $total_charges;
    $balance_amount = $grand_total_charges;
    $updatestmt = $pdo->prepare("UPDATE msl_total_charges SET repacking_charges='$repacking_charges', ice_charges='$ice_charges', total_charges='$total_charges', grand_total_charges='$grand_total_charges', balance_amount='$balance_amount' WHERE id='$id'");
    $updatestmt->execute();
  }

  function paymsltotalcharges($payment_date, $payment_amount)
  {
    global $pdo;

    $balancestmt = $pdo->prepare("SELECT balance_amount FROM msl_total_charges ORDER BY id DESC");
    $balancestmt->execute();
    $balancedata = $balancestmt->fetch(PDO::FETCH_ASSOC);
    $balance = $balancedata['balance_amount'] - $payment_amount;

    $paytotalchargesstmt = $pdo->prepare("INSERT INTO msl_total_charges(payment_date, payment_amount, balance_amount) VALUES('$payment_date', '$payment_amount', '$balance')");
    $paytotalchargesstmt->execute();
  }

  function addmslrepacking($date, $description, $sheet, $plastic, $price)
  {
    global $pdo;

    $repackingstmt = $pdo->prepare("SELECT * FROM mslrepacking ORDER BY id DESC");
    $repackingstmt->execute();
    $repackingdata = $repackingstmt->fetch(PDO::FETCH_ASSOC);
    if (!empty($repackingdata)) {
      if (!empty($sheet)) {
        $amount = $sheet * $price;
        $total_charges = $amount + $repackingdata['total_charges'];

        $repackingaddstmt = $pdo->prepare("INSERT INTO mslrepacking(date, description, sheet, plastic, price, amount, total_charges) VALUES('$date','$description','$sheet', '$plastic','$price', '$amount', '$total_charges')");
        $repackingaddstmt->execute();
      } else {
        $amount = floatval($plastic) * $price;
        $total_charges = $amount + $repackingdata['total_charges'];

        $repackingaddstmt = $pdo->prepare("INSERT INTO mslrepacking(date, description, sheet, plastic, price, amount, total_charges) VALUES('$date','$description','$sheet', '$plastic','$price', '$amount', '$total_charges')");
        $repackingaddstmt->execute();
      }
    } else {
      if (!empty($sheet)) {
        $amount = $sheet * $price;
        $total_charges = $amount;

        $repackingaddstmt = $pdo->prepare("INSERT INTO mslrepacking(date, description, sheet, plastic, price, amount, total_charges) VALUES('$date','$description','$sheet', '$plastic','$price', '$amount', '$total_charges')");
        $repackingaddstmt->execute();
      } else {
        $amount = floatval($plastic) * $price;
        $total_charges = $amount;

        $repackingaddstmt = $pdo->prepare("INSERT INTO mslrepacking(date, description, sheet, plastic, price, amount, total_charges) VALUES('$date','$description','$sheet', '$plastic','$price', '$amount', '$total_charges')");
        $repackingaddstmt->execute();
      }
    }
  }

  // MSL QUERIES

  function updatetclcountry($country, $pcsperf7, $updateid)
  {
    global $pdo;

    if ($country == "") {
      $countryupdatestmt = $pdo->prepare("UPDATE form7stocktcl SET country= NULL, pcsperf7='$pcsperf7' WHERE id='$updateid'");
      $countryupdatestmt->execute();
    } else {
      $countryupdatestmt = $pdo->prepare("UPDATE form7stocktcl SET country='$country', pcsperf7='$pcsperf7' WHERE id='$updateid'");
      $countryupdatestmt->execute();
    }
  }

  function updatefrozencountry($country, $pcsperf7, $updateid)
  {
    global $pdo;

    if ($country == "") {
      $countryupdatestmt = $pdo->prepare("UPDATE form7stock SET country= NULL, pcsperf7='$pcsperf7' WHERE id='$updateid'");
      $countryupdatestmt->execute();
    } else {
      $countryupdatestmt = $pdo->prepare("UPDATE form7stock SET country='$country', pcsperf7='$pcsperf7' WHERE id='$updateid'");
      $countryupdatestmt->execute();
    }
  }

  function addform10($date, $item_id, $supplier_id, $country, $type, $size, $mc, $kg, $pcs, $looseinkg, $looseinpcs, $looseoutkg, $looseoutpcs)
  {
    global $pdo;

    $form7stmt = $pdo->prepare("SELECT * FROM form7stock WHERE item_id='$item_id' AND size='$size'");
    $form7stmt->execute();
    $form7data = $form7stmt->fetch(PDO::FETCH_ASSOC);
    $total_kg = (floatval($kg) + floatval($looseinkg)) - floatval($looseoutkg);
    $addform10 = (floatval($pcs) + floatval($looseinpcs)) - floatval($looseoutpcs);
    $addform10stmt = $pdo->prepare("INSERT INTO form10stock(date, item_id, supplier_id, country, type, size, pcsform10, mc, kg, pcs, looseinkg, looseinpcs, looseoutkg, looseoutpcs, total_kg) VALUES('$date', '$item_id', '$supplier_id', '$country', '$type', '$size', '$addform10', '$mc', '$kg', '$pcs', '$looseinkg', '$looseinpcs', '$looseoutkg', '$looseoutpcs', '$total_kg')");
    $addform10stmt->execute();
  }

  function addform10tcl($date, $item_id, $country, $size, $mc, $kg, $pcs, $looseinkg, $looseinpcs, $looseoutkg, $looseoutpcs, $cckg, $ccpcs, $cutpiecekg, $cutpiecepcs, $hhkkg, $hhkpcs, $mslkg, $mslpcs, $lanfishkg, $lanfishpcs)
  {
    global $pdo;

    $total_kg = (floatval($kg) + floatval($looseinkg) + floatval($cckg) + floatval($cutpiecekg) + floatval($hhkkg) + floatval($mslkg) + floatval($lanfishkg)) - floatval($looseoutkg);
    $addform10 = (floatval($pcs) + floatval($looseinpcs) + floatval($ccpcs) + floatval($cutpiecepcs) + floatval($hhkpcs) + floatval($mslpcs) + floatval($lanfishpcs)) - floatval($looseoutpcs);
    $addform10stmt = $pdo->prepare("INSERT INTO form10stocktcl(date, item_id, country, type, size, pcsform10, mc, kg, pcs, looseinkg, looseinpcs, looseoutkg, looseoutpcs, cc_kg, cc_pcs, cutpiece_kg, cutpiece_pcs, hhk_kg, hhk_pcs, msl_kg, msl_pcs, lanfish_kg, lanfish_pcs, total_kg) VALUES('$date', '$item_id', '$country', 'TCL', '$size', '$addform10', '$mc', '$kg', '$pcs', '$looseinkg', '$looseinpcs', '$looseoutkg', '$looseoutpcs','$cckg','$ccpcs', '$cutpiecekg', '$cutpiecepcs', '$hhkkg','$hhkpcs','$mslkg','$mslpcs','$lanfishkg','$lanfishpcs', '$total_kg')");
    $addform10stmt->execute();
  }

  function addpackinglist($date, $customer_id, $country, $invoiceno, $containerno, $vessel_name, $voyname, $fda)
  {
    global $pdo;

    $addpackingliststmt = $pdo->prepare("INSERT INTO packingliststock(date, customer_id, country, invoiceno, containerno, vessel_name, voyname, fda) VALUES('$date', '$customer_id', '$country', '$invoiceno', '$containerno', '$vessel_name', '$voyname', '$fda')");
    $addpackingliststmt->execute();
  }

  function editpackinglist($date, $customer_id, $country, $invoiceno, $containerno, $vessel_name, $voyname, $fda, $updateid)
  {
    global $pdo;

    $editpackingstockstmt = $pdo->prepare("UPDATE packingliststock SET date='$date', customer_id='$customer_id', country='$country', invoiceno='$invoiceno', containerno='$containerno', vessel_name='$vessel_name', voyname='$voyname', fda='$fda' WHERE id='$updateid'");
    $editpackingstockstmt->execute();
  }

  function addpackinglistinfo($commondity, $size, $packingkgperbox, $mc, $infoid)
  {
    global $pdo;

    $totalnetweight = $packingkgperbox * $mc;
    $totalgrossweight = $totalnetweight + $mc;
    $commondity;
    $checkitemname = $this->select('item', $commondity, 'item_id');

    if (str_contains($checkitemname['item_name'], "block") || str_contains($checkitemname['item_name'], "balachaung")) {
      $addpackingliststmt = $pdo->prepare("INSERT INTO packingliststockinfo(commondity_id, size, packingkgperbox, mc, totalnetweight, infoid) VALUES('$commondity', '$size', '$packingkgperbox', '$mc', '$totalnetweight', '$infoid')");
      $addpackingliststmt->execute();
    } else {
      $addpackingliststmt = $pdo->prepare("INSERT INTO packingliststockinfo(commondity_id, size, packingkgperbox, mc, totalnetweight, totalgrossweight, infoid) VALUES('$commondity', '$size', '$packingkgperbox', '$mc', '$totalnetweight', '$totalgrossweight', '$infoid')");
      $addpackingliststmt->execute();
    }


    $linkidstmt = $pdo->prepare("SELECT * FROM packingliststockinfo ORDER BY id DESC");
    $linkidstmt->execute();
    $linkiddata = $linkidstmt->fetch(PDO::FETCH_ASSOC);

    $linkid = $linkiddata['id'];
    $addinvoicestmt = $pdo->prepare("INSERT INTO actualinvoice(commondity_id, size, packingkgperbox, mc, totalnetweight, infoid, link_id) VALUES('$commondity', '$size', '$packingkgperbox', '$mc', '$totalnetweight', '$infoid', '$linkid')");
    $addinvoicestmt->execute();

    $addpackingmaterialstmt = $pdo->prepare("INSERT INTO packingmaterial(commondity_id, fish_size, link_id, infoid) VALUES('$commondity', '$size', '$linkid', '$infoid')");
    $addpackingmaterialstmt->execute();

    $addinvoicecostingstmt = $pdo->prepare("INSERT INTO invoice_costing(commondity_id, size, kg, link_id, infoid) VALUES('$commondity', '$size', '$packingkgperbox', '$linkid',  '$infoid')");
    $addinvoicecostingstmt->execute();
  }

  function updateactualinvoice($usd, $updateid)
  {
    global $pdo;

    $netweightstmt = $pdo->prepare("SELECT * FROM actualinvoice WHERE id='$updateid'");
    $netweightstmt->execute();
    $netweight = $netweightstmt->fetch(PDO::FETCH_ASSOC);

    $total_usd = $usd * floatval($netweight['totalnetweight']);
    $updateusdstmt = $pdo->prepare("UPDATE actualinvoice SET usd='$usd', total_usd='$total_usd' WHERE id='$updateid'");
    $updateusdstmt->execute();
  }


  function updateblockusd($usd, $updateid)
  {
    global $pdo;

    $updateusdstmt = $pdo->prepare("UPDATE actualinvoice SET usd='$usd' WHERE id='$updateid'");
    $updateusdstmt->execute();
  }


  function updatetotalusd($totalusd, $updateid)
  {
    global $pdo;

    $updateusdstmt = $pdo->prepare("UPDATE actualinvoice SET total_usd='$totalusd' WHERE id='$updateid'");
    $updateusdstmt->execute();
  }
  function updateinvoicecosting($priceperviss, $yield, $packing_material, $ocean_pacific, $tax, $agent, $transport, $updateid, $dollar, $commondity_id, $size)
  {
    global $pdo;

    $_SESSION['yield'] = $yield;
    $_SESSION['ocean_pacific'] = $ocean_pacific;
    $_SESSION['agent'] = $agent;
    $_SESSION['transport'] = $transport;
    $_SESSION['dollar'] = $dollar;

    if ($priceperviss != 0 || $yield != 0 || $packing_material != 0) {
      $priceperkg = floatval($priceperviss) / 1.634;
      if (str_contains($yield, '-')) {
        $explodedyield = explode('-', $yield);
        $percentage = (100 - floatval($explodedyield)) / 100;
      } else {
        $yield;
        $percentage = (100 + round($yield, 4)) / 100;
      }
      $totalkgstmt = $pdo->prepare("SELECT SUM(kg) AS totalkg FROM invoice_costing WHERE commondity_id='$commondity_id' AND size='$size'");
      $totalkgstmt->execute();
      $totalkgdata = $totalkgstmt->fetch(PDO::FETCH_ASSOC);
      $kgstmt = $pdo->prepare("SELECT * FROM invoice_costing WHERE id='$updateid'");
      $kgstmt->execute();
      $kgdata = $kgstmt->fetch(PDO::FETCH_ASSOC);
      $total_price = $priceperkg / $percentage;
      $usd = floatval($total_price) / floatval($dollar);
      $total_usd = floatval($usd) + floatval($packing_material) + floatval($ocean_pacific) + floatval($tax) + floatval($agent) + floatval($transport);
      $total_kg_price = $total_usd * $totalkgdata['totalkg'];

      $updateinvoicecostingstmt = $pdo->prepare("UPDATE invoice_costing SET priceperviss='$priceperviss', priceperkg='$priceperkg', yield='$yield', total_price='$total_price', usd='$usd', packing_material='$packing_material', ocean_pacific='$ocean_pacific', tax='$tax', agent='$agent', transport='$transport', total_usd='$total_usd', total_kg_price='$total_kg_price'
      WHERE id='$updateid'");
      $updateinvoicecostingstmt->execute();
    } else {
      $priceperkg = 0;
      $total_price = 0;
      $usd = 0;
      $total_usd = 0;
      $total_kg_price = 0;
      $updateinvoicecostingstmt = $pdo->prepare("UPDATE invoice_costing SET priceperviss='$priceperviss', priceperkg='$priceperkg', yield='$yield', total_price='$total_price', usd='$usd', packing_material='$packing_material', ocean_pacific='$ocean_pacific', tax='$tax', agent='$agent', transport='$transport', total_usd='$total_usd', total_kg_price='$total_kg_price'
      WHERE id='$updateid'");
      $updateinvoicecostingstmt->execute();
    }
  }

  function updatesellingprice($sellingpriceperkg, $updateid, $commondity_id, $size)
  {
    global $pdo;

    $stmt = $pdo->prepare("SELECT * FROM invoice_costing WHERE id='$updateid'");
    $stmt->execute();
    $data = $stmt->fetch(PDO::FETCH_ASSOC);

    $total_selling_price = $sellingpriceperkg * $data['kg'];
    $profitorlossperkg = $sellingpriceperkg - $data['total_usd'];
    $profit_amount = $data['kg'] * $profitorlossperkg;

    $pcsperkgstmt = $pdo->prepare("SELECT * FROM actualinvoice WHERE commondity_id='$commondity_id'");
    $pcsperkgstmt->execute();
    $pcsperkgdata = $pcsperkgstmt->fetch(PDO::FETCH_ASSOC);
    $total_usd = $sellingpriceperkg * $pcsperkgdata['packingkgperbox'];

    $updatesellingpricestmt = $pdo->prepare("UPDATE invoice_costing SET sellingpriceperkg='$sellingpriceperkg', total_selling_price='$total_selling_price', profitorlossperkg='$profitorlossperkg', profit_amount='$profit_amount' WHERE id='$updateid'");
    $updatesellingpricestmt->execute();

    $updatestockstmt = $pdo->prepare("UPDATE actualinvoice SET usd='$sellingpriceperkg', total_usd='$total_usd' WHERE commondity_id='$commondity_id' AND size='$size'");
    $updatestockstmt->execute();
  }

  function addbankdetail($company_name, $company_address, $usd, $account_type, $bank_name, $swift_code, $bank_branch_address, $infoid)
  {
    global $pdo;

    $stmt = $pdo->prepare("SELECT * FROM bankdetail WHERE infoid='$infoid'");
    $stmt->execute();
    $checkavaliable = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!empty($checkavaliable)) {
      $updatebankdetailstmt = $pdo->prepare("UPDATE bankdetail SET company_name='$company_name',company_address='$company_address',usd='$usd',account_type='$account_type',bank_name='$bank_name',swift_code='$swift_code',bank_branch_address='$bank_branch_address' WHERE infoid='$infoid'");
      $updatebankdetailstmt->execute();
    } else {
      $addbankdetailstmt = $pdo->prepare("INSERT INTO bankdetail(company_name, company_address, usd, account_type, bank_name, swift_code, bank_branch_address, infoid) VALUES('$company_name', '$company_address', '$usd', '$account_type', '$bank_name', '$swift_code', '$bank_branch_address', '$infoid');");
      $addbankdetailstmt->execute();
    }
  }

  function updatepackinglist($upitem_id, $upsize, $upkgperbox, $upmc, $upid)
  {
    global $pdo;

    $totalnetweight = $upkgperbox * $upmc;
    $totalgrossweight = $totalnetweight + $upmc;


    $updatepackingliststmt = $pdo->prepare("UPDATE packingliststockinfo SET commondity_id='$upitem_id', size='$upsize', packingkgperbox='$upkgperbox', mc='$upmc', totalnetweight='$totalnetweight', totalgrossweight='$totalgrossweight' WHERE id='$upid'");
    $updatepackingliststmt->execute();

    $updatepackingliststmt = $pdo->prepare("UPDATE actualinvoice SET commondity_id='$upitem_id', size='$upsize', packingkgperbox='$upkgperbox', mc='$upmc', totalnetweight='$totalnetweight' WHERE link_id='$upid'");
    $updatepackingliststmt->execute();

    $updatepackingliststmt = $pdo->prepare("UPDATE invoice_costing SET commondity_id='$upitem_id', size='$upsize', kg='$upkgperbox' WHERE link_id='$upid'");
    $updatepackingliststmt->execute();

    $updatepackingmaterialstmt = $pdo->prepare("UPDATE packingmaterial SET commondity_id='$upitem_id', fish_size='$upsize' WHERE link_id='$upid'");
    $updatepackingmaterialstmt->execute();
  }
  function addmcstock($date, $particular, $country, $commondity_id, $fish_type,  $size, $kg, $mc)
  {
    global $pdo;

    $mcstmt = $pdo->prepare("SELECT * FROM hhkmcstock WHERE kg='$kg' AND size='$size' AND commondity_id='$commondity_id' AND country='$country' ORDER BY id DESC");
    $mcstmt->execute();
    $mcdata = $mcstmt->fetch(PDO::FETCH_ASSOC);

    if (!empty($mcdata)) {
      $balance_mc = $mcdata['balance_mc'] + $mc;
    } else {
      $balance_mc = $mc;
    }
    $addmcstmt = $pdo->prepare("INSERT INTO hhkmcstock(date, country, particular, commondity_id, size, kg, mc, balance_mc, fish_type) VALUES('$date', '$country', '$particular', '$commondity_id', '$size', '$kg', '$mc', '$balance_mc', '$fish_type')");
    $addmcstmt->execute();


    if (!empty($addmcstmt)) {
      echo '<script>swal("Success!", "Mc Added Successfully!", "success");</script>';
    }
  }

  function addgfcmcstock($date, $particular, $country, $commondity_id, $fish_type, $size, $kg, $mc)
  {
    global $pdo;

    $mcstmt = $pdo->prepare("SELECT * FROM gfcmcstock WHERE kg='$kg' AND size='$size' AND commondity_id='$commondity_id' AND country='$country' ORDER BY id DESC");
    $mcstmt->execute();
    $mcdata = $mcstmt->fetch(PDO::FETCH_ASSOC);

    if (!empty($mcdata)) {
      $balance_mc = $mcdata['balance_mc'] + $mc;
    } else {
      $balance_mc = $mc;
    }
    $addmcstmt = $pdo->prepare("INSERT INTO gfcmcstock(date, country, particular, commondity_id, size, kg, mc, balance_mc, fish_type) VALUES('$date', '$country', '$particular', '$commondity_id', '$size', '$kg', '$mc', '$balance_mc', '$fish_type')");
    $addmcstmt->execute();

    if (!empty($addmcstmt)) {
      echo '<script>swal("Success!", "Mc Added Successfully!", "success");</script>';
    }
  }

  function transfermcstock($transferdate, $transferparticular, $transfercountry, $transfercommondity_id, $transfersize, $transferkg, $transfermc)
  {
    global $pdo;

    $hhkmcstmt = $pdo->prepare("SELECT * FROM hhkmcstock WHERE kg='$transferkg' AND size='$transfersize' AND commondity_id='$transfercommondity_id' AND country='$transfercountry' ORDER BY id DESC");
    $hhkmcstmt->execute();
    $hhkmcdata = $hhkmcstmt->fetch(PDO::FETCH_ASSOC);

    if (!empty($hhkmcdata['balance_mc'])) {
      $balance_mc = $hhkmcdata['balance_mc'] - $transfermc;
    } else {
      $balance_mc = 0 - $transfermc;
    }
    $transfermcstmt = $pdo->prepare("INSERT INTO hhkmcstock(date, country, particular, commondity_id, size, kg, mc, balance_mc) VALUES('$transferdate', '$transfercountry', '$transferparticular', '$transfercommondity_id', '$transfersize', '$transferkg', '$transfermc', '$balance_mc')");
    $transfermcstmt->execute();


    $gfcmcstmt = $pdo->prepare("SELECT * FROM gfcmcstock WHERE kg='$transferkg' AND size='$transfersize' AND commondity_id='$transfercommondity_id' AND country='$transfercountry' ORDER BY id DESC");
    $gfcmcstmt->execute();
    $gfcmcdata = $gfcmcstmt->fetch(PDO::FETCH_ASSOC);

    $hhk_idstmt = $pdo->prepare("SELECT id FROM hhkmcstock ORDER BY id DESC");
    $hhk_idstmt->execute();
    $hhk_id = $hhk_idstmt->fetch(PDO::FETCH_ASSOC);
    $id = $hhk_id['id'];
    if (!empty($gfcmcdata)) {
      $balance_mc_for_gfc = $gfcmcdata['balance_mc'] + $transfermc;
      $transfertogfcstmt = $pdo->prepare("INSERT INTO gfcmcstock(date, country, particular, commondity_id, size, kg, mc, balance_mc, hhk_id) VALUES('$transferdate', '$transfercountry', '$transferparticular', '$transfercommondity_id', '$transfersize', '$transferkg', '$transfermc', '$balance_mc_for_gfc', '$id')");
      $transfertogfcstmt->execute();
    } else {
      $balance_mc_for_gfc = $transfermc;
      $transfertogfcstmt = $pdo->prepare("INSERT INTO gfcmcstock(date, country, particular, commondity_id, size, kg, mc, balance_mc, hhk_id) VALUES('$transferdate', '$transfercountry', '$transferparticular', '$transfercommondity_id', '$transfersize', '$transferkg', '$transfermc', '$balance_mc_for_gfc', '$id')");
      $transfertogfcstmt->execute();
    }

    if (!empty($transfermcstmt)) {
      echo '<script>swal("Success!", "Transfered Successfully!", "success");</script>';
    }
  }

  function exportmcstock($exportdate, $exportparticular, $exportcountry, $exportcommondity_id, $exportsize, $exportkg, $exportmc)
  {
    global $pdo;

    $gfcmcstmt = $pdo->prepare("SELECT * FROM gfcmcstock WHERE kg='$exportkg' AND size='$exportsize' AND commondity_id='$exportcommondity_id' AND country='$exportcountry' ORDER BY id DESC");
    $gfcmcstmt->execute();
    $gfcmcdata = $gfcmcstmt->fetch(PDO::FETCH_ASSOC);

    $balance_mc = $gfcmcdata['balance_mc'] - $exportmc;
    $exportmcstmt = $pdo->prepare("INSERT INTO gfcmcstock(date, country, particular, commondity_id, size, kg, mc, balance_mc) VALUES('$exportdate', '$exportcountry', '$exportparticular', '$exportcommondity_id', '$exportsize', '$exportkg', '$exportmc', '$balance_mc')");
    $exportmcstmt->execute();

    if (!empty($exportmcstmt)) {
      echo '<script>swal("Success!", "Exported Successfully!", "success");</script>';
    }
  }

  function permission($permission, $role_id)
  {
    global $pdo;

    $permissioncheckstmt = $pdo->prepare("SELECT * FROM permission WHERE role_id='$role_id'");
    $permissioncheckstmt->execute();
    $permissioncheckdata = $permissioncheckstmt->fetchall();
    if (!empty($permissioncheckdata)) {
      $permission = $pdo->prepare("UPDATE permission SET permission='$permission' WHERE role_id='$role_id'");
      $permission->execute();
    } else {
      $permission = $pdo->prepare("INSERT INTO permission(role_id, permission) VALUES('$role_id', '$permission')");
      $permission->execute();
    }

    $_SESSION['changepermission'] = 'finished';
    echo "<script>window.location.href='managerole.php';</script>";
  }

  function addsize($id, $size)
  {
    global $pdo;

    $sizestmt = $pdo->prepare("SELECT * FROM form7stock WHERE id='$id'");
    $sizestmt->execute();
    $sizedata = $sizestmt->fetch(PDO::FETCH_ASSOC);

    $item_id = $sizedata['item_id'];
    $country = $sizedata['country'];
    $type = $sizedata['type'];
    $supplier_name = $sizedata['supplier_name'];
    $link_id = $sizedata['link_id'];
    $date = $sizedata['date'];
    $addsizestmt = $pdo->prepare("INSERT INTO form7stock(date, item_id, supplier_name, country, type, size, link_id) VALUES('$date', '$item_id', '$supplier_name', '$country', '$type', '$size', '$link_id')");
    $addsizestmt->execute();
  }

  function addsizetcl($id, $size)
  {
    global $pdo;

    $sizestmt = $pdo->prepare("SELECT * FROM form7stocktcl WHERE id='$id'");
    $sizestmt->execute();
    $sizedata = $sizestmt->fetch(PDO::FETCH_ASSOC);

    $item_id = $sizedata['item_id'];
    $country = $sizedata['country'];
    $type = $sizedata['type'];
    $supplier_name = $sizedata['supplier_name'];
    $link_id = $sizedata['link_id'];
    $date = $sizedata['date'];
    $addsizestmt = $pdo->prepare("INSERT INTO form7stocktcl(date, item_id, supplier_name, country, type, size, link_id) VALUES('$date', '$item_id', '$supplier_name', '$country', '$type', '$size', '$link_id')");
    $addsizestmt->execute();
  }

  function addform7($date, $commondity_id, $supplier_name, $type, $size, $viss)
  {
    global $pdo;

    $kg = $viss * 1.634;

    $addstmt = $pdo->prepare("INSERT INTO form7stock(date, item_id, supplier_name, type, size, viss, kg) VALUES('$date', '$commondity_id', '$supplier_name', '$type', '$size', '$viss', '$kg')");
    $addstmt->execute();
  }

  function deleteform7($table, $idtodelete)
  {
    global $pdo;
    $stmt = $pdo->prepare("DELETE FROM $table WHERE link_id='$idtodelete'");
    $stmt->execute();
  }

  function form7tcldelete($idtodelete)
  {
    global $pdo;
    $stmt = $pdo->prepare("DELETE FROM form7stocktcl WHERE id='$idtodelete'");
    $stmt->execute();
  }

  function form7frozendelete($idtodelete)
  {
    global $pdo;
    $stmt = $pdo->prepare("DELETE FROM form7stock WHERE id='$idtodelete'");
    $stmt->execute();
  }
  function addtclmcstock($date, $item_id, $size, $pcs, $kg, $form10_mc)
  {
    global $pdo;

    $addtclmcstmt = $pdo->prepare("INSERT INTO tclmcstock(date, item_id, size, pcs, kg, form10mc, grandtotal_mc) VALUES('$date', '$item_id', '$size', '$pcs', '$kg', '$form10_mc', '$form10_mc')");
    $addtclmcstmt->execute();
  }

  function transfermcstocktcl($transfer_to, $transfer_mc, $id)
  {
    global $pdo;

    $transfercheckstmt = $pdo->prepare("SELECT * FROM tclmcstock WHERE id='$id'");
    $transfercheckstmt->execute();
    $transfercheck = $transfercheckstmt->fetch(PDO::FETCH_ASSOC);

    $grandtotal_mc = $transfercheck['grandtotal_mc'] - $transfer_mc;
    $transferstmt = $pdo->prepare("UPDATE tclmcstock SET transfer_to_where='$transfer_to', transfer_mc='$transfer_mc', grandtotal_mc='$grandtotal_mc' WHERE id='$id'");
    $transferstmt->execute();
    return '<script>swal("Success!", "Successfully Transfered!", "success");</script>';
  }

  function loadmcstocktcl($loading_no, $loading_mc, $id)
  {
    global $pdo;

    $loadcheckstmt = $pdo->prepare("SELECT * FROM tclmcstock WHERE id='$id'");
    $loadcheckstmt->execute();
    $loadcheck = $loadcheckstmt->fetch(PDO::FETCH_ASSOC);

    $grandtotal_mc = $loadcheck['grandtotal_mc'] - $loading_mc;
    $loadstmt = $pdo->prepare("UPDATE tclmcstock SET loading_no='$loading_no', loading_mc='$loading_mc', grandtotal_mc='$grandtotal_mc' WHERE id='$id'");
    $loadstmt->execute();
    return '<script>swal("Success!", "Successfully Loaded!", "success");</script>';
  }

  function addtruckpackinglist($date, $invoice_no, $truck_no)
  {
    global $pdo;

    $addpackingliststmt = $pdo->prepare("INSERT INTO truckpackingliststock(date, invoice_no, truck_no) VALUES('$date', '$invoice_no', '$truck_no')");
    $addpackingliststmt->execute();
  }

  function edittruckpackinglist($upid, $date, $invoice_no, $truck_no, $oldinvoiceno)
  {
    global $pdo;

    $stmt = $pdo->prepare("UPDATE truckpackingliststock SET date='$date', invoice_no='$invoice_no', truck_no='$truck_no' WHERE id='$upid'");
    $stmt->execute();

    $updatetruckpackingliststmt = $pdo->prepare("UPDATE truckpackingliststockinfo SET invoice_no='$invoice_no' WHERE invoice_no='$oldinvoiceno'");
    $updatetruckpackingliststmt->execute();

    $updatedeclarestmt = $pdo->prepare("UPDATE truckdeclare SET invoice_no='$invoice_no' WHERE invoice_no='$oldinvoiceno'");
    $updatedeclarestmt->execute();

    $updatefoamboxstmt = $pdo->prepare("UPDATE truckfoambox SET invoice_no='$invoice_no' WHERE invoice_no='$oldinvoiceno'");
    $updatefoamboxstmt->execute();

    $updateinvoicestmt = $pdo->prepare("UPDATE truckactualinvoice SET invoice_no='$invoice_no' WHERE invoice_no='$oldinvoiceno'");
    $updateinvoicestmt->execute();

    $updatetrucktotalcostingstmt = $pdo->prepare("UPDATE trucktotalcosting SET invoice_no='$invoice_no' WHERE invoice_no='$oldinvoiceno'");
    $updatetrucktotalcostingstmt->execute();
  }

  function addtruckpackinglistinfo($commondity, $size, $pcsperbox, $kgperbox, $mc, $invoice_no, $infoid)
  {
    global $pdo;

    $totalnetweight = $kgperbox * $mc;
    $totalgrossweight = $mc * 60;


    $addtruckpackingliststmt = $pdo->prepare("INSERT INTO truckpackingliststockinfo(item_id, size, pcsperbox, kgperbox, mc, netweight, totalgrossweight, invoice_no) VALUES('$commondity', '$size', '$pcsperbox', '$kgperbox', '$mc', '$totalnetweight', '$totalgrossweight', '$invoice_no')");
    $addtruckpackingliststmt->execute();

    $getidstmt = $pdo->prepare("SELECT * FROM truckpackingliststockinfo ORDER BY id DESC");
    $getidstmt->execute();
    $getid = $getidstmt->fetch(PDO::FETCH_ASSOC);
    $lastid = $getid['id'];

    $addinvoicestmt = $pdo->prepare("INSERT INTO truckactualinvoice(item_id, size, pcsperbox, kgperbox, mc, netweight, invoice_no, link_id) VALUES('$commondity', '$size', '$pcsperbox', '$kgperbox', '$mc', '$totalnetweight', '$invoice_no', '$lastid')");
    $addinvoicestmt->execute();

    $addfoambox = $pdo->prepare("INSERT INTO truckfoambox(item_id, size, pcsperbox, kgperbox, mc, netweight, invoice_no, link_id) VALUES('$commondity', '$size', '$pcsperbox', '$kgperbox', '$mc', '$totalnetweight', '$invoice_no', '$lastid')");
    $addfoambox->execute();

    $adddeclare = $pdo->prepare("INSERT INTO truckdeclare(item_id, size, pcsperbox, mc, invoice_no, link_id) VALUES('$commondity', '$size', '$pcsperbox', '$mc', '$invoice_no', '$lastid')");
    $adddeclare->execute();

    $adddeclare = $pdo->prepare("INSERT INTO trucktotalcosting(item_id, size, total_kg, invoice_no, link_id, infoid) VALUES('$commondity', '$size', '$totalnetweight', '$invoice_no', '$lastid', '$infoid')");
    $adddeclare->execute();
  }

  function updatetruckpackinglistinfo($commondity, $size, $pcsperbox, $kgperbox, $mc, $updateid)
  {
    global $pdo;

    $totalnetweight = floatval($kgperbox) * floatval($mc);
    $totalgrossweight = floatval($mc) * 60;

    $updatetruckpackingliststmt = $pdo->prepare("UPDATE truckpackingliststockinfo SET item_id='$commondity', size='$size', pcsperbox='$pcsperbox', kgperbox='$kgperbox', mc='$mc', netweight='$totalnetweight', totalgrossweight='$totalgrossweight' WHERE id='$updateid'");
    $updatetruckpackingliststmt->execute();

    $updatedeclarestmt = $pdo->prepare("UPDATE truckdeclare SET item_id='$commondity', size='$size', pcsperbox='$pcsperbox', mc='$mc' WHERE link_id='$updateid'");
    $updatedeclarestmt->execute();

    $updatefoamboxstmt = $pdo->prepare("UPDATE truckfoambox SET item_id='$commondity', size='$size', pcsperbox='$pcsperbox', kgperbox='$kgperbox', mc='$mc', netweight='$totalnetweight' WHERE link_id='$updateid'");
    $updatefoamboxstmt->execute();

    $updateinvoicestmt = $pdo->prepare("UPDATE truckactualinvoice SET item_id='$commondity', size='$size', pcsperbox='$pcsperbox', kgperbox='$kgperbox', mc='$mc', netweight='$totalnetweight' WHERE link_id='$updateid'");
    $updateinvoicestmt->execute();

    $updatetrucktotalcostingstmt = $pdo->prepare("UPDATE trucktotalcosting SET item_id='$commondity', size='$size', total_kg='$kgperbox' WHERE link_id='$updateid'");
    $updatetrucktotalcostingstmt->execute();
  }

  function updatetruckactualinvoice($usd, $updateid)
  {
    global $pdo;

    $netweightstmt = $pdo->prepare("SELECT * FROM truckactualinvoice WHERE id='$updateid'");
    $netweightstmt->execute();
    $netweight = $netweightstmt->fetch(PDO::FETCH_ASSOC);

    $total_usd = floatval($usd) * floatval($netweight['netweight']);
    $updateusdstmt = $pdo->prepare("UPDATE truckactualinvoice SET usd='$usd', total_usd='$total_usd' WHERE id='$updateid'");
    $updateusdstmt->execute();
  }

  function updatefoambox($foamboxid, $foambox, $invoice_no)
  {
    global $pdo;
    $checkstmt = $pdo->prepare("SELECT * FROM truckfoambox WHERE invoice_no='$invoice_no' AND foambox_no IS NOT NULL");
    $checkstmt->execute();
    $checkdata = $checkstmt->fetchall();

    $countstmt = $pdo->prepare("SELECT COUNT(*) FROM truckfoambox WHERE invoice_no='$invoice_no' AND foambox_no IS NOT NULL");
    $countstmt->execute();
    $countdata = $countstmt->fetchColumn();
    $count = 0;
    $thefoamboxs = "";
    foreach ($checkdata as $foamdata) {
      $count++;
      if ($countdata == $count) {
        $thefoamboxs .= $foamdata['foambox_no'];
      } else {
        $thefoamboxs .= $foamdata['foambox_no'] . ",";
      }
    }
    $thefoamboxs = explode(',', $thefoamboxs);
    $foamboxs = explode(',', $foambox);
    $dup = array_intersect($thefoamboxs, $foamboxs);
    if (!empty($dup)) {
      $condition = "error";
    } else {
      $condition = "success";
    }

    // $foamboxs = $checkdata['foambox_no'];
    // $foamboxexploded = explode("-", $foamboxs);
    // $foamboxno = count($foamboxexploded);
    // for ($i=0; $i < $foambox_no; $i++) {
    //   // code...
    // }
    // echo $condition;
    if ($condition != 'error') {
      $totalfoamboxno = count(explode(',', $foambox));
      $updatefoamstmt = $pdo->prepare("UPDATE truckfoambox SET foambox_no='$foambox', total_foambox_no = '$totalfoamboxno' WHERE id='$foamboxid'");
      $updatefoamstmt->execute();
    } else {
      echo "<script>swal('Warning!', 'Duplicate Foam Number', 'warning');</script>";
    }
  }

  function updatekgperbox($kgperbox, $kgperboxid)
  {
    global $pdo;

    $mcstmt = $pdo->prepare("SELECT * FROM truckdeclare WHERE id='$kgperboxid'");
    $mcstmt->execute();
    $mcdata = $mcstmt->fetch(PDO::FETCH_ASSOC);

    if (!empty($kgperbox)) {
      $netweight = $mcdata['mc'] * floatval($kgperbox);
    } else {
      $netweight = 0;
    }

    $updatepcsperboxstmt = $pdo->prepare("UPDATE truckdeclare SET kgperbox='$kgperbox', netweight='$netweight' WHERE id='$kgperboxid'");
    $updatepcsperboxstmt->execute();
  }

  function addmaterial($date, $remark, $ice_amount, $tape_amount, $foambox_amount, $plastic_amount, $miscellous, $form10kg, $invoice_no)
  {
    global $pdo;

    // $ice = $ice_amount * $ice_per_price;
    // $tape = $tape_amount * $tape_per_price;
    // $foam_box = $foambox_amount * $foambox_per_price;
    // $plastic = $plastic_amount * $plastic_per_price;
    $total_charges = $ice_amount + $tape_amount + $foambox_amount + $plastic_amount + $miscellous;

    $iceperkg = $ice_amount / $form10kg;
    $tapeperkg = $tape_amount / $form10kg;
    $foam_boxperkg = $foambox_amount / $form10kg;
    $plasticperkg = $plastic_amount / $form10kg;
    $miscellousperkg = $miscellous / $form10kg;
    $costperkg = $iceperkg + $tapeperkg + $foam_boxperkg + $plasticperkg + $miscellousperkg;

    $addmaterialstmt = $pdo->prepare("INSERT INTO truckpackingmaterial(date, remark,	ice, miscellous,	tape,	foam_box,	plastic,	total_charges, form10kg, costperkg, invoice_no) VALUES('$date', '$remark', '$ice_amount', '$miscellous', '$tape_amount', '$foambox_amount', '$plastic_amount', '$total_charges', '$form10kg', '$costperkg', '$invoice_no')");
    $addmaterialstmt->execute();
  }

  function updatetotalcosting($priceperviss, $percentage, $packing_charges, $mtorst, $ygntomt, $mttotechnck, $ygntost, $sttotechnck, $labour_charges, $id, $invoice_no)
  {
    global $pdo;
    $priceperkg = floatval($priceperviss) / 1.634;
    $realpercentage = $priceperkg / $percentage;

    $updatetotalcostingstmt = $pdo->prepare("UPDATE trucktotalcosting SET priceperviss='$priceperviss', priceperkg='$priceperkg', percentage='$realpercentage', packing_charges='$packing_charges', labour_charges='$labour_charges' WHERE id='$id'");
    $updatetotalcostingstmt->execute();
    // ------------------------
    // $totalcostingstmt = $pdo->prepare("SELECT SUM(total_kg) AS total_kg FROM trucktotalcosting WHERE invoice_no='$invoice_no'");
    // $totalcostingstmt->execute();
    //
    // $totalcosting = $totalcostingstmt->fetch(PDO::FETCH_ASSOC);
    // $commonditystmt = $pdo->prepare("SELECT * FROM trucktotalcosting WHERE id='$id'");
    // $commonditystmt->execute();
    // $commondity = $commonditystmt->fetch(PDO::FETCH_ASSOC);
    // $ygntomt = $ygntomt / $totalcosting['total_kg'];
    // $mttotechnck = $mttotechnck / $totalcosting['total_kg'];
    if (!empty($ygntomt) && !empty($mttotechnck)) {
      $packingandtransport = $packing_charges + floatval($ygntomt) + floatval($mttotechnck) + $labour_charges;
      $updatestmt = $pdo->prepare("UPDATE trucktotalcosting SET mtorst='$mtorst', ygntomtorst_charges='$ygntomt', mtorsttotechnck_charges='$mttotechnck', packingandtransport='$packingandtransport' WHERE id='$id'");
      $updatestmt->execute();
    } else {
      $packingandtransport = $packing_charges + floatval($ygntost) + floatval($sttotechnck) + $labour_charges;
      $updatestmt = $pdo->prepare("UPDATE trucktotalcosting SET mtorst='$mtorst', ygntomtorst_charges='$ygntost', mtorsttotechnck_charges='$sttotechnck', packingandtransport='$packingandtransport' WHERE id='$id'");
      $updatestmt->execute();
    }
    // if(str_contains($cal_percentage, '-')){
    //   $cal_percentage = explode("-", $cal_percentage);
    //   $cal_percentage = $cal_percentage[1];
    //   $packingandtransportsubtracted = $packingandtransport / floatval($cal_percentage);
    // }else{
    //   $packingandtransportsubtracted = $packingandtransport / $cal_percentage;
    // }

  }

  function updatesellingrate($selling_rate, $id, $size, $item_id, $invoice_no)
  {
    global $pdo;

    $sizestmt = $pdo->prepare("SELECT SUM(total_kg) AS total_kg FROM trucktotalcosting WHERE size='$size' AND item_id='$item_id'");
    $sizestmt->execute();
    $sizedata = $sizestmt->fetch(PDO::FETCH_ASSOC);

    $stmt = $pdo->prepare("SELECT * FROM trucktotalcosting WHERE id='$id'");
    $stmt->execute();
    $data = $stmt->fetch(PDO::FETCH_ASSOC);

    $total_kg = floatval($sizedata['total_kg']);
    $profitperkg = $selling_rate - $data['costing_usd'];
    $original_cost = floatval($sizedata['total_kg']) * $data['costing_usd'];
    $selling_amount = floatval($sizedata['total_kg']) * $selling_rate;
    $profit = $selling_amount - $original_cost;

    $invoicestmt = $pdo->prepare("SELECT * FROM truckactualinvoice WHERE invoice_no='$invoice_no' AND item_id='$item_id' AND size='$size'");
    $invoicestmt->execute();
    $invoicedata = $invoicestmt->fetch(PDO::FETCH_ASSOC);
    $kgperbox = $invoicedata['kgperbox'];
    $total_usd = $kgperbox * $selling_rate;

    $addusdstmt = $pdo->prepare("UPDATE truckactualinvoice SET usd='$selling_rate', total_usd='$total_usd' WHERE invoice_no='$invoice_no' AND item_id='$item_id' AND size='$size'");
    $addusdstmt->execute();
    $updatestmt = $pdo->prepare("UPDATE trucktotalcosting SET selling_rate='$selling_rate', profitperkg='$profitperkg', original_cost='$original_cost', selling_amount='$selling_amount', profit='$profit' WHERE id='$id'");
    $updatestmt->execute();
  }

  function updatetotal($total, $dollar_rate, $id, $item_id, $size, $invoice_no)
  {
    global $pdo;

    $datastmt = $pdo->prepare("SELECT * FROM trucktotalcosting WHERE item_id='$item_id' AND size='$size' AND invoice_no='$invoice_no' AND percentage != '0'");
    $datastmt->execute();
    $data = $datastmt->fetch(PDO::FETCH_ASSOC);

    $percentage = $data['percentage'];
    $grand_total = $percentage + $total;
    if ($dollar_rate != 0 && $grand_total != 0) {
      $costing_usd = $grand_total / $dollar_rate;
    } else {
      $costing_usd = 0;
    }

    $stmt = $pdo->prepare("UPDATE trucktotalcosting SET total='$total', grand_total='$grand_total', rate='$dollar_rate', costing_usd='$costing_usd' WHERE id='$id'");
    $stmt->execute();
  }

  function addactype($actype)
  {
    global $pdo;

    $accheckstmt = $pdo->prepare("SELECT * FROM actype WHERE ac_type='$actype'");
    $accheckstmt->execute();
    $accheck = $accheckstmt->fetchAll();

    $stmt = $pdo->prepare("INSERT INTO actype(ac_type) VALUES('$actype')");

    if (empty($accheck)) {
      $stmt->execute();
      echo "<script>swal('Success', 'Added A/C Type' , 'success')</script>";
    } else {
      echo "<script>swal('Error', 'Duplicate A/C Name' , 'error')</script>";
    }
  }

  function updateactype($actype, $id)
  {
    global $pdo;

    $accheckstmt = $pdo->prepare("SELECT * FROM actype WHERE ac_type='$actype'");
    $accheckstmt->execute();
    $accheck = $accheckstmt->fetchAll();

    $stmt = $pdo->prepare("UPDATE actype SET ac_type='$actype' WHERE acid = '$id'");

    if (empty($accheck)) {
      $stmt->execute();
      echo "<script>swal('Success', 'Updated A/C Type' , 'success')</script>";
    } else {
      echo "<script>swal('Error', 'Duplicate A/C Name' , 'error')</script>";
    }

    if ($stmt) {
      echo "<script>swal('Success', 'Updated A/C Type' , 'success')</script>";
    }
  }

  function deleteactype($id)
  {
    global $pdo;

    $stmt = $pdo->prepare("DELETE FROM actype WHERE acid = '$id'");
    $stmt->execute();
    if ($stmt) {
      echo "<script>swal('Success', 'Deleted A/C Type' , 'success')</script>";
    }
  }

  function addacname($code_no, $actype, $acname)
  {
    global $pdo;

    $accheckstmt = $pdo->prepare("SELECT * FROM acname WHERE code_no='$code_no'");
    $accheckstmt->execute();
    $accheck = $accheckstmt->fetchAll();

    $stmt = $pdo->prepare("INSERT INTO acname(code_no, ac_type, ac_name) VALUES('$code_no', '$actype', '$acname')");

    if (empty($accheck)) {
      echo "<script>swal('Success', 'Added A/C name' , 'success')</script>";
      $stmt->execute();
    } else {
      echo "<script>swal('Error', 'Duplicate A/C Code, Name' , 'error')</script>";
    }
  }

  function updateacname($code_no, $actype, $acname, $id)
  {
    global $pdo;

    $accheckstmt = $pdo->prepare("SELECT * FROM acname WHERE code_no='$code_no' AND id!='$id'");
    $accheckstmt->execute();
    $accheck = $accheckstmt->fetchAll();

    $stmt = $pdo->prepare("UPDATE acname SET code_no='$code_no', ac_type='$actype', ac_name='$acname' WHERE id = '$id'");

    if (empty($accheck)) {
      $stmt->execute();
      echo "<script>swal('Success', 'Updated A/C Name' , 'success')</script>";
    } else {
      echo "<script>swal('Error', 'Duplicate A/C Name' , 'error')</script>";
    }
  }

  function deleteacname($id)
  {
    global $pdo;

    $stmt = $pdo->prepare("DELETE FROM acname WHERE id = '$id'");
    $stmt->execute();
    if ($stmt) {
      echo "<script>swal('Success', 'Deleted A/C Type' , 'success')</script>";
    }
  }

  function savetransaction($date, $voucher_no, $ac_code, $description, $currency, $rate, $debit, $credit, $sr_no, $container_no, $bank_charges)
  {
    global $pdo;

    if ($currency == 'usd') {
      if ($bank_charges == 0) {
        $mmkdebit = floatval($rate) * floatval($debit);
        $mmkcredit = floatval($rate) * floatval($credit);
      } else {
        $mmkdebit = floatval($rate) * floatval($debit);
        $mmkcredit = floatval($rate) * floatval($credit);
      }
    } elseif ($currency == 'mmk') {
      $mmkdebit = $debit;
      $mmkcredit = $credit;
    }
    $transactionstmt = $pdo->prepare("INSERT INTO transaction(date, voucher_no, ac_code, description, debit, credit, currency, sr_no, container_no,bank_charges) VALUES('$date', :voucher_no, '$ac_code', :description, '$mmkdebit', '$mmkcredit', '$currency', '$sr_no', '$container_no', '$bank_charges')");

    $transactionstmt->execute(
      [
        ':voucher_no' => $voucher_no,
        ':description' => $description
      ]
    );

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

  function deletetransaction($id, $voucher_no)
  {
    global $pdo;

    $selectstmt = $pdo->prepare("SELECT * FROM transaction WHERE id='$id'");
    $selectstmt->execute();
    $selectdata = $selectstmt->fetch(PDO::FETCH_ASSOC);

    $stmt = $pdo->prepare("DELETE FROM transaction WHERE id='$id'");
    $stmt->execute();

    if ($selectdata['debit'] != 0) {
      $debitorcredit = 'debit';
      $debitcurrency = $pdo->prepare("DELETE FROM currency WHERE debitorcredit='$debitorcredit' AND voucher_no='$voucher_no' AND transactionid='$id'");
      $debitcurrency->execute();
    } elseif ($selectdata['credit'] != 0) {
      $debitorcredit = 'credit';
      $creditcurrency = $pdo->prepare("DELETE FROM currency WHERE debitorcredit='$debitorcredit' AND voucher_no='$voucher_no' AND transactionid='$id'");
      $creditcurrency->execute();
    }


    if ($stmt) {
      echo "<script>swal('Success', 'Deleted Transaction Successfully' , 'success')</script>";
      $_SESSION['adddate'] = "";
      $_SESSION['addvoucher_no'] = "";
      $_SESSION['addac_code'] = "";
      $_SESSION['ac_name'] = "";
      $_SESSION['description'] = "";
    }
  }

  function deleteedittransaction($id, $voucher_no)
  {
    global $pdo;

    $selectstmt = $pdo->prepare("SELECT * FROM transaction WHERE id='$id'");
    $selectstmt->execute();
    $selectdata = $selectstmt->fetch(PDO::FETCH_ASSOC);

    $stmt = $pdo->prepare("DELETE FROM transaction WHERE id='$id'");
    $stmt->execute();

    if ($selectdata['debit'] != 0) {
      $debitorcredit = 'debit';
      $debitcurrency = $pdo->prepare("DELETE FROM currency WHERE debitorcredit='$debitorcredit' AND voucher_no='$voucher_no' AND transactionid='$id'");
      $debitcurrency->execute();
    } elseif ($selectdata['credit'] != 0) {
      $debitorcredit = 'credit';
      $creditcurrency = $pdo->prepare("DELETE FROM currency WHERE debitorcredit='$debitorcredit' AND voucher_no='$voucher_no' AND transactionid='$id'");
      $creditcurrency->execute();
    }
    $ac_code = $selectdata['ac_code'];

    // Cashbook
    $deletesmt = $pdo->prepare("DELETE FROM cashbook WHERE transactionid='$id'");
    $deletesmt->execute();

    // Payable
    $payabledeletestmt = $pdo->prepare("DELETE FROM payable WHERE paid_voucher='$voucher_no' AND supplier_id='$ac_code'");
    $payabledeletestmt->execute();

    // Receivable
    $receivabledeletestmt = $pdo->prepare("DELETE FROM receivable WHERE transactionid='$id'");
    $receivabledeletestmt->execute();

    // general ledger
    $gldeletestmt = $pdo->prepare("DELETE FROM general_ledger WHERE transactionid='$id'");
    $gldeletestmt->execute();

    if ($stmt) {
      echo "<script>swal('Success', 'Deleted Transaction Successfully' , 'success')</script>";
      $_SESSION['adddate'] = "";
      $_SESSION['addvoucher_no'] = "";
      $_SESSION['addac_code'] = "";
      $_SESSION['ac_name'] = "";
      $_SESSION['description'] = "";
    }
  }

  function updatetransaction_fromtransaction($date, $voucher_no, $ac_code, $description, $currency, $rate, $debit, $credit, $id,  $sr_no, $container_no, $bank_charges)
  {
    global $pdo;

    if ($currency == 'usd') {
      $mmkdebit = floatval($rate) * floatval($debit);
      $mmkcredit = floatval($rate) * floatval($credit);
    } elseif ($currency == 'mmk') {
      $mmkdebit = $debit;
      $mmkcredit = $credit;
    }

    $transactionstmt = $pdo->prepare("UPDATE transaction SET date='$date', voucher_no=:voucher_no, ac_code='$ac_code', description=:description, debit='$mmkdebit', credit='$mmkcredit', currency='$currency', sr_no='$sr_no', container_no='$container_no', bank_charges='$bank_charges' WHERE id='$id'");
    $transactionstmt->execute(
      [
        ':voucher_no' => $voucher_no,
        ':description' => $description
      ]
    );

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
    $currencystmt = $pdo->prepare("UPDATE currency SET dollar_rate='$rate', debitorcredit='$debitorcredit', mmk_amount='$mmk_amount', usd_amount='$usd_amount', voucher_no=:voucher_no WHERE transactionid='$id'");
    $currencystmt->execute([
      ':voucher_no' => $voucher_no
    ]);
  }

  function updatetransaction_fromany($date, $voucher_no, $ac_code, $description, $currency, $rate, $debit, $credit, $id, $sr_no, $container_no, $bank_charges, $cash_id, $payableid)
  {
    global $pdo;

    if ($currency == 'usd') {
      $mmkdebit = floatval($rate) * floatval($debit);
      $mmkcredit = floatval($rate) * floatval($credit);
    } elseif ($currency == 'mmk') {
      $mmkdebit = $debit;
      $mmkcredit = $credit;
    }

    $transactionstmt = $pdo->prepare("UPDATE transaction SET date='$date', voucher_no=:voucher_no, ac_code='$ac_code', description=:description, debit='$mmkdebit', credit='$mmkcredit', currency='$currency', sr_no='$sr_no', container_no='$container_no', bank_charges='$bank_charges' WHERE id='$id'");
    $transactionstmt->execute(
      [
        ':voucher_no' => $voucher_no,
        ':description' => $description
      ]
    );

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
    $currencystmt = $pdo->prepare("UPDATE currency SET dollar_rate='$rate', debitorcredit='$debitorcredit', mmk_amount='$mmk_amount', usd_amount='$usd_amount', voucher_no=:voucher_no WHERE transactionid='$id'");
    $currencystmt->execute([
      ':voucher_no' => $voucher_no
    ]);

    if ($_GET['file'] == 'cashbook') {
      echo "CASHBOOK";

      // Cashbook Update
      $oldcashstmt = $pdo->prepare("SELECT * FROM cashbook WHERE transactionid<'$id' ORDER BY id DESC");
      $oldcashstmt->execute();
      $oldcashdata = $oldcashstmt->fetch(PDO::FETCH_ASSOC);

      $oldcashbalance = $oldcashdata['balance'];

      $balance = ($oldcashbalance + $mmkdebit) - $mmkcredit;

      // Cross acname process
      // echo $voucher_no;
      // echo "<br>";
      $oldcrossstmt = $pdo->prepare("SELECT * FROM transaction WHERE voucher_no=:voucher_no AND description LIKE '%***%'");
      $oldcrossstmt->execute(
        array(':voucher_no' => $voucher_no)
      );
      $crossac_name = $oldcrossstmt->fetch(PDO::FETCH_ASSOC);
      // print_r($crossac_name);

      if (!empty($crossac_name['ac_code'])) {
        echo $crossacname = $crossac_name['ac_code'];
      } else {
        $crossacname = '';
      }
      // Cross asname process
      $cashbookstmt = $pdo->prepare("UPDATE cashbook SET date='$date', voucher_no=:voucher_no, crossac_name='$crossacname', particular=:description, debit='$mmkdebit', credit='$mmkcredit', sr_no='$sr_no', balance='$balance' WHERE id='$cash_id'");
      $cashbookstmt->execute(
        [
          ':voucher_no' => $voucher_no,
          ':description' => $description
        ]
      );


      $updatestmt = $pdo->prepare("SELECT * FROM cashbook WHERE transactionid > '$id'");
      $updatestmt->execute();
      $updatedatas = $updatestmt->fetchAll();
      foreach ($updatedatas as $updatedata) {
        $updateid = $updatedata['id'];
        $updatastmt = $pdo->prepare("SELECT * FROM cashbook WHERE id < '$updateid' ORDER BY id DESC");
        $updatastmt->execute();
        $updata = $updatestmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($updata)) {
          $oldbalance = $updata['balance'];
          $newbalance = ($oldbalance + $mmkdebit) - $mmkcredit;
        } else {
          $oldbalance = 0;
          $newbalance = ($oldbalance + $mmkdebit) - $mmkcredit;
        }

        $updatecashbookstmt = $pdo->prepare("UPDATE cashbook SET balance='$newbalance' WHERE id='$updateid'");
        $updatecashbookstmt->execute();
      }

      // General Ledger Update
      $oldgeneralledgerstmt = $pdo->prepare("SELECT * FROM general_ledger WHERE ac_code='$ac_code' AND transactionid<'$id' ORDER BY id DESC");
      $oldgeneralledgerstmt->execute();
      $oldgeneralledgerdata = $oldgeneralledgerstmt->fetch(PDO::FETCH_ASSOC);
      $oldgeneralledgerbalance = $oldgeneralledgerdata['balance'];

      $balance = ($oldgeneralledgerbalance + $mmkdebit) - $mmkcredit;
      $cashbookstmt = $pdo->prepare("UPDATE general_ledger SET date='$date', voucherno=:voucher_no, ac_code='$ac_code', narration=:description, debit='$mmkdebit', credit='$mmkcredit', sr_no='$sr_no', container_no='$container_no', bank_charges='$bank_charges', balance='$balance' WHERE transactionid='$id'");
      $cashbookstmt->execute(
        [
          ':voucher_no' => $voucher_no,
          ':description' => $description
        ]
      );

      $upgeneralledgerstmt = $pdo->prepare("SELECT * FROM general_ledger WHERE transactionid > '$id' AND ac_code='$ac_code'");
      $upgeneralledgerstmt->execute();
      $upgeneralledgerdatas = $upgeneralledgerstmt->fetchall();
      foreach ($upgeneralledgerdatas as $upgeneralledgerdata) {
        $updateid = $upgeneralledgerdata['id'];
        $updateac_code = $upgeneralledgerdata['ac_code'];
        $updatedebit = $upgeneralledgerdata['debit'];
        $updatecredit = $upgeneralledgerdata['credit'];
        $updatestmt = $pdo->prepare("SELECT * FROM general_ledger WHERE ac_code='$updateac_code' AND id < '$updateid' ORDER BY id DESC");
        $updatestmt->execute();
        $updatedatas = $updatestmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($updatedatas)) {
          $oldbalance = $updatedatas['balance'];
          $newbalance = ($oldbalance + $updatedebit) - $updatecredit;
        } else {
          $oldbalance = 0;
          $newbalance = ($oldbalance + $updatedebit) - $updatecredit;
        }

        $updatestmt = $pdo->prepare("UPDATE general_ledger SET balance='$newbalance' WHERE id='$updateid'");
        $updatestmt->execute();
      }
    } elseif ($_GET['file'] == 'general_ledger') {
      // General Ledger Update
      $oldgeneralledgerstmt = $pdo->prepare("SELECT * FROM general_ledger WHERE ac_code='$ac_code' AND transactionid<'$id' ORDER BY id DESC");
      $oldgeneralledgerstmt->execute();
      $oldgeneralledgerdata = $oldgeneralledgerstmt->fetch(PDO::FETCH_ASSOC);
      $oldgeneralledgerbalance = $oldgeneralledgerdata['balance'];

      $balance = ($oldgeneralledgerbalance + $mmkdebit) - $mmkcredit;
      $cashbookstmt = $pdo->prepare("UPDATE general_ledger SET date='$date', voucherno=:voucher_no, ac_code='$ac_code', narration=:description, debit='$mmkdebit', credit='$mmkcredit', sr_no='$sr_no', container_no='$container_no', bank_charges='$bank_charges', balance='$balance' WHERE transactionid='$id'");
      $cashbookstmt->execute(
        [
          ':voucher_no' => $voucher_no,
          ':description' => $description
        ]
      );

      $upgeneralledgerstmt = $pdo->prepare("SELECT * FROM general_ledger WHERE transactionid > '$id' AND ac_code='$ac_code'");
      $upgeneralledgerstmt->execute();
      $upgeneralledgerdatas = $upgeneralledgerstmt->fetchall();
      foreach ($upgeneralledgerdatas as $upgeneralledgerdata) {
        $updateid = $upgeneralledgerdata['id'];
        $updateac_code = $upgeneralledgerdata['ac_code'];
        $updatedebit = $upgeneralledgerdata['debit'];
        $updatecredit = $upgeneralledgerdata['credit'];
        $updatestmt = $pdo->prepare("SELECT * FROM general_ledger WHERE ac_code='$updateac_code' AND id < '$updateid' ORDER BY id DESC");
        $updatestmt->execute();
        $updatedatas = $updatestmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($updatedatas)) {
          $oldbalance = $updatedatas['balance'];
          $newbalance = ($oldbalance + $updatedebit) - $updatecredit;
        } else {
          $oldbalance = 0;
          $newbalance = ($oldbalance + $updatedebit) - $updatecredit;
        }

        $updatestmt = $pdo->prepare("UPDATE general_ledger SET balance='$newbalance' WHERE id='$updateid'");
        $updatestmt->execute();
      }
      // General Ledger Update

      // Cashbook Update
      $oldcashstmt = $pdo->prepare("SELECT * FROM cashbook WHERE transactionid<'$id' ORDER BY id DESC");
      $oldcashstmt->execute();
      $oldcashdata = $oldcashstmt->fetch(PDO::FETCH_ASSOC);

      $oldcashbalance = $oldcashdata['balance'];

      $balance = ($oldcashbalance + $debit) - $credit;

      // Cross acname process
      $oldcrossstmt = $pdo->prepare("SELECT * FROM transaction WHERE voucher_no=:voucher_no AND description LIKE '%***%'");
      $oldcrossstmt->execute(
        array(':voucher_no' => $voucher_no)
      );
      $crossac_name = $oldcrossstmt->fetch(PDO::FETCH_ASSOC);
      if (!empty($crossac_name['ac_code'])) {
        $crossacname = $crossac_name['ac_code'];
      } else {
        $crossacname = '';
      }
      // Cross asname process
      $cashbookstmt = $pdo->prepare("UPDATE cashbook SET date='$date', voucher_no=:voucher_no, crossac_name='$crossacname', particular=:description, debit='$debit', credit='$credit', sr_no='$sr_no', balance='$balance' WHERE transactionid='$id'");
      $cashbookstmt->execute(
        [
          ':voucher_no' => $voucher_no,
          ':description' => $description
        ]
      );


      $updatestmt = $pdo->prepare("SELECT * FROM cashbook WHERE transactionid > '$id'");
      $updatestmt->execute();
      $updatedatas = $updatestmt->fetchAll();
      foreach ($updatedatas as $updatedata) {
        $updateid = $updatedata['id'];
        $updatastmt = $pdo->prepare("SELECT * FROM cashbook WHERE id < '$updateid' ORDER BY id DESC");
        $updatastmt->execute();
        $updata = $updatestmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($updata)) {
          $oldbalance = $updata['balance'];
          $newbalance = ($oldbalance + $mmkdebit) - $mmkcredit;
        } else {
          $oldbalance = 0;
          $newbalance = ($oldbalance + $mmkdebit) - $mmkcredit;
        }

        $updatecashbookstmt = $pdo->prepare("UPDATE cashbook SET balance='$newbalance' WHERE id='$updateid'");
        $updatecashbookstmt->execute();
      }
      // Cashbook Update

    } elseif ($_GET['file'] == 'payable') {

      //Payable Update
      $total_closingstmt = $pdo->prepare("SELECT SUM(closing_balance) AS balance FROM payable WHERE supplier_id='$ac_code' AND purchase_voucher_no = '' AND paid_voucher = ''");
      $total_closingstmt->execute();
      $total_closingdata = $total_closingstmt->fetch(PDO::FETCH_ASSOC);
      $total_closingdata = $total_closingdata['balance'];

      $total_purchase_amountstmt = $pdo->prepare("SELECT SUM(purchase_amount) AS total_purchase_amount FROM payable WHERE supplier_id='$ac_code' AND purchase_voucher_no != '0' AND paid_voucher = ''");
      $total_purchase_amountstmt->execute();
      $total_purchase_amountdata = $total_purchase_amountstmt->fetch(PDO::FETCH_ASSOC);
      $total_purchase_amount = $total_purchase_amountdata['total_purchase_amount'];

      $total_paid_amountstmt = $pdo->prepare("SELECT SUM(paid_amount) AS total_paid_amount FROM payable WHERE supplier_id='$ac_code' AND purchase_voucher_no != '0' AND paid_voucher != '0' AND id!='$payableid'");
      $total_paid_amountstmt->execute();
      $total_paid_amountdata = $total_paid_amountstmt->fetch(PDO::FETCH_ASSOC);
      $total_paid_amount = $total_paid_amountdata['total_paid_amount'];
      //
      $balance = (($total_closingdata + $total_purchase_amount) - $total_paid_amount) - $mmkdebit;
      // $balance = ($oldpayablebalance + $mmkdebit) - $mmkcredit;
      $payablestmt = $pdo->prepare("UPDATE payable SET paid_date='$date', paid_voucher=:voucher_no, supplier_id='$ac_code', remark=:description, paid_amount='$mmkdebit', balance='$balance' WHERE id='$payableid'");
      $payablestmt->execute(
        [
          ':voucher_no' => $voucher_no,
          ':description' => $description
        ]
      );


      //Payable Update
    }

    // // receivable Update
    // $oldreceivablestmt = $pdo->prepare("SELECT * FROM receivable WHERE ac_code='$ac_code' AND transactionid < '$id' ORDER BY id DESC");
    // $oldreceivablestmt->execute();
    // $oldreceivabledata = $oldreceivablestmt->fetch(PDO::FETCH_ASSOC);
    // $oldreceivablebalance = $oldreceivabledata['balance'];
    // $balance = ($oldreceivablebalance + $mmkdebit) - $mmkcredit;
    // if (!empty($sr_no)) {
    //
    // }
    // $cashbookstmt = $pdo->prepare("UPDATE receivable SET date='$date', sr_no=:voucher_no, ac_code='$ac_code', remark=:description, invoice_amount='$mmkdebit', balance='$balance' WHERE voucher_no='$voucher_no'");
    // $cashbookstmt->execute(
    //   [
    //     ':voucher_no' => $voucher_no,
    //     ':description' => $description
    //   ]
    // );

    // Star removal

    if (str_contains($ac_code, '3600/')) {
      $starstmt = $pdo->prepare("SELECT * FROM transaction WHERE description LIKE '%***%'");
      $starstmt->execute();
      $stardata = $starstmt->fetch(PDO::FETCH_ASSOC);

      if (!empty($stardata['description'])) {
        $description = $stardata['description'];
        $transacid = $stardata['id'];
      } else {
        $description = '';
        $transacid = '';
      }
      $newdescription = str_replace('***', '', $description);
      $descriptionstmt = $pdo->prepare("UPDATE transaction SET description='$newdescription' WHERE id='$transacid'");
      $descriptionstmt->execute();
      $descriptionstmt = $pdo->prepare("UPDATE general_ledger SET narration='$newdescription' WHERE transactionid='$transacid'");
      $descriptionstmt->execute();
    }

    // Star removal

  }

  function accepttransaction($date)
  {
    global $pdo;

    // General Ledger
    $transactionstmt = $pdo->prepare("SELECT * FROM transaction WHERE date='$date'");
    $transactionstmt->execute();
    $transactiondatas = $transactionstmt->fetchall();
    foreach ($transactiondatas as $transactiondata) {
      $transactionid = $transactiondata['id'];
      $ac_code = $transactiondata['ac_code'];
      $voucher_no = $transactiondata['voucher_no'];
      $description = $transactiondata['description'];
      if (empty($transactiondata['debit'])) {
        $dollarratestmt = $pdo->prepare("SELECT * FROM currency WHERE voucher_no=:voucher_no AND debitorcredit='credit' AND transactionid='$transactionid'");
        $dollarratestmt->execute([
          ':voucher_no' => $voucher_no
        ]);
        $dollarrate = $dollarratestmt->fetch(PDO::FETCH_ASSOC);
        if (empty($dollarrate['dollar_rate']) || $dollarrate['dollar_rate'] == 0) {
          $dollarrate = 1;
        } else {
          $dollarrate = $dollarrate['dollar_rate'];
        }

        if (!str_contains($transactiondata['ac_code'], '3600/') && !str_contains($transactiondata['ac_code'], '3700/003')) {
          if ($transactiondata['bank_charges'] != 0) {
            $credit = ($transactiondata['credit'] / $dollarrate) - ($transactiondata['bank_charges'] * $dollarrate);
            $debit = 0;
          } else {
            $credit = ($transactiondata['credit'] / $dollarrate);
            $debit = 0;
          }
        } else {
          if ($transactiondata['bank_charges'] != 0) {
            $credit = $transactiondata['credit'] - ($transactiondata['bank_charges'] * $dollarrate);
            $debit = 0;
          } else {
            $credit = $transactiondata['credit'];
            $debit = 0;
          }
        }
      } else {

        $dollarratestmt = $pdo->prepare("SELECT * FROM currency WHERE voucher_no=:voucher_no AND debitorcredit='debit' AND transactionid='$transactionid'");
        $dollarratestmt->execute([
          ':voucher_no' => $voucher_no
        ]);
        $dollarrate = $dollarratestmt->fetch(PDO::FETCH_ASSOC);
        if (empty($dollarrate['dollar_rate']) || $dollarrate['dollar_rate'] == 0) {
          $dollarrate = 1;
        } else {
          $dollarrate = $dollarrate['dollar_rate'];
        }
        if (!str_contains($transactiondata['ac_code'], '3600/') && !str_contains($transactiondata['ac_code'], '3700/003')) {
          if ($transactiondata['bank_charges'] != 0) {
            $debit = ($transactiondata['debit'] / $dollarrate) - ($transactiondata['bank_charges'] * $dollarrate);
            $credit = 0;
          } else {
            $debit = ($transactiondata['debit'] / $dollarrate);
            $credit = 0;
          }
        } else {
          if ($transactiondata['bank_charges'] != 0) {
            $debit = $transactiondata['debit'] - ($transactiondata['bank_charges'] * $dollarrate);
            $credit = 0;
          } else {
            $debit = $transactiondata['debit'];
            $credit = 0;
          }
        }
      }
      $sr_no = $transactiondata['sr_no'];
      $container_no = $transactiondata['container_no'];
      $bank_charges = $transactiondata['bank_charges'];
      $actypestmt = $pdo->prepare("SELECT * FROM acname WHERE code_no='$ac_code'");
      $actypestmt->execute();
      $acid = $actypestmt->fetch(PDO::FETCH_ASSOC);
      $acid = $acid['ac_type'];

      $balancestmt = $pdo->prepare("SELECT * FROM general_ledger WHERE ac_code='$ac_code' ORDER BY id DESC");
      $balancestmt->execute();
      $balancedata = $balancestmt->fetch(PDO::FETCH_ASSOC);
      if (!empty($balancedata['balance'])) {
        $balance = ($balancedata['balance'] + $debit) - $credit;
      } else {
        // if($debit != 0){
        //   $balance = $debit;
        // }else{
        //   $balance = 0 - $credit;
        // }
        $balance = $debit - $credit;
      }

      $generalledgerstmt = $pdo->prepare("INSERT INTO general_ledger(date, voucherno, ac_code, debit, credit, balance, narration,sr_no, container_no, bank_charges, acid, transactionid) VALUES('$date',:voucher_no,'$ac_code', '$debit', '$credit', '$balance', :description, '$sr_no', '$container_no', '$bank_charges', '$acid', '$transactionid')");

      $checkglstmt = $pdo->prepare("SELECT * FROM general_ledger WHERE transactionid=:transactionid AND ac_code='$ac_code'");
      $checkglstmt->execute([
        ':transactionid' => $transactionid
      ]);
      $checkgl = $checkglstmt->fetchall();
      if (empty($checkgl)) {
        $generalledgerstmt->execute([
          ':voucher_no' => $voucher_no,
          ':description' => $description
        ]);
      }

      echo "<script>swal('Success', 'Accepted Successfully', 'success');</script>";
    }

    // Receivable
    $stmt = $pdo->prepare("SELECT * FROM transaction WHERE date='$date' AND ac_code LIKE '3300%'");
    $stmt->execute();
    $receivabledatas = $stmt->fetchall();
    foreach ($receivabledatas as $receivabledata) {
      $transactionid = $receivabledata['id'];
      $ac_code = $receivabledata['ac_code'];
      $voucher_no = $receivabledata['voucher_no'];
      $description = $receivabledata['description'];
      if ($receivabledata['debit'] != 0) {
        $debitorcredit = 'debit';
        $currencystmt = $pdo->prepare("SELECT * FROM currency WHERE voucher_no=:voucher_no AND debitorcredit='$debitorcredit' AND transactionid='$transactionid'");
        $currencystmt->execute([
          ':voucher_no' => $voucher_no,
        ]);
        $currencydata = $currencystmt->fetch(PDO::FETCH_ASSOC);
        print_r($currencydata);
        if (!empty($currencydata)) {
          $invoice_amount = $currencydata['usd_amount'];
        } else {
          $invoice_amount = 0;
        }
        $receivestmt = $pdo->prepare("SELECT * FROM receivable WHERE ac_code='$ac_code' ORDER BY id DESC");
        $receivestmt->execute();
        $receivedata = $receivestmt->fetch(PDO::FETCH_ASSOC);
        $sr_no = $receivabledata['sr_no'];
        $container_no = $receivabledata['container_no'];

        if (!empty($receivedata['balance'])) {
          $balance = $receivedata['balance'] + $invoice_amount;
        } else {
          $balance = $invoice_amount;
        }

        $receivestmt = $pdo->prepare("INSERT INTO receivable(date, ac_code, sr_no, container_no, invoice_amount, balance, transactionid) VALUES('$date', '$ac_code', '$sr_no', '$container_no', '$invoice_amount', '$balance', '$transactionid')");
        $checkresrstmt = $pdo->prepare("SELECT * FROM receivable WHERE sr_no='$sr_no'");
        $checkresrstmt->execute();
        $checkresr = $checkresrstmt->fetchall();
        if (empty($checkresr)) {
          $receivestmt->execute();
        }
      } elseif ($receivabledata['credit'] != 0) {
        $debitorcredit = 'credit';
        $currencystmt = $pdo->prepare("SELECT * FROM currency WHERE voucher_no=:voucher_no AND debitorcredit='$debitorcredit' AND transactionid='$transactionid'");
        $currencystmt->execute([
          ':voucher_no' => $voucher_no
        ]);
        $currencydata = $currencystmt->fetch(PDO::FETCH_ASSOC);
        $receivestmt = $pdo->prepare("SELECT * FROM receivable WHERE ac_code='$ac_code' and transactionid<'$transactionid' ORDER BY id DESC");
        $receivestmt->execute();
        $receivedata = $receivestmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($currencydata['usd_amount'])) {
          $paid_amount = $currencydata['usd_amount'];
        } else {
          $paid_amount = 0;
        }
        if (!empty($receivedata['balance'])) {
          $balance = $receivedata['balance'];

          if (!empty($receivedata['balance'])) {
            $balance = $balance - floatval($paid_amount);
          } else {
            $balance = 0;
          }
        } else {
          $invoice_amount = 0;
          $balance = $invoice_amount - $paid_amount;
        }
        $receiveinsertstmt = $pdo->prepare("INSERT INTO receivable(ac_code, paid_date, payment_no, particulars, paid_amount, balance, transactionid) VALUES('$ac_code', '$date', :voucher_no, '$description', '$paid_amount', '$balance', '$transactionid')");
        $checkrestmt = $pdo->prepare("SELECT * FROM receivable WHERE transactionid=:transactionid");
        $checkrestmt->execute([
          ':transactionid' => $transactionid
        ]);
        $checkre = $checkrestmt->fetchall();
        if (empty($checkre)) {
          $receiveinsertstmt->execute([
            ':voucher_no' => $voucher_no
          ]);
        }
      }
    }

    // Payable
    $stmt = $pdo->prepare("SELECT * FROM transaction WHERE date='$date' AND ac_code LIKE '4000%'");
    $stmt->execute();
    $payabledatas = $stmt->fetchall();
    foreach ($payabledatas as $payabledata) {
      $supplier_id = $payabledata['ac_code'];
      $voucher_no = $payabledata['voucher_no'];
      if ($payabledata['debit'] != 0) {
        $paid_amount = $payabledata['debit'];
        $description = $payabledata['description'];

        $payabledatastmt = $pdo->prepare("SELECT * FROM payable WHERE supplier_id='$supplier_id' ORDER BY id DESC");
        $payabledatastmt->execute();
        $payablesearchdata = $payabledatastmt->fetch(PDO::FETCH_ASSOC);



        $closingbalancestmt = $pdo->prepare("SELECT * FROM payable WHERE supplier_id='$supplier_id' AND purchase_voucher_no = '' ORDER BY id DESC");
        $closingbalancestmt->execute();
        $closingbalance = $closingbalancestmt->fetch(PDO::FETCH_ASSOC);
        $randnom = rand(10, 999999999);
        // COUNT HAVE ERROR IN THE FUTURE IF THE RANDOM NUMBER IS DUPLICATING IN THE SAME VOUCHER ROW
        if (!empty($payablesearchdata)) {
          if (empty($closingbalance['closing_balance'])) {
            $closingbalance = 0;
          } else {
            $closingbalance = $closingbalance['closing_balance'];
          }
          $balance = $closingbalance + $payablesearchdata['balance'] - $paid_amount;
          $payablestmt = $pdo->prepare("INSERT INTO payable(supplier_id, purchase_voucher_no, paid_date, paid_voucher, remark, paid_amount, balance) VALUES('$supplier_id', '$randnom', '$date', :voucher_no, '$description', '$paid_amount', '$balance')");
        } else {
          $balance = 0;
          $payablestmt = $pdo->prepare("INSERT INTO payable(supplier_id, purchase_voucher_no, paid_date, paid_voucher, remark, paid_amount, balance) VALUES('$supplier_id', '$randnom', '$date', :voucher_no, '$description', '$paid_amount', '$balance')");
        }
      } else {
        $addamt = $payabledata['credit'];
        $description = $payabledata['description'];

        $payabledatastmt = $pdo->prepare("SELECT * FROM payable WHERE supplier_id='$supplier_id' ORDER BY id DESC");
        $payabledatastmt->execute();
        $payablesearchdata = $payabledatastmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($payablesearchdata)) {
          $balance = $payabledata['credit'];
          $payablestmt = $pdo->prepare("INSERT INTO payable(supplier_id, purchase_voucher_no, purchase_amount, balance) VALUES('$supplier_id', :voucher_no, '$addamt', '$balance')");
        } else {
          $balance = 0;
          $payablestmt = $pdo->prepare("INSERT INTO payable(supplier_id, purchase_voucher_no, purchase_amount, balance) VALUES('$supplier_id', :voucher_no, '$addamt', '$balance')");
        }
      }

      $checkapstmt = $pdo->prepare("SELECT * FROM payable WHERE paid_voucher=:voucher_no");
      $checkapstmt->execute([
        ':voucher_no' => $voucher_no
      ]);
      $checkap = $checkapstmt->fetchall();
      if (empty($checkap)) {
        $payablestmt->execute([
          ':voucher_no' => $voucher_no
        ]);
      }
    }

    // Cash Book
    $stmt = $pdo->prepare("SELECT * FROM transaction WHERE date='$date' AND ac_code LIKE '3600%'");
    $stmt->execute();
    $cashbookdatas = $stmt->fetchall();
    foreach ($cashbookdatas as $cashbookdata) {
      $transactionid = $cashbookdata['id'];
      $ac_name = $cashbookdata['ac_code'];
      $sr_no = $cashbookdata['sr_no'];
      $voucher_no = $cashbookdata['voucher_no'];
      // $crossid = $cashbookdata['id'] + 1;
      // $crossacnamestmt = $pdo->prepare("SELECT ac_code FROM transaction WHERE voucher_no=:voucher_no AND id = '$crossid' AND ac_code NOT LIKE '3600%'");
      // $crossacnamestmt->execute(
      //   array(':voucher_no' => $voucher_no)
      // );
      // $oldcrossstmt = $pdo->prepare("SELECT * FROM cashbook WHERE voucher_no=:voucher_no ORDER BY id DESC");
      // $oldcrossstmt->execute(
      //   array(':voucher_no' => $voucher_no)
      // );
      // $oldcrossdata = $oldcrossstmt->fetch(PDO::FETCH_ASSOC);
      // if (!empty($oldcrossdata)) {
      //   $crossacname = $oldcrossdata['crossac_name'];
      // }else{
      $beforetransactionid = $transactionid - 1;
      $oldcrossstmt = $pdo->prepare("SELECT * FROM transaction WHERE voucher_no=:voucher_no AND ac_code NOT LIKE '3600%' ORDER BY id DESC");
      $oldcrossstmt->execute(
        array(':voucher_no' => $voucher_no)
      );
      $crossac_name = $oldcrossstmt->fetch(PDO::FETCH_ASSOC);
      if (!empty($crossac_name)) {
        $crossacname = $crossac_name['ac_code'];
      }
      // }
      // $crossacnamestmt = $pdo->prepare("SELECT ac_code FROM transaction WHERE voucher_no=:voucher_no AND ac_code != '$oldcrossname' AND ac_code NOT LIKE '3600%'");
      // $crossacnamestmt->execute(
      //   array(':voucher_no' => $voucher_no)
      // );
      // $crossacnamerowcount = $crossacnamestmt->rowcount();
      // $crossacname = $crossac_name[$i]['ac_code'];

      $currencystmt = $pdo->prepare("SELECT * FROM currency WHERE voucher_no=:voucher_no AND transactionid='$transactionid'");
      $currencystmt->execute([
        ':voucher_no' => $voucher_no
      ]);
      $currencydata = $currencystmt->fetch(PDO::FETCH_ASSOC);
      if (!empty($cashbookdata['bank_charges'])) {
        $predebit = $currencydata['dollar_rate'] * $cashbookdata['bank_charges'];
        $debit = $cashbookdata['debit'] - $predebit;
      } else {
        $debit = $cashbookdata['debit'];
      }
      $credit = $cashbookdata['credit'];
      $description = $cashbookdata['description'];
      // $selectacnamestmt = $pdo->prepare("SELECT ac_code FROM transaction WHERE voucher_no='$voucher_no' AND id!='$id'");
      // $selectacnamestmt->execute();
      // $selectacname = $selectacnamestmt->fetch(PDO::FETCH_ASSOC);
      // $ac_code = $selectacname['ac_code'];
      //
      //
      // if(str_contains($ac_code, '4000')){
      //   $ac_code = 'Supplier';
      //    echo "sup";
      // }
      // if(str_contains($ac_code, '3300')){
      //    echo "cus";
      //   $ac_code = $selectacname['ac_code'];
      // }
      // if(str_contains($ac_code, '9100')){
      //    echo "expanse";
      //   $ac_code = $selectacname['ac_code'];
      // }
      //
      // $selectacnamestmt = $pdo->prepare("SELECT ac_code FROM transaction WHERE id='$id'");
      // $selectacnamestmt->execute();
      // $selectacname = $selectacnamestmt->fetch(PDO::FETCH_ASSOC);

      if ($cashbookdata['ac_code'] == '3600/001') {
        $payabledatastmt = $pdo->prepare("SELECT balance FROM cashbook WHERE ac_name='3600/001' AND date='$date' AND transactionid!='$transactionid' ORDER BY id DESC");
      } else {
        $payabledatastmt = $pdo->prepare("SELECT balance FROM cashbook WHERE ac_name='3600/002' AND date='$date' AND transactionid!='$transactionid' ORDER BY id DESC");
      }
      $payabledatastmt->execute();
      $cashbooksearchdata = $payabledatastmt->fetch(PDO::FETCH_ASSOC);
      if (!empty($cashbooksearchdata['balance'])) {
        $balance = $cashbooksearchdata['balance'];
      } else {
        $balance = 0;
      }
      $balance = ($balance + $debit) - $credit;
      // if(str_contains($crossacname, '3300/')){
      $checkcbstmt = $pdo->prepare("SELECT * FROM cashbook WHERE transactionid='$transactionid'");
      // }else{
      // $checkcbstmt = $pdo->prepare("SELECT * FROM cashbook WHERE voucher_no=:voucher_no AND crossac_name=:ac_name OR transactionid='$transactionid'");
      // }
      $checkcbstmt->execute();
      $checkcb = $checkcbstmt->fetchall();
      if (empty($checkcb)) {
        $cashbookstmt = $pdo->prepare("INSERT INTO cashbook(date, ac_name, particular, debit, credit, balance, voucher_no, crossac_name, transactionid) VALUES('$date', '$ac_name', :description, '$debit', '$credit', '$balance', :voucher_no, '$crossacname', '$transactionid')");
        $cashbookstmt->execute([
          ':voucher_no' => $voucher_no,
          ':description' => $description
        ]);
      }
    }

    $stmt = $pdo->prepare("UPDATE transaction SET status='accepted' WHERE status LIKE '%selected%'");
    $stmt->execute();
  }

  // DELETE ACCEPT
  function delaccepttransaction($date, $searchvoucher_no, $transactionid)
  {
    global $pdo;
    // General Ledger
    $accepterror = "";
    $transactionstmt = $pdo->prepare("SELECT * FROM transaction WHERE voucher_no=:voucher_no AND id='$transactionid'");
    $transactionstmt->execute([
      ':voucher_no' => $searchvoucher_no
    ]);
    $transactiondatas = $transactionstmt->fetchall();
    foreach ($transactiondatas as $transactiondata) {
      $ac_code = $transactiondata['ac_code'];
      $voucher_no = $transactiondata['voucher_no'];
      $description = $transactiondata['description'];
      if (empty($transactiondata['debit'])) {
        $debit = 0;
        $credit = $transactiondata['credit'];
        // $balance = $credit;
      } else {

        if ($transactiondata['bank_charges'] != 0) {
          $bankchargesstmt = $pdo->prepare("SELECT bank_charges FROM transaction WHERE ac_code='3300%'");
          $bankchargesstmt->execute();
          $bankchargesdata = $bankchargesstmt->fetch(PDO::FETCH_ASSOC);

          // Dollor Change
          $acselectstmt = $pdo->prepare("SELECT * FROM currency WHERE voucher_no=:voucher_no AND transaction='$transactionid'");
          $acselectstmt->execute([
            ':voucher_no' => $voucher_no
          ]);
          $rateselect = $acselectstmt->fetch(PDO::FETCH_ASSOC);
          $debit = $transactiondata['debit'] - ($transactiondata['bank_charges'] * $rateselect['dollar_rate']);
          $credit = 0;
        } else {
          $debit = $transactiondata['debit'];
          $credit = 0;
        }
        // $balance = $debit;
      }
      $sr_no = $transactiondata['sr_no'];
      $container_no = $transactiondata['container_no'];
      $bank_charges = $transactiondata['bank_charges'];
      $actypestmt = $pdo->prepare("SELECT * FROM acname WHERE code_no='$ac_code'");
      $actypestmt->execute();
      $acid = $actypestmt->fetch(PDO::FETCH_ASSOC);
      $acid = $acid['ac_type'];

      $balancestmt = $pdo->prepare("SELECT * FROM general_ledger WHERE ac_code='$ac_code' ORDER BY id DESC");
      $balancestmt->execute();
      $balancedata = $balancestmt->fetch(PDO::FETCH_ASSOC);
      if (!empty($balancedata['balance'])) {
        $balance = ($balancedata['balance'] + $debit) - $credit;
      } else {
        if ($debit != 0) {
          $balance = $debit;
        } else {
          $balance = 0 - $credit;
        }
      }
      $generalledgerstmt = $pdo->prepare("INSERT INTO general_ledger(date, voucherno, ac_code, debit, credit, balance, narration,sr_no, container_no, bank_charges, acid) VALUES('$date',:voucher_no,'$ac_code', '$debit', '$credit', '$balance', '$description', '$sr_no', '$container_no', '$bank_charges', '$acid')");
      $generalledgerstmt->execute([
        ':voucher_no' => $voucher_no
      ]);
      echo "<script>swal('Success', 'Accepted Successfully', 'success');</script>";
    }

    // Receivable
    $stmt = $pdo->prepare("SELECT * FROM transaction WHERE voucher_no=:voucher_no AND ac_code LIKE '3300%'");
    $stmt->execute([
      ':voucher_no' => $searchvoucher_no
    ]);
    $receivabledatas = $stmt->fetchall();
    foreach ($receivabledatas as $receivabledata) {
      $ac_code = $receivabledata['ac_code'];
      $voucher_no = $receivabledata['voucher_no'];
      $description = $receivabledata['description'];
      if ($receivabledata['debit'] != 0) {
        $debitorcredit = 'debit';
        $currencystmt = $pdo->prepare("SELECT * FROM currency WHERE voucher_no=:voucher_no AND debitorcredit='$debitorcredit'");
        $currencystmt->execute([
          ':voucher_no' => $searchvoucher_no
        ]);
        $currencydata = $currencystmt->fetch(PDO::FETCH_ASSOC);
        $receivestmt = $pdo->prepare("SELECT * FROM receivable ORDER BY id DESC");
        $receivestmt->execute();
        $receivedata = $receivestmt->fetch(PDO::FETCH_ASSOC);
        $invoice_amount = $currencydata['usd_amount'];
        $sr_no = $receivabledata['sr_no'];
        $container_no = $receivabledata['container_no'];
        $balance = $currencydata['usd_amount'];
        $receivestmt = $pdo->prepare("INSERT INTO receivable(date, ac_code, sr_no, container_no, invoice_amount, balance) VALUES('$date', '$ac_code', '$sr_no', :voucher_no, '$invoice_amount', '$balance')");
        $receivestmt->execute([
          ':voucher_no' => $voucher_no
        ]);
      } elseif ($receivabledata['credit'] != 0) {
        $debitorcredit = 'credit';
        $currencystmt = $pdo->prepare("SELECT * FROM currency WHERE voucher_no= AND debitorcredit='$debitorcredit'");
        $currencystmt->execute([
          ':voucher_no' => $voucher_no
        ]);
        $currencydata = $currencystmt->fetch(PDO::FETCH_ASSOC);
        $receivestmt = $pdo->prepare("SELECT * FROM receivable WHERE ac_code='$ac_code' ORDER BY id DESC");
        $receivestmt->execute();
        $receivedata = $receivestmt->fetch(PDO::FETCH_ASSOC);
        $paid_amount = $currencydata['usd_amount'];
        if (!empty($receivedata['invoice_amount'])) {
          $invoice_amount = $receivedata['invoice_amount'];
          if (!empty($receivedata['balance'])) {
            $balance = floatval($receivedata['balance']) - floatval($paid_amount);
          } else {
            $balance = floatval($receivedata['balance'] + $invoice_amount) - floatval($paid_amount);
          }
        } else {
          $invoice_amount = 0;
        }
        $receivestmt = $pdo->prepare("INSERT INTO receivable(ac_code, paid_date, payment_no, particulars, paid_amount, balance) VALUES('$ac_code', '$date', :voucher_no, '$description', '$paid_amount', '$balance')");
        $receivestmt->execute([
          ':voucher_no' => $voucher_no
        ]);
      }
    }

    // Payable
    $stmt = $pdo->prepare("SELECT * FROM transaction WHERE voucher_no=:voucher_no AND ac_code LIKE '4000%'");
    $stmt->execute([
      ':voucher_no' => $searchvoucher_no
    ]);
    $payabledatas = $stmt->fetchall();
    foreach ($payabledatas as $payabledata) {
      $supplier_id = $payabledata['ac_code'];
      $voucher_no = $payabledata['voucher_no'];
      if ($payabledata['debit'] != 0) {
        $paid_amount = $payabledata['debit'];
        $description = $payabledata['description'];

        $payabledatastmt = $pdo->prepare("SELECT * FROM payable WHERE supplier_id='$supplier_id' ORDER BY id DESC");
        $payabledatastmt->execute();
        $payablesearchdata = $payabledatastmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($payablesearchdata)) {
          $balance = $payablesearchdata['balance'] - $paid_amount;
          $payablestmt = $pdo->prepare("INSERT INTO payable(supplier_id, paid_date, paid_voucher, remark, paid_amount, balance) VALUES('$supplier_id', '$date', :voucher_no, '$description', '$paid_amount', '$balance')");
        } else {
          $balance = 0;
          $payablestmt = $pdo->prepare("INSERT INTO payable(supplier_id, paid_date, paid_voucher, remark, paid_amount, balance) VALUES('$supplier_id', '$date', :voucher_no, '$description', '$paid_amount', '$balance')");
        }
      } else {
        $addamt = $payabledata['credit'];
        $description = $payabledata['description'];

        $payabledatastmt = $pdo->prepare("SELECT * FROM payable WHERE supplier_id='$supplier_id' ORDER BY id DESC");
        $payabledatastmt->execute();
        $payablesearchdata = $payabledatastmt->fetch(PDO::FETCH_ASSOC);
        if (!empty($payablesearchdata)) {
          $balance = $payabledata['credit'];
          $payablestmt = $pdo->prepare("INSERT INTO payable(supplier_id, purchase_voucher_no, purchase_amount, balance) VALUES('$supplier_id', :voucher_no, '$addamt', '$balance')");
        } else {
          $balance = 0;
          $payablestmt = $pdo->prepare("INSERT INTO payable(supplier_id, purchase_voucher_no, purchase_amount, balance) VALUES('$supplier_id', :voucher_no, '$addamt', '$balance')");
        }
      }
      $payablestmt->execute([
        ':voucher_no' => $voucher_no
      ]);
    }

    // Cash Book
    $stmt = $pdo->prepare("SELECT * FROM transaction WHERE voucher_no=:voucher_no AND ac_code LIKE '3600%'");
    $stmt->execute([
      ':voucher_no' => $searchvoucher_no
    ]);
    $cashbookdatas = $stmt->fetchall();
    foreach ($cashbookdatas as $cashbookdata) {
      $ac_name = $cashbookdata['ac_code'];
      $sr_no = $cashbookdata['sr_no'];
      $voucher_no = $cashbookdata['voucher_no'];
      $transaction_id = $cashbookdata['id'];
      $crossstmt = $pdo->prepare("SELECT * FROM transaction WHERE voucher_no=:voucher_no AND id != $transaction_id AND ac_code NOT LIKE '3600%'");
      $crossstmt->execute([
        ':voucher_no' => $voucher_no
      ]);
      $crossac_data = $crossstmt->fetch(PDO::FETCH_ASSOC);
      print_r($crossac_data);
      $crossac_name = $crossac_data['crossac_name'];
      $currencystmt = $pdo->prepare("SELECT * FROM currency WHERE voucher_no=:voucher_no");
      $currencystmt->execute([
        ':voucher_no' => $voucher_no
      ]);
      $currencydata = $currencystmt->fetch(PDO::FETCH_ASSOC);
      if (!empty($cashbookdata['bank_charges'])) {
        $predebit = $currencydata['dollar_rate'] * $cashbookdata['bank_charges'];
        $debit = $cashbookdata['debit'] - $predebit;
      } else {
        $debit = $cashbookdata['debit'];
      }
      $credit = $cashbookdata['credit'];
      $description = $cashbookdata['description'];
      // $selectacnamestmt = $pdo->prepare("SELECT ac_code FROM transaction WHERE voucher_no='$voucher_no' AND id!='$id'");
      // $selectacnamestmt->execute();
      // $selectacname = $selectacnamestmt->fetch(PDO::FETCH_ASSOC);
      // $ac_code = $selectacname['ac_code'];
      //
      //
      // if(str_contains($ac_code, '4000')){
      //   $ac_code = 'Supplier';
      //    echo "sup";
      // }
      // if(str_contains($ac_code, '3300')){
      //    echo "cus";
      //   $ac_code = $selectacname['ac_code'];
      // }
      // if(str_contains($ac_code, '9100')){
      //    echo "expanse";
      //   $ac_code = $selectacname['ac_code'];
      // }
      //
      // $selectacnamestmt = $pdo->prepare("SELECT ac_code FROM transaction WHERE id='$id'");
      // $selectacnamestmt->execute();
      // $selectacname = $selectacnamestmt->fetch(PDO::FETCH_ASSOC);

      if ($cashbookdata['ac_code'] == '3600/001') {
        $payabledatastmt = $pdo->prepare("SELECT balance FROM cashbook WHERE ac_name='3600/001' ORDER BY id DESC");
      } else {
        $payabledatastmt = $pdo->prepare("SELECT balance FROM cashbook WHERE ac_name='3600/002' ORDER BY id DESC");
      }
      $payabledatastmt->execute();
      $cashbooksearchdata = $payabledatastmt->fetch(PDO::FETCH_ASSOC);
      if (!empty($cashbooksearchdata['balance'])) {
        $balance = $cashbooksearchdata['balance'];
      } else {
        $balance = 0;
      }
      $balance = ($balance + $debit) - $credit;
      $cashbookstmt = $pdo->prepare("INSERT INTO cashbook(date, ac_name, particular, debit, credit, balance, voucher_no, crossac_name) VALUES('$date', '$ac_name', :description, '$debit', '$credit', '$balance', :voucher_no, '$crossac_name')");
      $cashbookstmt->execute([
        ':description' => $description,
        ':voucher_no' => $voucher_no
      ]);
    }
  }

  // DELOLD TRANSACTION
  function deloldtransaction($voucher_no, $transactionid)
  {
    global $pdo;
    // echo $voucher_no;
    echo $transactionid;

    $samedata_stmt = $pdo->prepare("SELECT * FROM transaction WHERE voucher_no='$voucher_no' AND id!='$transactionid'");
    $samedata_stmt->execute();
    $samedata_datas = $samedata_stmt->fetch(PDO::FETCH_ASSOC);
    print_r($samedata_datas);
    $sametransaction_id = $samedata_datas['id'];

    // DELETE GENERAL LEDGER
    $general_ledgerstmt = $pdo->prepare("SELECT * FROM general_ledger WHERE voucherno='$voucher_no' AND transactionid='$transactionid' OR transactionid='$sametransaction_id'");
    $general_ledgerstmt->execute();
    $general_ledgerdatas = $general_ledgerstmt->fetchall();
    print_r($general_ledgerdatas);
    foreach ($general_ledgerdatas as $general_ledgerdata) {
      if ($general_ledgerdata['debit'] != 0) {
        $generalledgerstmt = $pdo->prepare("DELETE FROM general_ledger WHERE voucherno='$voucher_no' AND transactionid='$transactionid' AND debit!=0");
        // $generalledgerstmt->execute();
      } elseif ($general_ledgerdata['credit'] != 0) {
        $generalledgerstmt = $pdo->prepare("DELETE FROM general_ledger WHERE voucherno='$voucher_no' AND transactionid='$transactionid' AND credit!=0");
        // $generalledgerstmt->execute();
      }
    }

    // DELETE RECEIVABLE
    $receivablestmt = $pdo->prepare("DELETE FROM receivable WHERE payment_no='$voucher_no' AND transactionid='$transactionid'");
    // $receivablestmt->execute();

    // DELETE PAYABLE
    $payablestmt = $pdo->prepare("DELETE FROM payable WHERE paid_voucher='$voucher_no'");
    // $payablestmt->execute();

    // DELETE CASHBOOK
    $cashbookstmt = $pdo->prepare("DELETE FROM cashbook WHERE voucher_no='$voucher_no' AND transactionid='$transactionid'");
    // $cashbookstmt->execute();
  }

  function addpaymentofreceivable($id, $paid_date, $payment_no, $particular, $paid_amount)
  {
    global $pdo;

    $receivestmt = $pdo->prepare("SELECT * FROM receivable WHERE id='$id'");
    $receivestmt->execute();
    $receivedata = $receivestmt->fetch(PDO::FETCH_ASSOC);

    $stmt = $pdo->prepare("SELECT balance FROM receivable WHERE id < '$id' ORDER BY id DESC");
    $stmt->execute();
    $data = $stmt->fetch(PDO::FETCH_ASSOC);
    if (!empty($data['balance'])) {
      $balance = ($data['balance'] + $receivedata['invoice_amount']) - $paid_amount;
    } else {
      $balance = (0 + $receivedata['invoice_amount']) - $paid_amount;
    }

    $paymentstmt = $pdo->prepare("UPDATE receivable SET paid_date='$paid_date', payment_no='$payment_no', particulars='$particular', paid_amount='$paid_amount', balance='$balance' WHERE id='$id'");
    $paymentstmt->execute();

    $updatecountstmt = $pdo->prepare("SELECT COUNT(id) FROM receivable WHERE id > '$id'");
    $updatecountstmt->execute();
    $loopcount = $updatecountstmt->fetchColumn();
    $upid = $id;
    if (!empty($loopcount)) {
      for ($i = 0; $i < $loopcount; $i++) {
        $upid++;
        $upstmt = $pdo->prepare("SELECT * FROM receivable WHERE id='$upid'");
        $upstmt->execute();
        $updata = $upstmt->fetch(PDO::FETCH_ASSOC);
        if (empty($updata['balance'])) {
          $balance = $updata['invoice_amount'] + $balance;
        } else {
          $balance = ($updata['invoice_amount'] + $balance) - $updata['paid_amount'];
        }
        $updatedownstmt = $pdo->prepare("UPDATE receivable SET balance='$balance' WHERE id='$upid'");
        $updatedownstmt->execute();
      }
    }
  }

  function searchgeneralledger($date_from, $date_to, $ac_code)
  {
    global $pdo;
    if (!empty($ac_code) && !empty($date_from) && !empty($date_to)) {
      $searchstmt = $pdo->prepare("SELECT * FROM general_ledger WHERE `date` BETWEEN '$date_from' AND '$date_to' AND ac_code='$ac_code'");
      $searchstmt->execute();
      return $searchdata = $searchstmt->fetchall();
    }
    if (!empty($ac_code) && empty($date_from) && empty($date_to)) {
      return $this->search('general_ledger', 'ac_code', $ac_code);
    }

    // DATE RANGE STUFF
    if (!empty($date_from) && !empty($date_to)) {
      $searchstmt = $pdo->prepare("SELECT * FROM general_ledger  WHERE `date` BETWEEN '$date_from' AND '$date_to'");
      $searchstmt->execute();
      return $searchdata = $searchstmt->fetchall();
    } elseif (!empty($date_from) || !empty($date_to)) {
      if (!empty($date_from)) {
        $searchstmt = $pdo->prepare("SELECT * FROM general_ledger WHERE `date`='$date_from'");
      } else {
        $searchstmt = $pdo->prepare("SELECT * FROM general_ledger WHERE `date`='$date_to' ");
      }
      $searchstmt->execute();
      return $searchdata = $searchstmt->fetchall();
    } elseif (!empty($date_from) || !empty($date_to) && !empty($ac_code)) {
      if (!empty($date_from) && !empty($ac_code)) {
        $searchstmt = $pdo->prepare("SELECT * FROM general_ledger WHERE `date`='$date_from' AND ac_code='$ac_code'");
      } elseif (!empty($date_to) && !empty($ac_code)) {
        $searchstmt = $pdo->prepare("SELECT * FROM general_ledger WHERE `date`='$date_to' AND ac_code='$ac_code'");
      }
      $searchstmt->execute();
      return $searchdata = $searchstmt->fetchall();
    } else {
      return $this->selectdbw('general_ledger', $date_from, $date_to);
    }
  }

  function selectledgerrecord($date_from, $date_to, $ac_code, $acid)
  {
    global $pdo;
    if ($ac_code != '' && !empty($date_from) && !empty($date_to)) {
      $searchstmt = $pdo->prepare("SELECT * FROM general_ledger WHERE `date` BETWEEN '$date_from' AND '$date_to' AND ac_code='$ac_code' AND `acid`='$acid'");
      $searchstmt->execute();
      return $searchdata = $searchstmt->fetchall();
    }
    if (!empty($date_from) && !empty($date_to) && $ac_code == '') {
      $searchstmt = $pdo->prepare("SELECT * FROM general_ledger  WHERE `date` BETWEEN '$date_from' AND '$date_to' AND `acid`='$acid'");
      $searchstmt->execute();
      return $searchdata = $searchstmt->fetchall();
    }
    //DATE RANGE STUFF
    if (!empty($date_from) || !empty($date_to) && $ac_code != '') {
      if (!empty($date_from) && !empty($ac_code)) {
        $searchstmt = $pdo->prepare("SELECT * FROM general_ledger WHERE `date`='$date_from' AND ac_code='$ac_code' AND `acid`='$acid'");
      } elseif (!empty($date_to) && $ac_code != '') {
        $searchstmt = $pdo->prepare("SELECT * FROM general_ledger WHERE `date`='$date_to' AND ac_code='$ac_code' AND `acid`='$acid'");
      }
      $searchstmt->execute();
      return $searchdata = $searchstmt->fetchall();
    }
    if (!empty($date_from) || !empty($date_to)) {
      if (!empty($date_from)) {
        $searchstmt = $pdo->prepare("SELECT * FROM general_ledger WHERE `date`='$date_from' AND `acid`='$acid'");
      } else {
        $searchstmt = $pdo->prepare("SELECT * FROM general_ledger WHERE `date`='$date_to' AND `acid`='$acid' ");
      }
      $searchstmt->execute();
      return $searchdata = $searchstmt->fetchall();
    }
    if ($ac_code != '' && empty($date_from) && empty($date_to)) {
      return $this->search('general_ledger', 'ac_code', $ac_code);
    } else {
      return $this->selectdbw('general_ledger', $date_from, $date_to);
      // $searchstmt->execute();
      // return $searchdata = $searchstmt->fetchall();
    }
  }

  // function payablereport(){
  //  global $pdo;
  //
  //  $payablesuppliers = $this->selectdis('payable', 'supplier_id');
  //  foreach ($payablesuppliers as $payablesupplier) {
  //    $date = date('Y-m-d');
  //    $supplier_id = $payablesupplier['supplier_id'];
  //    $payablestmt = $pdo->prepare("SELECT * FROM payable WHERE supplier_id='$supplier_id'");
  //    $payablestmt->execute();
  //    $payabledata = $payablestmt->fetch(PDO::FETCH_ASSOC);
  //
  //    $idofrow = $payabledata['id'];
  //    $openingamountstmt = $pdo->prepare("SELECT balance FROM payable WHERE supplier_id='$supplier_id' AND id < '$idofrow' AND report_date!='0000-00-00' ORDER BY id DESC");
  //    $openingamountstmt->execute();
  //    $openingamount = $openingamountstmt->fetch(PDO::FETCH_ASSOC);
  //
  //    $purchaseamtstmt = $pdo->prepare("SELECT SUM(purchase_amount) AS purchase_amount FROM payable WHERE supplier_id='$supplier_id'");
  //    $purchaseamtstmt->execute();
  //    $purchaseamt = $purchaseamtstmt->fetch(PDO::FETCH_ASSOC);
  //
  //    $paidamtstmt = $pdo->prepare("SELECT SUM(paid_amount) AS paid_amount FROM payable WHERE supplier_id='$supplier_id'");
  //    $paidamtstmt->execute();
  //    $paidamt = $paidamtstmt->fetch(PDO::FETCH_ASSOC);
  //    if (!empty($openingamount['balance'])) {
  //      $openingamt = $openingamount['balance'];
  //    }else{
  //      $openingamt = 0;
  //    }
  //    $closing_balance =  ($openingamt + $purchaseamt['purchase_amount']) - $paidamt['paid_amount'];
  //    $payableid = $payabledata['id'];
  //    $payablereportstmt = $pdo->prepare("UPDATE payable SET closing_balance='$closing_balance',  report_date='$date' WHERE id='$payableid'");
  //    $payablereportstmt->execute();
  //  }
  // }

  function addopeningamount($openingamount)
  {
    global $pdo;

    $stmt = $pdo->prepare("INSERT INTO gfctotal(balance_amount) VALUES('$openingamount')");
    $stmt->execute();
  }

  function addremarkmonthly($table, $remark, $id)
  {
    global $pdo;

    $stmt = $pdo->prepare("UPDATE $table SET remark='$remark' WHERE id='$id'");
    $stmt->execute();
  }

  function updateform10($updateid, $newdate, $upitem_id, $upsupplier_id, $upcountry, $uptype, $upsize, $upmc, $upkg, $uppcs, $uplooseinkg, $uplooseinpcs, $uplooseoutkg, $uplooseoutpcs)
  {
    global $pdo;

    $total_kg = (floatval($upkg) + floatval($uplooseinkg)) - floatval($uplooseoutkg);
    $updateform10pcs = (floatval($uppcs) + floatval($uplooseinpcs)) - floatval($uplooseoutpcs);
    $updateform10stmt = $pdo->prepare("UPDATE form10stock SET date='$newdate', item_id='$upitem_id', supplier_id='$upsupplier_id', country='$upcountry', type='$uptype', size='$upsize',pcsform10='$updateform10pcs', mc='$upmc', kg='$upkg', pcs='$uppcs', looseinkg='$uplooseinkg', looseinpcs='$uplooseinpcs', looseoutkg='$uplooseoutkg', looseoutpcs='$uplooseoutpcs', total_kg='$total_kg' WHERE id='$updateid'");
    $updateform10stmt->execute();
  }

  function updateform10tcl($updateid, $newdate, $upitem_id, $upcountry, $upsize, $upmc, $upkg, $uppcs, $uplooseinkg, $uplooseinpcs, $uplooseoutkg, $uplooseoutpcs)
  {
    global $pdo;

    $total_kg = (floatval($upkg) + floatval($uplooseinkg)) - floatval($uplooseoutkg);
    $updateform10pcs = (floatval($uppcs) + floatval($uplooseinpcs)) - floatval($uplooseoutpcs);
    $updateform10stmt = $pdo->prepare("UPDATE form10stocktcl SET date='$newdate', item_id='$upitem_id', country='$upcountry', type='TCL', size='$upsize',pcsform10='$updateform10pcs', mc='$upmc', kg='$upkg', pcs='$uppcs', looseinkg='$uplooseinkg', looseinpcs='$uplooseinpcs', looseoutkg='$uplooseoutkg', looseoutpcs='$uplooseoutpcs', total_kg='$total_kg' WHERE id='$updateid'");
    $updateform10stmt->execute();
  }

  function addhhkremark($remark, $remarkid)
  {
    global $pdo;

    $addremarkstmt = $pdo->prepare("UPDATE total_charges SET remark='$remark' WHERE id='$remarkid'");
    $addremarkstmt->execute();
  }

  function updatehhkstock($indate, $commondity_id, $mc, $kg, $updateid)
  {
    global $pdo;

    $kgcheck = $pdo->prepare("SELECT SUM(kg) AS kg FROM hhkstock WHERE outdate!='0000-00-00' AND commondity_id='$commondity_id'");
    $kgcheck->execute();
    $totalkg = $kgcheck->fetch(PDO::FETCH_ASSOC);

    $mccheck = $pdo->prepare("SELECT SUM(mc) AS mc FROM hhkstock WHERE outdate!='0000-00-00' AND commondity_id='$commondity_id'");
    $mccheck->execute();
    $totalmc = $mccheck->fetch(PDO::FETCH_ASSOC);

    if ($totalkg['kg'] <= $kg && $totalmc['mc'] <= $mc) {
      $oldstockstmt = $pdo->prepare("SELECT * FROM hhkstock WHERE id < '$updateid' AND commondity_id='$commondity_id' AND outdate='0000-00-00' ORDER BY id DESC");
      $oldstockstmt->execute();
      $oldstockdatas = $oldstockstmt->fetch(PDO::FETCH_ASSOC);

      if (!empty($oldstockdatas)) {
        $total_mc = $oldstockdatas['total_mc'] + $mc;
        $total_kg = $oldstockdatas['total_kg'] + $kg;
      } else {
        $total_mc = $mc;
        $total_kg = $kg;
      }

      $stmt = $pdo->prepare("UPDATE hhkstock SET indate='$indate', commondity_id='$commondity_id', mc='$mc', kg='$kg', total_mc='$total_mc', total_kg='$total_kg' WHERE id='$updateid'");
      $stmt->execute();

      //stock update
      $stockupstmt = $pdo->prepare("SELECT * FROM hhkstock WHERE id > '$updateid' AND commondity_id='$commondity_id' AND outdate='0000-00-00'");
      $stockupstmt->execute();
      $stockupdatas = $stockupstmt->fetchall();
      foreach ($stockupdatas as $stockupdata) {
        $id = $stockupdata['id'];
        $stmt = $pdo->prepare("SELECT * FROM hhkstock WHERE id < '$id' ORDER BY id DESC");
        $stmt->execute();
        $data = $stmt->fetch(PDO::FETCH_ASSOC);
        $totalmc = $data['total_mc'] + $stockupdata['mc'];
        $totalkg = $data['total_kg'] + $stockupdata['kg'];
        $updatestmt = $pdo->prepare("UPDATE hhkstock SET total_mc='$totalmc', total_kg='$totalkg' WHERE id='$id'");
        $updatestmt->execute();
      }
    } else {
      echo "<script>swal('Warning!', 'out kg and mc is more than changed kg and mc', 'warning');</script>";
    }
  }

  function deletehhkstock($updateid)
  {
    global $pdo;

    $stmt = $pdo->prepare("SELECT * FROM hhkstock WHERE id='$updateid'");
    $stmt->execute();
    $data = $stmt->fetch(PDO::FETCH_ASSOC);
    $commondity_id = $data['commondity_id'];


    $deletehhkstockstmt = $pdo->prepare("DELETE FROM hhkstock WHERE id='$updateid'");
    $deletehhkstockstmt->execute();

    //stock update (1)
    $stockupstmt = $pdo->prepare("SELECT * FROM hhkstock WHERE id > '$updateid' AND commondity_id='$commondity_id' AND outdate='0000-00-00' LIMIT 1");
    $stockupstmt->execute();
    $stockupdata = $stockupstmt->fetch(PDO::FETCH_ASSOC);
    if (!empty($stockupdata)) {
      $oneid = $stockupdata['id'];
      $stmt = $pdo->prepare("SELECT * FROM hhkstock WHERE id='$oneid'");
      $stmt->execute();
      $data = $stmt->fetch(PDO::FETCH_ASSOC);
      $totalmc = $data['mc'];
      $totalkg = $data['kg'];
      $updatestmt = $pdo->prepare("UPDATE hhkstock SET total_mc='$totalmc', total_kg='$totalkg' WHERE id='$oneid'");
      $updatestmt->execute();
    }

    //All stock update
    $stockallupstmt = $pdo->prepare("SELECT * FROM hhkstock WHERE id > '$updateid' AND commondity_id='$commondity_id' AND outdate='0000-00-00'");
    $stockallupstmt->execute();
    $stockallupdatas = $stockallupstmt->fetchall();
    foreach ($stockallupdatas as $stockallupdata) {
      $id = $stockallupdata['id'];
      $stmt = $pdo->prepare("SELECT * FROM hhkstock WHERE id < '$id' AND commondity_id='$commondity_id' AND outdate='0000-00-00' ORDER BY id DESC");
      $stmt->execute();
      $data = $stmt->fetch(PDO::FETCH_ASSOC);
      if (!empty($data)) {
        $totalmc = $data['total_mc'] + $stockallupdata['mc'];
        $totalkg = $data['total_kg'] + $stockallupdata['kg'];
        $updatestmt = $pdo->prepare("UPDATE hhkstock SET total_mc='$totalmc', total_kg='$totalkg' WHERE id='$id'");
        $updatestmt->execute();
      }
    }
  }

  function deletefish($deletedate)
  {
    global $pdo;

    $stmt = $pdo->prepare("DELETE FROM gfcfishcoldstore WHERE date>='$deletedate'");
    $stmt->execute();

    $stmt = $pdo->prepare("DELETE FROM gfcfishlabour WHERE date>='$deletedate'");
    $stmt->execute();
  }

  function deletedryfish($deletedate)
  {
    global $pdo;

    $stmt = $pdo->prepare("DELETE FROM gfcdryfishcoldstore WHERE date>='$deletedate'");
    $stmt->execute();

    $stmt = $pdo->prepare("DELETE FROM gfcdryfishlabour WHERE date>='$deletedate'");
    $stmt->execute();
  }

  function edithhkmcstockremark($remark, $updateid)
  {
    global $pdo;

    $stmt = $pdo->prepare("UPDATE hhkmcstock SET remark='$remark' WHERE id='$updateid'");
    $stmt->execute();
  }

  function edithhkmcstocklooseinorout($loosein_size, $loosein_kg, $looseout_size, $looseout_kg, $loosein_pcs, $looseout_pcs, $updateid)
  {
    global $pdo;

    $stmt = $pdo->prepare("UPDATE hhkmcstock SET loosein_size='$loosein_size', loosein_kg='$loosein_kg', loosein_pcs='$loosein_pcs', looseout_size='$looseout_size', looseout_kg='$looseout_kg', looseout_pcs='$looseout_pcs' WHERE id='$updateid'");
    $stmt->execute();
  }

  function editgfcmcstockremark($remark, $updateid)
  {
    global $pdo;

    $stmt = $pdo->prepare("UPDATE gfcmcstock SET remark='$remark' WHERE id='$updateid'");
    $stmt->execute();
  }

  function editgfcmcstocklooseinorout($loosein_size, $loosein_kg, $looseout_size, $looseout_kg, $loosein_pcs, $looseout_pcs, $updateid)
  {
    global $pdo;

    $stmt = $pdo->prepare("UPDATE gfcmcstock SET loosein_size='$loosein_size', loosein_kg='$loosein_kg', loosein_pcs='$loosein_pcs', looseout_size='$looseout_size', looseout_kg='$looseout_kg', looseout_pcs='$looseout_pcs' WHERE id='$updateid'");
    $stmt->execute();
  }

  function kgimport($importkg, $rowid)
  {
    global $pdo;

    $stmt = $pdo->prepare("UPDATE processing SET kg='$importkg' WHERE id='$rowid'");
    $stmt->execute();
  }

  function chargesimport($charges, $rowid)
  {
    global $pdo;

    $stmt = $pdo->prepare("UPDATE processing SET charges='$charges' WHERE id='$rowid'");
    $stmt->execute();
  }

  function updatetotalgrossweight($upid, $totalgrossweightupdata)
  {
    global $pdo;

    $stmt = $pdo->prepare("UPDATE packingliststockinfo SET totalgrossweight='$totalgrossweightupdata' WHERE id='$upid'");
    $stmt->execute();
  }

  // Balanace Additons

  function cashbookaddbalance($date, $balanceamount, $ac_code, $particular)
  {
    global $pdo;

    $stmt = $pdo->prepare("INSERT INTO `cashbook` (`date`, `balance`, `ac_name`, `particular`) VALUES ('$date', '$balanceamount', '$ac_code', :particular)");
    $stmt->execute([
      ':particular' => $particular
    ]);

    $stmt = $pdo->prepare("INSERT INTO general_ledger(`date`, `ac_code`, `narration`, `balance`) VALUES ('$date', '$ac_code', :particular, '$balanceamount')");
    $stmt->execute([
      ':particular' => $particular
    ]);
  }

  function cashbookupdatebalance($id, $balanceamount, $ac_code, $particular, $date)
  {
    global $pdo;

    $stmt = $pdo->prepare("UPDATE cashbook SET date='$date', balance='$balanceamount', ac_name='$ac_code', particular=:particular WHERE id='$id'");
    $stmt->execute([
      ':particular' => $particular
    ]);
  }

  function accountpayableaddbalance($balanceamount)
  {
    global $pdo;
    $date = date('Y-m-d');

    $stmt = $pdo->prepare("INSERT INTO `cashbook` (`date`, `balance`) VALUES ('$date', '$balanceamount')");
    $stmt->execute();
  }

  function accountpayableupdatebalance($id, $balanceamount)
  {
    global $pdo;
    $date = date('Y-m-d');
    $stmt = $pdo->prepare("UPDATE cashbook SET date='$date', balance='$balanceamount' WHERE id='$id'");
    $stmt->execute();
  }

  function addaccountreceivablebalance($date, $ac_name, $balance, $description)
  {
    global $pdo;

    $balancestmt = $pdo->prepare("INSERT INTO receivable(date, ac_code, particulars, balance) VALUES('$date', '$ac_name', '$description', '$balance')");
    $balancestmt->execute();

    $balancestmt = $pdo->prepare("INSERT INTO general_ledger(date, ac_code, balance, narration, voucherno) VALUES('$date', '$ac_name', '$balance', '$description', '$description')");
    $balancestmt->execute();

    $balancestmt = $pdo->prepare("INSERT INTO currency(dollar_rate, debitorcredit, usd_amount, voucher_no) VALUES(1, 'balance', '$balance', :description)");
    $balancestmt->execute(
      [
        ':description' => $description,
      ]
    );
  }

  function updateaccountreceivablebalance($id, $dateupdate, $ac_nameupdate, $balanceamount, $description)
  {
    global $pdo;
    $balancestmt = $pdo->prepare("UPDATE receivable SET date='$dateupdate', ac_code='$ac_nameupdate', balance='$balanceamount', particulars='$description' WHERE id='$id'");
    $balancestmt->execute();
  }


  // Balanace Additons

  function updatebalancekg($id, $balance_kg, $balance_mc)
  {
    global $pdo;

    $stmt = $pdo->prepare("UPDATE hhkstock SET balance_kg='$balance_kg', balance_mc='$balance_mc' WHERE id='$id'");
    $stmt->execute();
  }

  function addtotalremark($remarkid, $remark)
  {
    global $pdo;

    $stmt = $pdo->prepare("UPDATE gfctotal SET remark='$remark' WHERE id='$remarkid'");
    $stmt->execute();
  }

  function waterkg($waterkgid, $waterkg)
  {
    global $pdo;

    $data = $this->select('form7stock', $waterkgid, 'id');

    $kg = ($data['viss'] * 1.634) - $waterkg;
    $stmt = $pdo->prepare("UPDATE form7stock SET water_kg='$waterkg', kg='$kg' WHERE id='$waterkgid'");
    $stmt->execute();
  }

  function addbalancepayable($date, $supplier_id, $description, $amount)
  {
    global $pdo;

    $balancestmt = $pdo->prepare("INSERT INTO payable(date, supplier_id, remark, closing_balance)  VALUES('$date', '$supplier_id', '$description', '$amount')");
    $balancestmt->execute();

    $glstmt = $pdo->prepare("INSERT INTO general_ledger(date, ac_code, narration ,balance) VALUES('$date', '$supplier_id', '$description', '$amount')");
    $glstmt->execute();
  }

  function updategfcmcstock($newdate, $newparticular, $newcommondity_id, $newfish_type, $newsize, $newkg, $newmc, $newcountry, $updateid)
  {
    global $pdo;

    $olddatastmt = $pdo->prepare("SELECT balance_mc FROM gfcmcstock WHERE commondity_id='$newcommondity_id' AND size='$newsize' AND kg='$newkg' AND id < '$updateid' ORDER BY id DESC");
    $olddatastmt->execute();
    $olddata = $olddatastmt->fetch(PDO::FETCH_ASSOC);

    if (!empty($olddata)) {
      if (str_contains($newparticular, "GFC") || str_contains($newparticular, "gfc")) {
        $balance_mc = $olddata['balance_mc'] + $newmc;
      } else {
        $balance_mc = $olddata['balance_mc'] - $newmc;
      }
    } else {
      $balance_mc = $newmc;
    }

    $stmt = $pdo->prepare("UPDATE gfcmcstock SET date='$newdate', particular='$newparticular', commondity_id='$newcommondity_id', fish_type='$newfish_type', size='$newsize', kg='$newkg', mc='$newmc', country='$newcountry', balance_mc='$balance_mc' WHERE id='$updateid'");
    $stmt->execute();

    $updatedatastmt = $pdo->prepare("SELECT * FROM gfcmcstock WHERE commondity_id = '$newcommondity_id' AND size = '$newsize' AND kg='$newkg' AND id > '$updateid'");
    $updatedatastmt->execute();
    $updatedatas = $updatedatastmt->fetchAll();
    //update gfcmc for more rows
    foreach ($updatedatas as $updatedata) {
      $id = $updatedata['id'];
      $mc = $updatedata['mc'];
      $datasstmt = $pdo->prepare("SELECT * FROM gfcmcstock WHERE commondity_id = '$newcommondity_id' AND size = '$newsize' AND kg = '$newkg' AND id < '$id' ORDER BY id DESC");
      $datasstmt->execute();
      $datas = $datasstmt->fetch(PDO::FETCH_ASSOC);
      if (str_contains($updatedata['particular'], "GFC") || str_contains($updatedata['particular'], "gfc")) {
        $balance_mc = $datas['balance_mc'] + $mc;
      } else {
        $balance_mc = $datas['balance_mc'] - $mc;
      }

      $updatestmt = $pdo->prepare("UPDATE gfcmcstock SET balance_mc='$balance_mc' WHERE id='$id'");
      $updatestmt->execute();
    }
    echo "<script>window.location.href=\"?sizeinfo=$newsize&commondity=$newcommondity_id&country=$newcountry\"</script>";
  }

  function create_material($name, $description, $unit)
  {
    global $pdo;
    $stmt = $pdo->prepare("INSERT INTO materials(name, description, unit) VALUES('$name', '$description', '$unit');");
    $stmt->execute();
    if ($stmt) {
      return $successmessage = "Material Added Successfully";
    } else {
      return $errmessage = "Error accors when adding Material";
    }
  }

  function update_material($name, $description, $unit, $id)
  {
    global $pdo;
    $checkstmt = $pdo->prepare("SELECT * FROM materials");
    $checkstmt->execute();
    $checkdata = $checkstmt->fetchall();
    if (!empty($checkdata)) {
      $stmt = $pdo->prepare("UPDATE materials SET name='$name', description='$description', unit='$unit' WHERE id='$id'");
      $stmt->execute();
    }
    if (!empty($stmt)) {
      return $successmessage = "material updated Successfully";
    } else {
      return $errmessage = "Error accors when Updating material";
    }
  }

  function delete_material($id)
  {
    global $pdo;
    $checkstmt = $pdo->prepare("SELECT * FROM materials WHERE id='$id'");
    $checkstmt->execute();
    $checkdata = $checkstmt->fetchall();

    if (!empty($checkdata)) {
      $stmt = $pdo->prepare("DELETE FROM materials WHERE id='$id'");
      $stmt->execute();
    }

    if (!empty($stmt)) {
      return $successmessage = "material Deleted Successfully";
    } else {
      return $errmessage = "Error accors when Deleted material";
    }
  }

  function addmaterialpurchase($table, $date, $voucher_no, $supplier_name, $material, $quantity, $rate)
  {
    global $pdo;
    $amount = $quantity * $rate;
    $idstmt = $pdo->prepare("SELECT id FROM $table ORDER BY id DESC");
    $idstmt->execute();
    $iddata = $idstmt->fetch(PDO::FETCH_ASSOC);
    $stmt = $pdo->prepare("INSERT INTO $table(date, voucher_no, supplier_id, material_id, quantity, rate) VALUES('$date', '$voucher_no', '$supplier_name', '$material', '$quantity', '$rate')");
    $stmt->execute();
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
    $idstmt = $pdo->prepare("SELECT * FROM $table ORDER BY id DESC");
    $idstmt->execute();
    $iddata = $idstmt->fetch(PDO::FETCH_ASSOC);
    $id = $iddata['id'];
    $payablestmt = $pdo->prepare("INSERT INTO payable(date, supplier_id, purchase_voucher_no, purchase_amount, balance, link_id) VALUES('$date', '$supplier_name', '$voucher_no', '$amount', '$total_balance', '$id')");
    $payablestmt->execute();

    if ($stmt) {
      echo '<script>swal("Success!", "Purchase Voucher Added Successfully", "success");</script>';
    } else {
      echo '<script>swal("Error!", "Error accors when added Purchase Voucher", "error");</script>';
    }

    // Store House Add

    $storehousestmt = $pdo->prepare("INSERT INTO material_store_house(date, voucher_no, material_id, `in`) VALUES('$date', '$voucher_no', '$material', '$quantity')");
    $storehousestmt->execute();

    // // General Ledger Add
    // $vouchercheckstmt = $pdo->prepare("SELECT * FROM general_ledger WHERE voucherno='$voucher_no' AND ac_code LIKE '4000%'");
    // $vouchercheckstmt->execute();
    // $vouchercheck = $vouchercheckstmt->fetch(PDO::FETCH_ASSOC);
    // if(empty($vouchercheck)){
    //   $balancecheckstmt = $pdo->prepare("SELECT * FROM general_ledger WHERE ac_code LIKE '4000%' ORDER BY id DESC");
    //   $balancecheckstmt->execute();
    //   $balancecheck = $balancecheckstmt->fetch(PDO::FETCH_ASSOC);
    //   $balance = $amount + $balancecheck['balance'];
    //   $glstmt = $pdo->prepare("INSERT INTO general_ledger(date, voucherno, ac_code, credit, balance) VALUES('$date', '$voucher_no', '6100/008', '$amount', '$balance')");
    //   $glstmt->execute();
    // }else{
    //   $vouchercheckstmt = $pdo->prepare("SELECT SUM(credit) AS credit FROM general_ledger WHERE voucherno='$voucher_no' AND ac_code='6100/008'");
    //   $vouchercheckstmt->execute();
    //   $creditdata = $vouchercheckstmt->fetch(PDO::FETCH_ASSOC);
    //   $total_credit = $creditdata['credit'] + $amount;

    //   $nowid = $vouchercheck['id'];
    //   $balancestmt = $pdo->prepare("SELECT * FROM general_ledger WHERE id<'$nowid' AND ac_code LIKE '4000%' ORDER BY id DESC");
    //   $balancestmt->execute();
    //   $balancecheck = $balancestmt->fetch(PDO::FETCH_ASSOC);

    //   if(!empty($balancecheck)){
    //     $balance = ($balancecheck['balance'] + floatval($vouchercheck['debit'])) - $total_credit;
    //   }else {
    //     $balance = (0 + floatval($vouchercheck['debit'])) - $total_credit;
    //   }

    //   $updatestmt = $pdo->prepare("UPDATE general_ledger SET credit='$total_credit', balance='$balance' WHERE voucherno='$voucher_no' AND ac_code LIKE '4000%'");
    //   $updatestmt->execute();
    // }

  }

  function outputmaterial($stockto, $material, $quantity, $voucher_no)
  {
    global $pdo;

    $stmt = $pdo->prepare("INSERT INTO stock_output_group(stock_to, voucher_no, material_id, `in`) VALUES('$stockto', '$voucher_no', '$material', '$quantity')");
    $stmt->execute();
    $groupstmt = $pdo->prepare("SELECT * FROM stock_output_group ORDER BY id DESC");
    $groupstmt->execute();
    $groupdata = $groupstmt->fetch(PDO::FETCH_ASSOC);

    $materialstmt = $pdo->prepare("SELECT * FROM material_store_house WHERE material_id='$material'");
    $materialstmt->execute();
    $materialdata = $materialstmt->fetch(PDO::FETCH_ASSOC);
    $supplier = $materialdata['supplier_id'];

    $groupid = $groupdata['id'];
    $storehousestmt = $pdo->prepare("INSERT INTO material_store_house(voucher_no, material_id, supplier_id, `out`, output_group) VALUES('$voucher_no', '$material', '$supplier', '$quantity', '$groupid')");
    $storehousestmt->execute();
  }

  public function stockout($stock_to, $date, $voucher_no, $packingmaterial, $quantity)
  {
    global $pdo;
    $stmt = $pdo->prepare("INSERT INTO stock_output_group(stock_to, date, voucher_no, material_id, `out`) VALUES('$stock_to', '$date', '$voucher_no', '$packingmaterial', '$quantity');");
    $stmt->execute();
  }

  // MORE Functions

  function selectsum($table, $id, $selectwhat)
  {
    global $pdo;
    $stmt = $pdo->prepare("SELECT SUM(amount) AS total_amount FROM $table WHERE $selectwhat='$id'");
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }

  function selectsumviss($table, $id, $selectwhat)
  {
    global $pdo;
    $stmt = $pdo->prepare("SELECT SUM(viss) AS total_viss FROM $table WHERE $selectwhat='$id'");
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }

  function selectallsum($table, $row, $selectas)
  {
    global $pdo;
    $stmt = $pdo->prepare("SELECT SUM($row) AS $selectas FROM $table");
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }

  function selectallsumcheck($table, $row, $selectas, $selectwhat, $selectid)
  {
    global $pdo;
    $stmt = $pdo->prepare("SELECT SUM($row) AS $selectas FROM $table WHERE $selectwhat='$selectid'");
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }
  function selectallsumpayable($table, $row, $selectas, $supplier_id)
  {
    global $pdo;
    $stmt = $pdo->prepare("SELECT SUM($row) AS $selectas FROM $table WHERE supplier_id='$supplier_id'");
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }
  function selectallsumreceivable($table, $row, $selectas, $supplier_id)
  {
    global $pdo;
    $stmt = $pdo->prepare("SELECT SUM($row) AS $selectas FROM $table WHERE ac_code='$supplier_id'");
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }

  function selectsumdbw($table, $row, $selectas, $startdate, $enddate)
  {
    global $pdo;
    $stmt = $pdo->prepare("SELECT SUM($row) AS $selectas FROM $table WHERE `date` BETWEEN '$startdate' AND '$enddate'");
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }

  function selectdbw($table, $startdate, $enddate)
  {
    global $pdo;
    $stmt = $pdo->prepare("SELECT * FROM $table WHERE `date` BETWEEN '$startdate' AND '$enddate'");
    $stmt->execute();
    return $stmt->fetchall();
  }

  function selectsupplierdbw($table, $supplier_id, $startdate, $enddate)
  {
    global $pdo;
    $stmt = $pdo->prepare("SELECT * FROM $table WHERE supplier_id='$supplier_id' AND `date` BETWEEN '$startdate' AND '$enddate'");
    $stmt->execute();
    return $stmt->fetchall();
  }

  function selectsupplierdbwsum($table, $row, $selectas, $supplier_id, $startdate, $enddate)
  {
    global $pdo;
    $stmt = $pdo->prepare("SELECT SUM($row) AS $selectas FROM $table WHERE supplier_id='$supplier_id' AND `date` BETWEEN '$startdate' AND '$enddate'");
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }

  function selectcommoditydbw($table, $commodity, $startdate, $enddate)
  {
    global $pdo;
    $stmt = $pdo->prepare("SELECT * FROM $table WHERE commodity='$commodity' AND `date` BETWEEN '$startdate' AND '$enddate'");
    $stmt->execute();
    return $stmt->fetchall();
  }

  function selectcommoditydbwsum($table, $row, $selectas, $commodity, $startdate, $enddate)
  {
    global $pdo;
    $stmt = $pdo->prepare("SELECT SUM($row) AS $selectas FROM $table WHERE commodity='$commodity' AND `date` BETWEEN '$startdate' AND '$enddate'");
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }

  function selectvoucher($table, $voucher_no)
  {
    global $pdo;
    $stmt = $pdo->prepare("SELECT * FROM $table WHERE voucher_no='$voucher_no'");
    $stmt->execute();
    return $stmt->fetchall();
  }

  function selectvouchersum($table, $row, $selectas, $voucher_no)
  {
    global $pdo;
    $stmt = $pdo->prepare("SELECT SUM($row) AS $selectas FROM $table WHERE voucher_no='$voucher_no'");
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }

  function selectcommodityandsize($table, $item_id, $size)
  {
    global $pdo;
    $stmt = $pdo->prepare("SELECT * FROM $table WHERE commodity='$item_id' AND size='$size';");
    $stmt->execute();
    return $stmt->fetchall();
  }

  function selectcommodityandsizesum($table, $row, $selectas, $item_id, $size)
  {
    global $pdo;
    $stmt = $pdo->prepare("SELECT SUM($row) AS $selectas FROM $table WHERE commodity='$item_id' AND size='$size';");
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }

  function selectsumvisswithsize($table, $item_id, $size)
  {
    global $pdo;
    $stmt = $pdo->prepare("SELECT SUM(viss) AS total_viss FROM $table WHERE commodity='$item_id' AND size='$size'");
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }

  function selectdis($table, $diswhat)
  {
    global $pdo;
    $stmt = $pdo->prepare("SELECT DISTINCT $diswhat FROM $table");
    $stmt->execute();
    return $stmt->fetchall();
  }

  function selectgroupby($table, $groupbywhat)
  {
    global $pdo;
    $stmt = $pdo->prepare("SELECT * FROM $table GROUP BY $groupbywhat");
    $stmt->execute();
    return $stmt->fetchall();
  }

  function selectdesc($table)
  {
    global $pdo;
    $stmt = $pdo->prepare("SELECT * FROM $table ORDER BY id DESC");
    $stmt->execute();
    return $stmt->fetchall();
  }

  function selectorderby($table, $orderby)
  {
    global $pdo;
    $stmt = $pdo->prepare("SELECT * FROM $table ORDER BY $orderby");
    $stmt->execute();
    return $stmt->fetchall();
  }

  function selectacname($code_no)
  {
    global $pdo;
    $stmt = $pdo->prepare("SELECT * FROM acname WHERE code_no='$code_no'");
    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }

  function checkifacexists($accode)
  {
    global $pdo;
    // Transaction Check
    $transactioncheckstmt =  $pdo->prepare("SELECT * FROM `transaction` WHERE ac_code='$accode'");
    $transactioncheckstmt->execute();
    $transactioncheckdata = $transactioncheckstmt->fetch(PDO::FETCH_ASSOC);
    // Cashbook Check
    $cashbookcheckstmt =  $pdo->prepare("SELECT * FROM cashbook WHERE ac_name='$accode'");
    $cashbookcheckstmt->execute();
    $cashbookcheckdata = $cashbookcheckstmt->fetch(PDO::FETCH_ASSOC);
    // Receivable Check
    $receivablecheckstmt =  $pdo->prepare("SELECT * FROM receivable WHERE ac_code='$accode'");
    $receivablecheckstmt->execute();
    $receivablecheckdata = $receivablecheckstmt->fetch(PDO::FETCH_ASSOC);
    // Payable Check
    $payablecheckstmt =  $pdo->prepare("SELECT * FROM payable WHERE supplier_id='$accode'");
    $payablecheckstmt->execute();
    $payablecheckdata = $payablecheckstmt->fetch(PDO::FETCH_ASSOC);
    // General_Ledger Check
    $general_ledgercheckstmt =  $pdo->prepare("SELECT * FROM general_ledger WHERE ac_code='$accode'");
    $general_ledgercheckstmt->execute();
    $general_ledgercheckdata = $general_ledgercheckstmt->fetch(PDO::FETCH_ASSOC);

    if (!empty($transactioncheckdata) || !empty($cashbookcheckdata) || !empty($receivablecheckdata) || !empty($payablecheckdata) || !empty($general_ledgercheckdata)) {
      return $status = true;
    } else {
      return $status = false;
    }
  }

  function replaceaccode($fromaccode, $toaccode)
  {
    global $pdo;

    // Transaction
    $stmt = $pdo->prepare("UPDATE `transaction` SET ac_code='$toaccode' WHERE ac_code='$fromaccode'");
    $stmt->execute();
    // General Ledger
    $glstmt = $pdo->prepare("SELECT * FROM general_ledger WHERE ac_code='$fromaccode'");
    $glstmt->execute();
    $gldatas = $glstmt->fetchAll();
    foreach ($gldatas as $gldata) {
      $id = $gldata['id'];
      $glbalancestmt = $pdo->prepare("SELECT * FROM general_ledger WHERE ac_code='$fromaccode' ORDER BY id DESC");
      $glbalancestmt->execute();
      $glbalancedata = $glbalancestmt->fetch(PDO::FETCH_ASSOC);

      $stmt = $pdo->prepare("UPDATE general_ledger SET ac_code='$toaccode' WHERE id='$id'");
      $stmt->execute();

      $debit = $gldata['debit'];
      $credit = $gldata['credit'];

      $balance = (floatval($glbalancedata['balance']) + floatval($debit)) - floatval($credit);

      $stmt = $pdo->prepare("UPDATE general_ledger SET balance='$balance' WHERE id='$id'");
      $stmt->execute();
    }



    // Cash Book
    $stmt = $pdo->prepare("UPDATE cashbook SET ac_name='$toaccode' WHERE ac_name='$fromaccode'");
    $stmt->execute();
    $stmt = $pdo->prepare("UPDATE cashbook SET crossac_name='$toaccode' WHERE crossac_name='$fromaccode'");
    $stmt->execute();
    // Receivable
    $stmt = $pdo->prepare("UPDATE receivable SET ac_code='$toaccode' WHERE ac_code='$fromaccode'");
    $stmt->execute();
    // Payable
    $stmt = $pdo->prepare("UPDATE payable SET supplier_id='$toaccode' WHERE supplier_id='$fromaccode'");
    $stmt->execute();
    // Purchase
    $stmt = $pdo->prepare("UPDATE purchase SET supplier_id='$toaccode' WHERE supplier_id='$fromaccode'");
    $stmt->execute();
    // Form 7 Frozen
    $stmt = $pdo->prepare("UPDATE form7stock SET supplier_name='$toaccode' WHERE supplier_name='$fromaccode'");
    $stmt->execute();
    // Form 7 TCL
    $stmt = $pdo->prepare("UPDATE form7stocktcl SET supplier_name='$toaccode' WHERE supplier_name='$fromaccode'");
    $stmt->execute();
    // Form 10 Frozen
    $stmt = $pdo->prepare("UPDATE form10stock SET supplier_id='$toaccode' WHERE supplier_id='$fromaccode'");
    $stmt->execute();
    // Form 10 TCL
    $stmt = $pdo->prepare("UPDATE form10stocktcl SET supplier_id='$toaccode' WHERE supplier_id='$fromaccode'");
    $stmt->execute();
    // Packing List
    $stmt = $pdo->prepare("UPDATE packingliststock SET customer_id='$toaccode' WHERE customer_id='$fromaccode'");
    $stmt->execute();

    echo "<script>swal('Account Code Replaced!', 'All Account Code from all the tables have been replaced!', 'success');</script>";
  }
}
