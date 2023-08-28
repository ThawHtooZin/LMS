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
    .hide{
      display:none;
    }
    .color{
      border-radius: 5px;
      background-color:grey;
      color:white !important;
    }
  </style>
  <body>
    <?php
    if(isset($_POST['add'])){
      $indate = $_POST['indate'];
      $outdate = $_POST['outdate'];
      $mc = $_POST['mc'];
      $kg = $_POST['kg'];
      $coldstorerate = $_POST['coldstorerate'];
      $labourrate = $_POST['labourrate'];
      $processingrate = $_POST['processingrate'];
      $query->addcoldstore($indate, $outdate, $mc, $kg, $coldstorerate, $labourrate, $processingrate);
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
          <div class="card-header bg-warning text-light">
            <h4 class="d-inline">Date Range Cold Store Charges</h4>
            <button type="submit" class="btn btn-success float-end" data-bs-toggle="modal" data-bs-target="#newcharges">Add New Charges</button>
          </div>
          <div class="card-body">
            <div class="text-center">
              <button class="pb-2 pt-2 ps-5 pe-5 text-dark coldstorelink" style="text-decoration:none; border:none;" onclick="showcoldstore()">Cold Store Charges</button>
              <button class="pb-2 pt-2 ps-5 pe-5 text-dark labourlink" style="text-decoration:none; border:none;" onclick="showlabour()">Labour Charges</button>
              <button class="pb-2 pt-2 ps-5 pe-5 text-dark processinglink" style="text-decoration:none; border:none;" onclick="showprocessing()">Processing Charges</button>
            </div>
            <hr>
            <div class="coldstorecharges hide">
              <table class="table table-striped table-bordered table-hover">
                <tr>
                  <th class="text-center">Id</th>
                  <th class="text-center">In Date</th>
                  <th class="text-center">Out Date</th>
                  <th class="text-center">Mc</th>
                  <th class="text-center">Total Mc</th>
                  <th class="text-center">Kg</th>
                  <th class="text-center">Total Kg</th>
                  <th class="text-center">Day</th>
                  <th class="text-center">Rate</th>
                  <th class="text-center">Charges</th>
                  <th class="text-center">Total Charges</th>
                </tr>
                <?php
                $datastmt = $pdo->prepare("SELECT * FROM coldstore");
                $datastmt->execute();
                $datas = $datastmt->fetchall();
                foreach ($datas as $data) {
                ?>
                <tr>
                  <td><?php echo $data['id']; ?></td>
                  <td><?php echo $data['indate']; ?></td>
                  <td><?php echo $data['outdate']; ?></td>
                  <td><?php echo $data['mc']; ?></td>
                  <td><?php echo $data['total_mc']; ?></td>
                  <td><?php echo $data['kg']; ?></td>
                  <td><?php echo $data['total_kg']; ?></td>
                  <td><?php echo $data['day']; ?></td>
                  <td><?php echo $data['rate']; ?></td>
                  <td><?php echo $data['charges']; ?></td>
                  <td><?php echo $data['total_charges']; ?></td>
                </tr>
                <?php
                }
                 ?>
              </table>
            </div>
            <div class="labourcharges hide">
              <table class="table table-striped table-bordered table-hover">
                <tr>
                  <th class="text-center">Id</th>
                  <th class="text-center">In Date</th>
                  <th class="text-center">Out Date</th>
                  <th class="text-center">Mc</th>
                  <th class="text-center">Total Mc</th>
                  <th class="text-center">Kg</th>
                  <th class="text-center">Total Kg</th>
                  <th class="text-center">Rate</th>
                  <th class="text-center">Charges</th>
                  <th class="text-center">Total Charges</th>
                </tr>
                <?php
                $labourstmt = $pdo->prepare("SELECT * FROM labour");
                $labourstmt->execute();
                $labour = $labourstmt->fetchall();
                foreach ($labour as $labourdata) {
                ?>
                <tr>
                  <td><?php echo $labourdata['id']; ?></td>
                  <td><?php echo $labourdata['indate']; ?></td>
                  <td><?php echo $labourdata['outdate']; ?></td>
                  <td><?php echo $labourdata['mc']; ?></td>
                  <td><?php echo $labourdata['total_mc']; ?></td>
                  <td><?php echo $labourdata['kg']; ?></td>
                  <td><?php echo $labourdata['total_kg']; ?></td>
                  <td><?php echo $labourdata['rate']; ?></td>
                  <td><?php echo $labourdata['charges']; ?></td>
                  <td><?php echo $labourdata['total_charges']; ?></td>
                </tr>
                <?php
                }
                 ?>
              </table>
            </div>
            <div class="processingcharges hide">
              <table class="table table-striped table-bordered table-hover">
                <tr>
                  <th class="text-center">Id</th>
                  <th class="text-center">In Date</th>
                  <th class="text-center">Out Date</th>
                  <th class="text-center">Mc</th>
                  <th class="text-center">Total Mc</th>
                  <th class="text-center">Kg</th>
                  <th class="text-center">Total Kg</th>
                  <th class="text-center">Rate</th>
                  <th class="text-center">Charges</th>
                  <th class="text-center">Total Charges</th>
                </tr>
                <?php
                $processingstmt = $pdo->prepare("SELECT * FROM processing");
                $processingstmt->execute();
                $processing = $processingstmt->fetchall();
                foreach ($processing as $processingdata) {
                ?>
                <tr>
                  <td><?php echo $processingdata['id']; ?></td>
                  <td><?php echo $processingdata['indate']; ?></td>
                  <td><?php echo $processingdata['outdate']; ?></td>
                  <td><?php echo $processingdata['mc']; ?></td>
                  <td><?php echo $processingdata['total_mc']; ?></td>
                  <td><?php echo $processingdata['kg']; ?></td>
                  <td><?php echo $processingdata['total_kg']; ?></td>
                  <td><?php echo $processingdata['rate']; ?></td>
                  <td><?php echo $processingdata['charges']; ?></td>
                  <td><?php echo $processingdata['total_charges']; ?></td>
                </tr>
                <?php
                }
                 ?>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Add Modal -->
    <div class="modal fade" id="newcharges" aria-labelledby="newcharges">
      <div class="modal-dialog">
        <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
          <div class="modal-header bg-secondary text-light">
            <h1 class="modal-title fs-5">New Charges</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <form action="daterangecharges.php" method="post">
          <div class="modal-body">
            <div class="row" style="margin-bottom: 10px !important;">
              <div class="col">
                <label style="font-weight: bold;">In Date</label>
                <input type="date" name="indate" class="form-control inpv2">
              </div>
              <div class="col">
                <label style="font-weight: bold;">Out Date</label>
                <input type="date" name="outdate" class="form-control inpv2">
              </div>
            </div>
            <div class="row" style="margin-bottom: 10px !important;">
              <div class="col">
                <label style="font-weight: bold;">Mc</label>
                <input type="number" name="mc" class="form-control inpv2">
              </div>
              <div class="col">
                <label style="font-weight: bold;">Kg</label>
                <input type="text" name="kg" class="form-control inpv2">
              </div>
            </div>
            <div class="row" style="margin-bottom: 10px !important;">
              <div class="col">
                <label style="font-weight: bold;">Cold Store Rate</label>
                <input type="text" name="coldstorerate" class="form-control inpv2">
              </div>
              <div class="col">
                <label style="font-weight: bold;">Labour Rate</label>
                <input type="text" name="labourrate" class="form-control inpv2">
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label style="font-weight: bold;">Processing Rate</label>
                <input type="text" name="processingrate" class="form-control inpv2">
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
    <!-- Add Modal -->
    <script type="text/javascript">
    showcoldstore();
    function showcoldstore(){
      document.querySelector(".coldstorelink").classList.add('color');
      document.querySelector(".coldstorecharges").classList.remove('hide');
      document.querySelector(".labourlink").classList.remove('color');
      document.querySelector(".labourcharges").classList.add('hide');
      document.querySelector(".processinglink").classList.remove('color');
      document.querySelector(".processingcharges").classList.add('hide');
    }
    function showlabour(){
      document.querySelector(".coldstorelink").classList.remove('color');
      document.querySelector(".coldstorecharges").classList.add('hide');
      document.querySelector(".labourlink").classList.add('color');
      document.querySelector(".labourcharges").classList.remove('hide');
      document.querySelector(".processinglink").classList.remove('color');
      document.querySelector(".processingcharges").classList.add('hide');
    }
    function showprocessing(){
      document.querySelector(".coldstorelink").classList.remove('color');
      document.querySelector(".coldstorecharges").classList.add('hide');
      document.querySelector(".labourlink").classList.remove('color');
      document.querySelector(".labourcharges").classList.add('hide');
      document.querySelector(".processinglink").classList.add('color');
      document.querySelector(".processingcharges").classList.remove('hide');
    }
    </script>
    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
