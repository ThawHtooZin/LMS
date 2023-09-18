<?php

Class auth{
    function checkadmin(){
        if(empty($_SESSION['username']) || empty($_SESSION['logged_in']) || empty($_SESSION['role'])){
            if($_SESSION['role'] != 1){
                header('location:../../Index.php');
            }
        }
    }
}

?>
