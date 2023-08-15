<?php

include "database.db.php";

Class Query{

  function login($username, $password){
    global $pdo;
    $stmt = $pdo->prepare("SELECT * FROM users WHERE username='$username'");
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
        if($userdata['role'] == 0){
          $_SESSION['role'] = 0;
          $_SESSION['username'] = $username;
          $_SESSION['logged_in'] = true;
          header('location:App/guest/');
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

}

?>
