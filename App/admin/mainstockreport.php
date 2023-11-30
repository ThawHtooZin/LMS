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
                
            }        

        ?>
        <div class="card">
            <div class="card-header bg-info text-light">
                <form class="row" action="" method="post">
                    <div class="col-9">
                        <h4>Stock Reports</h4>
                    </div>
                    <div class="col-3">
                        <div class="input-group">
                            <select name="searchtype" id="" class="form-control d-inline">
                                <option value="">Select Report Methods</option>
                                <option value="mcreport">Mc Report</option>
                                <option value="hhkloosereport">HHK Loose Report</option>
                                <option value="hhkkgreport">HHK Kg Report</option>
                                <option value="hhkcommondityreport">HHK Commondity Report</option>
                                <option value="hhkmcreport">HHK Mc Report</option>
                                <option value="gfcloosereport">GFC Loose Report</option>
                                <option value="gfckgreport">GFC Kg Report</option>
                                <option value="gfccommondityreport">GFC Commondity Report</option>
                                <option value="gfcmcreport">GFC Mc Report</option>
                                <option value="tclloosereport">TCL Loose Report</option>
                                <option value="tclkgreport">TCL Kg Report</option>
                                <option value="tclcommondityreport">TCL Commondity Report</option>
                                <option value="tclmcreport">TCL Mc Report</option>
                            </select>
                            <button type="submit" class="btn btn-success" name="search">Search</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="card-bdoy p-3">
                <?php 
                    include 'stockreportpages.php';
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
