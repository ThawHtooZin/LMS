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
      $pcsperf7 = $_POST['pcsperf7'];
      $updateid = $_POST['id'];

      $query->updatetclcountry($country, $pcsperf7, $updateid);
    }

    if(isset($_POST['addsize'])){
      $id = $_POST['id'];
      $size = $_POST['size'];
      $query->addsize($id ,$size);
    }

    if(isset($_POST['addform7'])){
      $date = $_POST['date'];
      $commondity_id = $_POST['item_id'];
      $supplier_name = $_POST['supplier_id'];
      $type = $_POST['type'];
      $size = $_POST['size'];
      $viss = $_POST['viss'];

      $query->addform7($date, $commondity_id, $supplier_name, $type, $size, $viss);
    }

    if(isset($_POST['deleteform7'])){
      $deleteid = $_POST['deleteid'];
      $query->form7tcldelete($deleteid);
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
        <div class="card mt-1">
          <form action="form_7_tcl.php" method="post">
            <div class="card-header bg-info text-light pb-3">
              <b class="h5">Link Mark Limited (F-7) TCL</b>
              <button type="submit" name="searchbtn" class="btn btn-secondary btn-sm float-end">View</button>
              <select name="searchsize" class="form-control inpv2 d-inline float-end me-2" style="width:200px !important; height:30px !important; padding:0px 5px;">
                <option value="">Select Size</option>
                <?php
                $commonstmt = $pdo->prepare("SELECT DISTINCT size FROM form7stocktcl");
                $commonstmt->execute();
                $commondatas = $commonstmt->fetchAll();

                foreach ($commondatas as $commondata) {
                  $size = $commondata['size'];
                  ?>
                  <option value="<?php echo $size; ?>"><?php echo $size; ?></option>
                  <?php
                }
                ?>
              </select>
              <select name="commondity_id" class="form-control inpv2 d-inline float-end me-2" style="width:200px !important; height:30px !important; padding:0px 5px;">
                <option value="">Select Commondity</option>
                <?php
                $commonstmt = $pdo->prepare("SELECT DISTINCT item_id FROM form7stocktcl");
                $commonstmt->execute();
                $commondatas = $commonstmt->fetchAll();

                foreach ($commondatas as $commondata) {
                  $item_id = $commondata['item_id'];
                  $commonditydata = $query->select('item', $item_id, 'item_id');
                  ?>
                  <option value="<?php echo $commondata['item_id']; ?>"><?php echo $commonditydata['item_name']; ?></option>
                  <?php
                }
                 ?>
              </select>
              <input type="date" name="searchdate" value="" class="form-control inpv2 d-inline float-end me-2" style="width:200px !important;">
            </div>
          </form>
          <div class="card-body">
            <table class="table table-hover table-striped table-bordered">
              <tr>
                <th>Date</th>
                <th>Fish Name</th>
                <th>Supplier Name</th>
                <th>Type</th>
                <th>Country</th>
                <th>Size</th>
                <th>Viss</th>
                <th>Kg</th>
                <th>Pcs per Vr</th>
                <th>Pcs per F-7</th>
                <!-- <th>Action</th> -->
              </tr>
              <?php
              if (isset($_POST['searchbtn']) && !empty($_POST['commondity_id']) && !empty($_POST['searchdate']) && !empty($_POST['searchsize'])) {

                $commondity_id = $_POST['commondity_id'];
                $searchdate = $_POST['searchdate'];
                $searchsize = $_POST['searchsize'];
                $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT country) FROM form7stocktcl WHERE item_id='$commondity_id' AND date='$searchdate' AND size='$searchsize'");
                $commonditycountstmt->execute();
                $commonditycountdatas = $commonditycountstmt->fetchColumn();
                for ($i=0; $i < $commonditycountdatas; $i++) {

                  $countrystmt = $pdo->prepare("SELECT DISTINCT country FROM form7stocktcl WHERE item_id='$commondity_id' AND date='$searchdate' AND size='$searchsize'");
                  $countrystmt->execute();
                  $countrydata = $countrystmt->fetchall();
                  $country = $countrydata[$i]['country'];

                  $stmt = $pdo->prepare("SELECT * FROM form7stocktcl WHERE country='$country' AND item_id='$commondity_id' AND date='$searchdate' AND size='$searchsize'");
                  $stmt->execute();
                  $datas = $stmt->fetchall();

                foreach ($datas as $form7data) {
                  $item_id = $form7data['item_id'];
                  $commonditydata = $query->select('item', $item_id, 'item_id');
                  $supplier_id = $form7data['supplier_name'];
                  $supplierdata = $query->select('acname', $supplier_id, 'code_no');

                  ?>
                  <tr data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $form7data['id']; ?>">
                    <td><?php if($form7data['date'] != "0000-00-00"){ echo date('d-m-Y', strtotime($form7data['date']));}; ?></td>
                    <td><?php echo $commonditydata['item_name']; ?></td>
                    <td><?php echo $supplierdata['ac_name']; ?></td>
                    <td><?php echo $form7data['type']; ?></td>
                    <td><?php echo $form7data['country']; ?></td>
                    <td><?php echo $form7data['size']; ?></td>
                    <td><?php echo $form7data['viss']; ?></td>
                    <td><?php if(!empty($form7data['kg'])){echo round($form7data['kg'], 2);}; ?></td>
                    <td><?php echo $form7data['pcspervr']; ?></td>
                    <td><?php if(!empty($form7data['pcsperf7'])){ echo $form7data['pcsperf7']; }; ?></td>
                    <!-- <td>
                      <form action="form_7_tcl.php" method="post">
                        <input type="hidden" name="deleteid" value="<?php echo $form7data['id']; ?>">
                        <button type="submit" name="deleteform7" class="btn btn-danger btn-sm">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16"><path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/></svg>
                        </button>
                      </form>
                    </td> -->
                  </tr>
                  <?php
                  $date = $form7data['date'];
                  $item_id = $form7data['item_id'];
                  $size = $form7data['size'];
                }
                $totalvissstmt = $pdo->prepare("SELECT SUM(viss) AS total_viss FROM form7stocktcl WHERE item_id='$item_id' AND date='$date' AND size='$size'");
                $totalvissstmt->execute();
                $totalvissdata = $totalvissstmt->fetch(PDO::FETCH_ASSOC);
                $totalkgstmt = $pdo->prepare("SELECT SUM(kg) AS total_kg FROM form7stocktcl WHERE item_id='$item_id' AND date='$date' AND size='$size'");
                $totalkgstmt->execute();
                $totalkgdata = $totalkgstmt->fetch(PDO::FETCH_ASSOC);
                $totalpcsstmt = $pdo->prepare("SELECT SUM(pcspervr) AS total_pcs FROM form7stocktcl WHERE item_id='$item_id' AND date='$date' AND size='$size'");
                $totalpcsstmt->execute();
                $totalpcsdata = $totalpcsstmt->fetch(PDO::FETCH_ASSOC);
                $totalpcsf7stmt = $pdo->prepare("SELECT SUM(pcsperf7) AS total_pcsf7 FROM form7stocktcl WHERE item_id='$item_id' AND date='$date' AND size='$size'");
                $totalpcsf7stmt->execute();
                $totalpcsf7data = $totalpcsf7stmt->fetch(PDO::FETCH_ASSOC);
                ?>
                <tr style="font-weight: bold !important;">
                  <td></td>
                  <td>Total</td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td><?php echo round($totalvissdata['total_viss'], 3); ?></td>
                  <td><?php echo round($totalkgdata['total_kg'], 2); ?></td>
                  <td><?php if(!empty($totalpcsdata['total_pcs'])){ echo $totalpcsdata['total_pcs']; }; ?></td>
                  <td><?php if(!empty($totalpcsf7data['total_pcsf7'])){ echo $totalpcsf7data['total_pcsf7']; }; ?></td>
                  <!-- <td></td> -->
                </tr>
                <?php
              }
            }elseif(isset($_POST['searchbtn2']) && !empty($_POST['type'])){
              $type = $_POST['type'];
              $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT country) FROM form7stocktcl WHERE type='$type'");
              $commonditycountstmt->execute();
              $commonditycountdatas = $commonditycountstmt->fetchColumn();
              for ($i=0; $i < $commonditycountdatas; $i++) {

                $countrystmt = $pdo->prepare("SELECT DISTINCT country FROM form7stocktcl WHERE type='$type'");
                $countrystmt->execute();
                $countrydata = $countrystmt->fetchall();
                $country = $countrydata[$i]['country'];

                $stmt = $pdo->prepare("SELECT * FROM form7stocktcl WHERE country='$country' AND type='$type'");
                $stmt->execute();
                $datas = $stmt->fetchall();

              foreach ($datas as $form7data) {
                $item_id = $form7data['item_id'];
                $commonditydata = $query->select('item', $item_id, 'item_id');
                $supplier_id = $form7data['supplier_name'];
                $supplierdata = $query->select('acname', $supplier_id, 'code_no');
                ?>
                <tr data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $form7data['id']; ?>">
                  <td><?php if($form7data['date'] != "0000-00-00"){ echo date('d-m-Y', strtotime($form7data['date']));}; ?></td>
                  <td><?php echo $commonditydata['item_name']; ?></td>
                  <td><?php echo $supplierdata['ac_name']; ?></td>
                  <td><?php echo $form7data['type']; ?></td>
                  <td><?php echo $form7data['country']; ?></td>
                  <td><?php echo $form7data['size']; ?></td>
                  <td><?php echo $form7data['viss']; ?></td>
                  <td><?php if(!empty($form7data['kg'])){echo round($form7data['kg'], 2);}; ?></td>
                  <td><?php echo $form7data['pcspervr']; ?></td>
                  <td><?php if(!empty($form7data['pcsperf7'])){ echo $form7data['pcsperf7']; }; ?></td>
                  <!-- <td>
                    <form action="form_7_tcl.php" method="post">
                      <input type="hidden" name="deleteid" value="<?php echo $form7data['id']; ?>">
                      <button type="submit" name="deleteform7" class="btn btn-danger btn-sm">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16"><path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/></svg>
                      </button>
                    </form>
                  </td> -->
                </tr>
                <div class="modal fade" id="updatemodal<?php echo $form7data['id']; ?>">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
                      <div class="modal-header bg-warning text-light">
                        <h1 class="modal-title fs-5">Update Data</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                        <form action="form_7_tcl.php" method="post">
                          <input type="hidden" name="id" value="<?php echo $form7data['id']; ?>">
                          <div class="modal-body">
                            <?php
                            $idd = $form7data['id'];
                            $updata = $query->select('form7stocktcl', $idd, 'id');
                            ?>
                            <div class="row">
                              <div class="col">
                                <label>Country</label>
                                <input type="text" name="country" class="form-control inpv2 mt-1" value="<?php echo $updata['country']; ?>">
                              </div>
                              <div class="col">
                                <label>Pcs Per F7</label>
                                <input type="text" name="pcsperf7" class="form-control inpv2 mt-1" value="<?php echo $updata['pcsperf7']; ?>">
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                          <button type="submit" class="btn btn-warning" name="update">Update</button>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
                <?php
                $date = $form7data['date'];
                $item_id = $form7data['item_id'];
                $country = $form7data['country'];
              }
              // $totalvissstmt = $pdo->prepare("SELECT SUM(viss) AS total_viss FROM form7stocktcl WHERE type='$type' AND country='$country'");
              // $totalvissstmt->execute();
              // $totalvissdata = $totalvissstmt->fetch(PDO::FETCH_ASSOC);
              // $totalkgstmt = $pdo->prepare("SELECT SUM(kg) AS total_kg FROM form7stocktcl WHERE type='$type' AND country='$country'");
              // $totalkgstmt->execute();
              // $totalkgdata = $totalkgstmt->fetch(PDO::FETCH_ASSOC);
              // $totalpcsstmt = $pdo->prepare("SELECT SUM(pcspervr) AS total_pcs FROM form7stocktcl WHERE type='$type' AND country='$country'");
              // $totalpcsstmt->execute();
              // $totalpcsdata = $totalpcsstmt->fetch(PDO::FETCH_ASSOC);
              // $totalpcsf7stmt = $pdo->prepare("SELECT SUM(pcsperf7) AS total_pcsf7 FROM form7stocktcl WHERE type='$type' AND country='$country'");
              // $totalpcsf7stmt->execute();
              // $totalpcsf7data = $totalpcsf7stmt->fetch(PDO::FETCH_ASSOC);
              ?>
              <!-- <tr style="font-weight: bold !important;">
                <td></td>
                <td>Total</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td><?php //echo round($totalvissdata['total_viss'], 3); ?></td>
                <td><?php //echo round($totalkgdata['total_kg'], 2); ?></td>
                <td><?php //if(!empty($totalpcsdata['total_pcs'])){ echo $totalpcsdata['total_pcs']; }; ?></td>
                <td><?php //if(!empty($totalpcsf7data['total_pcsf7'])){ echo $totalpcsf7data['total_pcsf7']; }; ?></td>
              </tr> -->
              <?php
              }
            }else{
              $commonditycountstmt = $pdo->prepare("SELECT COUNT(DISTINCT item_id) FROM form7stocktcl");
              $commonditycountstmt->execute();
              $commonditycountdatas = $commonditycountstmt->fetchColumn();
              for ($i=0; $i < $commonditycountdatas; $i++) {
                $commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM form7stocktcl");
                $commonditystmt->execute();
                $commonditydata = $commonditystmt->fetchall();
                $commondity_id = $commonditydata[$i]['item_id'];

                $stmt = $pdo->prepare("SELECT * FROM form7stocktcl WHERE item_id='$commondity_id'");
                $stmt->execute();
                $datas = $stmt->fetchall();
                foreach ($datas as $form7data) {
                  $item_id = $form7data['item_id'];
                  $country = $form7data['country'];
                  $commonditydata = $query->select('item', $item_id, 'item_id');
                  $supplier_id = $form7data['supplier_name'];
                  $supplierdata = $query->select('acname', $supplier_id, 'code_no');

                    ?>
                   <tr>
                     <td><?php if($form7data['date'] != "0000-00-00"){ echo date('d-m-Y', strtotime($form7data['date']));}; ?></td>
                     <td><?php echo $commonditydata['item_name']; ?></td>
                     <td><?php echo $supplierdata['ac_name']; ?></td>
                     <td><?php echo $form7data['type']; ?></td>
                     <td data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $form7data['id']; ?>" style="cursor:pointer;"><?php echo $form7data['country']; ?></td>
                     <td data-bs-target="#addsizemodal<?php echo $form7data['id']; ?>" style="cursor:pointer;"><?php echo $form7data['size']; ?></td>
                     <td data-bs-toggle="modal" data-bs-target="#adjustvissandcountry<?php echo $form7data['id']; ?>" style="cursor:pointer;"><?php echo $form7data['viss']; ?></td>
                     <td><?php if(!empty($form7data['kg'])){echo round($form7data['kg'], 2);}; ?></td>
                     <td><?php echo $form7data['pcspervr']; ?></td>
                     <td data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $form7data['id']; ?>" style="cursor:pointer;"><?php if(!empty($form7data['pcsperf7'])){ echo $form7data['pcsperf7']; }; ?></td>
                     <!-- <td>
                       <form action="form_7_tcl.php" method="post">
                         <input type="hidden" name="deleteid" value="<?php echo $form7data['id']; ?>">
                         <button type="submit" name="deleteform7" class="btn btn-danger btn-sm">
                           <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16"><path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/></svg>
                         </button>
                       </form>
                     </td> -->
                   </tr>
                  <div class="modal fade" id="updatemodal<?php echo $form7data['id']; ?>">
                    <div class="modal-dialog" role="document">
                      <div class="modal-content" style="width: 650px; !important; margin-top:70px !important;">
                        <div class="modal-header bg-warning text-light">
                          <h1 class="modal-title fs-5">Update Data</h1>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                          <form action="form_7_tcl.php" method="post">
                            <input type="hidden" name="id" value="<?php echo $form7data['id']; ?>">
                            <div class="modal-body">
                              <?php
                              $idd = $form7data['id'];
                              $updata = $query->select('form7stocktcl', $idd, 'id');
                              ?>
                              <div class="row">
                                <div class="col">
                                  <label>Country</label>
                                  <input type="text" name="country" class="form-control inpv2 mt-1" value="<?php echo $updata['country']; ?>">
                                </div>
                                <div class="col">
                                  <label>Pcs Per F7</label>
                                  <input type="text" name="pcsperf7" class="form-control inpv2 mt-1" value="<?php echo $updata['pcsperf7']; ?>">
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-warning" name="update">Update</button>
                          </div>
                        </form>
                      </div>
                    </div>
                  </div>
                  <div class="modal fade" id="addsizemodal<?php echo $form7data['id']; ?>">
                    <div class="modal-dialog" role="document">
                      <div class="modal-content">
                        <div class="modal-header bg-warning text-light">
                          <h1 class="modal-title fs-5">Add Size</h1>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                          <form action="form_7_tcl.php" method="post">
                            <input type="hidden" name="id" value="<?php echo $form7data['id']; ?>">
                            <div class="modal-body">
                              <label>Size</label>
                              <input type="text" name="size" class="form-control inpv2 mt-2">
                            </div>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-success" name="addsize">Add Size</button>
                          </div>
                        </form>
                      </div>
                    </div>
                  </div>
                  <?php
                }
                }
              }

                ?>
            </table>
        </div>
      </div>
    </div>
    <div class="modal fade" id="addmodal">
      <div class="modal-dialog" role="document">
        <div class="modal-content"  style="width: 650px; !important; margin-top:70px !important;">
          <div class="modal-header bg-secondary text-light">
            <h1 class="modal-title fs-5">Add New Data</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <form action="form_7_tcl.php" method="post">
              <div class="modal-body">
                <div class="row">
                  <div class="col">
                    <label>Date</label>
                    <input type="date" name="date" class="form-control inpv2 mb-2">
                  </div>
                  <div class="col">
                    <label>Fish Name</label>
                    <select class="form-control inpv2 mb-2" name="item_id">
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
                </div>
                <div class="row">
                  <div class="col">
                    <label>Supplier Name</label>
                    <select class="form-control inpv2 mb-2" name="supplier_id">
                      <?php
                      $supplierstmt = $pdo->prepare("SELECT * FROM acname WHERE code_no LIKE '4000%'");
                      $supplierstmt->execute();
                      $supplierdatas = $supplierstmt->fetchall();

                      foreach ($supplierdatas as $supplierdata) {
                        ?>
                        <option value="<?php echo $supplierdata['code_no']; ?>"><?php echo $supplierdata['ac_name']; ?></option>
                        <?php
                      }
                      ?>
                    </select>
                  </div>
                  <div class="col">
                    <label>Type</label>
                    <select class="form-control inpv2 mb-2" name="type">
                      <option value="">Select Type</option>
                      <option value="frozen">Frozen</option>
                      <option value="tcl">TCl</option>
                    </select>
                  </div>
                </div>
                <div class="row">
                  <div class="col">
                    <label>Size</label>
                    <input type="text" name="size" class="form-control inpv2 mb-2">
                  </div>
                  <div class="col">
                    <label>Viss</label>
                    <input type="text" name="viss" Class="form-control inpv2 mb-2">
                  </div>
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-success" name="addform7">Add</button>
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
