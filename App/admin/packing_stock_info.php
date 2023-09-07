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
    if(isset($_POST['add'])){
      $commondity = $_POST['commondity_id'];
      $size = $_POST['size'];
      $packingkgperbox = $_POST['packingkgperbox'];
      $mc = $_POST['mc'];
      $infoid = $_POST['infoid'];

      $query->addpackinglistinfo($commondity, $size, $packingkgperbox, $mc, $infoid);

    }
     ?>
    <div class="row">
      <div class="col-2">
        <?php
        include 'sidebar.php';
        ?>
      </div>
      <div class="col-10">
        <div class="card">
          <div class="card-header bg-info">
            <h4 class="d-inline text-light">Actual Packing List</h4>
            <button type="button" class="btn btn-success float-end" data-bs-toggle="modal" data-bs-target="#add">Add Packing Stock</button>
            <a href="packing_stock.php" class="btn btn-secondary float-end me-2">Back</a>
          </div>
          <div class="card-body">
            <?php
            $infoid = $_GET['infoid'];

            $infostmt = $pdo->prepare("SELECT * FROM packingliststock WHERE id='$infoid'");
            $infostmt->execute();
            $infodata = $infostmt->fetch(PDO::FETCH_ASSOC);
             ?>
             <div class="row">
               <div class="col-1">

               </div>
               <div class="col-8">
                 <?php
                   $customer_id = $infodata['customer_id'];
                   $customerdata = $query->select('customers', $customer_id, 'customer_id');
                   echo $customerdata['customer_name'];
                  ?>
               </div>
               <div class="col-2">
                 Date : <?php echo date('d-m-Y', strtotime($infodata['date']));  ?>
                 <br>
                 Invoice No : <?php echo $infodata['invoiceno'];  ?>
                 <br>
                 CTNR No : <?php echo $infodata['containerno'];  ?>
                 <br>
                 VESSEL NAME :
                 <br>
                 VOY NAME :
                 <br>
                 FDA :

               </div>
               <div class="col-1">

               </div>
             </div>
             <br>
            <table class="table table-striped table-hover table-bordered">
              <tr>
                <th>No</th>
                <th>Commondity</th>
                <th>Size</th>
                <th>Packing Kg Per Box</th>
                <th>Mc</th>
                <th>Total Net Weight</th>
                <th>Total Gross Weight</th>
              </tr>
              <?php
              $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT commondity_id) FROM packingliststockinfo WHERE infoid='$infoid'");
              $commonditycountstmt->execute();
              $commonditycountdatas = $commonditycountstmt->fetchColumn();
              for ($i=0; $i < $commonditycountdatas; $i++) {
                $commonditystmt = $pdo->prepare("SELECT DISTINCT commondity_id FROM packingliststockinfo WHERE infoid='$infoid'");
                $commonditystmt->execute();
                $commonditydata = $commonditystmt->fetchall();
                $commondity_id = $commonditydata[$i]['commondity_id'];
                $infoid = $_GET['infoid'];

                $stmt = $pdo->prepare("SELECT * FROM packingliststockinfo WHERE commondity_id='$commondity_id' AND infoid='$infoid'");
                $stmt->execute();
                $datas = $stmt->fetchall();
                foreach ($datas as $packingstockinfodata) {
                  $item_id = $packingstockinfodata['commondity_id'];
                  $commonditydata = $query->select('item', $item_id, 'item_id');
               ?>
              <tr>
                <td><?php echo $packingstockinfodata['id']; ?></td>
                <td><?php echo $commonditydata['item_name']; ?></td>
                <td><?php echo $packingstockinfodata['size']; ?></td>
                <td><?php echo $packingstockinfodata['packingkgperbox']; ?></td>
                <td><?php echo $packingstockinfodata['mc']; ?></td>
                <td><?php echo $packingstockinfodata['totalnetweight']; ?></td>
                <td><?php echo $packingstockinfodata['totalgrossweight']; ?></td>
              </tr>
              <?php
              ?>
              <?php
              }
              $item_id = $packingstockinfodata['commondity_id'];
              $totalmcstmt = $pdo->prepare("SELECT SUM(mc) AS totalmc FROM packingliststockinfo WHERE infoid='$infoid' AND commondity_id='$item_id'");
              $totalmcstmt->execute();
              $totalmcdata = $totalmcstmt->fetch(PDO::FETCH_ASSOC);
              $totalnetweightstmt = $pdo->prepare("SELECT SUM(totalnetweight) AS totalnetweight FROM packingliststockinfo WHERE infoid='$infoid' AND commondity_id='$item_id'");
              $totalnetweightstmt->execute();
              $totalnetweightdata = $totalnetweightstmt->fetch(PDO::FETCH_ASSOC);
              $totalgrssweightstmt = $pdo->prepare("SELECT SUM(totalgrossweight) AS totalgrossweight FROM packingliststockinfo WHERE infoid='$infoid' AND commondity_id='$item_id'");
              $totalgrssweightstmt->execute();
              $totalgrssweightdata = $totalgrssweightstmt->fetch(PDO::FETCH_ASSOC);
              ?>
              <tr>
              <td></td>
              <td>Sub Total</td>
              <td></td>
              <td></td>
              <td><?php echo $totalmcdata['totalmc']; ?></td>
              <td><?php if(!empty($totalnetweightdata['totalnetweight'])){ echo $totalnetweightdata['totalnetweight']; }; ?></td>
              <td><?php if(!empty($totalgrssweightdata['totalgrossweight'])){ echo $totalgrssweightdata['totalgrossweight']; }; ?></td>
              </tr>
              <?php
            }
               ?>
               <?php
               $item_id = $packingstockinfodata['commondity_id'];
               $totalmcstmt = $pdo->prepare("SELECT SUM(mc) AS totalmc FROM packingliststockinfo WHERE infoid='$infoid'");
               $totalmcstmt->execute();
               $totalmcdata = $totalmcstmt->fetch(PDO::FETCH_ASSOC);
               $totalnetweightstmt = $pdo->prepare("SELECT SUM(totalnetweight) AS totalnetweight FROM packingliststockinfo WHERE infoid='$infoid'");
               $totalnetweightstmt->execute();
               $totalnetweightdata = $totalnetweightstmt->fetch(PDO::FETCH_ASSOC);
               $totalgrssweightstmt = $pdo->prepare("SELECT SUM(totalgrossweight) AS totalgrossweight FROM packingliststockinfo WHERE infoid='$infoid'");
               $totalgrssweightstmt->execute();
               $totalgrssweightdata = $totalgrssweightstmt->fetch(PDO::FETCH_ASSOC);
                ?>
               <tr>
                 <td></td>
                 <td style="font-weight:bold !important;">Grand Total</td>
                 <td></td>
                 <td></td>
                 <td style="font-weight:bold !important;"><?php echo $totalmcdata['totalmc']; ?></td>
                 <td style="font-weight:bold !important;"><?php if(!empty($totalnetweightdata['totalnetweight'])){ echo $totalnetweightdata['totalnetweight']; }; ?></td>
                 <td style="font-weight:bold !important;"><?php if(!empty($totalgrssweightdata['totalgrossweight'])){ echo $totalgrssweightdata['totalgrossweight']; }; ?></td>
               </tr>
            </table>
            <div class="modal fade" id="add">
              <div class="modal-dialog" role="document">
                <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
                  <div class="modal-header bg-info text-light">
                    <h1 class="modal-title fs-5">Addd Packing Stock</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <form action="" method="post">
                      <input type="hidden" name="infoid" value="<?php echo $_GET['infoid']; ?>">
                    <div class="modal-body">
                      <div class="row">
                        <div class="col">
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
                          <label>Size</label>
                          <input type="text" name="size" class="form-control inpv2 mb-2">
                        </div>
                      </div>
                      <div class="row">
                        <div class="col">
                          <label>Packing Kg Per Box</label>
                          <input type="text" name="packingkgperbox" class="form-control inpv2 mb-2">
                        </div>
                        <div class="col">
                          <label>Mc</label>
                          <input type="number" name="mc" class="form-control inpv2 mb-2">
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success" name="add">Add</button>
                  </div>
                  </form>
                </div>
              </div>
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
