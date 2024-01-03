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
    if(!empty($_SESSION['changepermission']))
    {
      if($_SESSION['changepermission'] == 'finished'){
        echo "<script>swal('Success!', 'The User Permission is been saved!', 'success');</script>";
        $_SESSION['changepermission'] = '';
      }
    }
    ?>
    <?php
      if(isset($_POST['addrolebtn'])){
        $role_name = $_POST['role_name'];
        $query->addrole($role_name);
      }
      if(isset($_POST['updaterolebtn'])){
        $role_id = $_POST['role_id'];
        $role_name = $_POST['role_name'];
        $query->updaterole($role_id, $role_name);
      }
      if(isset($_POST['deletebtn'])){
        $role_id = $_POST['delete_role_id'];
        $query->deleterole($role_id);
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
          <div class="card-header bg-primary">

            <b class="text-light">Manage Role</b>
            <button type="button" class="btn btn-success float-end btn-sm" data-bs-toggle="modal" data-bs-target="#addrolemodal">Add Role</button>
          </div>
          <div class="card-body">
            <table class="table table-hover table-bordered table-striped">
              <tr>
                <th>Role Id</th>
                <th>Role Name</th>
                <th>Action</th>
              </tr>
              <?php
              $roledatas = $query->selectall('role');
              foreach ($roledatas as $roledata) {
                ?>
              <tr>
                  <td><?php echo $roledata['role_id']; ?></td>
                  <td><?php echo $roledata['role_name']; ?></td>
                  <td>
                    <form action="" method="post">
                      <input type="hidden" name="delete_role_id" value="<?= $roledata['role_id']; ?>">
                    <a href="permission.php?role_id=<?php echo $roledata['role_id']; ?>" class="btn btn-info text-light">Permissions</a>
                    <button type="button" class="btn btn-warning text-light" data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $roledata['role_id']; ?>">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
    <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
  </svg>
                    </button>
                    <button type="submit" name="deletebtn" class="btn btn-danger">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16"><path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/></svg>
                    </button>
                    </form>
                  </td>
              </tr>
              <div class="modal fade" tabindex="-1" role="dialog" id="updatemodal<?php echo $roledata['role_id']; ?>">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header bg-warning">
                      <h5 class="modal-title">Update Role</h5>
                      <button type="button" class="btn btn-default" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <form action="managerole.php" method="post">
                      <input type="hidden" name="role_id" value="<?php echo $roledata['role_id']; ?>">
                      <div class="modal-body">
                        <label>Role Name</label>
                        <input type="text" name="role_name" class="form-control inpv2 mb-2" value="<?php echo $roledata['role_name']; ?>">
                      </div>
                      <div class="modal-footer">
                        <button type="submit" class="btn btn-warning text-light" name="updaterolebtn">Update</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
              <?php
            }
            ?>
            </table>
          </div>
        </div>
        <div class="modal fade" tabindex="-1" role="dialog" id="addrolemodal">
          <div class="modal-dialog" role="document">
            <form action="managerole.php" method="post">
              <div class="modal-content">
                <div class="modal-header bg-info">
                  <h5 class="modal-title text-light">Add Role</h5>
                  <button type="button" class="btn btn-default" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <label>Role Name</label>
                  <input type="text" name="role_name" class="form-control inpv2 mb-2">
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                  <button type="submit" class="btn btn-success" name="addrolebtn">Add Role</button>
                </div>
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
