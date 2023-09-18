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
    $permission = "";
    if(isset($_POST['save'])){
      if(!empty($_POST['manage_accounts'])){
        $permission .= "manage_accounts";
      }
      if(!empty($_POST['manage_role'])){
        $permission .= ",manage_role";
      }
      if(!empty($_POST['manage_sale'])){
        $permission .= ",manage_sale";
      }
      if(!empty($_POST['manage_purchase'])){
        $permission .= ",manage_purchase";
      }
      if(!empty($_POST['manage_cashbook'])){
        $permission .= ",manage_cashbook";
      }
      if(!empty($_POST['manage_accountpayable'])){
        $permission .= ",manage_accountpayable";
      }
      if(!empty($_POST['manage_accountreceivable'])){
        $permission .= ",manage_accountreceivable";
      }
      if(!empty($_POST['manage_customers'])){
        $permission .= ",manage_customers";
      }
      if(!empty($_POST['manage_supplier'])){
        $permission .= ",manage_supplier";
      }
      if(!empty($_POST['manage_category'])){
        $permission .= ",manage_category";
      }
      if(!empty($_POST['manage_item'])){
        $permission .= ",manage_item";
      }
      if(!empty($_POST['manage_unit'])){
        $permission .= ",manage_unit";
      }
      if(!empty($_POST['manage_coldstorecharges'])){
        $permission .= ",manage_coldstorecharges";
      }
      if(!empty($_POST['manage_form7'])){
        $permission .= ",manage_form7";
      }
      if(!empty($_POST['manage_form10'])){
        $permission .= ",manage_form10";
      }
      if(!empty($_POST['manage_hhkmcstock'])){
        $permission .= ",manage_hhkmcstock";
      }
      if(!empty($_POST['manage_gfcmcstock'])){
        $permission .= ",manage_gfcmcstock";
      }
      if(!empty($_POST['manage_stockreport'])){
        $permission .= ",manage_stockreport";
      }
      if(!empty($_POST['manage_shippmentexport'])){
        $permission .= ",manage_shippmentexport";
      }
      if(!empty($_POST['manage_packingmaterial'])){
        $permission .= ",manage_packingmaterial";
      }
      if(!empty($_POST['sale_report'])){
        $permission .= ",sale_report";
      }
      if(!empty($_POST['purchase_report'])){
        $permission .= ",purchase_report";
      }

      $permission;
      $role_id = $_GET['role_id'];

      $query->permission($permission, $role_id);
    }
    ?>
    <div class="row">
      <div class="col-2">
        <?php
        include 'sidebar.php';
        ?>
      </div>
      <div class="col-10">
        <div class="card">
          <div class="card-header bg-info">
            <?php
            $role_id = $_GET['role_id'];
            $role_name = $query->select('role', $_GET['role_id'], 'role_id');
            ?>
            <b class="text-light">Manage Permissions</b>
          </div>
          <div class="card-body">
            <h5><?php echo $role_name['role_name']; ?> Permissions</h5>
            <?php
            $permissionstmt = $pdo->prepare("SELECT * FROM permission WHERE role_id='$role_id'");
            $permissionstmt->execute();
            $permissiondata = $permissionstmt->fetch(PDO::FETCH_ASSOC);
            if(!empty($permissiondata)){
              echo $permissionshow = $permissiondata['permission'];
              if(!empty(strpos($permissionshow, 'manage_accounts'))){echo "checked";}else{echo "aaa";};
              if(!empty(strpos($permissionshow, 'manage_unit'))){echo "checked";};
            }
            ?>
            <table class="table table-bordered">
              <form action="" method="post">
                <tr>
                  <th>Permissions</th>
                  <th>Check</th>
                  <th>Permissions</th>
                  <th>Check</th>
                </tr>
                <tr>
                  <td>Manage Accounts</td>
                  <td><input type="checkbox" name="manage_accounts" <?php if(!empty($permission)){if(!empty(strpos($permissionshow, 'manage_accounts'))){echo "checked";}} ?>></td>
                  <td>Manage Unit</td>
                  <td><input type="checkbox" name="manage_unit" <?php if(!empty($permission)){if(!empty(strpos($permissionshow, 'manage_unit'))){echo "checked";}} ?>></td>
                </tr>
                <tr>
                  <td>Manage Role</td>
                  <td><input type="checkbox" name="manage_role" <?php if(!empty($permission)){if(!empty(strpos($permissionshow, 'manage_role'))){echo "checked";}} ?>></td>
                  <td>Manage Cold Store Charges</td>
                  <td><input type="checkbox" name="manage_coldstorecharges" <?php if(!empty($permission)){if(!empty(strpos($permissionshow, 'manage_coldstorecharges'))){echo "checked";}} ?>></td>
                </tr>
                <tr>
                  <td>Manage Sale</td>
                  <td><input type="checkbox" name="manage_sale" <?php if(!empty($permission)){if(!empty(strpos($permissionshow, 'manage_sale'))){echo "checked";}} ?>></td>
                  <td>Manage Form7</td>
                  <td><input type="checkbox" name="manage_form7" <?php if(!empty($permission)){if(!empty(strpos($permissionshow, 'manage_form7'))){echo "checked";}} ?>></td>
                </tr>
                <tr>
                  <td>Manage Purchase</td>
                  <td><input type="checkbox" name="manage_purchase" <?php if(!empty($permission)){if(!empty(strpos($permissionshow, 'manage_purchase'))){echo "checked";}} ?>></td>
                  <td>Manage Form10</td>
                  <td><input type="checkbox" name="manage_form10" <?php if(!empty($permission)){if(!empty(strpos($permissionshow, 'manage_form10'))){echo "checked";}} ?>></td>
                </tr>
                <tr>
                  <td>Manage Cash Book</td>
                  <td><input type="checkbox" name="manage_cashbook" <?php if(!empty($permission)){if(!empty(strpos($permissionshow, 'manage_cashbook'))){echo "checked";}} ?>></td>
                  <td>Manage HHK Mc Stock</td>
                  <td><input type="checkbox" name="manage_hhkmcstock" <?php if(!empty($permission)){if(!empty(strpos($permissionshow, 'manage_hhkmcstock'))){echo "checked";}} ?>></td>
                </tr>
                <tr>
                  <td>Manage Account Payable</td>
                  <td><input type="checkbox" name="manage_accountpayable" <?php if(!empty($permission)){if(!empty(strpos($permissionshow, 'manage_accountpayable'))){echo "checked";}} ?>></td>
                  <td>Manage GFC Mc Stock</td>
                  <td><input type="checkbox" name="manage_gfcmcstock" <?php if(!empty($permission)){if(!empty(strpos($permissionshow, 'manage_gfcmcstock'))){echo "checked";}} ?>></td>
                </tr>
                <tr>
                  <td>Manage Account Receivable</td>
                  <td><input type="checkbox" name="manage_accountreceivable" <?php if(!empty($permission)){if(!empty(strpos($permissionshow, 'manage_accountreceivable'))){echo "checked";}} ?>></td>
                  <td>Manage Stock Report</td>
                  <td><input type="checkbox" name="manage_stockreport" <?php if(!empty($permission)){if(!empty(strpos($permissionshow, 'manage_stockreport'))){echo "checked";}} ?>></td>
                </tr>
                <tr>
                  <td>Manage Customers</td>
                  <td><input type="checkbox" name="manage_customers" <?php if(!empty($permission)){if(!empty(strpos($permissionshow, 'manage_customers'))){echo "checked";}} ?>></td>
                  <td>Manage Shippment Export</td>
                  <td><input type="checkbox" name="manage_shippmentexport" <?php if(!empty($permission)){if(!empty(strpos($permissionshow, 'manage_shippmentexport'))){echo "checked";}} ?>></td>
                </tr>
                <tr>
                  <td>Manage Supplier</td>
                  <td><input type="checkbox" name="manage_supplier" <?php if(!empty($permission)){if(!empty(strpos($permissionshow, 'manage_supplier'))){echo "checked";}} ?>></td>
                  <td>Manage Packing Material</td>
                  <td><input type="checkbox" name="manage_packingmaterial" <?php if(!empty($permission)){if(!empty(strpos($permissionshow, 'manage_packingmaterial'))){echo "checked";}} ?>></td>
                </tr>
                <tr>
                  <td>Manage Category</td>
                  <td><input type="checkbox" name="manage_category" <?php if(!empty($permission)){if(!empty(strpos($permissionshow, 'manage_category'))){echo "checked";}} ?>></td>
                  <td>Sale Report</td>
                  <td><input type="checkbox" name="sale_report" <?php if(!empty($permission)){if(!empty(strpos($permissionshow, 'sale_report'))){echo "checked";}} ?>></td>
                </tr>
                <tr>
                  <td>Manage Item</td>
                  <td><input type="checkbox" name="manage_item" <?php if(!empty($permission)){if(!empty(strpos($permissionshow, 'manage_item'))){echo "checked";}} ?>></td>
                  <td>Purchase Report</td>
                  <td><input type="checkbox" name="purchase_report" <?php if(!empty($permission)){if(empty(strpos($permissionshow, 'purchase_report'))){echo "checked";}} ?>></td>
                </tr>
                <tr>
                  <td></td>
                  <td></td>
                  <td></td>
                  <td><button type="submit" name="save" class="btn btn-success">Save</button></td>
                </tr>
            </table>
          </form>
          </div>
        </div>
      </div>
    </div>
    <?php
    $bootstrap->javascript();
    ?>
  </body>
</html>
