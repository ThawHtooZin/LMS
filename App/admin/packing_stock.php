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
  <style media="screen">
  .tooltip1{
    position:relative;
    display: inline-block;
  }
  .tooltip1 .tooltiptext1{
    visibility: hidden !important;
    font-size: 10.5px;
    width: 90px;
    background-color: black;
    color: #fff;
    text-align: center;
    padding: 5px 0;
    border-radius: 6px;
    position: absolute;
    z-index: 1;
    margin-top: -28px;
    margin-left: -60px;
  }
  .tooltip1:hover .tooltiptext1{
    visibility: visible !important;
  }
  .tooltip2{
    position:relative;
    display: inline-block;
  }
  .tooltip2 .tooltiptext2{
    visibility: hidden !important;
    font-size: 10.5px;
    width: 90px;
    background-color: black;
    color: #fff;
    text-align: center;
    padding: 5px 0;
    border-radius: 6px;
    position: absolute;
    z-index: 1;
    margin-top: -28px;
    margin-left: -60px;
  }
  .tooltip2:hover .tooltiptext2{
    visibility: visible !important;
  }
  </style>
  <body>
    <?php
    if (isset($_POST['add'])) {
      $date = $_POST['date'];
      $customer_id = $_POST['customer_id'];
      $country = $_POST['country'];
      $invoiceno = $_POST['invoiceno'];
      $containerno = $_POST['containerno'];
      $vessel_no = $_POST['vessel_no'];
      $voyname = $_POST['voyname'];
      $fda = $_POST['fda'];

      $query->addpackinglist($date, $customer_id, $country, $invoiceno, $containerno, $vessel_no, $voyname, $fda);
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
          <div class="card-header bg-info text-light">

            <h4 class="d-inline">Actual Packing List</h4>
            <button type="button" class="btn btn-success float-end text-light" data-bs-toggle="modal" data-bs-target="#addpacking">Add Packing</button>
          </div>
          <div class="card-body">
            <table class="table table-striped table-hover table-hover">
              <tr>
                <th>Date</th>
                <th>Customer Name</th>
                <th>Country</th>
                <th>Invoice No</th>
                <th>Container No</th>
                <th>Action</th>
              </tr>
                <?php
                $packingdatas = $query->selectall("packingliststock");
                foreach ($packingdatas  as $packingdata) {
                  $customer_id = $packingdata['customer_id'];
                  $customerdata = $query->select('acname', $customer_id, 'code_no');
                  ?>
                  <tr>
                  <td><?php echo date('d-m-Y', strtotime($packingdata['date'])); ?></td>
                  <td><?php echo $customerdata['ac_name']; ?></td>
                  <td><?php echo $packingdata['country']; ?></td>
                  <td><?php echo $packingdata['invoiceno']; ?></td>
                  <td><?php echo $packingdata['containerno']; ?></td>
                  <td>
                    <div class="col-4 tooltip1">
                      <a href="packing_stock_info.php?infoid=<?php echo $packingdata['id']; ?>" class="btn btn-info btn-sm text-light"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list-check" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3.854 2.146a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 3.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 7.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 0 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0z"/></svg></a>
                      <span class="tooltiptext1">Packing List Info</span>
                    </div>

                    <div class="col-4 tooltip2">
                      <a href="invoice_costing.php?infoid=<?php echo $packingdata['id']; ?>" class="btn btn-secondary btn-sm text-light"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-dollar" viewBox="0 0 16 16"><path d="M4 10.781c.148 1.667 1.513 2.85 3.591 3.003V15h1.043v-1.216c2.27-.179 3.678-1.438 3.678-3.3 0-1.59-.947-2.51-2.956-3.028l-.722-.187V3.467c1.122.11 1.879.714 2.07 1.616h1.47c-.166-1.6-1.54-2.748-3.54-2.875V1H7.591v1.233c-1.939.23-3.27 1.472-3.27 3.156 0 1.454.966 2.483 2.661 2.917l.61.162v4.031c-1.149-.17-1.94-.8-2.131-1.718H4zm3.391-3.836c-1.043-.263-1.6-.825-1.6-1.616 0-.944.704-1.641 1.8-1.828v3.495l-.2-.05zm1.591 1.872c1.287.323 1.852.859 1.852 1.769 0 1.097-.826 1.828-2.2 1.939V8.73l.348.086z"/></svg></a>
                      <span class="tooltiptext2">Invoice Costing</span>
                    </div>
                  </td>
                </tr>
                  <?php
                }
                 ?>
            </table>
          </div>
          <div class="modal fade" id="addpacking">
            <div class="modal-dialog" role="document">
              <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
                <div class="modal-header bg-info text-light">
                  <h1 class="modal-title fs-5">Addd Packing Data</h1>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  <form action="packing_stock.php" method="post">
                    <div class="row">
                      <div class="col">
                        <label>Date</label>
                        <input type="date" name="date" class="form-control inpv2 mb-2">
                      </div>
                      <div class="col">
                        <label>Customer Name</label>
                        <select class="form-control inpv2 mb-2" name="customer_id">
                          <?php
                            $customerstmt = $pdo->prepare("SELECT * FROM acname WHERE code_no LIKE '3300%'");
                            $customerstmt->execute();
                            $customerdatas = $customerstmt->fetchall();
                           foreach ($customerdatas as $customerdatas) {
                           ?>
                           <option value="<?php echo $customerdatas['code_no']; ?>"><?php echo $customerdatas['ac_name']; ?></option>
                           <?php
                            }
                           ?>
                        </select>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col">
                        <label>Country</label>
                        <input type="text" name="country" class="form-control inpv2 mb-2">
                      </div>
                      <div class="col">
                        <label>Invoice No</label>
                        <input type="text" name="invoiceno" class="form-control inpv2 mb-2">
                      </div>
                    </div>
                    <div class="row">
                      <div class="col">
                        <label>Container No</label>
                        <input type="text" name="containerno" class="form-control inpv2 mb-2">
                      </div>
                      <div class="col">
                        <label>VESSEL Name</label>
                        <input type="text" name="vessel_no" class="form-control inpv2 mb-2">
                      </div>
                    </div>
                    <div class="row">
                      <div class="col">
                        <label>VOY Name</label>
                        <input type="text" name="voyname" class="form-control inpv2 mb-2">
                      </div>
                      <div class="col">
                        <label>FDA</label>
                        <input type="text" name="fda" class="form-control inpv2 mb-2">
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
    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
