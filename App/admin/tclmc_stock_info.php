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
    $id = $_GET['id'];
    if(isset($_POST['transferbtn'])){
      $transfer_to = $_POST['transfer_to'];
      $transfer_mc = $_POST['transfer_mc'];

      $transfercheckstmt = $pdo->prepare("SELECT * FROM tclmcstock WHERE id='$id'");
      $transfercheckstmt->execute();
      $transfercheck = $transfercheckstmt->fetch(PDO::FETCH_ASSOC);

      if($transfercheck['grandtotal_mc'] >= $transfer_mc){
        echo $query->transfermcstocktcl($transfer_to, $transfer_mc, $id);
      }else{
        echo '<script>swal("Sorry!", "Not Enough Mc!", "warning");</script>';
      }
    }

    if(isset($_POST['exportbtn'])){
      $loading_no = $_POST['loading_no'];
      $loading_mc = $_POST['loading_mc'];

      $loadcheckstmt = $pdo->prepare("SELECT * FROM tclmcstock WHERE id='$id'");
      $loadcheckstmt->execute();
      $loadcheck = $loadcheckstmt->fetch(PDO::FETCH_ASSOC);

      if($loadcheck['grandtotal_mc'] >= $loading_mc){
        echo $query->loadmcstocktcl($loading_no, $loading_mc, $id);
      }else{
        echo '<script>swal("Sorry!", "Not Enough Mc!", "warning");</script>';
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
            <form class="" action="" method="post">


            <h5 style="font-weight:bold;" class="text-light d-inline">TCL MC STOCK INFO</h5>
            <button type="button" class="btn btn-danger btn-sm float-end ms-2" data-bs-toggle="modal" data-bs-target="#transfer">Transfer Mc</button>
            <button type="button" class="btn btn-warning btn-sm float-end ms-2" data-bs-toggle="modal" data-bs-target="#export">Export Mc</button>
            <a href="tclmcstock.php" type="button" class="btn btn-secondary btn-sm float-end ms-2">Back</a>
          </div>
        </form>
          <div class="card-body">
            <?php
            $infostmt = $pdo->prepare("SELECT * FROM tclmcstock WHERE id='$id'");
            $infostmt->execute();
            $infodata = $infostmt->fetch(PDO::FETCH_ASSOC);
             ?>
            <div class="row">
              <div class="col-7">
                <table class="table table-hover table-bordered table-striped">
                  <tr>
                    <th>Date</th>
                    <th>Fish Name</th>
                    <th>Size</th>
                    <th>Pcs</th>
                    <th>Kg</th>
                    <th>Opening Mc</th>
                    <th>Form 10 Mc</th>
                  </tr>
                  <?php
                    $kg = $infodata['kg'];
                    $item_id = $infodata['item_id'];
                    $commonditydata = $query->select('item', $item_id, 'item_id');
                   ?>
                    <td><?php echo date('d-m-Y', strtotime($infodata['date'])); ?></td>
                    <td><?php echo $commonditydata['item_name']; ?></td>
                    <td><?php echo $infodata['size'];?></td>
                    <td><?php echo $infodata['pcs'];?></td>
                    <td><?php echo $infodata['kg']; ?></td>
                    <td><?php echo $infodata['opening_mc']; ?></td>
                    <td><?php echo $infodata['form10mc']; ?></td>
                  </tr>
                </table>
              </div>
              <div class="col-5">
                <table class="table table-hover table-bordered table-striped">
                  <tr>
                    <th>Transfer To <?php if(!empty($infodata['transfer_to_where'])){echo $infodata['transfer_to_where'];}; ?></th>
                    <th>Loading <?php if(!empty($infodata['loading_no'])){echo $infodata['loading_no'];}; ?></th>
                    <th>Grand Total Mc</th>
                  </tr>
                  <tr>
                    <td><?php if($infodata['transfer_mc'] != 0){echo $infodata['transfer_mc'];}else{echo '-';}; ?></td>
                    <td><?php if($infodata['loading_mc'] != 0){echo $infodata['loading_mc'];}else{echo '-';}; ?></td>
                    <td><?php if($infodata['grandtotal_mc'] != 0){echo $infodata['grandtotal_mc'];}else{echo '-';}; ?></td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="modal fade" id="export">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header bg-secondary text-light">
            <h1 class="modal-title fs-5">Export Mc</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
        <form action="" method="post">
          <div class="modal-body">
            <label>Loading No</label>
            <input type="text" name="loading_no" class="form-control inpv2 mb-3 mt-1">
            <label>Loading Mc</label>
            <input type="number" name="loading_mc" class="form-control inpv2 mb-3 mt-1">
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-success" name="exportbtn">Export</button>
          </div>
        </form>
        </div>
      </div>
    </div>
    <div class="modal fade" id="transfer">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header bg-secondary text-light">
            <h1 class="modal-title fs-5">Transfer Mc</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
        <form action="" method="post">
          <div class="modal-body">
            <label>Transfer To</label>
            <input type="text" name="transfer_to" class="form-control inpv2 mb-3 mt-1" value="HHK">
            <label>Transfer Mc</label>
            <input type="number" name="transfer_mc" class="form-control inpv2 mb-3 mt-1">
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-success" name="transferbtn">Transfer</button>
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
