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

  if (isset($_POST['remarkeditbtn'])) {
    $updateid = $_POST['remarkupdateid'];
    $remark = $_POST['remarkedit'];
    $query->editgfcmcstockremark($remark, $updateid);
  }

  if (isset($_POST['editlooseinoutbtn'])) {
    $updateid = $_POST['editlooseinoutid'];
    $loosein_size = $_POST['loosein_size'];
    $loosein_kg = $_POST['loosein_kg'];
    $looseout_size = $_POST['looseout_size'];
    $looseout_kg = $_POST['looseout_kg'];
    $loosein_pcs = $_POST['loosein_pcs'];
    $looseout_pcs = $_POST['looseout_pcs'];

    $query->editgfcmcstocklooseinorout($loosein_size, $loosein_kg, $looseout_size, $looseout_kg, $loosein_pcs, $looseout_pcs, $updateid);
  }

  if (isset($_POST['updatebtn'])) {
    $newdate = $_POST['newdate'];
    $newparticular = $_POST['newparticular'];
    $newcommondity_id = $_POST['newcommondity_id'];
    $newfish_type = $_POST['newfish_type'];
    $newsize = $_POST['newsize'];
    $newkg = $_POST['newkg'];
    $newmc = $_POST['newmc'];
    $newcountry = $_POST['newcountry'];
    $updateid = $_POST['upid'];

    $query->updategfcmcstock($newdate, $newparticular, $newcommondity_id, $newfish_type,  $newsize, $newkg, $newmc, $newcountry, $updateid);
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
        <div class="card-header bg-info">
          <form class="" action="" method="post">

            <h5 style="font-weight:bold;" class="text-light d-inline">GFC MC STOCK INFO</h5>
            <!-- <button type="button" class="btn btn-secondary float-end" data-bs-toggle="modal" data-bs-target="#add">Add Mc Data</button> -->
            <a href="gfcmcstock.php" type="button" class="btn btn-danger float-end ms-2">Back</a>
            <?php
            $size = $_GET['sizeinfo'];
            $commondity_id = $_GET['commondity'];
            $country = $_GET['country'];
            $fish_type = $_GET['fish_type'];
            $kgstmt = $pdo->prepare("SELECT DISTINCT kg FROM gfcmcstock WHERE commondity_id='$commondity_id' AND size='$size' AND country='$country' AND fish_type='$fish_type'");
            $kgstmt->execute();
            $kgdatas = $kgstmt->fetchall();
            ?>
            <button type="submit" name="view" class="btn btn-secondary float-end ms-2">View</button>
            <select class="form-control inpv2 mb-2 w-25 d-inline float-end" style="border:none !important;" name="kgsearch">
              <option value="">View Each Kg</option>
              <?php
              foreach ($kgdatas as $kgdata) {
              ?>
                <option value="<?php echo $kgdata['kg']; ?>"><?php echo $kgdata['kg']; ?></option>
              <?php
              }
              ?>
            </select>
        </div>
        </form>
        <div class="card-body">
          <table class="table table-hover table-bordered table-striped">
            <tr>
              <th rowspan="2" style="padding-top: 22px;">Date</th>
              <th rowspan="2" style="padding-top: 22px;">Particular</th>
              <th rowspan="2" style="padding-top: 22px;">Commondity</th>
              <th rowspan="2" style="padding-top: 22px;">Country</th>
              <th rowspan="2" style="padding-top: 22px;">Size</th>
              <th rowspan="2" style="padding-top: 22px;">Kg</th>
              <th rowspan="2" style="padding-top: 22px;">Mc</th>
              <th rowspan="2" class="text-center" style="padding-top: 15px !important;">Balance <br>Mc</th>
              <th colspan="3" style="text-align: center;">Loose In</th>
              <th colspan="3" style="text-align: center;">Loose Out</th>
              <th rowspan="2" style="padding-top: 22px; padding-left: 22px;">Remark</th>
            </tr>
            <tr>
              <th>Size</th>
              <th>Kg</th>
              <th>Pcs</th>
              <th>Size</th>
              <th>Kg</th>
              <th>Pcs</th>
            </tr>
            <?php


            if (isset($_POST['view']) && !empty($_POST['kgsearch'])) {
              $kgsearch = $_POST['kgsearch'];
              $sizeinfostmt2 = $pdo->prepare("SELECT * FROM gfcmcstock WHERE commondity_id='$commondity_id' AND size='$size' AND country='$country' AND kg='$kgsearch'");
              $sizeinfostmt2->execute();
              $sizeinfodatas = $sizeinfostmt2->fetchall();
            } else {
              $sizeinfostmt = $pdo->prepare("SELECT * FROM gfcmcstock WHERE commondity_id='$commondity_id' AND size='$size' AND country='$country'");
              $sizeinfostmt->execute();
              $sizeinfodatas = $sizeinfostmt->fetchall();
            }
            foreach ($sizeinfodatas as $sizeinfodata) {
              $kg = $sizeinfodata['kg'];
              $item_id = $sizeinfodata['commondity_id'];
              $commonditydata = $query->select('item', $item_id, 'item_id');
            ?>
              <tr style="<?php if (str_contains($sizeinfodata['particular'], 'Ship') || str_contains($sizeinfodata['particular'], 'T/O') || str_contains($sizeinfodata['particular'], 't/o')) {
                            echo 'background-color:rgba(255, 0, 0, 0.3) !important;';
                          } ?>" data-bs-toggle="<?php if (!str_contains($sizeinfodata['particular'], "HHK") || !str_contains($sizeinfodata['particular'], "hhk")) {
                                                  echo "modal";
                                                } ?>" data-bs-target="#update<?= $sizeinfodata['id']; ?>">
                <td><?php echo date('d-m-Y', strtotime($sizeinfodata['date'])); ?></td>
                <td><?php echo $sizeinfodata['particular']; ?></td>
                <td><?php echo $commonditydata['item_name'] . '(' . $sizeinfodata['fish_type'] . ')'; ?></td>
                <td><?php echo $sizeinfodata['country']; ?></td>
                <td><?php echo $sizeinfodata['size']; ?></td>
                <td><?php echo $sizeinfodata['kg']; ?></td>
                <td><?php echo $sizeinfodata['mc']; ?></td>
                <td><?php echo $sizeinfodata['balance_mc']; ?></td>
                <td data-bs-toggle="modal" data-bs-target="#loosemodal<?= $sizeinfodata['id']; ?>"><?php echo $sizeinfodata['loosein_size']; ?></td>
                <td data-bs-toggle="modal" data-bs-target="#loosemodal<?= $sizeinfodata['id']; ?>"><?php echo $sizeinfodata['loosein_kg']; ?></td>
                <td data-bs-toggle="modal" data-bs-target="#loosemodal<?= $sizeinfodata['id']; ?>"><?php if ($sizeinfodata['loosein_pcs'] != 0) {
                                                                                                      echo $sizeinfodata['loosein_pcs'];
                                                                                                    }; ?></td>
                <td data-bs-toggle="modal" data-bs-target="#loosemodal<?= $sizeinfodata['id']; ?>"><?php echo $sizeinfodata['looseout_size']; ?></td>
                <td data-bs-toggle="modal" data-bs-target="#loosemodal<?= $sizeinfodata['id']; ?>"><?php echo $sizeinfodata['looseout_kg']; ?></td>
                <td data-bs-toggle="modal" data-bs-target="#loosemodal<?= $sizeinfodata['id']; ?>"><?php if ($sizeinfodata['looseout_pcs'] != 0) {
                                                                                                      echo $sizeinfodata['looseout_pcs'];
                                                                                                    }; ?></td>
                <td data-bs-toggle="modal" data-bs-target="#remark<?= $sizeinfodata['id']; ?>"><?php echo $sizeinfodata['remark']; ?></td>
              </tr>
              <div class="modal fade" id="loosemodal<?= $sizeinfodata['id']; ?>">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header bg-info text-light">
                      <h5 class="modal-title">loose In/Out Edit Data</h5>
                    </div>
                    <form action="" method="post">
                      <input type="hidden" name="editlooseinoutid" value="<?= $sizeinfodata['id']; ?>" class="form-control inpv2">
                      <div class="modal-body">
                        <div class="row">
                          <div class="col">
                            <label>loose In Size</label>
                            <input type="text" name="loosein_size" value="<?= $sizeinfodata['loosein_size']; ?>" class="form-control inpv2 mb-2">
                          </div>
                          <div class="col">
                            <label>loose Out Size</label>
                            <input type="text" name="looseout_size" value="<?= $sizeinfodata['looseout_size']; ?>" class="form-control inpv2 mb-2">
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <label>loose In Kg</label>
                            <input type="text" name="loosein_kg" value="<?= $sizeinfodata['loosein_kg']; ?>" class="form-control inpv2 mb-2">
                          </div>
                          <div class="col">
                            <label>loose Out Kg</label>
                            <input type="text" name="looseout_kg" value="<?= $sizeinfodata['looseout_kg']; ?>" class="form-control inpv2 mb-2">
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <label>loose in Pcs</label>
                            <input type="number" name="loosein_pcs" value="<?= $sizeinfodata['loosein_pcs']; ?>" class="form-control inpv2 mb-2">
                          </div>
                          <div class="col">
                            <label>loose out Pcs</label>
                            <input type="number" name="looseout_pcs" value="<?= $sizeinfodata['looseout_pcs']; ?>" class="form-control inpv2 mb-2">
                          </div>
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" name="editlooseinoutbtn">Save</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
              <div class="modal fade" id="remark<?= $sizeinfodata['id']; ?>">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header bg-info text-light">
                      <h5 class="modal-title">Make A Remark</h5>
                    </div>
                    <form action="" method="post">
                      <input type="hidden" name="remarkupdateid" value="<?= $sizeinfodata['id']; ?>">
                      <div class="modal-body">
                        <label for="">Remark</label>
                        <textarea name="remarkedit" rows="3" cols="80" class="form-control inpv2"><?= $sizeinfodata['remark']; ?></textarea>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" name="remarkeditbtn">Save</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
              <div class="modal fade" id="update<?= $sizeinfodata['id']; ?>">
                <div class="modal-dialog" role="document">
                  <div class="modal-content" style="width: 650px !important; margin-top:70px !important;">
                    <div class="modal-header bg-secondary text-light">
                      <h1 class="modal-title fs-5">Update Data</h1>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="" method="post">
                      <input type="hidden" name="upid" value="<?php echo $sizeinfodata['id']; ?>">
                      <div class="modal-body">
                        <div class="row">
                          <div class="col">
                            <label>Date</label>
                            <input type="date" name="newdate" class="form-control inpv2 mb-2" value="<?php echo $sizeinfodata['date']; ?>">
                            <label>Commondity</label>
                            <div class="col">
                              <div class="d-flex">
                                <div class="col">
                                  <select class="form-control inpv2 mb-2" name="newcommondity_id">
                                    <?php
                                    $form7commonditystmt = $pdo->prepare("SELECT DISTINCT item_id FROM item");
                                    $form7commonditystmt->execute();
                                    $form7commonditydatas = $form7commonditystmt->fetchall();
                                    foreach ($form7commonditydatas as $form7commonditydata) {
                                      $item_id = $form7commonditydata['item_id'];
                                      $commonditydata = $query->select('item', $item_id, 'item_id');
                                    ?>
                                      <option value="<?php echo $commonditydata['item_id']; ?>" <?php if ($sizeinfodata['commondity_id'] == $commonditydata['item_id']) {
                                                                                                  echo "selected";
                                                                                                } ?>><?php echo $commonditydata['item_name']; ?></option>
                                    <?php
                                    }
                                    ?>
                                  </select>
                                </div>
                                <div class="col ms-2">
                                  <select name="newfish_type" id="commondityid3" class="form-control inpv2">
                                    <option <?php if($sizeinfodata['fish_type'] == 'G'){ echo "selected"; } ?> value="G">G</option>
                                    <option <?php if($sizeinfodata['fish_type'] == 'egg'){ echo "selected"; } ?> value="egg">egg</option>
                                    <option <?php if($sizeinfodata['fish_type'] == 'ggs'){ echo "selected"; } ?> value="ggs">ggs</option>
                                    <option <?php if($sizeinfodata['fish_type'] == 'fillet'){ echo "selected"; } ?> value="fillet">fillet</option>
                                    <option <?php if($sizeinfodata['fish_type'] == 'W'){ echo "selected"; } ?> value="W">W</option>
                                    <option <?php if($sizeinfodata['fish_type'] == 'Cut_piece'){ echo "selected"; } ?> value="Cut_piece">Cut Piece</option>
                                    <option <?php if($sizeinfodata['fish_type'] == 'Scaless'){ echo "selected"; } ?> value="Scaless">Scaless</option>
                                    <option <?php if($sizeinfodata['fish_type'] == 'Bls'){ echo "selected"; } ?> value="Bls">Bl's</option>
                                  </select>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="col">
                            <label>Particular</label>
                            <textarea name="newparticular" rows="4" class="form-control inpv2 mb-2"><?php echo $sizeinfodata['particular']; ?></textarea>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <label>Country</label>
                            <select class="form-control inpv2 mb-2" name="newcountry">

                              <?php
                              $countrystmt = $pdo->prepare("SELECT DISTINCT country FROM hhkmcstock WHERE country IS NOT NULL");
                              $countrystmt->execute();
                              $countrydatas = $countrystmt->fetchall();
                              foreach ($countrydatas as $countrydata) {
                              ?>
                                <option value="<?php echo $countrydata['country']; ?>" <?php if ($countrydata['country'] == $sizeinfodata['country']) {
                                                                                          echo 'selected';
                                                                                        }; ?>><?php echo $countrydata['country']; ?></option>
                              <?php
                              }
                              ?>
                            </select>
                          </div>
                          <div class="col">
                            <label>Size</label>
                            <input type="text" name="newsize" class="form-control inpv2 mb-2" value="<?php echo $sizeinfodata['size']; ?>">
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <label>Kg</label>
                            <input type="text" name="newkg" class="form-control inpv2 mb-2" value="<?php echo $sizeinfodata['kg']; ?>">
                          </div>
                          <div class="col">
                            <label>Mc</label>
                            <input type="number" name="newmc" class="form-control inpv2 mb-2" value="<?php echo $sizeinfodata['mc']; ?>">
                          </div>
                        </div>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-success" name="updatebtn">Update</button>
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
    </div>
  </div>
  <?php
  $bootstrap->javascript();
  ?>
</body>

</html>
