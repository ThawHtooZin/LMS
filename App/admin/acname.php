<?php
if (isset($_GET['action']) && $_GET['action'] == 'check_duplicate') {
  include '../../Controllers/query.ctr.php';
  $query = new Query();
  $table = $_GET['table'];
  $column = $_GET['column'];
  $value = $_GET['value'];
  echo $query->isDuplicate($table, $column, $value) ? '1' : '0';
  exit;
}
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
  <title>Admin | Chart of Accounts</title>
  <?php $bootstrap->css(); ?>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Caprasimo&family=Cormorant+Garamond:wght@300&family=Teko:wght@700&display=swap" rel="stylesheet">
  <style>
    .coa-header {
      cursor: pointer;
      background-color: #f8f9fa;
      font-weight: bold;
    }

    .coa-header:hover {
      background-color: #e2e6ea;
    }
  </style>
</head>

<body>
  <?php
  if (isset($_POST['addbtn'])) {
    $code_no = $_POST['code_no'];
    $actype = $_POST['ac_type'];
    $acname = $_POST['ac_name'];

    if (!str_contains($code_no, '4000/')) {
      $query->addacname($code_no, $actype, $acname);
    } else {
      echo "<script>swal('Warning!', 'Please create supplier in the Supplier page!', 'warning');</script>";
    }
  }

  if (isset($_POST['updatebutton'])) {
    $id = $_POST['id'];
    $code_no = $_POST['code_no'];
    $actype = $_POST['ac_type'];
    $acname = $_POST['ac_name'];
    $query->updateacname($code_no, $actype, $acname, $id);
  }

  if (isset($_POST['deletebutton'])) {
    $id = $_POST['id'];
    $query->deleteacname($id);
  }

  if (isset($_POST['replaceform'])) {
    $fromaccode = $_POST['from_accode'];
    $toaccode = $_POST['to_accode'];
    $query->replaceaccode($fromaccode, $toaccode);
  }
  ?>

  <div class="row">
    <div class="sidebarcol" id="sidebar">
      <?php include 'sidebar.php'; ?>
    </div>
    <div class="contentcol" id="content">
      <?php require 'navbar.php'; ?>

      <div class="card">
        <div class="card-header bg-info text-light d-flex justify-content-between align-items-center">
          <b style="font-size:18px;">Chart of Accounts (COA)</b>
          <div>
            <button type="button" class="btn btn-warning btn-sm text-dark fw-bold me-2" data-bs-toggle="modal" data-bs-target="#replacemodal">Replace A/C</button>
            <button type="button" class="btn btn-primary btn-sm text-light" data-bs-toggle="modal" data-bs-target="#addmodal">Add A/C Name</button>
          </div>
        </div>

        <div class="card-body">
          <!-- Global Search -->
          <form class="row mb-4" action="" method="post">
            <div class="col-md-4">
              <input type="text" name="search_query" class="form-control" placeholder="Search by Code or Name..." value="<?php echo isset($_POST['search_query']) ? $_POST['search_query'] : ''; ?>">
            </div>
            <div class="col-md-2">
              <button type="submit" name="searchbtn" class="btn btn-success w-100">Search</button>
            </div>
            <?php if (isset($_POST['searchbtn'])): ?>
              <div class="col-md-2">
                <a href="acname.php" class="btn btn-secondary w-100">Clear</a>
              </div>
            <?php endif; ?>
          </form>

          <!-- COA Accordion View -->
          <div class="accordion" id="coaAccordion">
            <?php
            // Fetch all account types to group the COA properly
            $actypestmt = $pdo->prepare("SELECT * FROM actype ORDER BY acid ASC");
            $actypestmt->execute();
            $actypes = $actypestmt->fetchAll();

            $isSearch = isset($_POST['searchbtn']) && !empty($_POST['search_query']);
            $searchQuery = $isSearch ? $_POST['search_query'] : '';

            foreach ($actypes as $index => $type):
              // Fetch accounts matching this type
              if ($isSearch) {
                $acstmt = $pdo->prepare("SELECT * FROM acname WHERE ac_type = :type_id AND (code_no LIKE :search OR ac_name LIKE :search) ORDER BY code_no ASC");
                $acstmt->execute([':type_id' => $type['acid'], ':search' => "%$searchQuery%"]);
              } else {
                $acstmt = $pdo->prepare("SELECT * FROM acname WHERE ac_type = :type_id ORDER BY code_no ASC");
                $acstmt->execute([':type_id' => $type['acid']]);
              }

              $accounts = $acstmt->fetchAll();
              $accountCount = count($accounts);

              // Only show categories that have accounts (or show all if not searching)
              if ($accountCount > 0 || !$isSearch):
            ?>
                <div class="accordion-item mb-2 border rounded">
                  <h2 class="accordion-header" id="heading<?= $type['acid']; ?>">
                    <button class="accordion-button <?= $isSearch ? '' : 'collapsed' ?>" type="button" data-bs-toggle="collapse" data-bs-target="#collapse<?= $type['acid']; ?>" aria-expanded="<?= $isSearch ? 'true' : 'false' ?>" aria-controls="collapse<?= $type['acid']; ?>">
                      <strong><?= $type['ac_type']; ?></strong>
                      <span class="badge bg-secondary ms-3"><?= $accountCount; ?> Accounts</span>
                    </button>
                  </h2>
                  <div id="collapse<?= $type['acid']; ?>" class="accordion-collapse collapse <?= $isSearch ? 'show' : '' ?>" aria-labelledby="heading<?= $type['acid']; ?>">
                    <div class="accordion-body p-0">
                      <table class="table table-hover table-striped m-0">
                        <thead class="table-light">
                          <tr>
                            <th width="20%">Code No</th>
                            <th width="60%">A/C Name</th>
                            <th width="20%" class="text-center">Action</th>
                          </tr>
                        </thead>
                        <tbody>
                          <?php if ($accountCount == 0): ?>
                            <tr>
                              <td colspan="3" class="text-center text-muted">No accounts found in this category.</td>
                            </tr>
                          <?php else: ?>
                            <?php foreach ($accounts as $data): ?>
                              <tr>
                                <td class="fw-bold text-primary"><?= $data['code_no']; ?></td>
                                <td><?= $data['ac_name']; ?></td>
                                <td class="text-center">
                                  <?php
                                  // Prevent modifying Control Accounts and Sub-ledgers directly from here
                                  if (str_contains($data['code_no'], '4000/') || str_contains($data['code_no'], '3300/')):
                                  ?>
                                    <span class="badge bg-danger">Locked (Sub-Ledger)</span>
                                  <?php else: ?>
                                    <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#updatemodal<?= $data['id']; ?>">Edit</button>
                                  <?php endif; ?>
                                </td>
                              </tr>

                              <!-- Edit Modal for this specific Account -->
                              <?php if (!str_contains($data['code_no'], '4000/') && !str_contains($data['code_no'], '3300/')): ?>
                                <div class="modal fade" id="updatemodal<?= $data['id']; ?>" tabindex="-1" aria-hidden="true">
                                  <div class="modal-dialog">
                                    <div class="modal-content">
                                      <form action="" method="post" autocomplete="off">
                                        <div class="modal-header bg-warning text-dark">
                                          <h5 class="modal-title">Edit Account: <?= $data['code_no']; ?></h5>
                                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                          <input type="hidden" name="id" value="<?= $data['id']; ?>">
                                          <input type="hidden" name="code_no" value="<?= $data['code_no']; ?>">

                                          <div class="mb-3">
                                            <label class="form-label">A/C Type</label>
                                            <select class="form-select" name="ac_type">
                                              <?php foreach ($actypes as $typeOption): ?>
                                                <option value="<?= $typeOption['acid']; ?>" <?= ($typeOption['acid'] == $data['ac_type']) ? 'selected' : ''; ?>>
                                                  <?= $typeOption['ac_type']; ?>
                                                </option>
                                              <?php endforeach; ?>
                                            </select>
                                          </div>
                                          <div class="mb-3">
                                            <label class="form-label">A/C Name</label>
                                            <input type="text" name="ac_name" class="form-control" value="<?= $data['ac_name']; ?>" required>
                                          </div>
                                        </div>
                                        <div class="modal-footer justify-content-between">
                                          <button type="submit" name="deletebutton" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this account?');">Delete</button>
                                          <div>
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                            <button type="submit" class="btn btn-success" name="updatebutton">Save Changes</button>
                                          </div>
                                        </div>
                                      </form>
                                    </div>
                                  </div>
                                </div>
                              <?php endif; ?>

                            <?php endforeach; ?>
                          <?php endif; ?>
                        </tbody>
                      </table>
                    </div>
                  </div>
                </div>
            <?php
              endif;
            endforeach;
            ?>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Add Account Modal -->
  <div class="modal fade" id="addmodal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
      <form action="" method="post">
        <div class="modal-content">
          <div class="modal-header bg-primary text-light">
            <h5 class="modal-title">Create New Account</h5>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="mb-3">
              <label class="form-label text-muted small">Select the financial bucket for this account</label>
              <select class="form-select" name="ac_type" required>
                <option value="" disabled selected>-- Select Account Type --</option>
                <?php foreach ($actypes as $typeOption): ?>
                  <option value="<?= $typeOption['acid']; ?>"><?= $typeOption['ac_type']; ?></option>
                <?php endforeach; ?>
              </select>
            </div>
            <div class="mb-3">
              <label class="form-label">Account Code</label>
              <input type="text" name="code_no" class="form-control" placeholder="e.g. 9100/050" oninput="validateInput('acname', 'code_no', this.value, 'code_error')" required>
              <span id="code_error" class="text-danger small"></span>
            </div>
            <div class="mb-3">
              <label class="form-label">Account Name</label>
              <input type="text" name="ac_name" class="form-control" placeholder="e.g. Server Hosting Expense" required>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
            <button type="submit" class="btn btn-success" name="addbtn">Create Account</button>
          </div>
        </div>
      </form>
    </div>
  </div>

  <!-- Replace Account Modal (Maintained from your original logic) -->
  <div class="modal fade" id="replacemodal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
      <form action="" method="post">
        <div class="modal-content">
          <div class="modal-header bg-warning text-dark">
            <h5 class="modal-title">Replace Account Code</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <p class="text-danger small">Warning: This will permanently merge all transactions from the old code to the new code across the entire database.</p>
            <div class="mb-3">
              <label class="form-label">From Account Code (Old)</label>
              <input type="text" name="from_accode" class="form-control" required>
            </div>
            <div class="mb-3">
              <label class="form-label">To Account Code (New)</label>
              <input type="text" name="to_accode" class="form-control" required>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
            <button type="submit" class="btn btn-danger" name="replaceform" onclick="return confirm('Are you absolutely sure you want to execute this database replacement?');">Execute Replacement</button>
          </div>
        </div>
      </form>
    </div>
  </div>

  <script>
    function validateInput(table, column, value, errorId) {
      if (value.length === 0) {
        document.getElementById(errorId).innerText = "";
        return;
      }
      fetch(`?action=check_duplicate&table=${table}&column=${column}&value=${encodeURIComponent(value)}`)
        .then(response => response.text())
        .then(data => {
          if (data === '1') {
            document.getElementById(errorId).innerText = "This code is already taken.";
          } else {
            document.getElementById(errorId).innerText = "";
          }
        });
    }
  </script>
  <?php $bootstrap->javascript(); ?>
</body>

</html>