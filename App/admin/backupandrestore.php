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
  <title>Admin | Backup & Restore</title>
  <?php $bootstrap->css(); ?>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Inter', sans-serif;
      background-color: #f8f9fa;
    }
    .panel-card {
      background: #ffffff;
      border: 1px solid #eaecf0;
      border-radius: 8px;
    }
    .action-tile {
      background-color: #f8f9fa;
      border-radius: 6px;
      transition: background-color 0.2s ease;
    }
    .action-tile:hover {
      background-color: #f1f5f9;
    }
    .badge-soft {
      background-color: #e2e8f0;
      color: #334155;
      font-weight: 600;
      font-size: 0.75rem;
    }
  </style>
</head>

<body>
  <?php
  if (isset($_POST['backuponetable'])) {
    $tablename = $_POST['tablename'];
  ?>
    <script>
      window.location.href = 'backup/Tablebackup/backupeachtable.php?tablename=<?= $tablename ?>';
    </script>
  <?php
  }
  ?>

  <script type="text/javascript">
    <?php if (!empty($_GET['status']) && $_GET['status'] == 'success') : ?>
      swal('Success', 'Operation completed successfully.', 'success');
    <?php elseif (!empty($_GET['status']) && $_GET['status'] == 'error') : ?>
      swal('Error', 'An error occurred during execution.', 'error');
    <?php endif; ?>
  </script>

  <div class="row g-0">
    <div class="sidebarcol" id="sidebar">
      <?php include 'sidebar.php'; ?>
    </div>
    <div class="contentcol" id="content">
      <?php require 'navbar.php'; ?>

      <div class="container-fluid p-4">
        
        <!-- Header Panel -->
        <div class="d-flex align-items-center justify-content-between mb-4 pb-3 border-bottom px-3">
          <div>
            <h4 class="fw-bold mb-1 text-dark">Database Maintenance & Storage</h4>
            <p class="text-muted small mb-0">Manage database backups, table exports, SQL restores, and CSV imports.</p>
          </div>
          <div>
            <span class="badge badge-soft px-3 py-2 text-uppercase">System Status: Active</span>
          </div>
        </div>

        <!-- ROW 1: EXPORT & BACKUP OPERATIONS (OUTBOUND) -->
        <div class="row g-4 mb-4 px-3">
          <div class="col-12">
            <div class="panel-card p-4">
              <div class="d-flex align-items-center justify-content-between mb-3 border-bottom pb-2">
                <h5 class="fw-bold text-dark text-uppercase tracking-wide m-0">Backup & Export Options (Outbound)</h5>
                <span class="text-muted small">Data Extraction</span>
              </div>
              <div class="row g-3">
                
                <!-- Full DB Export -->
                <div class="col-md-6">
                  <div class="action-tile p-3 h-100 d-flex align-items-center justify-content-between">
                    <div>
                      <h6 class="fw-semibold mb-1 text-dark">Backup Full Database</h6>
                      <p class="text-muted small mb-0">Download a complete .SQL backup of schemas and data.</p>
                    </div>
                    <a href="backup.php" class="btn btn-dark btn-sm px-3 fw-semibold">Backup Database</a>
                  </div>
                </div>

                <!-- Single Table Export -->
                <div class="col-md-6">
                  <div class="action-tile p-3 h-100 d-flex align-items-center justify-content-between">
                    <div>
                      <h6 class="fw-semibold mb-1 text-dark">Export Single Table</h6>
                      <p class="text-muted small mb-0">Select and download data from a single database table.</p>
                    </div>
                    <button type="button" class="btn btn-secondary btn-sm px-3 fw-semibold" data-bs-target="#backuponetable" data-bs-toggle="modal">Select Table</button>
                  </div>
                </div>

              </div>
            </div>
          </div>
        </div>

        <!-- ROW 2: RESTORE & IMPORT OPERATIONS (INBOUND) -->
        <div class="row g-4 px-3">
          <div class="col-12">
            <div class="panel-card p-4">
              <div class="d-flex align-items-center justify-content-between mb-3 border-bottom pb-2">
                <h5 class="fw-bold text-dark text-uppercase tracking-wide m-0">Restore & Import Options (Inbound)</h5>
                <span class="text-muted small">Data Insertion</span>
              </div>
              <div class="row g-3">
                
                <!-- Full DB Restore -->
                <div class="col-md-6">
                  <div class="action-tile p-3 h-100 d-flex align-items-center justify-content-between">
                    <div>
                      <h6 class="fw-semibold mb-1 text-dark">Restore Database Snapshot</h6>
                      <p class="text-muted small mb-0">Upload a target .SQL file to overwrite existing data.</p>
                    </div>
                    <button type="button" class="btn btn-outline-dark btn-sm px-3 fw-semibold" data-bs-toggle="modal" data-bs-target="#restoreModal">Restore SQL File</button>
                  </div>
                </div>

                <!-- CSV / Excel Import -->
                <div class="col-md-6">
                  <div class="action-tile p-3 h-100 d-flex align-items-center justify-content-between">
                    <div>
                      <h6 class="fw-semibold mb-1 text-dark">Import CSV / Excel Data</h6>
                      <p class="text-muted small mb-0">Bulk upload rows into a targeted table using CSV format.</p>
                    </div>
                    <button type="button" class="btn btn-secondary btn-sm px-3 fw-semibold" data-bs-target="#importfromexcel" data-bs-toggle="modal">Import CSV</button>
                  </div>
                </div>

              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>

  <!-- MODAL: Restore SQL File -->
  <div class="modal fade" id="restoreModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content border-0 shadow">
        <div class="modal-header border-bottom py-3">
          <h6 class="modal-title fw-bold text-dark">Restore Database Snapshot</h6>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form action="restore.php" method="post" enctype="multipart/form-data">
          <div class="modal-body p-4">
            <div class="alert alert-light border small text-secondary mb-3">
              <strong>Caution:</strong> Restoring an SQL file replaces conflicting database tables and data.
            </div>
            <div class="mb-3">
              <label class="form-label small fw-semibold text-dark">SQL File (.sql)</label>
              <input type="file" name="sql_file" class="form-control form-control-sm" accept=".sql" required>
            </div>
          </div>
          <div class="modal-footer border-top py-2">
            <button type="button" class="btn btn-light btn-sm text-secondary" data-bs-dismiss="modal">Cancel</button>
            <button type="submit" class="btn btn-dark btn-sm fw-semibold" name="restorebtn">Execute Restore</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <!-- MODAL: Import Excel/CSV -->
  <div class="modal fade" id="importfromexcel" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content border-0 shadow">
        <div class="modal-header border-bottom py-3">
          <h6 class="modal-title fw-bold text-dark">Import Data (CSV)</h6>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form action="excelimport.php" method="post" enctype="multipart/form-data">
          <div class="modal-body p-4">
            <div class="mb-3">
              <label class="form-label small fw-semibold text-dark">Target Table</label>
              <select name="importtable" class="form-select form-select-sm text-capitalize" required>
                <?php
                $stmt = $pdo->prepare("SHOW TABLES");
                $stmt->execute();
                $tablesdatas = $stmt->fetchAll(PDO::FETCH_NUM);

                foreach ($tablesdatas as $tablesdata) {
                  echo "<option value=\"{$tablesdata[0]}\">{$tablesdata[0]}</option>";
                }
                ?>
              </select>
            </div>
            <div class="mb-3">
              <label class="form-label small fw-semibold text-dark">File (.csv)</label>
              <input type="file" name="excelfile" class="form-control form-control-sm" required>
            </div>
          </div>
          <div class="modal-footer border-top py-2">
            <button type="button" class="btn btn-light btn-sm text-secondary" data-bs-dismiss="modal">Cancel</button>
            <button type="submit" class="btn btn-dark btn-sm fw-semibold" name="excelimportbtn">Run Import</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <!-- MODAL: Single Table Backup -->
  <div class="modal fade" id="backuponetable" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content border-0 shadow">
        <div class="modal-header border-bottom py-3">
          <h6 class="modal-title fw-bold text-dark">Select Table to Export</h6>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form action="" method="post">
          <div class="modal-body p-4">
            <div class="mb-3">
              <label class="form-label small fw-semibold text-dark">Available Tables</label>
              <select name="tablename" class="form-select form-select-sm text-capitalize" required>
                <?php
                $stmt = $pdo->prepare("SHOW TABLES");
                $stmt->execute();
                $tablesdatas = $stmt->fetchAll(PDO::FETCH_NUM);

                foreach ($tablesdatas as $tablesdata) {
                  echo "<option value=\"{$tablesdata[0]}\">{$tablesdata[0]}</option>";
                }
                ?>
              </select>
            </div>
          </div>
          <div class="modal-footer border-top py-2">
            <button type="button" class="btn btn-light btn-sm text-secondary" data-bs-dismiss="modal">Cancel</button>
            <button type="submit" class="btn btn-dark btn-sm fw-semibold" name="backuponetable">Download Table File</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <?php $bootstrap->javascript(); ?>
</body>

</html>