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
      $item_id = $_POST['item_id'];
      $size = $_POST['size'];
      $pcs = $_POST['pcs'];
      $kg = $_POST['kg'];
      $form10_mc = $_POST['form10_mc'];

      $query->addtclmcstock($date, $item_id, $size, $pcs, $kg, $form10_mc);
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
            <form class="" action="tclmcstock.php" method="post">
            <h5 style="font-weight:bold;" class="text-light d-inline">TCL MC STOCK</h5>

            <?php if (empty($_POST['date']) || !isset($_POST['search'])): ?>
              <button type="button" class="btn btn-success float-end" data-bs-toggle="modal" data-bs-target="#add">Add Mc Data</button>
            <?php endif; ?>
            <button type="submit" name="search" class="btn btn-primary float-end me-2">View</button>
            <?php if (!empty($_POST['date']) && isset($_POST['search'])): ?>
              <a href="export.php?table_name=tclmcstock&date=<?= $_POST['date']; ?>" name="search" class="btn btn-secondary float-end me-2">Export Excel</a>
            <?php endif; ?>
            <input type="date" name="date" value="" class="form-control inpv2 d-inline float-end w-25 me-2">
            <?php if (empty($_POST['date']) && !isset($_POST['search'])): ?>
              <a href="export.php?table_name=tclmcstock" name="search" class="btn btn-secondary float-end me-2">Export Excel</a>
            <?php endif; ?>
          </form>
          </div>
          <div class="card-body">
            <?php
            if (!empty($_POST['date']) && isset($_POST['search'])) {
              $date = $_POST['date'];
              $headerstmt = $pdo->prepare("SELECT * FROM tclmcstock WHERE date='$date'");
              $headerstmt->execute();
              $headerdata = $headerstmt->fetch(PDO::FETCH_ASSOC);
              ?>
              <table class="table table-hover table-bordered table-striped" id="<?php //echo $countrydata['country']; ?>table">
                <tr>
                  <th>Date</th>
                  <th>Fish Name</th>
                  <th>Size</th>
                  <th>Pcs</th>
                  <th>Kg</th>
                  <th>Opening Mc</th>
                  <th>Form-10 Mc</th>
                  <th>Transfer to <?php echo $headerdata['transfer_to_where']; ?></th>
                  <th>loading <?php if($headerdata['loading_no'] != 0){ echo $headerdata['loading_no']; }; ?></th>
                  <th>Grand Total Mc</th>
                </tr>
              <?php
              $stmt = $pdo->prepare("SELECT * FROM tclmcstock WHERE date='$date'");
              $stmt->execute();
              $datas = $stmt->fetchall();
              foreach ($datas as $tclmcdata) {
                $lastid = $tclmcdata['id'];
                $item_id = $tclmcdata['item_id'];
                $commonditydata = $query->select('item', $item_id, 'item_id');
                $size = $tclmcdata['size'];
                $kg = $tclmcdata['kg'];
                $item_id = $tclmcdata['item_id'];

                $checklast = $pdo->prepare("SELECT * FROM tclmcstock WHERE id < $lastid AND item_id='$item_id' AND size='$size' AND date='$date'");
                $checklast->execute();
                $checklastavaliable = $checklast->fetch(PDO::FETCH_ASSOC);
                $lastcommondity = $pdo->prepare("SELECT * FROM tclmcstock WHERE id < $lastid AND item_id='$item_id' AND date='$date'");
                $lastcommondity->execute();
                $lastcommondity = $lastcommondity->fetch(PDO::FETCH_ASSOC);
                ?>
                <tr>
                <td><?php if(empty($lastcommondity)){ echo date("d-m-Y", strtotime($tclmcdata['date'])); } ?></td>
                <td><?php if(empty($lastcommondity)){ echo $commonditydata['item_name']; } ?></td>
                <td><?php if(empty($checklastavaliable)){ echo $tclmcdata['size']; } ?></td>
                <td><?php echo $tclmcdata['pcs']; ?></td>
                <td><?php echo $tclmcdata['kg']; ?></td>
                <td><?php if($tclmcdata['opening_mc'] != 0){ echo $tclmcdata['opening_mc']; }else{ echo "-";} ?></td>
                <td><?php echo $tclmcdata['form10mc']; ?></td>
                <td><?php if($tclmcdata['transfer_mc'] != 0){ echo $tclmcdata['transfer_mc']; }else{ echo "-";} ?></td>
                <td><?php if($tclmcdata['loading_mc'] != 0){ echo $tclmcdata['loading_mc']; }else{ echo "-";} ?></td>
                <td><?php if($tclmcdata['grandtotal_mc'] != 0){ echo $tclmcdata['grandtotal_mc']; }else{ echo "-";} ?></td>
                </tr>
                <?php
              }
              ?>
              <?php
                $openingmctotalstmt = $pdo->prepare("SELECT SUM(opening_mc) AS openingmc FROM tclmcstock WHERE date='$date'");
                $openingmctotalstmt->execute();
                $openingmctotaldatas = $openingmctotalstmt->fetch(PDO::FETCH_ASSOC);

                $form10mctotalstmt = $pdo->prepare("SELECT SUM(form10mc) AS totalform10mc FROM tclmcstock WHERE date='$date'");
                $form10mctotalstmt->execute();
                $form10mctotaldatas = $form10mctotalstmt->fetch(PDO::FETCH_ASSOC);

                $transfermctotalstmt = $pdo->prepare("SELECT SUM(transfer_mc) AS transfermc FROM tclmcstock WHERE date='$date'");
                $transfermctotalstmt->execute();
                $transfermctotaldatas = $transfermctotalstmt->fetch(PDO::FETCH_ASSOC);

                $loadingmctotalstmt = $pdo->prepare("SELECT SUM(loading_mc) AS loadingmc FROM tclmcstock WHERE date='$date'");
                $loadingmctotalstmt->execute();
                $loadingmctotaldatas = $loadingmctotalstmt->fetch(PDO::FETCH_ASSOC);

                $grandtotalmctotalstmt = $pdo->prepare("SELECT SUM(grandtotal_mc) AS grandtotalmc FROM tclmcstock WHERE date='$date'");
                $grandtotalmctotalstmt->execute();
                $grandtotalmctotaldatas = $grandtotalmctotalstmt->fetch(PDO::FETCH_ASSOC);
               ?>
              <tr>
                <td style="font-weight:bold;" colspan="5" class="text-center">Grand Total</td>
                <td style="font-weight:bold;"><?php if($openingmctotaldatas['openingmc'] != 0){ echo $openingmctotaldatas['openingmc']; }else{ echo "-";} ?></td>
                <td style="font-weight:bold;"><?php if($form10mctotaldatas['totalform10mc'] != 0){ echo $form10mctotaldatas['totalform10mc']; }else{ echo "-";} ?></td>
                <td style="font-weight:bold;"><?php if($transfermctotaldatas['transfermc'] != 0){ echo $transfermctotaldatas['transfermc']; }else{ echo "-";} ?></td>
                <td style="font-weight:bold;"><?php if($loadingmctotaldatas['loadingmc'] != 0){ echo $loadingmctotaldatas['loadingmc']; }else{ echo "-";} ?></td>
                <td style="font-weight:bold;"><?php if($grandtotalmctotaldatas['grandtotalmc'] != 0){ echo $grandtotalmctotaldatas['grandtotalmc']; }else{ echo "-";} ?></td>
              </tr>

              </table>
              <?php
            }else{
            ?>
            <table class="table table-hover table-bordered table-striped" id="<?php //echo $countrydata['country']; ?>table">
              <tr>
                <th>Date</th>
                <th>Fish Name</th>
                <th>Size</th>
                <th>Pcs</th>
                <th>Kg</th>
                <th>Grand Total Mc</th>
                <th>Action</th>
              </tr>
            <?php
            // $country = $countrydata['country'];
            $stmt = $pdo->prepare("SELECT * FROM tclmcstock");
            $stmt->execute();
            $datas = $stmt->fetchall();
            foreach ($datas as $tclmcdata) {
              $item_id = $tclmcdata['item_id'];
              $commonditydata = $query->select('item', $item_id, 'item_id');
              $size = $tclmcdata['size'];
              $kg = $tclmcdata['kg'];
              $item_id = $tclmcdata['item_id'];
              ?>
              <tr>
              <td><?php echo date("d-m-Y", strtotime($tclmcdata['date'])); ?></td>
              <td><?php echo $commonditydata['item_name']; ?></td>
              <td><?php echo $tclmcdata['size']; ?></td>
              <td><?php echo $tclmcdata['pcs']; ?></td>
              <td><?php echo $tclmcdata['kg']; ?></td>
              <td><?php echo $tclmcdata['grandtotal_mc']; ?></td>
              <td>
              <a href="tclmc_stock_info.php?id=<?php echo $tclmcdata['id']; ?>" class="btn btn-info btn-sm text-light">
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
    <div class="modal fade" id="add">
      <div class="modal-dialog" role="document">
        <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
          <div class="modal-header bg-secondary text-light">
            <h1 class="modal-title fs-5">Add Data</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
        <form action="tclmcstock.php" method="post">
          <div class="modal-body">
            <div class="row">
              <div class="col">
                <label>Date</label>
                <input type="date" name="date" class="form-control inpv2 mb-2">
              </div>
              <div class="col">
                <label>Fish Name</label>
                <select class="form-control inpv2 mb-2" name="item_id">
                  <?php
                  $form10commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM form10stocktcl");
                  $form10commonditystmt->execute();
                  $form10commonditydatas = $form10commonditystmt->fetchall();
                  foreach ($form10commonditydatas as $form10commonditydata) {
                    $item_id = $form10commonditydata['item_id'];
                    $commonditydata = $query->select('item', $item_id, 'item_id');
                    ?>
                    <option value="<?php echo $commonditydata['item_id']; ?>"><?php echo $commonditydata['item_name']; ?></option>
                    <?php
                  }
                  ?>
                </select>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label>Size</label>
                <input type="text" name="size" class="form-control inpv2 mb-2">
              </div>
              <div class="col">
                <label>Pcs</label>
                <input type="text" name="pcs" class="form-control inpv2 mb-2">
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label>Kg</label>
                <input type="text" name="kg" class="form-control inpv2 mb-2">
              </div>
              <div class="col">
                <label>Form 10 Mc</label>
                <input type="number" name="form10_mc" class="form-control inpv2 mb-2">
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
                  $form7commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM form10stocktcl");
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
                  $countrystmt = $pdo->prepare("SELECT DISTINCT country FROM form10stocktcl WHERE country IS NOT NULL");
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
