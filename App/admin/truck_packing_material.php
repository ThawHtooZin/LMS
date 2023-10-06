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

    if(isset($_POST['addmaterial'])){
      $date = $_POST['date'];
      $remark = $_POST['remark'];
      $ice_amount = $_POST['ice_amount'];
      $tape_amount = $_POST['tape_amount'];
      $foambox_amount = $_POST['foambox_amount'];
      $plastic_amount = $_POST['plastic_amount'];
      $miscellous = $_POST['miscellous'];
      $form10kg = $_POST['form10kg'];
      $invoice_no = $_GET['invoice_no'];

      $query->addmaterial($date, $remark, $ice_amount, $tape_amount, $foambox_amount, $plastic_amount, $miscellous, $form10kg, $invoice_no);
    }

     ?>
    <div class="row">
      <div class="col-2" id="sidebar">
        <?php
        include 'sidebar.php';
        ?>
      </div>
      <div class="col-10" id="content">
        <div class="card">
          <div class="card-header bg-success">
            <button type="button" class="btn btn-default btn-sm" id="menu">
              <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
              </svg>
            </button>
            <b class="text-light">Truck Packing Material Charges</b>
            <a href="truck_packing_stock.php" class="btn btn-danger btn-sm ms-2 float-end">Back</a>
            <button type="button" name="button" data-bs-toggle="modal" data-bs-target="#addmodal" class="btn btn-info btn-sm float-end text-light">Add</button>
          </div>
          <div class="card-body">
            <div class="row">
              <div class="col-8">
              </div>
              <?php $invoice_no = $_GET['invoice_no'];
              $infostmt = $pdo->prepare("SELECT * FROM truckpackingliststock WHERE invoice_no='$invoice_no'");
              $infostmt->execute();
              $infodata = $infostmt->fetch(PDO::FETCH_ASSOC); ?>
              <div class="col-4" style="font-weight:bold;">
                <span>Date _ <?php echo date('d-m-Y', strtotime($infodata['date'])); ?></span>
                <br>
                <span>Invoice No _ <?php echo $invoice_no; ?></span>
              </div>
            </div>
            <table class="table table-striped table-hover table-bordered mt-2 text-center">
              <tr>
                <th rowspan="2" style="padding-top:30px;">No</th>
                <th rowspan="2" style="padding-top:30px; padding-left: 40px; padding-right:40px;">Date</th>
                <th colspan="2">Other</th>
                <th colspan="3">Packing Material</th>
                <th rowspan="2" style="padding-top:30px;">Total Charges</th>
                <th rowspan="2" style="padding-top:30px;">Total Viss</th>
                <th rowspan="2" style="padding-top:30px;">Form10 Kg</th>
                <th rowspan="2" style="padding-top:30px;">Total Per Kg</th>
                <th rowspan="2" style="padding-top:30px;">Remark</th>
              </tr>
              <tr>
                <th>Ice</th>
                <th>Miscellous</th>
                <th>Tape</th>
                <th>Foam Box</th>
                <th>Plastic</th>
              </tr>
              <?php
              $stmt = $pdo->prepare("SELECT * FROM truckpackingmaterial WHERE invoice_no='$invoice_no'");
              $stmt->execute();
              $datas = $stmt->fetchall();
              $i = 1;
              foreach ($datas as $data) {
               ?>
              <tr>
                <td><?php echo $i; ?></td>
                <td><?php echo date('d-m-Y', strtotime($data['date'])); ?></td>
                <td><?php echo $data['ice']; ?></td>
                <td><?php echo $data['miscellous']; ?></td>
                <td><?php echo $data['tape']; ?></td>
                <td><?php echo $data['foam_box']; ?></td>
                <td><?php echo $data['plastic']; ?></td>
                <td><?php echo $data['total_charges']; ?></td>
                <td><?php echo $data['total_viss']; ?></td>
                <td><?php echo $data['form10kg']; ?></td>
                <td></td>
                <td><?php echo $data['remark']; ?></td>
              </tr>
              <tr style="font-weight:bold;">
                <td></td>
                <td>Cost Per Kg</td>
                <td><?php echo round($data['ice'] / $data['form10kg'], 2); ?></td>
                <td><?php echo round($data['miscellous'] / $data['form10kg'], 2); ?></td>
                <td><?php echo round($data['tape'] / $data['form10kg'], 2); ?></td>
                <td><?php echo round($data['foam_box'] / $data['form10kg'], 2); ?></td>
                <td><?php echo round($data['plastic'] / $data['form10kg'], 2); ?></td>
                <td></td>
                <td></td>
                <td><?php echo $data['form10kg']; ?></td>
                <td><?php echo $data['costperkg']; ?></td>
                <td></td>
              </tr>
              <?php
              $i++;
              }
               ?>
            </table>
          </div>
        </div>
      </div>
    </div>
    <div class="modal fade" id="addmodal">
      <div class="modal-dialog" role="document">
        <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
          <div class="modal-header bg-info text-light">
            <h1 class="modal-title fs-5">Add Packing Stock</h1>
            <form action="" method="post">
            <div class="row">
              <div class="col-2">

              </div>
              <div class="col-4">
                <button type="submit" class="btn btn-success" name="addmaterial">Add</button>
              </div>
              <div class="col-6">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
          <div class="modal-body">
              <input type="hidden" name="kgperboxid" value="<?php echo $packingstockinfodata['id']; ?>">
            <div class="modal-body">
              <div class="row">
                <div class="col">
                  <label>Date</label>
                  <input type="date" name="date" class="form-control inpv2 mb-2">
                </div>
                <div class="col">
                  <label>Remark</label>
                  <input type="text" name="remark" class="form-control inpv2 mb-2">
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <label>Ice Charges</label>
                  <input type="number" name="ice_amount" class="form-control inpv2 mb-2">
                </div>
                <div class="col">
                  <label>Tape Charges</label>
                  <input type="number" name="tape_amount" class="form-control inpv2 mb-2">
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <label>Foam Box Charges</label>
                  <input type="number" name="foambox_amount" class="form-control inpv2 mb-2">
                </div>
                <div class="col">
                  <label>Plastic Charges</label>
                  <input type="number" name="plastic_amount" class="form-control inpv2 mb-2">
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <label>Miscellous</label>
                  <input type="number" name="miscellous" class="form-control inpv2 mb-2">
                </div>
                <div class="col">
                  <label>Form10kg</label>
                  <input type="text" name="form10kg" class="form-control inpv2 mb-2">
                </div>
              </div>
            </div>
          </div>
          </form>
        </div>
      </div>
    </div>
    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
