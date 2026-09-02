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
  <div class="row m-0">
    <div class="sidebarcol" id="sidebar">
      <?php
      include 'sidebar.php';
      ?>
    </div>
    <div class="contentcol" id="content">
      <?php require 'navbar.php'; ?>
      <div class="card">
        <div class="card-header bg-success text-light" style="padding:-10px;">

          <h5 class="d-inline">Manage Packing Material Costing</h5>
          <a href="packing_stock.php" class="btn btn-danger float-end me-2 btn-sm ms-2" id="back">Back</a>
          <button class="detailbtn btn btn-info float-end text-light btn-sm" onclick="showdetail()">Show Detail</button>
          <button class="overviewbtn btn btn-info text-light float-end hide btn-sm" onclick="showoverview()">Show OverView</button>
        </div>
        <div class="card-body">
          <?php
          if (isset($_POST['addpackingmaterialbtn'])) {
            $upid = $_POST['upid'];
            $plastic = $_POST['plastic'];
            $jcv = $_POST['jcv'];
            $inner_box = $_POST['inner_box'];
            $sticker = $_POST['sticker'];
            $mc_plastic = $_POST['mc_plastic'];
            $carton_box = $_POST['carton_box'];
            $tape = $_POST['tape'];
            $penon = $_POST['penon'];
            $p_sticker = $_POST['p_sticker'];
            $plastic_rope = $_POST['plastic_rope'];
            $micellion = $_POST['micellion'];
            $processing = $_POST['processing'];
            $plastic_size = $_POST['plastic_size'];
            $pcsperlb = $_POST['pcsperlb'];
            $pcspermc = $_POST['pcspermc'];
            $tdydollorprice = $_POST['tdydollorprice'];

            $query->updatepackingmaterial($upid, $plastic, $jcv, $inner_box, $sticker, $mc_plastic, $carton_box, $tape, $penon, $p_sticker, $plastic_rope, $micellion, $processing, $plastic_size, $pcsperlb, $pcspermc, $tdydollorprice);
          }
          ?>
          <?php
          $infoid = $_GET['infoid'];

          $infostmt = $pdo->prepare("SELECT * FROM packingliststock WHERE id='$infoid'");
          $infostmt->execute();
          $infodata = $infostmt->fetch(PDO::FETCH_ASSOC);
          ?>
          <div class="row" style="font-weight: bold;">
            <div class="col-1">

            </div>
            <div class="col-7">
              <?php
              $customer_id = $infodata['customer_id'] ?? 0;
              $customerdata = $query->select('contacts', $customer_id, 'id');
              echo htmlspecialchars($customerdata['name'] ?? 'Unknown Customer');
              ?><br><?php
                    echo htmlspecialchars($customerdata['phone'] ?? '');
                    ?><br><?php
                          echo htmlspecialchars($customerdata['address'] ?? '');
                          ?>
            </div>
            <div class="col-3">
              Date : <?php echo date('d-m-Y', strtotime($infodata['date']));  ?>
              <br>
              Invoice No : <?php echo $infodata['invoiceno'];  ?>
              <br>
              CTNR No : <?php echo $infodata['containerno'];  ?>
              <br>
              VESSEL NAME : <?php echo $infodata['vessel_name']; ?>
              <br>
              VOY NAME : <?php echo $infodata['voyname']; ?>
              <br>
              FDA : <?php echo $infodata['fda']; ?>

            </div>
            <div class="col-1">

            </div>
          </div>

          <table class="mt-3 table table-bordered table-striped rounded overview">
            <tr>
              <th>Id</th>
              <th>Commondity</th>
              <th>Fish Size</th>
              <th>Total Packing</th>
              <th>Micellion</th>
              <th>Processing</th>
              <th>Total</th>
              <th>Per Kg Cost</th>
            </tr>
            <?php
            $packingmaterialdatas = $query->search("packingmaterial", 'infoid', $infoid);
            $noo = 1;
            foreach ($packingmaterialdatas as $packingmaterialdata) {
              $itemdata = $query->select('products', $packingmaterialdata['commondity_id'], 'id');
              $item_id = $packingmaterialdata['commondity_id'];
              $lastid = $packingmaterialdata['id'];
              $size = $packingmaterialdata['fish_size'];
              $infoid = $packingmaterialdata['infoid'];
              $checklast = $pdo->prepare("SELECT * FROM packingmaterial WHERE id < $lastid AND commondity_id='$item_id' AND fish_size='$size' AND infoid='$infoid'");
              $checklast->execute();
              $checklastavaliable = $checklast->fetch(PDO::FETCH_ASSOC);
              $lastcommondity = $pdo->prepare("SELECT * FROM packingmaterial WHERE id < $lastid AND commondity_id='$item_id' AND infoid='$infoid'");
              $lastcommondity->execute();
              $lastcommondity = $lastcommondity->fetch(PDO::FETCH_ASSOC);

            ?>
              <tr style="cursor: pointer;" data-bs-toggle="modal" data-bs-target="#addpackingmaterialcosting<?php echo $packingmaterialdata['id']; ?>">
                <td><?php if (empty($lastcommondity)) {
                      echo $noo;
                    } ?></td>
                <td><?php if (empty($lastcommondity)) {
                      echo htmlspecialchars($itemdata['name'] ?? '');
                    }; ?></td>
                <td><?php if (empty($checklastavaliable)) {
                      echo htmlspecialchars($packingmaterialdata['fish_size']);
                    } ?></td>
                <?php
                $micandpro = $packingmaterialdata['micellion'] + $packingmaterialdata['processing'];
                ?>
                <td><?php echo $packingmaterialdata['total'] - $micandpro; ?></td>
                <td><?php echo $packingmaterialdata['micellion']; ?></td>
                <td><?php echo $packingmaterialdata['processing']; ?></td>
                <td><?php echo $packingmaterialdata['total']; ?></td>
                <td><?php echo $packingmaterialdata['perkgcost']; ?></td>
              </tr>

              <!-- Slick Multi-Column Grid Modal Rendered Per Row -->
              <div class="modal fade" id="addpackingmaterialcosting<?php echo $packingmaterialdata['id']; ?>" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                  <div class="modal-content">
                    <div class="modal-header bg-secondary text-light">
                      <h5 class="modal-title">Packing Material Costing</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="" method="post">
                      <div class="modal-body">
                        <input type="hidden" name="upid" value="<?php echo $packingmaterialdata['id']; ?>">

                        <div class="row">
                          <div class="col-md-4 mb-3">
                            <label class="fw-bold small">Plastic Costing</label>
                            <input type="text" name="plastic" class="form-control" value="<?php echo $packingmaterialdata['plastic']; ?>">
                          </div>
                          <div class="col-md-4 mb-3">
                            <label class="fw-bold small">JCV Cost</label>
                            <input type="text" name="jcv" class="form-control" value="<?php echo $packingmaterialdata['jcv']; ?>">
                          </div>
                          <div class="col-md-4 mb-3">
                            <label class="fw-bold small">Inner Box</label>
                            <input type="text" name="inner_box" class="form-control" value="<?php echo $packingmaterialdata['inner_box']; ?>">
                          </div>
                        </div>

                        <div class="row">
                          <div class="col-md-4 mb-3">
                            <label class="fw-bold small">Sticker Cost</label>
                            <input type="text" name="sticker" class="form-control" value="<?php echo $packingmaterialdata['sticker']; ?>">
                          </div>
                          <div class="col-md-4 mb-3">
                            <label class="fw-bold small">MC Plastic Cost</label>
                            <input type="text" name="mc_plastic" class="form-control" value="<?php echo $packingmaterialdata['mc_plastic']; ?>">
                          </div>
                          <div class="col-md-4 mb-3">
                            <label class="fw-bold small">Carton Box Cost</label>
                            <input type="text" name="carton_box" class="form-control" value="<?php echo $packingmaterialdata['carton_box']; ?>">
                          </div>
                        </div>

                        <div class="row">
                          <div class="col-md-4 mb-3">
                            <label class="fw-bold small">Tape Cost</label>
                            <input type="text" name="tape" class="form-control" value="<?php echo $packingmaterialdata['tape']; ?>">
                          </div>
                          <div class="col-md-4 mb-3">
                            <label class="fw-bold small">Penon Cost</label>
                            <input type="text" name="penon" class="form-control" value="<?php echo $packingmaterialdata['penon']; ?>">
                          </div>
                          <div class="col-md-4 mb-3">
                            <label class="fw-bold small">P-Sticker Cost</label>
                            <input type="text" name="p_sticker" class="form-control" value="<?php echo $packingmaterialdata['p_sticker']; ?>">
                          </div>
                        </div>

                        <div class="row">
                          <div class="col-md-4 mb-3">
                            <label class="fw-bold small">Plastic Rope Cost</label>
                            <input type="text" name="plastic_rope" class="form-control" value="<?php echo $packingmaterialdata['plastic_rope']; ?>">
                          </div>
                          <div class="col-md-4 mb-3">
                            <label class="fw-bold small">Micellion Cost</label>
                            <input type="text" name="micellion" class="form-control" value="<?php echo $packingmaterialdata['micellion']; ?>">
                          </div>
                          <div class="col-md-4 mb-3">
                            <label class="fw-bold small">Processing Cost</label>
                            <input type="text" name="processing" class="form-control" value="<?php echo $packingmaterialdata['processing']; ?>">
                          </div>
                        </div>

                        <div class="row">
                          <div class="col-md-4 mb-3">
                            <label class="fw-bold small">Plastic Size</label>
                            <input type="text" name="plastic_size" class="form-control" value="<?php echo htmlspecialchars($packingmaterialdata['plastic_size']); ?>">
                          </div>
                          <div class="col-md-4 mb-3">
                            <label class="fw-bold small">Pcs Per Lb</label>
                            <input type="text" name="pcsperlb" class="form-control" value="<?php echo $packingmaterialdata['pcsperlb']; ?>">
                          </div>
                          <div class="col-md-4 mb-3">
                            <label class="fw-bold small">Pcs Per MC</label>
                            <input type="text" name="pcspermc" class="form-control" value="<?php echo $packingmaterialdata['pcspermc']; ?>">
                          </div>
                        </div>

                        <div class="row">
                          <div class="col-md-4 mb-3">
                            <label class="fw-bold small">Dollar Rate</label>
                            <input type="text" name="tdydollorprice" class="form-control" value="">
                          </div>
                        </div>

                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" name="addpackingmaterialbtn" class="btn btn-success">Add</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            <?php
              $noo++;
            };
            ?>
          </table>

          <table class="mt-3 table table-bordered table-striped rounded hide detail">
            <tr class="info">
              <th>Id</th>
              <th>Plastic</th>
              <th>JCV</th>
              <th>Inner Box</th>
              <th>Sticker</th>
              <th>MC Plastic</th>
              <th>Carton Box</th>
              <th>Tape</th>
              <th>Penon</th>
              <th>P-Sticker</th>
              <th>Plastic Rope</th>
              <th>Plastic Size</th>
              <th>Pcs Per Lb</th>
              <th>Pcs Per MC</th>
            </tr>
            <?php
            $packingmaterialdetaildatas = $query->search("packingmaterial", 'infoid', $infoid);
            $no = 1;
            foreach ($packingmaterialdetaildatas as $packingmaterialdata) {
            ?>
              <tr>
                <td><?php echo $no; ?></td>
                <td><?php if ($packingmaterialdata == 0) {
                      echo round($packingmaterialdata['plastic'], 2);
                    } else {
                      echo $packingmaterialdata['plastic'];
                    } ?></td>
                <td><?php echo $packingmaterialdata['jcv']; ?></td>
                <td><?php echo $packingmaterialdata['inner_box']; ?></td>
                <td><?php echo $packingmaterialdata['sticker']; ?></td>
                <td><?php echo $packingmaterialdata['mc_plastic']; ?></td>
                <td><?php echo $packingmaterialdata['carton_box']; ?></td>
                <td><?php echo $packingmaterialdata['tape']; ?></td>
                <td><?php echo $packingmaterialdata['penon']; ?></td>
                <td><?php echo $packingmaterialdata['p_sticker']; ?></td>
                <td><?php if ($packingmaterialdata == 0) {
                      echo round($packingmaterialdata['plastic_rope'], 2);
                    } else {
                      echo $packingmaterialdata['plastic_rope'];
                    } ?></td>
                <td><?php echo htmlspecialchars($packingmaterialdata['plastic_size']); ?></td>
                <td><?php echo htmlspecialchars($packingmaterialdata['pcsperlb']); ?></td>
                <td><?php echo htmlspecialchars($packingmaterialdata['pcspermc']); ?></td>
              </tr>
            <?php
              $no++;
            };
            ?>
          </table>
          <br>
        </div>
      </div>
    </div>
  </div>

  <script type="text/javascript">
    function showdetail() {
      document.querySelector('.detailbtn').classList.add('hide');
      document.querySelector('.overviewbtn').classList.remove('hide');
      document.querySelector('.detail').classList.remove('hide');
      document.querySelector('.overview').classList.add('hide');
    }

    function showoverview() {
      document.querySelector('.detailbtn').classList.remove('hide');
      document.querySelector('.overviewbtn').classList.add('hide');
      document.querySelector('.detail').classList.add('hide');
      document.querySelector('.overview').classList.remove('hide');
    }
  </script>
  <?php
  $bootstrap->javascript();
  ?>
</body>

</html>