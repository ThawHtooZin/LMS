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
    <?php
    if(isset($_POST['addbtn'])){
      $date = $_POST['date'];
      $particular = $_POST['particular'];
      $commondity_id = $_POST['commondity_id'];
      $size = $_POST['size'];
      $kg = $_POST['kg'];
      $mc = $_POST['mc'];
      $country = $_POST['country'];

      $query->addmcstock($date, $particular, $country, $commondity_id, $size, $kg, $mc);
    }

    // if(isset($_POST['transferbtn'])){
    //   $transferdate = $_POST['transferdate'];
    //   $transferparticular = $_POST['transferparticular'];
    //   $transfercommondity_id = $_POST['transfercommondity_id'];
    //   $transfersize = $_POST['transfersize'];
    //   $transferkg = $_POST['transferkg'];
    //   $transfermc = $_POST['transfermc'];
    //   $transfercountry = $_POST['transfercountry'];
    //
    //   $transfercheckstmt = $pdo->prepare("SELECT * FROM hhkmcstock WHERE size='$transfersize' AND country='$transfercountry' AND commondity_id='$transfercommondity_id' ORDER BY id DESC");
    //   $transfercheckstmt->execute();
    //   $transfercheck = $transfercheckstmt->fetch(PDO::FETCH_ASSOC);
    //
    //   if($transfercheck['balance_mc'] >= $transfermc){
    //     echo $query->transfermcstock($transferdate, $transferparticular, $transfercountry, $transfercommondity_id, $transfersize, $transferkg, $transfermc);
    //   }else{
    //     echo '<script>swal("Sorry!", "Not Enough Mc!", "warning");</script>';
    //   }
    // }
     ?>
    <div class="row">
      <div class="sidebarcol" id="sidebar">
        <?php
        include 'sidebar.php';
        ?>
      </div>
      <div class="contentcol" id="content">
        <?php require 'navbar.php'; ?>
        <div class="card">
          <form class="" action="" method="post">
          <div class="card-header bg-success">

            <h4 style="font-weight:bold;" class="text-light d-inline">Mc Reports</h4>
            <a href="export.php?table_name=mcstockreport" class="btn btn-primary btn-sm float-end ms-2">Excel Report</a>
            <button type="submit" name="commonditybtn" class="btn btn-info text-light btn-sm float-end ms-2">View</button>
            <select class="form-control w-25 d-inline float-end" style="height:26px; padding-left:10px; padding-top:2px;" name="commondity_id">
              <option value="">View Each Commondity</option>
              <?php
              $countrystmt = $pdo->prepare("SELECT DISTINCT country FROM hhkmcstock WHERE country IS NOT NULL");
              $countrystmt->execute();
              $countrydatas = $countrystmt->fetchall();

              echo $country = $_SESSION['tabs'];
              $hhkcommonditystmt = $pdo->prepare("SELECT DISTINCT commondity_id FROM hhkmcstock WHERE country='$country'");
              $hhkcommonditystmt->execute();
              $hhkcommonditydatas = $hhkcommonditystmt->fetchall();
              foreach ($hhkcommonditydatas as $hhkcommonditydata) {
                $item_id = $hhkcommonditydata['commondity_id'];
                $commonditydata = $query->select('item', $item_id, 'item_id');
                ?>
                <option value="<?php echo $commonditydata['item_id']; ?>"><?php echo $commonditydata['item_name']; ?></option>
                <?php
              }
              ?>
            </select>
            <?php
             ?>
          </div>
        </form>
          <div class="card-body">
          <?php
             ?>
            <form action="" method="post" class="text-center">
              <?php
              foreach ($countrydatas as $countrydata) {
                $btnname = $countrydata['country'] . "btn";
                if(isset($_POST[$btnname])){
                  $_SESSION['tabs'] = $countrydata['country'];
                }
                ?>
                <button type="submit" class="pb-2 pt-2 ps-4 pe-4 text-dark rounded <?php echo $countrydata['country']; ?>link" style="text-decoration:none; border:none;" name="<?php echo $btnname; ?>"><?php echo $countrydata['country'] ." Stock"; ?></button>
                <?php
              }
              ?>
            </form>
            <hr>
            <?php
            foreach ($countrydatas as $countrydata) {

              $country = $countrydata['country'];

              $hhkmcstockkgstmt = $pdo->prepare("SELECT commondity_id FROM hhkmcstock WHERE country='$country'");
              $hhkmcstockkgstmt->execute();
              $hhkmcstockkgdatas = $hhkmcstockkgstmt->fetchall();
             ?>
            <table class="table table-hover table-bordered table-striped hide" id="<?php echo $countrydata['country']; ?>table">
              <tr class="text-center">
                <th rowspan="2" style="padding-top:30px;">No</th>
                <th rowspan="2" style="padding-top:30px;">Fish Name</th>
                <th rowspan="2" style="padding-top:30px;">Country</th>
                <th rowspan="2" style="padding-top:30px;">Size</th>
                <th rowspan="2" style="padding-top:30px;">Kg</th>
                <th>HHK</th>
                <th>GFC</th>
                <th>Total</th>
              </tr>
              <tr class="text-center">
                <th>Mc</th>
                <th>Mc</th>
                <th>Mc</th>
              </tr>
              <?php
              $id = 0;
              if(isset($_POST['commonditybtn']) && !empty($_POST['commondity_id'])){
                $searchcommondity = $_POST['commondity_id'];
                $hhkmcstockcommonditystmt = $pdo->prepare("SELECT DISTINCT commondity_id FROM hhkmcstock WHERE commondity_id='$searchcommondity' AND country='$country'");
                $hhkmcstockcommonditystmt->execute();
                $hhkmcstockcommonditydatas = $hhkmcstockcommonditystmt->rowCount();
            }else{
                $hhkmcstockcommonditystmt = $pdo->prepare("SELECT DISTINCT commondity_id FROM hhkmcstock WHERE country='$country'");
                $hhkmcstockcommonditystmt->execute();
                $hhkmcstockcommonditydatas = $hhkmcstockcommonditystmt->rowCount();
            }
              for ($i=0; $i < $hhkmcstockcommonditydatas; $i++) {
                $commonditystmt = $pdo->prepare("SELECT DISTINCT commondity_id FROM hhkmcstock WHERE country='$country'");
                $commonditystmt->execute();
                $commonditydata = $commonditystmt->fetchall();
                $commondity_id = $commonditydata[$i]['commondity_id'];

                if(isset($_POST['commonditybtn']) && !empty($_POST['commondity_id'])){
                  $searchcommondity_id = $_POST['commondity_id'];
                  $searchstmt = $pdo->prepare("SELECT * FROM hhkmcstock WHERE commondity_id='$searchcommondity_id' AND country='$country' AND particular LIKE '%from%'");
                  $searchstmt->execute();
                  $datas = $searchstmt->fetchall();
                  //
                  // echo "<pre>";
                  // print_r($datas);
                }else{
                  $stmt = $pdo->prepare("SELECT * FROM hhkmcstock WHERE commondity_id='$commondity_id' AND country='$country' AND particular NOT LIKE '%to%' ");
                  $stmt->execute();
                  $datas = $stmt->fetchall();
                }


                foreach ($datas as $hhkdata) {
                  $id++;
                  $size = $hhkdata['size'];
                  $item_id = $hhkdata['commondity_id'];
                  $country = $hhkdata['country'];
                  $commonditydata = $query->select('item', $item_id, 'item_id');

                  $hhkcommonditystmt = $pdo->prepare("SELECT DISTINCT commondity_id FROM hhkmcstock WHERE size='$size' AND commondity_id='$item_id'");
                  $hhkcommonditystmt->execute();
                  $hhkcommonditydatas = $hhkcommonditystmt->fetchall();

                    $kg = $hhkdata['kg'];

                    $fetchallstmt = $pdo->prepare("SELECT balance_mc FROM hhkmcstock WHERE size='$size' AND commondity_id='$item_id' AND kg='$kg' ORDER BY id DESC");
                    $fetchallstmt->execute();
                    $fetchalldata = $fetchallstmt->fetch(PDO::FETCH_ASSOC);

                    $fetchallgfcstmt = $pdo->prepare("SELECT balance_mc FROM gfcmcstock WHERE size='$size' AND commondity_id='$item_id' AND kg='$kg' ORDER BY id DESC");
                    $fetchallgfcstmt->execute();
                    $fetchallgfcdata = $fetchallgfcstmt->fetch(PDO::FETCH_ASSOC);

                    $lastid = $hhkdata['id'];
                    $checklast = $pdo->prepare("SELECT * FROM hhkmcstock WHERE id < $lastid AND commondity_id='$item_id' AND size='$size'");
                    $checklast->execute();
                    $checklastavaliable = $checklast->fetch(PDO::FETCH_ASSOC);
                    $lastcommondity = $pdo->prepare("SELECT * FROM hhkmcstock WHERE id < $lastid AND commondity_id='$item_id' AND country='$country'");
                    $lastcommondity->execute();
                    $lastcommondity = $lastcommondity->fetch(PDO::FETCH_ASSOC);

                // $country = $hhkmcstockdata['country'];
                // $size = $hhkmcstockdata['size'];
                // $kg = $hhkmcstockdata['kg'];
                // $gfcmcstockstmt = $pdo->prepare("SELECT balance_mc FROM gfcmcstock WHERE country='$country' AND commondity_id='$item_id' AND size='$size' AND kg='$kg' ORDER BY id DESC");
                // $gfcmcstockstmt->execute();
                // $gfcmcstockdata = $gfcmcstockstmt->fetch(PDO::FETCH_ASSOC);


               ?>
               <tr style="text-align:center !important;">
              <!-- <tr style="text-align:center !important; <?php if($fetchalldata['balance_mc'] == 0 && empty($fetchallgfcdata['balance_mc'])){ echo "display:none;";} ?>"> -->
                <td><?php if(empty($lastcommondity)){ echo $id;} ?></td>
                <td><?php if(empty($lastcommondity)){ echo $commonditydata['item_name'];} ?></td>
                <td><?php if(empty($lastcommondity)){ echo $country; } ?></td>
                <td><?php if(empty($checklastavaliable)){ echo $size; } ?></td>
                <td><?php echo $kg; ?></td>
                <td><?php if($fetchalldata['balance_mc'] != 0){ echo $fetchalldata['balance_mc'];}else{echo "-";}; ?></td>
                <td><?php if(!empty($fetchallgfcdata['balance_mc'])){ echo $fetchallgfcdata['balance_mc'];}else{echo "-";};  ?></td>
                <td><?php if(!empty($fetchallgfcdata['balance_mc'])){echo $fetchalldata['balance_mc'] + $fetchallgfcdata['balance_mc'];}else{echo $fetchalldata['balance_mc'];};  ?></td>
              </tr>
              <?php
              }
              $hhktotalmcstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM hhkmcstock WHERE commondity_id='$item_id' AND particular LIKE '%from%' AND country='$country'");
              $hhktotalmcstmt->execute();
              $hhktotalmcnotsub = $hhktotalmcstmt->fetch(PDO::FETCH_ASSOC);
              $hhktotalmcsubnumstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM hhkmcstock WHERE commondity_id='$item_id' AND particular LIKE '%to%' AND country='$country'");
              $hhktotalmcsubnumstmt->execute();
              $hhktotalmcsubnum = $hhktotalmcsubnumstmt->fetch(PDO::FETCH_ASSOC);
              $hhktotalmc = $hhktotalmcnotsub['total_mc'] - $hhktotalmcsubnum['total_mc'];

              $gfctotalmcstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM gfcmcstock WHERE commondity_id='$item_id' AND particular LIKE '%to%' AND country='$country'");
              $gfctotalmcstmt->execute();
              $gfctotalmcnotsub = $gfctotalmcstmt->fetch(PDO::FETCH_ASSOC);
              $gfctotalmcsubnumstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM gfcmcstock WHERE commondity_id='$item_id' AND particular NOT LIKE '%to%' AND country='$country'");
              $gfctotalmcsubnumstmt->execute();
              $gfctotalmcsubnum = $gfctotalmcsubnumstmt->fetch(PDO::FETCH_ASSOC);
              $gfctotalmc = $gfctotalmcnotsub['total_mc'] - $gfctotalmcsubnum['total_mc'];

              ?>
              <!-- <tr style="background-color:#c1f5cf;"> -->
              <tr class="text-center">
                <td style="font-weight: bold;">Total</td>
                <td style="font-weight: bold;"></td>
                <td style="font-weight: bold;"></td>
                <td style="font-weight: bold;"></td>
                <td style="font-weight: bold;"></td>
                <td style="font-weight: bold;"><?php if($hhktotalmc != 0){echo $hhktotalmc;}else{echo "-";}; ?></td>
                <td style="font-weight: bold;"><?php if($gfctotalmc != 0){echo $gfctotalmc;}else{echo "-";}; ?></td>
                <td style="font-weight: bold;"><?php if($gfctotalmc != 0 || $hhktotalmc != 0){echo $hhktotalmc + $gfctotalmc;}else{echo "-";}; ?></td>
              </tr>
              <?php
            }
          }
               ?>
            </table>
            <?php
             ?>
          </div>
        </div>
      </div>
    </div>

    <script type="text/javascript">
    <?php
      foreach ($countrydatas as $countrydata) {
        if($_SESSION['tabs'] == $countrydata['country']){
          echo "show" . $countrydata['country'] . "();";
          if($_SESSION['tabs'] == $countrydata['country']){
          echo ' function show' . $countrydata['country'] .'(){';
            foreach ($countrydatas as $countrydata) {
              echo 'document.querySelector("#'.$countrydata['country'].'table").classList.add(\'hide\');';
              echo 'document.querySelector(".'.$countrydata['country'].'link").classList.remove(\'color\');';
            }
            echo 'document.querySelector("#'.$_SESSION['tabs'].'table").classList.remove(\'hide\');';
            echo 'document.querySelector(".'.$_SESSION['tabs'].'link").classList.add(\'color\');';
            echo '}';
          }
        }
      }
     ?>
    </script>
    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
