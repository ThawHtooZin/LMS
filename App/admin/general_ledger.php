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
  <title>Admin | Dashboard</title>
  <?php
  $bootstrap->css();
  ?>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Caprasimo&family=Cormorant+Garamond:wght@300&family=Teko:wght@700&display=swap" rel="stylesheet">
</head>

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
        <div class="card-header bg-warning text-light">
          <form action="" class="d-inline" method="post">
            <?php
            if (isset($_POST['searchgeneralledger'])) {
            ?>
              <a href="export.php?table_name=general_ledger&searchgeneralledger=true&date_from=<?= $_POST['date_from']; ?>&date_to=<?= $_POST['date_to']; ?>&ac_code=<?= $_POST['ac_code'] ?>" class="btn btn-sm ms-2 btn-success float-end">Export</a>
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
          <?php if ($_GET['fullview'] ?? '' == 'true' || $_SERVER['REQUEST_METHOD'] == 'POST') :
            include 'general_ledger_table.php';
          endif; ?>
        </div>
      </div>
      <div class="modal fade" id="reportsmodal">
        <div class="modal-dialog">
          <div class="modal-content" style=" margin-top:70px !important;">
            <div class="modal-header bg-warning text-light">
              <h1 class="modal-title fs-5">General Ledger Reports</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="general_ledger.php" method="post">
              <div class="modal-body">
                <div class="row">
                  <div class="col">
                    <label>Date From</label>
                    <input type="date" name="date_from" class="form-control inpv2 mb-2">
                  </div>
                  <div class="col">
                    <label>Date To</label>
                    <input type="date" name="date_to" class="form-control inpv2 mb-2">
                  </div>
                </div>
                <div class="row">
                  <div class="col">
                    <label>Account No</label>
                    <input type="text" name="ac_code" class="form-control inpv2 mb-2" id="ac_code">
                  </div>
                  <div class="col">
                    <label>Account Name</label>
                    <div class="" id="ac_name">
                      <input type="text" disabled class="form-control inpv2 mb-2">
                    </div>
                  </div>
                </div>
              </div>
              <div class="modal-footer">
                <a href="general_ledger.php?fullview=true" class="btn btn-warning float-start"> Full View </a>
                <button type="button" name="button" class="btn btn-secondary" data-bs-toggle="modal">Cancel</button>
                <button type="submit" name="searchgeneralledger" class="btn btn-success">Search</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <?php
  $bootstrap->javascript();
  ?>
  <script type="text/javascript">
    let loadnumber = 1;
    $(document).ready(function() {
      $('#ac_code').on('keyup', function() {
        var ac_codepost = $('#ac_code').val();
        var type = "";
        if (ac_codepost.includes('/')) {
          ac_code = ac_codepost.split('/');
          type = "slash";
        } else {
          ac_code = ac_codepost.split('-');
          type = "dash";
        }
        firstpart = ac_code[0];
        lastpart = ac_code[1];
        $('#ac_name').load('ac_name.php', {
          FirstPart: firstpart,
          LastPart: JSON.stringify(lastpart),
          Type: type
        });
      });
      $(window).on('load', function() {
        // Updated PHP condition: Only show modal if it's NOT a POST request AND fullview is NOT true
        <?php if ($_SERVER['REQUEST_METHOD'] != 'POST' && ($_GET['fullview'] ?? '') !== 'true') : ?>
          $('#reportsmodal').modal('show');
          $('#table').hide();
        <?php endif; ?>
      });
    });
  </script>
</body>

</html>