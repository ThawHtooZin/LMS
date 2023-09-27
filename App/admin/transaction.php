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
    $ac_name = '';
    if($_POST && !isset($_POST['save']) && !isset($_POST['accept'])){
      $_SESSION['date'] = $_POST['date'];
      $_SESSION['voucher_no'] = $_POST['voucher_no'];

      $ac_code = $_POST['ac_code'];
      $stmt = $pdo->prepare("SELECT * FROM acname WHERE code_no='$ac_code'");
      $stmt->execute();
      $datas = $stmt->fetch(PDO::FETCH_ASSOC);
      if(empty($datas['ac_name'])){
        echo "<script>swal('Error', 'A/C Name Doesn\'t Exist', 'warning');</script>";
      }else{
        $ac_name = $datas['ac_name'];
      }
    }
    if(isset($_POST['save'])){
      $date = $_POST['date'];
      $voucher_no = $_POST['voucher_no'];
      $ac_code = $_POST['ac_code'];
      $description = $_POST['description'];
      $currency = $_POST['currency'];
      $rate = $_POST['rate'];
      $debit = $_POST['debit'];
      $credit = $_POST['credit'];

      $query->savetransaction($date, $voucher_no, $ac_code, $description, $currency, $rate, $debit, $credit);
    }
     ?>
    <div class="row">
      <div class="col-2">
        <?php
        include 'sidebar.php';
        ?>
      </div>
      <div class="col-10">
        <form action="" method="post">
        <div class="card">
          <div class="card-header bg-info">
            <h5 class="text-light d-inline">Add Transaction</h5>
            <button type="button" class="btn btn-primary btn-sm float-end" data-bs-toggle="collapse" data-bs-target="#adddiv">Add</button>
          </div>
          <div class="card-body">
            <div id="adddiv" class="collapse mb-2 show">
            <div class="row">
                <div class="col">
                  <label>Date</label>
                  <input type="date" name="date" class="form-control inpv2 mb-1" value="<?php if(!empty($_SESSION['date'])){echo $_SESSION['date']; } ?>">
                </div>
                <div class="col">
                  <label>Vr. No</label>
                  <input type="text" name="voucher_no" class="form-control inpv2 mb-1" value="<?php if(!empty($_SESSION['voucher_no'])){echo $_SESSION['voucher_no']; } ?>">
                </div>
                <div class="col">
                  <label>A/C Code</label>
                  <input type="text" name="ac_code" class="form-control inpv2 mb-1" value="<?php if($ac_name != ''){echo $ac_name;} ?>">
                </div>
                <div class="col">
                  <label>Currency</label>
                  <select class="form-control inpv2" name="currency">
                    <option value="usd">USD</option>
                    <option value="mmk">MMK</option>
                  </select>
                </div>
            </div>
            <button type="submit" style="display:none;"></button>
            <div class="row">
              <div class="col-6">
                <label>Description</label>
                <textarea name="description" rows="3" style="padding-bottom:10px;" cols="80" class="form-control inpv2 mb-2"></textarea>
              </div>
              <div class="col-6">
                <div class="row">
                  <div class="col">
                    <label>Rate</label>
                    <input type="number" name="rate" class="form-control inpv2">
                  </div>
                </div>
                <div class="row">
                  <div class="col mt-3">
                    <input type="text" name="debit" class="form-control inpv2" placeholder="Debit">
                  </div>
                  <div class="col mt-3">
                    <input type="text" name="credit" class="form-control inpv2" placeholder="Credit">
                  </div>
                </div>
              </div>
            </div>
          </div>
            <iframe src="transactiontable.php" width="100%" height="335px"></iframe>
          </div>
        </div>
        <div style="position:absolute; bottom: 20px; right:25px;" id='adddiv' class="show">
          <button type="submit" class="btn btn-success btn-sm" name="save">Save</button>
          <button type="submit" class="btn btn-primary btn-sm" name="accept">Accept</button>
        </div>
      </div>
    </form>
    </div>
    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
