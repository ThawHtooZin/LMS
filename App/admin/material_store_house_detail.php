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
    <div class="sidebarcol" id="sidebar">
      <?php
      include 'sidebar.php';
      ?>
    </div>
    <div class="contentcol" id="content">
      <?php require 'navbar.php'; ?>
      <div class="card">
        <div class="card-header bg-primary text-light" style="padding:-10px;">
          <?php
          $id = $_GET['id'];
          $materialstmt = $pdo->prepare("SELECT * FROM materials WHERE id='$id'");
          $materialstmt->execute();
          $material = $materialstmt->fetch(PDO::FETCH_ASSOC);
          ?>
          <h5>Manage Store {<?= $material['name']; ?>} Detail</h5>
          <a href="material_store_house.php" class="float-end btn btn-secondary btn-sm">Back</a>
        </div>
        <div class="card-body">
          <?php
          if (!empty($message)) {
            if (strpos($message, 'Successfully')) {
              $successmessage = $message;
            }

            if (strpos($message, 'Error')) {
              $errmessage = $message;
            }

            if (strpos($message, 'following')) {
              $errormessage = $message;
            }
          }

          ?>

          <?php

          if (!empty($_GET['pageno'])) {
            $pageno = $_GET['pageno'];
          } else {
            $pageno = 1;
          }
          $numOfrecs = 13;
          $offset = ($pageno - 1) * $numOfrecs;
          ?>
          <table class="mt-3 table table-bordered table-striped rounded">
            <tr>
              <!-- <th>Category Name</th> -->
              <th>Id</th>
              <th>Date</th>
              <th>Voucher No</th>
              <th>Stock To</th>
              <th>G/P Voucher No</th>
              <th>Supplier</th>
              <th>Description</th>
              <th>Unit</th>
              <th>In</th>
              <th>Out</th>
              <th>Balance</th>
            </tr>

            <?php
            $stmt = $pdo->prepare("SELECT * FROM material_store_house WHERE material_id='$id' ORDER BY id");
            $stmt->execute();
            $rawResult = $stmt->fetchAll();
            $total_pages = ceil(count($rawResult) / $numOfrecs);

            $stmt = $pdo->prepare("SELECT * FROM material_store_house WHERE material_id='$id' ORDER BY id LIMIT $offset,$numOfrecs ");
            $stmt->execute();
            $datas = $stmt->fetchAll();
            ?>
            <?php
            $no = 1;
            $balance = 0;
            foreach ($datas as $data) {
              $material_id = $data['material_id'];
              $supplier_id = $data['supplier_id'];

              $stmt = $pdo->prepare("SELECT * FROM materials WHERE id='$material_id'");
              $stmt->execute();
              $material = $stmt->fetch(PDO::FETCH_ASSOC);

              $supplierstmt = $pdo->prepare("SELECT * FROM supplier WHERE supplier_id='$supplier_id'");
              $supplierstmt->execute();
              $supplier = $supplierstmt->fetch(PDO::FETCH_ASSOC);

              if (empty($supplier)) {
                $supplier['supplier_name'] = '';
              }

              $in = $data['in'];
              $out = $data['out'];
              $balance += $in - $out;

              $outgroupid = $data['output_group'];
              $outstmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE id='$outgroupid'");
              $outstmt->execute();
              $outdata = $outstmt->fetch(PDO::FETCH_ASSOC);
            ?>

              <tr>
                <td><?php echo $no; ?></td>
                <td><?php echo date('d-m-Y', strtotime($data['date'])); ?></td>
                <td><?php if (empty($outdata['stock_to'])) {
                      echo $data['voucher_no'];
                    } ?></td>
                <td><?php if (!empty($outdata['stock_to'])) {
                      echo $outdata['stock_to'];
                    } ?></td>
                <td><?php if (!empty($outdata['voucher_no'])) {
                      echo $outdata['voucher_no'];
                    } ?></td>
                <td><?php if (empty($outdata['stock_to'])) {
                      echo $supplier['supplier_name'];
                    } ?></td>
                <td><?= $data['description']; ?></td>
                <td><?php echo $material['unit']; ?></td>
                <td style="color: green; font-weight: bolder;"><?php if ($in == '') {
                                                                  echo '-';
                                                                } else {
                                                                  echo $in;
                                                                }; ?></td>
                <td style="color: red; font-weight: bolder;"><?php if ($out == '') {
                                                                echo '-';
                                                              } else {
                                                                echo $out;
                                                              }; ?></td>
                <td style="color: blue; font-weight: bolder;"><?php if ($balance == '') {
                                                                echo '-';
                                                              } else {
                                                                echo $balance;
                                                              }; ?></td>
              </tr>
              <!-- Data Update Modal -->
              <div class="modal fade" id="updatemodal<?php echo $itemdata['id']; ?>" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header bg-warning text-light">
                      <h5 class="modal-title" id="updatemodallabel">Update An Material</h5>
                      <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="h3">&times;</span>
                      </button>
                    </div>
                    <form action="" method="post" autocomplete="off">
                      <div class="modal-body">
                        <?php
                        $id = $itemdata['id'];
                        $updatedata = $query->select('materials', $id, 'id');
                        ?>
                        <input type="hidden" name="id" value="<?php echo $itemdata['id']; ?>">
                        <label>Material Name</label>
                        <input type="text" name="name" class="form-control" placeholder="Name" value="<?php echo $updatedata['name']; ?>">
                        <label>Description</label>
                        <textarea name="description" class="form-control" placeholder="Description"><?php echo $updatedata['description']; ?></textarea>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-warning" name="updatebutton">Update</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
              <!-- Update Modal -->
            <?php
              $no++;
            };
            ?>

          </table>
          <br>
          <div aria-label="Page navigation example" style="float:right;">
            <ul class="pagination">
              <li class="page-item"><a class="page-link" href="?pageno=1">First</a></li>
              <li class="page-item <?php if ($pageno <= 1) {
                                      echo 'disabled';
                                    } ?>">
                <a class="page-link" href="<?php if ($pageno <= 1) {
                                              echo '#';
                                            } else {
                                              echo "?pageno=" . ($pageno - 1);
                                            } ?>">Previous</a>
              </li>
              <li class="page-item"><a class="page-link" href="#"><?php echo $pageno; ?></a></li>
              <li class="page-item <?php if ($pageno >= $total_pages) {
                                      echo 'disabled';
                                    }; ?>">
                <a class="page-link" href="<?php if ($pageno >= $total_pages) {
                                              echo '#';
                                            } else {
                                              echo "?pageno=" . ($pageno + 1);
                                            } ?>">Next</a>
              </li>
              <li class="page-item"><a class="page-link" href="?pageno=<?php echo $total_pages; ?>">Last</a> </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Data Add Modal -->
  <div class="modal fade" id="addmodal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header bg-secondary text-light">
          <h5 class="modal-title" id="addmodellabel">Create New Material</h5>
          <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true" class="h3">&times;</span>
          </button>
        </div>
        <form action="material_list.php" method="post" autocomplete="off">
          <div class="modal-body">
            <label>Material Name</label>
            <input type="text" name="name" class="form-control" placeholder="Name">
            <label>Description</label>
            <textarea name="description" class="form-control" placeholder="Description"></textarea>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-success" name="addbutton">Add Material</button>
          </div>
        </form>
      </div>
    </div>
  </div>
  <!-- Add Modal -->

  <?php
  $bootstrap->javascript();
  ?>
</body>

</html>