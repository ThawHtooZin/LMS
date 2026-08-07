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

// Map the exact Xero Types to their overarching Classes for the backend
$type_to_class = [
  'Current Asset' => 'Assets',
  'Fixed Asset' => 'Assets',
  'Inventory' => 'Assets',
  'Non-current Asset' => 'Assets',
  'Prepayment' => 'Assets',
  'Equity' => 'Equity',
  'Depreciation' => 'Expenses',
  'Direct Costs' => 'Expenses',
  'Expense' => 'Expenses',
  'Overhead' => 'Expenses',
  'Current Liability' => 'Liabilities',
  'Liability' => 'Liabilities',
  'Non-current Liability' => 'Liabilities',
  'Other Income' => 'Revenue',
  'Revenue' => 'Revenue',
  'Sales' => 'Revenue'
];
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>Manage Chart of Accounts</title>
  <?php $bootstrap->css(); ?>
</head>

<body>
  <div class="row">
    <div class="sidebarcol" id="sidebar">
      <?php include 'sidebar.php'; ?>
    </div>
    <div class="contentcol" id="content">
      <?php require 'navbar.php'; ?>
      <div class="card">
        <div class="card-header bg-warning text-light" style="padding:-10px;">
          <b>Chart of Accounts</b>
        </div>
        <div class="card-body">
          <?php
          if (isset($_POST['deletebutton'])) {
            $deleteid = $_POST['deleteid'];
            $query->deleteaccode($deleteid);
          }
          if (isset($_POST['updatebutton'])) {
            $id = $_POST['updateid'];
            $type = $_POST['type'];
            $code = $_POST['code'];
            $name = $_POST['name'];
            $description = $_POST['description'];
            $class = $type_to_class[$type]; // Auto-assign class based on Xero grouping

            $query->updateaccode($id, $code, $name, $type, $class, $description);
          }
          if (isset($_POST['addbutton'])) {
            $type = $_POST['type'];
            $code = $_POST['code'];
            $name = $_POST['name'];
            $description = $_POST['description'];
            $class = $type_to_class[$type]; // Auto-assign class based on Xero grouping

            $query->addaccode($code, $name, $type, $class, $description);
          }
          ?>

          <?php
          // GET LOGIC FOR TABS & PAGINATION
          $active_tab = isset($_GET['tab']) ? $_GET['tab'] : 'All';
          $pageno = !empty($_GET['pageno']) ? $_GET['pageno'] : 1;
          $numOfrecs = 12;
          $offset = ($pageno - 1) * $numOfrecs;

          $keyword = isset($_GET['search_keyword']) ? trim($_GET['search_keyword']) : '';

          // Maintain filters across pagination
          $qs = "?tab=" . urlencode($active_tab);
          if (!empty($keyword)) $qs .= "&search_keyword=" . urlencode($keyword);
          if (isset($_GET['searchaccount'])) $qs .= "&searchaccount=Search";
          ?>

          <form action="coa.php" method="get" class="d-inline">
            <input type="hidden" name="tab" value="<?php echo htmlspecialchars($active_tab); ?>">
            <input type="text" name="search_keyword" class="form-control d-inline" placeholder="Search Code or Name" value="<?php echo htmlspecialchars($keyword); ?>" style="width:25%; padding: 0px 5px !important; margin: 0 !important; font-size: 15px !important;">
            <button type="submit" name="searchaccount" class="btn btn-info btn-sm">Search</button>
            <?php if (!empty($keyword)): ?>
              <a href="coa.php?tab=<?php echo $active_tab; ?>" class="btn btn-secondary btn-sm">Clear</a>
            <?php endif; ?>
          </form>

          <button type="button" class="btn btn-success float-end btn-sm mb-3" data-bs-toggle="modal" data-bs-target="#addmodal">
            Add Account
          </button>

          <div class="clearfix"></div>

          <!-- XERO STYLE TABS -->
          <ul class="nav nav-tabs mb-3">
            <li class="nav-item">
              <a class="nav-link <?php echo ($active_tab == 'All') ? 'active fw-bold' : 'text-dark'; ?>" href="coa.php?tab=All">All Accounts</a>
            </li>
            <li class="nav-item">
              <a class="nav-link <?php echo ($active_tab == 'Assets') ? 'active fw-bold' : 'text-dark'; ?>" href="coa.php?tab=Assets">Assets</a>
            </li>
            <li class="nav-item">
              <a class="nav-link <?php echo ($active_tab == 'Liabilities') ? 'active fw-bold' : 'text-dark'; ?>" href="coa.php?tab=Liabilities">Liabilities</a>
            </li>
            <li class="nav-item">
              <a class="nav-link <?php echo ($active_tab == 'Equity') ? 'active fw-bold' : 'text-dark'; ?>" href="coa.php?tab=Equity">Equity</a>
            </li>
            <li class="nav-item">
              <a class="nav-link <?php echo ($active_tab == 'Expenses') ? 'active fw-bold' : 'text-dark'; ?>" href="coa.php?tab=Expenses">Expenses</a>
            </li>
            <li class="nav-item">
              <a class="nav-link <?php echo ($active_tab == 'Revenue') ? 'active fw-bold' : 'text-dark'; ?>" href="coa.php?tab=Revenue">Revenue</a>
            </li>
          </ul>

          <table class="table table-bordered table-striped rounded">
            <tr>
              <th width="15%">Code</th>
              <th width="40%">Name</th>
              <th width="25%">Type</th>
              <th width="20%">Action</th>
            </tr>
            <?php
            // DYNAMIC QUERY EXECUTION based on Xero Tabs
            $where = "1=1";
            if ($active_tab !== 'All') {
              $where .= " AND class = '$active_tab'";
            }
            if ($keyword != '') {
              $where .= " AND (code LIKE '%$keyword%' OR name LIKE '%$keyword%')";
            }

            $stmt = $pdo->prepare("SELECT * FROM accodes WHERE $where ORDER BY code ASC");
            $stmt->execute();
            $rawResult = $stmt->fetchAll();
            $total_pages = ceil(count($rawResult) / $numOfrecs);
            if ($total_pages == 0) $total_pages = 1;

            $stmt = $pdo->prepare("SELECT * FROM accodes WHERE $where ORDER BY code ASC LIMIT $offset, $numOfrecs");
            $stmt->execute();
            $accounts = $stmt->fetchAll();
            ?>

            <?php foreach ($accounts as $data) { ?>
              <tr>
                <td class="fw-bold text-primary"><?php echo htmlspecialchars($data['code']); ?></td>
                <td>
                  <?php echo htmlspecialchars($data['name']); ?><br>
                  <small class="text-muted"><?php echo htmlspecialchars($data['description']); ?></small>
                </td>
                <td><?php echo htmlspecialchars($data['type']); ?></td>
                <td>
                  <button type="button" class="btn btn-warning btn-sm text-light" data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $data['id']; ?>">Edit</button>
                  <form action="coa.php" method="post" style="display: inline !important;">
                    <input type="hidden" name="deleteid" value="<?php echo $data['id']; ?>">
                    <button type="submit" name="deletebutton" class="btn btn-sm btn-danger">Delete</button>
                  </form>
                </td>
              </tr>

              <!-- Data Update Modal -->
              <div class="modal fade" id="updatemodal<?php echo $data['id']; ?>" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header bg-warning text-light">
                      <h5 class="modal-title">Update Account</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="coa.php" method="post" autocomplete="off">
                      <div class="modal-body">
                        <input type="hidden" name="updateid" value="<?php echo $data['id']; ?>">

                        <label>Account Type</label>
                        <select name="type" class="form-control" required>
                          <optgroup label="ASSETS">
                            <option value="Current Asset" <?php if ($data['type'] == 'Current Asset') echo 'selected'; ?>>Current Asset</option>
                            <option value="Fixed Asset" <?php if ($data['type'] == 'Fixed Asset') echo 'selected'; ?>>Fixed Asset</option>
                            <option value="Inventory" <?php if ($data['type'] == 'Inventory') echo 'selected'; ?>>Inventory</option>
                            <option value="Non-current Asset" <?php if ($data['type'] == 'Non-current Asset') echo 'selected'; ?>>Non-current Asset</option>
                            <option value="Prepayment" <?php if ($data['type'] == 'Prepayment') echo 'selected'; ?>>Prepayment</option>
                          </optgroup>
                          <optgroup label="EQUITY">
                            <option value="Equity" <?php if ($data['type'] == 'Equity') echo 'selected'; ?>>Equity</option>
                          </optgroup>
                          <optgroup label="EXPENSES">
                            <option value="Depreciation" <?php if ($data['type'] == 'Depreciation') echo 'selected'; ?>>Depreciation</option>
                            <option value="Direct Costs" <?php if ($data['type'] == 'Direct Costs') echo 'selected'; ?>>Direct Costs</option>
                            <option value="Expense" <?php if ($data['type'] == 'Expense') echo 'selected'; ?>>Expense</option>
                            <option value="Overhead" <?php if ($data['type'] == 'Overhead') echo 'selected'; ?>>Overhead</option>
                          </optgroup>
                          <optgroup label="LIABILITIES">
                            <option value="Current Liability" <?php if ($data['type'] == 'Current Liability') echo 'selected'; ?>>Current Liability</option>
                            <option value="Liability" <?php if ($data['type'] == 'Liability') echo 'selected'; ?>>Liability</option>
                            <option value="Non-current Liability" <?php if ($data['type'] == 'Non-current Liability') echo 'selected'; ?>>Non-current Liability</option>
                          </optgroup>
                          <optgroup label="REVENUE">
                            <option value="Other Income" <?php if ($data['type'] == 'Other Income') echo 'selected'; ?>>Other Income</option>
                            <option value="Revenue" <?php if ($data['type'] == 'Revenue') echo 'selected'; ?>>Revenue</option>
                            <option value="Sales" <?php if ($data['type'] == 'Sales') echo 'selected'; ?>>Sales</option>
                          </optgroup>
                        </select>
                        <br>

                        <label>Code <span class="text-muted" style="font-size: 12px;">(A unique code/number for this account)</span></label>
                        <input type="text" name="code" class="form-control" value="<?php echo htmlspecialchars($data['code']); ?>" required>
                        <br>

                        <label>Name <span class="text-muted" style="font-size: 12px;">(A short title for this account)</span></label>
                        <input type="text" name="name" class="form-control" value="<?php echo htmlspecialchars($data['name']); ?>" required>
                        <br>

                        <label>Description <span class="text-muted" style="font-size: 12px;">(optional)</span></label>
                        <textarea name="description" class="form-control" rows="3"><?php echo htmlspecialchars($data['description']); ?></textarea>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-warning" name="updatebutton">Save</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
              <!-- Update Modal -->
            <?php }; ?>
          </table>
          <br>

          <div aria-label="Page navigation example" style="float:right;">
            <ul class="pagination">
              <li class="page-item"><a class="page-link" href="<?php echo $qs; ?>&pageno=1">First</a></li>
              <li class="page-item <?php if ($pageno <= 1) {
                                      echo 'disabled';
                                    } ?>">
                <a class="page-link" href="<?php if ($pageno <= 1) {
                                              echo '#';
                                            } else {
                                              echo $qs . "&pageno=" . ($pageno - 1);
                                            } ?>">Previous</a>
              </li>
              <li class="page-item"><a class="page-link" href="#"><?php echo $pageno; ?></a></li>
              <li class="page-item <?php if ($pageno >= $total_pages) {
                                      echo 'disabled';
                                    }; ?>">
                <a class="page-link" href="<?php if ($pageno >= $total_pages) {
                                              echo '#';
                                            } else {
                                              echo $qs . "&pageno=" . ($pageno + 1);
                                            } ?>">Next</a>
              </li>
              <li class="page-item"><a class="page-link" href="<?php echo $qs; ?>&pageno=<?php echo $total_pages; ?>">Last</a> </li>
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
          <h5 class="modal-title">Add New Account</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form action="coa.php" method="post" autocomplete="off">
          <div class="modal-body">
            <label>Account Type</label>
            <select name="type" class="form-control" required>
              <option value="" disabled selected>-- Select Type --</option>
              <optgroup label="ASSETS">
                <option value="Current Asset">Current Asset</option>
                <option value="Fixed Asset">Fixed Asset</option>
                <option value="Inventory">Inventory</option>
                <option value="Non-current Asset">Non-current Asset</option>
                <option value="Prepayment">Prepayment</option>
              </optgroup>
              <optgroup label="EQUITY">
                <option value="Equity">Equity</option>
              </optgroup>
              <optgroup label="EXPENSES">
                <option value="Depreciation">Depreciation</option>
                <option value="Direct Costs">Direct Costs</option>
                <option value="Expense">Expense</option>
                <option value="Overhead">Overhead</option>
              </optgroup>
              <optgroup label="LIABILITIES">
                <option value="Current Liability">Current Liability</option>
                <option value="Liability">Liability</option>
                <option value="Non-current Liability">Non-current Liability</option>
              </optgroup>
              <optgroup label="REVENUE">
                <option value="Other Income">Other Income</option>
                <option value="Revenue">Revenue</option>
                <option value="Sales">Sales</option>
              </optgroup>
            </select>
            <br>

            <label>Code <span class="text-muted" style="font-size: 12px;">(A unique code/number for this account)</span></label>
            <input type="text" name="code" class="form-control" oninput="validateInput('accodes', 'code', this.value, 'code_error')" required>
            <span id="code_error" class="text-danger small"></span>
            <br>

            <label>Name <span class="text-muted" style="font-size: 12px;">(A short title for this account)</span></label>
            <input type="text" name="name" class="form-control" required>
            <br>

            <label>Description <span class="text-muted" style="font-size: 12px;">(optional)</span></label>
            <textarea name="description" class="form-control" rows="3"></textarea>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
            <button type="submit" class="btn btn-success" name="addbutton">Save</button>
          </div>
        </form>
      </div>
    </div>
  </div>
  <!-- Add Modal -->

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
  <?php
  $bootstrap->javascript();
  ?>
</body>

</html>