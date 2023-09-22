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
    if(isset($_POST['updatetotalcosting'])){
      $total_kg = $_POST['total_kg'];
      $priceperviss = $_POST['priceperviss'];
      $percentage = $_POST['percentage'];
      $packing_charges = $_POST['packing_charges'];
      $ygntomt = $_POST['ygntomt'];
      $mttotechnck = $_POST['mttotechnck'];
      $labour_charges = $_POST['labour_charges'];
      $dollar_rate = $_POST['dollar_rate'];
      $id = $_POST['id'];
      $invoice_no = $_GET['invoice_no'];
      $query->updatetotalcosting($total_kg, $priceperviss, $percentage, $packing_charges, $ygntomt, $mttotechnck, $labour_charges, $dollar_rate, $id, $invoice_no);
    }

    if(isset($_POST['sellingpriceupdatebtn'])){
      $sellingpriceperkg = $_POST['sellingpriceperkg'];
      $updateid = $_POST['sellingpriceupdateid'];
      $commondity_id = $_POST['commondity_id'];
      $size = $_POST['size'];

      $query->updatesellingprice($sellingpriceperkg, $updateid, $commondity_id, $size);
    }

    if(isset($_POST['updatesellingrate'])){
      $selling_rate = $_POST['selling_rate'];
      $id = $_POST['id'];
      $invoice_no = $_GET['invoice_no'];

      $query->updateselingrate($selling_rate, $id, $invoice_no);
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
          <div class="card-header bg-secondary">
            <span class=" text-light" id="tctext" style="font-size:20px; font-weight:bold;">Total Costing</span>
            <span class=" text-light hide" id="ptext" style="font-size:20px; font-weight:bold;">Profit</span>
            <button type="button" class="btn btn-info text-light float-end btn-sm " id="profitbtn">Profit</button>
            <button type="button" class="btn btn-info text-light float-end btn-sm hide" id="totalcostingbtn">Total Costing</button>
            <a href="truck_packing_stock.php" class="btn btn-danger float-end me-2 btn-sm" id="back">Back</a>
          </div>
          <div class="card-body">
            <?php
            $invoice_no = $_GET['invoice_no'];

            $invoice_nostmt = $pdo->prepare("SELECT * FROM truckpackingliststock WHERE invoice_no='$invoice_no'");
            $invoice_nostmt->execute();
            $invoice_nodata = $invoice_nostmt->fetch(PDO::FETCH_ASSOC);
             ?>
             <div class="row text-center">
               <div class="col">
                 Date : <?php echo date('d-m-Y', strtotime($invoice_nodata['date']));  ?>
               </div>
               <div class="col">
                 Invoice No : <?php echo $invoice_nodata['invoice_no'];  ?>
               </div>
             </div>
             <br>
            <div class="total_charges">
              <table class="table table-striped table-hover table-bordered text-center">
                <tr>
                  <!-- <th rowspan="2" style="padding-top:40px;">Date</th> -->
                  <th rowspan="2" style="padding-top:40px;">Commondity</th>
                  <th rowspan="2" style="padding-top:40px;">Size</th>
                  <th>Export</th>
                  <th rowspan="2" style="padding-top:30px;">Price Per Viss</th>
                  <th rowspan="2" style="padding-top:30px;">Price Per Kg</th>
                  <th rowspan="2" style="padding-top:30px;">%</th>
                  <th rowspan="2" style="padding-top:30px;">Packing Charges</th>
                  <th rowspan="2" style="padding-top:30px;">YGN To MT</th>
                  <th rowspan="2" style="padding-top:30px;">Mt To Technck</th>
                  <th rowspan="2" style="padding-top:30px;">Labour Charges</th>
                  <th rowspan="2" style="padding-top:30px;">Packing & Transport</th>
                  <th rowspan="2" style="padding-top:40px;">Total</th>
                  <th rowspan="2" style="padding-top:30px;">Grand Total</th>
                </tr>
                <tr>
                  <th>Total Kg</th>
                </tr>
                <?php
                $stmt = $pdo->prepare("SELECT * FROM trucktotalcosting WHERE invoice_no='$invoice_no'");
                $stmt->execute();
                $datas = $stmt->fetchall();
                foreach ($datas as $data) {
                  $item_id = $data['item_id'];
                  $commonditydata = $query->select('item', $item_id, 'item_id');
                  ?>
                  <tr data-bs-toggle='modal' data-bs-target="#updatetotalcosting<?php echo $data['id']; ?>">
                    <!-- <td><?php// echo date('d-m-Y', strtotime($invoice_nodata['date']));  ?></td> -->
                    <td><?php echo $commonditydata['item_name']; ?></td>
                    <td><?php echo $data['size']; ?></td>
                    <td><?php echo $data['total_kg']; ?></td>
                    <td><?php echo $data['priceperviss']; ?></td>
                    <td><?php echo $data['priceperkg']; ?></td>
                    <td><?php echo $data['percentage']; ?></td>
                    <td><?php echo $data['packing_charges']; ?></td>
                    <td><?php echo $data['ygntomt_charges']; ?></td>
                    <td><?php echo $data['mttotechnck_charges']; ?></td>
                    <td><?php echo $data['labour_charges']; ?></td>
                    <td><?php echo $data['packingandtransport']; ?></td>
                    <td><?php echo $data['total']; ?></td>
                    <td><?php echo $data['grand_total']; ?></td>
                  </tr>
                  <div class="modal fade" id="updatetotalcosting<?php echo $data['id']; ?>">
                    <div class="modal-dialog" role="document">
                      <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
                        <div class="modal-header bg-info text-light">
                          <h1 class="modal-title fs-5">Update Total Costing</h1>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form action="" method="post">
                          <input type="hidden" name="id" value="<?php echo $data['id']; ?>">
                          <div class="modal-body">
                            <div class="row">
                              <div class="col">
                                <label>Total Kg</label>
                                <input type="text" name="total_kg" class="form-control inpv2 mb-2">
                              </div>
                              <div class="col">
                                <label>Price Per Viss</label>
                                <input type="text" name="priceperviss" class="form-control inpv2 mb-2">
                              </div>
                            </div>
                            <div class="row">
                              <div class="col">
                                <label>Percentage</label>
                                <input type="text" name="percentage" class="form-control inpv2 mb-2">
                              </div>
                              <div class="col">
                                <label>Packing Charges</label>
                                <input type="number" name="packing_charges" class="form-control inpv2 mb-2">
                              </div>
                            </div>
                            <div class="row">
                              <div class="col">
                                <label>YGN To Mt Charges</label>
                                <input type="number" name="ygntomt" class="form-control inpv2 mb-2">
                              </div>
                              <div class="col">
                                <label>Mt To Technck</label>
                                <input type="number" name="mttotechnck" class="form-control inpv2 mb-2">
                              </div>
                            </div>
                            <div class="row">
                              <div class="col">
                                <label>Labour Charges</label>
                                <input type="number" name="labour_charges" class="form-control inpv2 mb-2">
                              </div>
                              <div class="col">
                                <label>Dollar Rate</label>
                                <input type="number" name="dollar_rate" class="form-control inpv2 mb-2">
                              </div>
                            </div>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-success" name="updatetotalcosting">Update</button>
                          </div>
                        </form>
                      </div>
                    </div>
                  </div>
                  <?php
                }
                 ?>
              </table>
            </div>
            <div class="profit hide">
              <table class="table table-striped table-hover table-bordered">
                <tr>
                  <th>Grand Total</th>
                  <th>Dollar Rate</th>
                  <th>Costing USD</th>
                  <th>Selling Rate</th>
                  <th>Profit Per Kg</th>
                  <th>Original Cost</th>
                  <th>Sellling Amount</th>
                  <th>Total Profit</th>
                </tr>
                <?php
                $stmt = $pdo->prepare("SELECT * FROM trucktotalcosting WHERE invoice_no='$invoice_no'");
                $stmt->execute();
                $datas = $stmt->fetchall();
                foreach ($datas as $data) {
                  $item_id = $data['item_id'];
                  $commonditydata = $query->select('item', $item_id, 'item_id');
                  ?>
                  <tr data-bs-toggle='modal' data-bs-target="#updateprofit<?php echo $data['id']; ?>">
                    <td><?php echo $data['grand_total']; ?></td>
                    <td><?php echo $data['rate']; ?></td>
                    <td><?php echo round($data['costing_usd'], 2); ?></td>
                    <td><?php echo $data['selling_rate']; ?></td>
                    <td><?php echo $data['profitperkg']; ?></td>
                    <td><?php echo $data['original_cost']; ?></td>
                    <td><?php echo $data['selling_amount']; ?></td>
                    <td><?php echo $data['profit']; ?></td>
                  </tr>
                  <div class="modal fade" id="updateprofit<?php echo $data['id']; ?>">
                    <div class="modal-dialog" role="document">
                      <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
                        <div class="modal-header bg-info text-light">
                          <h1 class="modal-title fs-5">Add Selling Rate</h1>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form action="" method="post">
                          <input type="hidden" name="id" value="<?php echo $data['id']; ?>">
                          <div class="modal-body">
                            <label>Selling Rate</label>
                            <input type="text" name="selling_rate" class="form-control inpv2 mb-2">
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-success" name="updatesellingrate">Update</button>
                          </div>
                      </div>
                    </form>
                    </div>
                  </div>
                  <?php
                }
                 ?>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script type="text/javascript">
    $(document).ready(function(){
      $("#profitbtn").click(function(){
        $("#back").toggle();
        $(".profit").toggle();
        $(".total_charges").toggle();
        $("#profitbtn").toggle();
        $("#totalcostingbtn").toggle();
      });
      $("#totalcostingbtn").click(function(){
        $("#back").toggle();
        $(".total_charges").toggle();
        $(".profit").toggle();
        $("#profitbtn").toggle();
        $("#totalcostingbtn").toggle();
      });
    });
    </script>
    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
