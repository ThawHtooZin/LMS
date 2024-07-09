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
    <?php
    if(isset($_POST['searchcustomer'])){
      if(!empty($_POST['search_id'])){
        $search_id = $_POST['search_id'];
        $customerdatas = $query->search('customers', 'customer_id', $search_id);
      }else {
        $customerdatas = $query->selectall('customers');
      }
    }else {
      $customerdatas = $query->selectall('customers');
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
                <div class="card-header bg-warning text-light" style="padding:-10px;">
                    <h5>Manage Customer</h5>
                </div>
                <div class="card-body">
                    <?php
            if(isset($_POST['deletebutton'])){
              $deleteid = $_POST['deleteid'];
              $message = $query->deletecustomer('customers', $deleteid);
            }
            if(isset($_POST['updatebutton'])){
              $customer_name = $_POST['customer_name'];
              $customer_detail = $_POST['customer_detail'];
              $customer_address = $_POST['customer_address'];
              $updateid = $_POST['updateid'];

              $message = $query->updatecustomer('customers', $customer_name, $customer_detail, $customer_address, $updateid);
            }
            if(isset($_POST['addbutton'])){
              $customer_id = $_POST['customer_id'];
              $customer_name= $_POST['customer_name'];
              $customer_detail = $_POST['customer_detail'];
              $customer_address = $_POST['customer_address'];

              $message = $query->addcustomer('customers', $customer_id, $customer_name,  $customer_detail, $customer_address);
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
            $numOfrecs = 10;
            $offset = ($pageno -1) * $numOfrecs;
            ?>
                    <form action="customer.php" method="post" class=" d-inline">
                        <span>Search Customer:</span>
                        <select name="search_id" class="form-control w-25 d-inline">
                            <?php
                $customerdatasfs = $query->selectall('customers');
                foreach ($customerdatasfs as $customerdatafs) {
                  ?>
                            <option value="<?php echo $customerdatafs['customer_id']; ?>">
                                <?php echo $customerdatafs['customer_name']; ?></option>
                            <?php
                }
                 ?>
                        </select>
                        <button type="submit" name="searchcustomer" class="btn btn-info">Search</button>
                    </form>
                    <button type="button" class="btn btn-success float-end d-inline" data-bs-toggle="modal"
                        data-bs-target="#addmodal">
                        Add Customer
                    </button>
                    <table class="mt-5 table table-bordered table-striped rounded">
                        <tr>
                            <th>Customer A/C Code</th>
                            <th>Customer Name</th>
                            <th>Customer Information</th>
                            <th>Customer Address</th>
                            <th>Action</th>
                        </tr>
                        <?php
                        if(!isset($_POST['search_id'])){
                            $stmt = $pdo->prepare("SELECT * FROM customers ORDER BY customer_id");
                            $stmt->execute();
                            $rawResult = $stmt->fetchAll();
                            $total_pages = ceil(count($rawResult) / $numOfrecs);

                            $stmt = $pdo->prepare("SELECT * FROM customers ORDER BY customer_id LIMIT $offset,$numOfrecs ");
                            $stmt->execute();
                            $customerdatas = $stmt->fetchAll();
                        }
                        ?>
                        <?php


                        foreach ($customerdatas as $customerdata) {
                            $accode = $customerdata['customer_id'];
                            $check = $query->checkifacexists($accode);
                        ?>

                        <tr>
                            <td><?php echo $customerdata['customer_id']; ?></td>
                            <td><?php echo $customerdata['customer_name']; ?></td>
                            <td><?php echo $customerdata['customer_detail']; ?></td>
                            <td><?php echo $customerdata['customer_address']; ?></td>
                            <td>
                                <input type="hidden" name="updateid"
                                    value="<?php echo $customerdata['customer_id']; ?>">
                                <button type="submit" class="btn btn-warning text-light btn-sm" data-bs-toggle="modal"
                                    data-bs-target="#updatemodal<?php echo $customerdata['customer_id']; ?>">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                        class="bi bi-pencil-square" viewBox="0 0 16 16">
                                        <path
                                            d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                        <path fill-rule="evenodd"
                                            d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                                    </svg>
                                </button>
                                <form action="customer.php" method="post" style="display: inline !important;">
                                    <input type="hidden" name="deleteid"
                                        value="<?php echo $customerdata['customer_id']; ?>">
                                        <?php if($check === false){ ?>
                                    <button type="submit" name="deletebutton" class="btn btn-danger btn-sm">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                            fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16">
                                            <path
                                                d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z" />
                                        </svg>
                                    </button>
                                    <?php } ?>
                                </form>
                            </td>
                        </tr>
                        <!-- Data Update Modal -->
                        <div class="modal fade" id="updatemodal<?php echo $customerdata['customer_id']; ?>"
                            tabindex="-1" role="dialog">
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
                          $id = $customerdata['customer_id'];
                          $updatedata = $query->select('customers', $id, 'customer_id');
                        ?>
                                            <input type="hidden" name="updateid"
                                                value="<?php echo $customerdata['customer_id']; ?>">
                                            <label>Customer A/C Code</label>
                                            <input type="text" name="customer_id" disabled class="form-control"
                                                placeholder="Customer A/C Code"
                                                value="<?php echo $updatedata['customer_id']; ?>">
                                            <label>Customer Name</label>
                                            <input type="text" name="customer_name" class="form-control"
                                                placeholder="Customer Name"
                                                value="<?php echo $updatedata['customer_name']; ?>">
                                            <label>Customer Information</label>
                                            <textarea name="customer_detail" class="form-control" cols="30"
                                                rows="4"><?php echo $updatedata['customer_detail']; ?></textarea>
                                            <label>Customer Address</label>
                                            <input type="text" name="customer_address" class="form-control"
                                                value="<?php echo $updatedata['customer_address']; ?>">
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary"
                                                data-bs-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-warning"
                                                name="updatebutton">Update</button>
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
                    <br>
                    <div aria-label="Page navigation example" style="float:right;">
                        <ul class="pagination">
                            <li class="page-item"><a class="page-link" href="?pageno=1">First</a></li>
                            <li class="page-item <?php if($pageno <= 1){echo 'disabled';} ?>">
                                <a class="page-link"
                                    href="<?php if($pageno <= 1){echo '#';} else {echo "?pageno=".($pageno-1);} ?>">Previous</a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#"><?php echo $pageno; ?></a></li>
                            <li class="page-item <?php if($pageno >= $total_pages){echo 'disabled';}; ?>">
                                <a class="page-link"
                                    href="<?php if($pageno >= $total_pages){echo '#';}else{echo "?pageno=".($pageno+1);} ?>">Next</a>
                            </li>
                            <li class="page-item"><a class="page-link"
                                    href="?pageno=<?php echo $total_pages; ?>">Last</a> </li>
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
                <form action="customer.php" method="post" autocomplete="off">
                    <div class="modal-body">
                        <label>Customer A/C Code</label>
                        <input type="text" name="customer_id" class="form-control" placeholder="Customer A/C Code">
                        <label>Customer Name</label>
                        <input type="text" name="customer_name" class="form-control" placeholder="Customer Name">
                        <label>Customer Information</label>
                        <textarea name="customer_detail" class="form-control" cols="30" rows="4"></textarea>
                        <label>Customer Address</label>
                        <input type="text" name="customer_address" class="form-control" placeholder="Customer Address">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-success" name="addbutton">Add Customer</button>
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