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
    
    if(isset($_POST['backuponetable'])){
      $tablename = $_POST['tablename'];
      ?>
        <script>window.location.href='backup/Tablebackup/backupeachtable.php?tablename=<?= $tablename ?>';</script>
      <?php
    }
    
    ?>
    <script type="text/javascript">
    <?php
    if(!empty($_GET['status']) && $_GET['status'] == 'success'){
      ?>
      swal('Success!', 'Successfully Backuped the database', 'success');
      <?php

    }
    ?>
    </script>
    <?php
    if(isset($_POST['confirm'])){
      $destinationDirectory = $_POST['location'];


    }
     ?>
    <div class="row">
      <div class="sidebarcol" id="sidebar">
        <?php
        include 'sidebar.php';
        ?>
      </div>
      <div class="contentcol" id="content">
        <?php require 'navbar.php'; ?>
        <div class="card">
          <div class="card-header bg-info">
            <h5 class="text-light">Backup And Restore</h5>
          </div>
          <div class="card-body">
            <div class="container mt-5">
              <div class="row">
                <div class="col text-center">
                  <!-- <button type="button" data-bs-toggle="modal" data-bs-target="#backupmodal" class="btn btn-success">Backup The Database</button> -->
                  <a href="backup.php" class="btn btn-success">Backup The Database</a>
                </div>
                <div class="col text-center">
                  <button type="button" class="btn btn-info text-light" onclick="swal('Notice!', 'Please contact the service team to restore the database.', 'info');">Restore The Database</button>
                </div>
              </div>
            </div>

            <div class="container mt-5 text-center">
              <h3>Backup Each Table</h3>
              <button type="button" class="btn btn-success" data-bs-target="#backuponetable" data-bs-toggle="modal">Back Up One Table</button>
            </div>
            
            <!-- Card -->
            <!-- <div class="modal fade" id="backupmodal">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header bg-success text-light">
                    <h5 class="modal-title">Choose The Backup Location</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <form action="" method="post">
                    <div class="modal-body">
                      <input type="file" name="location" class="form-control">
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                      <button type="submit" class="btn btn-success" name="confirm">Confirm</button>
                    </div>
                  </form>
                </div>
              </div> -->
              <div class="modal fade" id="backuponetable">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header bg-success text-light">
                    <h5 class="modal-title">Choose The Which Table to Backup</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <form action="" method="post">
                    <div class="modal-body">
                      <label>Tables</label>
                      <select name="tablename" class="form-control" style="text-transform: capitalize;">
                      <?php
                        $stmt = $pdo->prepare("SHOW TABLES");
                        $stmt->execute();
                        $tablesdatas = $stmt->fetchall();

                        foreach($tablesdatas as $tablesdata){
                          ?>
                            <option value="<?= $tablesdata['Tables_in_lms']; ?>"><?= $tablesdata['Tables_in_lms']; ?></option>
                          <?php
                        }
                      ?>
                      </select>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                      <button type="submit" class="btn btn-success" name="backuponetable">Confirm</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
