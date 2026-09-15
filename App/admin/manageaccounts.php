<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

require '../../Controllers/ValidatorInstance.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Manage Accounts</title>
    <?php $bootstrap->css(); ?>
    <!-- Bootstrap Icons CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
      .password-field {
        font-family: monospace;
        letter-spacing: 2px;
      }
    </style>
  </head>
  <body>
    <div class="row">
      <div class="sidebarcol bg-warning">
        <?php include 'sidebar.php'; ?>
      </div>
      <div class="contentcol bg-danger" id="content">
        <!-- Top Navbar Placeholder -->
        <?php require 'navbar.php'; ?>
        <div class="card">
          <div class="card-header bg-warning text-light" style="padding:-10px;">
            <h5>Manage User Accounts</h5>
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
            if(isset($_POST['createaccount'])){
              $username = $_POST['username'];
              $password = $_POST['password'];
              $email = $_POST['email'];
              $role = $_POST['role'];

              if (
                  $validator->regex('/[a-zA-Z]/')->validate($username)
                  && $validator->regex('/[a-zA-Z]/')->length(8, 50)->validate($password)
              ) {
                  try {
                      $validator->email()->assert($email);
                      $message = $query->createaccount('accounts', $username, $password, $email, $role);
                  } catch (\Respect\Validation\Exceptions\ValidationException $e) {
                      echo "<script>swal('Warning!', 'Invalid Data in Fields', 'warning');</script>";
                  }
              } else {
                  echo "<script>swal('Warning!', 'Invalid Data in Fields', 'warning');</script>";
              }
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

            if (!empty($_GET['pageno'])) {
              $pageno = $_GET['pageno'];
            }else{
              $pageno = 1;
            }
            $numOfrecs = 8;
            $offset = ($pageno -1) * $numOfrecs;
            ?>
            <button type="button" class="btn btn-success float-end" data-bs-toggle="modal" data-bs-target="#addmodal">
              Add New User
            </button>
            <table class="table table-hover table-bordered table-striped">
              <thead>
                <tr>
                  <th>Account No</th>
                  <th>Username</th>
                  <th>Password</th>
                  <th>Email</th>
                  <th>Role</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                <?php
                $stmt = $pdo->prepare("SELECT * FROM accounts ORDER BY id");
                $stmt->execute();
                $rawResult = $stmt->fetchAll();
                $total_pages = ceil(count($rawResult) / $numOfrecs);

                $stmt = $pdo->prepare("SELECT * FROM accounts ORDER BY id LIMIT $offset,$numOfrecs ");
                $stmt->execute();
                $accountdatas = $stmt->fetchAll();

                $idd = 0;
                foreach ($accountdatas as $accountdata) {
                  $accountname = $query->select('role', $accountdata['role'], 'role_id');
                  $idd++;
                ?>
                <tr>
                  <td><?php echo $idd; ?></td>
                  <td><?php echo htmlspecialchars($accountdata['username']); ?></td>
                  <td>
                    <div class="d-flex align-items-center justify-content-between" style="min-width: 160px;">
                      <!-- Password Span -->
                      <span id="pwd-text-<?php echo $accountdata['id']; ?>" 
                            class="password-field me-2" 
                            data-password="<?php echo htmlspecialchars($accountdata['password']); ?>" 
                            data-masked="true">••••••••</span>
                      
                      <!-- Toggle Eye Button -->
                      <button type="button" 
                              class="btn btn-sm btn-outline-secondary py-0 px-2" 
                              onclick="togglePasswordTable('<?php echo $accountdata['id']; ?>')">
                        <i id="eye-icon-<?php echo $accountdata['id']; ?>" class="bi bi-eye"></i>
                      </button>
                    </div>
                  </td>
                  <td><?php echo htmlspecialchars($accountdata['email']); ?></td>
                  <td><?php echo htmlspecialchars($accountname['role_name']); ?></td>
                  <td>
                    <input type="hidden" name="updateid" value="<?php echo $accountdata['id']; ?>">
                    <button type="button" class="btn btn-warning text-light" data-bs-toggle="modal" data-bs-target="#updatemodal<?php echo $accountdata['id']; ?>">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                      </svg>
                    </button>
                    <form action="manageaccounts.php" method="post" style="display: inline !important;">
                      <input type="hidden" name="deleteid" value="<?php echo $accountdata['id']; ?>">
                      <button type="submit" name="deletebutton" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this account?');">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash3-fill" viewBox="0 0 16 16"><path d="M11 1.5v1h3.5a.5.5 0 0 1 0 1h-.538l-.853 10.66A2 2 0 0 1 11.115 16h-6.23a2 2 0 0 1-1.994-1.84L2.038 3.5H1.5a.5.5 0 0 1 0-1H5v-1A1.5 1.5 0 0 1 6.5 0h3A1.5 1.5 0 0 1 11 1.5Zm-5 0v1h4v-1a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5ZM4.5 5.029l.5 8.5a.5.5 0 1 0 .998-.06l-.5-8.5a.5.5 0 1 0-.998.06Zm6.53-.528a.5.5 0 0 0-.528.47l-.5 8.5a.5.5 0 0 0 .998.058l.5-8.5a.5.5 0 0 0-.47-.528ZM8 4.5a.5.5 0 0 0-.5.5v8.5a.5.5 0 0 0 1 0V5a.5.5 0 0 0-.5-.5Z"/></svg>
                      </button>
                    </form>
                  </td>
                </tr>

                <!-- Data Update Modal -->
                <div class="modal fade" id="updatemodal<?php echo $accountdata['id']; ?>" tabindex="-1" role="dialog" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header bg-warning text-light">
                        <h5 class="modal-title">Update An Account</h5>
                        <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true" class="h3">&times;</span>
                        </button>
                      </div>
                      <form action="" method="post" autocomplete="off">
                        <div class="modal-body">
                          <?php
                          $id = $accountdata['id'];
                          $updatedata = $query->select('accounts', $id, 'id');
                          ?>
                          <input type="hidden" name="updateid" value="<?php echo $accountdata['id']; ?>">
                          
                          <div class="mb-3">
                            <label class="form-label">Username</label>
                            <input type="text" name="username" class="form-control" placeholder="Username" value="<?php echo htmlspecialchars($updatedata['username']); ?>">
                          </div>

                          <div class="mb-3">
                            <label class="form-label">Password</label>
                            <div class="input-group">
                              <input type="password" id="update-pwd-input-<?php echo $accountdata['id']; ?>" name="password" class="form-control" placeholder="Password" value="<?php echo htmlspecialchars($updatedata['password']); ?>">
                              <button class="btn btn-outline-secondary" type="button" onclick="toggleInputPassword('update-pwd-input-<?php echo $accountdata['id']; ?>', 'update-eye-icon-<?php echo $accountdata['id']; ?>')">
                                <i id="update-eye-icon-<?php echo $accountdata['id']; ?>" class="bi bi-eye"></i>
                              </button>
                            </div>
                          </div>

                          <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" name="email" class="form-control" placeholder="Email" value="<?php echo htmlspecialchars($updatedata['email']); ?>">
                          </div>

                          <div class="mb-3">
                            <label class="form-label">Role</label>
                            <select class="form-control" name="role">
                              <option value="">Select Role</option>
                              <?php
                              $roledatas = $query->selectall('role');
                              foreach ($roledatas as $roledata) {
                              ?>
                              <option value="<?php echo $roledata['role_id']; ?>" <?php if($updatedata['role'] == $roledata['role_id']){ echo "selected"; } ?>><?php echo htmlspecialchars($roledata['role_name']); ?></option>
                              <?php
                              }
                              ?>
                            </select>
                          </div>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                          <button type="submit" class="btn btn-warning" name="updateaccount">Update</button>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
                <!-- /Data Update Modal -->
                <?php
                }
                ?>
              </tbody>
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
            <h5 class="modal-title">Create New Account</h5>
            <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
              <span aria-hidden="true" class="h3">&times;</span>
            </button>
          </div>
          <form action="manageaccounts.php" method="post" autocomplete="off">
            <div class="modal-body">
              <div class="mb-3">
                <label class="form-label">Username</label>
                <input type="text" name="username" class="form-control" placeholder="Username">
              </div>

              <div class="mb-3">
                <label class="form-label">Password</label>
                <div class="input-group">
                  <input type="password" id="add-pwd-input" name="password" class="form-control" placeholder="Password">
                  <button class="btn btn-outline-secondary" type="button" onclick="toggleInputPassword('add-pwd-input', 'add-eye-icon')">
                    <i id="add-eye-icon" class="bi bi-eye"></i>
                  </button>
                </div>
              </div>

              <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="text" name="email" class="form-control" placeholder="Email">
              </div>

              <div class="mb-3">
                <label class="form-label">Role</label>
                <select class="form-control" name="role">
                  <option value="">Select Role</option>
                  <?php
                  $roledatas = $query->selectall('role');
                  foreach ($roledatas as $roledata) {
                  ?>
                  <option value="<?php echo $roledata['role_id']; ?>"><?php echo htmlspecialchars($roledata['role_name']); ?></option>
                  <?php
                  }
                  ?>
                </select>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-success" name="createaccount">Create Account</button>
            </div>
          </form>
        </div>
      </div>
    </div>
    <!-- /Add Modal -->

    <?php $bootstrap->javascript(); ?>

    <script>
      // Toggle table row password visibility
      function togglePasswordTable(id) {
        const textSpan = document.getElementById('pwd-text-' + id);
        const eyeIcon = document.getElementById('eye-icon-' + id);
        const actualPassword = textSpan.getAttribute('data-password');
        const isMasked = textSpan.getAttribute('data-masked') === 'true';

        if (isMasked) {
          textSpan.textContent = actualPassword;
          textSpan.setAttribute('data-masked', 'false');
          eyeIcon.classList.remove('bi-eye');
          eyeIcon.classList.add('bi-eye-slash');
        } else {
          textSpan.textContent = '••••••••';
          textSpan.setAttribute('data-masked', 'true');
          eyeIcon.classList.remove('bi-eye-slash');
          eyeIcon.classList.add('bi-eye');
        }
      }

      // Toggle input field password visibility inside modals
      function toggleInputPassword(inputId, iconId) {
        const inputField = document.getElementById(inputId);
        const eyeIcon = document.getElementById(iconId);

        if (inputField.type === 'password') {
          inputField.type = 'text';
          eyeIcon.classList.remove('bi-eye');
          eyeIcon.classList.add('bi-eye-slash');
        } else {
          inputField.type = 'password';
          eyeIcon.classList.remove('bi-eye-slash');
          eyeIcon.classList.add('bi-eye');
        }
      }
    </script>
  </body>
</html>