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
        <div class="card mt-1">
          <div class="card-header bg-info">
            <form class="" action="" method="post">

            <h5 style="font-weight:bold;" class="text-light d-inline">GFC MC STOCK INFO</h5>
            <!-- <button type="button" class="btn btn-secondary float-end" data-bs-toggle="modal" data-bs-target="#add">Add Mc Data</button> -->
            <a href="gfcmcstock.php" type="button" class="btn btn-danger float-end ms-2">Back</a>
            <?php
            $size = $_GET['sizeinfo'];
            $commondity_id = $_GET['commondity'];
            $country = $_GET['country'];
            $kgstmt = $pdo->prepare("SELECT DISTINCT kg FROM gfcmcstock WHERE commondity_id='$commondity_id' AND size='$size' AND country='$country'");
            $kgstmt->execute();
            $kgdatas = $kgstmt->fetchall();
            ?>
              <button type="submit" name="view" class="btn btn-secondary float-end ms-2">View</button>
              <select class="form-control inpv2 mb-2 w-25 d-inline float-end" style="border:none !important;" name="kgsearch">
                <option value="">View Each Kg</option>
                <?php
                foreach ($kgdatas as $kgdata) {
                  ?>
                  <option value="<?php echo $kgdata['kg']; ?>"><?php echo $kgdata['kg']; ?></option>
                  <?php
                }
                ?>
              </select>
          </div>
        </form>
          <div class="card-body">
            <table class="table table-hover table-bordered table-striped">
              <tr>
                <th>Date</th>
                <th>Particular</th>
                <th>Commondity</th>
                <th>Country</th>
                <th>Size</th>
                <th>Kg</th>
                <th>Mc</th>
                <th>Balance Mc</th>
              </tr>
              <?php


              if (isset($_POST['view']) && !empty($_POST['kgsearch'])) {
                $kgsearch = $_POST['kgsearch'];
                $sizeinfostmt2 = $pdo->prepare("SELECT * FROM gfcmcstock WHERE commondity_id='$commondity_id' AND size='$size' AND country='$country' AND kg='$kgsearch'");
                $sizeinfostmt2->execute();
                $sizeinfodatas = $sizeinfostmt2->fetchall();
              }else{
                $sizeinfostmt = $pdo->prepare("SELECT * FROM gfcmcstock WHERE commondity_id='$commondity_id' AND size='$size' AND country='$country'");
                $sizeinfostmt->execute();
                $sizeinfodatas = $sizeinfostmt->fetchall();
              }
              foreach ($sizeinfodatas as $sizeinfodata) {
                $kg = $sizeinfodata['kg'];
                $item_id = $sizeinfodata['commondity_id'];
                $commonditydata = $query->select('item', $item_id, 'item_id');
               ?>
               <tr style="<?php if(str_contains($sizeinfodata['particular'], 'Ship')){echo 'background-color:rgba(255, 0, 0, 0.3) !important;';} ?>">
                <td><?php echo date('d-m-Y', strtotime($sizeinfodata['date'])); ?></td>
                <td><?php echo $sizeinfodata['particular'];?></td>
                <td><?php echo $commonditydata['item_name']; ?></td>
                <td><?php echo $sizeinfodata['country'];?></td>
                <td><?php echo $sizeinfodata['size']; ?></td>
                <td><?php echo $sizeinfodata['kg']; ?></td>
                <td><?php echo $sizeinfodata['mc']; ?></td>
                <td><?php echo $sizeinfodata['balance_mc']; ?></td>
              </tr>
              <?php
              }

               ?>
            </table>
          </div>
        </div>
      </div>
    </div>
    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
