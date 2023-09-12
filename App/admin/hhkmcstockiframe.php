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
    <title></title>
  </head>
  <?php
  $bootstrap->css();
  ?>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Caprasimo&family=Cormorant+Garamond:wght@300&family=Teko:wght@700&display=swap" rel="stylesheet">
  <body>
    <table class="table table-hover table-bordered table-striped">
      <tr>
        <th>Commondity</th>
        <th>Size</th>
        <th>Total Mc</th>
        <th>Action</th>
      </tr>
      <?php

      $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT commondity_id) FROM hhkmcstock");
      $commonditycountstmt->execute();
      $commonditycountdatas = $commonditycountstmt->fetchColumn();
      for ($i=0; $i < $commonditycountdatas; $i++) {
        $commonditystmt = $pdo->prepare("SELECT DISTINCT commondity_id FROM hhkmcstock");
        $commonditystmt->execute();
        $commonditydata = $commonditystmt->fetchall();
        $commondity_id = $commonditydata[$i]['commondity_id'];

        $stmt = $pdo->prepare("SELECT * FROM hhkmcstock WHERE commondity_id='$commondity_id' GROUP BY size");
      $stmt->execute();
      $datas = $stmt->fetchall();
      foreach ($datas as $hhkstockdata) {
        $item_id = $hhkstockdata['commondity_id'];
        $commonditydata = $query->select('item', $item_id, 'item_id');
        $size = $hhkstockdata['size'];
        $kg = $hhkstockdata['kg'];
        $sizestmt = $pdo->prepare("SELECT * FROM hhkmcstock WHERE size='$size' ORDER BY id DESC");
        $sizestmt->execute();
        $sizedata = $sizestmt->fetch(PDO::FETCH_ASSOC);
        $totalmcstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM hhkmcstock WHERE commondity_id='$commondity_id' AND size='$size'");
        $totalmcstmt->execute();
        $totalmc = $totalmcstmt->fetch(PDO::FETCH_ASSOC);
       ?>
      <tr>
        <td><?php echo $commonditydata['item_name']; ?></td>
        <td><?php echo $hhkstockdata['size']; ?></td>
        <td><?php echo $totalmc['total_mc']; ?></td>
        <td>
          <a href="hhkmc_stock_info.php?sizeinfo=<?php echo $hhkstockdata['size']; ?>&commondity=<?php echo $hhkstockdata['commondity_id']; ?>&kg=<?php echo $hhkstockdata['kg']; ?>" class="btn btn-info btn-sm text-light"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list-check" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3.854 2.146a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 3.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708L2 7.293l1.146-1.147a.5.5 0 0 1 .708 0zm0 4a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 0 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0z"/></svg></a>
        </td>
      </tr>
      <?php
      }
      }
       ?>
    </table>
    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
