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
    <title>Admin | Cash Book</title>
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
            <h5 class="d-inline">Manage Cash Book</h5>
            <div class="float-end">
              <?php
                if($_POST){
                  if (!empty($_POST['startdate']) || !empty($_POST['enddate'])) {
                    ?>
                    <a href="#" class="btn btn-primary float-end" onclick="window.open('print/cashbookprint.php?startdate=<?php echo $_POST['startdate']; ?>&enddate=<?php echo $_POST['enddate']; ?>')">Print</a>
                    <?php
                  }elseif(!empty($_POST['monthlysearch'])){
                    ?>
                    <a href="#" class="btn btn-primary float-end" onclick="window.open('print/cashbookprint.php?monthly=<?php echo $_POST['monthlysearch']; ?>')">Print</a>
                    <?php
                  }
                }else{
                  ?>
                  <a href="" class="btn btn-primary">Print</a>
                  <?php
                }
               ?>
            </div>
          </div>
          <div class="card-body">
            <?php
            if(isset($_POST['deletebutton'])){
              $deleteid = $_POST['deleteid'];
              $message = $query->deleteaccount('accounts', $deleteid);
            }
            if(isset($_POST['updateaccount'])){
              $username = $_POST['username'];
              $password = $_POST['password'];
              $email = $_POST['email'];
              $role = $_POST['role'];
              $id = $_POST['updateid'];

              $message = $query->updateaccount('accounts', $username, $password, $email, $role, $id);
            }
            if(isset($_POST['adddata'])){
              $date = $_POST['date'];
              $serial_no = $_POST['serial_no'];
              $ac_name = $_POST['ac_name'];
              $particular = $_POST['particular'];
              $debit = $_POST['debit'];
              $credit = $_POST['credit'];

              $message = $query->addcashbookdata('cashbook', $date, $serial_no, $ac_name, $particular, $debit, $credit);
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
            <div class="row">
              <div class="col-3">
                <form class="d-flex" action="cashbook.php" method="post">
                  <select class="form-control w-50" name="monthlysearch">
                    <option value="">Select Month</option>
                    <option value="01">January</option>
                    <option value="02">Feburary</option>
                    <option value="03">March</option>
                    <option value="04">April</option>
                    <option value="05">May</option>
                    <option value="06">June</option>
                    <option value="07">July</option>
                    <option value="08">August</option>
                    <option value="09">September</option>
                    <option value="10">October</option>
                    <option value="11">November</option>
                    <option value="12">December</option>
                  </select>
                  <button type="submit" name="monthsearchbtn" class="btn btn-primary btn-sm">Search Monthly</button>
                </form>
              </div>
              <div class="col-9">
                <form class="d-flex" action="cashbook.php" method="post">
                  <span class="mt-2">Start Date:</span>
                  <input type="date" name="startdate" class="form-control" style="width: 35%;">
                  <span class="mt-2">End Date</span>
                  <input type="date" name="enddate" class="form-control" style="width: 35%;">
                  <button type="submit" name="dbwsearch" class="btn btn-primary btn-sm">Search</button>
                </form>
              </div>
            </div>
            <br>
            <?php
            if (!empty($_GET['pageno'])) {
              $pageno = $_GET['pageno'];
            }else{
              $pageno = 1;
            }
            $numOfrecs = 8;
            $offset = ($pageno -1) * $numOfrecs;
            ?>
            <button type="button" class="btn btn-success float-end" data-bs-toggle="modal" data-bs-target="#addmodal">
              Add New Cash Data
            </button>
            <table class="mt-5 table table-bordered table-striped rounded">
              <tr>
                <th>#</th>
                <th>Date</th>
                <th>Sr.No</th>
                <th>A/C Name</th>
                <th>Particular</th>
                <th>Debit</th>
                <th>Credit</th>
                <th>Balance</th>
                <th>Action</th>
              </tr>
              <?php
              if(isset($_POST['dbwsearch'])){
                $startdate = $_POST['startdate'];
                $enddate = $_POST['enddate'];
                $cashdatas = $query->selectdbw('cashbook', $startdate, $enddate);
              }elseif(isset($_POST['monthsearchbtn'])){
                $month = $_POST['monthlysearch'];
                $year = date('Y');
                $search = $year . "-" . $month;
                $stmt = $pdo->prepare("SELECT * FROM CASHBOOK WHERE date LIKE '%$search%'");
                $stmt->execute();
                $cashdatas = $stmt->fetchall();
              }else{
                $stmt = $pdo->prepare("SELECT * FROM cashbook ORDER BY id");
                $stmt->execute();
                $rawResult = $stmt->fetchAll();
                $total_pages = ceil(count($rawResult) / $numOfrecs);

                $stmt = $pdo->prepare("SELECT * FROM cashbook ORDER BY id LIMIT $offset,$numOfrecs ");
                $stmt->execute();
                $cashdatas = $stmt->fetchAll();
              }
              ?>
              <?php
              foreach ($cashdatas as $cashdata) {
                ?>
              <tr>
                <td><?php echo $cashdata['id']; ?></td>
                <td><?php echo $cashdata['date']; ?></td>
                <td><?php echo $cashdata['serial_no']; ?></td>
                <td><?php echo $cashdata['ac_name']; ?></td>
                <td><?php echo $cashdata['particular']; ?></td>
                <td><?php if($cashdata['debit'] == 0){echo "";}else{echo $cashdata['debit'];}; ?></td>
                <td><?php if($cashdata['credit'] == 0){echo "";}else{echo $cashdata['credit'];}; ?></td>
                <td><?php echo $cashdata['balance']; ?></td>
                <td>
                  <input type="hidden" name="updateid" value="<?php echo $cashdata['id']; ?>">
                  <button type="submit" class="btn btn-warning text-light" data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $cashdata['id']; ?>">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
</svg>
                  </button>
                <form action="manageaccounts.php" method="post" style="display: inline !important;">
                  <input type="hidden" name="deleteid" value="<?php echo $cashdata['id']; ?>">
                  <button type="submit" name="deletebutton" class="btn btn-danger">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16"><path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/></svg>
                  </button>
                </form>
              </td>
              </tr>
              <!-- Data Update Modal -->
              <div class="modal fade" id="updatemodal<?php echo $cashdata['id']; ?>" tabindex="-1" role="dialog" aria-hidden="true">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header bg-warning text-light">
                      <h5 class="modal-title" id="updatemodallabel">Update An Account</h5>
                      <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="h3">&times;</span>
                      </button>
                    </div>
                    <form action="" method="post" autocomplete="off">
                      <div class="modal-body">
                        <?php
                        $id = $cashdata['id'];
                        $updatedata = $query->select('cashbook', $id, 'id');
                        ?>
                        <input type="hidden" name="updateid" value="<?php echo $cashdata['id']; ?>">
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-warning" name="updateaccount">Update</button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
              <!-- Update Modal -->
              <?php
              }
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
            <a href="cashbookexport.php?forment=excel" class="btn btn-success">Export to Excel</a>
          </div>
        </div>
      </div>
    </div>

  <!-- Data Add Modal -->
  <div class="modal fade" id="addmodal" tabindex="-1" role="dialog" aria-hidden="true" style="margin-left:auto !important; margin-right: auto !important;">
    <div class="modal-dialog" role="document">
      <div class="modal-content" style="width: 750px; !important; margin-top:70px !important;">
        <div class="modal-header bg-primary text-light">
          <h5 class="modal-title" id="addmodellabel">Create New Data</h5>
          <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true" class="h3">&times;</span>
          </button>
        </div>
        <form action="cashbook.php" method="post" autocomplete="off">
          <div class="modal-body">
            <div class="row">
              <div class="col">
                <label style="font-weight:bold;">Date</label>
                <input type="date" name="date" class="form-control inpv2" placeholder="Date">
              </div>
              <div class="col">
                <label style="font-weight:bold;">Sr.No</label>
                <input type="text" name="serial_no" class="form-control inpv2" placeholder="Sr.No">
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label class="mt-2" style="font-weight:bold;">A/C Name</label>
                <input type="text" name="ac_name" class="form-control inpv2" placeholder="A/C Name">
                <label class="mt-2" style="font-weight:bold;">Debit</label>
                <input type="number" name="debit" class="form-control inpv2" placeholder="Debit">
              </div>
              <div class="col">
                <label class="mt-2" style="font-weight:bold;">Particular</label>
                <textarea name="particular" rows="4" cols="80" class="form-control inpv2" placeholder="Particular"></textarea>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <label class="mt-2" style="font-weight:bold;">Credit</label>
                <input type="number" name="credit" class="form-control inpv2" placeholder="Credit">
              </div>
              <div class="col mt-4">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-success" name="adddata">Add Data</button>
              </div>
            </div>
          </div>
          <div class="modal-footer">
          </div>
        </form>
      </div>
    </div>
  </div>
  <!-- Add Modal -->

    <script type="text/javascript">
      function inoroutchange(){

      }
    </script>
    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
