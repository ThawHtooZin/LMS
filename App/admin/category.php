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
    <title>Document</title>
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
        <div class="card mt-3">
          <div class="card-header bg-warning text-light"  style="padding:-10px;">
            <h5>Manage Category</h5>
          </div>
          <div class="card-body">
            <?php
            if(isset($_POST['deletebutton'])){
              $deleteid = $_POST['deleteid'];
              $message = $query->deletecategory('category', $deleteid);
            }
            if(isset($_POST['updatebutton'])){
              $category_name = $_POST['category_name'];
              $category_id = $_POST['category_id'];

              $message = $query->updatecategory('category', $category_name, $category_id);
            }
            ?>
            <?php
            if(isset($_POST['addbutton'])){
              $category_name = $_POST['category_name'];

              $message = $query->addcategory('category', $category_name);
            }
            ?>
            <?php
            if(!empty($message)){
              if(strpos($message, 'Successfully')){
                $successmessage = $message;
              }

              if(strpos($message, 'Error')){
                $errmessage = $message;
              }

              if(strpos($message, 'following')){
                $errormessage = $message;
              }
            }

            ?>

            <?php
              if(!empty($errormessage)){
              ?>
              <div class="alert alert-danger alert-dismissible fade show">
                <strong>Error! </strong> <?php echo $errormessage; ?>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
              </div>
              <?php
            }
            if(!empty($errmessage)){
              ?>
              <div class="alert alert-danger alert-dismissible fade show">
                <strong>Error! </strong> <?php echo $errmessage; ?>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
              </div>
              <?php
            }
            if(!empty($successmessage)){
              ?>
              <div class="alert alert-success alert-dismissible fade show">
                <strong>Success! </strong> <?php echo $successmessage; ?>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
              </div>
              <?php
            }
            ?>

            <button type="button" class="btn btn-success float-end" data-bs-toggle="modal" data-bs-target="#addmodal">
              Add Category
            </button>
            <table class="mt-5 table table-bordered table-striped rounded">
              <tr>
                <th>Category Id</th>
                <th>Category Name</th>
                <th>Action</th>
              </tr>
              <?php
              $categorydatas = $query->selectall('category');
              foreach ($categorydatas as $categorydata) {
              ?>

              <tr>
                <td><?php echo $categorydata['category_id']; ?></td>
                <td><?php echo $categorydata['category_name']; ?></td>
                <td>
                  <input type="hidden" name="updateid" value="<?php echo $categorydata['category_id']; ?>">
                  <button type="submit" class="btn btn-warning text-light" data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $categorydata['category_id']; ?>">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
</svg>
                  </button>
                <form action="category.php" method="post" style="display: inline !important;">
                  <input type="hidden" name="deleteid" value="<?php echo $categorydata['category_id']; ?>">
                  <button type="submit" name="deletebutton" class="btn btn-danger">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16"><path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/></svg>
                  </button>
                </form>
              </td>
              </tr>
              <!-- Data Update Modal -->
              <div class="modal fade" id="updatemodal<?php echo $categorydata['category_id']; ?>" tabindex="-1" role="dialog" >
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header bg-warning text-light">
                      <h5 class="modal-title" id="updatemodallabel">Update An Category</h5>
                      <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="h3">&times;</span>
                      </button>
                    </div>
                    <form action="" method="post" autocomplete="off">
                      <div class="modal-body">
                        <?php
                          $id = $categorydata['category_id'];
                          $updatedata = $query->select('category', $id, 'category_id');
                        ?>
                        <input type="hidden" name="category_id" value="<?php echo $categorydata['category_id']; ?>">
                        <label>Category Name</label>
                        <input type="text" name="category_name" class="form-control" placeholder="Category Name" value="<?php echo $updatedata['category_name']; ?>">
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-warning" name="updatebutton">Update</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
              <!-- Update Modal -->
              <?php
              };
              ?>

            </table>
          </div>
        </div>
      </div>
    </div>

  <!-- Data Add Modal -->
  <div class="modal fade" id="addmodal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header bg-secondary text-light">
          <h5 class="modal-title" id="addmodellabel">Create New Category</h5>
          <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true" class="h3">&times;</span>
          </button>
        </div>
        <form action="category.php" method="post" autocomplete="off">
          <div class="modal-body">
            <label>Category Name</label>
            <input type="text" name="category_name" class="form-control" placeholder="Category Name">
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-success" name="addbutton">Create Category</button>
          </div>
        </form>
      </div>
    </div>
  </div>
  <!-- Add Modal -->

  <?php
  $bootstrap->javascript();
  ?>
  </body>
</html>
