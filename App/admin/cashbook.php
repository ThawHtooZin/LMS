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
  <body>
    <div class="row">
      <div class="col-2">
        <?php
        include 'sidebar.php';
        ?>
      </div>
      <div class="col-10">
        <div class="container rounded bg-warning text-light mt-3">
          <h1>Cash Book</h1>

        </div>
        <div class="container mt-5">
          <table class="table table-striped table-bordered">
            <tr>
              <th>Date</th>
              <th>Description</th>
              <th>Debit</th>
              <th>Creadit</th>
              <th>Action</th>
            </tr>
            <?php
            $cashbookdatas =  $query->selectall('cashbook');
            foreach ($cashbookdatas as $cashbookdata) {
            ?>
            <tr>
              <td><?php  echo $cashbookdata['date']; ?></td>
              <td><?php  echo $cashbookdata['description']; ?></td>
              <td><?php  echo $cashbookdata['debit']; ?></td>
              <td><?php  echo $cashbookdata['credit']; ?></td>
              <td>
                <button type="submit" class="btn btn-warning"></button>
                <button type="submit" class="btn btn-danger"></button>
              </td>
            </tr>
            <?php
          }
            ?>
          </table>
        </div>
      </div>
    </div>
    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
