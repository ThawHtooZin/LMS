<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['updatemovement']) && !empty($_SESSION['logged_in'])) {
  $postedMaterial = (int)($_POST['material_id'] ?? 0);
  $postedPage = max(1, (int)($_POST['pageno'] ?? 1));
  $_SESSION['store_detail_flash'] = $query->updateMaterialStoreHouseDetail(
    (int)($_POST['movement_id'] ?? 0),
    $postedMaterial,
    $_POST
  );
  header('Location: material_store_house_detail.php?id=' . $postedMaterial . '&pageno=' . $postedPage);
  exit;
}

$updateResult = null;
if (!empty($_SESSION['store_detail_flash']) && is_array($_SESSION['store_detail_flash'])) {
  $updateResult = $_SESSION['store_detail_flash'];
  unset($_SESSION['store_detail_flash']);
}
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
          // CORRECTED: Target products table
          $materialstmt = $pdo->prepare("SELECT * FROM products WHERE id = ? LIMIT 1");
          $materialstmt->execute([$id]);
          $material = $materialstmt->fetch(PDO::FETCH_ASSOC) ?: ['name' => 'Unknown Product', 'unit' => ''];
          ?>
          <h5>Manage Store {<?= htmlspecialchars($material['name']); ?>} Detail</h5>
          <a href="material_store_house.php" class="float-end btn btn-secondary btn-sm">Back</a>
        </div>
        <div class="card-body">
          <?php if ($updateResult !== null): ?>
            <div class="alert alert-<?= $updateResult['status'] ? 'success' : 'danger'; ?> alert-dismissible fade show" role="alert">
              <?= htmlspecialchars($updateResult['message'] ?? ''); ?>
              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
          <?php endif; ?>
          <?php
          $pageno = !empty($_GET['pageno']) ? intval($_GET['pageno']) : 1;
          $numOfrecs = 13;
          $offset = ($pageno - 1) * $numOfrecs;

          $coldstoreStmt = $pdo->prepare("SELECT name FROM config_coldstore ORDER BY name ASC");
          $coldstoreStmt->execute();
          $coldstores = $coldstoreStmt->fetchAll(PDO::FETCH_ASSOC);
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
              <th>Action</th>
            </tr>

            <?php
            $stmt = $pdo->prepare("SELECT * FROM material_store_house WHERE material_id = ? ORDER BY id");
            $stmt->execute([$id]);
            $rawResult = $stmt->fetchAll(PDO::FETCH_ASSOC);
            $total_pages = max(1, (int)ceil(count($rawResult) / $numOfrecs));
            $pageno = min(max(1, $pageno), $total_pages);
            $offset = ($pageno - 1) * $numOfrecs;
            $stmt = $pdo->prepare("SELECT * FROM material_store_house WHERE material_id = ? ORDER BY id LIMIT $offset, $numOfrecs");
            $stmt->execute([$id]);
            $datas = $stmt->fetchAll(PDO::FETCH_ASSOC);
            ?>
            <?php
            $no = $offset + 1;
            $balance = 0;
            foreach (array_slice($rawResult, 0, $offset) as $priorRow) {
              $balance += floatval($priorRow['in_quantity'] ?? $priorRow['in'] ?? 0)
                - floatval($priorRow['out_quantity'] ?? $priorRow['out'] ?? 0);
            }
            foreach ($datas as $data) {
              $material_id = $data['material_id'];
              $supplier_id = $data['contact_id'] ?? '';
              if ($supplier_id === '' || $supplier_id === null) {
                $supplier_id = $data['supplier_id'] ?? '';
              }

              // CORRECTED: Target products table
              $mStmt = $pdo->prepare("SELECT * FROM products WHERE id = ? LIMIT 1");
              $mStmt->execute([$material_id]);
              $matData = $mStmt->fetch(PDO::FETCH_ASSOC) ?: ['name' => '', 'unit' => ''];

              // Safely look up supplier name without crashing on strings
              $supplierName = $supplier_id;
              if (is_numeric($supplier_id)) {
                $suppStmt = $pdo->prepare("SELECT name FROM contacts WHERE id = ? LIMIT 1");
                $suppStmt->execute([$supplier_id]);
                $fetched = $suppStmt->fetchColumn();
                if ($fetched) $supplierName = $fetched;
              }

              $in = floatval($data['in_quantity'] ?? $data['in'] ?? 0);
              $out = floatval($data['out_quantity'] ?? $data['out'] ?? 0);
              $balance += $in - $out;

              $outgroupid = $data['output_group'] ?? '';
              $outdata = [];
              if (!empty($outgroupid)) {
                $outstmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE id = ? LIMIT 1");
                $outstmt->execute([$outgroupid]);
                $outdata = $outstmt->fetch(PDO::FETCH_ASSOC) ?: [];
              }

              $isLinkedOutput = !empty($outgroupid);
              $isOutbound = $isLinkedOutput || ($out > 0 && $in <= 0);
              $dateValue = (!empty($data['date']) && $data['date'] != '0000-00-00') ? $data['date'] : '';
              $voucherValue = $isLinkedOutput ? ($outdata['voucher_no'] ?? '') : ($data['voucher_no'] ?? '');
              $stockToValue = $outdata['stock_to'] ?? '';
            ?>

              <tr>
                <td><?php echo $no; ?></td>
                <td><?php echo !empty($data['date']) && $data['date'] != '0000-00-00' ? date('d-m-Y', strtotime($data['date'])) : ''; ?></td>
                <td><?php echo empty($outdata['stock_to']) ? htmlspecialchars($data['voucher_no'] ?? '') : ''; ?></td>
                <td><?php echo !empty($outdata['stock_to']) ? htmlspecialchars($outdata['stock_to']) : ''; ?></td>
                <td><?php echo !empty($outdata['voucher_no']) ? htmlspecialchars($outdata['voucher_no']) : ''; ?></td>
                <td><?php echo empty($outdata['stock_to']) ? htmlspecialchars($supplierName) : ''; ?></td>
                <td><?= htmlspecialchars($data['description'] ?? ''); ?></td>
                <td><?php echo htmlspecialchars($matData['unit'] ?? ''); ?></td>
                <td style="color: green; font-weight: bolder;"><?php echo $in == 0 ? '-' : $in; ?></td>
                <td style="color: red; font-weight: bolder;"><?php echo $out == 0 ? '-' : $out; ?></td>
                <td style="color: blue; font-weight: bolder;"><?php echo $balance == 0 && $in == 0 && $out == 0 ? '-' : $balance; ?></td>
                <td>
                  <?php if ($isOutbound): ?>
                    <button type="button" class="btn btn-warning text-light btn-sm" data-bs-toggle="modal" data-bs-target="#updatemodal<?= (int)$data['id']; ?>">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                      </svg>
                    </button>
                  <?php endif; ?>
                </td>
              </tr>
              <?php if ($isOutbound): ?>
              <div class="modal fade" id="updatemodal<?= (int)$data['id']; ?>" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <form action="material_store_house_detail.php?id=<?= urlencode($id); ?>&pageno=<?= (int)$pageno; ?>" method="post" autocomplete="off">
                      <div class="modal-header bg-warning text-dark">
                        <h5 class="modal-title">Update Output</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                        <input type="hidden" name="movement_id" value="<?= (int)$data['id']; ?>">
                        <input type="hidden" name="material_id" value="<?= (int)$id; ?>">
                        <input type="hidden" name="pageno" value="<?= (int)$pageno; ?>">

                        <label>Date</label>
                        <input type="date" name="date" class="form-control" value="<?= htmlspecialchars($dateValue); ?>" required>

                        <?php if ($isLinkedOutput): ?>
                          <label>Stock To</label>
                          <select name="stock_to" class="form-control" required>
                            <?php
                            $stockToListed = false;
                            foreach ($coldstores as $coldstore):
                              if ((string)$coldstore['name'] === (string)$stockToValue) {
                                $stockToListed = true;
                              }
                            ?>
                              <option value="<?= htmlspecialchars($coldstore['name']); ?>" <?= (string)$coldstore['name'] === (string)$stockToValue ? 'selected' : ''; ?>><?= htmlspecialchars($coldstore['name']); ?></option>
                            <?php endforeach; ?>
                            <?php if ($stockToValue !== '' && !$stockToListed): ?>
                              <option value="<?= htmlspecialchars($stockToValue); ?>" selected><?= htmlspecialchars($stockToValue); ?></option>
                            <?php endif; ?>
                          </select>
                          <label>GatePass Voucher No</label>
                        <?php else: ?>
                          <label>Voucher No</label>
                        <?php endif; ?>
                        <input type="text" name="voucher_no" class="form-control" value="<?= htmlspecialchars($voucherValue); ?>" required>

                        <label>Description</label>
                        <input type="text" name="description" class="form-control" maxlength="255" value="<?= htmlspecialchars($data['description'] ?? ''); ?>">

                        <label>Out Quantity</label>
                        <input type="number" name="quantity" class="form-control" min="0.01" step="0.01" value="<?= htmlspecialchars((string)$out); ?>" required>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-warning" name="updatemovement">Update</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
              <?php endif; ?>
            <?php
              $no++;
            };
            ?>

          </table>
          <br>
          <div aria-label="Page navigation example" style="float:right;">
            <ul class="pagination">
              <li class="page-item"><a class="page-link" href="?id=<?= urlencode($id); ?>&pageno=1">First</a></li>
              <li class="page-item <?php if ($pageno <= 1) echo 'disabled'; ?>">
                <a class="page-link" href="<?php if ($pageno <= 1) echo '#';
                                            else echo "?id=" . urlencode($id) . "&pageno=" . ($pageno - 1); ?>">Previous</a>
              </li>
              <li class="page-item"><a class="page-link" href="#"><?php echo $pageno; ?></a></li>
              <li class="page-item <?php if ($pageno >= $total_pages) echo 'disabled'; ?>">
                <a class="page-link" href="<?php if ($pageno >= $total_pages) echo '#';
                                            else echo "?id=" . urlencode($id) . "&pageno=" . ($pageno + 1); ?>">Next</a>
              </li>
              <li class="page-item"><a class="page-link" href="?id=<?= urlencode($id); ?>&pageno=<?php echo $total_pages; ?>">Last</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>

  <?php $bootstrap->javascript(); ?>
</body>

</html>