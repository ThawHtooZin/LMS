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
          // RULE 1: Items -> Products
          $materialstmt = $pdo->prepare("SELECT * FROM products WHERE id = ? LIMIT 1");
          $materialstmt->execute([$id]);
          $material = $materialstmt->fetch(PDO::FETCH_ASSOC) ?: ['name' => 'Unknown Material', 'unit' => ''];
          ?>
          <h5>Manage Store {<?= htmlspecialchars($material['name']); ?>} Detail</h5>
          <a href="material_store_house.php" class="float-end btn btn-secondary btn-sm">Back</a>
        </div>
        <div class="card-body">
          <?php
          $pageno = !empty($_GET['pageno']) ? intval($_GET['pageno']) : 1;
          $numOfrecs = 13;
          $offset = ($pageno - 1) * $numOfrecs;
          ?>
          <table class="mt-3 table table-bordered table-striped rounded">
            <tr>
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
            $stmt = $pdo->prepare("SELECT * FROM material_store_house WHERE material_id = ? ORDER BY id");
            $stmt->execute([$id]);
            $rawResult = $stmt->fetchAll(PDO::FETCH_ASSOC);
            $total_pages = ceil(count($rawResult) / $numOfrecs);

            $stmt = $pdo->prepare("SELECT * FROM material_store_house WHERE material_id = ? ORDER BY id LIMIT $offset, $numOfrecs");
            $stmt->execute([$id]);
            $datas = $stmt->fetchAll(PDO::FETCH_ASSOC);
            ?>
            <?php
            $no = $offset + 1;
            $balance = 0;
            foreach ($datas as $data) {
              $material_id = $data['material_id'];
              $supplier_id = $data['supplier_id'];

              // RULE 1: Products table
              $mStmt = $pdo->prepare("SELECT * FROM products WHERE id = ? LIMIT 1");
              $mStmt->execute([$material_id]);
              $matData = $mStmt->fetch(PDO::FETCH_ASSOC) ?: ['name' => '', 'unit' => ''];

              // RULE 3: Suppliers -> Contacts table
              $suppStmt = $pdo->prepare("SELECT name FROM contacts WHERE id = ? LIMIT 1");
              $suppStmt->execute([$supplier_id]);
              $supplierName = $suppStmt->fetchColumn() ?: '';

              $in = floatval($data['in_quantity'] ?? 0);
              $out = floatval($data['out_quantity'] ?? 0);
              $balance += $in - $out;

              $outgroupid = $data['output_group'];
              $outstmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE id = ? LIMIT 1");
              $outstmt->execute([$outgroupid]);
              $outdata = $outstmt->fetch(PDO::FETCH_ASSOC);
            ?>

              <tr>
                <td><?php echo $no; ?></td>
                <td><?php echo !empty($data['date']) && $data['date'] != '0000-00-00' ? date('d-m-Y', strtotime($data['date'])) : ''; ?></td>
                <td><?php echo empty($outdata['stock_to']) ? htmlspecialchars($data['voucher_no'] ?? '') : ''; ?></td>
                <td><?php echo !empty($outdata['stock_to']) ? htmlspecialchars($outdata['stock_to']) : ''; ?></td>
                <td><?php echo !empty($outdata['voucher_no']) ? htmlspecialchars($outdata['voucher_no']) : ''; ?></td>
                <td><?php echo empty($outdata['stock_to']) ? htmlspecialchars($supplierName) : ''; ?></td>
                <td><?= htmlspecialchars($data['description'] ?? ''); ?></td>
                <td><?php echo htmlspecialchars($matData['unit']); ?></td>
                <td style="color: green; font-weight: bolder;"><?php echo $in == 0 ? '-' : $in; ?></td>
                <td style="color: red; font-weight: bolder;"><?php echo $out == 0 ? '-' : $out; ?></td>
                <td style="color: blue; font-weight: bolder;"><?php echo $balance == 0 && $in == 0 && $out == 0 ? '-' : $balance; ?></td>
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