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
  if (isset($_POST['add'])) {
    $date = $_POST['date'];
    $invoice_no = $_POST['invoice_no'];
    $truck_no = $_POST['truck_no'];

    $query->addtruckpackinglist($date, $invoice_no, $truck_no);
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
        <div class="card-header bg-info text-light">
          <h4 class="d-inline">Truck Actual Packing List</h4>
          <button type="button" class="btn btn-success float-end text-light" data-bs-toggle="modal" data-bs-target="#addpacking">Add Packing</button>
        </div>
        <div class="card-body">
          <table class="table table-striped table-hover table-hover">
            <tr>
              <th>Date</th>
              <th>Invoice No</th>
              <th>Truck No</th>
              <th>Action</th>
            </tr>
              <?php
              $packingdatas = $query->selectall("truckpackingliststock");
              foreach ($packingdatas  as $packingdata) {
                ?>
                <tr>
                <td><?php echo date('d-m-Y', strtotime($packingdata['date'])); ?></td>
                <td><?php echo $packingdata['invoice_no']; ?></td>
                <td><?php echo $packingdata['truck_no']; ?></td>
                <td>
                  <a href="truck_packing_stock_info.php?invoice_no=<?php echo $packingdata['invoice_no']; ?>" class="btn btn-info btn-sm text-light">Info</a>
                  <a href="invoice_costing.php?infoid=<?php echo $packingdata['invoice_no']; ?>" class="btn btn-warning btn-sm text-light"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list-check" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3.854 2.146a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 3.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 7.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 0 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0z"/></svg></a>
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
              <form action="truck_packing_stock.php" method="post">
              <div class="modal-body">
                  <div class="row">
                    <div class="col">
                      <label>Date</label>
                      <input type="date" name="date" class="form-control inpv2 mb-2">
                    </div>
                    <div class="col">
                      <label>Invoice No</label>
                      <input type="text" name="invoice_no" class="form-control inpv2 mb-2">
                    </div>
                  </div>
                  <div class="row">
                    <div class="col">
                      <label>Truck No</label>
                      <input type="text" name="truck_no" class="form-control inpv2 mb-2">
                    </div>
                    <div class="col mt-4">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                      <button type="submit" class="btn btn-success" name="add">Add</button>
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
  <?php
  $bootstrap->javascript();
  ?>
</body>
</html>
