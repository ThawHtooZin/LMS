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
  <script src="../../Resources\jquery.resc.js" charset="utf-8"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Caprasimo&family=Cormorant+Garamond:wght@300&family=Teko:wght@700&display=swap" rel="stylesheet">
  <body>
    <?php
    if(isset($_POST['add'])){
      $commondity = $_POST['item_id'];
      $size = $_POST['size'];
      $pcsperbox = $_POST['pcsperbox'];
      $kgperbox = $_POST['kgperbox'];
      $mc = $_POST['mc'];
      $invoice_no = $_POST['invoice_no'];
      $query->addtruckpackinglistinfo($commondity, $size, $pcsperbox, $kgperbox, $mc, $invoice_no);
    }

    if (isset($_POST['updatebtn'])) {
      $usd = $_POST['usd'];
      $updateid = $_POST['updateid'];
      $query->updatetruckactualinvoice($usd, $updateid);
    }

    if(isset($_POST['addfoamboxbtn'])){
      $foamboxid = $_POST['foamboxid'];
      $foambox = $_POST['foambox_no'];

      $query->updatefoambox($foamboxid, $foambox);
    }

    if(isset($_POST['addkgperbox'])){
      $kgperbox = $_POST['kgperbox'];
      $kgperboxid = $_POST['kgperboxid'];

      $query->updatekgperbox($kgperbox, $kgperboxid);
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
          <form  action="" method="post">
          <div class="card-header bg-info">
            <?php
            if(isset($_POST['actualinvoicebtn'])){
              $_SESSION['tabs'] = 'actualinvoice';
            }elseif(isset($_POST['actualinvoiceback'])){
              $_SESSION['tabs'] = 'actualpackinglist';
            }elseif(isset($_POST['foamboxbtn'])){
              $_SESSION['tabs'] = 'foambox';
            }elseif(isset($_POST['declarebtn'])){
              $_SESSION['tabs'] = 'declare';
            }
             ?>
                <span class=" text-light" id="fbtext" style="font-size:20px; font-weight:bold;">Foam Box</span>
                <span class=" text-light" id="dtext" style="font-size:20px; font-weight:bold;">Declare Packing List</span>
                <span class=" text-light" id="pltext" style="font-size:20px; font-weight:bold;">Actual Packing List</span>
                <span class=" text-light hide" id="itext" style="font-size:20px; font-weight:bold;">Actual Invoice</span>
                <a href="truck_packing_stock.php" class="btn btn-danger float-end ms-2 btn-sm" id="back">Back</a>
                <button type="submit" class="btn btn-warning float-end btn-sm" id="actualinvoice" name="actualinvoicebtn">Actual Invoice</button>
                <button type="submit" class="btn btn-secondary float-end btn-sm me-2" id="foambox" name="foamboxbtn">Foam Box</button>
                <button type="submit" class="btn btn-primary float-end btn-sm me-2" id="declare" name="declarebtn">Declare List</button>
                <button type="submit" class="btn btn-warning float-end btn-sm hide" id="actualinvoiceback" name="actualinvoiceback">Back</button>
                <button type="button" class="btn btn-success float-end me-2 btn-sm" data-bs-toggle="modal" data-bs-target="#add" id="addpackingstockbtn">Add Packing Stock</button>
          </div>
        </form>
          <div class="card-body">
            <?php
            $invoice_no = $_GET['invoice_no'];

            $infostmt = $pdo->prepare("SELECT * FROM truckpackingliststock WHERE invoice_no='$invoice_no'");
            $infostmt->execute();
            $infodata = $infostmt->fetch(PDO::FETCH_ASSOC);
             ?>
             <div class="row">
               <div class="col-8">
               </div>
               <div class="col-4" style="font-weight:bold;">
                Yangon Loading Date _ <?php echo date('d-m-Y', strtotime($infodata['date']));  ?>
                <br>
                Invoice No _ <?php echo $infodata['invoice_no'];  ?>
                <br>
                Truck No _ <?php echo $infodata['truck_no'];  ?>

               </div>
             </div>
             <br>
              <?php
               $invoice_no = $_GET['invoice_no'];
               $emptyornot = $query->select('truckpackingliststockinfo', $invoice_no, 'invoice_no');
               if (!empty($emptyornot)) {
              ?>
              <div class="packingstocktable">
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
                  $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT item_id) FROM truckpackingliststockinfo WHERE invoice_no='$invoice_no'");
                  $commonditycountstmt->execute();
                  $commonditycountdatas = $commonditycountstmt->fetchColumn();
                  for ($i=0; $i < $commonditycountdatas; $i++) {
                    $commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM truckpackingliststockinfo WHERE invoice_no='$invoice_no'");
                    $commonditystmt->execute();
                    $commonditydata = $commonditystmt->fetchall();
                    $item_id = $commonditydata[$i]['item_id'];
                    $invoice_no = $_GET['invoice_no'];

                    $stmt = $pdo->prepare("SELECT * FROM truckpackingliststockinfo WHERE item_id='$item_id' AND invoice_no='$invoice_no'");
                    $stmt->execute();
                    $datas = $stmt->fetchall();
                    foreach ($datas as $packingstockinfodata) {
                      $item_id = $packingstockinfodata['item_id'];
                      $commonditydata = $query->select('item', $item_id, 'item_id');
                   ?>
                  <tr>
                    <td><?php echo $packingstockinfodata['id']; ?></td>
                    <td><?php echo $commonditydata['item_name']; ?></td>
                    <td><?php echo $packingstockinfodata['size']; ?></td>
                    <td><?php echo $packingstockinfodata['kgperbox']; ?></td>
                    <td><?php echo $packingstockinfodata['mc']; ?></td>
                    <td><?php echo $packingstockinfodata['netweight']; ?></td>
                    <td><?php echo $packingstockinfodata['totalgrossweight']; ?></td>
                  </tr>
                  <?php
                  ?>
                  <?php
                  }
                  $item_id = $packingstockinfodata['item_id'];
                  $totalmcstmt = $pdo->prepare("SELECT SUM(mc) AS totalmc FROM truckpackingliststockinfo WHERE invoice_no='$invoice_no' AND item_id='$item_id'");
                  $totalmcstmt->execute();
                  $totalmcdata = $totalmcstmt->fetch(PDO::FETCH_ASSOC);
                  $netweightstmt = $pdo->prepare("SELECT SUM(netweight) AS netweight FROM truckpackingliststockinfo WHERE invoice_no='$invoice_no' AND item_id='$item_id'");
                  $netweightstmt->execute();
                  $netweightdata = $netweightstmt->fetch(PDO::FETCH_ASSOC);
                  $totalgrssweightstmt = $pdo->prepare("SELECT SUM(totalgrossweight) AS totalgrossweight FROM truckpackingliststockinfo WHERE invoice_no='$invoice_no' AND item_id='$item_id'");
                  $totalgrssweightstmt->execute();
                  $totalgrssweightdata = $totalgrssweightstmt->fetch(PDO::FETCH_ASSOC);
                  ?>
                  <tr style="font-weight:bold;">
                  <td></td>
                  <td>Sub Total</td>
                  <td></td>
                  <td></td>
                  <td><?php echo $totalmcdata['totalmc']; ?></td>
                  <td><?php if(!empty($netweightdata['netweight'])){ echo $netweightdata['netweight']; }; ?></td>
                  <td><?php if(!empty($totalgrssweightdata['totalgrossweight'])){ echo $totalgrssweightdata['totalgrossweight']; }; ?></td>
                  </tr>
                  <?php
                }
                   ?>
                   <?php
                   $item_id = $packingstockinfodata['item_id'];
                   $totalmcstmt = $pdo->prepare("SELECT SUM(mc) AS totalmc FROM truckpackingliststockinfo WHERE invoice_no='$invoice_no'");
                   $totalmcstmt->execute();
                   $totalmcdata = $totalmcstmt->fetch(PDO::FETCH_ASSOC);
                   $netweightstmt = $pdo->prepare("SELECT SUM(netweight) AS netweight FROM truckpackingliststockinfo WHERE invoice_no='$invoice_no'");
                   $netweightstmt->execute();
                   $netweightdata = $netweightstmt->fetch(PDO::FETCH_ASSOC);
                   $totalgrssweightstmt = $pdo->prepare("SELECT SUM(totalgrossweight) AS totalgrossweight FROM truckpackingliststockinfo WHERE invoice_no='$invoice_no'");
                   $totalgrssweightstmt->execute();
                   $totalgrssweightdata = $totalgrssweightstmt->fetch(PDO::FETCH_ASSOC);
                    ?>
                   <tr>
                     <td></td>
                     <td style="font-weight:bold !important;">Grand Total</td>
                     <td></td>
                     <td></td>
                     <td style="font-weight:bold !important;"><?php echo $totalmcdata['totalmc']; ?></td>
                     <td style="font-weight:bold !important;"><?php if(!empty($netweightdata['netweight'])){ echo $netweightdata['netweight']; }; ?></td>
                     <td style="font-weight:bold !important;"><?php if(!empty($totalgrssweightdata['totalgrossweight'])){ echo $totalgrssweightdata['totalgrossweight']; }; ?></td>
                   </tr>
                </table>
                <h5 style="text-transform:uppercase;">Total Foam Box - </h5>
                <h5 style="text-transform:uppercase;">Total Net Weight - <?php if(!empty($netweightdata['netweight'])){ echo $netweightdata['netweight'] . " KGS"; }; ?></h5>
                <h5 style="text-transform:uppercase;">Total Gross Weight - <?php if(!empty($totalgrssweightdata['totalgrossweight'])){ echo $totalgrssweightdata['totalgrossweight'] . " KGS"; }; ?></h5>
              </div>
              <?php
            }else{
              ?>
              <table class="packingstocktable table table-striped table-bordered table-hover">
                <tr>
                  <th>No</th>
                  <th>Commondity</th>
                  <th>Size</th>
                  <th>Packing Kg Per Box</th>
                  <th>Mc</th>
                  <th>Total Net Weight</th>
                  <th>Total Gross Weight</th>
                </tr>
                <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                </tr>
              </table>
              <?php
            }
             ?>
               <!-- =============================================================== -->
               <?php
               $invoice_no = $_GET['invoice_no'];
               $emptyornotactualinvoice = $query->select('truckactualinvoice', $invoice_no, 'invoice_no');
               if(!empty($emptyornotactualinvoice)){
                 ?>
                 <div class="actualinvoicetable hide">
                   <table class="table table-striped table-hover table-bordered">
                     <tr>
                       <th>No</th>
                       <th>Commondity</th>
                       <th>Size</th>
                       <th>Packing Kg Per Box</th>
                       <th>Mc</th>
                       <th>Total Net Weight</th>
                       <th>USD</th>
                       <th>Total Value USD</th>
                     </tr>
                     <?php
                     $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT item_id) FROM truckactualinvoice WHERE invoice_no='$invoice_no'");
                     $commonditycountstmt->execute();
                     $commonditycountdatas = $commonditycountstmt->fetchColumn();
                     $no = 1;
                     for ($i=0; $i < $commonditycountdatas; $i++) {
                       $commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM truckactualinvoice WHERE invoice_no='$invoice_no'");
                       $commonditystmt->execute();
                       $commonditydata = $commonditystmt->fetchall();
                       $item_id = $commonditydata[$i]['item_id'];
                       $invoice_no = $_GET['invoice_no'];

                       $stmt = $pdo->prepare("SELECT * FROM truckactualinvoice WHERE item_id='$item_id' AND invoice_no='$invoice_no' ORDER BY id DESC");
                       $stmt->execute();
                       $datas = $stmt->fetchall();

                       foreach ($datas as $packingstockinfodata) {
                         $item_id = $packingstockinfodata['item_id'];
                         $commonditydata = $query->select('item', $item_id, 'item_id');

                         $id = $packingstockinfodata['id'];
                         $oncestmt = $pdo->prepare("SELECT * FROM truckactualinvoice WHERE id > '$id' AND item_id='$item_id'");
                         $oncestmt->execute();
                         $oncedatas = $oncestmt->fetch(PDO::FETCH_ASSOC);
                         if (!empty($oncedatas)) {
                           ?>
                           <tr data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $packingstockinfodata['id']; ?>">
                             <td><?php echo $no; ?></td>
                             <td><?php if($packingstockinfodata['item_id'] != $oncedatas['item_id']){ echo $commonditydata['item_name'];}; ?></td>
                             <td><?php if($packingstockinfodata['size'] != $oncedatas['size']){ echo $packingstockinfodata['size'];}; ?></td>
                             <td><?php echo $packingstockinfodata['kgperbox']; ?></td>
                             <td><?php echo $packingstockinfodata['mc']; ?></td>
                             <td><?php echo $packingstockinfodata['netweight']; ?></td>
                             <td><?php echo $packingstockinfodata['usd']; ?></td>
                             <td><?php echo $packingstockinfodata['total_usd']; ?></td>
                           </tr>
                           <?php
                         }
                         else{
                           ?>
                           <tr data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $packingstockinfodata['id']; ?>">
                             <td><?php echo $no; ?></td>
                             <td><?php echo $commonditydata['item_name']; ?></td>
                             <td><?php echo $packingstockinfodata['size']; ?></td>
                             <td><?php echo $packingstockinfodata['kgperbox']; ?></td>
                             <td><?php echo $packingstockinfodata['mc']; ?></td>
                             <td><?php echo $packingstockinfodata['netweight']; ?></td>
                             <td><?php echo $packingstockinfodata['usd']; ?></td>
                             <td><?php echo $packingstockinfodata['total_usd']; ?></td>
                           </tr>
                           <?php
                         }
                         ?>
                         <?php
                         ?>
                         <div class="modal fade" id="updatemodal<?php echo $packingstockinfodata['id']; ?>">
                           <div class="modal-dialog" role="document">
                             <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
                               <div class="modal-header bg-info text-light">
                                 <h1 class="modal-title fs-5">Update Price Of USD</h1>
                                 <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                               </div>
                               <div class="modal-body">
                                 <form action="" method="post">
                                   <input type="hidden" name="updateid" value="<?php echo $packingstockinfodata['id']; ?>">
                                   <div class="modal-body">
                                     <label>FOD/USD</label>
                                     <input type="text" name="usd" class="form-control inpv2 mb-2 mt-2">
                                   </div>
                                   <div class="modal-footer">
                                     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                     <button type="submit" class="btn btn-success" name="updatebtn">Update</button>
                                   </div>
                                 </div>
                               </div>
                             </form>
                           </div>
                         </div>
                         <?php
                         $no++;
                       }
                       $item_id = $packingstockinfodata['item_id'];
                       $totalmcstmt = $pdo->prepare("SELECT SUM(mc) AS totalmc FROM truckpackingliststockinfo WHERE invoice_no='$invoice_no' AND item_id='$item_id'");
                       $totalmcstmt->execute();
                       $totalmcdata = $totalmcstmt->fetch(PDO::FETCH_ASSOC);
                       $netweightstmt = $pdo->prepare("SELECT SUM(netweight) AS netweight FROM truckpackingliststockinfo WHERE invoice_no='$invoice_no' AND item_id='$item_id'");
                       $netweightstmt->execute();
                       $netweightdata = $netweightstmt->fetch(PDO::FETCH_ASSOC);
                       $totalusdstmt = $pdo->prepare("SELECT SUM(total_usd) AS total_usd FROM truckactualinvoice WHERE invoice_no='$invoice_no' AND item_id='$item_id'");
                       $totalusdstmt->execute();
                       $totalusddata = $totalusdstmt->fetch(PDO::FETCH_ASSOC);
                       ?>
                       <tr style="font-weight:bold;">
                         <td></td>
                         <td>Sub Total</td>
                         <td></td>
                         <td></td>
                         <td><?php echo $totalmcdata['totalmc']; ?></td>
                         <td><?php if(!empty($netweightdata['netweight'])){ echo $netweightdata['netweight']; }; ?></td>
                         <td></td>
                         <td><?php echo $totalusddata['total_usd']; ?></td>
                       </tr>
                       <?php
                     }
                     ?>
                     <?php
                     $item_id = $packingstockinfodata['item_id'];
                     $totalusdstmt = $pdo->prepare("SELECT SUM(total_usd) AS total_usd FROM truckactualinvoice WHERE invoice_no='$invoice_no'");
                     $totalusdstmt->execute();
                     $totalusddata = $totalusdstmt->fetch(PDO::FETCH_ASSOC);
                     $mcstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM truckactualinvoice WHERE invoice_no='$invoice_no'");
                     $mcstmt->execute();
                     $mcdata = $mcstmt->fetch(PDO::FETCH_ASSOC);
                     $netweightstmt = $pdo->prepare("SELECT SUM(netweight) AS total_netweight FROM truckactualinvoice WHERE invoice_no='$invoice_no'");
                     $netweightstmt->execute();
                     $netweightdata = $netweightstmt->fetch(PDO::FETCH_ASSOC);
                     $totalusdstmt = $pdo->prepare("SELECT SUM(total_usd) AS total_usd FROM truckactualinvoice WHERE invoice_no='$invoice_no'");
                     $totalusdstmt->execute();
                     $totalusddata = $totalusdstmt->fetch(PDO::FETCH_ASSOC);
                     ?>
                     <tr style="font-weight:bold !important;">
                       <td></td>
                       <td>Grand Total</td>
                       <td></td>
                       <td></td>
                       <td><?php echo $mcdata['total_mc']; ?></td>
                       <td><?php echo $netweightdata['total_netweight']; ?></td>
                       <td></td>
                       <td><?php echo $totalusddata['total_usd']; ?></td>
                     </tr>
                   </table>
                   <h5 style="text-transform:uppercase;">Total Foam Box - </h5>
                   <h5 style="text-transform:uppercase;">Total Net Weight - <?php if(!empty($netweightdata['total_netweight'])){ echo $netweightdata['total_netweight'] . " KGS"; }; ?></h5>
                   <h5 style="text-transform:uppercase;">Total Value USD - <?php if(!empty($totalusddata['total_usd'])){ echo $totalusddata['total_usd'] . " USD"; }; ?></h5>
                   <br><br>
                 </div>
                 <?php
               }else{
                 ?>
                 <table class="actualinvoicetable table table-striped table-hover table-bordered">
                   <tr>
                     <th>No</th>
                     <th>Commondity</th>
                     <th>Size</th>
                     <th>Packing Kg Per Box</th>
                     <th>Mc</th>
                     <th>Total Net Weight</th>
                     <th>USD</th>
                     <th>Total Value USD</th>
                   </tr>
                 </table>
                 <?php
               }
                ?>
             <!-- =============================================================== -->
             <?php
             $invoice_no = $_GET['invoice_no'];
             $emptyornotfoambox = $query->select('truckfoambox', $invoice_no, 'invoice_no');
             if(!empty($emptyornotfoambox)){
               ?>
             <div class="foamboxtable">
               <table class="table table-striped table-hover table-bordered">
                 <tr>
                   <th>No</th>
                   <th>Commondity</th>
                   <th>Size</th>
                   <th>Pcs Per Box</th>
                   <th>Kg Per Box</th>
                   <th>Mc</th>
                   <th>Net Weight</th>
                   <th>Foam Box No</th>
                 </tr>
                 <?php
                 $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT item_id) FROM truckfoambox WHERE invoice_no='$invoice_no'");
                 $commonditycountstmt->execute();
                 $commonditycountdatas = $commonditycountstmt->fetchColumn();
                 for ($i=0; $i < $commonditycountdatas; $i++) {
                   $commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM truckfoambox WHERE invoice_no='$invoice_no'");
                   $commonditystmt->execute();
                   $commonditydata = $commonditystmt->fetchall();
                   $item_id = $commonditydata[$i]['item_id'];
                   $invoice_no = $_GET['invoice_no'];

                   $stmt = $pdo->prepare("SELECT * FROM truckfoambox WHERE item_id='$item_id' AND invoice_no='$invoice_no'");
                   $stmt->execute();
                   $datas = $stmt->fetchall();
                   foreach ($datas as $packingstockinfodata) {
                     $item_id = $packingstockinfodata['item_id'];
                     $commonditydata = $query->select('item', $item_id, 'item_id');
                  ?>
                 <tr>
                   <td><?php echo $packingstockinfodata['id']; ?></td>
                   <td><?php echo $commonditydata['item_name']; ?></td>
                   <td><?php echo $packingstockinfodata['size']; ?></td>
                   <td><?php echo $packingstockinfodata['pcsperbox']; ?></td>
                   <td><?php echo $packingstockinfodata['kgperbox']; ?></td>
                   <td><?php echo $packingstockinfodata['mc']; ?></td>
                   <td><?php echo $packingstockinfodata['netweight']; ?></td>
                   <td data-bs-toggle="modal" data-bs-target="#addfoambox<?php echo $packingstockinfodata['id']; ?>"><?php echo $packingstockinfodata['foambox_no']; ?></td>
                 </tr>
                 <?php
                 // print_r( explode(",", $packingstockinfodata['foambox_no']));
                  ?>
                 <div class="modal fade" id="addfoambox<?php echo $packingstockinfodata['id']; ?>">
                   <div class="modal-dialog" role="document">
                     <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
                       <div class="modal-header bg-info text-light">
                         <h1 class="modal-title fs-5">Add Packing Stock</h1>
                         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                       </div>
                       <div class="modal-body">
                         <form action="" method="post">
                           <input type="hidden" name="foamboxid" value="<?php echo $packingstockinfodata['id']; ?>">
                         <div class="modal-body">
                           <label>Foam Box No</label>
                           <input type="text" name="foambox_no" class="form-control inpv2 mb-2">
                         </div>
                       </div>
                       <div class="modal-footer">
                         <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                         <button type="submit" class="btn btn-success" name="addfoamboxbtn">Add</button>
                       </div>
                       </form>
                     </div>
                   </div>
                 </div>
                 <?php
                 }
                 $item_id = $packingstockinfodata['item_id'];
                 $totalmcstmt = $pdo->prepare("SELECT SUM(mc) AS totalmc FROM truckpackingliststockinfo WHERE invoice_no='$invoice_no' AND item_id='$item_id'");
                 $totalmcstmt->execute();
                 $totalmcdata = $totalmcstmt->fetch(PDO::FETCH_ASSOC);
                 $netweightstmt = $pdo->prepare("SELECT SUM(netweight) AS netweight FROM truckfoambox WHERE invoice_no='$invoice_no' AND item_id='$item_id'");
                 $netweightstmt->execute();
                 $netweightdata = $netweightstmt->fetch(PDO::FETCH_ASSOC);
                 $totalkgperboxstmt = $pdo->prepare("SELECT SUM(kgperbox) AS total_kgperbox FROM truckfoambox WHERE invoice_no='$invoice_no' AND item_id='$item_id'");
                 $totalkgperboxstmt->execute();
                 $totalkgperboxdata = $totalkgperboxstmt->fetch(PDO::FETCH_ASSOC);
                 ?>
                 <tr style="font-weight:bold;">
                 <td></td>
                 <td>Sub Total</td>
                 <td></td>
                 <td></td>
                 <td><?php echo $totalkgperboxdata['total_kgperbox']; ?></td>
                 <td><?php echo $totalmcdata['totalmc']; ?></td>
                 <td><?php if(!empty($netweightdata['netweight'])){ echo $netweightdata['netweight']; }; ?></td>
                 <td></td>
                 </tr>
                 <?php
               }
                  ?>
                  <?php
                  $item_id = $packingstockinfodata['item_id'];
                  $totalmcstmt = $pdo->prepare("SELECT SUM(mc) AS totalmc FROM truckfoambox WHERE invoice_no='$invoice_no'");
                  $totalmcstmt->execute();
                  $totalmcdata = $totalmcstmt->fetch(PDO::FETCH_ASSOC);
                  $netweightstmt = $pdo->prepare("SELECT SUM(netweight) AS netweight FROM truckfoambox WHERE invoice_no='$invoice_no'");
                  $netweightstmt->execute();
                  $netweightdata = $netweightstmt->fetch(PDO::FETCH_ASSOC);
                  $totalkgperboxstmt = $pdo->prepare("SELECT SUM(kgperbox) AS total_kgperbox FROM truckfoambox WHERE invoice_no='$invoice_no'");
                  $totalkgperboxstmt->execute();
                  $totalkgperboxdata = $totalkgperboxstmt->fetch(PDO::FETCH_ASSOC);
                   ?>
                  <tr style="font-weight:bold !important;">
                    <td></td>
                    <td>Grand Total</td>
                    <td></td>
                    <td></td>
                    <td><?php echo $totalkgperboxdata['total_kgperbox']; ?></td>
                    <td><?php echo $totalmcdata['totalmc']; ?></td>
                    <td><?php if(!empty($netweightdata['netweight'])){ echo $netweightdata['netweight']; }; ?></td>
                    <td></td>
                  </tr>
               </table>
               <h5 style="text-transform:uppercase;">Total Foam Box - </h5>
               <h5 style="text-transform:uppercase;">Total Net Weight - <?php if(!empty($netweightdata['netweight'])){ echo $netweightdata['netweight'] . " KGS"; }; ?></h5>
             </div>
             <?php
           }else{
             ?>
             <table class="foamboxtable table table-striped table-hover table-bordered">
               <tr>
                 <th>No</th>
                 <th>Commondity</th>
                 <th>Size</th>
                 <th>Pcs Per Box</th>
                 <th>Kg Per Box</th>
                 <th>Mc</th>
                 <th>Net Weight</th>
                 <th>Foam Box No</th>
               </tr>
             </table>
             <?php
           }
              ?>
             <!-- =============================================================== -->
             <?php
             $invoice_no = $_GET['invoice_no'];
             $emptyornotdeclare = $query->select('truckdeclare', $invoice_no, 'invoice_no');
             if(!empty($emptyornotdeclare)){
               ?>
             <div class="declaretable">
               <table class="table table-striped table-hover table-bordered">
                 <tr>
                   <th>No</th>
                   <th>Commondity</th>
                   <th>Size</th>
                   <th>Pcs Per Box</th>
                   <th>Kg Per Box</th>
                   <th>Mc</th>
                   <th>Net Weight</th>
                 </tr>
                 <?php
                 $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT item_id) FROM truckdeclare WHERE invoice_no='$invoice_no'");
                 $commonditycountstmt->execute();
                 $commonditycountdatas = $commonditycountstmt->fetchColumn();
                 for ($i=0; $i < $commonditycountdatas; $i++) {
                   $commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM truckdeclare WHERE invoice_no='$invoice_no'");
                   $commonditystmt->execute();
                   $commonditydata = $commonditystmt->fetchall();
                   $item_id = $commonditydata[$i]['item_id'];
                   $invoice_no = $_GET['invoice_no'];

                   $stmt = $pdo->prepare("SELECT * FROM truckdeclare WHERE item_id='$item_id' AND invoice_no='$invoice_no'");
                   $stmt->execute();
                   $datas = $stmt->fetchall();
                   foreach ($datas as $packingstockinfodata) {
                     $item_id = $packingstockinfodata['item_id'];
                     $commonditydata = $query->select('item', $item_id, 'item_id');
                  ?>
                 <tr data-bs-toggle="modal" data-bs-target="#updatekgperbox<?php echo $packingstockinfodata['id']; ?>">
                   <td><?php echo $packingstockinfodata['id']; ?></td>
                   <td><?php echo $commonditydata['item_name']; ?></td>
                   <td><?php echo $packingstockinfodata['size']; ?></td>
                   <td><?php echo $packingstockinfodata['pcsperbox']; ?></td>
                   <td><?php echo $packingstockinfodata['kgperbox']; ?></td>
                   <td><?php echo $packingstockinfodata['mc']; ?></td>
                   <td><?php echo $packingstockinfodata['netweight']; ?></td>
                 </tr>
                 <?php
                 // print_r( explode(",", $packingstockinfodata['foambox_no']));
                  ?>
                 <div class="modal fade" id="updatekgperbox<?php echo $packingstockinfodata['id']; ?>">
                   <div class="modal-dialog" role="document">
                     <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
                       <div class="modal-header bg-info text-light">
                         <h1 class="modal-title fs-5">Add Packing Stock</h1>
                         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                       </div>
                       <div class="modal-body">
                         <form action="" method="post">
                           <input type="hidden" name="kgperboxid" value="<?php echo $packingstockinfodata['id']; ?>">
                         <div class="modal-body">
                           <label>Kg Per Box</label>
                           <input type="text" name="kgperbox" class="form-control inpv2 mb-2">
                         </div>
                       </div>
                       <div class="modal-footer">
                         <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                         <button type="submit" class="btn btn-success" name="addkgperbox">Add</button>
                       </div>
                       </form>
                     </div>
                   </div>
                 </div>
                 <?php
                 }
                 $item_id = $packingstockinfodata['item_id'];
                 $totalmcstmt = $pdo->prepare("SELECT SUM(mc) AS totalmc FROM truckpackingliststockinfo WHERE invoice_no='$invoice_no' AND item_id='$item_id'");
                 $totalmcstmt->execute();
                 $totalmcdata = $totalmcstmt->fetch(PDO::FETCH_ASSOC);
                 $netweightstmt = $pdo->prepare("SELECT SUM(netweight) AS netweight FROM truckdeclare WHERE invoice_no='$invoice_no' AND item_id='$item_id'");
                 $netweightstmt->execute();
                 $netweightdata = $netweightstmt->fetch(PDO::FETCH_ASSOC);
                 $totalkgperboxstmt = $pdo->prepare("SELECT SUM(kgperbox) AS total_kgperbox FROM truckdeclare WHERE invoice_no='$invoice_no' AND item_id='$item_id'");
                 $totalkgperboxstmt->execute();
                 $totalkgperboxdata = $totalkgperboxstmt->fetch(PDO::FETCH_ASSOC);
                 ?>
                 <tr style="font-weight:bold;">
                 <td></td>
                 <td>Sub Total</td>
                 <td></td>
                 <td></td>
                 <td><?php echo $totalkgperboxdata['total_kgperbox']; ?></td>
                 <td><?php echo $totalmcdata['totalmc']; ?></td>
                 <td><?php if(!empty($netweightdata['netweight'])){ echo $netweightdata['netweight']; }; ?></td>
                 </tr>
                 <?php
               }
                  ?>
                  <?php
                  $item_id = $packingstockinfodata['item_id'];
                  $totalmcstmt = $pdo->prepare("SELECT SUM(mc) AS totalmc FROM truckdeclare WHERE invoice_no='$invoice_no'");
                  $totalmcstmt->execute();
                  $totalmcdata = $totalmcstmt->fetch(PDO::FETCH_ASSOC);
                  $netweightstmt = $pdo->prepare("SELECT SUM(netweight) AS netweight FROM truckdeclare WHERE invoice_no='$invoice_no'");
                  $netweightstmt->execute();
                  $netweightdata = $netweightstmt->fetch(PDO::FETCH_ASSOC);
                  $totalkgperboxstmt = $pdo->prepare("SELECT SUM(kgperbox) AS total_kgperbox FROM truckdeclare WHERE invoice_no='$invoice_no'");
                  $totalkgperboxstmt->execute();
                  $totalkgperboxdata = $totalkgperboxstmt->fetch(PDO::FETCH_ASSOC);
                   ?>
                  <tr style="font-weight:bold !important;">
                    <td></td>
                    <td>Grand Total</td>
                    <td></td>
                    <td></td>
                    <td><?php echo $totalkgperboxdata['total_kgperbox']; ?></td>
                    <td><?php echo $totalmcdata['totalmc']; ?></td>
                    <td><?php if(!empty($netweightdata['netweight'])){ echo $netweightdata['netweight']; }; ?></td>
                  </tr>
               </table>
               <h5 style="text-transform:uppercase;">Total Foam Box - </h5>
               <h5 style="text-transform:uppercase;">Total Net Weight - <?php if(!empty($netweightdata['netweight'])){ echo $netweightdata['netweight'] . " KGS"; }; ?></h5>
             </div>
             <?php
           }else{
             ?>
             <table class="declaretable table table-striped table-hover table-bordered">
               <tr>
                 <th>No</th>
                 <th>Commondity</th>
                 <th>Size</th>
                 <th>Pcs Per Box</th>
                 <th>Kg Per Box</th>
                 <th>Mc</th>
                 <th>Net Weight</th>
               </tr>
             <?php
           }
              ?>
             <!-- =============================================================== -->
             <div class="modal fade" id="add">
               <div class="modal-dialog" role="document">
                 <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
                   <div class="modal-header bg-info text-light">
                     <h1 class="modal-title fs-5">Add Packing Stock</h1>
                     <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                   </div>
                   <div class="modal-body">
                     <form action="" method="post">
                       <input type="hidden" name="invoice_no" value="<?php echo $_GET['invoice_no']; ?>">
                     <div class="modal-body">
                       <div class="row">
                         <div class="col">
                           <label>Commondity</label>
                           <select class="form-control inpv2 mb-2" name="item_id">
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
                           <label>Pcs Per Box</label>
                           <input type="number" name="pcsperbox" class="form-control inpv2 mb-2">
                         </div>
                         <div class="col">
                           <label>Kg Per Box</label>
                           <input type="text" name="kgperbox" class="form-control inpv2 mb-2">
                         </div>
                       </div>
                       <div class="row">
                         <div class="col">
                           <label>Mc</label>
                           <input type="number" name="mc" class="form-control inpv2 mb-2">
                         </div>
                         <div class="col mt-4">
                           <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                           <button type="submit" class="btn btn-success" name="add">Add</button>
                         </div>
                       </div>
                     </div>
                   </div>
                   </form>
                 </div>
               </div>
             </div>
          </div>
        </div>
      </div>
    </div>
    <script type="text/javascript">
    $(document).ready(function(){
      <?php
      if(!empty($packingstockinfobankdata)){
        echo '
        $(".datas").show();
        $(".inputs").hide();
        ';
      }
       ?>
       <?php
       if($_SESSION['tabs'] == ''){
         echo '
         $("#declare").show();
         $("#foambox").show();
         $(".declaretable").hide();
         $(".foamboxtable").hide();
         $("#actualinvoice").show();
         $("#actualinvoiceback").hide();
         $(".actualinvoicetable").hide();
         $("#addpackingstockbtn").show();
         $(".packingstocktable").show();
         $("#dtext").hide();
         $("#fbtext").hide();
         $("#itext").hide();
         $("#pltext").show();
         $("#back").show();
         ';
       }elseif($_SESSION['tabs'] == 'actualinvoice'){
         echo '
         $("#declare").hide();
         $("#foambox").hide();
         $(".declaretable").hide();
         $(".foamboxtable").hide();
         $("#actualinvoice").hide();
         $("#actualinvoiceback").show();
         $(".actualinvoicetable").show();
         $("#addpackingstockbtn").hide();
         $(".packingstocktable").hide();
         $("#dtext").hide();
         $("#fbtext").hide();
         $("#itext").show();
         $("#pltext").hide();
         $("#back").hide();
         ';
       }elseif($_SESSION['tabs'] == 'actualpackinglist'){
         echo '
         $("#declare").show();
         $("#foambox").show();
         $(".declaretable").hide();
         $(".foamboxtable").hide();
         $("#actualinvoice").show();
         $("#actualinvoiceback").hide();
         $(".actualinvoicetable").hide();
         $("#addpackingstockbtn").show();
         $(".packingstocktable").show();
         $("#dtext").hide();
         $("#fbtext").hide();
         $("#itext").hide();
         $("#pltext").show();
         $("#back").show();
         ';
       }elseif($_SESSION['tabs'] == 'foambox'){
         echo '
         $("#declare").hide();
         $("#foambox").hide();
         $(".declaretable").hide();
         $(".foamboxtable").show();
         $("#actualinvoice").hide();
         $("#actualinvoiceback").show();
         $(".actualinvoicetable").hide();
         $("#addpackingstockbtn").hide();
         $(".packingstocktable").hide();
         $("#dtext").hide();
         $("#fbtext").show();
         $("#itext").hide();
         $("#pltext").hide();
         $("#back").hide();
         ';
       }elseif($_SESSION['tabs'] == 'declare'){
         echo '
         $("#declare").hide();
         $("#foambox").hide();
         $(".declaretable").show();
         $(".foamboxtable").hide();
         $("#actualinvoice").hide();
         $("#actualinvoiceback").show();
         $(".actualinvoicetable").hide();
         $("#addpackingstockbtn").hide();
         $(".packingstocktable").hide();
         $("#dtext").show();
         $("#fbtext").hide();
         $("#itext").hide();
         $("#pltext").hide();
         $("#back").hide();
         ';
       }
       ?>
    });
    </script>
    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
