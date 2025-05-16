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
      <div class="card">
        <form class="" action="" method="post">
          <div class="card-header bg-success">

            <h4 style="font-weight:bold;" class="text-light d-inline">Mc Reports</h4>
            <a href="export.php?table_name=mcstockreport" class="btn btn-primary btn-sm float-end ms-2">Excel Report</a>
            <button type="submit" name="commonditybtn" class="btn btn-info text-light btn-sm float-end ms-2">View</button>
            <select class="form-control w-25 d-inline float-end" style="height:26px; padding-left:10px; padding-top:2px;" name="commondity_id">
              <option value="">View Each Commondity</option>
              <?php
              $countrystmt = $pdo->prepare("SELECT DISTINCT country FROM hhkmcstock WHERE country IS NOT NULL
              UNION
              SELECT DISTINCT country FROM gfcmcstock WHERE country IS NOT NULL;
              ");
              $countrystmt->execute();
              $countrydatas = $countrystmt->fetchall();

              // foreach ($hhkcommonditydatas as $hhkcommonditydata) {
                // $item_id = $hhkcommonditydata['commondity_id'];
                // echo "<script>alert('$item_id')</script>";
                // $commonditydata = $query->select('item', $item_id, 'item_id');
              ?>
                <!-- <option value="<?php echo $commonditydata['item_id']; ?>"><?php echo $commonditydata['item_name']; ?></option> -->
              <?php
              // }
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
              if (isset($_POST[$btnname])) {
                $_SESSION['tabs'] = $countrydata['country'];
              }
            ?>
              <button type="submit" class="pb-2 pt-2 ps-4 pe-4 text-dark rounded <?php echo $countrydata['country']; ?>link" style="text-decoration:none; border:none;" name="<?php echo $btnname; ?>"><?php echo $countrydata['country'] . " Stock"; ?></button>
            <?php
            }
            ?>
          </form>
          <hr>
            <table class="table table-hover table-bordered table-striped">  
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
                $country = $_SESSION['tabs'];
                
                $datastmt = $pdo->prepare("SELECT commondity_id, size, kg, country FROM hhkmcstock WHERE country='$country' UNION SELECT commondity_id, size, kg, country FROM gfcmcstock WHERE country='$country'");
                $datastmt->execute();
                $datas = $datastmt->fetchAll();
                $no = 1;
                foreach ($datas as $data) {
                  $item_id = $data['commondity_id'];
                  $commonditydata = $query->select('item', $item_id, 'item_id');
                  ?>
                <tr style="text-align:center !important;">
                  <td><?php echo $no; ?></td>
                  <td><?php echo $commonditydata['item_name'] ?></td>
                  <td><?php echo $data['size'] ?></td>
                </tr>
                  <?php
                  $no++;
                }
              ?>

            </table>
        </div>
      </div>
    </div>
  </div>

  <script type="text/javascript">
    <?php
    foreach ($countrydatas as $countrydata) {
      if ($_SESSION['tabs'] == $countrydata['country']) {
        echo "show" . $countrydata['country'] . "();";
        if ($_SESSION['tabs'] == $countrydata['country']) {
          echo ' function show' . $countrydata['country'] . '(){';
          foreach ($countrydatas as $countrydata) {
            echo 'document.querySelector(".' . $countrydata['country'] . 'link").classList.remove(\'color\');';
          }
          echo 'document.querySelector(".' . $_SESSION['tabs'] . 'link").classList.add(\'color\');';
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