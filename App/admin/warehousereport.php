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
    <title>Document</title>
  </head>
  <?php
  $bootstrap->css();
  ?>
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Merriweather:ital,wght@0,300;0,400;0,700;0,900;1,300;1,400;1,700;1,900&display=swap" rel="stylesheet">
<style>
  
  .merriweather-light {
  font-family: "Merriweather", serif;
  font-weight: 300;
  font-style: normal;
}

.merriweather-regular {
  font-family: "Merriweather", serif;
  font-weight: 400;
  font-style: normal;
}

.merriweather-bold {
  font-family: "Merriweather", serif;
  font-weight: 700;
  font-style: normal;
}

.merriweather-black {
  font-family: "Merriweather", serif;
  font-weight: 900;
  font-style: normal;
}

.merriweather-light-italic {
  font-family: "Merriweather", serif;
  font-weight: 300;
  font-style: italic;
}

.merriweather-regular-italic {
  font-family: "Merriweather", serif;
  font-weight: 400;
  font-style: italic;
}

.merriweather-bold-italic {
  font-family: "Merriweather", serif;
  font-weight: 700;
  font-style: italic;
}

.merriweather-black-italic {
  font-family: "Merriweather", serif;
  font-weight: 900;
  font-style: italic;
}

</style>
  <body>
    <div class="row">
      <div class="sidebarcol" id="sidebar">
        <?php
        include 'sidebar.php';
        ?>
      </div>
      <div class="contentcol" id="content">
        <?php require 'navbar.php'; ?>
        <div class="card">
          <div class="card-header bg-primary text-light"  style="padding:-10px;">
            <?php
                $materialstmt = $pdo->prepare("SELECT * FROM materials");
                $materialstmt->execute();
                $material = $materialstmt->fetch(PDO::FETCH_ASSOC);

                if(isset($_POST['inbtn'])){
                  $_SESSION['in'] = true;
                  unset($_SESSION['out']);
                }

                if(isset($_POST['outbtn'])){
                  $_SESSION['out'] = true;
                  unset($_SESSION['in']);
                }
            ?>
                <h1 class="merriweather-light text-center">*Link Mark WareHouse Report*</h1>
                <button data-bs-toggle="modal" data-bs-target="#filter" class="ms-2 btn btn-warning btn-sm float-end ">Filter</button>
          </div>

          <div class="modal" id="filter">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title">Filter Box</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="" method="POST">
                <div class="modal-body">
                  <label for="filtertypes">Type of Filters</label>
                  <select name="filterinp" class="form-control inpv2 mt-2" id="filtertypes">
                    <option value="all" style="font-weight: bold;">All</option>
                    <option value="totalin" style="font-weight: bold;">Total In</option>
                    <option value="totalout" style="font-weight: bold;">Total Out</option>
                    <option value="" disabled style="font-weight: bold;">Each Material In/Out</option>
                    <?php
                      $stmt = $pdo->prepare("SELECT * FROM material_store_house GROUP BY material_id");
                      $stmt->execute();
                      $datas = $stmt->fetchAll();
                      foreach($datas as $data){
                        $material_id = $data['material_id'];
                        $stmt = $pdo->prepare("SELECT * FROM materials WHERE id='$material_id'");
                        $stmt->execute();
                        $material = $stmt->fetch(PDO::FETCH_ASSOC);
                        ?>
                        <option value="eachmaterialinout-<?= $material['id']; ?>" style="padding-left:20px !important;">- <?= $material['name']; ?></option>
                        <?php
                      }
                      ?>
                  <option value="" disabled style="font-weight: bold;"></option>
                  <option value="" disabled style="font-weight: bold;">- Each Material Total In/Out</option>
                    <?php
                      $stmt = $pdo->prepare("SELECT * FROM material_store_house GROUP BY material_id");
                      $stmt->execute();
                      $datas = $stmt->fetchAll();
                      foreach($datas as $data){
                        $material_id = $data['material_id'];
                        $stmt = $pdo->prepare("SELECT * FROM materials WHERE id='$material_id'");
                        $stmt->execute();
                        $material = $stmt->fetch(PDO::FETCH_ASSOC);
                        ?>
                        <option value="eachmaterialtotalinout-<?= $material['id']; ?>" style="padding-left:20px !important;">- <?= $material['name']; ?></option>
                        <?php
                      }
                    ?>
                  <option value="" disabled style="font-weight: bold;"></option>
                  <option value="" disabled style="font-weight: bold;">Each Material Balance</option>
                    <?php
                      $stmt = $pdo->prepare("SELECT * FROM material_store_house GROUP BY material_id");
                      $stmt->execute();
                      $datas = $stmt->fetchAll();
                      foreach($datas as $data){
                        $material_id = $data['material_id'];
                        $stmt = $pdo->prepare("SELECT * FROM materials WHERE id='$material_id'");
                        $stmt->execute();
                        $material = $stmt->fetch(PDO::FETCH_ASSOC);
                        ?>
                        <option value="eachmaterialbalance-<?= $material['id']; ?>" style="padding-left:20px !important;">- <?= $material['name']; ?></option>
                        <?php
                      }
                    ?>
                  <option value="" disabled style="font-weight: bold;"></option>
                  <option value="" disabled style="font-weight: bold;">Each Material Balance Amount</option>
                    <?php
                      $stmt = $pdo->prepare("SELECT * FROM material_store_house GROUP BY material_id");
                      $stmt->execute();
                      $datas = $stmt->fetchAll();
                      foreach($datas as $data){
                        $material_id = $data['material_id'];
                        $stmt = $pdo->prepare("SELECT * FROM materials WHERE id='$material_id'");
                        $stmt->execute();
                        $material = $stmt->fetch(PDO::FETCH_ASSOC);
                        ?>
                        <option value="eachmaterialbalanceamount-<?= $material['id']; ?>" style="padding-left:20px !important;">- <?= $material['name']; ?></option>
                        <?php
                      }
                    ?>
                  </select>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                  <button type="submit" name="savefilter" class="btn btn-primary">Save Changes</button>
                </div>
                </form>
              </div>
            </div>
          </div>
          <div class="card-body">

            <?php

            if (!empty($_GET['pageno'])) {
              $pageno = $_GET['pageno'];
            }else{
              $pageno = 1;
            }
            $numOfrecs = 13;
            $offset = ($pageno -1) * $numOfrecs;
            ?>
            <form action="" method="POST" class="d-flex justify-content-between align-items-center">
              <div class="d-flex align-items-center">
                <label class="me-2">Start Date:</label>
                <input type="date" name="startdate" class="form-control me-3" value="<?php if(!empty($_SESSION['startdate'])){ echo $_SESSION['startdate']; } ?>">
                <label class="me-2">End Date:</label>
                <input type="date" name="enddate" class="form-control" value="<?php if(!empty($_SESSION['enddate'])){ echo $_SESSION['enddate']; } ?>">
              </div>
              <button class="btn btn-success btn-sm ms-3" name="search">Search</button>
            </form>

            <?php
              if(isset($_POST['savefilter'])){
                $_SESSION['filtertype'] = $_POST['filterinp'];
              }
            ?>

            <table class="mt-3 table table-bordered table-striped rounded">
              <?php
            if(!empty($_SESSION['filtertype'])){
              $filtertype = $_SESSION['filtertype'];              
                if($filtertype == 'all'){
                  ?>
                    <th>Id</th>
                    <th>Date</th>
                    <th>Voucher No</th>
                    <th>Supplier</th>
                    <th>Item Name</th>
                    <th>Unit</th>
                    <th>In</th>
                    <th>Out</th>
                    <th>Balance</th>
                  <?php
                }

                if($filtertype == 'totalin'){
                  ?>
                    <th>Id</th>
                    <th>Date</th>
                    <th>Voucher No</th>
                    <th>Supplier</th>
                    <th>Item Name</th>
                    <th>Unit</th>
                    <th>In</th>
                    <th>Balance</th>
                  <?php
                }
                if($filtertype == 'totalout'){
                  ?>
                    <th>Id</th>
                    <th>Date</th>
                    <th>Voucher No</th>
                    <th>Supplier</th>
                    <th>Item Name</th>
                    <th>Unit</th>
                    <th>Out</th>
                    <th>Balance</th>
                  <?php
                }
                if($filtertype == 'eachmaterialinout'){
                  ?>
                    <th>Id</th>
                    <th>Date</th>
                    <th>Voucher No</th>
                    <th>Supplier</th>
                    <th>Item Name</th>
                    <th>Unit</th>
                    <th>Out</th>
                    <th>Balance</th>
                  <?php
                }
                if(str_contains($filtertype, 'eachmaterialinout-')){
                  ?>
                    <th>Id</th>
                    <th>Date</th>
                    <th>Voucher No</th>
                    <th>Supplier</th>
                    <th>Item Name</th>
                    <th>Unit</th>
                    <th>In</th>
                    <th>Out</th>
                    <th>Balance</th>
                  <?php
                }
                if(str_contains($filtertype, 'eachmaterialtotalinout-')){
                  ?>
                    <th>Id</th>
                    <th>Date</th>
                    <th>Voucher No</th>
                    <th>Supplier</th>
                    <th>Item Name</th>
                    <th>Unit</th>
                    <th>In</th>
                    <th>Out</th>
                  <?php
                }
                if(str_contains($filtertype, 'eachmaterialbalance-')){
                  ?>
                    <th>Id</th>
                    <th>Date</th>
                    <th>Voucher No</th>
                    <th>Supplier</th>
                    <th>Item Name</th>
                    <th>Out</th>
                    <th>Balance</th>
                  <?php
                }
                if(str_contains($filtertype, 'eachmaterialbalanceamount-')){
                  ?>
                    <th>Id</th>
                    <th>Date</th>
                    <th>Voucher No</th>
                    <th>Supplier</th>
                    <th>Item Name</th>
                    <th>Out</th>
                    <th>Balance</th>
                    <th>Amount</th>
                  <?php
                }
              }else{
                ?>
                    <th>Id</th>
                    <th>Date</th>
                    <th>Voucher No</th>
                    <th>Supplier</th>
                    <th>Item Name</th>
                    <th>Unit</th>
                    <th>In</th>
                    <th>Out</th>
                    <th>Balance</th>
                  <?php
              }
              ?>

              <?php
              if(isset($_POST['search'])){
                $_SESSION['startdate'] = $_POST['startdate'];
                $_SESSION['enddate'] = $_POST['enddate'];
              }

              if(!empty($_SESSION['filtertype'])){
                $startdate = $_SESSION['startdate'];
                $enddate = $_SESSION['enddate'];
                $filtertype = $_SESSION['filtertype'];

                if($filtertype == 'all'){
                  $stmt = $pdo->prepare("SELECT * FROM material_store_house WHERE `date` BETWEEN '$startdate' AND '$enddate' ORDER BY id");
                  $stmt->execute();
                  $rawResult = $stmt->fetchAll();
                  $total_pages = ceil(count($rawResult) / $numOfrecs);

                  $stmt = $pdo->prepare("SELECT * FROM material_store_house WHERE `date` BETWEEN '$startdate' AND '$enddate' ORDER BY id LIMIT :offset, :numOfrecs");
                  $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
                  $stmt->bindValue(':numOfrecs', $numOfrecs, PDO::PARAM_INT);
                  $stmt->execute();
                }

                if($filtertype == 'totalin'){
                  $stmt = $pdo->prepare("SELECT * FROM material_store_house WHERE `out` IS NULL AND `date` BETWEEN '$startdate' AND '$enddate' ORDER BY id");
                  $stmt->execute();
                  $rawResult = $stmt->fetchAll();
                  $total_pages = ceil(count($rawResult) / $numOfrecs);

                  $stmt = $pdo->prepare("SELECT * FROM material_store_house WHERE `out` IS NULL AND `date` BETWEEN '$startdate' AND '$enddate' ORDER BY id LIMIT :offset, :numOfrecs");
                  $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
                  $stmt->bindValue(':numOfrecs', $numOfrecs, PDO::PARAM_INT);
                  $stmt->execute();
                }

                if($filtertype == 'totalout'){
                  $stmt = $pdo->prepare("SELECT * FROM material_store_house WHERE `in` IS NULL AND `date` BETWEEN '$startdate' AND '$enddate' ORDER BY id");
                  $stmt->execute();
                  $rawResult = $stmt->fetchAll();
                  $total_pages = ceil(count($rawResult) / $numOfrecs);

                  $stmt = $pdo->prepare("SELECT * FROM material_store_house WHERE `in` IS NULL AND `date` BETWEEN '$startdate' AND '$enddate' ORDER BY id LIMIT :offset, :numOfrecs");
                  $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
                  $stmt->bindValue(':numOfrecs', $numOfrecs, PDO::PARAM_INT);
                  $stmt->execute();
                }

                if(str_contains($filtertype, 'eachmaterialinout-')){
                  $data = explode("-", $filtertype);
                  $material_id = $data[1];
                  $stmt = $pdo->prepare("SELECT * FROM material_store_house WHERE material_id = '$material_id' AND `date` BETWEEN '$startdate' AND '$enddate' ORDER BY id");
                  $stmt->execute();
                  $rawResult = $stmt->fetchAll();
                  $total_pages = ceil(count($rawResult) / $numOfrecs);

                  $stmt = $pdo->prepare("SELECT * FROM material_store_house WHERE material_id = '$material_id' AND `date` BETWEEN '$startdate' AND '$enddate' ORDER BY id LIMIT :offset, :numOfrecs");
                  $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
                  $stmt->bindValue(':numOfrecs', $numOfrecs, PDO::PARAM_INT);
                  $stmt->execute();
                }
                if(str_contains($filtertype, needle: 'eachmaterialtotalinout-')){
                  $data = explode("-", $filtertype);
                  $material_id = $data[1];
                  $stmt = $pdo->prepare("SELECT * FROM material_store_house WHERE material_id = '$material_id' AND `date` BETWEEN '$startdate' AND '$enddate' GROUP BY material_id ORDER BY id");
                  $stmt->execute();
                  $rawResult = $stmt->fetchAll();
                  $total_pages = ceil(count($rawResult) / $numOfrecs);

                  $stmt = $pdo->prepare("SELECT * FROM material_store_house WHERE material_id = '$material_id' AND `date` BETWEEN '$startdate' AND '$enddate' GROUP BY material_id ORDER BY id LIMIT :offset, :numOfrecs");
                  $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
                  $stmt->bindValue(':numOfrecs', $numOfrecs, PDO::PARAM_INT);
                  $stmt->execute();
                }
                if(str_contains($filtertype, needle: 'eachmaterialbalance-')){
                  $data = explode("-", $filtertype);
                  $material_id = $data[1];
                  $stmt = $pdo->prepare("SELECT * FROM material_store_house WHERE material_id = '$material_id' AND `date` BETWEEN '$startdate' AND '$enddate' GROUP BY material_id ORDER BY id");
                  $stmt->execute();
                  $rawResult = $stmt->fetchAll();
                  $total_pages = ceil(count($rawResult) / $numOfrecs);

                  $stmt = $pdo->prepare("SELECT * FROM material_store_house WHERE material_id = '$material_id' AND `date` BETWEEN '$startdate' AND '$enddate' GROUP BY material_id ORDER BY id LIMIT :offset, :numOfrecs");
                  $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
                  $stmt->bindValue(':numOfrecs', $numOfrecs, PDO::PARAM_INT);
                  $stmt->execute();
                }
                if(str_contains($filtertype, needle: 'eachmaterialbalanceamount-')){
                  $data = explode("-", $filtertype);
                  $material_id = $data[1];
                  $stmt = $pdo->prepare("SELECT * FROM material_store_house WHERE material_id = '$material_id' AND `date` BETWEEN '$startdate' AND '$enddate' GROUP BY material_id ORDER BY id");
                  $stmt->execute();
                  $rawResult = $stmt->fetchAll();
                  $total_pages = ceil(count($rawResult) / $numOfrecs);

                  $stmt = $pdo->prepare("SELECT * FROM material_store_house WHERE material_id = '$material_id' AND `date` BETWEEN '$startdate' AND '$enddate' GROUP BY material_id ORDER BY id LIMIT :offset, :numOfrecs");
                  $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
                  $stmt->bindValue(':numOfrecs', $numOfrecs, PDO::PARAM_INT);
                  $stmt->execute();
                }
              }
              $datas = $stmt->fetchAll();
            
              ?>
              <?php
              $no = 1;
              $inbalance = 0;
              $outbalance = 0;
              $balance = 0;
              foreach ($datas as $data) {
                $material_id = $data['material_id'];
                $supplier_id = $data['supplier_id'];

                $stmt = $pdo->prepare("SELECT * FROM materials WHERE id='$material_id'");
                $stmt->execute();
                $material = $stmt->fetch(PDO::FETCH_ASSOC);

                $supplierstmt = $pdo->prepare("SELECT * FROM supplier WHERE supplier_id='$supplier_id'");
                $supplierstmt->execute();
                $supplier = $supplierstmt->fetch(PDO::FETCH_ASSOC);
                
                $in = $data['in'];
                $out = $data['out'];
                // if(empty($_SESSION['in']) || empty($_SESSION['out'])){
                //   $totalinstmt = $pdo->prepare("SELECT SUM(`in`) as totalin FROM material_store_house WHERE material_id='$material_id'");
                //   $totalinstmt->execute();
                //   $totalin = $totalinstmt->fetch(PDO::FETCH_ASSOC);

                //   $totaloutstmt = $pdo->prepare("SELECT SUM(`out`) as totalout FROM material_store_house WHERE material_id='$material_id'");
                //   $totaloutstmt->execute();
                //   $totalout = $totaloutstmt->fetch(PDO::FETCH_ASSOC);
                //   $balance = $totalin['totalin'] - $totalout['totalout'];
                // }else{
                //   $outbalance +=  $out;
                //   $inbalance +=  $in;
                //   $balance += $in - $out;
                // }

                if(!empty($_SESSION['filtertype'])){
                  $filtertype = $_SESSION['filtertype'];
                  if($filtertype == 'all'){
                    $balance += $in - $out;
                  }
                  if($filtertype == 'totalin'){
                    $balance += $in;
                  }
                  if($filtertype == 'totalout'){
                    $balance += $out;
                  }
                  if(str_contains($filtertype, 'eachmaterialinout-')){
                    $balance += $in - $out;
                  }
                  if(str_contains($filtertype, 'eachmaterialtotalinout-')){
                    $totalinstmt = $pdo->prepare("SELECT SUM(`in`) as totalin FROM material_store_house WHERE material_id='$material_id' AND `date` BETWEEN '$startdate' AND '$enddate'");
                    $totalinstmt->execute();
                    $totalin = $totalinstmt->fetch(PDO::FETCH_ASSOC);

                    $totaloutstmt = $pdo->prepare("SELECT SUM(`out`) as totalout FROM material_store_house WHERE material_id='$material_id' AND `date` BETWEEN '$startdate' AND '$enddate'");
                    $totaloutstmt->execute();
                    $totalout = $totaloutstmt->fetch(PDO::FETCH_ASSOC);
                  }

                  if(str_contains($filtertype, 'eachmaterialbalance-')){
                    $totalinstmt = $pdo->prepare("SELECT SUM(`in`) as totalin FROM material_store_house WHERE material_id='$material_id' AND `date` BETWEEN '$startdate' AND '$enddate'");
                    $totalinstmt->execute();
                    $totalin = $totalinstmt->fetch(PDO::FETCH_ASSOC);

                    $totaloutstmt = $pdo->prepare("SELECT SUM(`out`) as totalout FROM material_store_house WHERE material_id='$material_id' AND `date` BETWEEN '$startdate' AND '$enddate'");
                    $totaloutstmt->execute();
                    $totalout = $totaloutstmt->fetch(PDO::FETCH_ASSOC);

                    $balance = $totalin['totalin'] - $totalout['totalout'];
                  }

                  if(str_contains($filtertype, 'eachmaterialbalanceamount-')){
                    $totalinstmt = $pdo->prepare("SELECT SUM(`in`) as totalin FROM material_store_house WHERE material_id='$material_id' AND `date` BETWEEN '$startdate' AND '$enddate'");
                    $totalinstmt->execute();
                    $totalin = $totalinstmt->fetch(PDO::FETCH_ASSOC);

                    $totaloutstmt = $pdo->prepare("SELECT SUM(`out`) as totalout FROM material_store_house WHERE material_id='$material_id' AND `date` BETWEEN '$startdate' AND '$enddate'");
                    $totaloutstmt->execute();
                    $totalout = $totaloutstmt->fetch(PDO::FETCH_ASSOC);

                    $purchasestmt = $pdo->prepare("SELECT * FROM material_purchase WHERE material_id='$material_id' AND `date` BETWEEN '$startdate' AND '$enddate'");
                    $purchasestmt->execute();
                    $purchasedatas = $purchasestmt->fetchAll();
                    $totalamount = 0;

                    foreach($purchasedatas as $purchasedata){
                      echo $totalamount += $purchasedata['quantity'] * $purchasedata['rate'];
                    }

                    $totalinstmt = $pdo->prepare("SELECT SUM(`in`) as totalin FROM material_store_house WHERE material_id='$material_id' AND `date` BETWEEN '$startdate' AND '$enddate'");
                    $totalinstmt->execute();
                    $totalin = $totalinstmt->fetch(PDO::FETCH_ASSOC);

                    $totaloutstmt = $pdo->prepare("SELECT SUM(`out`) as totalout FROM material_store_house WHERE material_id='$material_id' AND `date` BETWEEN '$startdate' AND '$enddate'");
                    $totaloutstmt->execute();
                    $totalout = $totaloutstmt->fetch(PDO::FETCH_ASSOC);

                    $balance = $totalin['totalin'] - $totalout['totalout'];

                  }
                }
              ?>

              <tr>
                <?php
                  if(!empty($_SESSION['filtertype'])){
                    $filtertype = $_SESSION['filtertype'];
    
                    if($filtertype == 'all'){
                    ?>
                      <td><?php echo $no; ?></td>
                      <td><?php echo date('d-m-Y', strtotime($data['date'])); ?></td>
                      <td><?php echo $data['voucher_no']; ?></td>
                      <td><?php echo $supplier['supplier_name']; ?></td>
                      <td><?php echo $material['name']; ?></td>
                      <td><?php echo $material['unit']; ?></td>
                      <td style="color: green; font-weight: bolder;"><?php if($in == ''){echo '-';}else{echo $in;}; ?></td>
                      <td style="color: red; font-weight: bolder;"><?php if($out == ''){echo '-';}else{echo $out;}; ?></td>
                      <td style="color: blue; font-weight: bolder;"><?php if($balance == ''){echo '-';}else{echo $balance;}; ?></td> 
                    <?php
                    }
                    if($filtertype == 'totalin'){
                      ?>
                      <td><?php echo $no; ?></td>
                      <td><?php echo date('d-m-Y', strtotime($data['date'])); ?></td>
                      <td><?php echo $data['voucher_no']; ?></td>
                      <td><?php echo $supplier['supplier_name']; ?></td>
                      <td><?php echo $material['name']; ?></td>
                      <td><?php echo $material['unit']; ?></td>
                      <td style="color: green; font-weight: bolder;"><?php if($in == ''){echo '-';}else{echo $in;}; ?></td>
                      <td style="color: blue; font-weight: bolder;"><?php if($balance == ''){echo '-';}else{echo $balance;}; ?></td> 
                    <?php
                    }
                    if($filtertype == 'totalout'){
                      ?>
                      <td><?php echo $no; ?></td>
                      <td><?php echo date('d-m-Y', strtotime($data['date'])); ?></td>
                      <td><?php echo $data['voucher_no']; ?></td>
                      <td><?php echo $supplier['supplier_name']; ?></td>
                      <td><?php echo $material['name']; ?></td>
                      <td><?php echo $material['unit']; ?></td>
                      <td style="color: red; font-weight: bolder;"><?php if($out == ''){echo '-';}else{echo $out;}; ?></td>
                      <td style="color: blue; font-weight: bolder;"><?php if($balance == ''){echo '-';}else{echo $balance;}; ?></td> 
                    <?php
                    }
                    if(str_contains($filtertype, 'eachmaterialinout-')){
                      ?>
                      <td><?php echo $no; ?></td>
                      <td><?php echo date('d-m-Y', strtotime($data['date'])); ?></td>
                      <td><?php echo $data['voucher_no']; ?></td>
                      <td><?php echo $supplier['supplier_name']; ?></td>
                      <td><?php echo $material['name']; ?></td>
                      <td><?php echo $material['unit']; ?></td>
                      <td style="color: red; font-weight: bolder;"><?php if($in == ''){echo '-';}else{echo $in;}; ?></td>
                      <td style="color: red; font-weight: bolder;"><?php if($out == ''){echo '-';}else{echo $out;}; ?></td>
                      <td style="color: blue; font-weight: bolder;"><?php if($balance == ''){echo '-';}else{echo $balance;}; ?></td> 
                    <?php
                    }
                    if(str_contains($filtertype, 'eachmaterialtotalinout-')){
                      ?>
                      <td><?php echo $no; ?></td>
                      <td><?php echo date('d-m-Y', strtotime($data['date'])); ?></td>
                      <td><?php echo $data['voucher_no']; ?></td>
                      <td><?php echo $supplier['supplier_name']; ?></td>
                      <td><?php echo $material['name']; ?></td>
                      <td><?php echo $material['unit']; ?></td>
                      <td style="color: green; font-weight: bolder;"><?php if($totalin['totalin'] == ''){echo '-';}else{echo $totalin['totalin'];}; ?></td>
                      <td style="color: red; font-weight: bolder;"><?php if($totalout['totalout'] == ''){echo '-';}else{echo $totalout['totalout'];}; ?></td>
                    <?php
                    }
                    if(str_contains($filtertype, 'eachmaterialbalance-')){
                      ?>
                      <td><?php echo $no; ?></td>
                      <td><?php echo date('d-m-Y', strtotime($data['date'])); ?></td>
                      <td><?php echo $data['voucher_no']; ?></td>
                      <td><?php echo $supplier['supplier_name']; ?></td>
                      <td><?php echo $material['name']; ?></td>
                      <td><?php echo $material['unit']; ?></td>
                      <td style="color: blue; font-weight: bolder;"><?php if($balance == ''){echo '-';}else{echo $balance;}; ?></td> 
                    <?php
                    }
                    if(str_contains($filtertype, 'eachmaterialbalanceamount-')){
                      ?>
                      <td><?php echo $no; ?></td>
                      <td><?php echo date('d-m-Y', strtotime($data['date'])); ?></td>
                      <td><?php echo $data['voucher_no']; ?></td>
                      <td><?php echo $supplier['supplier_name']; ?></td>
                      <td><?php echo $material['name']; ?></td>
                      <td><?php echo $material['unit']; ?></td>
                      <td style="color: blue; font-weight: bolder;"><?php if($balance == ''){echo '-';}else{echo $balance;}; ?></td> 
                      <td style="color: blue; font-weight: bolder;"><?php if($totalamount == ''){echo '-';}else{echo $totalamount;}; ?></td> 
                    <?php
                    }
                  }
                ?>               
              </tr>
              <?php
              $no++;
              };
              ?>

            </table>
            <br>
            <div aria-label="Page navigation example" style="float:right;">
              <ul class="pagination">
                <li class="page-item"><a class="page-link" href="?pageno=1">First</a></li>
                <li class="page-item <?php if($pageno <= 1){echo 'disabled';} ?>">
                  <a class="page-link" href="<?php if($pageno <= 1){echo '#';} else {echo "?pageno=".($pageno-1);} ?>">Previous</a>
                </li>
                <li class="page-item"><a class="page-link" href="#"><?php echo $pageno; ?></a></li>
                <li class="page-item <?php if($pageno >= $total_pages){echo 'disabled';}; ?>">
                  <a class="page-link" href="<?php if($pageno >= $total_pages){echo '#';}else{echo "?pageno=".($pageno+1);} ?>">Next</a>
                </li>
                <li class="page-item"><a class="page-link" href="?pageno=<?php echo $total_pages; ?>">Last</a> </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  <?php
  $bootstrap->javascript();
  ?>
  </body>
</html>
