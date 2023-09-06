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
            <b>Link Mark Limited (F-7)</b>
          </div>
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
              $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT item_id, date) FROM form7stock");
              $commonditycountstmt->execute();
              $commonditycountdatas = $commonditycountstmt->fetchColumn();
              for ($i=0; $i < $commonditycountdatas; $i++) {
                $commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM form7stock");
                $commonditystmt->execute();
                $commonditydata = $commonditystmt->fetchall();
                $commondity_id = $commonditydata[$i]['item_id'];

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
                <td><?php echo $form7data['pcsperviss']; ?></td>
                <td><?php echo $form7data['pcsperf7']; ?></td>
              </tr>
              <div class="modal fade" id="updatemodal<?php echo $form7data['id']; ?>">
                <div class="modal-dialog" role="document">
                  <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
                    <div class="modal-header bg-warning text-light">
                      <h1 class="modal-title fs-5">Update Country</h1>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <form action="form_7.php" method="post">
                        <input type="hidden" name="id" value="<?php echo $form7data['id']; ?>">
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
              $totalpcsstmt = $pdo->prepare("SELECT SUM(pcsperf7) AS total_pcs FROM form7stock WHERE date='$date' AND item_id='$item_id'");
              $totalpcsstmt->execute();
              $totalpcsdata = $totalpcsstmt->fetch(PDO::FETCH_ASSOC);
              ?>
              <tr>
              <td></td>
              <td>Total</td>
              <td></td>
              <td></td>
              <td></td>
              <td><?php echo $totalvissdata['total_viss']; ?></td>
              <td><?php echo round($totalkgdata['total_kg'], 2); ?></td>
              <td></td>
              <td><?php echo $totalpcsdata['total_pcs']; ?></td>
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
