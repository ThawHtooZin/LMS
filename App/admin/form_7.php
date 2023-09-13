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
      $pcsperf7 = $_POST['pcsperf7'];
      $updateid = $_POST['id'];

      $query->updatecountry($country, $pcsperf7, $updateid);
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
          <form action="" method="post">
            <div class="card-header bg-warning text-light pt-3"  style="padding:-10px;">
              <b class="h5">Link Mark Limited (F-7)</b>
              <button type="submit" name="searchbtn" class="btn btn-secondary btn-sm float-end">View</button>
              <select name="commondity_id" class="form-control inpv2 w-25 d-inline float-end me-2" style="height:30px !important;">
                <?php
                $commonstmt = $pdo->prepare("SELECT DISTINCT item_id FROM form7stock");
                $commonstmt->execute();
                $commondatas = $commonstmt->fetchAll();

                foreach ($commondatas as $commondata) {
                  $item_id = $commondata['item_id'];
                  $commonditydata = $query->select('item', $item_id, 'item_id');
                  ?>
                  <option value="<?php echo $commondata['item_id']; ?>"><?php echo $commonditydata['item_name']; ?></option>
                  <?php
                }
                 ?>
              </select>
            </div>
          </form>
          <div class="card-body">
            <table class="table table-hover table-striped table-bordered">
              <tr>
                <th>Date</th>
                <th>Fish Name</th>
                <th>Supplier Name</th>
                <th>Country</th>
                <th>Size</th>
                <th>Viss</th>
                <th>Kg</th>
                <th>Pcs per Vr</th>
                <th>Pcs per F-7</th>
              </tr>
              <?php
              if (isset($_POST['searchbtn'])) {
                $commondity_id = $_POST['commondity_id'];
                $stmt = $pdo->prepare("SELECT * FROM form7stock WHERE item_id='$commondity_id'");
                $stmt->execute();
                $datas = $stmt->fetchall();
                foreach ($datas as $form7data) {
                  $item_id = $form7data['item_id'];
                  $commonditydata = $query->select('item', $item_id, 'item_id');
                  $supplier_id = $form7data['supplier_name'];
                  $supplierdata = $query->select('supplier', $supplier_id, 'supplier_id');
                  ?>
                  <tr data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $form7data['id']; ?>">
                    <td><?php echo date('d-m-Y', strtotime($form7data['date'])); ?></td>
                    <td><?php echo $commonditydata['item_name']; ?></td>
                    <td><?php echo $supplierdata['supplier_name']; ?></td>
                    <td><?php echo $form7data['country']; ?></td>
                    <td><?php echo $form7data['size']; ?></td>
                    <td><?php echo $form7data['viss']; ?></td>
                    <td><?php echo round($form7data['kg'], 2); ?></td>
                    <td><?php echo $form7data['pcspervr']; ?></td>
                    <td><?php if(!empty($form7data['pcsperf7'])){ echo $form7data['pcsperf7']; }; ?></td>
                  </tr>
                  <div class="modal fade" id="updatemodal<?php echo $form7data['id']; ?>">
                    <div class="modal-dialog" role="document">
                      <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
                        <div class="modal-header bg-warning text-light">
                          <h1 class="modal-title fs-5">Update Data</h1>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                          <form action="form_7.php" method="post">
                            <input type="hidden" name="id" value="<?php echo $form7data['id']; ?>">
                            <div class="modal-body">
                              <?php
                              $idd = $form7data['id'];
                              $updata = $query->select('form7stock', $idd, 'id');
                              ?>
                              <div class="row">
                                <div class="col">
                                  <label>Country</label>
                                  <input type="text" name="country" class="form-control inpv2 mt-1" value="<?php echo $updata['country']; ?>">
                                </div>
                                <div class="col">
                                  <label>Pcs Per F7</label>
                                  <input type="text" name="pcsperf7" class="form-control inpv2 mt-1" value="<?php echo $updata['pcsperf7']; ?>">
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-warning" name="update">Update</button>
                          </div>
                        </form>
                      </div>
                    </div>
                  </div>
                  <?php
                  $date = $form7data['date'];
                  $item_id = $form7data['item_id'];
                  $country = $form7data['country'];
                }
                $totalvissstmt = $pdo->prepare("SELECT SUM(viss) AS total_viss FROM form7stock WHERE item_id='$item_id' AND country='$country'");
                $totalvissstmt->execute();
                $totalvissdata = $totalvissstmt->fetch(PDO::FETCH_ASSOC);
                print_r($totalvissdata);
                $totalkgstmt = $pdo->prepare("SELECT SUM(kg) AS total_kg FROM form7stock WHERE item_id='$item_id'");
                $totalkgstmt->execute();
                $totalkgdata = $totalkgstmt->fetch(PDO::FETCH_ASSOC);
                $totalpcsstmt = $pdo->prepare("SELECT SUM(pcspervr) AS total_pcs FROM form7stock WHERE item_id='$item_id'");
                $totalpcsstmt->execute();
                $totalpcsdata = $totalpcsstmt->fetch(PDO::FETCH_ASSOC);
                $totalpcsf7stmt = $pdo->prepare("SELECT SUM(pcsperf7) AS total_pcsf7 FROM form7stock WHERE item_id='$item_id'");
                $totalpcsf7stmt->execute();
                $totalpcsf7data = $totalpcsf7stmt->fetch(PDO::FETCH_ASSOC);
                ?>
                <tr>
                  <td></td>
                  <td>Total</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td><?php echo round($totalvissdata['total_viss'], 3); ?></td>
                  <td><?php echo round($totalkgdata['total_kg'], 2); ?></td>
                  <td><?php if(!empty($totalpcsdata['total_pcs'])){ echo $totalpcsdata['total_pcs']; }; ?></td>
                  <td><?php if(!empty($totalpcsf7data['total_pcsf7'])){ echo $totalpcsf7data['total_pcsf7']; }; ?></td>
                </tr>
                <?php
              }else{
                $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT country) FROM form7stock");
                $commonditycountstmt->execute();
                $commonditycountdatas = $commonditycountstmt->fetchColumn();
                for ($i=0; $i < $commonditycountdatas; $i++) {
                  $commonditystmt = $pdo->prepare("SELECT DISTINCT country FROM form7stock");
                  $commonditystmt->execute();
                  $commonditydata = $commonditystmt->fetchall();
                  $commondity_id = $commonditydata[$i]['country'];

                  $countrystmt = $pdo->prepare("SELECT DISTINCT country FROM form7stock");
                  $countrystmt->execute();
                  $countrydata = $countrystmt->fetchall();
                  $country = $countrydata[$i]['country'];

                  $stmt = $pdo->prepare("SELECT * FROM form7stock WHERE country='$country'");
                  $stmt->execute();
                  $datas = $stmt->fetchall();
                  foreach ($datas as $form7data) {
                    $item_id = $form7data['item_id'];
                    $commonditydata = $query->select('item', $item_id, 'item_id');
                    $supplier_id = $form7data['supplier_name'];
                    $supplierdata = $query->select('supplier', $supplier_id, 'supplier_id');
                    ?>
                    <tr data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $form7data['id']; ?>">
                      <td><?php echo date('d-m-Y', strtotime($form7data['date'])); ?></td>
                      <td><?php echo $commonditydata['item_name']; ?></td>
                      <td><?php echo $supplierdata['supplier_name']; ?></td>
                      <td><?php echo $form7data['country']; ?></td>
                      <td><?php echo $form7data['size']; ?></td>
                      <td><?php echo $form7data['viss']; ?></td>
                      <td><?php echo round($form7data['kg'], 2); ?></td>
                      <td><?php echo $form7data['pcspervr']; ?></td>
                      <td><?php if(!empty($form7data['pcsperf7'])){ echo $form7data['pcsperf7']; }; ?></td>
                    </tr>
                    <div class="modal fade" id="updatemodal<?php echo $form7data['id']; ?>">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
                          <div class="modal-header bg-warning text-light">
                            <h1 class="modal-title fs-5">Update Data</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                            <form action="form_7.php" method="post">
                              <input type="hidden" name="id" value="<?php echo $form7data['id']; ?>">
                              <div class="modal-body">
                                <?php
                                $idd = $form7data['id'];
                                $updata = $query->select('form7stock', $idd, 'id');
                                ?>
                                <div class="row">
                                  <div class="col">
                                    <label>Country</label>
                                    <input type="text" name="country" class="form-control inpv2 mt-1" value="<?php echo $updata['country']; ?>">
                                  </div>
                                  <div class="col">
                                    <label>Pcs Per F7</label>
                                    <input type="text" name="pcsperf7" class="form-control inpv2 mt-1" value="<?php echo $updata['pcsperf7']; ?>">
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                              <button type="submit" class="btn btn-warning" name="update">Update</button>
                            </div>
                          </form>
                        </div>
                      </div>
                    </div>
                    <?php
                    $date = $form7data['date'];
                    $item_id = $form7data['item_id'];
                  }
                  $totalvissstmt = $pdo->prepare("SELECT SUM(viss) AS total_viss FROM form7stock WHERE date='$date' AND item_id='$item_id'");
                  $totalvissstmt->execute();
                  $totalvissdata = $totalvissstmt->fetch(PDO::FETCH_ASSOC);
                  $totalkgstmt = $pdo->prepare("SELECT SUM(kg) AS total_kg FROM form7stock WHERE date='$date' AND item_id='$item_id'");
                  $totalkgstmt->execute();
                  $totalkgdata = $totalkgstmt->fetch(PDO::FETCH_ASSOC);
                  $totalpcsstmt = $pdo->prepare("SELECT SUM(pcspervr) AS total_pcs FROM form7stock WHERE date='$date' AND item_id='$item_id'");
                  $totalpcsstmt->execute();
                  $totalpcsdata = $totalpcsstmt->fetch(PDO::FETCH_ASSOC);
                  $totalpcsf7stmt = $pdo->prepare("SELECT SUM(pcsperf7) AS total_pcsf7 FROM form7stock WHERE date='$date' AND item_id='$item_id'");
                  $totalpcsf7stmt->execute();
                  $totalpcsf7data = $totalpcsf7stmt->fetch(PDO::FETCH_ASSOC);
                  ?>
                  <tr>
                    <td></td>
                    <td>Total</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><?php echo round($totalvissdata['total_viss'], 3); ?></td>
                    <td><?php echo round($totalkgdata['total_kg'], 2); ?></td>
                    <td><?php if(!empty($totalpcsdata['total_pcs'])){ echo $totalpcsdata['total_pcs']; }; ?></td>
                    <td><?php if(!empty($totalpcsf7data['total_pcsf7'])){ echo $totalpcsf7data['total_pcsf7']; }; ?></td>
                  </tr>
                  <?php
                }
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
