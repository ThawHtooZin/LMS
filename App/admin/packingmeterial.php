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
    <div class="row">
      <div class="col-2">
        <?php
        include 'sidebar.php';
        ?>
      </div>
      <div class="col-10">
        <div class="card mt-3">
          <div class="card-header bg-warning text-light"  style="padding:-10px;">
            <h5 class="d-inline">Manage Packing Material Costing</h5>
            <button type="button" class="btn btn-success btn-sm float-end" data-bs-toggle="modal" data-bs-target="#addpackingmaterialcosting">
              Add Packing Meterial Costing
            </button>
          </div>
          <div class="card-body">
            <?php
            if(isset($_POST['deletebutton'])){
              $deleteid = $_POST['deleteid'];
              $message = $query->deletecategory('category', $deleteid);
            }
            if(isset($_POST['updatebutton'])){
              $category_name = $_POST['category_name'];
              $category_id = $_POST['category_id'];

              $message = $query->updatecategory('category', $category_name, $category_id);
            }
            ?>
            <?php
            if(isset($_POST['addpackingmaterialbtn'])){
              $commondity_id = $_POST['commondity'];
              $fish_size = $_POST['fish_size'];
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

              $query->addpackingmaterial($commondity_id, $fish_size, $plastic, $jcv, $inner_box, $sticker, $mc_plastic, $carton_box, $tape, $penon, $p_sticker, $plastic_rope, $micellion, $processing, $plastic_size, $pcsperlb, $pcspermc, $tdydollorprice);
            }
            ?>
            <a href="#" class="detailbtn btn btn-info float-end text-light btn-sm" onclick="showdetail()">Show Detail</a>
            <a href="#" class="overviewbtn btn btn-primary float-end hide btn-sm" onclick="showoverview()">Show OverView</a>
            <?php

            if (!empty($_GET['pageno'])) {
              $pageno = $_GET['pageno'];
            }else{
              $pageno = 1;
            }
            $numOfrecs = 2;
            $offset = ($pageno -1) * $numOfrecs;
            ?>
            <table class="mt-5 table table-bordered table-striped rounded overview">
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
              $packingmaterialdatas = $query->selectall("packingmaterial");
              foreach ($packingmaterialdatas as $packingmaterialdata) {
                $itemdata = $query->select('item', $packingmaterialdata['commondity_id'], 'item_id');
              ?>
              <tr>
                <td><?php echo $packingmaterialdata['id']; ?></td>
                <td><?php echo $itemdata['item_name']; ?></td>
                <td><?php echo $packingmaterialdata['fish_size']; ?></td>
                <?php
                $micandpro = $packingmaterialdata['micellion'] + $packingmaterialdata['processing'];
                 ?>
                <td><?php echo $packingmaterialdata['total'] - $micandpro; ?></td>
                <td><?php echo $packingmaterialdata['micellion']; ?></td>
                <td><?php echo $packingmaterialdata['processing']; ?></td>
                <td><?php echo $packingmaterialdata['total']; ?></td>
                <td><?php echo $packingmaterialdata['perkgcost']; ?></td>
              </tr>
              <?php
              };
              ?>
            </table>

            <table class="mt-5 table table-bordered table-striped rounded hide detail">
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
              $packingmaterialdatas = $query->selectall("packingmaterial");
              foreach ($packingmaterialdatas as $packingmaterialdata) {
              ?>
              <tr>
                <td><?php echo $packingmaterialdata['id']; ?></td>
                <td><?php echo round($packingmaterialdata['plastic'], 2); ?></td>
                <td><?php echo $packingmaterialdata['jcv']; ?></td>
                <td><?php echo $packingmaterialdata['inner_box']; ?></td>
                <td><?php echo $packingmaterialdata['sticker']; ?></td>
                <td><?php echo $packingmaterialdata['mc_plastic']; ?></td>
                <td><?php echo $packingmaterialdata['carton_box']; ?></td>
                <td><?php echo $packingmaterialdata['tape']; ?></td>
                <td><?php echo $packingmaterialdata['penon']; ?></td>
                <td><?php echo $packingmaterialdata['p_sticker']; ?></td>
                <td><?php echo round($packingmaterialdata['plastic_rope'], 2); ?></td>
                <td><?php echo $packingmaterialdata['plastic_size']; ?></td>
                <td><?php echo $packingmaterialdata['pcsperlb']; ?></td>
                <td><?php echo $packingmaterialdata['pcspermc']; ?></td>
              </tr>
              <?php
              };
              ?>
            </table>
            <br>
            <div aria-label="Page navigation example" style="float:right;">
              <ul class="pagination">
                <li class="page-item"><a class="page-link" href="?pageno=1">First</a></li>
                <li class="page-item <?php if($pageno <= 1){echo 'disabled';} ?>">
                  <a class="page-link" href="<?php if($pageno <= 1){echo '#';} else {echo "?pageno=".($pageno-1);} ?>">Previous</a>
                </li>
                <li class="page-item"><a class="page-link" href="#"><?php echo $pageno; ?></a></li>
                <li class="page-item <?php if($pageno >= $total_pages){echo 'disabled';}; ?>">
                  <a class="page-link" href="<?php if($pageno >= $total_pages){echo '#';}else{echo "?pageno=".($pageno+1);} ?>">Next</a>
                </li>
                <li class="page-item"><a class="page-link" href="?pageno=<?php echo $total_pages; ?>">Last</a> </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>

    <?php include 'addmodals.php'; ?>
    <script type="text/javascript">
      function showdetail(){
        document.querySelector('.detailbtn').classList.add('hide');
        document.querySelector('.overviewbtn').classList.remove('hide');
        document.querySelector('.detail').classList.remove('hide');
        document.querySelector('.overview').classList.add('hide');
      }
      function showoverview(){
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
