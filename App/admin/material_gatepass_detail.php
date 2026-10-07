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
    $_SESSION['gatepass_detail_flash'] = $query->updateMaterialGatepassDetail(
        (int)($_POST['movement_id'] ?? 0),
        $postedMaterial,
        (string)($_POST['location'] ?? ''),
        $_POST
    );
    header('Location: material_gatepass_detail.php?id=' . $postedMaterial . '&pageno=' . $postedPage);
    exit;
}

$updateResult = null;
if (!empty($_SESSION['gatepass_detail_flash']) && is_array($_SESSION['gatepass_detail_flash'])) {
    $updateResult = $_SESSION['gatepass_detail_flash'];
    unset($_SESSION['gatepass_detail_flash']);
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
            <?php include 'sidebar.php'; ?>
        </div>
        <div class="contentcol" id="content">
            <?php require 'navbar.php'; ?>
            <div class="card">
                <div class="card-header bg-primary text-light" style="padding:-10px;">
                    <?php
                    $id = $_GET['id'];
                    // Query Unified Products Table
                    $materialstmt = $pdo->prepare("SELECT id, name FROM products WHERE id=?");
                    $materialstmt->execute([$id]);
                    $material = $materialstmt->fetch(PDO::FETCH_ASSOC);
                    ?>
                    <h5>Manage Store {<?= htmlspecialchars($material['name'] ?? 'Unknown'); ?>} Detail</h5>
                    <a href="material_gatepass.php" class="float-end btn btn-secondary btn-sm">Back</a>
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
                            <th>Description</th>
                            <th>Action</th>
                            <th>In</th>
                            <th>Out</th>
                            <th>Balance</th>
                            <th>Edit</th>
                        </tr>

                        <?php
                        $stock_to = $_SESSION['tabs'] ?? '';
                        $stmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE material_id=? AND stock_to = ? ORDER BY id");
                        $stmt->execute([$id, $stock_to]);
                        $rawResult = $stmt->fetchAll();
                        $total_pages = max(1, ceil(count($rawResult) / $numOfrecs));

                        $pairStmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE material_id = ?");
                        $pairStmt->execute([$id]);
                        $pairRows = $pairStmt->fetchAll(PDO::FETCH_ASSOC);

                        $stmt = $pdo->prepare("SELECT * FROM stock_output_group WHERE material_id=? AND stock_to = ? ORDER BY id LIMIT ?, ?");
                        $stmt->bindValue(1, $id);
                        $stmt->bindValue(2, $stock_to);
                        $stmt->bindValue(3, $offset, PDO::PARAM_INT);
                        $stmt->bindValue(4, $numOfrecs, PDO::PARAM_INT);
                        $stmt->execute();
                        $datas = $stmt->fetchAll(PDO::FETCH_ASSOC);

                        $no = $offset + 1;
                        $balance = 0;

                        foreach ($datas as $data) {
                            // Extract precisely from the new in_quantity and out_quantity schema
                            $in = (float)($data['in_quantity'] ?? 0);
                            $out = (float)($data['out_quantity'] ?? 0);
                            $balance += $in - $out;
                            $actionKey = strtolower(trim((string)($data['action'] ?? '')));
                            $dateValue = (!empty($data['date']) && $data['date'] != '0000-00-00') ? $data['date'] : '';
                            $qtyValue = $in > 0 ? $in : $out;
                            $isTransferOut = $actionKey === 'transfer' && $out > 0 && $in <= 0;
                            $showStockTo = ($actionKey === '' && $in > 0 && $out <= 0) || ($actionKey === 'transfer' && $in > 0 && $out <= 0);
                            $transferTo = '';
                            if ($isTransferOut) {
                                $pair = $query->matchGatepassTransferPair($data, $pairRows);
                                $transferTo = is_array($pair) ? (string)($pair['stock_to'] ?? '') : '';
                            }
                            $modalTitle = 'Update Movement';
                            if ($actionKey === 'use') $modalTitle = 'Update Use';
                            elseif ($actionKey === 'transfer') $modalTitle = 'Update Transfer';
                            elseif ($actionKey === 'return') $modalTitle = 'Update Return';
                            elseif ($actionKey === 'damaged') $modalTitle = 'Update Damaged';
                            elseif ($in > 0) $modalTitle = 'Update Receipt';
                        ?>

                            <tr>
                                <td><?php echo $no; ?></td>
                                <td><?php echo !empty($data['date']) && $data['date'] != '0000-00-00' ? date('d-m-Y', strtotime($data['date'])) : ''; ?></td>
                                <td><?php echo htmlspecialchars($data['voucher_no'] ?? ''); ?></td>
                                <td><?php echo htmlspecialchars($data['description'] ?? ''); ?></td>
                                <td><?php echo htmlspecialchars($data['action'] ?? ''); ?></td>
                                <td style="color: green; font-weight: bolder;"><?php echo ($in == 0) ? '-' : $in; ?></td>
                                <td style="color: red; font-weight: bolder;"><?php echo ($out == 0) ? '-' : $out; ?></td>
                                <td style="color: blue; font-weight: bolder;"><?php echo ($balance == 0) ? '-' : $balance; ?></td>
                                <td>
                                    <button type="button" class="btn btn-warning text-light btn-sm" data-bs-toggle="modal" data-bs-target="#updatemodal<?= (int)$data['id']; ?>">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                            <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                                        </svg>
                                    </button>
                                </td>
                            </tr>
                            <div class="modal fade" id="updatemodal<?= (int)$data['id']; ?>" tabindex="-1" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <form action="material_gatepass_detail.php?id=<?= urlencode($id); ?>&pageno=<?= (int)$pageno; ?>" method="post" autocomplete="off">
                                            <div class="modal-header bg-warning text-dark">
                                                <h5 class="modal-title"><?= htmlspecialchars($modalTitle); ?></h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <input type="hidden" name="movement_id" value="<?= (int)$data['id']; ?>">
                                                <input type="hidden" name="material_id" value="<?= (int)$id; ?>">
                                                <input type="hidden" name="location" value="<?= htmlspecialchars($stock_to); ?>">
                                                <input type="hidden" name="pageno" value="<?= (int)$pageno; ?>">

                                                <label>Date</label>
                                                <input type="date" name="date" class="form-control" value="<?= htmlspecialchars($dateValue); ?>" required>

                                                <label>Voucher No</label>
                                                <input type="text" name="voucher_no" class="form-control" value="<?= htmlspecialchars($data['voucher_no'] ?? ''); ?>" required>

                                                <?php if ($isTransferOut): ?>
                                                    <label>Transfer To</label>
                                                    <select name="transfer_to" class="form-control" required>
                                                        <?php
                                                        $destListed = false;
                                                        foreach ($coldstores as $coldstore):
                                                            if ((string)$coldstore['name'] === $transferTo) $destListed = true;
                                                        ?>
                                                            <option value="<?= htmlspecialchars($coldstore['name']); ?>" <?= (string)$coldstore['name'] === $transferTo ? 'selected' : ''; ?>><?= htmlspecialchars($coldstore['name']); ?></option>
                                                        <?php endforeach; ?>
                                                        <?php if ($transferTo !== '' && !$destListed): ?>
                                                            <option value="<?= htmlspecialchars($transferTo); ?>" selected><?= htmlspecialchars($transferTo); ?></option>
                                                        <?php endif; ?>
                                                    </select>
                                                <?php elseif ($showStockTo): ?>
                                                    <label>Stock To</label>
                                                    <select name="stock_to" class="form-control" required>
                                                        <?php
                                                        $destListed = false;
                                                        foreach ($coldstores as $coldstore):
                                                            if ((string)$coldstore['name'] === (string)$stock_to) $destListed = true;
                                                        ?>
                                                            <option value="<?= htmlspecialchars($coldstore['name']); ?>" <?= (string)$coldstore['name'] === (string)$stock_to ? 'selected' : ''; ?>><?= htmlspecialchars($coldstore['name']); ?></option>
                                                        <?php endforeach; ?>
                                                        <?php if ($stock_to !== '' && !$destListed): ?>
                                                            <option value="<?= htmlspecialchars($stock_to); ?>" selected><?= htmlspecialchars($stock_to); ?></option>
                                                        <?php endif; ?>
                                                    </select>
                                                <?php endif; ?>

                                                <label>Description</label>
                                                <input type="text" name="description" class="form-control" maxlength="255" value="<?= htmlspecialchars($data['description'] ?? ''); ?>">

                                                <label>Quantity</label>
                                                <input type="number" name="quantity" class="form-control" min="0.01" step="0.01" value="<?= htmlspecialchars((string)$qtyValue); ?>" required>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                <button type="submit" class="btn btn-warning" name="updatemovement">Update</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
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
                            <li class="page-item"><a class="page-link" href="?id=<?= urlencode($id); ?>&pageno=<?php echo $total_pages; ?>">Last</a> </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Data Add Modal (Disabled to enforce unified Products table) -->
    <div class="modal fade" id="addmodal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header bg-secondary text-light">
                    <h5 class="modal-title" id="addmodellabel">Create New Material</h5>
                    <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="h3">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <label>Material Name</label>
                    <input type="text" class="form-control" disabled>
                    <label>Description</label>
                    <textarea class="form-control" disabled></textarea>
                    <small class="text-danger mt-2 d-block">Note: Please add new Materials via the Products module instead.</small>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <?php $bootstrap->javascript(); ?>
</body>

</html>