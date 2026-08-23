<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();

$fullview = isset($_GET['fullview']) ? $_GET['fullview'] : '';
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>Admin | General Ledger</title>
  <?php
  $bootstrap->css();
  ?>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Caprasimo&family=Cormorant+Garamond:wght@300&family=Teko:wght@700&display=swap" rel="stylesheet">
  <style>
    /* Modern Tag Input & Autocomplete Styling */
    .tag-input-container {
      border: 1px solid #ced4da;
      border-radius: 0.375rem;
      padding: 6px 8px;
      background: #fff;
      display: flex;
      flex-wrap: wrap;
      gap: 6px;
      align-items: center;
      min-height: 45px;
      cursor: text;
      position: relative;
    }

    .tag-input-container:focus-within {
      border-color: #ffc107;
      box-shadow: 0 0 0 0.25rem rgba(255, 193, 7, 0.25);
    }

    .account-tag {
      background-color: #e9ecef;
      color: #212529;
      padding: 4px 8px;
      border-radius: 4px;
      font-size: 13px;
      display: inline-flex;
      align-items: center;
      gap: 6px;
      border: 1px solid #dee2e6;
    }

    .account-tag .remove-tag {
      cursor: pointer;
      font-weight: bold;
      color: #dc3545;
    }

    .account-tag .remove-tag:hover {
      color: #bd2130;
    }

    .tag-search-input {
      border: none;
      outline: none;
      flex-grow: 1;
      padding: 4px;
      font-size: 14px;
      min-width: 120px;
    }

    .autocomplete-dropdown {
      position: absolute;
      top: 100%;
      left: 0;
      right: 0;
      background: #fff;
      border: 1px solid #ced4da;
      border-radius: 0 0 0.375rem 0.375rem;
      max-height: 200px;
      overflow-y: auto;
      z-index: 1050;
      display: none;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .autocomplete-item {
      padding: 8px 12px;
      font-size: 14px;
      cursor: pointer;
    }

    .autocomplete-item:hover {
      background-color: #f8f9fa;
      color: #0d6efd;
    }
  </style>
</head>

<body>
  <div class="row m-0">
    <div class="sidebarcol" id="sidebar">
      <?php
      include 'sidebar.php';
      ?>
    </div>
    <div class="contentcol" id="content">
      <?php require 'navbar.php'; ?>
      <div class="card">
        <div class="card-header bg-warning text-light">
          <form action="" class="d-inline" method="post">
            <?php
            if (isset($_POST['searchgeneralledger'])) {
              $ac_codes_param = isset($_POST['ac_codes']) ? (is_array($_POST['ac_codes']) ? implode(',', $_POST['ac_codes']) : $_POST['ac_codes']) : '';
            ?>
              <a href="export.php?table_name=general_ledger&searchgeneralledger=true&date_from=<?= urlencode($_POST['date_from'] ?? ''); ?>&date_to=<?= urlencode($_POST['date_to'] ?? ''); ?>&ac_code=<?= urlencode($ac_codes_param) ?>" class="btn btn-sm ms-2 btn-success float-end">Export</a>
            <?php
            } else {
            ?>
              <a href="export.php?table_name=general_ledger" class="btn btn-sm ms-2 btn-success float-end">Export</a>
            <?php
            }
            ?>
          </form>
          <button type="button" class="btn btn-primary btn-sm float-end" data-bs-toggle="modal" data-bs-target="#reportsmodal">Reports</button>
          <h5>General Ledger</h5>
        </div>
        <div class="card-body">
          <?php
          if ($fullview === 'true' || $_SERVER['REQUEST_METHOD'] === 'POST') :
            include 'general_ledger_table.php';
          endif;
          ?>
        </div>
      </div>

      <!-- Reports Modal with Interactive Tag Input -->
      <div class="modal fade" id="reportsmodal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-md">
          <div class="modal-content" style="margin-top:70px !important;">
            <div class="modal-header bg-warning text-light">
              <h1 class="modal-title fs-5">General Ledger Reports</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="general_ledger.php" method="post" id="ledgerReportForm">
              <div class="modal-body">
                <div class="row mb-3">
                  <div class="col-6">
                    <label class="small fw-bold">Date From</label>
                    <input type="date" name="date_from" class="form-control inpv2">
                  </div>
                  <div class="col-6">
                    <label class="small fw-bold">Date To</label>
                    <input type="date" name="date_to" class="form-control inpv2">
                  </div>
                </div>
                <div class="row">
                  <div class="col-12">
                    <label class="small fw-bold mb-1">Search & Select Accounts</label>

                    <!-- Tag Container Box -->
                    <div class="tag-input-container" id="tagContainer">
                      <input type="text" class="tag-search-input" id="accountSearchInput" placeholder="Type account name or code...">
                      <div class="autocomplete-dropdown" id="autocompleteDropdown"></div>
                    </div>

                    <!-- Hidden inputs will be dynamically appended here for form submission -->
                    <div id="hiddenInputsContainer"></div>

                    <small class="text-muted d-block mt-1">Type to search, click to add accounts as tags. Leave empty to view all.</small>
                  </div>
                </div>
              </div>
              <div class="modal-footer">
                <a href="general_ledger.php?fullview=true" class="btn btn-warning btn-sm float-start">Full View</a>
                <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" name="searchgeneralledger" class="btn btn-success btn-sm">Search</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- PHP Database accounts embedded safely into JS array -->
  <?php
  $accodesstmt = $pdo->prepare("SELECT code, name FROM accodes ORDER BY code ASC");
  $accodesstmt->execute();
  $allcodes = $accodesstmt->fetchAll(PDO::FETCH_ASSOC);
  ?>
  <script>
    const availableAccounts = [
      <?php foreach ($allcodes as $acc) { ?> {
          code: "<?= htmlspecialchars($acc['code']); ?>",
          name: "<?= htmlspecialchars($acc['code'] . ' — ' . $acc['name']); ?>"
        },
      <?php } ?>
    ];
  </script>

  <?php
  $bootstrap->javascript();
  ?>
  <script type="text/javascript">
    $(document).ready(function() {
      <?php if ($_SERVER['REQUEST_METHOD'] !== 'POST' && $fullview !== 'true') : ?>
        var reportsModal = new bootstrap.Modal(document.getElementById('reportsmodal'));
        reportsModal.show();
        $('#table').hide();
      <?php endif; ?>

      const searchInput = $('#accountSearchInput');
      const dropdown = $('#autocompleteDropdown');
      const tagContainer = $('#tagContainer');
      const hiddenInputsContainer = $('#hiddenInputsContainer');

      let selectedCodes = new Set();

      // Focus input when clicking container
      tagContainer.on('click', function() {
        searchInput.focus();
      });

      // Filter and show dropdown on input
      searchInput.on('input', function() {
        const query = $(this).val().toLowerCase().trim();
        dropdown.empty();

        if (query.length === 0) {
          dropdown.hide();
          return;
        }

        const filtered = availableAccounts.filter(acc =>
          !selectedCodes.has(acc.code) &&
          (acc.code.toLowerCase().includes(query) || acc.name.toLowerCase().includes(query))
        );

        if (filtered.length > 0) {
          filtered.forEach(acc => {
            const item = $(`<div class="autocomplete-item"></div>`).text(acc.name);
            item.on('click', function() {
              addTag(acc.code, acc.name);
              searchInput.val('');
              dropdown.hide();
              searchInput.focus();
            });
            dropdown.append(item);
          });
          dropdown.show();
        } else {
          dropdown.hide();
        }
      });

      // Hide dropdown when clicking outside
      $(document).on('click', function(e) {
        if (!$(e.target).closest('#tagContainer').length) {
          dropdown.hide();
        }
      });

      function addTag(code, name) {
        if (selectedCodes.has(code)) return;
        selectedCodes.add(code);

        // Create visual tag badge
        const tag = $(`<span class="account-tag"></span>`).text(name);
        const removeBtn = $('<span class="remove-tag">&times;</span>');

        removeBtn.on('click', function(e) {
          e.stopPropagation();
          tag.remove();
          selectedCodes.delete(code);
          $(`#hidden_${code.replace(/[/\\.]/g, '_')}`).remove();
        });

        tag.append(removeBtn);

        // FIXED: Insert before the input properly without breaking container layout
        searchInput.before(tag);

        // Create hidden input for form post submission
        const safeId = code.replace(/[/\\.]/g, '_');
        const hiddenInput = `<input type="hidden" name="ac_codes[]" value="${code}" id="hidden_${safeId}">`;
        hiddenInputsContainer.append(hiddenInput);
      }
    });
  </script>
</body>

</html>