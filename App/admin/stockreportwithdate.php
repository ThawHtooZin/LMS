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
  <div class="row">
    <div class="sidebarcol" id="sidebar">
      <?php
      include 'sidebar.php';
      ?>
    </div>
    <div class="contentcol" id="content">
      <?php require 'navbar.php'; ?>
      <div class="card">
        <form action="" method="post">
          <div class="card-header bg-info">
            <?php
              $countrystmt = $pdo->prepare("SELECT DISTINCT country FROM hhkmcstock WHERE country IS NOT NULL
              UNION
              SELECT DISTINCT country FROM gfcmcstock WHERE country IS NOT NULL;
              ");
              $countrystmt->execute();
              $countrydatas = $countrystmt->fetchall();
            ?>
            <h4 style="font-weight:bold;" class="text-light d-inline">Mc Reports With Date</h4>
            <a href="stockreport.php" class="btn btn-danger btn-sm float-end ms-2">Back</a>
            <a href="export.php?table_name=mcstockreport" class="btn btn-primary btn-sm float-end ms-2">Excel Report</a>
            <button type="button" name="date" class="btn btn-secondary text-light btn-sm float-end me-1" data-bs-toggle="modal" data-bs-target="#datesearch">Filter With Date</button>
          </div>
        </form>
        <div class="card-body">
          <?php
          ?>
          
          <hr>
          <?php
          foreach ($countrydatas as $countrydata) {

            $country = $countrydata['country'];

            $hhkmcstockkgstmt = $pdo->prepare("SELECT commondity_id FROM hhkmcstock WHERE country='$country'");
            $hhkmcstockkgstmt->execute();
            $hhkmcstockkgdatas = $hhkmcstockkgstmt->fetchall();
          ?>
            <table class="table table-hover table-bordered table-striped hide" id="<?php echo $countrydata['country']; ?>table">
              <tr class="text-center">
                <th rowspan="2" style="padding-top:30px;">No</th>
                <th rowspan="2" style="padding-top:30px;">Fish Name</th>
                <th rowspan="2" style="padding-top:30px;">Country</th>
                <th rowspan="2" style="padding-top:30px;">Size</th>
                <th rowspan="2" style="padding-top:30px;">Kg</th>
                <th>HHK</th>
                <th>GFC</th>
                <th>Total</th>
              </tr>
              <tr class="text-center">
                <th>Mc</th>
                <th>Mc</th>
                <th>Mc</th>
              </tr>
              <?php
              $id = 0;
              if (isset($_POST['searchdatebtn']) && !empty($_POST['datefrom']) && !empty($_POST['dateto'])) {
                $datefrom = $_POST['datefrom'];
                $dateto = $_POST['dateto'];

                $hhkmcstockcommonditystmt = $pdo->prepare("SELECT DISTINCT commondity_id FROM hhkmcstock WHERE country = '$country' AND date BETWEEN '$datefrom' AND '$dateto'
                UNION
                SELECT DISTINCT commondity_id FROM gfcmcstock WHERE country = '$country' AND date BETWEEN '$datefrom' AND '$dateto'
                                                        ");
                $hhkmcstockcommonditystmt->execute();
                $hhkmcstockcommonditydatas = $hhkmcstockcommonditystmt->rowCount();

              }else {
                $hhkmcstockcommonditydatas = [];
              }

              for ($i = 0; $i < $hhkmcstockcommonditydatas; $i++) {
                $commonditystmt = $pdo->prepare("SELECT DISTINCT commondity_id FROM hhkmcstock WHERE country = '$country' AND remark NOT LIKE '%packing%'                UNION
                SELECT DISTINCT commondity_id FROM gfcmcstock WHERE country = '$country' AND remark NOT LIKE '%packing%'");
                $commonditystmt->execute();
                $commonditydata = $commonditystmt->fetchall();
                $commondity_id = $commonditydata[$i]['commondity_id'];
                
                if (isset($_POST['searchdatebtn']) && !empty($_POST['datefrom']) && !empty($_POST['dateto'])) {
                  $datefrom = $_POST['datefrom'];
                  $dateto = $_POST['dateto'];

                  $stmt = $pdo->prepare("SELECT 
                                          id, 
                                          commondity_id,
                                          country, 
                                          particular, 
                                          kg,
                                          size, 
                                          fish_type 
                                      FROM (
                                          SELECT id, commondity_id, country, particular, kg, size, fish_type 
                                          FROM hhkmcstock 
                                          WHERE commondity_id = '$commondity_id' AND
                                            country = '$country' AND date BETWEEN '$datefrom' AND '$dateto'

                                          UNION ALL

                                          SELECT id, commondity_id, country, particular, kg, size, fish_type 
                                          FROM gfcmcstock 
                                          WHERE commondity_id = '$commondity_id' AND
                                            country = '$country' AND date BETWEEN '$datefrom' AND '$dateto'
                                      ) AS combined_results
                                      GROUP BY 
                                          country, 
                                          size, 
                                          kg, 
                                          fish_type;
                                      ");
                  $stmt->execute();
                  $datas = $stmt->fetchall();
                }else {
                  $datas = [];
                }

                $totalgfcmc = 0;
                $totalhhkmc = 0;
                foreach ($datas as $hhkdata) {
                  $id++;
                  $size = $hhkdata['size'];
                  $item_id = $hhkdata['commondity_id'];
                  $country = $hhkdata['country'];
                  $fish_type = $hhkdata['fish_type'];
                  $commonditydata = $query->select('item', $item_id, 'item_id');

                  $kg = $hhkdata['kg'];

                  $fetchallstmt = $pdo->prepare("SELECT balance_mc FROM hhkmcstock WHERE size='$size' AND commondity_id='$item_id' AND kg='$kg' ORDER BY id DESC");
                  $fetchallstmt->execute();
                  $fetchalldata = $fetchallstmt->fetch(PDO::FETCH_ASSOC);

                  $fetchallgfcstmt = $pdo->prepare("SELECT balance_mc FROM gfcmcstock WHERE size='$size' AND commondity_id='$item_id' AND kg='$kg' ORDER BY id DESC");
                  $fetchallgfcstmt->execute();
                  $fetchallgfcdata = $fetchallgfcstmt->fetch(PDO::FETCH_ASSOC);

                  // $lastid = $hhkdata['id'];
                  // $checklast = $pdo->prepare("SELECT * FROM hhkmcstock WHERE id < $lastid AND commondity_id='$item_id' AND size='$size' AND fish_type='$fish_type' AND remark NOT LIKE '%packing%'");
                  // $checklast->execute();
                  // $checklastavaliable = $checklast->fetch(PDO::FETCH_ASSOC);
                  // $lastcommondity = $pdo->prepare("SELECT * FROM hhkmcstock WHERE id < $lastid AND commondity_id='$item_id' AND country='$country' AND fish_type='$fish_type' AND remark NOT LIKE '%packing%'");
                  // $lastcommondity->execute();
                  // $lastcommondity = $lastcommondity->fetch(PDO::FETCH_ASSOC);

                  if (empty($fetchalldata['balance_mc'])) {
                    $fetchalldata['balance_mc'] = 0;
                  }
                  $totalgfcmc += !empty($fetchallgfcdata['balance_mc']) ? $fetchallgfcdata['balance_mc'] : 0;
                  $totalhhkmc += !empty($fetchalldata['balance_mc']) ? $fetchalldata['balance_mc'] : 0;

                  ?>
                  <tr style="text-align:center !important;">
                    <!-- <tr style="text-align:center !important; <?php if ($fetchalldata['balance_mc'] == 0 && empty($fetchallgfcdata['balance_mc'])) {
                                                                    echo "display:none;";
                                                                  } ?>"> -->
                    <td><?php if (empty($lastcommondity)) {
                          echo $id;
                        } ?></td>
                    <td><?php if (empty($lastcommondity)) {
                          echo $commonditydata['item_name'] . "(" . $hhkdata['fish_type'] . ")";
                        } ?></td>
                    <td><?php if (empty($lastcommondity)) {
                          echo $country;
                        } ?></td>
                    <td><?php if (empty($checklastavaliable)) {
                          echo $size;
                        } ?></td>
                    <td><?php echo $kg; ?></td>
                    <td><?php if ($fetchalldata['balance_mc'] != 0) {
                          echo $fetchalldata['balance_mc'];
                        } else {
                          echo "-";
                        }; ?></td>
                    <td><?php if (!empty($fetchallgfcdata['balance_mc'])) {
                          echo $fetchallgfcdata['balance_mc'];
                        } else {
                          echo "-";
                        };  ?></td>
                    <td><?php if (!empty($fetchallgfcdata['balance_mc'])) {
                          echo $fetchalldata['balance_mc'] + $fetchallgfcdata['balance_mc'];
                        } else {
                          echo $fetchalldata['balance_mc'];
                        };  ?></td>
                  </tr>
                <?php
                }
                ?>
                <!-- <tr style="background-color:#c1f5cf;"> -->
                <tr class="text-center" style="background-color:#c1f5cf;">
                  <td style="font-weight: bold;">Total</td>
                  <td style="font-weight: bold;"></td>
                  <td style="font-weight: bold;"></td>
                  <td style="font-weight: bold;"></td>
                  <td style="font-weight: bold;"></td>
                  <td style="font-weight: bold;"><?php if ($totalgfcmc != 0) {
                                                    echo $totalhhkmc;
                                                  } else {
                                                    echo "-";
                                                  }; ?></td>
                  <td style="font-weight: bold;"><?php if ($totalgfcmc != 0) {
                                                    echo $totalgfcmc;
                                                  } else {
                                                    echo "-";
                                                  }; ?></td>
                  <td style="font-weight: bold;"><?php if ($totalgfcmc != 0 || $totalhhkmc != 0) {
                                                    echo $totalhhkmc + $totalgfcmc;
                                                  } else {
                                                    echo "-";
                                                  }; ?></td>
                </tr>
                <?php
                }
              }
                ?>
            </table>
            <?php
            ?>
        </div>
      </div>
    </div>
  </div>

  <!-- Date Modal -->

  <div class="modal fade" id="datesearch">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header bg-info text-light">
          <h1 class="modal-title fs-5">Report With Date</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form action="stockreport.php" method="post">
            <div class="modal-body">
              <div class="row">
                <div class="col-3 pt-2 text-center">
                  <label for="">Country :</label>
                </div>
                <div class="col-9">
                  <select name="country" id="" class="form-control mb-3 inpv2">
                  <?php
                    $countrystmt = $pdo->prepare("SELECT DISTINCT country FROM hhkmcstock WHERE country IS NOT NULL
                    UNION
                    SELECT DISTINCT country FROM gfcmcstock WHERE country IS NOT NULL;
                    ");
                    $countrystmt->execute();
                    $countrydatas = $countrystmt->fetchall();
                    foreach ($countrydatas as $countrydata) {
                      ?>
                      <option value="<?php echo $countrydata['country']; ?>"><?php echo $countrydata['country']; ?></option>
                      <?php
                    }
                  ?>
                  </select>
                </div>
              </div>
              <div class="row">
                <div class="col-3 pt-2 text-center">
                  <label for="">Date From : </label>
                </div>
                <div class="col-9">
                  <input type="date" name="datefrom" class="form-control inpv2 mb-3 mt-1">
                </div>
              </div>
              <div class="row">
                <div class="col-3 pt-2 text-center">
                  <label for="">Date To : </label>
                </div>
                <div class="col-9">
                  <input type="date" name="dateto" class="form-control inpv2 mt-1">
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-success" name="searchdatebtn">Search</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <script type="text/javascript">
    <?php
    foreach ($countrydatas as $countrydata) {
      if ($_SESSION['tabs'] == $countrydata['country']) {
        echo "show" . $countrydata['country'] . "();";
        if ($_SESSION['tabs'] == $countrydata['country']) {
          echo ' function show' . $countrydata['country'] . '(){';
          foreach ($countrydatas as $countrydata) {
            echo 'document.querySelector("#' . $countrydata['country'] . 'table").classList.add(\'hide\');';
            echo 'document.querySelector(".' . $countrydata['country'] . 'link").classList.remove(\'color\');';
          }
          echo 'document.querySelector("#' . $_SESSION['tabs'] . 'table").classList.remove(\'hide\');';
          echo 'document.querySelector(".' . $_SESSION['tabs'] . 'link").classList.add(\'color\');';
          echo '}';
        }
      }
    }
    ?>
  </script>
  <?php
  $bootstrap->javascript();
  ?>
</body>

</html>