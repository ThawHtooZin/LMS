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
  </head>
  <?php
  $bootstrap->css();
  ?>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Caprasimo&family=Cormorant+Garamond:wght@300&family=Teko:wght@700&display=swap" rel="stylesheet">
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
            <button type="button" class="btn btn-primary btn-sm float-end" data-bs-toggle="modal" data-bs-target="#reportsmodal">Reports</button>
            <h5>General Ledger</h5>
          </div>
          <div class="card-body">
            <table class="table table-bordered table-striped" id="table">
              <tr>
                <th>Date</th>
                <th>Voucher No</th>
                <th>Account Name</th>
                <th>Description</th>
                <th>Debit</th>
                <th>Cerdit</th>
                <th>Balance</th>
              </tr>
              <?php
              if (isset($_POST['searchgeneralledger'])) {
                $date_from = $_POST['date_from'];
                $date_to = $_POST['date_to'];
                $ac_code = $_POST['ac_code'];

                $gldatas = $query->searchgeneralledger($date_from, $date_to, $ac_code);
              }else{
                $gldatas = $query->selectall('general_ledger');
              }
               ?>
              <?php foreach($gldatas as $gldata) : ?>
                <?php
                $ac_code = $gldata['ac_code'];
                $acname = $query->select('acname', $ac_code, 'code_no');
                 ?>
                <tr>
                  <td><?php echo date('d/m/Y', strtotime($gldata['date'])); ?></td>
                  <td><?php echo $gldata['voucherno']; ?></td>
                  <td><?php echo $acname['ac_name']; ?></td>
                  <td><?php echo $gldata['narration']; ?></td>
                  <td><?php echo $gldata['debit']; ?></td>
                  <td><?php echo $gldata['credit']; ?></td>
                  <td><?php echo $gldata['balance']; ?></td>
                </tr>
              <?php endforeach; ?>
            </table>
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
                <button type="button" name="button" class="btn btn-secondary" data-bs-toggle="modal">Cancel</button>
                <button type="submit" name="searchgeneralledger" class="btn btn-success">Serach</button>
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
    $(document).ready(function(){
      $('#ac_code').on('keyup', function(){
        var ac_codepost = $('#ac_code').val();
        ac_code = ac_codepost.split('-');
        firstpart = ac_code[0];
        lastpart = ac_code[1];
        $('#ac_name').load('ac_name.php', {
          FirstPart : firstpart,
          LastPart: JSON.stringify(lastpart)
        });
      });
      $('#reportsmodal').on('hidden.bs.modal', function(){
        $('#table').show();
      })
    });
    $(window).on('load', function(){
      $('#reportsmodal').modal('show');
      $('#table').hide();
    });
    </script>
  </body>
</html>
