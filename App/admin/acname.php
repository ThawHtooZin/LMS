<?php
if (isset($_GET['action']) && $_GET['action'] == 'check_duplicate') {
  include '../../Controllers/query.ctr.php';
  $query = new Query();
  $table = $_GET['table'];
  $column = $_GET['column'];
  $value = $_GET['value'];
  echo $query->isDuplicate($table, $column, $value) ? '1' : '0';
  exit;
}
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
  <script>
    function sweetConfirm(event, title, message, callback) {
      event.preventDefault();
      swal({
        title: title,
        text: message,
        icon: 'warning',
        buttons: {
          cancel: true,
          confirm: true
        }
      }).then((confirmed) => {
        callback(confirmed);
      });
    }
  </script>
  <script>
    $(document).ready(function() {
      $('#fromaccode').blur(function() {
        var ac_codepost = $('#fromaccode').val();
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
        $('#fromac_code').load('ac_name.php', {
          FirstPart: firstpart,
          LastPart: JSON.stringify(lastpart),
          Type: type
        });
      });
      $('#toaccode').blur(function() {
        var ac_codepost = $('#toaccode').val();
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
        $('#toac_code').load('ac_name.php', {
          FirstPart: firstpart,
          LastPart: JSON.stringify(lastpart),
          Type: type
        });
      });
    });
  </script>
  <?php
  if (isset($_POST['addbtn'])) {
    $code_no = $_POST['code_no'];
    $actype = $_POST['ac_type'];
    $acname = $_POST['ac_name'];

    if (!str_contains($code_no, '4000/')) {
      $query->addacname($code_no, $actype, $acname);
    } else {
      echo "<script>swal('Warning!', 'Please create supplier in the Supplier page!', 'warning');</script>";
    }
  }

  if (isset($_POST['updatebutton'])) {
    $id = $_POST['id'];
    $code_no = $_POST['code_no'];
    $actype = $_POST['ac_type'];
    $acname = $_POST['ac_name'];

    $query->updateacname($code_no, $actype, $acname, $id);
  }

  if (isset($_POST['deletebutton'])) {
    $id = $_POST['id'];

    $stmt = $query->deleteacname($id);
  }

  if (isset($_POST['replaceform'])) {
    $fromaccode = $_POST['from_accode'];
    $toaccode = $_POST['to_accode'];

    $query->replaceaccode($fromaccode, $toaccode);
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
          <form class="d-inline" action="" method="post">
            <select class="chzn-select" name="searchac_code1" style="width:20%;" data-placeholder="Supplier Name">
              <option value="">Select A/C Id</option>
              <?php
              $actypestmt = $pdo->prepare("SELECT * FROM acname GROUP BY code_no");
              $actypestmt->execute();
              $actypes = $actypestmt->fetchall();

              foreach ($actypes as $actype) {
                $ac_name = $query->select('acname', $actype['code_no'], 'code_no');
              ?>
                <option value="<?php echo $actype['code_no']; ?>"><?php echo $actype['code_no']; ?></option>
              <?php
              }
              ?>
            </select>
            <select class="chzn-select" name="searchac_code2" style="width:20%;" data-placeholder="Supplier Name">
              <option value="">Select A/C Name</option>
              <?php
              $actypestmt = $pdo->prepare("SELECT * FROM acname GROUP BY code_no");
              $actypestmt->execute();
              $actypes = $actypestmt->fetchall();

              foreach ($actypes as $actype) {
                $ac_name = $query->select('acname', $actype['code_no'], 'code_no');
              ?>
                <option value="<?php echo $actype['code_no']; ?>"><?php echo $ac_name['ac_name']; ?></option>
              <?php
              }
              ?>
            </select>
            <button type="submit" name="searchbtn" class="btn btn-success btn-sm">Search</button>
          </form>
          <button type="button" class="btn btn-primary btn-sm float-end text-light ms-2" data-bs-toggle="modal" data-bs-target="#replacemodal">Replace A/C</button>
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
            if (isset($_POST['searchbtn'])) {
              $searchac_code1 = $_POST['searchac_code1'];
              $searchac_code2 = $_POST['searchac_code2'];
              if (empty($searchac_code1)) {
                $searchac_code = $searchac_code2;
              }
              if (empty($searchac_code2)) {
                $searchac_code = $searchac_code1;
              }

              if (!empty($searchac_code2) && !empty($searchac_code1)) {
                $searchac_code = '';
              }
              $datas = $query->selectcontain('acname', 'code_no', $searchac_code);
            } else {
              $stmt = $pdo->prepare("SELECT * FROM acname order by ac_type");
              $stmt->execute();
              $datas = $stmt->fetchall();
            }
            $idd = 0;
            foreach ($datas as $data) {
              $idd++;
              $actype = $query->select('actype', $data['ac_type'], 'acid');
              $accode = $data['code_no'];
              $check = $query->checkifacexists($accode);
            ?>
              <tr <?php if (!str_contains($data['code_no'], '4000/') && !str_contains($data['code_no'], '3300/')) {
                    echo "data-bs-toggle='modal' data-bs-target=\"#updatemodal" . $data['id'] . "\"";
                  } else {
                    if (str_contains($data['code_no'], '4000/')) {
                      echo "data-bs-toggle='modal' data-bs-target=\"#cantupdatesupplier\"";
                    } elseif (str_contains($data['code_no'], '3300/')) {
                      echo "data-bs-toggle='modal' data-bs-target=\"#cantupdatecustomer\"";
                    }
                  } ?>>
                <td><?php echo $idd; ?></td>
                <td><?php echo $data['code_no']; ?></td>
                <td><?php echo $actype['ac_type']; ?></td>
                <td><?php echo $data['ac_name']; ?></td>
              </tr>
              <div class="modal fade" id="updatemodal<?php echo $data['id'];  ?>" tabindex="-1" role="dialog" style="margin-left:auto !important; margin-right: auto !important;">
                <div class="modal-dialog" role="document">
                  <div class="modal-content" style="width: 750px !important; margin-top:70px !important;">
                    <form action="" method="post" autocomplete="off">
                      <input type="hidden" name="id" value="<?php echo $data['acid']; ?>">
                      <div class="modal-header bg-warning text-light">
                        <h5 class="modal-title">Update A/C Name</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                        <?php
                        $id = $data['id'];
                        $updatedata = $query->select('acname', $id, 'id');
                        ?>
                        <input type="hidden" name="updateid" value="<?php echo $data['id']; ?>">
                        <div class="row">
                          <input type="hidden" name="code_no" value="<?php echo $updatedata['code_no']; ?>">
                          <div class="col">
                            <label>Code No</label>
                            <input type="text" disabled class="form-control inpv2 mb-2" value="<?php echo $updatedata['code_no']; ?>">
                          </div>
                          <div class="col">
                            <label>A/C Type</label>
                            <select class="form-control inpv2 mb-s" name="ac_type">
                              <?php
                              $actypedistdatas = $query->selectdis('actype', 'ac_type');
                              foreach ($actypedistdatas as $actypedistdata) :
                                $actypedata = $query->select('actype', $actypedistdata['ac_type'], 'ac_type');
                              ?>
                                <option value="<?php echo $actypedata['acid']; ?>" <?php if ($actypedata['acid'] == $updatedata['ac_type']) {
                                                                                      echo "selected";
                                                                                    } ?>><?php echo $actypedata['ac_type']; ?></option>
                              <?php
                              endforeach;
                              ?>
                            </select>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <label>A/C Name</label>
                            <input type="text" name="ac_name" class="form-control inpv2 mb-2" value="<?php echo $updatedata['ac_name']; ?>">
                          </div>
                          <div class="col mt-4">
                            <button type="submit" class="btn btn-success" name="updatebutton">Update</button>
                            <button type="submit" name="deletebutton" class="btn btn-danger">Delete</button>
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

          <div class="modal fade" id="addmodal" tabindex="-1" role="dialog" style="margin-left:auto !important; margin-right: auto !important;">
            <div class="modal-dialog" role="document">
              <form action="actype.php" method="post">
                <div class="modal-content" style="width: 750px !important; margin-top:70px !important;">
                  <div class="modal-header bg-warning text-light">
                    <h5 class="modal-title">Add A/C Name</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="row">
                      <div class="col">
                        <label>Code No</label>
                        <input type="text" name="code_no" id="code_no" class="form-control inpv2 mb-2" oninput="validateInput('acname', 'code_no', this.value, 'code_error')" required>
                        <span id="code_error" class="text-danger small"></span>
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
                        <input type="text" name="ac_name" class="form-control inpv2 mb-2" required>
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

  <script>
    function validateInput(table, column, value, errorId) {
      if (value.length === 0) {
        document.getElementById(errorId).innerText = "";
        return;
      }
      fetch(`actype.php?action=check_duplicate&table=${table}&column=${column}&value=${encodeURIComponent(value)}`)
        .then(response => response.text())
        .then(data => {
          if (data === '1') {
            document.getElementById(errorId).innerText = "This code is already taken.";
          } else {
            document.getElementById(errorId).innerText = "";
          }
        });
    }
  </script>

  <?php $bootstrap->javascript(); ?>
</body>

</html>