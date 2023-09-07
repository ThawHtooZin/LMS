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

    if(isset($_POST['update'])){
      $country = $_POST['country'];
      $updateid = $_POST['id'];

      $query->updatecountry($country, $updateid);
    }

    if(isset($_POST['add'])){
      $date = $_POST['date'];
      $item_id = $_POST['item_id'];
      $country = $_POST['country'];
      $size = $_POST['size'];
      $pcsform10 = $_POST['pcsperf10'];
      $mc = $_POST['mc'];
      $pcs = $_POST['pcs'];
      $looseinkg = $_POST['loose_in_kg'];
      $looseinpcs = $_POST['loose_in_pcs'];
      $looseoutkg = $_POST['loose_out_kg'];
      $looseoutpcs = $_POST['loose_out_pcs'];

      $query->addform10($date, $item_id, $country, $size, $pcsform10, $mc, $pcs, $looseinkg, $looseinpcs, $looseoutkg, $looseoutpcs);
    }

     ?>
    <div class="row">
      <div class="col-2">
        <?php
        include 'sidebar.php';
        ?>
      </div>
      <div class="col-10">
        <div class="card mt-1">
          <div class="card-header bg-warning text-secondary"  style="padding:-10px;">
            <b>Link Mark Limited (F-10)</b>
            <button type="button" class="btn btn-success float-end" data-bs-toggle="modal" data-bs-target="#addmodal">Add Form-10 Data</button>
          </div>
          <div class="card-body">
            <table class="table table-hover table-striped table-bordered">
              <tr class="text-center">
                <th rowspan="2" style="padding-top:25px;">Date</th>
                <th rowspan="2" style="padding-top:25px;">Commondity</th>
                <th rowspan="2" style="padding-top:25px;">Country</th>
                <th rowspan="2" style="padding-top:25px;">Size</th>
                <th colspan="4">Production</th>
                <th colspan="2">Loose In</th>
                <th colspan="2">Loose Out</th>
                <th>Total</th>
                <th rowspan="2" style="padding-top:25px;">%</th>
              </tr>
              <tr class="text-center">
                <th>PCS/Form-10</th>
                <th>MC</th>
                <th>KG</th>
                <th>Pcs</th>
                <th>Kg</th>
                <th>Pcs</th>
                <th>Kg</th>
                <th>Pcs</th>
                <th>Kg</th>
              </tr>
              <?php
              $form10datas = $query->selectall('form10stock');
              foreach ($form10datas as $form10data) {
                $item_id = $form10data['item_id'];
                $commonditydata = $query->select('item', $item_id, 'item_id');
               ?>
              <tr>
                <td><?php echo $form10data['date']; ?></td>
                <td><?php echo $commonditydata['item_name']; ?></td>
                <td><?php echo $form10data['country']; ?></td>
                <td><?php echo $form10data['size']; ?></td>
                <td><?php echo $form10data['pcsform10']; ?></td>
                <td><?php echo $form10data['mc']; ?></td>
                <td><?php echo $form10data['kg']; ?></td>
                <td><?php echo $form10data['pcs']; ?></td>
                <td><?php echo $form10data['looseinkg']; ?></td>
                <td><?php echo $form10data['looseinpcs']; ?></td>
                <td><?php echo $form10data['looseoutkg']; ?></td>
                <td><?php echo $form10data['looseoutpcs']; ?></td>
                <td><?php echo $form10data['total_kg']; ?></td>
                <td><?php echo $form10data['percentage']; ?></td>
              </tr>
              <?php
              }
               ?>
              <!-- <div class="modal fade" id="updatemodal<?php // echo $form7data['id']; ?>">
                <div class="modal-dialog" role="document">
                  <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
                    <div class="modal-header bg-warning text-light">
                      <h1 class="modal-title fs-5">Update Country</h1>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <form action="form_7.php" method="post">
                        <input type="hidden" name="id" value="<?php // echo $form7data['id']; ?>">
                      <div class="modal-body">
                        <label>Country</label>
                        <input type="text" name="country" class="form-control inpv2 mt-1">
                      </div>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                      <button type="submit" class="btn btn-warning" name="update">Update</button>
                    </div>
                  </form>
                  </div>
                </div>
              </div> -->
            </table>
          </div>
        </div>
      </div>
    </div>
    <div class="modal fade" id="addmodal">
      <div class="modal-dialog" role="document">
        <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
          <div class="modal-header bg-warning text-light">
            <h1 class="modal-title fs-5">Add Form 10 Data</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form action="form_10.php" method="post">
            <div class="modal-body">
              <label>Date</label>
              <input type="date" name="date" class="form-control inpv2 mb-2">
              <div class="row">
                <div class="col">
                  <label>Commondity</label>
                  <select class="form-control inpv2 mb-2" name="item_id">
                    <?php
                    $form7commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM form7stock");
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
                  <label>Country</label>
                  <input type="text" name="country" class="form-control inpv2 mb-2">
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <label>Size</label>
                  <input type="text" name="size" class="form-control inpv2 mb-2">
                </div>
                <div class="col">
                  <label>Pcs Per Form-10</label>
                  <input type="text" name="pcsperf10" class="form-control inpv2 mb-2">
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <label>Mc</label>
                  <input type="number" name="mc" class="form-control inpv2 mb-2">
                </div>
                <div class="col">
                  <label>Pcs</label>
                  <input type="text" name="pcs" class="form-control inpv2 mb-2">
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <label>Loose In Kg</label>
                  <input type="text" name="loose_in_kg" class="form-control inpv2 mb-2">
                </div>
                <div class="col">
                  <label>Loose In Pcs</label>
                  <input type="number" name="loose_in_pcs" class="form-control inpv2 mb-2">
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <label>Loose Out Kg</label>
                  <input type="text" name="loose_out_kg" class="form-control inpv2 mb-2">
                </div>
                <div class="col">
                  <label>Loose Out Pcs</label>
                  <input type="number" name="loose_out_pcs" class="form-control inpv2 mb-2">
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
    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
