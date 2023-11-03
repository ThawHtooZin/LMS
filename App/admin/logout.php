<?php
session_start();

include '../../Auth/authrize.ctr.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$query = new Query();

$query->logout();
?>
