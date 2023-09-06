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
    <?php

    if(isset($_POST['update'])){
      $country = $_POST['country'];
      $updateid = $_POST['id'];

      $query->updatecountry($country, $updateid);
    }

     ?>
    <div class="row">
      <div class="col-2">
        <?php
        include 'sidebar.php';
        ?>
      </div>
      <div class="col-10">
        <div class="card mt-1">
          <div class="card-header bg-warning text-secondary"  style="padding:-10px;">
            <b>Link Mark Limited (F-10)</b>
          </div>
          <div class="card-body">
            <table class="table table-hover table-striped table-bordered">
              <tr class="text-center">
                <th rowspan="2" style="padding-top:25px;">Date</th>
                <th colspan="4">Production</th>
                <th colspan="2">Loose In</th>
                <th colspan="2">Loose Out</th>
                <th>Total</th>
                <th rowspan="2" style="padding-top:25px;">%</th>
              </tr>
              <tr class="text-center">
                <th>PCS/Form-10</th>
                <th>MC</th>
                <th>KG</th>
                <th>Pcs</th>
                <th>Kg</th>
                <th>Pcs</th>
                <th>Kg</th>
                <th>Pcs</th>
                <th>Kg</th>
              </tr>
              <tr>
                <td>6-9-2023</td>
                <td>10</td>
                <td>20</td>
                <td>60</td>
                <td>10</td>
                <td>2</td>
                <td>6</td>
                <td></td>
                <td></td>
                <td>66</td>
                <td></td>
              </tr>
              <!-- <div class="modal fade" id="updatemodal<?php // echo $form7data['id']; ?>">
                <div class="modal-dialog" role="document">
                  <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
                    <div class="modal-header bg-warning text-light">
                      <h1 class="modal-title fs-5">Update Country</h1>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <form action="form_7.php" method="post">
                        <input type="hidden" name="id" value="<?php // echo $form7data['id']; ?>">
                      <div class="modal-body">
                        <label>Country</label>
                        <input type="text" name="country" class="form-control inpv2 mt-1">
                      </div>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                      <button type="submit" class="btn btn-warning" name="update">Update</button>
                    </div>
                  </form>
                  </div>
                </div>
              </div> -->
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
