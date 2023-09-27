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
    <table class="table table-hover table-bordered table-striped">
      <tr>
        <th>No</th>
        <th>Date</th>
        <th>Voucher No</th>
        <th>Account Name</th>
        <th>Debit</th>
        <th>Credit</th>
      </tr>
      <?php
      $date = date('Y-m-d');
      $stmt = $pdo->prepare("SELECT * FROM transaction WHERE date='$date'");
      $stmt->execute();
      $datas = $stmt->fetchall();
      foreach ($datas as $data) {
        ?>
        <form class="" action="" method="post">
            <tr>
              <td><?php if($data['id'] != 0){ echo $data['id']; } ?></td>
              <td><?php if($data['date'] != 0){ echo date('d-m-Y', strtotime($data['date'])); } ?></td>
              <td><?php if($data['voucher_no'] != 0){ echo $data['voucher_no']; } ?></td>
              <td><?php if($data['ac_code'] != 0){ echo $data['ac_code']; } ?></td>
              <td><?php if($data['debit'] != 0){ echo $data['debit']; } ?></td>
              <td><?php if($data['credit'] != 0){ echo $data['credit']; } ?></td>
            </tr>
        </form>
        <?php
        $date = $data['date'];
      }
      $totaldebitstmt = $pdo->prepare("SELECT SUM(debit) AS total FROM transaction WHERE date='$date'");
      $totaldebitstmt->execute();
      $totaldebitdata = $totaldebitstmt->fetch(PDO::FETCH_ASSOC);
      $totalcreditstmt = $pdo->prepare("SELECT SUM(credit) AS total FROM transaction WHERE date='$date'");
      $totalcreditstmt->execute();
      $totalcreditdata = $totalcreditstmt->fetch(PDO::FETCH_ASSOC);
       ?>
       <tr style="font-weight:bold;">
         <td colspan="4">Balance</td>
         <td style="<?php if($totaldebitdata['total'] != $totalcreditdata['total']){ echo "color:red;"; } ?>"><?php echo $totaldebitdata['total']; ?></td>
         <td style="<?php if($totaldebitdata['total'] != $totalcreditdata['total']){ echo "color:red;"; } ?>"><?php echo $totalcreditdata['total']; ?></td>
       </tr>
    </table>
    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
