<?php

Class auth{
    function checkadmin(){
        if(empty($_SESSION['username']) || empty($_SESSION['logged_in']) || empty($_SESSION['role'])){
            if($_SESSION['role'] != 1){
                header('location:../../Index.php');
            }
        }
    }
    function checkuser(){
        if(empty($_SESSION['username']) || empty($_SESSION['logged_in']) || empty($_SESSION['role'])){
            if($_SESSION['role'] != 2){
                header('location:../../Index.php');
            }
        }
    }
    function checkguest(){
        if(empty($_SESSION['username']) || empty($_SESSION['logged_in']) || empty($_SESSION['role'])){
            if($_SESSION['role'] != 0){
                header('location:../../Index.php');
            }
        }
    }

    function checksale(){
        if(empty($_SESSION['username']) || empty($_SESSION['logged_in']) || empty($_SESSION['role'])){
            if($_SESSION['role'] != 3){
                header('location:../../Index.php');
            }
        }
    }

    function checkpurchase(){
        if(empty($_SESSION['username']) || empty($_SESSION['logged_in']) || empty($_SESSION['role'])){
            if($_SESSION['role'] != 4){
                header('location:../../Index.php');
            }
        }
    }
}

?>
