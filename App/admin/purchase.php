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
  <script type="text/javascript">
    $(document).ready(()=>{
      $('#addac_code').on('keyup', function(){
        var ac_codepost = $('#addac_code').val();
        var type = "";
        if(ac_codepost.includes('/')){
          ac_code = ac_codepost.split('/');
          type = "slash";
        }else{
          ac_code = ac_codepost.split('-');
          type = "dash";
        }
        firstpart = ac_code[0];
        lastpart = ac_code[1];
        $('#addac_name').load('ac_name.php', {
          FirstPart : firstpart,
          LastPart: JSON.stringify(lastpart),
          Type: type
        });
      });
    });
  </script>
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

            <b>Manage Purchase</b>
          </div>
          <div class="card-body" style="margin-top:-8px !important;">
            <?php
            if(isset($_POST['deletebutton'])){
              $deleteid = $_POST['deleteid'];
              $query->deletepurchase('purchase', $deleteid);
              $query->deletepayable('payable', $deleteid);
              $query->deleteform7('form7stock', $deleteid);
            }
            if(isset($_POST['updatebutton'])){
              $date = $_POST['date'];
              $voucher_no = $_POST['voucher_no'];
              $tclfrozen = $_POST['tclfrozen'];
              $supplier_name = $_POST['upsupplier_code_no'];
              $commodity = $_POST['commodity'];
              $size = $_POST['size'];
              $viss = $_POST['viss'];
              $pcs = $_POST['pcs'];
              $price = $_POST['price'];
              $no = $_POST['updateid'];

              $message = $query->updatepurchase('purchase', $date, $voucher_no, $tclfrozen, $supplier_name, $commodity, $size, $viss, $pcs, $price, $no);
            }
            if(isset($_POST['addbutton'])){
              $date = $_POST['date'];
              $voucher_no = $_POST['voucher_no'];
              $tclfrozen = $_POST['tclfrozen'];
              $supplier_name = $_POST['supplier_code_no'];
              $commodity = $_POST['commodity'];
              $size = $_POST['size'];
              $viss = $_POST['viss'];
              $pcs = $_POST['pcs'];
              $price = $_POST['price'];

              $message = $query->addpurchase('purchase' , $date, $voucher_no, $tclfrozen, $supplier_name, $commodity, $size, $viss, $pcs, $price);
            }

            if(isset($_POST['total'])){
              $supplier_id = $_POST['supplier_id'];
              $purchasedatas = $query->search('purchase', 'supplier_id', $supplier_id);
            }

            if(isset($_POST['commoditybtn'])){
              $item_id = $_POST['item_id'];
              $purchasedatas = $query->search('purchase', 'commodity', $item_id);
            }

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
            <a href="purchase_report.php" class="btn btn-primary btn-sm">Report</a>
            <form  action="purchase.php" method="post" class="d-inline">
              <span>Supplier Name:</span>
              <select class="chzn-select" name="supplier_id" style="width:15%;" data-placeholder="Supplier Name">
                <?php
                $supplierdatastmt = $pdo->prepare("SELECT * FROM purchase GROUP BY supplier_id");
                $supplierdatastmt->execute();
                $supplierdatas = $supplierdatastmt->fetchall();
                foreach ($supplierdatas as $supplierdata) {
                  $supplier_name = $query->select('supplier', $supplierdata['supplier_id'], 'supplier_id');
                  ?>
                  <option value="<?php echo $supplierdata['supplier_id']; ?>"><?php echo $supplier_name['supplier_name']; ?> - <?= $supplierdata['supplier_id']; ?></option>
                  <?php
                }
                ?>
              </select>
              <button type="submit" name="total" class="btn btn-primary btn-sm">Search</button>
              <span>Commodity:</span>
              <select class="form-control d-inline" name="item_id" style="width:15%;">
                <?php
                $itemdatas = $query->selectall('item');
                foreach ($itemdatas as $itemdata) {
                  ?>
                  <option value="<?php echo $itemdata['item_id']; ?>"><?php echo $itemdata['item_name']; ?></option>
                  <?php
                }
                ?>
              </select>
              <button type="submit" name="commoditybtn" class="btn btn-primary btn-sm">Find Commodity</button>
            </form>
            <button type="button" class="btn btn-success float-end btn-sm" data-bs-toggle="modal" data-bs-target="#addmodal">
              Add Purchase Voucher
            </button>
            <?php
            if (!empty($_GET['pageno'])) {
              $pageno = $_GET['pageno'];
            }else{
              $pageno = 1;
            }
            $numOfrecs = 10;
            $offset = ($pageno -1) * $numOfrecs;
            ?>
            <table class="mt-1 table table-bordered table-striped rounded table-hover">
              <tr>
                <th>No.</th>
                <th>Date</th>
                <th>Voucher No</th>
                <th>Type</th>
                <th>Supplier Name</th>
                <th>Commodity</th>
                <th>Size</th>
                <th>Viss</th>
                <th>Kg</th>
                <th>Pcs</th>
                <th>Price</th>
                <th>Amount</th>
              </tr>
              <?php
              if(isset($_POST['total'])){
                $supplier_id = $_POST['supplier_id'];
                $total_amount = $query->selectsum('purchase', $supplier_id, 'supplier_id');
              }elseif(isset($_POST['commoditybtn'])){
                $item_id = $_POST['item_id'];
                $total_amount = $query->selectsum('purchase', $item_id, 'commodity');
              }else{
                $stmt = $pdo->prepare("SELECT * FROM purchase ORDER BY no");
                $stmt->execute();
                $rawResult = $stmt->fetchAll();
                $total_pages = ceil(count($rawResult) / $numOfrecs);

                $stmt = $pdo->prepare("SELECT * FROM purchase ORDER BY no LIMIT $offset,$numOfrecs ");
                $stmt->execute();
                $purchasedatas = $stmt->fetchAll();
              }
              $idd = 0;
              foreach ($purchasedatas as $purchasedata) {
                $idd++;
                $supplierid = $purchasedata['supplier_id'];
                $supplier_name = $query->select('supplier', $supplierid, 'supplier_id');
                $itemid = $purchasedata['commodity'];
                $item_name = $query->select('item', $itemid, 'item_id');
              ?>
              <input type="hidden" name="updateid" value="<?php echo $purchasedata['no']; ?>">

              <tr data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $purchasedata['no'];  ?>" style="cursor: pointer !important;">
                <td><?php echo $idd; ?></td>
                <td><?php echo date('d-m-Y', strtotime($purchasedata['date'])); ?></td>
                <td><?php echo $purchasedata['voucher_no']; ?></td>
                <td><?php echo $purchasedata['tclfrozen']; ?></td>
                <td><?php echo $supplier_name['supplier_name']; ?></td>
                <td><?php echo $item_name['item_name']; ?></td>
                <td><?php echo $purchasedata['size']; ?></td>
                <td><?php echo $purchasedata['viss']; ?></td>
                <td><?php echo floatval($purchasedata['viss']) * 1.634; ?></td>
                <td><?php echo $purchasedata['pcs']; ?></td>
                <td><?php echo $purchasedata['price']; ?></td>
                <td><?php echo $purchasedata['amount']; ?></td>
              </tr>
              <!-- Data Update Modal -->
              <div class="modal fade" id="updatemodal<?php echo $purchasedata['no'];  ?>" tabindex="-1" role="dialog"  style="margin-left:auto !important; margin-right: auto !important;">
                <div class="modal-dialog" role="document">
                  <div class="modal-content" style="width: 750px; !important; margin-top:70px !important;">
                    <form action="" method="post" autocomplete="off">
                      <input type="hidden" name="deleteid" value="<?php echo $purchasedata['no']; ?>">
                    <div class="modal-header bg-warning text-light">
                      <h5 class="modal-title" id="updatemodallabel">Update An Category</h5>
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
                         $id = $purchasedata['no'];
                         $updatedata = $query->select('purchase', $id, 'no');
                         $datas = $query->select('acname', $updatedata['supplier_id'], 'code_no');
                         $ac_name = $datas['ac_name'];
                        ?>
                        <input type="hidden" name="updateid" value="<?php echo $purchasedata['no']; ?>">
                        <div class="row">
                          <div class="col">
                            <label style="font-weight: bold;">Date</label>
                            <input type="date" name="date" class="form-control inpv2" value="<?php echo $updatedata['date']; ?>">
                          </div>
                          <div class="col">
                            <label style="font-weight: bold;">Voucher No</label>
                            <input type="number" name="voucher_no" class="form-control inpv2 mb-2" value="<?php echo $updatedata['voucher_no']; ?>">
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <label style="font-weight: bold;">TCL (or) Frozen</label>
                            <select class="form-control inpv2 mb-2" name="tclfrozen">
                              <option value="">Select</option>
                              <option value="tcl" <?php if($updatedata['tclfrozen'] == 'tcl'){ echo 'selected'; } ?>>TCL</option>
                              <option value="frozen" <?php if($updatedata['tclfrozen'] == 'frozen'){ echo 'selected'; } ?>>Frozen</option>
                            </select>
                          </div>
                          <div class="col-6">
                            <label style="font-weight: bold;">Supplier A/C Code</label>
                            <div class="row">
                              <div class="col-6">
                                <input type="text" name="upsupplier_code_no" id="upac_code<?php echo $data['id']; ?>" class="form-control inpv2 mb-1" value="<?php echo $updatedata['supplier_id']; ?>" style="padding-top: 2px; padding-bottom: 2px;">
                              </div>
                              <div class="col-6">
                                <div id='ac_name'>
                                  <input type="text" name="ac_name" disabled class="form-control inpv2 mb-1" value="<?php if($ac_name != ''){echo $ac_name;} ?>" style="padding-top: 2px; padding-bottom: 2px;">
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <label style="font-weight: bold;">Commodity</label>
                            <select class="form-control inpv2 mb-2" name="commodity">
                              <?php
                              $itemdatas = $query->selectall('item');
                              foreach ($itemdatas as $itemdata) {
                                ?>
                                <option value="<?php echo $itemdata['item_id']; ?>"  <?php if($updatedata['commodity'] == $itemdata['item_id']){ echo 'selected'; } ?>><?php echo $itemdata['item_name']; ?></option>
                                <?php
                              }
                              ?>
                            </select>
                          </div>
                          <div class="col">
                            <label style="font-weight: bold;">Size</label>
                            <input type="text" name="size" class="form-control inpv2 mb-2" value="<?php echo $updatedata['size']; ?>">
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <label style="font-weight: bold;">Viss</label>
                            <input type="text" name="viss" class="form-control inpv2 mb-2" value="<?php echo $updatedata['viss']; ?>">
                          </div>
                          <div class="col">
                            <label style="font-weight: bold;">Pcs</label>
                            <input type="number" name="pcs" class="form-control inpv2 mb-2" value="<?php echo $updatedata['pcs']; ?>">
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <label style="font-weight: bold;">Price</label>
                            <input type="number" name="price" class="form-control inpv2 mb-2" value="<?php echo $updatedata['price']; ?>">
                          </div>
                          <div class="col">

                          </div>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
              <!-- Update Modal -->
              <script type="text/javascript">
                $('#upac_code<?php echo $data['id']; ?>').on('keyup', function(){
                  var upac_codepost = $('#upac_code<?php echo $data['id']; ?>').val();
                  var type = "";
                  if(upac_codepost.includes('/')){
                    upac_code = upac_codepost.split('/');
                    type = "slash";
                  }else{
                    upac_code = upac_codepost.split('-');
                    type = "dash";
                  }
                  upfirstpart = upac_code[0];
                  uplastpart = upac_code[1];
                  $('#upac_name<?php echo $data['id']; ?>').load('ac_name.php', {
                    FirstPart : upfirstpart,
                    LastPart: JSON.stringify(uplastpart),
                    Type: type
                  });
                });
              </script>
              <?php
              };
              ?>
              <?php
              if (isset($_POST['total']) ) {
                $supplier_id = $_POST['supplier_id'];
                $total_amount = $query->selectsum('purchase', $supplier_id, 'supplier_id');
                ?>
                <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td>Total Amount:</td>
                  <td></td>
                  <td><?php echo $total_amount['total_amount'];  ?></td>
                </tr>
                <?php
              }
              ?>
              <?php
              if (isset($_POST['commoditybtn'])) {
                $id = $_POST['item_id'];
                $total_amount = $query->selectsum('purchase', $id, 'commodity');
                ?>
                <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td>Total Amount:</td>
                  <td><?php echo $total_amount['total_amount'];  ?></td>
                  <td></td>
                </tr>
                <?php
              }
              ?>
              <?php
              if(!$_POST && !empty($_GET['pageno']) && $_GET['pageno'] == $total_pages){
                $total_amount = $query->selectallsum('purchase', 'amount', 'total_amount');
                ?>
                <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td>Total Amount:</td>
                  <td><?php echo $total_amount['total_amount'];  ?></td>
                  <td></td>
                </tr>
                <?php
              }
              ?>
            </table>
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
  <div class="modal fade" id="addmodal" tabindex="-1" role="dialog" aria-hidden="true" style="margin-left:auto !important; margin-right: auto !important;">
    <div class="modal-dialog" role="document">
      <div class="modal-content"  style="width: 750px; !important; margin-top:70px !important;">
        <div class="modal-header bg-secondary text-light">
          <h5 class="modal-title" id="addmodellabel">Create New Purchase Voucher</h5>
          <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true" class="h3">&times;</span>
          </button>
        </div>
        <form action="purchase.php" method="post" autocomplete="off">
          <div class="modal-body">
            <div class="row">
              <div class="col">
                <label style="font-weight: bold;">Date</label>
                <input type="date" name="date" class="form-control inpv2">
              </div>
              <div class="col">
                <label style="font-weight: bold;">Voucher No</label>
                <input type="number" name="voucher_no" class="form-control inpv2 mb-2" value="">
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label style="font-weight: bold;">TCL (or) Frozen</label>
                <select class="form-control inpv2 mb-2" name="tclfrozen">
                  <option value="">Select</option>
                  <option value="tcl">TCL</option>
                  <option value="frozen">Frozen</option>
                </select>
              </div>
              <div class="col-6">
                <label style="font-weight: bold;">Supplier A/C Code</label>
                <div class="row">
                  <div class="col-6">
                    <input type="text" id="addac_code" name="supplier_code_no" class="form-control inpv2 mb-1" style="padding-top: 2px; padding-bottom: 2px;">
                    </div>
                  <div class="col-6">
                    <div id='addac_name'>
                      <input type="text" name="addac_name" disabled class="form-control inpv2 mb-1" style="padding-top: 2px; padding-bottom: 2px;">
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label style="font-weight: bold;">Commodity</label>
                <select class="form-control inpv2 mb-2" name="commodity">
                  <?php
                  $itemdatas = $query->selectall('item');
                  foreach ($itemdatas as $itemdata) {
                    ?>
                    <option value="<?php echo $itemdata['item_id']; ?>"><?php echo $itemdata['item_name']; ?></option>
                    <?php
                  }
                  ?>
                </select>
              </div>
              <div class="col">
                <label style="font-weight: bold;">Size</label>
                <input type="text" name="size" class="form-control inpv2 mb-2">
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label style="font-weight: bold;">Viss</label>
                <input type="text" name="viss" class="form-control inpv2 mb-2">
              </div>
              <div class="col">
                <label style="font-weight: bold;">Pcs</label>
                <input type="number" name="pcs" class="form-control inpv2 mb-2">
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label style="font-weight: bold;">Price</label>
                <input type="number" name="price" class="form-control inpv2 mb-2">
              </div>
              <div class="col mt-4">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-success" name="addbutton">Create Voucher</button>
              </div>
            </div>
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
