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
            <h5>Ledger Records</h5>
          </div>
          <div class="card-body">
            <!-- NavLinks -->
            <div class="text-center mb-3">
              <form action="" method="post">
              <?php
              $actypestmt = $pdo->prepare("SELECT DISTINCT ac_type FROM acname");
              $actypestmt->execute();
              $actypedatas = $actypestmt->fetchall();
              foreach ($actypedatas as $actypedata) :
                if(isset($_POST["{$actypedata['ac_type']}"])){
                  $_SESSION['ledgerrecordtabs'] = "{$actypedata['ac_type']}";
                }
                $actypename = $query->select("actype", $actypedata['ac_type'], 'acid');
                ?>
                <button type="submit" class="pb-2 pt-2 ps-3 pe-3 text-dark rounded <?= $actypename['ac_type']; ?>" style="text-decoration:none; border:none;" name="<?= $actypedata['ac_type']; ?>"><?= $actypename['ac_type']; ?></button>
                <?php
              endforeach;
              ?>
              </form>
            </div>
            <!-- NavLinks -->
            <!-- Tables -->
            <?php
            foreach ($actypedatas as $actypedata) :

              if(isset($_POST["{$actypedata['ac_type']}"])){
                $_SESSION['ledgerrecordtabs'] = "{$actypedata['ac_type']}";
              }
              $actypename = $query->select("actype", $actypedata['ac_type'], 'acid');
              ?>
            <table class="table taber-hover table-striped <?= $actypename['ac_type']; ?>table hide">
              <tr>
                <th>Date</th>
                <th>Vr. No</th>
                <th>A/C Name</th>
                <th>Debit</th>
                <th>Credit</th>
                <th>Balance</th>
              </tr>
              <?php
              $acid = $actypedata['ac_type'];
              $stmt = $pdo->prepare("SELECT * FROM general_ledger WHERE acid='$acid'");
              $stmt->execute();
              $datas = $stmt->fetchall();
              foreach ($datas as $data) :
                $acname = $query->select('acname', $data['ac_code'], 'code_no');
                ?>
                <tr>
                  <td><?= $data['date']; ?></td>
                  <td><?= $data['voucherno']; ?></td>
                  <td><?= $acname['ac_name']; ?></td>
                  <td><?= $data['debit']; ?></td>
                  <td><?= $data['credit']; ?></td>
                  <td><?= $data['balance']; ?></td>
                </tr>
                <?php
              endforeach;
               ?>
            </table>
            <?php
          endforeach;
          ?>
            <!-- Tables -->
          </div>
        </div>
    </div>
    <?php
    $bootstrap->javascript();
    ?>
    <script type="text/javascript">
      <?php
      foreach ($actypedatas as $actypedata) :
        $actypename = $query->select("actype", $actypedata['ac_type'], 'acid');
        if($_SESSION['ledgerrecordtabs'] == $actypedata['ac_type']){
          ?>
          $('.<?= $actypename['ac_type']; ?>').toggleClass('color');
          $('.<?= $actypename['ac_type']; ?>table').toggle();
          <?php
        }else{
          ?>
          $('.<?= $actypename['ac_type']; ?>').removeClass('color');
          $('.<?= $actypename['ac_type']; ?>table').hide();
          <?php
        }
      endforeach;
      ?>
    </script>
  </body>
</html>
