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
  if (isset($_POST['addbtn'])) {
    $date = $_POST['date'];
    $particular = $_POST['particular'];
    $commondity_id = $_POST['commondity_id'];
    $size = $_POST['size'];
    $fish_type = $_POST['fish_type1'];
    $kg = $_POST['kg'];
    $mc = $_POST['mc'];
    $country = $_POST['country'];

    $query->addgfcmcstock($date, $particular, $country, $commondity_id, $fish_type, $size, $kg, $mc);
  }

  if (isset($_POST['exportbtn'])) {
    $exportdate = $_POST['exportdate'];
    $exportparticular = $_POST['exportparticular'];
    $exportcommondity_id = $_POST['exportcommondity_id'];
    $exportfish_type = $_POST['exportfish_type'];
    $exportsize = $_POST['exportsize'];
    $exportkg = $_POST['exportkg'];
    $exportmc = $_POST['exportmc'];
    $exportcountry = $_POST['exportcountry'];

    $exportcheckstmt = $pdo->prepare("SELECT * FROM gfcmcstock WHERE size='$exportsize' AND country='$exportcountry' AND commondity_id='$exportcommondity_id' ORDER BY id DESC");
    $exportcheckstmt->execute();
    $exportcheck = $exportcheckstmt->fetch(PDO::FETCH_ASSOC);

    $query->exportmcstock($exportdate, $exportparticular, $exportcountry, $exportcommondity_id, $exportfish_type, $exportsize, $exportkg, $exportmc);
  }
  $countrystmt = $pdo->prepare("SELECT DISTINCT country FROM gfcmcstock WHERE country IS NOT NULL");
  $countrystmt->execute();
  $countrydatas = $countrystmt->fetchall();

  foreach ($countrydatas as $countrydata) {
    $btnname = $countrydata['country'] . "btn";
    if (isset($_POST[$btnname])) {
      $_SESSION['tabs'] = $countrydata['country'];
    }
  }
  ?>
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

          <h5 style="font-weight:bold;" class="text-light d-inline">GFC MC STOCK</h5>
          <button type="button" class="btn btn-danger float-end ms-2" data-bs-toggle="modal" data-bs-target="#export">Export Mc</button>
          <button type="button" class="btn btn-success float-end" data-bs-toggle="modal" data-bs-target="#add2">Add Balance</button>
          <form class="d-inline" action="gfcmcstock.php" method="post">
            <button type="submit" class="btn btn-primary float-end me-2" name="searchcommonditybtn">View</button>
            <?php
            $typestmt = $pdo->prepare("SELECT * FROM gfcmcstock WHERE country = :country GROUP BY fish_type");
            $typestmt->bindParam(':country', $_SESSION['tabs']);
            $typestmt->execute();
            $searchtype = $typestmt->fetchall();
            ?>
            <select class="inpv2 form-control d-inline me-2 float-end" name="searchtype" style="width: 10%;">
              <?php foreach ($searchtype as $type):
              ?>
                <option value="<?php echo $type['fish_type']; ?>"><?php echo $type['fish_type']; ?></option>
              <?php endforeach; ?>
            </select>
            <?php
            $commonditystmt = $pdo->prepare("SELECT * FROM gfcmcstock WHERE country = :country GROUP BY commondity_id");
            $commonditystmt->bindParam(':country', $_SESSION['tabs']);
            $commonditystmt->execute();
            $searchcommon = $commonditystmt->fetchall();
            ?>
            <select class="inpv2 form-control d-inline me-2 float-end" name="search" style="width: 10%;">
              <?php foreach ($searchcommon as $commondity_id):
                $item_id = $commondity_id['commondity_id'];
                $commonditydata = $query->select('item', $item_id, 'item_id');
              ?>
                <?php if (!empty($commondity_id)): ?>
                  <option value="<?php echo $commonditydata['item_id']; ?>"><?php echo $commonditydata['item_name']; ?></option>
                <?php else: ?>
                  <option value=""></option>
                <?php endif; ?>
              <?php endforeach; ?>
            </select>
          </form>
        </div>
        <div class="card-body">
          <?php
          ?>
          <form action="" method="post" class="text-center">
            <?php
            $countrystmt = $pdo->prepare("SELECT DISTINCT country FROM gfcmcstock WHERE country IS NOT NULL");
            $countrystmt->execute();
            $countrydatas = $countrystmt->fetchall();

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
              if (isset($_POST['searchcommonditybtn']) && !empty($_POST['search'])) {
                $searchcommondity = $_POST['search'];
                $searchtype = $_POST['searchtype'];
                $searchcommonditystmt = $pdo->prepare("SELECT * FROM gfcmcstock WHERE country = :country AND commondity_id='$searchcommondity' AND fish_type='$searchtype' GROUP BY commondity_id,size");
                $searchcommonditystmt->bindParam(':country', $_SESSION['tabs']);
                $searchcommonditystmt->execute();
                $datas = $searchcommonditystmt->fetchall();
              } else {
                $stmt = $pdo->prepare("SELECT * FROM gfcmcstock WHERE country='$country' GROUP BY commondity_id,size");
                $stmt->execute();
                $datas = $stmt->fetchall();
              }
              foreach ($datas as $gfcstockdata) {
                $item_id = $gfcstockdata['commondity_id'];
                $commonditydata = $query->select('item', $item_id, 'item_id');
                $size = $gfcstockdata['size'];
                $kg = $gfcstockdata['kg'];
                $commondity_id = $gfcstockdata['commondity_id'];
                $sizestmt = $pdo->prepare("SELECT * FROM gfcmcstock WHERE size='$size' ORDER BY id DESC");
                $sizestmt->execute();
                $sizedata = $sizestmt->fetch(PDO::FETCH_ASSOC);
                // IN
                $totalmcstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM gfcmcstock WHERE size='$size' AND country='$country' AND commondity_id='$commondity_id' AND particular='HHK to GFC'");
                $totalmcstmt->execute();
                $totalmcnotsub = $totalmcstmt->fetch(PDO::FETCH_ASSOC);

                // Ship
                $totalmcsubnumstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM gfcmcstock WHERE size='$size' AND country='$country' AND commondity_id='$commondity_id' AND particular='ship'");
                $totalmcsubnumstmt->execute();
                $totalmcsubnum = $totalmcsubnumstmt->fetch(PDO::FETCH_ASSOC);

                // Balance
                $totalbalancemcsubnumstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM gfcmcstock WHERE size='$size' AND country='$country' AND commondity_id='$commondity_id' AND particular LIKE '%balance%' ");
                $totalbalancemcsubnumstmt->execute();
                $totalbalancemcsubnum = $totalbalancemcsubnumstmt->fetch(PDO::FETCH_ASSOC);

                // if($gfcstockdata['particular'] == 'balance' || $gfcstockdata['particular'] == 'Balance' && $totalmcnotsub['total_mc'] != 0){
                //   $totalmc = $totalmcsubnum['total_mc'];
                // }else{
                //   echo $gfcstockdata['particular'];
                //   echo $totalmcnotsub['total_mc'];
                // }
                if (str_contains($gfcstockdata['particular'], 'balance')) {
                  $totalmc = $totalmcsubnum['total_mc'];
                }
                $totalmc = $totalmcnotsub['total_mc'] - $totalmcsubnum['total_mc'] + $totalbalancemcsubnum['total_mc'];

                // Balance
                $totalbalanceoutstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM gfcmcstock WHERE size='$size' AND country='$country' AND commondity_id='$commondity_id' AND particular LIKE '%out%' ");
                $totalbalanceoutstmt->execute();
                $totalbalanceout = $totalbalanceoutstmt->fetch(PDO::FETCH_ASSOC);

                $totalmc = $totalmc - $totalbalanceout['total_mc'];
              ?>
                <tr style="<?php if ($totalmc > 200) {
                              echo 'background-color:rgba(0, 255, 0, 0.4) !important;';
                            } ?>">
                  <td><?php if (!empty($gfcstockdata['fish_type'])) {
                        echo $commonditydata['item_name'] . ' (' . $gfcstockdata['fish_type'] . ')';
                      } else {
                        echo $commonditydata['item_name'];
                      } ?></td>
                  <td><?php echo $countrydata['country']; ?></td>
                  <td><?php echo $gfcstockdata['size']; ?></td>
                  <td><?php echo $totalmc; ?></td>
                  <td>
                    <a href="gfcmc_stock_info.php?sizeinfo=<?php echo $gfcstockdata['size']; ?>&commondity=<?php echo $gfcstockdata['commondity_id']; ?>&country=<?php echo $gfcstockdata['country']; ?>" class="btn btn-info btn-sm text-light">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list-check" viewBox="0 0 16 16">
                        <path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3.854 2.146a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 3.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 7.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 0 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0z" />
                      </svg></a>
                  </td>
                </tr>
              <?php
              }
              ?>
            </table>
            <?php

            $form7commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM form7stock");
            $form7commonditystmt->execute();
            $form7commonditydatas = $form7commonditystmt->fetchall();
            $countrystmt = $pdo->prepare("SELECT DISTINCT country FROM form7stock WHERE country IS NOT NULL");
            $countrystmt->execute();
            $countrydatas = $countrystmt->fetchall();

            ?>
            <script type="text/javascript">
              <?php
              if ($_SESSION['tabs'] == $countrydata['country']) {
                echo "show" . $countrydata['country'] . "();";
                if ($_SESSION['tabs'] == $countrydata['country']) {
                  echo ' function show' . $countrydata['country'] . '(){';
                  // foreach ($countrydatas as $countrydata) {
                  //   echo 'document.querySelector("#'.$countrydata['country'].'table").classList.add(\'hide\');';
                  //   echo 'document.querySelector(".'.$countrydata['country'].'link").classList.remove(\'color\');';
                  // }
                  echo 'document.querySelector("#' . $_SESSION['tabs'] . 'table").classList.remove(\'hide\');';
                  echo 'document.querySelector(".' . $_SESSION['tabs'] . 'link").classList.add(\'color\');';
                  echo '}';
                }
              }
              ?>
            </script>
          <?php
          }
          ?>
        </div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="add2">
    <div class="modal-dialog" role="document">
      <div class="modal-content" style="width: 650px !important; margin-top:70px !important;">
        <div class="modal-header bg-secondary text-light">
          <h1 class="modal-title fs-5">Add Data</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form action="gfcmcstock.php" method="post">
          <div class="modal-body">
            <div class="row">
              <div class="col">
                <label>Date</label>
                <input type="date" name="date" class="form-control inpv2 mb-2">
                <label>Commondity</label>
                <div class="d-flex">
                  <div class="col">
                    <select class="form-control inpv2 mb-2" name="commondity_id">
                      <?php
                      $commonditydatastmt = $pdo->prepare("SELECT * FROM item");
                      $commonditydatastmt->execute();
                      $commonditydatas = $commonditydatastmt->fetchAll();
                      foreach ($commonditydatas as $commonditydata) {
                        $item_id = $commonditydata['item_id'];
                        $commonditydata = $query->select('item', $item_id, 'item_id');
                      ?>
                        <option value="<?php echo $commonditydata['item_id']; ?>"><?php echo $commonditydata['item_name']; ?></option>
                      <?php
                      }
                      ?>
                    </select>
                  </div>
                  <div class="col ms-2">
                    <select name="fish_type1" id="commondityid3" class="form-control inpv2">
                      <option value="G">G</option>
                      <option value="egg">egg</option>
                      <option value="ggs">ggs</option>
                      <option value="fillet">fillet</option>
                      <option value="W">W</option>
                      <option value="Cut_piece">Cut Piece</option>
                      <option value="Scaless">Scaless</option>
                      <option value="Bls">Bl's</option>
                    </select>
                  </div>
                </div>
              </div>
              <div class="col">
                <label>Particular</label>
                <textarea name="particular" rows="4" class="form-control inpv2 mb-2" id="particular">Balance</textarea>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label>Country</label>
                <input type="text" name="country" class="form-control inpv2">
              </div>
              <div class="col">
                <label>Size</label>
                <input type="text" name="size" class="form-control inpv2 mb-2">
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label>Kg</label>
                <input type="text" name="kg" class="form-control inpv2 mb-2">
              </div>
              <div class="col">
                <label>Mc</label>
                <input type="number" name="mc" class="form-control inpv2 mb-2">
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-success" name="addbtn">Add</button>
          </div>
        </form>
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
                <div class="d-flex">
                  <div class="col">
                    <label>Commondity</label>
                    <select class="form-control inpv2 mb-2" name="exportcommondity_id">
                      <?php
                      $form7commonditystmt = $pdo->prepare("SELECT DISTINCT commondity_id FROM gfcmcstock");
                      $form7commonditystmt->execute();
                      $form7commonditydatas = $form7commonditystmt->fetchall();
                      foreach ($form7commonditydatas as $form7commonditydata) {
                        $item_id = $form7commonditydata['commondity_id'];
                        $commonditydata = $query->select('item', $item_id, 'item_id');
                      ?>
                        <option value="<?php echo $commonditydata['item_id']; ?>"><?php echo $commonditydata['item_name']; ?></option>
                      <?php
                      }
                      ?>
                    </select>
                  </div>
                  <div class="col ms-2 mt-4">
                    <select name="exportfish_type" id="commondityid3" class="form-control inpv2">
                      <option value="G">G</option>
                      <option value="egg">egg</option>
                      <option value="ggs">ggs</option>
                      <option value="fillet">fillet</option>
                      <option value="W">W</option>
                      <option value="Cut_piece">Cut Piece</option>
                      <option value="Scaless">Scaless</option>
                      <option value="Bls">Bl's</option>
                    </select>
                  </div>
                </div>
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
                  $countrystmt = $pdo->prepare("SELECT DISTINCT country FROM gfcmcstock WHERE country IS NOT NULL");
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
  <?php
  $bootstrap->javascript();
  ?>
</body>

</html>