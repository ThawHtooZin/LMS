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
    /* body {
      font-family: 'Inter', sans-serif;
      background-color: #f8f9fa;
    } */
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
    /* Center text and title inside SweetAlert modal */
    .swal-modal {
      text-align: center !important;
    }
    .swal-title, .swal-text {
      text-align: center !important;
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

  <!-- Dynamic SweetAlert Notifications -->
  <script type="text/javascript">
    <?php if (!empty($_GET['status']) && $_GET['status'] == 'success') : ?>
      swal('Success', 'Operation completed successfully.', 'success');
    <?php elseif (!empty($_GET['status']) && $_GET['status'] == 'error') : 
      $msg = $_GET['msg'] ?? '';
      $errorText = 'An error occurred during execution.';
      if ($msg === 'invalid_password') {
        $errorText = 'Authentication failed: Incorrect admin password.';
      } elseif ($msg === 'missing_credentials') {
        $errorText = 'Please provide your admin password to authorize the restore.';
      } elseif ($msg === 'invalid_file_type') {
        $errorText = 'Invalid file format. Please upload a valid .sql file.';
      } elseif ($msg === 'upload_failed') {
        $errorText = 'File upload failed. Please try again.';
      } elseif ($msg === 'restore_failed') {
        $errorText = 'Failed to restore database. Please check your MySQL binary/file path.';
      }
    ?>
      swal('Execution Failed', '<?= $errorText ?>', 'error');
    <?php endif; ?>
  </script>

  <div class="row">
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

                <!-- Single Table Export (Maintenance Warning) -->
                <div class="col-md-6">
                  <div class="action-tile p-3 h-100 d-flex align-items-center justify-content-between">
                    <div>
                      <h6 class="fw-semibold mb-1 text-dark">Export Single Table</h6>
                      <p class="text-muted small mb-0">Select and download data from a single database table.</p>
                    </div>
                    <button type="button" class="btn btn-secondary btn-sm px-3 fw-semibold" onclick="showUnderMaintenanceAlert('Export Single Table')">Select Table</button>
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

                <!-- CSV / Excel Import (Maintenance Warning) -->
                <div class="col-md-6">
                  <div class="action-tile p-3 h-100 d-flex align-items-center justify-content-between">
                    <div>
                      <h6 class="fw-semibold mb-1 text-dark">Import CSV / Excel Data</h6>
                      <p class="text-muted small mb-0">Bulk upload rows into a targeted table using CSV format.</p>
                    </div>
                    <button type="button" class="btn btn-secondary btn-sm px-3 fw-semibold" onclick="showUnderMaintenanceAlert('CSV / Excel Import')">Import CSV</button>
                  </div>
                </div>

              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>

  <!-- MODAL 1: Restore SQL File & Authorization -->
  <div class="modal fade" id="restoreModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content border-0 shadow">
        <div class="modal-header border-bottom py-3">
          <h6 class="modal-title fw-bold text-dark">Restore Database Snapshot</h6>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form action="restore.php" method="post" enctype="multipart/form-data" id="restoreForm">
          <div class="modal-body p-4">
            
            <div class="alert alert-warning border small text-dark mb-3">
              <strong>Caution:</strong> Restoring an SQL file replaces existing conflicting tables and data.
            </div>

            <!-- SQL File Input -->
            <div class="mb-3">
              <label class="form-label small fw-semibold text-dark">SQL File (.sql)</label>
              <input type="file" name="sql_file" id="sql_file" class="form-control form-control-sm" accept=".sql" required>
            </div>

            <!-- Admin Password Authentication -->
            <div class="mb-3">
              <label class="form-label small fw-semibold text-dark">Admin Password Authorization</label>
              <input type="password" name="admin_password" id="admin_password" class="form-control form-control-sm" placeholder="Enter password to authorize" required>
            </div>

          </div>
          <div class="modal-footer border-top py-2">
            <button type="button" class="btn btn-light btn-sm text-secondary" data-bs-dismiss="modal">Cancel</button>
            <button type="submit" class="btn btn-danger btn-sm fw-semibold" id="restoreSubmitBtn">Authorize & Restore</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <!-- MODAL 2: Separate Loading Spinner Modal -->
  <div class="modal fade" id="loadingModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered modal-sm">
      <div class="modal-content border-0 shadow text-center p-4">
        <div class="d-flex justify-content-center mb-3">
          <div class="spinner-border text-danger" role="status" style="width: 2.5rem; height: 2.5rem;">
            <span class="visually-hidden">Loading...</span>
          </div>
        </div>
        <h6 class="fw-bold text-dark mb-1">Restoring Database</h6>
        <p class="text-muted small mb-0">Please wait, executing SQL script...</p>
      </div>
    </div>
  </div>

  <?php $bootstrap->javascript(); ?>

  <script>
    // 1. Alert Function for Under Maintenance Features
    function showUnderMaintenanceAlert(featureName) {
      swal(
        'Feature Under Maintenance',
        `The "${featureName}" feature is currently being updated and will be available soon.`,
        'warning'
      );
    }

    // 2. Pre-Validation AJAX & Loading Spinner Delay Logic
    document.getElementById('restoreForm').addEventListener('submit', function(e) {
      e.preventDefault();

      const form = this;
      const formData = new FormData(form);
      formData.append('check_auth_only', '1');

      // Verify password via AJAX first before showing loader
      fetch('restore.php', {
        method: 'POST',
        body: formData
      })
      .then(response => response.json())
      .then(data => {
        if (!data.success) {
          // If password validation fails, show SweetAlert error immediately
          swal('Execution Failed', data.message, 'error');
        } else {
          // Hide form modal
          const restoreModalEl = document.getElementById('restoreModal');
          const restoreModal = bootstrap.Modal.getInstance(restoreModalEl) || new bootstrap.Modal(restoreModalEl);
          restoreModal.hide();

          // Show separate loading spinner modal
          const loadingModal = new bootstrap.Modal(document.getElementById('loadingModal'));
          loadingModal.show();

          // Hold spinner for 3 seconds before restoring database
          setTimeout(() => {
            const executeData = new FormData(form);
            executeData.append('execute_restore', '1');

            fetch('restore.php', {
              method: 'POST',
              body: executeData
            })
            .then(res => res.json())
            .then(resData => {
              if (resData.success) {
                window.location.href = 'backupandrestore.php?status=success';
              } else {
                window.location.href = 'backupandrestore.php?status=error&msg=' + (resData.msg || 'restore_failed');
              }
            })
            .catch(() => {
              window.location.href = 'backupandrestore.php?status=error&msg=restore_failed';
            });
          }, 3000);
        }
      })
      .catch(() => {
        swal('Execution Failed', 'An error occurred during verification.', 'error');
      });
    });
  </script>
</body>

</html>