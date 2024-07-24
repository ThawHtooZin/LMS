<?php

session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();

$sr_no = $_POST['sr_no'];
$stmt = $pdo->prepare("SELECT * FROM transaction WHERE sr_no LIKE '%$sr_no%' AND sr_no!=''");
$stmt->execute();
$sr_no = $stmt->fetchAll();

if(!empty($sr_no)){
    echo true;
}else{
    echo false;
}