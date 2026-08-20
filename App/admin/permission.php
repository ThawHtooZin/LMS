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
  <?php $bootstrap->css(); ?>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Caprasimo&family=Cormorant+Garamond:wght@300&family=Teko:wght@700&display=swap" rel="stylesheet">
</head>

<body>
  <?php
  $permission = "";
  if (isset($_POST['save'])) {
    $permissions_array = [
      'manage_accounts',
      'manage_role',
      'manage_sale',
      'manage_purchase',
      'manage_cashbook',
      'manage_accountpayable',
      'manage_acpayable',
      'manage_accountreceivable',
      'manage_transaction',
      'manage_general_ledger',
      'manage_ledger_record',
      'manage_contacts',
      'manage_products',
      'manage_product_types',
      'manage_currency',
      'manage_coa',
      'manage_coldstoreitem',
      'manage_unit',
      'manage_coldstorecharges',
      'manage_form7',
      'manage_form10',
      'manage_hhkmcstock',
      'manage_gfcmcstock',
      'manage_stockreport',
      'manage_shippmentexport',
      'manage_truckexport',
      'manage_packingmaterial',
      'sale_report',
      'purchase_report',
      'payable_report',
      'manage_mcreport',
      'manage_tclmcstock',
      'manage_generalledger',
      'manage_material_purchase',
      'material_store_house',
      'material_gatepass',
      'configuration_coldstore',
      'material_output',
      'packing_material_report',
      'temp_pm_stock',
      'profit_loss_report',
      'manage_manual_journals' // The new permission
    ];

    $selected_permissions = [];
    foreach ($permissions_array as $perm) {
      if (!empty($_POST[$perm])) {
        $selected_permissions[] = $perm;
      }
    }

    $permission = implode(',', $selected_permissions);
    $role_id = $_GET['role_id'];

    $query->permission($permission, $role_id);
  }
  ?>
  <div class="row m-0">
    <div class="sidebarcol" id="sidebar">
      <?php include 'sidebar.php'; ?>
    </div>
    <div class="contentcol" id="content">
      <?php require 'navbar.php'; ?>
      <div class="card mt-2 shadow-sm">
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
          $permissionshow = !empty($permissiondata) ? $permissiondata['permission'] : '';

          function isChecked($perm, $permissionshow)
          {
            return (strpos($permissionshow, $perm) !== false) ? 'checked' : '';
          }
          ?>
          <form action="" method="post">
            <table class="table table-bordered table-striped">
              <thead class="table-dark">
                <tr>
                  <th>Permissions</th>
                  <th>Check</th>
                  <th>Permissions</th>
                  <th>Check</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Manage Accounts</td>
                  <td><input type="checkbox" name="manage_accounts" <?= isChecked('manage_accounts', $permissionshow) ?>></td>
                  <td>Manage Contacts (Suppliers/Customers)</td>
                  <td><input type="checkbox" name="manage_contacts" <?= isChecked('manage_contacts', $permissionshow) ?>></td>
                </tr>
                <tr>
                  <td>Manage Role</td>
                  <td><input type="checkbox" name="manage_role" <?= isChecked('manage_role', $permissionshow) ?>></td>
                  <td>Manage Chart of Accounts (COA)</td>
                  <td><input type="checkbox" name="manage_coa" <?= isChecked('manage_coa', $permissionshow) ?>></td>
                </tr>
                <tr>
                  <td>Manage Sale</td>
                  <td><input type="checkbox" name="manage_sale" <?= isChecked('manage_sale', $permissionshow) ?>></td>
                  <td>Manage Products & Services</td>
                  <td><input type="checkbox" name="manage_products" <?= isChecked('manage_products', $permissionshow) ?>></td>
                </tr>
                <tr>
                  <td>Manage Purchase</td>
                  <td><input type="checkbox" name="manage_purchase" <?= isChecked('manage_purchase', $permissionshow) ?>></td>
                  <td>Manage Product Types</td>
                  <td><input type="checkbox" name="manage_product_types" <?= isChecked('manage_product_types', $permissionshow) ?>></td>
                </tr>
                <tr>
                  <td>Manage Cash Book</td>
                  <td><input type="checkbox" name="manage_cashbook" <?= isChecked('manage_cashbook', $permissionshow) ?>></td>
                  <td>Manage Unit</td>
                  <td><input type="checkbox" name="manage_unit" <?= isChecked('manage_unit', $permissionshow) ?>></td>
                </tr>
                <tr>
                  <td>Manage Account Payable</td>
                  <td><input type="checkbox" name="manage_accountpayable" <?= isChecked('manage_accountpayable', $permissionshow) ?>></td>
                  <td>Manage Cold Store Charges</td>
                  <td><input type="checkbox" name="manage_coldstorecharges" <?= isChecked('manage_coldstorecharges', $permissionshow) ?>></td>
                </tr>
                <tr>
                  <td>Manage A/C Payable</td>
                  <td><input type="checkbox" name="manage_acpayable" <?= isChecked('manage_acpayable', $permissionshow) ?>></td>
                  <td>Manage Form7</td>
                  <td><input type="checkbox" name="manage_form7" <?= isChecked('manage_form7', $permissionshow) ?>></td>
                </tr>
                <tr>
                  <td>Manage Account Receivable</td>
                  <td><input type="checkbox" name="manage_accountreceivable" <?= isChecked('manage_accountreceivable', $permissionshow) ?>></td>
                  <td>Manage Form10</td>
                  <td><input type="checkbox" name="manage_form10" <?= isChecked('manage_form10', $permissionshow) ?>></td>
                </tr>
                <tr>
                  <td>Manage Transaction</td>
                  <td><input type="checkbox" name="manage_transaction" <?= isChecked('manage_transaction', $permissionshow) ?>></td>
                  <td>Manage HHK Mc Stock</td>
                  <td><input type="checkbox" name="manage_hhkmcstock" <?= isChecked('manage_hhkmcstock', $permissionshow) ?>></td>
                </tr>
                <tr>
                  <td>Manage General ledger</td>
                  <td><input type="checkbox" name="manage_general_ledger" <?= isChecked('manage_general_ledger', $permissionshow) ?>></td>
                  <td>Manage GFC Mc Stock</td>
                  <td><input type="checkbox" name="manage_gfcmcstock" <?= isChecked('manage_gfcmcstock', $permissionshow) ?>></td>
                </tr>
                <tr>
                  <td>Manage Ledger Record</td>
                  <td><input type="checkbox" name="manage_ledger_record" <?= isChecked('manage_ledger_record', $permissionshow) ?>></td>
                  <td>Manage TCL Mc Stock</td>
                  <td><input type="checkbox" name="manage_tclmcstock" <?= isChecked('manage_tclmcstock', $permissionshow) ?>></td>
                </tr>
                <tr>
                  <td>Sale Report</td>
                  <td><input type="checkbox" name="sale_report" <?= isChecked('sale_report', $permissionshow) ?>></td>
                  <td>Manage Shippment Export</td>
                  <td><input type="checkbox" name="manage_shippmentexport" <?= isChecked('manage_shippmentexport', $permissionshow) ?>></td>
                </tr>
                <tr>
                  <td>Purchase Report</td>
                  <td><input type="checkbox" name="purchase_report" <?= isChecked('purchase_report', $permissionshow) ?>></td>
                  <td>Manage Truck Export</td>
                  <td><input type="checkbox" name="manage_truckexport" <?= isChecked('manage_truckexport', $permissionshow) ?>></td>
                </tr>
                <tr>
                  <td>Payable Report</td>
                  <td><input type="checkbox" name="payable_report" <?= isChecked('payable_report', $permissionshow) ?>></td>
                  <td>Manage Coldstore Item</td>
                  <td><input type="checkbox" name="manage_coldstoreitem" <?= isChecked('manage_coldstoreitem', $permissionshow) ?>></td>
                </tr>
                <tr>
                  <td>Manage Stock Report</td>
                  <td><input type="checkbox" name="manage_stockreport" <?= isChecked('manage_stockreport', $permissionshow) ?>></td>
                  <td>Manage Packing Material</td>
                  <td><input type="checkbox" name="manage_packingmaterial" <?= isChecked('manage_packingmaterial', $permissionshow) ?>></td>
                </tr>
                <tr>
                  <td>Manage General Ledger Report</td>
                  <td><input type="checkbox" name="manage_generalledger" <?= isChecked('manage_generalledger', $permissionshow) ?>></td>
                  <td>Manage Material Purchase</td>
                  <td><input type="checkbox" name="manage_material_purchase" <?= isChecked('manage_material_purchase', $permissionshow) ?>></td>
                </tr>
                <tr>
                  <td>Packing Material Report</td>
                  <td><input type="checkbox" name="packing_material_report" <?= isChecked('packing_material_report', $permissionshow) ?>></td>
                  <td>Material Store House</td>
                  <td><input type="checkbox" name="material_store_house" <?= isChecked('material_store_house', $permissionshow) ?>></td>
                </tr>
                <tr>
                  <td>Temp P/M Stock</td>
                  <td><input type="checkbox" name="temp_pm_stock" <?= isChecked('temp_pm_stock', $permissionshow) ?>></td>
                  <td>Packing Material Gate Pass</td>
                  <td><input type="checkbox" name="material_gatepass" <?= isChecked('material_gatepass', $permissionshow) ?>></td>
                </tr>
                <tr>
                  <td>Configuration Coldstore</td>
                  <td><input type="checkbox" name="configuration_coldstore" <?= isChecked('configuration_coldstore', $permissionshow) ?>></td>
                  <td>Profit and Loss Report</td>
                  <td><input type="checkbox" name="profit_loss_report" <?= isChecked('profit_loss_report', $permissionshow) ?>></td>
                </tr>
                <tr>
                  <td>Manage Mc Report</td>
                  <td><input type="checkbox" name="manage_mcreport" <?= isChecked('manage_mcreport', $permissionshow) ?>></td>
                  <td>Manage Currency</td>
                  <td><input type="checkbox" name="manage_currency" <?= isChecked('manage_currency', $permissionshow) ?>></td>
                </tr>
                <tr>
                  <!-- FIXED: Placed Manual Journals in the correct grid structure -->
                  <td>Manage Manual Journals</td>
                  <td><input type="checkbox" name="manage_manual_journals" <?= isChecked('manage_manual_journals', $permissionshow) ?>></td>
                  <td></td>
                  <td></td>
                </tr>
                <tr>
                  <td colspan="4" class="text-end">
                    <button type="submit" name="save" class="btn btn-success fw-bold px-5">Save Permissions</button>
                  </td>
                </tr>
              </tbody>
            </table>
          </form>
        </div>
      </div>
    </div>
  </div>
  <?php $bootstrap->javascript(); ?>
</body>

</html>