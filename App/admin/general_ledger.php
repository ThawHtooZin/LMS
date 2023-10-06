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
      <div class="col-2" id="sidebar">
        <?php
        include 'sidebar.php';
        ?>
      </div>
      <div class="col-10" id="content">
        <div class="card">
          <div class="card-header bg-warning text-light">
            <button type="button" class="btn btn-default btn-sm" id="menu">
              <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
              </svg>
            </button>
            <h5>General Ledger</h5>
          </div>
          <div class="card-body">
            <table class="table table-bordered table-striped">
              <tr>
                <th>Date</th>
                <th>Voucher No</th>
                <th>Debit Account</th>
                <th>Debit</th>
                <th>Credit Account</th>
                <th>Cerdit</th>
                <th>Narration</th>
              </tr>
              <?php
              $gldatas = $query->selectall('general_ledger');
               ?>
              <?php foreach($gldatas as $gldata) : ?>
                <?php
                $debit_ac_code = $gldata['debit_ac_code'];
                $debitacnamestmt = $pdo->prepare("SELECT * FROM acname WHERE code_no='$debit_ac_code'");
                $debitacnamestmt->execute();
                $debitacname = $debitacnamestmt->fetch(PDO::FETCH_ASSOC);
                $credit_ac_code = $gldata['credit_ac_code'];
                $creditacnamestmt = $pdo->prepare("SELECT * FROM acname WHERE code_no='$credit_ac_code'");
                $creditacnamestmt->execute();
                $creditacname = $creditacnamestmt->fetch(PDO::FETCH_ASSOC);
                 ?>
                <tr>
                  <td><?php echo $gldata['date']; ?></td>
                  <td><?php echo $gldata['voucherno']; ?></td>
                  <td><?php echo $debitacname['ac_name']; ?></td>
                  <td><?php echo $gldata['debit']; ?></td>
                  <td><?php echo $creditacname['ac_name']; ?></td>
                  <td><?php echo $gldata['credit']; ?></td>
                  <td><?php echo $gldata['narration']; ?></td>
                </tr>
              <?php endforeach; ?>
            </table>
          </div>
        </div>
      </div>
    </div>
    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
