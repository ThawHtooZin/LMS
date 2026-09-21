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
    <title>Manage Bank Accounts</title>
    <?php echo $bootstrap->css(); ?>
</head>

<body>
    <?php echo $bootstrap->javascriptindex(); ?>
    <div class="row">
        <div class="sidebarcol" id="sidebar">
            <?php include 'sidebar.php'; ?>
        </div>
        <div class="contentcol" id="content">
            <?php require 'navbar.php'; ?>
            <div class="card shadow-sm border-0 mt-3 mx-2">
                <div class="card-header bg-primary text-light d-flex justify-content-between align-items-center">
                    <h5 class="mb-0 fw-bold">Manage System Bank Accounts</h5>
                    <button type="button" class="btn btn-light btn-sm fw-bold text-primary" data-bs-toggle="modal" data-bs-target="#addmodal">
                        + New Bank Account
                    </button>
                </div>
                <div class="card-body table-responsive">
                    <?php
                    if (isset($_POST['deletebutton'])) {
                        $query->deleteSystemBank($_POST['deleteid'], $_POST['account_code']);
                    }
                    if (isset($_POST['updatebutton'])) {
                        $query->updateSystemBank(
                            $_POST['updateid'],
                            $_POST['old_code'],
                            $_POST['code'],
                            $_POST['name'],
                            $_POST['account_type'],
                            $_POST['swift_code'],
                            $_POST['bank_branch_address'],
                            $_POST['company_name'],
                            $_POST['company_address'],
                            $_POST['usd'],
                            $_POST['branch_name']
                        );
                    }
                    if (isset($_POST['addbutton'])) {
                        $query->addSystemBank(
                            $_POST['code'],
                            $_POST['name'],
                            $_POST['account_type'],
                            $_POST['swift_code'],
                            $_POST['bank_branch_address'],
                            $_POST['company_name'],
                            $_POST['company_address'],
                            $_POST['usd'],
                            $_POST['branch_name']
                        );
                    }
                    ?>

                    <table class="table table-bordered table-striped table-hover rounded">
                        <thead class="table-dark">
                            <tr>
                                <th>Code</th>
                                <th>Bank Name</th>
                                <th>Account Type</th>
                                <th>USD A/C</th>
                                <th>Company Name</th>
                                <th>Swift Code</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $stmt = $pdo->prepare("SELECT * FROM bankdetail WHERE account_code IS NOT NULL ORDER BY account_code ASC");
                            $stmt->execute();
                            $banks = $stmt->fetchAll(PDO::FETCH_ASSOC);

                            foreach ($banks as $data): ?>
                                <tr>
                                    <td class="fw-bold text-primary"><?php echo htmlspecialchars($data['account_code']); ?></td>
                                    <td class="fw-bold"><?php echo htmlspecialchars($data['bank_name']); ?></td>
                                    <td><?php echo htmlspecialchars($data['account_type'] ?? '-'); ?></td>
                                    <td><?php echo htmlspecialchars($data['usd'] ?? '-'); ?></td>
                                    <td><?php echo htmlspecialchars($data['company_name'] ?? '-'); ?></td>
                                    <td><?php echo htmlspecialchars($data['swift_code'] ?? '-'); ?></td>
                                    <td>
                                        <button type="button" class="btn btn-warning btn-sm text-dark fw-bold" data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $data['id']; ?>">Edit</button>
                                        <form action="" method="post" style="display: inline !important;">
                                            <input type="hidden" name="deleteid" value="<?php echo $data['id']; ?>">
                                            <input type="hidden" name="account_code" value="<?php echo $data['account_code']; ?>">
                                            <button type="submit" name="deletebutton" class="btn btn-sm btn-danger fw-bold" onclick="return confirm('Delete this Bank Account?');">Delete</button>
                                        </form>
                                    </td>
                                </tr>

                                <!-- Edit Modal -->
                                <div class="modal fade" id="updatemodal<?php echo $data['id']; ?>" tabindex="-1">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <div class="modal-header bg-warning text-dark">
                                                <h5 class="modal-title fw-bold">Edit Bank Account</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                            </div>
                                            <form action="" method="post" autocomplete="off">
                                                <div class="modal-body">
                                                    <input type="hidden" name="updateid" value="<?php echo $data['id']; ?>">
                                                    <input type="hidden" name="old_code" value="<?php echo $data['account_code']; ?>">

                                                    <h6 class="border-bottom pb-2 text-primary fw-bold">System Data</h6>
                                                    <div class="row mb-3">
                                                        <div class="col-md-4">
                                                            <label class="fw-bold small">A/C Code</label>
                                                            <input type="text" name="code" class="form-control" value="<?php echo htmlspecialchars($data['account_code']); ?>" required>
                                                        </div>
                                                        <div class="col-md-8">
                                                            <label class="fw-bold small">Bank Name</label>
                                                            <input type="text" name="name" class="form-control" value="<?php echo htmlspecialchars($data['bank_name']); ?>" required>
                                                        </div>
                                                    </div>

                                                    <h6 class="border-bottom pb-2 mt-4 text-primary fw-bold">Logistics & Additional Details (Optional)</h6>
                                                    <div class="row mb-3">
                                                        <div class="col-md-4">
                                                            <label class="fw-bold small">Account Type</label>
                                                            <input type="text" name="account_type" class="form-control" placeholder="e.g. Checking" value="<?php echo htmlspecialchars($data['account_type'] ?? ''); ?>">
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label class="fw-bold small">USD A/C</label>
                                                            <input type="text" name="usd" class="form-control" value="<?php echo htmlspecialchars($data['usd'] ?? ''); ?>">
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label class="fw-bold small">Swift Code</label>
                                                            <input type="text" name="swift_code" class="form-control" value="<?php echo htmlspecialchars($data['swift_code'] ?? ''); ?>">
                                                        </div>
                                                    </div>

                                                    <div class="row mb-3">
                                                        <div class="col-md-6">
                                                            <label class="fw-bold small">Company Name</label>
                                                            <input type="text" name="company_name" class="form-control" value="<?php echo htmlspecialchars($data['company_name'] ?? ''); ?>">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="fw-bold small">Branch Name</label>
                                                            <input type="text" name="branch_name" class="form-control" value="<?php echo htmlspecialchars($data['branch_name'] ?? ''); ?>">
                                                        </div>
                                                    </div>

                                                    <div class="row mb-3">
                                                        <div class="col-md-6">
                                                            <label class="fw-bold small">Company Address</label>
                                                            <textarea name="company_address" class="form-control" rows="2"><?php echo htmlspecialchars($data['company_address'] ?? ''); ?></textarea>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label class="fw-bold small">Bank Branch Address</label>
                                                            <textarea name="bank_branch_address" class="form-control" rows="2"><?php echo htmlspecialchars($data['bank_branch_address'] ?? ''); ?></textarea>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary fw-bold" data-bs-dismiss="modal">Close</button>
                                                    <button type="submit" class="btn btn-warning fw-bold text-dark" name="updatebutton">Save Changes</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Add Modal -->
    <div class="modal fade" id="addmodal" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary text-light">
                    <h5 class="modal-title fw-bold">New Bank Account</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <form action="" method="post" autocomplete="off">
                    <div class="modal-body">
                        <h6 class="border-bottom pb-2 text-primary fw-bold">System Data</h6>
                        <div class="row mb-3">
                            <div class="col-md-4">
                                <label class="fw-bold small">A/C Code</label>
                                <input type="text" name="code" class="form-control" placeholder="e.g. 100-BANK" required>
                            </div>
                            <div class="col-md-8">
                                <label class="fw-bold small">Bank Name</label>
                                <input type="text" name="name" class="form-control" placeholder="e.g. KBZ Bank" required>
                            </div>
                        </div>

                        <h6 class="border-bottom pb-2 mt-4 text-primary fw-bold">Logistics & Additional Details (Optional)</h6>
                        <div class="row mb-3">
                            <div class="col-md-4">
                                <label class="fw-bold small">Account Type</label>
                                <input type="text" name="account_type" class="form-control" placeholder="e.g. Checking, Savings">
                            </div>
                            <div class="col-md-4">
                                <label class="fw-bold small">USD A/C</label>
                                <input type="text" name="usd" class="form-control">
                            </div>
                            <div class="col-md-4">
                                <label class="fw-bold small">Swift Code</label>
                                <input type="text" name="swift_code" class="form-control">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label class="fw-bold small">Company Name</label>
                                <input type="text" name="company_name" class="form-control" placeholder="e.g. ProTech">
                            </div>
                            <div class="col-md-6">
                                <label class="fw-bold small">Branch Name</label>
                                <input type="text" name="branch_name" class="form-control">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label class="fw-bold small">Company Address</label>
                                <textarea name="company_address" class="form-control" rows="2"></textarea>
                            </div>
                            <div class="col-md-6">
                                <label class="fw-bold small">Bank Branch Address</label>
                                <textarea name="bank_branch_address" class="form-control" rows="2"></textarea>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary fw-bold" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary fw-bold" name="addbutton">Save</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <?php echo $bootstrap->javascript(); ?>
</body>

</html>