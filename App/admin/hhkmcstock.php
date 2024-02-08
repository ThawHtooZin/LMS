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

    if(isset($_POST['transferbtn'])){
      $transferdate = $_POST['transferdate'];
      $transferparticular = $_POST['transferparticular'];
      $transfercommondity_id = $_POST['transfercommondity_id'];
      $transfersize = $_POST['transfersize'];
      $transferkg = $_POST['transferkg'];
      $transfermc = $_POST['transfermc'];
      $transfercountry = $_POST['transfercountry'];

      $transfercheckstmt = $pdo->prepare("SELECT * FROM hhkmcstock WHERE size='$transfersize' AND country='$transfercountry' AND commondity_id='$transfercommondity_id' AND  particular LIKE '%From%'");
      $transfercheckstmt->execute();
      $transfercheck = $transfercheckstmt->fetch(PDO::FETCH_ASSOC);

      $validcheckstmt = $pdo->prepare("SELECT * FROM hhkmcstock WHERE kg='$transferkg' AND size='$transfersize' AND country='$transfercountry' AND commondity_id='$transfercommondity_id' ORDER BY id DESC");
      $validcheckstmt->execute();
      $validcheck = $validcheckstmt->fetch(PDO::FETCH_ASSOC);

      if(!empty($validcheck)){
        if($transfercheck['balance_mc'] >= $transfermc){
          echo $query->transfermcstock($transferdate, $transferparticular, $transfercountry, $transfercommondity_id, $transfersize, $transferkg, $transfermc);
        }else{
          echo '<script>swal("Sorry!", "Not Enough Mc!", "warning");</script>';
        }
      }else{
      echo '<script>swal("Sorry!", "Not Valid data for transfering!", "warning");</script>';
      }
    }

    $countrystmt = $pdo->prepare("SELECT DISTINCT country FROM form10stock WHERE country IS NOT NULL");
    $countrystmt->execute();
    $countrydatas = $countrystmt->fetchall();
    foreach ($countrydatas as $countrydata) {
      $btnname = $countrydata['country'] . "btn";
      if(isset($_POST[$btnname])){
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


            <h5 style="font-weight:bold;" class="text-light d-inline">HHK MC STOCK</h5>
            <button type="button" class="btn btn-danger float-end ms-2" data-bs-toggle="modal" data-bs-target="#transfer">Transfer Mc</button>
            <button type="button" class="btn btn-success float-end" data-bs-toggle="modal" data-bs-target="#add">Add Mc Data</button>
            <form class="d-inline" action="hhkmcstock.php" method="post">
            <button type="submit" class="btn btn-primary float-end me-2" name="searchcommonditybtn">View</button>
            <?php
            $commonditystmt = $pdo->prepare("SELECT * FROM hhkmcstock WHERE country = :country GROUP BY commondity_id");
            $commonditystmt->bindParam(':country', $_SESSION['tabs']);
            $commonditystmt->execute();
            $searchcommon = $commonditystmt->fetchall();
            ?>
            <select class="inpv2 form-control w-25 d-inline me-2 float-end" name="search">
              <?php foreach ($searchcommon as $commondity_id):
                $item_id = $commondity_id['commondity_id'];
                $commonditydata = $query->select('item', $item_id, 'item_id');
               ?>
                <?php if (!empty($commondity_id['country'])): ?>
                  <option value="<?php echo $commonditydata['item_id'];?>"><?php echo $commonditydata['item_name'];?></option>
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
              $countrystmt = $pdo->prepare("SELECT DISTINCT country FROM form10stock WHERE country IS NOT NULL");
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
              if (isset($_POST['searchcommonditybtn']) && !empty($_POST['search'])) {
                $searchcommondity = $_POST['search'];
                $searchcommonditystmt = $pdo->prepare("SELECT * FROM hhkmcstock WHERE country = :country AND commondity_id='$searchcommondity' GROUP BY commondity_id,size");
                $searchcommonditystmt->bindParam(':country', $_SESSION['tabs']);
                $searchcommonditystmt->execute();
                $datas = $searchcommonditystmt->fetchall();
              }else{
                $stmt = $pdo->prepare("SELECT * FROM hhkmcstock WHERE country='$country' GROUP BY commondity_id,size");
                $stmt->execute();
                $datas = $stmt->fetchall();
              }
                foreach ($datas as $hhkstockdata) {
                  $item_id = $hhkstockdata['commondity_id'];
                  $commonditydata = $query->select('item', $item_id, 'item_id');
                  $size = $hhkstockdata['size'];
                  $kg = $hhkstockdata['kg'];
                  $commondity_id = $hhkstockdata['commondity_id'];
                  $sizestmt = $pdo->prepare("SELECT * FROM hhkmcstock WHERE size='$size' ORDER BY id DESC");
                  $sizestmt->execute();
                  $sizedata = $sizestmt->fetch(PDO::FETCH_ASSOC);
                  $totalmcstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM hhkmcstock WHERE size='$size' AND country='$country' AND commondity_id='$commondity_id' AND particular NOT LIKE '%to%'");
                  $totalmcstmt->execute();
                  $totalmcnotsub = $totalmcstmt->fetch(PDO::FETCH_ASSOC);
                  $totalmcsubnumstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM hhkmcstock WHERE size='$size' AND country='$country' AND commondity_id='$commondity_id' AND particular LIKE '%to%'");
                  $totalmcsubnumstmt->execute();
                  $totalmcsubnum = $totalmcsubnumstmt->fetch(PDO::FETCH_ASSOC);
                  $totalmc = $totalmcnotsub['total_mc'] - $totalmcsubnum['total_mc'];
                  ?>
                  <tr style="<?php if($totalmc > 200){echo 'background-color:rgba(0, 255, 0, 0.4) !important;';} ?>">
                    <td><?php echo $commonditydata['item_name']; ?></td>
                    <td><?php echo $countrydata['country']; ?></td>
                    <td><?php echo $hhkstockdata['size']; ?></td>
                    <td><?php echo $totalmc; ?></td>
                    <td>
                      <a href="hhkmc_stock_info.php?sizeinfo=<?php echo $hhkstockdata['size']; ?>&commondity=<?php echo $hhkstockdata['commondity_id']; ?>&country=<?php echo $hhkstockdata['country']; ?>" class="btn btn-info btn-sm text-light">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list-check" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3.854 2.146a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 3.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 7.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 0 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0z"/></svg></a>
                      </td>
                    </tr>
                    <?php
                  }
               ?>
            </table>
            <div class="modal fade" id="add">
              <div class="modal-dialog" role="document">
                <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
                  <div class="modal-header bg-secondary text-light">
                    <h1 class="modal-title fs-5">Add Data</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                <form action="hhkmcstock.php" method="post">
                  <div class="modal-body">
                    <div class="row">
                      <div class="col">
                        <label>Date</label>
                        <input type="date" name="date" class="form-control inpv2 mb-2">
                        <label>Commondity</label>
                        <select class="form-control inpv2 mb-2" name="commondity_id">
                          <?php
                          $form7commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM form10stock");
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
                        <textarea name="particular" rows="4" class="form-control inpv2 mb-2">From From-10</textarea>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col">
                        <label>Country</label>
                        <select class="form-control inpv2 mb-2" name="country">

                          <?php
                          $countrystmt = $pdo->prepare("SELECT DISTINCT country FROM form10stock WHERE country IS NOT NULL");
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
            <?php
            }
             ?>
          </div>
        </div>
      </div>
    </div>
    <div class="modal fade" id="add">
      <div class="modal-dialog" role="document">
        <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
          <div class="modal-header bg-secondary text-light">
            <h1 class="modal-title fs-5">Add Data</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
        <form action="hhkmcstock.php" method="post">
          <div class="modal-body">
            <div class="row">
              <div class="col">
                <label>Date</label>
                <input type="date" name="date" class="form-control inpv2 mb-2">
                <label>Commondity</label>
                <select class="form-control inpv2 mb-2" name="commondity_id">
                  <?php
                  $form7commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM form10stock");
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
                <textarea name="particular" rows="4" class="form-control inpv2 mb-2">From From-10</textarea>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label>Country</label>
                <select class="form-control inpv2 mb-2" name="country">

                  <?php
                  $countrystmt = $pdo->prepare("SELECT DISTINCT country FROM form10stock WHERE country IS NOT NULL");
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
    <div class="modal fade" id="transfer">
      <div class="modal-dialog" role="document">
        <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
          <div class="modal-header bg-warning text-light">
            <h1 class="modal-title fs-5">Tranfer Mc</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
        <form action="hhkmcstock.php" method="post">
          <div class="modal-body">
            <div class="row">
              <div class="col">
                <label>Date</label>
                <input type="date" name="transferdate" class="form-control inpv2 mb-2">
                <label>Commondity</label>
                <select class="form-control inpv2 mb-2" name="transfercommondity_id">
                  <?php
                  $form7commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM form10stock");
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
                <textarea name="transferparticular" rows="4" class="form-control inpv2 mb-2">HHK To GFC</textarea>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label>Country</label>
                <select class="form-control inpv2 mb-2" name="transfercountry">

                  <?php
                  $countrystmt = $pdo->prepare("SELECT DISTINCT country FROM form10stock WHERE country IS NOT NULL");
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
                <input type="text" name="transfersize" class="form-control inpv2 mb-2">
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label>Kg</label>
                <input type="text" name="transferkg" class="form-control inpv2 mb-2">
              </div>
              <div class="col">
                <label>Mc</label>
                <input type="number" name="transfermc" class="form-control inpv2 mb-2">
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-success" name="transferbtn">Move</button>
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
