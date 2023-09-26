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
                  <a href="truck_packing_stock_info.php?invoice_no=<?php echo $packingdata['invoice_no']; ?>" class="btn btn-warning btn-sm text-secondary" data-bs-toggle="tooltip" data-bs-placement="top" title="Packing Lists"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list-columns-reverse" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M0 .5A.5.5 0 0 1 .5 0h2a.5.5 0 0 1 0 1h-2A.5.5 0 0 1 0 .5Zm4 0a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1h-10A.5.5 0 0 1 4 .5Zm-4 2A.5.5 0 0 1 .5 2h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Zm4 0a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5Zm-4 2A.5.5 0 0 1 .5 4h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Zm4 0a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5Zm-4 2A.5.5 0 0 1 .5 6h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Zm4 0a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 0 1h-8a.5.5 0 0 1-.5-.5Zm-4 2A.5.5 0 0 1 .5 8h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Zm4 0a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 0 1h-8a.5.5 0 0 1-.5-.5Zm-4 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Zm4 0a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1h-10a.5.5 0 0 1-.5-.5Zm-4 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Zm4 0a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5Zm-4 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Zm4 0a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5Z"/></svg></a>
                  <a href="truck_packing_material.php?invoice_no=<?php echo $packingdata['invoice_no']; ?>" class="btn btn-primary btn-sm text-light" data-bs-toggle="tooltip" data-bs-placement="top" title="Packing Material"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-seam-fill" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M15.528 2.973a.75.75 0 0 1 .472.696v8.662a.75.75 0 0 1-.472.696l-7.25 2.9a.75.75 0 0 1-.557 0l-7.25-2.9A.75.75 0 0 1 0 12.331V3.669a.75.75 0 0 1 .471-.696L7.443.184l.01-.003.268-.108a.75.75 0 0 1 .558 0l.269.108.01.003 6.97 2.789ZM10.404 2 4.25 4.461 1.846 3.5 1 3.839v.4l6.5 2.6v7.922l.5.2.5-.2V6.84l6.5-2.6v-.4l-.846-.339L8 5.961 5.596 5l6.154-2.461L10.404 2Z"/></svg></a>
                  <a href="truck_total_costing.php?invoice_no=<?php echo $packingdata['invoice_no']; ?>" class="btn btn-secondary btn-sm text-light" data-bs-toggle="tooltip" data-bs-placement="top" title="Total Costing"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-dollar" viewBox="0 0 16 16"><path d="M4 10.781c.148 1.667 1.513 2.85 3.591 3.003V15h1.043v-1.216c2.27-.179 3.678-1.438 3.678-3.3 0-1.59-.947-2.51-2.956-3.028l-.722-.187V3.467c1.122.11 1.879.714 2.07 1.616h1.47c-.166-1.6-1.54-2.748-3.54-2.875V1H7.591v1.233c-1.939.23-3.27 1.472-3.27 3.156 0 1.454.966 2.483 2.661 2.917l.61.162v4.031c-1.149-.17-1.94-.8-2.131-1.718H4zm3.391-3.836c-1.043-.263-1.6-.825-1.6-1.616 0-.944.704-1.641 1.8-1.828v3.495l-.2-.05zm1.591 1.872c1.287.323 1.852.859 1.852 1.769 0 1.097-.826 1.828-2.2 1.939V8.73l.348.086z"/></svg></a>
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
  <script type="text/javascript">
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
  return new bootstrap.Tooltip(tooltipTriggerEl)
  })
  </script>
</body>
</html>
