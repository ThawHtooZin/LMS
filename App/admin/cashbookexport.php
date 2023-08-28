<?php

include '../../Controllers/database.db.php';

$stmt = $pdo->prepare("SELECT * FROM cashbook");
$stmt->execute();
$cashdatas = $stmt->fetchAll();

if($_GET['forment'] == 'excel'){
  header("Content-Type: application/xls");
  header("Content-Disposition: attachment; filename=CashBookDatas.xls");
  header("Pragma: no-cache");
  header("Expires: 0");

  ?>
  <table class="mt-5 table table-bordered table-striped rounded" border="1">
    <tr>
      <th>#</th>
      <th>Date</th>
      <th>Sr.No</th>
      <th>A/C Name</th>
      <th>Particular</th>
      <th>Debit</th>
      <th>Credit</th>
      <th>Balance</th>
    </tr>
    <?php
    foreach ($cashdatas as $cashdata) {
      ?>
    <tr>
      <td><?php echo $cashdata['id']; ?></td>
      <td><?php echo $cashdata['date']; ?></td>
      <td><?php echo $cashdata['serial_no']; ?></td>
      <td><?php echo $cashdata['ac_name']; ?></td>
      <td><?php echo $cashdata['particular']; ?></td>
      <td><?php if($cashdata['debit'] == 0){echo "";}else{echo $cashdata['debit'];}; ?></td>
      <td><?php if($cashdata['credit'] == 0){echo "";}else{echo $cashdata['credit'];}; ?></td>
      <td><?php echo $cashdata['balance']; ?></td>
    </tr>
    <?php
    }
    ?>
  </table>
  <?php
  exit();
}else{
  header('location:cashbook.php');
}

?>
