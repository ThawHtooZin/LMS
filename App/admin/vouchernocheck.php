<?php

session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();

$voucher_no = $_POST['voucher_no'];
$stmt = $pdo->prepare("SELECT * FROM transaction WHERE voucher_no='$voucher_no'");
$stmt->execute();
$voucher_no = $stmt->fetchAll();

if(!empty($voucher_no)){
    echo true;
}else{
    echo false;
}