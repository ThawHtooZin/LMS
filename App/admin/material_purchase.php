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
  <script type="text/javascript">
    $(document).ready(() => {
      $('#addac_code').on('keyup', function() {
        var ac_codepost = $('#addac_code').val();
        var type = "";
        if (ac_codepost.includes('/')) {
          ac_code = ac_codepost.split('/');
          type = "slash";
        } else {
          ac_code = ac_codepost.split('-');
          type = "dash";
        }
        firstpart = ac_code[0];
        lastpart = ac_code[1];
        $('#addac_name').load('ac_name.php', {
          FirstPart: firstpart,
          LastPart: JSON.stringify(lastpart),
          Type: type
        });
      });
    });
  </script>
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

          <b>Packing Material Purchase</b>

        </div>
        <div class="card-body" style="margin-top:-8px !important;">
          <?php
          if (isset($_POST['deletebutton'])) {
            $deleteid = $_POST['deleteid'];

            $data = $query->select('purchase', $deleteid, 'id');
            if (!empty($data['tclfrozen'])) {
              $tclorfrozen = $data['tclfrozen'];
            } else {
              $tclorfrozen = '';
            }
            $query->deletepurchase('purchase', $deleteid);
            $query->deletepayable('payable', $deleteid);
            if ($tclorfrozen == 'tcl') {
              $query->deleteform7('form7stocktcl', $deleteid);
            } else {
              $query->deleteform7('form7stock', $deleteid);
            }
          }
          if (isset($_POST['updatebutton'])) {
            $date = $_POST['date'];
            $voucher_no = $_POST['voucher_no'];
            $supplier_name = $_POST['upsupplier_code_no'];
            $commodity = $_POST['commodity'];
            $size = $_POST['size'];
            $viss = $_POST['viss'];
            $pcs = $_POST['pcs'];
            $price = $_POST['price'];
            $no = $_POST['updateid'];

            $message = $query->updatepurchase('purchase', $date, $voucher_no, $supplier_name, $tclfrozen, $commodity, $size, $viss, $pcs, $price, $no);
          }
          $date_error = '';
          $voucher_no_error = '';
          $type_error = '';
          $supplier_name_error = '';
          $quantity_error = '';
          $rate_error = '';
          if (isset($_POST['addbutton'])) {
            $date = $_POST['date'];
            $voucher_no = $_POST['voucher_no'];
            $supplier_name = $_POST['supplier_code_no'];
            $material = $_POST['material'];
            $quantity = $_POST['quantity'];
            $rate = $_POST['rate'];

            if (empty($date) || empty($voucher_no) || empty($supplier_name) || empty($quantity) || empty($rate)) {
              echo '<script>swal("Error!", "Error accors when added Purchase Voucher", "error");</script>';
              if (empty($date)) {
                $date_error = "Please Enter The Date";
              }
              if (empty($voucher_no)) {
                $voucher_no_error = "Please Enter The Voucher_no";
              }
              if (empty($supplier_name)) {
                $supplier_name_error = "Please Enter The Supplier A/C Code";
              }
              if (empty($quantity)) {
                $quantity_error = "Please Enter The Quantity";
              }
              if (empty($rate)) {
                $rate_error = "Please Enter The Rate";
              }
            } else {
              $query->addmaterialpurchase('material_purchase', $date, $voucher_no, $supplier_name, $material, $quantity, $rate);
            }
          }

          if (isset($_POST['total'])) {
            $supplier_id = $_POST['supplier_id'];
            $purchasedatas = $query->search('material_purchase', 'supplier_id', $supplier_id);
          }

          if (isset($_POST['commoditybtn'])) {
            $material_id = $_POST['material_id'];
            $purchasedatas = $query->search('material_purchase', 'material_id', $material_id);
          }

          if (!empty($message)) {
            if (strpos($message, 'Successfully')) {
              $successmessage = $message;
            }

            if (strpos($message, 'Error')) {
              $errmessage = $message;
            }

            if (strpos($message, 'following')) {
              $errormessage = $message;
            }
          }

          ?>

          <?php
          if (!empty($errormessage)) {
          ?>
            <div class="alert alert-danger alert-dismissible fade show">
              <strong>Error! </strong> <?php echo $errormessage; ?>
              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
          <?php
          }
          if (!empty($errmessage)) {
          ?>
            <div class="alert alert-danger alert-dismissible fade show">
              <strong>Error! </strong> <?php echo $errmessage; ?>
              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
          <?php
          }
          if (!empty($successmessage)) {
          ?>
            <div class="alert alert-success alert-dismissible fade show">
              <strong>Success! </strong> <?php echo $successmessage; ?>
              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
          <?php
          }
          ?>
          <form action="material_purchase.php" method="post" class="d-inline">
            <span>Supplier Name:</span>
            <select class="chzn-select" name="supplier_id" style="width:15%;" data-placeholder="Supplier Name">
              <?php
              $supplierdatastmt = $pdo->prepare("SELECT * FROM material_purchase GROUP BY supplier_id");
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
            <span>Material:</span>
            <select class="form-control d-inline" name="material_id" style="width:15%;">
              <?php
              $materialdatas = $query->selectall('materials');
              foreach ($materialdatas as $materialdata) {
              ?>
                <option value="<?php echo $materialdata['id']; ?>"><?php echo $materialdata['name']; ?></option>
              <?php
              }
              ?>
            </select>
            <button type="submit" name="commoditybtn" class="btn btn-primary btn-sm">Find Material</button>
          </form>
          <button type="button" class="btn btn-success float-end btn-sm" data-bs-toggle="modal" data-bs-target="#addmodal">
            Add Material Purchase Voucher
          </button>
          <?php
          if (!empty($_GET['pageno'])) {
            $pageno = $_GET['pageno'];
          } else {
            $pageno = 1;
          }
          $numOfrecs = 15;
          $offset = ($pageno - 1) * $numOfrecs;
          ?>
          <table class="mt-1 table table-bordered table-striped rounded table-hover">
            <tr>
              <th>No.</th>
              <th>Date</th>
              <th>Voucher No</th>
              <th>Supplier Id</th>
              <th>Name</th>
              <th>Quantity</th>
              <th>Rate</th>
            </tr>
            <?php
            if (isset($_POST['total'])) {
              $supplier_id = $_POST['supplier_id'];
            } elseif (isset($_POST['commoditybtn'])) {
              $material_id = $_POST['material_id'];
            } else {
              $stmt = $pdo->prepare("SELECT * FROM material_purchase ORDER BY id");
              $stmt->execute();
              $rawResult = $stmt->fetchAll();
              $total_pages = ceil(count($rawResult) / $numOfrecs);

              $stmt = $pdo->prepare("SELECT * FROM material_purchase ORDER BY id LIMIT $offset,$numOfrecs ");
              $stmt->execute();
              $purchasedatas = $stmt->fetchAll();
            }
            $idd = 0;
            foreach ($purchasedatas as $purchasedata) {
              $idd++;
              $supplierid = $purchasedata['supplier_id'];
              $supplier_name = $query->select('supplier', $supplierid, 'supplier_id');
              $materialid = $purchasedata['material_id'];
              $material_name = $query->select('materials', $materialid, 'id');
            ?>
              <input type="hidden" name="updateid" value="<?php echo $purchasedata['id']; ?>">

              <tr data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $purchasedata['id'];  ?>" style="cursor: pointer !important;">
                <td><?php echo $idd; ?></td>
                <td><?php echo date('d-m-Y', strtotime($purchasedata['date'])); ?></td>
                <td><?php echo $purchasedata['voucher_no']; ?></td>
                <td><?php echo $supplier_name['supplier_name'] ?></td>
                <td><?php echo $material_name['name'] ?></td>
                <td><?php echo $purchasedata['quantity'] ?></td>
                <td><?php echo $purchasedata['rate'] ?></td>
              </tr>
              <!-- Data Add Modal -->
              <div class="modal fade" id="updatemodal" style="margin-left:auto !important; margin-right: auto !important;">
                <div class="modal-dialog" role="document">
                  <div class="modal-content" style="width: 750px !important; margin-top:70px !important;">
                    <div class="modal-header bg-secondary text-light">
                      <h5 class="modal-title" id="addmodellabel">Create New Purchase Voucher</h5>
                      <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="h3">&times;</span>
                      </button>
                    </div>
                    <form action="material_purchase.php" method="post" autocomplete="off">
                      <div class="modal-body">
                        <div class="row">
                          <div class="col">
                            <label style="font-weight: bold;">Date</label>
                            <input type="date" name="date" <?php if (!empty($date_error)) {
                                                              echo "class=\"form-control is-invalid\"";
                                                            } else {
                                                              echo "class=\"form-control inpv2\"";
                                                            } ?> value="<?php if (!empty($_SESSION['purchase_date'])) {
                                                                          echo $_SESSION['purchase_date'];
                                                                        }; ?>">
                            <span class="text-danger" style="font-size:12px; font-weight:bold;" style="font-weight:bold !important;"><?php echo $date_error; ?></span>
                          </div>
                          <div class="col">
                            <label style="font-weight: bold;">Voucher No</label>
                            <input type="number" name="voucher_no" <?php if (!empty($voucher_no_error)) {
                                                                      echo "class=\"form-control is-invalid\"";
                                                                    } else {
                                                                      echo "class=\"form-control inpv2\"";
                                                                    } ?> value="<?php if (!empty($_SESSION['purchase_voucher_no'])) {
                                                                                  echo $_SESSION['purchase_voucher_no'];
                                                                                }; ?>">
                            <span class="text-danger mb-2" style="font-size:12px; font-weight:bold;" style="font-weight:bold !important;"><?php echo $voucher_no_error; ?></span>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-6">
                            <label style="font-weight: bold;">Supplier A/C Code</label>
                            <div class="row">
                              <div style="width: 40%;">
                                <input type="text" id="addac_code" name="supplier_code_no" <?php if (!empty($supplier_name_error)) {
                                                                                              echo "class=\"form-control is-invalid\"";
                                                                                            } else {
                                                                                              echo "class=\"form-control inpv2\"";
                                                                                            } ?> style="padding-top: 2px; padding-bottom: 2px;" value="<?php if (!empty($_SESSION['purchase_supplier_name'])) {
                                                                                                                                                          echo $_SESSION['purchase_supplier_name'];
                                                                                                                                                        }; ?>">
                              </div>
                              <div style="width: 10%;">
                                <a href="supplier.php" target="_blank" style="width: 10%; padding: 2.5px; color:black; text-align: center;">
                                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0" />
                                  </svg>
                                </a>
                              </div>
                              <div class="col-6">
                                <div id='addac_name'>
                                  <input type="text" name="addac_name" disabled class="form-control inpv2 mb-1" style="padding-top: 2px; padding-bottom: 2px;">
                                </div>
                              </div>
                              <span class="text-danger mb-1" style="font-size:12px; font-weight:bold;"><?php echo $supplier_name_error; ?></span>
                            </div>
                          </div>
                          <div class="col-6">
                            <label style="font-weight: bold;">Material</label>
                            <select class="form-control inpv2 mb-2" name="material">
                              <?php
                              $materialdatas = $query->selectall('materials');
                              foreach ($materialdatas as $materialdata) {
                              ?>
                                <option value="<?php echo $materialdata['id']; ?>"><?php echo $materialdata['name']; ?></option>
                              <?php
                              }
                              ?>
                            </select>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <label style="font-weight: bold;">Quantity</label>
                            <input type="number" name="quantity" <?php if (!empty($quantity_error)) {
                                                                    echo "class=\"form-control is-invalid\"";
                                                                  } else {
                                                                    echo "class=\"form-control inpv2\"";
                                                                  } ?>>
                            <span class="text-danger mb-2" style="font-size:12px; font-weight:bold;"><?php echo $quantity_error; ?></span>
                          </div>
                          <div class="col">
                            <label style="font-weight: bold;">Rate</label>
                            <input type="text" name="rate" <?php if (!empty($rate_error)) {
                                                              echo "class=\"form-control is-invalid\"";
                                                            } else {
                                                              echo "class=\"form-control inpv2\"";
                                                            } ?>>
                            <span class="text-danger mb-2" style="font-size:12px; font-weight:bold;"><?php echo $rate_error; ?></span>
                          </div>
                        </div>
                        <div class="mt-2">
                          <button class="btn btn-secondary" data-bs-dismiss="model">Cancel</button>
                          <button class="btn btn-success" name="addbutton">Add Voucher</button>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            <?php
            };
            ?>
            <?php
            if (isset($_POST['total'])) {
              $supplier_id = $_POST['supplier_id'];
              $purchasestmt = $pdo->prepare("SELECT * FROM material_purchase WHERE supplier_id='$supplier_id'");
              $purchasestmt->execute();
              $purchasedatas = $purchasestmt->fetchAll();
              $total_amount = 0;

              foreach ($purchasedatas as $purchasedata) {
                $total_amount += $purchasedata['quantity'] * $purchasedata['rate'];
              }
            ?>
              <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>Total Amount:</td>
                <td><?php echo $total_amount;  ?></td>
              </tr>
            <?php
            }
            ?>
            <?php
            if (isset($_POST['commoditybtn'])) {
              $material_id = $_POST['material_id'];
              $purchasestmt = $pdo->prepare("SELECT * FROM material_purchase WHERE material_id='$material_id'");
              $purchasestmt->execute();
              $purchasedatas = $purchasestmt->fetchAll();
              $total_amount = 0;

              foreach ($purchasedatas as $purchasedata) {
                $total_amount += $purchasedata['quantity'] * $purchasedata['rate'];
              }

            ?>
              <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td>Total Amount:</td>
                <td><?php echo $total_amount;  ?></td>
              </tr>
            <?php
            }
            ?>
          </table>
          <div aria-label="Page navigation example" style="float:right;">
            <ul class="pagination">
              <li class="page-item"><a class="page-link" href="?pageno=1">First</a></li>
              <li class="page-item <?php if ($pageno <= 1) {
                                      echo 'disabled';
                                    } ?>">
                <a class="page-link" href="<?php if ($pageno <= 1) {
                                              echo '#';
                                            } else {
                                              echo "?pageno=" . ($pageno - 1);
                                            } ?>">Previous</a>
              </li>
              <li class="page-item"><a class="page-link" href="#"><?php echo $pageno; ?></a></li>
              <li class="page-item <?php if ($pageno >= $total_pages) {
                                      echo 'disabled';
                                    }; ?>">
                <a class="page-link" href="<?php if ($pageno >= $total_pages) {
                                              echo '#';
                                            } else {
                                              echo "?pageno=" . ($pageno + 1);
                                            } ?>">Next</a>
              </li>
              <li class="page-item"><a class="page-link" href="?pageno=<?php echo $total_pages; ?>">Last</a> </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>


  <!-- Data Add Modal -->
  <div class="modal fade" id="addmodal" style="margin-left:auto !important; margin-right: auto !important;">
    <div class="modal-dialog" role="document">
      <div class="modal-content" style="width: 750px !important; margin-top:70px !important;">
        <div class="modal-header bg-secondary text-light">
          <h5 class="modal-title" id="addmodellabel">Create New Purchase Voucher</h5>
          <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true" class="h3">&times;</span>
          </button>
        </div>
        <form action="material_purchase.php" method="post" autocomplete="off">
          <div class="modal-body">
            <div class="row">
              <div class="col">
                <label style="font-weight: bold;">Date</label>
                <input type="date" name="date" <?php if (!empty($date_error)) {
                                                  echo "class=\"form-control is-invalid\"";
                                                } else {
                                                  echo "class=\"form-control inpv2\"";
                                                } ?> value="<?php if (!empty($_SESSION['purchase_date'])) {
                                                              echo $_SESSION['purchase_date'];
                                                            }; ?>">
                <span class="text-danger" style="font-size:12px; font-weight:bold;" style="font-weight:bold !important;"><?php echo $date_error; ?></span>
              </div>
              <div class="col">
                <label style="font-weight: bold;">Voucher No</label>
                <input type="number" name="voucher_no" <?php if (!empty($voucher_no_error)) {
                                                          echo "class=\"form-control is-invalid\"";
                                                        } else {
                                                          echo "class=\"form-control inpv2\"";
                                                        } ?> value="<?php if (!empty($_SESSION['purchase_voucher_no'])) {
                                                                      echo $_SESSION['purchase_voucher_no'];
                                                                    }; ?>">
                <span class="text-danger mb-2" style="font-size:12px; font-weight:bold;" style="font-weight:bold !important;"><?php echo $voucher_no_error; ?></span>
              </div>
            </div>
            <div class="row">
              <div class="col-6">
                <label style="font-weight: bold;">Supplier A/C Code</label>
                <div class="row">
                  <div style="width: 40%;">
                    <input type="text" id="addac_code" name="supplier_code_no" <?php if (!empty($supplier_name_error)) {
                                                                                  echo "class=\"form-control is-invalid\"";
                                                                                } else {
                                                                                  echo "class=\"form-control inpv2\"";
                                                                                } ?> style="padding-top: 2px; padding-bottom: 2px;" value="<?php if (!empty($_SESSION['purchase_supplier_name'])) {
                                                                                                                                              echo $_SESSION['purchase_supplier_name'];
                                                                                                                                            }; ?>">
                  </div>
                  <div style="width: 10%;">
                    <a href="supplier.php" target="_blank" style="width: 10%; padding: 2.5px; color:black; text-align: center;">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0" />
                      </svg>
                    </a>
                  </div>
                  <div class="col-6">
                    <div id='addac_name'>
                      <input type="text" name="addac_name" disabled class="form-control inpv2 mb-1" style="padding-top: 2px; padding-bottom: 2px;">
                    </div>
                  </div>
                  <span class="text-danger mb-1" style="font-size:12px; font-weight:bold;"><?php echo $supplier_name_error; ?></span>
                </div>
              </div>
              <div class="col-6">
                <label style="font-weight: bold;">Material</label>
                <select class="form-control inpv2 mb-2" name="material">
                  <?php
                  $materialdatas = $query->selectall('materials');
                  foreach ($materialdatas as $materialdata) {
                  ?>
                    <option value="<?php echo $materialdata['id']; ?>"><?php echo $materialdata['name']; ?></option>
                  <?php
                  }
                  ?>
                </select>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label style="font-weight: bold;">Quantity</label>
                <input type="number" name="quantity" <?php if (!empty($quantity_error)) {
                                                        echo "class=\"form-control is-invalid\"";
                                                      } else {
                                                        echo "class=\"form-control inpv2\"";
                                                      } ?>>
                <span class="text-danger mb-2" style="font-size:12px; font-weight:bold;"><?php echo $quantity_error; ?></span>
              </div>
              <div class="col">
                <label style="font-weight: bold;">Rate</label>
                <input type="text" name="rate" <?php if (!empty($rate_error)) {
                                                  echo "class=\"form-control is-invalid\"";
                                                } else {
                                                  echo "class=\"form-control inpv2\"";
                                                } ?>>
                <span class="text-danger mb-2" style="font-size:12px; font-weight:bold;"><?php echo $rate_error; ?></span>
              </div>
            </div>
            <div class="mt-2">
              <button class="btn btn-secondary" data-bs-dismiss="model">Cancel</button>
              <button class="btn btn-success" name="addbutton">Add Voucher</button>
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