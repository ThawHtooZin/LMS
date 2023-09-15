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
      $type = $_POST['type'];
      $size = $_POST['size'];
      $mc = $_POST['mc'];
      $kg = $_POST['kg'];
      $pcs = $_POST['pcs'];
      $looseinkg = $_POST['loose_in_kg'];
      $looseinpcs = $_POST['loose_in_pcs'];
      $looseoutkg = $_POST['loose_out_kg'];
      $looseoutpcs = $_POST['loose_out_pcs'];

      $query->addform10($date, $item_id, $country, $type, $size, $mc, $kg, $pcs, $looseinkg, $looseinpcs, $looseoutkg, $looseoutpcs);
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
              <form action="" method="post">
              <b>Link Mark Limited (F-10)</b>
              <button type="button" class="btn btn-success float-end" data-bs-toggle="modal" data-bs-target="#addmodal">Add Form-10 Data</button>
              <button type="submit" name="searchbtn2" class="btn btn-secondary float-end me-2">View</button>
              <select name="type" class="form-control inpv2 w-25 d-inline float-end me-2">
                <option value="">Select Type</option>
                <option value="frozen">Frozen</option>
                <option value="tcl">TCL</option>
              </select>
            </form>
            </div>
          <div class="card-body">
            <table class="table table-hover table-striped table-bordered">
              <tr class="text-center">
                <th rowspan="2" style="padding-top:25px;">Date</th>
                <th rowspan="2" style="padding-top:25px;">Commondity</th>
                <th rowspan="2" style="padding-top:25px;">Country</th>
                <th rowspan="2" style="padding-top:25px;">Type</th>
                <th rowspan="2" style="padding-top:25px;">Size</th>
                <th colspan="4">Production</th>
                <th colspan="2">Loose In</th>
                <th colspan="2">Loose Out</th>
                <th>Total</th>
                <th rowspan="2" style="padding-top:25px;">Percentage</th>
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
              $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT item_id) FROM form10stock");
              $commonditycountstmt->execute();
              $commonditycountdatas = $commonditycountstmt->fetchColumn();
              for ($i=0; $i < $commonditycountdatas; $i++) {
                $commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM form10stock");
                $commonditystmt->execute();
                $commonditydata = $commonditystmt->fetchall();
                $commondity_id = $commonditydata[$i]['item_id'];
              if(isset($_POST['searchbtn2']) && !empty($_POST['type'])){
                $type = $_POST['type'];
                $stmt = $pdo->prepare("SELECT * FROM form10stock WHERE type='$type'");
                $stmt->execute();
                $datas = $stmt->fetchall();
              }else{
                $stmt = $pdo->prepare("SELECT * FROM form10stock WHERE item_id='$commondity_id'");
                $stmt->execute();
                $datas = $stmt->fetchall();
              }
              foreach ($datas as $form10data) {
                $item_id = $form10data['item_id'];
                $commonditydata = $query->select('item', $item_id, 'item_id');
               ?>
              <tr>
                <td><?php echo $form10data['date']; ?></td>
                <td><?php echo $commonditydata['item_name']; ?></td>
                <td><?php echo $form10data['country']; ?></td>
                <td><?php echo $form10data['type']; ?></td>
                <td><?php echo $form10data['size']; ?></td>
                <td><?php echo $form10data['pcsform10']; ?></td>
                <td><?php echo $form10data['mc']; ?></td>
                <td><?php echo $form10data['kg']; ?></td>
                <td><?php echo $form10data['pcs']; ?></td>
                <td><?php echo $form10data['looseinkg']; ?></td>
                <td><?php echo $form10data['looseinpcs']; ?></td>
                <td><?php echo $form10data['looseoutkg']; ?></td>
                <td><?php echo $form10data['looseoutpcs']; ?></td>
                <td><?php echo round($form10data['total_kg'], 2); ?></td>
                <td><?php echo $form10data['percentage']; ?></td>
              </tr>
              <?php
              $country = $form10data['country'];
              }
              if(isset($_POST['searchbtn2']) && !empty($_POST['type'])){
                $type = $_POST['type'];
                $totalf7kgstmt = $pdo->prepare("SELECT SUM(kg) AS total_kg FROM form7stock WHERE type='$type' AND country='$country'");
                $totalf7kgstmt->execute();
                $totalf7kgdata = $totalf7kgstmt->fetch(PDO::FETCH_ASSOC);

                $totalkgstmt = $pdo->prepare("SELECT SUM(total_kg) AS total_kg FROM form10stock WHERE type='$type'");
                $totalkgstmt->execute();
                $totalkgdata = $totalkgstmt->fetch(PDO::FETCH_ASSOC);
                $result1 = round($totalkgdata['total_kg'], 2) - round($totalf7kgdata['total_kg'], 2);
                $result2 = $result1 / round($totalf7kgdata['total_kg'], 2);
                $percentage = $result2 * 100;

                $form10pcsstmt = $pdo->prepare("SELECT SUM(pcsform10) AS total_form10_pcs FROM form10stock WHERE type='$type'");
                $form10pcsstmt->execute();
                $form10pcsdata = $form10pcsstmt->fetch(PDO::FETCH_ASSOC);

                $totalkgstmt = $pdo->prepare("SELECT SUM(total_kg) AS total_kg FROM form10stock WHERE type='$type'");
                $totalkgstmt->execute();
                $totalkgdata = $totalkgstmt->fetch(PDO::FETCH_ASSOC);

                $mcstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM form10stock WHERE type='$type'");
                $mcstmt->execute();
                $mcdata = $mcstmt->fetch(PDO::FETCH_ASSOC);

                $kgstmt = $pdo->prepare("SELECT SUM(kg) AS kg FROM form10stock WHERE type='$type'");
                $kgstmt->execute();
                $kgdata = $kgstmt->fetch(PDO::FETCH_ASSOC);
              }else{
                $totalf7kgstmt = $pdo->prepare("SELECT SUM(kg) AS total_kg FROM form7stock WHERE item_id='$commondity_id' AND country='$country'");
                $totalf7kgstmt->execute();
                $totalf7kgdata = $totalf7kgstmt->fetch(PDO::FETCH_ASSOC);

                $totalkgstmt = $pdo->prepare("SELECT SUM(total_kg) AS total_kg FROM form10stock WHERE item_id='$commondity_id'");
                $totalkgstmt->execute();
                $totalkgdata = $totalkgstmt->fetch(PDO::FETCH_ASSOC);
                $result1 = round($totalkgdata['total_kg'], 2) - round($totalf7kgdata['total_kg'], 2);
                $result2 = $result1 / round($totalf7kgdata['total_kg'], 2);
                $percentage = $result2 * 100;

                $form10pcsstmt = $pdo->prepare("SELECT SUM(pcsform10) AS total_form10_pcs FROM form10stock WHERE item_id='$commondity_id'");
                $form10pcsstmt->execute();
                $form10pcsdata = $form10pcsstmt->fetch(PDO::FETCH_ASSOC);

                $totalkgstmt = $pdo->prepare("SELECT SUM(total_kg) AS total_kg FROM form10stock WHERE item_id='$commondity_id'");
                $totalkgstmt->execute();
                $totalkgdata = $totalkgstmt->fetch(PDO::FETCH_ASSOC);

                $mcstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM form10stock WHERE item_id='$commondity_id'");
                $mcstmt->execute();
                $mcdata = $mcstmt->fetch(PDO::FETCH_ASSOC);

                $kgstmt = $pdo->prepare("SELECT SUM(kg) AS kg FROM form10stock WHERE item_id='$commondity_id'");
                $kgstmt->execute();
                $kgdata = $kgstmt->fetch(PDO::FETCH_ASSOC);
              }
              ?>
              <tr>
                <td></td>
                <td style="font-weight:bold;">Total</td>
                <td></td>
                <td></td>
                <td style="font-weight:bold;"><?php echo round($form10pcsdata['total_form10_pcs'], 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($mcdata['total_mc'], 2); ?></td>
                <td style="font-weight:bold;"><?php echo round($kgdata['kg'], 2); ?></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td style="font-weight:bold;"><?php echo round($totalkgdata['total_kg'], 2); ?></td>
                <td style="font-weight:bold; <?php if(strpos(round($percentage, 2), '-') !== false){echo 'color:red;';} ?>"><?php echo round($percentage, 2). "%"; ?></td>
              </tr>
              <?php
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
          <div class="modal-header bg-warning text-light">
            <h1 class="modal-title fs-5">Add Form 10 Data</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form action="form_10.php" method="post">
            <div class="modal-body">
              <div class="row">
                <div class="col">
                  <label>Date</label>
                  <input type="date" name="date" class="form-control inpv2 mb-2">
                </div>
                <div class="col">
                  <label>Type</label>
                  <select class="form-control inpv2 mb-2" name="type">
                    <option>Select Type</option>
                    <option value="frozen">frozen</option>
                    <option value="tcl">tcl</option>
                  </select>
                </div>
              </div>
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
                  <label>Mc</label>
                  <input type="number" name="mc" class="form-control inpv2 mb-2">
                </div>
              </div>
              <div class="row">
                <div class="col">
                  <label>Kg</label>
                  <input type="text" name="kg" class="form-control inpv2 mb-2">
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
