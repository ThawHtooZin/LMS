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
    if(isset($_POST['addbtn'])){
      $code_no = $_POST['code_no'];
      $actype = $_POST['ac_type'];
      $acname = $_POST['ac_name'];

      $query->addacname($code_no, $actype, $acname);
    }

    if(isset($_POST['updatebutton'])){
      $id = $_POST['id'];
      $code_no = $_POST['code_no'];
      $actype = $_POST['ac_type'];
      $acname = $_POST['ac_name'];

      $query->updateacname($code_no, $actype, $acname, $id);
    }

    if(isset($_POST['deletebutton'])){
      $id = $_POST['id'];

      $stmt = $query->deleteacname($id);

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
          <div class="card-header bg-info text-light">
            <b style="font-size:18px;">Manage A/C Name</b>

            <button type="button" class="btn btn-secondary btn-sm float-end text-light" data-bs-toggle="modal" data-bs-target="#addmodal">Add A/C Name</button>
          </div>
          <div class="card-body">
            <table class="table table-bodrder table-hover table-striped">
              <tr>
                <th>Id</th>
                <th>Code No</th>
                <th>A/C Type</th>
                <th>A/C Name</th>
              </tr>
              <?php
              $datas = $query->selectall('acname');
              foreach ($datas as $data) {
                $actype = $query->select('actype', $data['ac_type'], 'acid');
              ?>
              <tr data-bs-toggle='modal' data-bs-target="#updatemodal<?php echo $data['id']; ?>">
                <td><?php echo $data['id']; ?></td>
                <td><?php echo $data['code_no']; ?></td>
                <td><?php echo $actype['ac_type']; ?></td>
                <td><?php echo $data['ac_name']; ?></td>
              </tr>
              <div class="modal fade" id="updatemodal<?php echo $data['id'];  ?>" tabindex="-1" role="dialog"  style="margin-left:auto !important; margin-right: auto !important;">
                <div class="modal-dialog" role="document">
                  <div class="modal-content" style="width: 750px; !important; margin-top:70px !important;">
                    <form action="" method="post" autocomplete="off">
                      <input type="hidden" name="id" value="<?php echo $data['id']; ?>">
                    <div class="modal-header bg-warning text-light">
                      <h5 class="modal-title" id="updatemodallabel">Update A/C Name</h5>
                      <div class="row">
                        <div class="col">
                          <button type="submit" class="btn btn-success d-inline" name="updatebutton"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                              <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                              <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                            </svg>
                          </button>
                          <button type="submit" name="deletebutton" class="btn btn-danger d-inline">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16"><path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/></svg>
                          </button>
                          <button type="button" class="btn btn-primary d-inline" data-bs-toggle="modal">&times;</button>
                        </div>
                      </div>
                    </div>
                      <div class="modal-body">
                        <?php
                         $id = $data['id'];
                         $updatedata = $query->select('acname', $id, 'id');
                        ?>
                        <input type="hidden" name="updateid" value="<?php echo $data['id']; ?>">
                        <div class="row">
                          <div class="col">
                            <label>Code No</label>
                            <input type="text" name="code_no" class="form-control inpv2 mb-2" value="<?php echo $updatedata['code_no']; ?>">
                          </div>
                          <div class="col">
                            <label>A/C Type</label>
                            <select class="form-control inpv2 mb-s" name="ac_type">
                              <?php
                                $actypedatas = $query->selectall('actype');
                               foreach ($actypedatas as $actypedata): ?>
                               <option value="<?php echo $actypedata['acid']; ?>" <?php if($actypedata['acid'] == $updatedata['ac_type']){ echo "selected";} ?>><?php echo $actypedata['ac_type']; ?></option>
                              <?php endforeach; ?>
                            </select>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <label>A/C Name</label>
                            <input type="text" name="ac_name" class="form-control inpv2 mb-2" value="<?php echo $updatedata['ac_name']; ?>">
                          </div>
                          <div class="col">
                          </div>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
              <?php
              }
               ?>
            </table>
            <div class="modal fade" id="addmodal" tabindex="-1" role="dialog"  style="margin-left:auto !important; margin-right: auto !important;">
              <div class="modal-dialog" role="document">
                <form action="acname.php" method="post">
                <div class="modal-content" style="width: 750px; !important; margin-top:70px !important;">
                  <div class="modal-header bg-warning text-light">
                    <h5 class="modal-title" id="updatemodallabel">Add A/C Name</h5>
                    <div class="row">
                      <div class="col">
                        <button type="button" class="btn btn-default d-inline btn-sm" style="font-size: 20px;" data-bs-toggle="modal">&times;</button>
                      </div>
                    </div>
                  </div>
                  <div class="modal-body">
                      <div class="row">
                        <div class="col">
                          <label>Code No</label>
                          <input type="text" name="code_no" class="form-control inpv2 mb-2">
                        </div>
                        <div class="col">
                          <label>A/C Type</label>
                          <select class="form-control inpv2 mb-s" name="ac_type" id="chzn-select">
                            <?php
                              $actypedatas = $query->selectall('actype');
                             foreach ($actypedatas as $actypedata): ?>
                             <option value="<?php echo $actypedata['acid']; ?>"><?php echo $actypedata['ac_type']; ?></option>
                            <?php endforeach; ?>
                          </select>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col">
                          <label>A/C Name</label>
                          <input type="text" name="ac_name" class="form-control inpv2 mb-2">
                        </div>
                        <div class="col mt-4">
                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                          <button type="submit" class="btn btn-success" name="addbtn">Add</button>
                        </div>
                      </div>
                  </div>
                </div>
              </form>
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
