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
        <div class="card mt-3 text-light">
          <div class="card-header  bg-warning">
            <h4>Cash Book</h4>
            <br>
          </div>
          <div class="card-body">
            <button type="button" class="btn btn-outline-success float-end" data-bs-toggle="modal" data-bs-target="#addmodal">
              Add Debit Or Credit
            </button>
            <table class="table table-striped table-bordered mt-5">
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
    </div>
<!-- Add Modal -->
<div class="modal fade" id="addmodal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Debit Or Credit</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form class="" action="index.html" method="post">
      <div class="modal-body">
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-success">Add</button>
      </div>
    </form>
    </div>
  </div>
</div>
    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
