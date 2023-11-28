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
      <div class="sidebarcol" id="sidebar">
        <?php
        include 'sidebar.php';
        ?>
      </div>
      <div class="contentcol" id="content">
        <?php require 'navbar.php'; ?>
        <div class="card">
          <div class="card-header bg-warning text-light"  style="padding:-10px;">
            <h5>Manage Stock Item</h5>
            <button type="button" class="btn btn-success btn-sm float-end" data-bs-toggle="modal" data-bs-target="#addmodal">
              Add Item
            </button>
          </div>
          <div class="card-body">
            <?php
            if(isset($_POST['deletebutton'])){
              $deleteid = $_POST['deleteid'];
              $message = $query->deleteitem('item', $deleteid);
            }
            if(isset($_POST['updatebutton'])){
              $item_name = $_POST['item_name'];
              // $item_code = $_POST['item_code'];
              $item_id = $_POST['item_id'];

              // $message = $query->updateitem('item', $item_name, $item_code, $item_id);
              $message = $query->updateitem('item', $item_name, $item_id);
            }
            if(isset($_POST['addbutton'])){
              // $item_code = $_POST['item_id'];
              $item_name = $_POST['item_name'];

              // $message = $query->additem('item', $item_code,  $item_name);
              $message = $query->additem('item', $item_name);
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

            <?php

            if (!empty($_GET['pageno'])) {
              $pageno = $_GET['pageno'];
            }else{
              $pageno = 1;
            }
            $numOfrecs = 13;
            $offset = ($pageno -1) * $numOfrecs;
            ?>
            <table class="mt-3 table table-bordered table-striped rounded">
              <tr>
                <!-- <th>Category Name</th> -->
                <th>Id</th>
                <th>Item Name</th>
                <th>Action</th>
              </tr>

              <?php
              $stmt = $pdo->prepare("SELECT * FROM item ORDER BY item_id");
              $stmt->execute();
              $rawResult = $stmt->fetchAll();
              $total_pages = ceil(count($rawResult) / $numOfrecs);

              $stmt = $pdo->prepare("SELECT * FROM item ORDER BY item_id LIMIT $offset,$numOfrecs ");
              $stmt->execute();
              $itemdatas = $stmt->fetchAll();
              ?>
              <?php
              $no = 1;
              foreach ($itemdatas as $itemdata) {
                // $category_id = $itemdata['category_id'];
                // $category_name = $query->select('category', $category_id, 'category_id');
              ?>

              <tr>
                <!-- <td><?php echo $category_name['category_name']; ?></td> -->
                <td><?php echo $no; ?></td>
                <td><?php echo $itemdata['item_name']; ?></td>
                <td>
                  <input type="hidden" name="updateid" value="<?php echo $itemdata['item_id']; ?>">
                  <button type="submit" class="btn btn-warning text-light btn-sm" data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $itemdata['item_id']; ?>">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
</svg>
                  </button>
                <form action="item.php" method="post" style="display: inline !important;">
                  <input type="hidden" name="deleteid" value="<?php echo $itemdata['item_id']; ?>">
                  <button type="submit" name="deletebutton" class="btn btn-danger btn-sm">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16"><path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/></svg>
                  </button>
                </form>
              </td>
              </tr>
              <!-- Data Update Modal -->
              <div class="modal fade" id="updatemodal<?php echo $itemdata['item_id']; ?>" tabindex="-1" role="dialog" >
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header bg-warning text-light">
                      <h5 class="modal-title" id="updatemodallabel">Update An Item</h5>
                      <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="h3">&times;</span>
                      </button>
                    </div>
                    <form action="" method="post" autocomplete="off">
                      <div class="modal-body">
                        <?php
                          $id = $itemdata['item_id'];
                          $updatedata = $query->select('item', $id, 'item_id');
                        ?>
                        <input type="hidden" name="item_id" value="<?php echo $itemdata['item_id']; ?>">
                        <!-- <label>Category Name</label>
                        <select class="form-control" name="category_id">
                          <?php
                          $categoryiddatas = $query->selectall('category');
                          foreach ($categoryiddatas as $categoryiddata) {
                            ?>
                            <option value="<?php echo $categoryiddata['category_id']; ?>" <?php if($categoryiddata['category_id'] == $updatedata['category_id']){ echo 'selected';} ?>><?php echo $categoryiddata['category_name']; ?></option>
                            <?php
                          }
                          ?>
                        </select> -->
                        <!-- <label>Item Code</label>
                        <input type="text" name="item_code" class="form-control" placeholder="Item Code" value="<?php echo $updatedata['item_id']; ?>"> -->
                        <label>Item Name</label>
                        <input type="text" name="item_name" class="form-control" placeholder="Item Name" value="<?php echo $updatedata['item_name']; ?>">
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
              $no++;
              };
              ?>

            </table>
            <br>
            <div aria-label="Page navigation example" style="float:right;">
              <ul class="pagination">
                <li class="page-item"><a class="page-link" href="?pageno=1">First</a></li>
                <li class="page-item <?php if($pageno <= 1){echo 'disabled';} ?>">
                  <a class="page-link" href="<?php if($pageno <= 1){echo '#';} else {echo "?pageno=".($pageno-1);} ?>">Previous</a>
                </li>
                <li class="page-item"><a class="page-link" href="#"><?php echo $pageno; ?></a></li>
                <li class="page-item <?php if($pageno >= $total_pages){echo 'disabled';}; ?>">
                  <a class="page-link" href="<?php if($pageno >= $total_pages){echo '#';}else{echo "?pageno=".($pageno+1);} ?>">Next</a>
                </li>
                <li class="page-item"><a class="page-link" href="?pageno=<?php echo $total_pages; ?>">Last</a> </li>
              </ul>
            </div>
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
        <form action="item.php" method="post" autocomplete="off">
          <div class="modal-body">
            <!-- <label>Category Name</label>
            <select class="form-control" name="category_id">
              <?php
              $categoryiddatas = $query->selectall('category');
              foreach ($categoryiddatas as $categoryiddata) {
                ?>
                <option value="<?php echo $categoryiddata['category_id']; ?>"><?php echo $categoryiddata['category_name']; ?></option>
                <?php
              }
              ?>
            </select> -->
            <!-- <label>Item Code</label>
            <input type="text" name="item_id" class="form-control" placeholder="Item Code"> -->
            <label>Item Name</label>
            <input type="text" name="item_name" class="form-control" placeholder="Item Name">
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-success" name="addbutton">Add Item</button>
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
