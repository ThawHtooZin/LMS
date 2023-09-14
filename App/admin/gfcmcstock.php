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

    if(isset($_POST['exportbtn'])){
      $exportdate = $_POST['exportdate'];
      $exportparticular = $_POST['exportparticular'];
      $exportcommondity_id = $_POST['exportcommondity_id'];
      $exportsize = $_POST['exportsize'];
      $exportkg = $_POST['exportkg'];
      $exportmc = $_POST['exportmc'];
      $exportcountry = $_POST['exportcountry'];

      $exportcheckstmt = $pdo->prepare("SELECT * FROM gfcmcstock WHERE size='$exportsize' AND country='$exportcountry' AND commondity_id='$exportcommondity_id' ORDER BY id DESC");
      $exportcheckstmt->execute();
      $exportcheck = $exportcheckstmt->fetch(PDO::FETCH_ASSOC);

      if($exportcheck['balance_mc'] >= $exportmc){
        echo $query->exportmcstock($exportdate, $exportparticular, $exportcountry, $exportcommondity_id, $exportsize, $exportkg, $exportmc);
      }else{
        echo '<script>swal("Sorry!", "Not Enough Mc!", "warning");</script>';
      }
    }
     ?>
    <div class="row">
      <div class="col-2">
        <?php
        include 'sidebar.php';
        ?>
      </div>
      <div class="col-10">
        <div class="card mt-1">
          <div class="card-header bg-info">
            <h5 style="font-weight:bold;" class="text-light d-inline">GFC MC STOCK</h5>
            <button type="button" class="btn btn-danger float-end ms-2" data-bs-toggle="modal" data-bs-target="#export">Export Mc</button>
          </div>
          <div class="card-body">
            <?php
             ?>
            <form action="" method="post" class="text-center">
              <?php
              $countrystmt = $pdo->prepare("SELECT DISTINCT country FROM form7stock WHERE country IS NOT NULL");
              $countrystmt->execute();
              $countrydatas = $countrystmt->fetchall();
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
             ?>
            <table class="table table-hover table-bordered table-striped hide" id="<?php echo $countrydata['country']; ?>table">
              <tr>
                <th>Commondity</th>
                <th>Country</th>
                <th>Size</th>
                <th>Total Mc</th>
                <th>Action</th>
              </tr>
              <?php
              $country = $countrydata['country'];
              $stmt = $pdo->prepare("SELECT * FROM gfcmcstock WHERE country='$country' GROUP BY commondity_id,size");
              $stmt->execute();
              $datas = $stmt->fetchall();
              foreach ($datas as $gfcstockdata) {
                $item_id = $gfcstockdata['commondity_id'];
                $commonditydata = $query->select('item', $item_id, 'item_id');
                $size = $gfcstockdata['size'];
                $kg = $gfcstockdata['kg'];
                $commondity_id = $gfcstockdata['commondity_id'];
                $sizestmt = $pdo->prepare("SELECT * FROM gfcmcstock WHERE size='$size' ORDER BY id DESC");
                $sizestmt->execute();
                $sizedata = $sizestmt->fetch(PDO::FETCH_ASSOC);
                $totalmcstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM gfcmcstock WHERE size='$size' AND country='$country' AND commondity_id='$commondity_id' AND particular='HHK to GFC'");
                $totalmcstmt->execute();
                $totalmcnotsub = $totalmcstmt->fetch(PDO::FETCH_ASSOC);
                $totalmcsubnumstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM gfcmcstock WHERE size='$size' AND country='$country' AND commondity_id='$commondity_id' AND particular!='HHK to GFC'");
                $totalmcsubnumstmt->execute();
                $totalmcsubnum = $totalmcsubnumstmt->fetch(PDO::FETCH_ASSOC);
                $totalmc = $totalmcnotsub['total_mc'] - $totalmcsubnum['total_mc'];
               ?>
              <tr>
                <td><?php echo $commonditydata['item_name']; ?></td>
                <td><?php echo $countrydata['country']; ?></td>
                <td><?php echo $gfcstockdata['size']; ?></td>
                <td><?php echo $totalmc; ?></td>
                <td>
                  <a href="gfcmc_stock_info.php?sizeinfo=<?php echo $gfcstockdata['size']; ?>&commondity=<?php echo $gfcstockdata['commondity_id']; ?>&country=<?php echo $gfcstockdata['country']; ?>" class="btn btn-info btn-sm text-light">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list-check" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3.854 2.146a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 3.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 7.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 0 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0z"/></svg></a>
                </td>
              </tr>
              <?php
              }
               ?>
            </table>
            <?php
            }
             ?>
          </div>
        </div>
      </div>
    </div>
    <div class="modal fade" id="export">
      <div class="modal-dialog" role="document">
        <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
          <div class="modal-header bg-secondary text-light">
            <h1 class="modal-title fs-5">Export Mc</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
        <form action="gfcmcstock.php" method="post">
          <div class="modal-body">
            <div class="row">
              <div class="col">
                <label>Date</label>
                <input type="date" name="exportdate" class="form-control inpv2 mb-2">
                <label>Commondity</label>
                <select class="form-control inpv2 mb-2" name="exportcommondity_id">
                  <?php
                  $form7commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM form7stock");
                  $form7commonditystmt->execute();
                  $form7commonditydatas = $form7commonditystmt->fetchall();
                  foreach ($form7commonditydatas as $form7commonditydata) {
                    $item_id = $form7commonditydata['item_id'];
                    $commonditydata = $query->select('item', $item_id, 'item_id');
                    ?>
                    <option value="<?php echo $commonditydata['item_id']; ?>"><?php echo $commonditydata['item_name']; ?></option>
                    <?php
                  }
                  ?>
                </select>
              </div>
              <div class="col">
                <label>Particular</label>
                <textarea name="exportparticular" rows="4" class="form-control inpv2 mb-2">Ship/</textarea>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label>Country</label>
                <select class="form-control inpv2 mb-2" name="exportcountry">

                  <?php
                  $countrystmt = $pdo->prepare("SELECT DISTINCT country FROM form7stock WHERE country IS NOT NULL");
                  $countrystmt->execute();
                  $countrydatas = $countrystmt->fetchall();
                  foreach ($countrydatas as $countrydata) {
                    ?>
                    <option value="<?php echo $countrydata['country']; ?>"><?php echo $countrydata['country']; ?></option>
                    <?php
                  }
                  ?>
                </select>
              </div>
              <div class="col">
                <label>Size</label>
                <input type="text" name="exportsize" class="form-control inpv2 mb-2">
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label>Kg</label>
                <input type="text" name="exportkg" class="form-control inpv2 mb-2">
              </div>
              <div class="col">
                <label>Mc</label>
                <input type="number" name="exportmc" class="form-control inpv2 mb-2">
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-success" name="exportbtn">Export</button>
          </div>
        </form>
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
