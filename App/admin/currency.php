<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();

// Handle Date Selection
$selected_date = isset($_GET['date']) ? $_GET['date'] : date('Y-m-d');

// Handle Post Requests
if (isset($_POST['add_currency'])) {
    $code_name = explode('|', $_POST['currency_selection']);
    if (count($code_name) == 2) {
        $query->addSystemCurrency($code_name[0], $code_name[1]);
    }
}

if (isset($_POST['save_rates'])) {
    $rates = $_POST['rates'];
    $query->saveDailyRates($selected_date, $rates);
}

if (isset($_POST['delete_currency'])) {
    $delete_code = $_POST['delete_code'];
    $query->deleteSystemCurrency($delete_code);
}

// Fetch Active Currencies
$curr_stmt = $pdo->prepare("SELECT * FROM system_currencies ORDER BY code ASC");
$curr_stmt->execute();
$active_currencies = $curr_stmt->fetchAll(PDO::FETCH_ASSOC);

// Fetch Rates for Selected Date
$rates_stmt = $pdo->prepare("SELECT currency_code, rate FROM exchange_rates WHERE effective_date = ?");
$rates_stmt->execute([$selected_date]);
$saved_rates = $rates_stmt->fetchAll(PDO::FETCH_KEY_PAIR);

// Global Currency List for the Add Modal
$global_currencies = [
    'USD' => 'US Dollar',
    'THB' => 'Thai Baht',
    'SGD' => 'Singapore Dollar',
    'CNY' => 'Chinese Yuan',
    'EUR' => 'Euro',
    'GBP' => 'British Pound',
    'JPY' => 'Japanese Yen',
    'MYR' => 'Malaysian Ringgit',
    'INR' => 'Indian Rupee'
];
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <title>Manage Currencies</title>
    <?php $bootstrap->css(); ?>
</head>

<body>
    <div class="row">
        <div class="sidebarcol" id="sidebar">
            <?php include 'sidebar.php'; ?>
        </div>
        <div class="contentcol" id="content">
            <?php require 'navbar.php'; ?>
            <div class="card">
                <div class="card-header bg-warning text-light" style="padding:-10px;">
                    <b>Manage Currencies & Exchange Rates</b>
                </div>
                <div class="card-body">

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <form action="currency.php" method="get" id="dateForm" class="d-flex align-items-center">
                                <label class="fw-bold me-2">Exchange rates for:</label>
                                <input type="date" name="date" class="form-control form-control-sm w-auto" value="<?php echo htmlspecialchars($selected_date); ?>" onchange="document.getElementById('dateForm').submit();">
                            </form>
                        </div>
                        <div class="col-md-6 text-end">
                            <button type="button" class="btn btn-success btn-sm" data-bs-toggle="modal" data-bs-target="#addCurrencyModal">
                                Add Currency
                            </button>
                        </div>
                    </div>

                    <form action="currency.php?date=<?php echo urlencode($selected_date); ?>" method="post">
                        <table class="mt-1 table table-bordered table-striped rounded">
                            <thead>
                                <tr>
                                    <th width="35%">Currency</th>
                                    <th width="45%">Exchange Rate (to MMK)</th>
                                    <th width="20%">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php if (count($active_currencies) == 0): ?>
                                    <tr>
                                        <td colspan="3" class="text-center text-muted">There are no currencies to display. Please add a currency.</td>
                                    </tr>
                                <?php else: ?>
                                    <?php foreach ($active_currencies as $curr):
                                        $code = $curr['code'];
                                        $current_rate = isset($saved_rates[$code]) ? floatval($saved_rates[$code]) : '';
                                    ?>
                                        <tr>
                                            <td class="fw-bold align-middle">
                                                <?php echo htmlspecialchars($curr['code'] . ' - ' . $curr['name']); ?>
                                            </td>
                                            <td class="align-middle">
                                                <div class="input-group input-group-sm w-75">
                                                    <input type="number" step="0.0001" name="rates[<?php echo htmlspecialchars($code); ?>]" class="form-control" placeholder="e.g. 3500.00" value="<?php echo htmlspecialchars($current_rate); ?>">
                                                    <span class="input-group-text">MMK</span>
                                                </div>
                                            </td>
                                            <td class="align-middle">
                                                <button type="submit" name="delete_currency" class="btn btn-sm btn-danger" onclick="document.getElementById('delete_code').value='<?php echo $code; ?>'; return confirm('Are you sure you want to delete this currency? This will remove its exchange rate history as well.');">Delete</button>
                                            </td>
                                        </tr>
                                    <?php endforeach; ?>
                                <?php endif; ?>
                            </tbody>
                        </table>

                        <!-- Hidden input to pass the code of the currency being deleted -->
                        <input type="hidden" name="delete_code" id="delete_code" value="">

                        <?php if (count($active_currencies) > 0): ?>
                            <button type="submit" name="save_rates" class="btn btn-primary btn-sm mt-2 float-end">Save Rates</button>
                        <?php endif; ?>
                    </form>

                </div>
            </div>
        </div>
    </div>

    <!-- Add Currency Modal -->
    <div class="modal fade" id="addCurrencyModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header bg-secondary text-light">
                    <h5 class="modal-title">Add Currency</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="currency.php?date=<?php echo urlencode($selected_date); ?>" method="post">
                    <div class="modal-body">
                        <label>Select a currency</label>
                        <select name="currency_selection" class="form-control" required>
                            <option value="" disabled selected>-- Choose Currency --</option>
                            <?php foreach ($global_currencies as $code => $name): ?>
                                <option value="<?php echo htmlspecialchars($code . '|' . $name); ?>"><?php echo htmlspecialchars($code . ' - ' . $name); ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" name="add_currency" class="btn btn-success">Add Currency</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <?php $bootstrap->javascript(); ?>
</body>

</html>