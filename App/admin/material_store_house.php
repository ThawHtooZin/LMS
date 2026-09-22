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
    <?php
    if (isset($_POST['outputbtn'])) {
      $date = $_POST['date'];
      $stockto = $_POST['stock_to'];
      $voucher_no = $_POST['voucher_no'];
      $material = $_POST['material'];
      $quantity = floatval($_POST['quantity']);

      // BULLETPROOF SUMMATION: Avoids SQL column name crashes entirely
      $checkstmt = $pdo->prepare("SELECT * FROM material_store_house WHERE material_id = ?");
      $checkstmt->execute([$material]);
      $mat_rows = $checkstmt->fetchAll(PDO::FETCH_ASSOC);

      $totalin = 0;
      $totalout = 0;
      foreach ($mat_rows as $r) {
        $totalin += floatval($r['in_quantity'] ?? $r['in'] ?? 0);
        $totalout += floatval($r['out_quantity'] ?? $r['out'] ?? 0);
      }

      $totalquantity = $totalin - $totalout;

      if ($totalquantity < $quantity) {
        $quantity_error = "Not enough quantity";
        echo "<script>swal('Not enough quantity!', 'Only have " . $totalquantity . "', 'warning');</script>";
      } else {
        $query->outputmaterial($date, $stockto, $material, $quantity, $voucher_no);
      }
    }
    ?>
    <div class="contentcol" id="content">
      <?php require 'navbar.php'; ?>
      <div class="card">
        <div class="card-header bg-primary text-light" style="padding:-10px;">
          <p style="font-size: 26px;font-weight: bold; display:inline;">Manage Packing Material (WareHouse)</p>
          <button class="btn btn-warning float-end" data-bs-toggle="modal" data-bs-target="#outputmodal">Output</button>
          <div class="modal fade" style="margin-top: 75px;" id="outputmodal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content text-dark">
                <form action="material_store_house.php" method="POST">
                  <div class="modal-header bg-primary">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Output Stock</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <label>Date</label>
                    <input type="date" name="date" class="form-control" required>
                    <label>Stock To</label>
                    <select name="stock_to" class="form-control">
                      <?php
                      $coldstorestmt = $pdo->prepare("SELECT * FROM config_coldstore");
                      $coldstorestmt->execute();
                      $coldstores = $coldstorestmt->fetchAll(PDO::FETCH_ASSOC);
                      foreach ($coldstores as $coldstore): ?>
                        <option value="<?= htmlspecialchars($coldstore['name']) ?>" style="text-transform: uppercase;"><?= htmlspecialchars($coldstore['name']) ?></option>
                      <?php endforeach; ?>
                    </select>

                    <label>Packing Material Item</label>
                    <select name="material" class="form-control">
                      <?php
                      $materialstmt = $pdo->prepare("SELECT DISTINCT material_id FROM material_store_house WHERE material_id > 0");
                      $materialstmt->execute();
                      $materials = $materialstmt->fetchAll(PDO::FETCH_ASSOC);
                      foreach ($materials as $mat) {
                        $materialid = $mat['material_id'];
                        // CORRECTED: Point back to the unified products table
                        $mStmt = $pdo->prepare("SELECT * FROM products WHERE id = ? LIMIT 1");
                        $mStmt->execute([$materialid]);
                        $materialdata = $mStmt->fetch(PDO::FETCH_ASSOC);
                        if ($materialdata) {
                      ?>
                          <option value="<?= htmlspecialchars($materialid); ?>"><?= htmlspecialchars($materialdata['name']); ?></option>
                      <?php
                        }
                      }
                      ?>
                    </select>

                    <label>GatePass Voucher No</label>
                    <input type="text" name="voucher_no" class="form-control" required>

                    <label>Quantity</label>
                    <input type="number" name="quantity" class="form-control" required>
                    <?php
                    if (isset($_POST['outputbtn']) && !empty($quantity_error)) {
                    ?>
                      <p class="text-danger"><?= htmlspecialchars($quantity_error); ?></p>
                    <?php
                    }
                    ?>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" name="outputbtn" class="btn btn-primary">Output</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <div class="card-body">
          <?php
          $pageno = !empty($_GET['pageno']) ? intval($_GET['pageno']) : 1;
          $numOfrecs = 13;
          $offset = ($pageno - 1) * $numOfrecs;
          ?>
          <table class="mt-3 table table-bordered table-striped rounded">
            <tr>
              <th style="width: 20px;">No.</th>
              <th>Packing Material Item</th>
              <th>In</th>
              <th>Out</th>
              <th>Balance</th>
              <th>Action</th>
            </tr>

            <?php
            $stmt = $pdo->prepare("SELECT DISTINCT material_id FROM material_store_house WHERE material_id IS NOT NULL AND material_id != '' ORDER BY material_id");
            $stmt->execute();
            $rawResult = $stmt->fetchAll(PDO::FETCH_ASSOC);
            $total_pages = ceil(count($rawResult) / $numOfrecs);

            $stmt = $pdo->prepare("SELECT DISTINCT material_id FROM material_store_house WHERE material_id IS NOT NULL AND material_id != '' ORDER BY material_id LIMIT $offset, $numOfrecs");
            $stmt->execute();
            $datas = $stmt->fetchAll(PDO::FETCH_ASSOC);

            $no = $offset + 1;
            foreach ($datas as $data) {
              $material_id = $data['material_id'];

              // CORRECTED: Target products table
              $mStmt = $pdo->prepare("SELECT * FROM products WHERE id = ? LIMIT 1");
              $mStmt->execute([$material_id]);
              $material = $mStmt->fetch(PDO::FETCH_ASSOC) ?: ['name' => 'Unknown Product'];

              // BULLETPROOF SUMMATION
              $chkStmt = $pdo->prepare("SELECT * FROM material_store_house WHERE material_id = ?");
              $chkStmt->execute([$material_id]);
              $mat_rows = $chkStmt->fetchAll(PDO::FETCH_ASSOC);

              $totalin = 0;
              $totalout = 0;
              foreach ($mat_rows as $r) {
                $totalin += floatval($r['in_quantity'] ?? $r['in'] ?? 0);
                $totalout += floatval($r['out_quantity'] ?? $r['out'] ?? 0);
              }

              $balance = $totalin - $totalout;
            ?>

              <tr>
                <td><?php echo $no; ?></td>
                <td><?php echo htmlspecialchars($material['name']); ?></td>
                <td><?php echo $totalin == 0 ? '-' : $totalin; ?></td>
                <td><?php echo $totalout == 0 ? '-' : $totalout; ?></td>
                <td><?php echo ($balance == 0 && $totalin == 0) ? '-' : $balance; ?></td>
                <td><a href="material_store_house_detail.php?id=<?= htmlspecialchars($material_id); ?>" class="btn btn-primary btn-sm"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list-check" viewBox="0 0 16 16">
                      <path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3.854 2.146a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 3.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 7.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0z" />
                    </svg></a></td>
              </tr>
            <?php
              $no++;
            };
            ?>

          </table>
          <br>
          <div aria-label="Page navigation example" style="float:right;">
            <ul class="pagination">
              <li class="page-item"><a class="page-link" href="?pageno=1">First</a></li>
              <li class="page-item <?php if ($pageno <= 1) echo 'disabled'; ?>">
                <a class="page-link" href="<?php if ($pageno <= 1) echo '#';
                                            else echo "?pageno=" . ($pageno - 1); ?>">Previous</a>
              </li>
              <li class="page-item"><a class="page-link" href="#"><?php echo $pageno; ?></a></li>
              <li class="page-item <?php if ($pageno >= $total_pages) echo 'disabled'; ?>">
                <a class="page-link" href="<?php if ($pageno >= $total_pages) echo '#';
                                            else echo "?pageno=" . ($pageno + 1); ?>">Next</a>
              </li>
              <li class="page-item"><a class="page-link" href="?pageno=<?php echo $total_pages; ?>">Last</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>

  <?php $bootstrap->javascript(); ?>
</body>

</html>