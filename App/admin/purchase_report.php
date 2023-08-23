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
    <title>Document</title>
  </head>
  <?php
  $bootstrap->css();
  ?>
  <body>

    <div class="row">
      <div class="col-2">
        <?php
        include 'sidebar.php';
        ?>
      </div>
      <div class="col-10">
        <div class="card">
          <div class="card-header bg-warning text-light">
            <b>Manage Sales Report</b>
          </div>
          <div class="card-body">
            <label>Reports</label>
            <form class="border p-3" action="purchase_report.php" method="post">
              <div class="d-flex">
                <select class="form-control w-50 inpv2" name="reportselect">
                  <option value="">Select Report Method</option>
                  <option value="dbwsearch">Date Between Search</option>
                  <option value="tdysearch">Today Search</option>
                  <option value="suppliersearch">Supplier Search</option>
                  <option value="commoditysearch">Commodity Search</option>
                  <option value="supplierdbwsearch">Supplier & Date Between Search</option>
                  <option value="commoditydbwsearch">Commodity & Date Between Search</option>
                  <option value="vouchersearch">Voucher Search</option>
                </select>
                <button type="submit" name="ok" class="btn btn-primary">Ok</button>
              </div>
              <br>
              <!-- Search Date Between -->
              <?php
              if(isset($_POST['ok']) && $_POST['reportselect'] == 'dbwsearch'){
                ?>
                <label>Date Between Search:</label>
                <br>
                <div class="row">
                  <div class="col-6">
                    <label>Start Date</label>
                    <input type="date" name="dbwstartdate" class="form-control inpv2">
                  </div>
                  <div class="col-1 text-center">
                    To
                  </div>
                  <div class="col-5">
                    <label>End Date</label>
                    <input type="date" name="dbwenddate" class="form-control inpv2">
                  </div>
                </div>
                <button type="submit" name="dbwsearch" class="btn btn-primary btn-sm">Check Today Reports</button>
                <?php
                }
                ?>
                <!-- Today Search -->
                <?php
                if(isset($_POST['ok']) && $_POST['reportselect'] == 'tdysearch'){
                ?>
                <button type="submit" name="tdysearch" class="btn btn-primary">Search Today Report</button>
                <?php
                }
                ?>
                <!-- Supplier Search -->
                <?php
                if(isset($_POST['ok']) && $_POST['reportselect'] == 'suppliersearch'){
                ?>
                <select class="form-control inpv2 mb-2 w-50" name="supplier_id">
                  <?php
                  $supplierdatas = $query->selectall('supplier');
                  foreach ($supplierdatas as $supplierdata) {
                    ?>
                    <option value="<?php echo $supplierdata['supplier_id']; ?>"><?php echo $supplierdata['supplier_name']; ?></option>
                    <?php
                  }
                  ?>
                </select>
                <button type="submit" name="suppliersearch" class="btn btn-primary">Search Supplier Report</button>
                <?php
                }
                ?>
                <!-- Commodity Search -->
                <?php
                if(isset($_POST['ok']) && $_POST['reportselect'] == 'commoditysearch'){
                ?>
                <select class="form-control  mb-2 w-50 inpv2" name="item_id">
                  <?php
                  $itemdatas = $query->selectall('item');
                  foreach ($itemdatas as $itemdata) {
                    ?>
                    <option value="<?php echo $itemdata['item_id']; ?>"><?php echo $itemdata['item_name']; ?></option>
                    <?php
                  }
                  ?>
                </select>
                <button type="submit" name="commoditysearch" class="btn btn-primary">Search Commodity Report</button>
                <?php
                }
                ?>
                <!-- Supplier and Date Between Search -->
                <?php
                if(isset($_POST['ok']) && $_POST['reportselect'] == 'supplierdbwsearch'){
                ?>
                <label>Supplier Name</label>
                <div class="row">
                  <div class="col-4">
                    <select class="form-control inpv2 mb-2" name="supplier_name">
                      <?php
                      $supplierdatas = $query->selectall('supplier');
                      foreach ($supplierdatas as $supplierdata) {
                        ?>
                        <option value="<?php echo $supplierdata['supplier_id']; ?>"><?php echo $supplierdata['supplier_name']; ?></option>
                        <?php
                      }
                      ?>
                    </select>
                  </div>
                  <div class="col-6">
                    <div class="row">
                      <div class="col-6">
                        <input type="date" name="dbwstartdate" class="form-control inpv2">
                        <label>Start Date</label>
                      </div>
                      <div class="col-1 text-center">
                        To
                      </div>
                      <div class="col-5">
                        <input type="date" name="dbwenddate" class="form-control inpv2">
                        <label>End Date</label>
                      </div>
                    </div>
                  </div>
                  <div class="col-2">
                    <button type="submit" name="supplierdbwsearch" class="btn btn-primary">Search Report</button>
                  </div>
                </div>
                <?php
                }
                ?>
                <!-- Commodity and Date Between Search -->
                <?php
                if(isset($_POST['ok']) && $_POST['reportselect'] == 'commoditydbwsearch'){
                ?>
                <label>Commodity</label>
                <div class="row">
                  <div class="col-4">
                    <select class="form-control inpv2 mb-2" name="item_id">
                      <?php
                      $itemdatas = $query->selectall('item');
                      foreach ($itemdatas as $itemdata) {
                        ?>
                        <option value="<?php echo $itemdata['item_id']; ?>"><?php echo $itemdata['item_name']; ?></option>
                        <?php
                      }
                      ?>
                    </select>
                  </div>
                  <div class="col-6">
                    <div class="row">
                      <div class="col-6">
                        <input type="date" name="dbwstartdate" class="form-control inpv2">
                        <label>Start Date</label>
                      </div>
                      <div class="col-1 text-center">
                        To
                      </div>
                      <div class="col-5">
                        <input type="date" name="dbwenddate" class="form-control inpv2">
                        <label>End Date</label>
                      </div>
                    </div>
                  </div>
                  <div class="col-2">
                    <button type="submit" name="commoditydbwsearch" class="btn btn-primary">Search Report</button>
                  </div>
                </div>
                <?php
                }
                ?>
                <!-- Voucher Search -->
                <?php
                if(isset($_POST['ok']) && $_POST['reportselect'] == 'vouchersearch'){
                ?>
                <label>Voucher Search</label>
                <div class="row">
                  <div class="col-4">
                    <select class="form-control inpv2 mb-2 chzn-select" name="voucher_no" data-placeholder="Select Voucher">
                      <?php
                      $voucherdatas = $query->selectdesc('purchase');
                      foreach ($voucherdatas as $voucherdata) {
                        ?>
                        <option value="<?php echo $voucherdata['voucher_no']; ?>"><?php echo $voucherdata['voucher_no']; ?></option>
                        <?php
                      }
                      ?>
                    </select>
                  </div>
                  <div class="col-2">
                    <button type="submit" name="vouchersearch" class="btn btn-primary">Search Report</button>
                  </div>
                </div>
                <?php
                }
                ?>
            </form>

            <!-- Reports Table -->
            <table class="table table-striped table-hover">
              <tr>
                <th>#</th>
                <th>Date</th>
                <th>Voucher No</th>
                <th>TCL (or) Frozen</th>
                <th>Supplier Name</th>
                <th>Commodity</th>
                <th>Size</th>
                <th>Viss</th>
                <th>Kg</th>
                <th>Pcs</th>
                <th>Price</th>
                <th>Amount</th>
              </tr>
              <?php
              // Search Queries
              if(isset($_POST['suppliersearch'])){
                $supplier_id = $_POST['supplier_id'];
                $purchasedatas = $query->search("purchase", 'supplier_id', $supplier_id);
              }elseif(isset($_POST['commoditysearch'])){
                $commodity_id = $_POST['item_id'];
                $purchasedatas = $query->search("purchase", 'commodity', $commodity_id);
              }elseif(isset($_POST['dbwsearch'])){
                $startdate = $_POST['dbwstartdate'];
                $enddate = $_POST['dbwenddate'];
                $purchasedatas = $query->selectdbw('purchase', $startdate, $enddate);
              }elseif(isset($_POST['tdysearch'])){
                $startdate = date('Y-m-d');
                $enddate = date('Y-m-d');
                $purchasedatas = $query->selectdbw('purchase', $startdate, $enddate);
              }elseif(isset($_POST['supplierdbwsearch'])){
                $startdate = $_POST['dbwstartdate'];
                $enddate = $_POST['dbwenddate'];
                $supplier_id = $_POST['supplier_name'];
                $purchasedatas = $query->selectsupplierdbw('purchase', $supplier_id, $startdate, $enddate);
              }elseif(isset($_POST['commoditydbwsearch'])){
                $startdate = $_POST['dbwstartdate'];
                $enddate = $_POST['dbwenddate'];
                $commodity = $_POST['item_id'];
                $purchasedatas = $query->selectcommoditydbw('purchase', $commodity, $startdate, $enddate);
              }elseif(isset($_POST['vouchersearch'])){
                $voucher_no = $_POST['voucher_no'];
                $purchasedatas = $query->selectvoucher("purchase", $voucher_no);
              }else{
                $purchasedatas = $query->selectall("purchase");
              }
              // Total Sums
              if(isset($_POST['suppliersearch'])){
                $supplier_id = $_POST['supplier_id'];
                $total_amount_supplier_search = $query->selectsum('purchase', $supplier_id, 'supplier_id');
              }
              if(isset($_POST['commoditysearch'])){
                $item_id = $_POST['item_id'];
                $total_amount_commodity_search = $query->selectsum('purchase', $item_id, 'commodity');
                $total_amount_commodity_search_viss = $query->selectsumviss('purchase', $item_id, 'commodity');
              }
              if(isset($_POST['dbwsearch'])){
                $startdate = $_POST['dbwstartdate'];
                $enddate = $_POST['dbwenddate'];
                $total_amount_dbw_search = $query->selectsumdbw('purchase', 'amount', 'total_amount', $startdate, $enddate, 'date');
              }
              if(isset($_POST['tdysearch'])){
                $startdate = date('Y-m-d');
                $enddate = date('Y-m-d');
                $total_amount_dbw_search = $query->selectsumdbw('purchase', 'amount', 'total_amount', $startdate, $enddate, 'date');
              }
              if(isset($_POST['supplierdbwsearch'])){
                $startdate = $_POST['dbwstartdate'];
                $enddate = $_POST['dbwenddate'];
                $supplier_id = $_POST['supplier_name'];
                $total_amount_dbw_supplier_search = $query->selectsupplierdbwsum('purchase', 'amount', 'total_amount', $supplier_id, $startdate, $enddate);
              }
              if(isset($_POST['commoditydbwsearch'])){
                $startdate = $_POST['dbwstartdate'];
                $enddate = $_POST['dbwenddate'];
                $commodity = $_POST['item_id'];
                $total_amount_dbw_commodity_search = $query->selectcommoditydbwsum('purchase', 'amount', 'total_amount', $commodity, $startdate, $enddate);
              }
              if(isset($_POST['vouchersearch'])){
                $voucher_no = $_POST['voucher_no'];
                $total_amount_commodity_search = $query->selectvouchersum('purchase', 'amount', 'total_amount', $voucher_no,);
              }
              foreach ($purchasedatas as $purchasedata) {
                $supplierid = $purchasedata['supplier_id'];
                $supplier_name = $query->select('supplier', $supplierid, 'supplier_id');
                $itemid = $purchasedata['commodity'];
                $item_name = $query->select('item', $itemid, 'item_id');
              ?>

              <tr>
                <td><?php echo $purchasedata['no']; ?></td>
                <td><?php echo date('d-m-Y', strtotime($purchasedata['date'])); ?></td>
                <td><?php echo $purchasedata['voucher_no']; ?></td>
                <td><?php echo $purchasedata['tclfrozen']; ?></td>
                <td><?php echo $supplier_name['supplier_name']; ?></td>
                <td><?php echo $item_name['item_name']; ?></td>
                <td><?php echo $purchasedata['size']; ?></td>
                <td><?php echo $purchasedata['viss']; ?></td>
                <td><?php echo $purchasedata['viss'] * 1.634; ?></td>
                <td><?php echo $purchasedata['pcs']; ?></td>
                <td><?php echo $purchasedata['price']; ?></td>
                <td><?php echo $purchasedata['amount']; ?></td>
                </tr>
                <?php
              }
              ?>
              <?php
              if (!empty($total_amount_supplier_search)) {
                ?>
                <tr>
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
                  <td>Total Amount:</td>
                  <td><?php echo $total_amount_supplier_search['total_amount']; ?></td>
                </tr>
                <?php
              }
                ?>

                <?php
                if (!empty($total_amount_commodity_search)) {
                  ?>
                  <tr>
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
                    <td>Total Amount:</td>
                    <td><?php echo $total_amount_commodity_search['total_amount']; ?></td>
                  </tr>
                  <tr>
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
                    <td>Total Viss:</td>
                    <td><?php echo $total_amount_commodity_search_viss['total_viss']; ?></td>
                  </tr>
                  <tr>
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
                    <td>Total Kg:</td>
                    <td><?php echo $total_amount_commodity_search_viss['total_viss'] * 1.634; ?></td>
                  </tr>
                  <?php
                }
                  ?>

                  <?php
                  if (!empty($total_amount_dbw_search)) {
                    ?>
                    <tr>
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
                      <td>Total Amount:</td>
                      <td><?php echo $total_amount_dbw_search['total_amount']; ?></td>
                    </tr>
                    <?php
                  }
                    ?>

                    <?php
                    if (!empty($total_amount_dbw_supplier_search)) {
                      ?>
                      <tr>
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
                        <td>Total Amount:</td>
                        <td><?php echo $total_amount_dbw_supplier_search['total_amount']; ?></td>
                      </tr>
                      <?php
                    }
                      ?>

                      <?php
                      if (!empty($total_amount_dbw_commodity_search)) {
                        ?>
                        <tr>
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
                          <td>Total Amount:</td>
                          <td><?php echo $total_amount_dbw_commodity_search['total_amount']; ?></td>
                        </tr>
                        <?php
                      }
                        ?>

            </table>
          </div>
        </div>
      </div>
    </div>

    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
