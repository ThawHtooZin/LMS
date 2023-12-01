<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Admin | Dashboard</title>
  </head>
  <?php
  $bootstrap->css();
  ?>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Caprasimo&family=Cormorant+Garamond:wght@300&family=Teko:wght@700&display=swap" rel="stylesheet">
  <body>
    <div class="row">
      <div class="sidebarcol" id="sidebar">
        <?php
        include 'sidebar.php';
        ?>
      </div>
      <div class="contentcol" id="content">
        <?php require 'navbar.php'; ?>
        <?php

            if(isset($_POST['search'])){
                if($_POST['searchtype'] == 'mcreport'){
                    echo "<script>window.location.href='stockreport.php';</script>";
                }
                if ($_POST['searchtype'] == 'hhkloosereport') {
                    $_SESSION['stockreporttype'] = 'hhkloosereport';
                }
                if ($_POST['searchtype'] == 'hhkkgreport') {
                    $_SESSION['stockreporttype'] = 'hhkkgreport';
                }
                if ($_POST['searchtype'] == 'gfcloosereport') {
                    $_SESSION['stockreporttype'] = 'gfcloosereport';
                }
                if ($_POST['searchtype'] == 'gfckgreport') {
                    $_SESSION['stockreporttype'] = 'gfckgreport';
                }
                
            }
            if(isset($_POST['mcreport'])) {
                echo "<script>window.location.href='stockreport.php';</script>";
            }
            if (isset($_POST['hhkloosereport'])) {
                $_SESSION['stockreporttype'] = 'hhkloosereport';
            }
            if (isset($_POST['hhkkgreport'])) {
                $_SESSION['stockreporttype'] = 'hhkkgreport';
            }
            if (isset($_POST['gfcloosereport'])) {
                $_SESSION['stockreporttype'] = 'gfcloosereport';
            }
            if (isset($_POST['gfckgreport'])) {
                $_SESSION['stockreporttype'] = 'gfckgreport';
            }

        ?>
        <div class="card">
            <div class="card-header bg-info text-light">
                <form class="row" action="" method="post">
                    <div class="col-9">
                        <?php
                        if(!empty($_SESSION)){
                            ?>
                                <h4>Stock Reports</h4>
                            <?php
                        }else{
                            if($_SESSION['stockreporttype'] == 'hhkloosereport'){
                                ?>
                                    <h4>HHK Loose Reports</h4>
                                <?php
                            }
                            if($_SESSION['stockreporttype'] == 'hhkkgreport'){
                                ?>
                                    <h4>HHK Kg Reports</h4>
                                <?php
                            }
                            if($_SESSION['stockreporttype'] == 'gfcloosereport'){
                                ?>
                                    <h4>GFC Loose Reports</h4>
                                <?php
                            }
                            if($_SESSION['stockreporttype'] == 'gfckgreport'){
                                ?>
                                    <h4>GFC Kg Reports</h4>
                                <?php
                            }
                        }
                        ?>
                    </div>
                    <div class="col-3 <?php if(empty($_SESSION['stockreporttype'])){echo 'd-none';} ?>">
                        <div class="input-group">
                            <select name="searchtype" id="" class="form-control d-inline">
                                <option value="">Select Report Methods</option>
                                <option value="mcreport">Mc Report</option>
                                <option value="hhkloosereport">HHK Loose Report</option>
                                <option value="hhkkgreport">HHK Balance Report</option>
                                <option value="gfcloosereport">GFC Loose Report</option>
                                <option value="gfckgreport">GFC Balance Report</option>
                            </select>
                            <button type="submit" class="btn btn-success" name="search">Search</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="card-bdoy p-3">
                <?php 
                    if(empty($_SESSION['stockreporttype'])){
                        ?>
                        <form action="" method="post">
                        <div class="row" style="padding-top: 100px;">
                            <div class="col-2">

                            </div>
                            <div class="col text-center">
                                <button type="submit" class="btn btn-default border border-3 mt-2" style="padding: 50px !important; font-size: 15px; font-style:italic;" name="mcreport">HHK Loose Report</button>
                            </div>
                            <div class="col text-center">
                                <button type="submit" class="btn btn-default border border-3 mt-2" style="padding: 50px !important; font-size: 15px; font-style:italic;" name="hhkloosereport">HHK Balance Report</button>
                            </div>
                            <div class="col-2">
                                
                            </div>
                        </div>
                        <div class="row" style=" padding-bottom: 170px; padding-top: 100px;">
                            <div class="col text-center">
                                <button type="submit" class="btn btn-default border border-3 mt-2" style="padding: 50px !important; font-size: 15px; font-style:italic;" name="hhkkgreport">GFC Loose Report</button>
                            </div>
                            <div class="col text-center">
                                <button type="submit" class="btn btn-default border border-3 mt-2" style="padding: 50px !important; font-size: 15px; font-style:italic;" name="gfcloosereport">Mc Report</button>
                            </div>
                            <div class="col text-center">
                                <button type="submit" class="btn btn-default border border-3 mt-2" style="padding: 50px !important; font-size: 15px; font-style:italic;" name="gfckgreport">GFC Balance Report</button>
                            </div>
                        </div>
                        </form>
                        <?php
                    }else{
                        include 'stockreportpages.php';
                    }
                ?>
            </div>
        </div>
      </div>
    </div>
    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
