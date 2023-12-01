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
      $commondity = $_POST['commondity_id'];
      $size = $_POST['size'];
      $packingkgperbox = $_POST['packingkgperbox'];
      $mc = $_POST['mc'];
      $infoid = $_POST['infoid'];

      $query->addpackinglistinfo($commondity, $size, $packingkgperbox, $mc, $infoid);

    }

    if (isset($_POST['updatebtn'])) {
      $usd = $_POST['usd'];
      $updateid = $_POST['updateid'];

      $commonditystmt = $pdo->prepare("SELECT * FROM actualinvoice WHERE id='$updateid'");
      $commonditystmt->execute();
      $commonditydata = $commonditystmt->fetch(PDO::FETCH_ASSOC);
      $commondity_id = $commonditydata['commondity_id'];

      $itemstmt = $pdo->prepare("SELECT * FROM item WHERE item_id='$commondity_id'");
      $itemstmt->execute();
      $itemdata = $itemstmt->fetch(PDO::FETCH_ASSOC);
      $item = $itemdata['item_name'];

      if (str_contains(strtolower($item), 'block')) {
        $query->updateblockusd($usd, $updateid);
      }else{
        $query->updateactualinvoice($usd, $updateid);
      }
    }

    if(isset($_POST['bankingbtn'])){
      if(!empty($_POST['company_name'])){
          $company_name = $_POST['company_name'];
          $company_address = $_POST['company_address'];
          $usd = $_POST['usd'];
          $account_type = $_POST['account_type'];
          $bank_name = $_POST['bank_name'];
          $swift_code = $_POST['swift_code'];
          $bank_branch_address = $_POST['bank_branch_address'];
          $infoid = $_GET['infoid'];

          $query->addbankdetail($company_name,$company_address,$usd,$account_type,$bank_name,$swift_code,$bank_branch_address,$infoid);
      }
    }

    if (isset($_POST['updatepackinglist'])) {
      $upitem_id = $_POST['upitem_id'];
      $upsize = $_POST['upsize'];
      $upkgperbox = $_POST['upkgperbox'];
      $upmc = $_POST['upmc'];
      $upid = $_POST['upid'];

      $query->updatepackinglist($upitem_id, $upsize, $upkgperbox, $upmc, $upid);
    }
    if (isset($_POST['totalgrossweightupdatebtn'])) {
      $upid = $_POST['upid'];
      $totalgrossweightupdata = $_POST['totalgrossweightupdata'];

      $query->updatetotalgrossweight($upid, $totalgrossweightupdata);
    }

    if (isset($_POST['updatetotalusdbtn'])) {
      $totalusd = $_POST['totalusd'];
      $updateid = $_POST['updateid'];

      $query->updatetotalusd($totalusd, $updateid);
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
        <div class="card">
          <form  action="" method="post">


          <div class="card-header bg-info">
            <?php
            if(isset($_POST['actualinvoicebtn'])){
              $_SESSION['tabs'] = 'actualinvoice';
            }elseif(isset($_POST['actualinvoiceback'])){
              $_SESSION['tabs'] = 'actualpackinglist';
            }
             ?>
            <span class=" text-light" id="pltext" style="font-size:20px; font-weight:bold;">Actual Packing List</span>
            <span class=" text-light hide" id="itext" style="font-size:20px; font-weight:bold;">Actual Invoice</span>
            <a href="packing_stock.php" class="btn btn-secondary float-end me-2 btn-sm ms-2" id="back">Back</a>
            <button type="submit" class="btn btn-danger float-end btn-sm" id="actualinvoice" name="actualinvoicebtn">Actual Invoice</button>
            <button type="submit" class="btn btn-danger float-end btn-sm me-2" id="actualinvoiceback" name="actualinvoiceback">Back</button>
            <a href="export.php?table_name=actualinvoice&infoid=<?php echo $_GET['infoid']; ?>" class="btn btn-sm me-2 btn-success float-end" id="export">Export</a>
            <button type="button" class="btn btn-success float-end me-2 btn-sm" data-bs-toggle="modal" data-bs-target="#add" id="addpackingstockbtn">Add Packing Stock</button>
            <form action="" method="post">
              <button type="submit" name="searchcommonditybtn" class="btn btn-sm btn-dark float-end me-2">View</button>
              <select class="form-control float-end me-2 inpv2" style="width: 16%; height:28px; padding-top:3px;" name="searchcommondity">
                <option value="">Commondity Search</option>
                <?php
                $commonditystmt = $pdo->prepare("SELECT DISTINCT commondity_id FROM packingliststockinfo");
                $commonditystmt->execute();
                $commonditydatas = $commonditystmt->fetchall();

                foreach ($commonditydatas as $commonditydata) {
                  $commondityname = $query->select('item', $commonditydata['commondity_id'], 'item_id');
                  ?>
                  <option value="<?= $commonditydata['commondity_id']; ?>"><?= $commondityname['item_name']; ?></option>
                  <?php
                } ?>
              </select>
            </form>
          </div>
        </form>
          <div class="card-body">
            <?php
            $infoid = $_GET['infoid'];

            $infostmt = $pdo->prepare("SELECT * FROM packingliststock WHERE id='$infoid'");
            $infostmt->execute();
            $infodata = $infostmt->fetch(PDO::FETCH_ASSOC);
             ?>
             <div class="row" style="font-weight: bold;">
               <div class="col-1">

               </div>
               <div class="col-7">
                 <?php
                   $customer_id = $infodata['customer_id'];
                   $acnamedata = $query->select('acname', $customer_id, 'code_no');
                   $customerdata = $query->select('customers', $customer_id, 'customer_id');
                   echo $acnamedata['ac_name'];
                   ?><br><?php
                   echo $customerdata['customer_detail'];
                   ?><br><?php
                   echo $customerdata['customer_address'];
                   ?>
               </div>
               <div class="col-3">
                 Date : <?php echo date('d-m-Y', strtotime($infodata['date']));  ?>
                 <br>
                 Invoice No : <?php echo $infodata['invoiceno'];  ?>
                 <br>
                 CTNR No : <?php echo $infodata['containerno'];  ?>
                 <br>
                 VESSEL NAME : <?php echo $infodata['vessel_name']; ?>
                 <br>
                 VOY NAME : <?php echo $infodata['voyname']; ?>
                 <br>
                 FDA : <?php echo $infodata['fda']; ?>

               </div>
               <div class="col-1">

               </div>
             </div>
             <br>
             <?php
             $infoid = $_GET['infoid'];
             $emptyornot = $query->select('packingliststockinfo', $infoid, 'infoid'  );
             if (!empty($emptyornot)) {
               if (isset($_POST['searchcommonditybtn']) && !empty($_POST['searchcommondity'])) {
                ?>
                <table class="table table-striped table-hover table-bordered" id="packingstocktable">
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
                 $searchcommondity = $_POST['searchcommondity'];
                 $sizecountstmt = $pdo->prepare("SELECT COUNT(DISTINCT size) FROM packingliststockinfo WHERE infoid='$infoid' AND commondity_id='$searchcommondity'");
                 $sizecountstmt->execute();
                 $sizecountdatas = $sizecountstmt->fetchColumn();
                 $no = 1;
                 for ($i=0; $i < $sizecountdatas; $i++) {
                   $sizestmt = $pdo->prepare("SELECT DISTINCT size FROM packingliststockinfo WHERE infoid='$infoid' AND commondity_id='$searchcommondity'");
                   $sizestmt->execute();
                   $sizedata = $sizestmt->fetchall();
                   $size = $sizedata[$i]['size'];
                   $infoid = $_GET['infoid'];

                   $stmt = $pdo->prepare("SELECT * FROM packingliststockinfo WHERE size='$size' AND infoid='$infoid' AND commondity_id='$searchcommondity'");
                   $stmt->execute();
                   $datas = $stmt->fetchall();
                   foreach ($datas as $packingstockinfodata) {
                     $item_id = $packingstockinfodata['commondity_id'];
                     $commonditydata = $query->select('item', $item_id, 'item_id');
                     $lastid = $packingstockinfodata['id'];
                     $size = $packingstockinfodata['size'];
                     $infoid = $packingstockinfodata['infoid'];
                     $checklast = $pdo->prepare("SELECT * FROM packingliststockinfo WHERE id < $lastid AND commondity_id='$item_id' AND size='$size' AND infoid='$infoid'");
                     $checklast->execute();
                     $checklastavaliable = $checklast->fetch(PDO::FETCH_ASSOC);
                     $lastcommondity = $pdo->prepare("SELECT * FROM packingliststockinfo WHERE id < $lastid AND commondity_id='$item_id' AND infoid='$infoid'");
                     $lastcommondity->execute();
                     $lastcommondity = $lastcommondity->fetch(PDO::FETCH_ASSOC);
                  ?>
                 <tr>
                   <td><?php if(empty($lastcommondity)){ echo $no; }?></td>
                   <td><?php if(empty($lastcommondity)){ echo $commonditydata['item_name']; }; ?></td>
                   <td><?php if(empty($checklastavaliable)){ echo $packingstockinfodata['size']; } ?></td>
                   <td><?php echo $packingstockinfodata['packingkgperbox']; ?></td>
                   <td><?php echo $packingstockinfodata['mc']; ?></td>
                   <td><?php echo $packingstockinfodata['totalnetweight']; ?></td>
                   <td <?php if(str_contains($commonditydata['item_name'], 'block')){echo 'data-bs-toggle="modal"'; } ?> data-bs-target="#totalnetweightmodal<?= $packingstockinfodata['id']; ?>"><?php echo $packingstockinfodata['totalgrossweight']; ?></td>
                 </tr>
                 <?php
                 ?>
                 <div class="modal fade" id="totalnetweightmodal<?= $packingstockinfodata['id']; ?>">
                   <div class="modal-dialog">
                     <div class="modal-content" style="width: 650px !important; margin-top:70px !important;">
                       <div class="modal-header bg-secondary text-light">
                         <h1 class="modal-title fs-5">Edit Packing List</h1>
                         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                       </div>
                     <form action="" method="post">
                       <input type="hidden" name="upid" value="<?= $packingstockinfodata['id']; ?>">
                       <div class="modal-body">
                        <label>Total Gross Weight</label>
                        <input type="text" name="totalgrossweightupdata" class="form-control">
                       </div>
                       <div class="modal-footer">
                        <button name="totalgrossweightupdatebtn" class="btn btn-warning text-light">Update</button>
                       </div>
                     </div>
                   </form>
                   </div>
                 </div>
                 <?php
                 }
                 $size = $packingstockinfodata['size'];
                 $totalmcstmt = $pdo->prepare("SELECT SUM(mc) AS totalmc FROM packingliststockinfo WHERE infoid='$infoid' AND size='$size' AND commondity_id='$searchcommondity'");
                 $totalmcstmt->execute();
                 $totalmcdata = $totalmcstmt->fetch(PDO::FETCH_ASSOC);
                 $totalnetweightstmt = $pdo->prepare("SELECT SUM(totalnetweight) AS totalnetweight FROM packingliststockinfo WHERE infoid='$infoid' AND size='$size' AND commondity_id='$searchcommondity'");
                 $totalnetweightstmt->execute();
                 $totalnetweightdata = $totalnetweightstmt->fetch(PDO::FETCH_ASSOC);
                 $totalgrssweightstmt = $pdo->prepare("SELECT SUM(totalgrossweight) AS totalgrossweight FROM packingliststockinfo WHERE infoid='$infoid' AND size='$size' AND commondity_id='$searchcommondity'");
                 $totalgrssweightstmt->execute();
                 $totalgrssweightdata = $totalgrssweightstmt->fetch(PDO::FETCH_ASSOC);
                 ?>
                 <tr style="font-weight: bold !important;">
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
                  $no++;
                  ?>
                  <?php
                  $searchcommondity = $_POST['searchcommondity'];
                  $size = $packingstockinfodata['size'];
                  $totalmcstmt = $pdo->prepare("SELECT SUM(mc) AS totalmc FROM packingliststockinfo WHERE infoid='$infoid' AND commondity_id='$searchcommondity'");
                  $totalmcstmt->execute();
                  $totalmcdata = $totalmcstmt->fetch(PDO::FETCH_ASSOC);
                  $totalnetweightstmt = $pdo->prepare("SELECT SUM(totalnetweight) AS totalnetweight FROM packingliststockinfo WHERE infoid='$infoid' AND commondity_id='$searchcommondity'");
                  $totalnetweightstmt->execute();
                  $totalnetweightdata = $totalnetweightstmt->fetch(PDO::FETCH_ASSOC);
                  $totalgrssweightstmt = $pdo->prepare("SELECT SUM(totalgrossweight) AS totalgrossweight FROM packingliststockinfo WHERE infoid='$infoid' AND commondity_id='$searchcommondity'");
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
                <?php
               }else{
                ?>
                <table class="table table-striped table-hover table-bordered" id="packingstocktable">
                 <tr>
                   <th>No</th>
                   <th>Commondity</th>
                   <th>Size</th>
                   <th>Packing Kg Per Box</th>
                   <th>Mc</th>
                   <th>Total Net Weight</th>
                   <th>Total Gross Weight</th>
                   <th>Action</th>
                 </tr>
                 <?php
                 $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT commondity_id) FROM packingliststockinfo WHERE infoid='$infoid'");
                 $commonditycountstmt->execute();
                 $commonditycountdatas = $commonditycountstmt->fetchColumn();
                 $no = 1;
                 for ($i=0; $i < $commonditycountdatas; $i++) {
                   $commonditystmt = $pdo->prepare("SELECT DISTINCT commondity_id FROM packingliststockinfo WHERE infoid='$infoid'");
                   $commonditystmt->execute();
                   $commonditydata = $commonditystmt->fetchall();
                   $commondity_id = $commonditydata[$i]['commondity_id'];
                   $infoid = $_GET['infoid'];

                   $stmt = $pdo->prepare("SELECT * FROM packingliststockinfo WHERE commondity_id='$commondity_id' AND infoid='$infoid' ORDER BY size");
                   $stmt->execute();
                   $datas = $stmt->fetchall();
                   foreach ($datas as $packingstockinfodata) {

                     $item_id = $packingstockinfodata['commondity_id'];
                     $commonditydata = $query->select('item', $item_id, 'item_id');
                     $lastid = $packingstockinfodata['id'];
                     $size = $packingstockinfodata['size'];
                     $infoid = $packingstockinfodata['infoid'];
                     $checklast = $pdo->prepare("SELECT * FROM packingliststockinfo WHERE id < $lastid AND commondity_id='$item_id' AND size='$size' AND infoid='$infoid'");
                     $checklast->execute();
                     $checklastavaliable = $checklast->fetch(PDO::FETCH_ASSOC);
                     $lastcommondity = $pdo->prepare("SELECT * FROM packingliststockinfo WHERE id < $lastid AND commondity_id='$item_id' AND infoid='$infoid'");
                     $lastcommondity->execute();
                     $lastcommondity = $lastcommondity->fetch(PDO::FETCH_ASSOC);
                  ?>
                 <tr>
                   <td><?php if(empty($lastcommondity)){ echo $no; }?></td>
                   <td><?php if(empty($lastcommondity)){ echo $commonditydata['item_name']; }; ?></td>
                   <td><?php if(empty($checklastavaliable)){ echo $packingstockinfodata['size']; } ?></td>
                   <td><?php echo $packingstockinfodata['packingkgperbox']; ?></td>
                   <td><?php echo $packingstockinfodata['mc']; ?></td>
                   <td><?php echo $packingstockinfodata['totalnetweight']; ?></td>
                   <td <?php if(str_contains(strtolower($commonditydata['item_name']), 'block') || str_contains(strtolower($commonditydata['item_name']), 'bala')){echo 'data-bs-toggle="modal"'; } ?> data-bs-target="#totalnetweightmodal<?= $packingstockinfodata['id']; ?>"><?php echo $packingstockinfodata['totalgrossweight']; ?></td>
                   <td>
                     <button type="submit" data-bs-toggle="modal" data-bs-target="#updatepackinglist<?php echo $packingstockinfodata['id']; ?>" class="btn btn-warning d-inline text-light btn-sm" name="updatebutton"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                         <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                         <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                       </svg>
                     </button>
                   </td>
                 </tr>
                 <div class="modal fade" id="updatepackinglist<?= $packingstockinfodata['id']; ?>">
                   <div class="modal-dialog">
                     <div class="modal-content" style="width: 650px !important; margin-top:70px !important;">
                       <div class="modal-header bg-secondary text-light">
                         <h1 class="modal-title fs-5">Edit Packing List</h1>
                         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                       </div>
                     <form action="" method="post">
                       <input type="hidden" name="upid" value="<?= $packingstockinfodata['id']; ?>">
                       <div class="modal-body">
                         <div class="row">
                           <div class="col">
                             <label>Commondity</label>
                             <select class="form-control inpv2 mb-2" name="upitem_id">
                               <?php
                               $upcommonditystmt = $pdo->prepare("SELECT DISTINCT commondity_id FROM packingliststockinfo");
                               $upcommonditystmt->execute();
                               $upcommonditydatas = $upcommonditystmt->fetchall();
                               foreach ($upcommonditydatas as $upcommonditydata) {
                                 $item_id = $upcommonditydata['commondity_id'];
                                 $commonditydata = $query->select('item', $item_id, 'item_id');
                                 ?>
                                 <option value="<?php echo $commonditydata['item_id']; ?>" <?php if($packingstockinfodata['commondity_id'] == $commonditydata['item_id']){ echo 'selected';} ?>><?php echo $commonditydata['item_name']; ?></option>
                                 <?php
                               }
                               ?>
                             </select>
                           </div>
                           <div class="col">
                             <label>Size</label>
                             <input type="text" name="upsize" class="form-control inpv2 mb-2" value="<?= $packingstockinfodata['size']; ?>">
                           </div>
                         </div>
                         <div class="row">
                           <div class="col">
                             <label>Packing Kg Per Box</label>
                             <input type="text" name="upkgperbox" class="form-control inpv2 mb-2" value="<?= $packingstockinfodata['packingkgperbox'] ?>">
                           </div>
                           <div class="col">
                             <label>Mc</label>
                             <input type="number" name="upmc" class="form-control inpv2 mb-2" value="<?= $packingstockinfodata['mc']; ?>">
                            </div>
                         </div>
                         <div class="modal-footer">
                           <div class="mt-2">
                             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                             <button type="submit" class="btn btn-success text-light" name="updatepackinglist">Edit</button>
                           </div>
                         </div>
                       </div>
                     </div>
                   </form>
                   </div>
                 </div>
                 <div class="modal fade" id="totalnetweightmodal<?= $packingstockinfodata['id']; ?>">
                   <div class="modal-dialog">
                     <div class="modal-content" style="width: 650px !important; margin-top:70px !important;">
                       <div class="modal-header bg-warning text-light">
                         <h1 class="modal-title fs-5">Edit Gross Weight</h1>
                         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                       </div>
                     <form action="" method="post">
                       <input type="hidden" name="upid" value="<?= $packingstockinfodata['id']; ?>">
                       <div class="modal-body">
                        <label>Total Gross Weight</label>
                        <input type="text" name="totalgrossweightupdata" class="form-control">
                       </div>
                       <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button name="totalgrossweightupdatebtn" class="btn btn-success text-light">Update</button>
                       </div>
                     </div>
                   </form>
                   </div>
                 </div>
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
                 <tr style="font-weight: bold !important;">
                 <td></td>
                 <td>Sub Total</td>
                 <td></td>
                 <td></td>
                 <td><?php echo $totalmcdata['totalmc']; ?></td>
                 <td><?php if(!empty($totalnetweightdata['totalnetweight'])){ echo $totalnetweightdata['totalnetweight']; }; ?></td>
                 <td><?php if(!empty($totalgrssweightdata['totalgrossweight'])){ echo $totalgrssweightdata['totalgrossweight']; }; ?></td>
                 <td></td>
                </tr>
                 <?php
                 $no++;
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
                    <td></td>
                  </tr>
               </table>
                <?php
               }
              }else{
                ?>
                <!-- ========================PACKING LIST EMPTY================================= -->
                <table class="table table-striped table-bordered table-hover">
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
               <!-- ========================ACTUAL INVOICE================================= -->
               <div class="actualinvoicetable hide">
                <?php
                  if (isset($_POST['searchcommonditybtn']) && !empty($_POST['searchcommondity'])) {
                    ?>
                    <table class="table table-striped table-hover table-bordered">
                   <tr>
                     <th>No</th>
                     <th>Commondity</th>
                     <th>Size</th>
                     <th>Packing Kg Per Box</th>
                     <th>Mc</th>
                     <th>Total Net Weight</th>
                     <th>FOD/USD</th>
                     <th>Total USD</th>
                   </tr>
                   <?php
                   $searchcommondity = $_POST['searchcommondity'];
                   $sizecountstmt = $pdo->prepare("SELECT COUNT(DISTINCT size) FROM actualinvoice WHERE infoid='$infoid' AND commondity_id='$searchcommondity'");
                   $sizecountstmt->execute();
                   $sizecountdatas = $sizecountstmt->fetchColumn();
                   $no = 1;
                   for ($i=0; $i < $sizecountdatas; $i++) {
                     $sizestmt = $pdo->prepare("SELECT DISTINCT size FROM actualinvoice WHERE infoid='$infoid' AND commondity_id='$searchcommondity'");
                     $sizestmt->execute();
                     $sizedata = $sizestmt->fetchall();
                     $size = $sizedata[$i]['size'];
                     $infoid = $_GET['infoid'];

                     $stmt = $pdo->prepare("SELECT * FROM actualinvoice WHERE size='$size' AND infoid='$infoid' AND commondity_id='$searchcommondity'");
                     $stmt->execute();
                     $datas = $stmt->fetchall();

                     foreach ($datas as $packingstockinfodata) {

                     $item_id = $packingstockinfodata['commondity_id'];
                     $commonditydata = $query->select('item', $item_id, 'item_id');
                     $lastid = $packingstockinfodata['id'];
                     $size = $packingstockinfodata['size'];
                     $infoid = $packingstockinfodata['infoid'];
                     $checklast = $pdo->prepare("SELECT * FROM actualinvoice WHERE id < $lastid AND commondity_id='$item_id' AND size='$size' AND infoid='$infoid'");
                     $checklast->execute();
                     $checklastavaliable = $checklast->fetch(PDO::FETCH_ASSOC);
                     $lastcommondity = $pdo->prepare("SELECT * FROM actualinvoice WHERE id < $lastid AND commondity_id='$item_id' AND infoid='$infoid'");
                     $lastcommondity->execute();
                     $lastcommondity = $lastcommondity->fetch(PDO::FETCH_ASSOC);
                         ?>
                         <tr>
                           <td><?php if(empty($lastcommondity)){ echo $no; } ?></td>
                           <td><?php if(empty($lastcommondity)){ echo $commonditydata['item_name'];}; ?></td>
                           <td><?php if(empty($checklastavaliable)){ echo $packingstockinfodata['size'];}; ?></td>
                           <td><?php echo $packingstockinfodata['packingkgperbox']; ?></td>
                           <td><?php echo $packingstockinfodata['mc']; ?></td>
                           <td><?php echo $packingstockinfodata['totalnetweight']; ?></td>
                           <td data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $packingstockinfodata['id']; ?>"><?php if($packingstockinfodata['usd'] != 0 ){ echo $packingstockinfodata['usd'];} ?></td>
                           <td><?php if($packingstockinfodata['total_usd'] != 0 ){ echo $packingstockinfodata['total_usd'];} ?></td>
                         </tr>
                       <div class="modal fade" id="updatemodal<?php echo $packingstockinfodata['id']; ?>">
                         <div class="modal-dialog" role="document">
                           <div class="modal-content" style="width: 650px !important; margin-top:70px !important;">
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
                     $size = $packingstockinfodata['size'];
                     $totalmcstmt = $pdo->prepare("SELECT SUM(mc) AS totalmc FROM packingliststockinfo WHERE infoid='$infoid' AND size='$size' AND commondity_id='$searchcommondity'");
                     $totalmcstmt->execute();
                     $totalmcdata = $totalmcstmt->fetch(PDO::FETCH_ASSOC);
                     $totalnetweightstmt = $pdo->prepare("SELECT SUM(totalnetweight) AS totalnetweight FROM packingliststockinfo WHERE infoid='$infoid' AND size='$size' AND commondity_id='$searchcommondity'");
                     $totalnetweightstmt->execute();
                     $totalnetweightdata = $totalnetweightstmt->fetch(PDO::FETCH_ASSOC);
                     ?>
                     <tr style="font-weight: bold !important;">
                       <td></td>
                       <td>Sub Total</td>
                       <td></td>
                       <td></td>
                       <td><?php echo $totalmcdata['totalmc']; ?></td>
                       <td><?php if(!empty($totalnetweightdata['totalnetweight'])){ echo $totalnetweightdata['totalnetweight']; }; ?></td>
                       <td></td>
                       <td></td>
                     </tr>
                     <?php
                   }
                   ?>
                   <?php
                   $searchcommondity = $_POST['searchcommondity'];
                   $size = $packingstockinfodata['size'];
                   $totalusdstmt = $pdo->prepare("SELECT SUM(total_usd) AS total_usd FROM actualinvoice WHERE infoid='$infoid' AND commondity_id='$searchcommondity'");
                   $totalusdstmt->execute();
                   $totalusddata = $totalusdstmt->fetch(PDO::FETCH_ASSOC);
                   ?>
                   <tr>
                     <td></td>
                     <td style="font-weight:bold !important;">Grand Total</td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td><?php echo $totalusddata['total_usd']; ?></td>
                   </tr>
                 </table>
                    <?php
                  }else{
                    ?>
                <table class="table table-striped table-hover table-bordered">
                   <tr>
                     <th>No</th>
                     <th>Commondity</th>
                     <th>Size</th>
                     <th>Packing Kg Per Box</th>
                     <th>Mc</th>
                     <th>Total Net Weight</th>
                     <th>FOD/USD</th>
                     <th>Total USD</th>
                   </tr>
                   <?php
                   $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT commondity_id) FROM actualinvoice WHERE infoid='$infoid'");
                   $commonditycountstmt->execute();
                   $commonditycountdatas = $commonditycountstmt->fetchColumn();
                   $no = 1;
                   for ($i=0; $i < $commonditycountdatas; $i++) {
                     $commonditystmt = $pdo->prepare("SELECT DISTINCT commondity_id FROM actualinvoice WHERE infoid='$infoid'");
                     $commonditystmt->execute();
                     $commonditydata = $commonditystmt->fetchall();
                     $commondity_id = $commonditydata[$i]['commondity_id'];
                     $infoid = $_GET['infoid'];

                     $stmt = $pdo->prepare("SELECT * FROM actualinvoice WHERE commondity_id='$commondity_id' AND infoid='$infoid' ORDER BY size");
                     $stmt->execute();
                     $datas = $stmt->fetchall();

                     foreach ($datas as $packingstockinfodata) {

                       $item_id = $packingstockinfodata['commondity_id'];
                       $commonditydata = $query->select('item', $item_id, 'item_id');
                       $lastid = $packingstockinfodata['id'];
                       $size = $packingstockinfodata['size'];
                       $infoid = $packingstockinfodata['infoid'];
                       $checklast = $pdo->prepare("SELECT * FROM actualinvoice WHERE id < $lastid AND commondity_id='$item_id' AND size='$size' AND infoid='$infoid'");
                       $checklast->execute();
                       $checklastavaliable = $checklast->fetch(PDO::FETCH_ASSOC);
                       $lastcommondity = $pdo->prepare("SELECT * FROM actualinvoice WHERE id < $lastid AND commondity_id='$item_id' AND infoid='$infoid'");
                       $lastcommondity->execute();
                       $lastcommondity = $lastcommondity->fetch(PDO::FETCH_ASSOC);

                         ?>
                         <tr>
                           <td><?php if(empty($lastcommondity)){ echo $no; } ?></td>
                           <td><?php if(empty($lastcommondity)){ echo $commonditydata['item_name'];}; ?></td>
                           <td><?php if(empty($checklastavaliable)){ echo $packingstockinfodata['size'];}; ?></td>
                           <td><?php echo $packingstockinfodata['packingkgperbox']; ?></td>
                           <td><?php echo $packingstockinfodata['mc']; ?></td>
                           <td><?php echo $packingstockinfodata['totalnetweight']; ?></td>
                           <td data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $packingstockinfodata['id']; ?>"><?php if($packingstockinfodata['usd'] != 0 ){ echo $packingstockinfodata['usd'];} ?></td>
                           <td <?php if(str_contains(strtolower($commonditydata['item_name']), 'bala')){ echo 'data-bs-toggle="modal"'; } ?> data-bs-target="#updatetotalusd<?php echo $packingstockinfodata['id']; ?>"><?php if($packingstockinfodata['total_usd'] != 0 ){ echo $packingstockinfodata['total_usd'];} ?></td>
                         </tr>
                       <div class="modal fade" id="updatemodal<?php echo $packingstockinfodata['id']; ?>">
                         <div class="modal-dialog" role="document">
                           <div class="modal-content" style="width: 650px !important; margin-top:70px !important;">
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
                       <div class="modal fade" id="updatetotalusd<?php echo $packingstockinfodata['id']; ?>">
                         <div class="modal-dialog" role="document">
                           <div class="modal-content" style="width: 650px !important; margin-top:70px !important;">
                             <div class="modal-header bg-primary text-light">
                               <h1 class="modal-title fs-5">Update Price Of Total USD</h1>
                               <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                             </div>
                             <div class="modal-body">
                               <form action="" method="post">
                                 <input type="hidden" name="updateid" value="<?php echo $packingstockinfodata['id']; ?>">
                                 <div class="modal-body">
                                   <label>Total USD</label>
                                   <input type="text" name="totalusd" class="form-control inpv2 mb-2 mt-2">
                                 </div>
                                 <div class="modal-footer">
                                   <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                   <button type="submit" class="btn btn-success" name="updatetotalusdbtn">Update</button>
                                 </div>
                               </div>
                             </div>
                           </form>
                         </div>
                       </div>
                       <?php
                     }
                     $item_id = $packingstockinfodata['commondity_id'];
                     $totalmcstmt = $pdo->prepare("SELECT SUM(mc) AS totalmc FROM packingliststockinfo WHERE infoid='$infoid' AND commondity_id='$item_id'");
                     $totalmcstmt->execute();
                     $totalmcdata = $totalmcstmt->fetch(PDO::FETCH_ASSOC);
                     $totalnetweightstmt = $pdo->prepare("SELECT SUM(totalnetweight) AS totalnetweight FROM packingliststockinfo WHERE infoid='$infoid' AND commondity_id='$item_id'");
                     $totalnetweightstmt->execute();
                     $totalnetweightdata = $totalnetweightstmt->fetch(PDO::FETCH_ASSOC);
                     ?>
                     <tr style="font-weight: bold !important;">
                       <td></td>
                       <td>Sub Total</td>
                       <td></td>
                       <td></td>
                       <td><?php echo $totalmcdata['totalmc']; ?></td>
                       <td><?php if(!empty($totalnetweightdata['totalnetweight'])){ echo $totalnetweightdata['totalnetweight']; }; ?></td>
                       <td></td>
                       <td></td>
                     </tr>
                     <?php
                     $no++;
                   }
                   ?>
                   <?php
                   if(!empty($packingstockinfodata['commondity_id'])){
                    $item_id = $packingstockinfodata['commondity_id'];
                   $totalusdstmt = $pdo->prepare("SELECT SUM(total_usd) AS total_usd FROM actualinvoice WHERE infoid='$infoid'");
                   }else{
                   $totalusdstmt = $pdo->prepare("SELECT SUM(total_usd) AS total_usd FROM actualinvoice WHERE infoid='$infoid'");
                    
                   }
                   $totalusdstmt->execute();
                   $totalusddata = $totalusdstmt->fetch(PDO::FETCH_ASSOC);
                   ?>
                   <tr>
                     <td></td>
                     <td style="font-weight:bold !important;">Grand Total</td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td></td>
                     <td><?php echo $totalusddata['total_usd']; ?></td>
                   </tr>
                 </table>
                    <?php
                  }
                ?>
               <!-- =============================================================== -->
                 <h2 class="d-inline">TOTAL USD : <?php echo $totalusddata['total_usd']; ?></h2>
                 <br><br>
                 <?php
                 $packingstockinfobankstmt = $pdo->prepare("SELECT * FROM bankdetail WHERE infoid='$infoid'");
                 $packingstockinfobankstmt->execute();
                 $packingstockinfobankdata = $packingstockinfobankstmt->fetch(PDO::FETCH_ASSOC);
                  ?>
                 <form action="" method="post">
                   <table>
                     <tr>
                       <td><p class="h5">Bank Details</p></td>
                       <td></td>
                     </tr>
                     <tr>
                       <td><p>Company Name : </p></td>
                       <td class="inputs"><p><input type="text" name="company_name" class="form-control inpv2" placeholder="Enter Company Name" value="<?php if(!empty($packingstockinfobankdata)){echo $packingstockinfobankdata['company_name'];} ?>"></p></td>
                       <td style="visibility:hidden;">--------------</td>
                       <td class="datas"><p><?php if(!empty($packingstockinfobankdata['company_name'])){echo $packingstockinfobankdata['company_name'];}; ?></p></td>
                     </tr>
                     <tr>
                       <td><p>Company Address : </p></td>
                       <td class="inputs"><p><input type="text" name="company_address" class="form-control inpv2" placeholder="Enter Company Address" value="<?php if(!empty($packingstockinfobankdata)){echo $packingstockinfobankdata['company_address'];} ?>"></p></td>
                       <td style="visibility:hidden;">--------------</td>
                       <td class="datas"><p><?php if(!empty($packingstockinfobankdata['company_address'])){echo $packingstockinfobankdata['company_address'];}; ?></p></td>
                     </tr>
                     <tr>
                       <td><p>USD A/C : </p></td>
                       <td class="inputs"><p><input type="text" name="usd" class="form-control inpv2" placeholder="Enter USD A/C" value="<?php if(!empty($packingstockinfobankdata)){echo $packingstockinfobankdata['usd'];} ?>"></p></td>
                       <td style="visibility:hidden;">--------------</td>
                       <td class="datas"><p><?php if(!empty($packingstockinfobankdata['usd'])){echo $packingstockinfobankdata['usd'];}; ?></p></td>
                     </tr>
                     <tr>
                       <td><p>Account Type : </p></td>
                       <td class="inputs"><p><input type="text" name="account_type" class="form-control inpv2" placeholder="Enter Account Type" value="<?php if(!empty($packingstockinfobankdata)){echo $packingstockinfobankdata['account_type'];} ?>"></p></td>
                       <td style="visibility:hidden;">--------------</td>
                       <td class="datas"><p><?php if(!empty($packingstockinfobankdata['account_type'])){echo $packingstockinfobankdata['account_type'];}; ?></p></td>
                     </tr>
                     <tr>
                       <td><p>Bank Name : </p></td>
                       <td class="inputs"><p><input type="text" name="bank_name" class="form-control inpv2" placeholder="Enter Bank Name" value="<?php if(!empty($packingstockinfobankdata)){echo $packingstockinfobankdata['bank_name'];} ?>"></p></td>
                       <td style="visibility:hidden;">--------------</td>
                       <td class="datas"><p><?php if(!empty($packingstockinfobankdata['bank_name'])){echo $packingstockinfobankdata['bank_name'];}; ?></p></td>
                     </tr>
                     <tr>
                       <td><p>Swift Code : </p></td>
                       <td class="inputs"><p><input type="text" name="swift_code" class="form-control inpv2" placeholder="Enter Swift Code" value="<?php if(!empty($packingstockinfobankdata)){echo $packingstockinfobankdata['swift_code'];} ?>"></p></td>
                       <td style="visibility:hidden;">--------------</td>
                       <td class="datas"><p><?php if(!empty($packingstockinfobankdata['swift_code'])){echo $packingstockinfobankdata['swift_code'];}; ?></p></td>
                     </tr>
                     <tr>
                       <td><p>Bank Branch Address : </p></td>
                       <td class="inputs"><p><input type="text" name="bank_branch_address" class="form-control inpv2" placeholder="Enter Bank Branch Address" value="<?php if(!empty($packingstockinfobankdata)){echo $packingstockinfobankdata['bank_branch_address'];} ?>"></p></td>
                       <td style="visibility:hidden;">--------------</td>
                       <td class="datas"><p><?php if(!empty($packingstockinfobankdata['bank_branch_address'])){echo $packingstockinfobankdata['bank_branch_address'];}; ?></p></td>
                     </tr>
                   </table>
                   <button type="submit" class="inputs btn btn-success text-light" name="bankingbtn">Done</button>
                 </form>
               </div>
             <!-- =============================================================== -->
             <div class="modal fade" id="add">
               <div class="modal-dialog" role="document">
                 <div class="modal-content" style="width: 650px !important; margin-top:70px !important;">
                   <div class="modal-header bg-info text-light">
                     <h1 class="modal-title fs-5">Add Packing Stock</h1>
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
       if($_SESSION['tabs'] == 'actualinvoice'){
         echo '
         $("#actualinvoice").hide();
         $("#actualinvoiceback").show();
         $("#export").show();
         $(".actualinvoicetable").show();
         $("#addpackingstockbtn").hide();
         $("#packingstocktable").hide();
         $("#itext").show();
         $("#pltext").hide();
         $("#back").hide();
         ';
       }elseif($_SESSION['tabs'] == 'actualpackinglist'){
         echo '
         $("#actualinvoice").show();
         $("#actualinvoiceback").hide();
         $(".actualinvoicetable").hide();
         $("#addpackingstockbtn").show();
         $("#packingstocktable").show();
         $("#itext").hide();
         $("#pltext").show();
         $("#export").hide();
         $("#back").show();
         ';
       }
       ?>
       $('.datas').on('click', ()=>{
        $('.inputs').show();
        $('.datas').hide();
       });
    });
    </script>
    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
