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
    if(isset($_POST['updateinvoicecosting'])){
      $priceperviss = $_POST['priceperviss'];
      $yield = $_POST['yield'];
      $packing_material = $_POST['packing_material'];
      $ocean_pacific = $_POST['ocean_pacific'];
      $tax = $_POST['tax'];
      $agent = $_POST['agent'];
      $transport = $_POST['transport'];
      $dollar = $_POST['dollar'];
      $updateid = $_POST['updateid'];
      $commondity_id = $_POST['commondity_id'];
      $size = $_POST['size'];


      $query->updateinvoicecosting($priceperviss, $yield, $packing_material, $ocean_pacific, $tax, $agent, $transport, $updateid, $dollar, $commondity_id, $size);
    }

    if(isset($_POST['sellingpriceupdatebtn'])){
      $sellingpriceperkg = $_POST['sellingpriceperkg'];
      $updateid = $_POST['sellingpriceupdateid'];
      $commondity_id = $_POST['commondity_id'];
      $size = $_POST['size'];

      $query->updatesellingprice($sellingpriceperkg, $updateid, $commondity_id, $size);
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
          <div class="card-header bg-secondary">

            <span class=" text-light" id="pltext" style="font-size:20px; font-weight:bold;">Invoice Costing</span>
            <span class=" text-light hide" id="itext" style="font-size:20px; font-weight:bold;">Profit Or Loss</span>
            <button type="button" class="btn btn-info text-light float-end btn-sm " id="invoicecosting">Profit Or Loss</button>
            <button type="button" class="btn btn-primary text-light float-end btn-sm hide" id="invoicecostingbtn">Invoice Costing</button>
            <a href="packing_stock.php" class="btn btn-danger float-end me-2 btn-sm" id="back">Back</a>
          </div>
          <div class="card-body">
            <?php
            $infoid = $_GET['infoid'];

            $infostmt = $pdo->prepare("SELECT * FROM packingliststock WHERE id='$infoid'");
            $infostmt->execute();
            $infodata = $infostmt->fetch(PDO::FETCH_ASSOC);
             ?>
             <div class="row text-center">
               <div class="col">
                 Date : <?php echo date('d-m-Y', strtotime($infodata['date']));  ?>
               </div>
               <div class="col">
                 Invoice No : <?php echo $infodata['invoiceno'];  ?>
               </div>
               <div class="col">
                 CTNR No : <?php echo $infodata['containerno'];  ?>
               </div>
             </div>
             <br>
             <?php
             $infoid = $_GET['infoid'];
             $emptyornot = $query->select('invoice_costing', $infoid, 'infoid');
             if (!empty($emptyornot)) {
               ?>
               <table class="table table-striped table-hover table-bordered actualinvoicetable">
                 <tr class="text-center">
                   <th>No</th>
                   <th>Fish Name</th>
                   <th>Size</th>
                   <th>Kg</th>
                   <th>Price per viss</th>
                   <th>Price per kg</th>
                   <th>Yield</th>
                   <th>Total Price(ks)</th>
                   <th>USD</th>
                   <th>Packing Material</th>
                   <th>Ocean Pacific</th>
                   <th>Tax</th>
                   <th>Agent</th>
                   <th>Transport</th>
                   <th>Total FOD/USD</th>
                   <th>Total Kg Price</th>
                 </tr>
                 <?php
                 $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT commondity_id) FROM invoice_costing WHERE infoid='$infoid'");
                 $commonditycountstmt->execute();
                 $commonditycountdatas = $commonditycountstmt->fetchColumn();
                 for ($i=0; $i < $commonditycountdatas; $i++) {
                   $commonditystmt = $pdo->prepare("SELECT DISTINCT commondity_id FROM invoice_costing WHERE infoid='$infoid'");
                   $commonditystmt->execute();
                   $commonditydata = $commonditystmt->fetchall();
                   $commondity_id = $commonditydata[$i]['commondity_id'];
                   $infoid = $_GET['infoid'];

                   $stmt = $pdo->prepare("SELECT * FROM invoice_costing WHERE commondity_id='$commondity_id' GROUP BY size ORDER BY id DESC");
                   $stmt->execute();
                   $invoicecostingdatas = $stmt->fetchall();

                   foreach ($invoicecostingdatas as $invoicecostingdata) {
                     $item_id = $invoicecostingdata['commondity_id'];
                     $commonditydata = $query->select('item', $item_id, 'item_id');
                     $size = $invoicecostingdata['size'];


                     $totalkgstmt = $pdo->prepare("SELECT SUM(kg) AS totalkg FROM invoice_costing WHERE commondity_id='$commondity_id' AND size='$size'");
                     $totalkgstmt->execute();
                     $totalkgdata = $totalkgstmt->fetch(PDO::FETCH_ASSOC);
                  ?>
                 <tr data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $invoicecostingdata['id']; ?>">
                   <td><?php echo $invoicecostingdata['id']; ?></td>
                   <td><?php echo $commonditydata['item_name']; ?></td>
                   <td><?php echo $invoicecostingdata['size']; ?></td>
                   <td><?php echo $totalkgdata['totalkg']; ?></td>
                   <td><?php if($invoicecostingdata['priceperviss'] != 0){ echo $invoicecostingdata['priceperviss'];}; ?></td>
                   <td><?php if(!empty($invoicecostingdata['priceperkg'])){echo round($invoicecostingdata['priceperkg'], 2);} ?></td>
                   <td><?php if($invoicecostingdata['yield'] != 0){ echo $invoicecostingdata['yield'];}; ?></td>
                   <td><?php if(!empty($invoicecostingdata['total_price'])){echo round($invoicecostingdata['total_price'], 2);} ?></td>
                   <td><?php if(!empty($invoicecostingdata['usd'])){echo round($invoicecostingdata['usd'], 2);} ?></td>
                   <td><?php if($invoicecostingdata['packing_material'] != 0){ echo $invoicecostingdata['packing_material'];}; ?></td>
                   <td><?php if($invoicecostingdata['ocean_pacific'] != 0){ echo $invoicecostingdata['ocean_pacific'];}; ?></td>
                   <td><?php if($invoicecostingdata['tax'] != 0){ echo $invoicecostingdata['tax'];}; ?></td>
                   <td><?php if($invoicecostingdata['agent'] != 0){ echo $invoicecostingdata['agent'];}; ?></td>
                   <td><?php if($invoicecostingdata['transport'] != 0){ echo $invoicecostingdata['transport'];} ?></td>
                   <td><?php if(!empty($invoicecostingdata['total_usd'])){echo round($invoicecostingdata['total_usd'], 2);} ?></td>
                   <td><?php if(!empty($invoicecostingdata['total_kg_price'])){echo round($invoicecostingdata['total_kg_price'], 2);} ?></td>
                 </tr>
                 <div class="modal fade" id="updatemodal<?php echo $invoicecostingdata['id']; ?>">
                   <div class="modal-dialog" role="document">
                     <div class="modal-content" style="width: 450px; !important; margin-left: 100px !important; margin-top:70px !important;">
                       <div class="modal-header bg-info text-light">
                         <h1 class="modal-title fs-5">Update Invoice Costing</h1>
                         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                       </div>
                       <form action="" method="post">
                         <input type="hidden" name="updateid" value="<?php echo $invoicecostingdata['id']; ?>">
                         <input type="hidden" name="commondity_id" value="<?php echo $invoicecostingdata['commondity_id']; ?>">
                         <input type="hidden" name="size" value="<?php echo $invoicecostingdata['size']; ?>">
                       <div class="modal-body">
                         <div class="row">
                           <div class="col">
                             <label>Price Per Viss</label>
                             <input type="text" name="priceperviss" class="form-control inpv2 mb-2" value="<?= $invoicecostingdata['priceperviss']; ?>">
                           </div>
                           <div class="col">
                             <label>Yield</label>
                             <input type="text" name="yield" class="form-control inpv2 mb-2" value="<?= $invoicecostingdata['yield']; ?>">
                           </div>
                         </div>
                         <div class="row">
                           <div class="col">
                             <label>Packing Material</label>
                             <input type="text" name="packing_material" class="form-control inpv2 mb-2" value="<?= $invoicecostingdata['packing_material']; ?>">
                           </div>
                           <div class="col">
                             <label>Ocean Pacific</label>
                             <input type="text" name="ocean_pacific" class="form-control inpv2 mb-2" value="<?php if($invoicecostingdata['ocean_pacific'] != ''){echo $invoicecostingdata['ocean_pacific'];}else{ echo $_SESSION['ocean_pacific']; }; ?>">
                           </div>
                         </div>
                         <div class="row">
                           <div class="col">
                             <label>Tax</label>
                             <input type="text" name="tax" class="form-control inpv2 mb-2" value="<?= $invoicecostingdata['tax']; ?>">
                           </div>
                           <div class="col">
                             <label>Agent</label>
                             <input type="text" name="agent" class="form-control inpv2 mb-2" value="<?php if($invoicecostingdata['agent'] != ''){echo $invoicecostingdata['agent'];}else{ echo $_SESSION['agent']; }; ?>">
                           </div>
                         </div>
                         <div class="row">
                           <div class="col">
                             <label>Transport</label>
                             <input type="text" name="transport" class="form-control inpv2 mb-2" value="<?php if($invoicecostingdata['transport'] != ''){echo $invoicecostingdata['transport'];}else{ echo $_SESSION['transport']; }; ?>">
                           </div>
                           <div class="col">
                             <label>Dollar Rate</label>
                             <input type="text" name="dollar" class="form-control inpv2 mb-2" value="<?php if(!empty($_SESSION['dollar'])){echo $_SESSION['dollar'];}; ?>">
                           </div>
                         </div>
                       </div>
                       <div class="modal-footer">
                         <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                         <button type="submit" class="btn btn-success" name="updateinvoicecosting">Update</button>
                       </div>
                       </form>
                     </div>
                   </div>
                 </div>
              </div>
                 <?php
                 }
                 $item_id = $invoicecostingdata['commondity_id'];
                 $totalkgstmt = $pdo->prepare("SELECT SUM(kg) AS totalkg FROM invoice_costing WHERE infoid='$infoid' AND commondity_id='$item_id'");
                 $totalkgstmt->execute();
                 $totalkgdata = $totalkgstmt->fetch(PDO::FETCH_ASSOC);
                 $totalkgpricestmt = $pdo->prepare("SELECT SUM(total_kg_price) AS totalkgprice FROM invoice_costing WHERE infoid='$infoid' AND commondity_id='$item_id'");
                 $totalkgpricestmt->execute();
                 $totalkgpricedata = $totalkgpricestmt->fetch(PDO::FETCH_ASSOC);
                 ?>
                 <tr>
                 <td></td>
                 <td style="font-weight:bold;">Total</td>
                 <td></td>
                 <td style="font-weight:bold;"><?php echo $totalkgdata['totalkg']; ?></td>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td style="font-weight:bold;"><?php if(round(floatval($totalkgpricedata['totalkgprice']), 2) != 0){ echo round(floatval($totalkgpricedata['totalkgprice']), 2);}; ?></td>
                 </tr>
                 <?php
               }
                  ?>
               </table>
               <!-- =============================================================== -->
               <table class="table table-striped table-hover table-bordered actualinvoicetable hide">
                 <tr>
                   <th>Fish Name</th>
                   <th>Size</th>
                   <th>Kg</th>
                   <th>Total FOD/USD</th>
                   <th>Selling Price Per Kg</th>
                   <th>Total Kg Price</th>
                   <th>Total Selling Price</th>
                   <th>Profit/Loss Per Kg</th>
                   <th>Profit/Loss Amount</th>
                 </tr>
                 <?php
                 $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT commondity_id) FROM invoice_costing WHERE infoid='$infoid'");
                 $commonditycountstmt->execute();
                 $commonditycountdatas = $commonditycountstmt->fetchColumn();
                 for ($i=0; $i < $commonditycountdatas; $i++) {
                   $commonditystmt = $pdo->prepare("SELECT DISTINCT commondity_id FROM invoice_costing WHERE infoid='$infoid'");
                   $commonditystmt->execute();
                   $commonditydata = $commonditystmt->fetchall();
                   $commondity_id = $commonditydata[$i]['commondity_id'];
                   $infoid = $_GET['infoid'];

                   $stmt = $pdo->prepare("SELECT * FROM invoice_costing WHERE commondity_id='$commondity_id' AND infoid='$infoid' GROUP BY size ORDER BY id DESC");
                   $stmt->execute();
                   $invoicecostingdatas = $stmt->fetchall();
                   foreach ($invoicecostingdatas as $invoicecostingdata) {
                     $item_id = $invoicecostingdata['commondity_id'];
                     $commonditydata = $query->select('item', $item_id, 'item_id');

                     $size = $invoicecostingdata['size'];


                     $totalkgstmt = $pdo->prepare("SELECT SUM(kg) AS totalkg FROM invoice_costing WHERE commondity_id='$commondity_id' AND size='$size'");
                     $totalkgstmt->execute();
                     $totalkgdata = $totalkgstmt->fetch(PDO::FETCH_ASSOC);
                  ?>
                 <tr data-bs-toggle="modal" data-bs-target="#updatemodal2<?php echo $invoicecostingdata['id']; ?>">
                   <td><?php echo $commonditydata['item_name']; ?></td>
                   <td><?php echo $invoicecostingdata['size']; ?></td>
                   <td><?php echo $totalkgdata['totalkg']; ?></td>
                   <td><?php if(round(floatval($invoicecostingdata['total_usd']), 2) != 0){ echo round(floatval($invoicecostingdata['total_usd']), 2);}; ?></td>
                   <td><?php if($invoicecostingdata['sellingpriceperkg'] != 0){ echo $invoicecostingdata['sellingpriceperkg'];}; ?></td>
                   <td><?php if(!empty($invoicecostingdata['total_kg_price'])){echo round($invoicecostingdata['total_kg_price'], 2);} ?></td>
                   <td><?php if($invoicecostingdata['total_selling_price'] != 0){ echo $invoicecostingdata['total_selling_price'];}; ?></td>
                   <td><?php if(round(floatval($invoicecostingdata['profitorlossperkg']),2) != 0){echo round(floatval($invoicecostingdata['profitorlossperkg']),2);}; ?></td>
                   <td><?php if(round(floatval($invoicecostingdata['profit_amount']),2) != 0){ echo round(floatval($invoicecostingdata['profit_amount']),2);}; ?></td>
                 </tr>
                 <?php
                 ?>
                 <div class="modal fade" id="updatemodal2<?php echo $invoicecostingdata['id']; ?>">
                   <div class="modal-dialog" role="document">
                     <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
                       <div class="modal-header bg-info text-light">
                         <h1 class="modal-title fs-5">Update Selling Prices</h1>
                         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                       </div>
                       <div class="modal-body">
                         <form action="" method="post">
                           <input type="hidden" name="sellingpriceupdateid" value="<?php echo $invoicecostingdata['id']; ?>">
                           <input type="hidden" name="commondity_id" value="<?php echo $invoicecostingdata['commondity_id']; ?>">
                           <input type="hidden" name="size" value="<?php echo $invoicecostingdata['size']; ?>">
                         <div class="modal-body">
                           <label>Selling Price Per Kg</label>
                           <input type="text" name="sellingpriceperkg" class="form-control inpv2 mb-2 mt-2">
                         </div>
                         <div class="modal-footer">
                           <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                           <button type="submit" class="btn btn-success" name="sellingpriceupdatebtn">Update</button>
                         </div>
                         </div>
                       </div>
                     </form>
                     </div>
                   </div>
                 <?php
                 }
                 $item_id = $invoicecostingdata['commondity_id'];
                 $totalkgpricestmt = $pdo->prepare("SELECT SUM(total_kg_price) AS totalkgprice FROM invoice_costing WHERE infoid='$infoid' AND commondity_id='$item_id'");
                 $totalkgpricestmt->execute();
                 $totalkgpricedata = $totalkgpricestmt->fetch(PDO::FETCH_ASSOC);
                 $totalkgsellingpricestmt = $pdo->prepare("SELECT SUM(total_selling_price) AS total_selling_price FROM invoice_costing WHERE infoid='$infoid' AND commondity_id='$item_id'");
                 $totalkgsellingpricestmt->execute();
                 $totalkgsellingpricedata = $totalkgsellingpricestmt->fetch(PDO::FETCH_ASSOC);
                 $totalkgprofitstmt = $pdo->prepare("SELECT SUM(profit_amount) AS profit_amount FROM invoice_costing WHERE infoid='$infoid' AND commondity_id='$item_id'");
                 $totalkgprofitstmt->execute();
                 $totalkgprofitdata = $totalkgprofitstmt->fetch(PDO::FETCH_ASSOC);
                 ?>
                 <tr>
                 <td></td>
                 <td style="font-weight:bold;">Total</td>
                 <td></td>
                 <td></td>
                 <td></td>
                 <td style="font-weight:bold;"><?php if(round(floatval($totalkgpricedata['totalkgprice']), 2) != 0){ echo round(floatval($totalkgpricedata['totalkgprice']), 2);}; ?></td>
                 <td style="font-weight:bold;"><?php if(round(floatval($totalkgsellingpricedata['total_selling_price']), 2) != 0){ echo round(floatval($totalkgsellingpricedata['total_selling_price']), 2);}; ?></td>
                 <td></td>
                 <td style="font-weight:bold;"><?php if(round(floatval($totalkgprofitdata['profit_amount']), 2) != 0){ echo round(floatval($totalkgprofitdata['profit_amount']), 2);}; ?></td>
                 </tr>
                 <?php
               }
                  ?>
               </table>
               <?php
             }else{
               ?>
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
        </div>
      </div>
    </div>
    <script type="text/javascript">
    $(document).ready(function(){
      $("#invoicecosting").click(function(){
        $(".actualinvoicetable").toggle();
        $("#addpackingstockbtn").toggle();
        $("#itext").toggle();
        $("#pltext").toggle();
        $("#back").toggle();
        $("#invoicecosting").toggle();
        $("#invoicecostingbtn").toggle();
      });
      $("#invoicecostingbtn").click(function(){
        $(".actualinvoicetable").toggle();
        $("#addpackingstockbtn").toggle();
        $("#itext").toggle();
        $("#pltext").toggle();
        $("#back").toggle();
        $("#invoicecostingbtn").toggle();
        $("#invoicecosting").toggle();
      });
    });
    </script>
    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
