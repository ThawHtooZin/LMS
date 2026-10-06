<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();

function glReportAccountLabel(Query $query, string $acCode): string
{
  $row = $query->select('acname', $acCode, 'code_no');
  return !empty($row['ac_name']) ? $row['ac_name'] : $acCode;
}

function glReportVoucherCurrency(PDO $pdo, string $voucherNo): string
{
  $stmt = $pdo->prepare('SELECT currency FROM sales WHERE sr_no = ? LIMIT 1');
  $stmt->execute([$voucherNo]);
  $currency = $stmt->fetchColumn();
  if ($currency) {
    return (string)$currency;
  }
  $stmt = $pdo->prepare('SELECT currency FROM purchases WHERE voucher_no = ? LIMIT 1');
  $stmt->execute([$voucherNo]);
  $currency = $stmt->fetchColumn();
  return $currency ? (string)$currency : 'MMK';
}

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
        <div class="card-header bg-warning text-light">
          <form action="" class="d-inline" method="post">
            <?php
            if (isset($_POST['searchgeneralledger'])) {
            ?>
              <a href="export.php?table_name=general_ledger&searchgeneralledger=true&date_from=<?= $_POST['date_from']; ?>&date_to=<?= $_POST['date_to']; ?>&ac_code=<?= $_POST['ac_code'] ?>" class="btn btn-sm ms-2 btn-success float-end">Export</a>
            <?php
            } else {
            ?>
              <a href="export.php?table_name=general_ledger" class="btn btn-sm ms-2 btn-success float-end">Export</a>
            <?php
            }
            ?>
          </form>
          <h5>General Ledger</h5>
        </div>
        <div class="card-body">
          <div>
            <form class="border p-3" action="generalledgerreport.php" method="post">
              <div class="d-flex">
                <select class="form-control w-50 inpv2" name="reportselect">
                  <option value="">Select Report Method</option>
                  <option value="accountsearch">Account Name Search</option>
                  <option value="dbwsearch">Date Between Search</option>
                  <option value="datesearch">Today Search</option>
                  <option value="accountanddbwsearch">Account name and Date between Search</option>
                </select>
                <button type="submit" name="ok" class="btn btn-primary">Ok</button>
              </div>
              <br>
              <!-- Search Date Between -->
              <?php
              if (isset($_POST['ok']) && $_POST['reportselect'] == 'dbwsearch') {
              ?>
                <label>Date Between Search:</label>
                <br>
                <div class="row">
                  <div class="col-6">
                    <label>Start Date</label>
                    <input type="date" name="dbwstartdate" class="form-control inpv2">
                  </div>
                  <div class="col-1 text-center">
                    To
                  </div>
                  <div class="col-5">
                    <label>End Date</label>
                    <input type="date" name="dbwenddate" class="form-control inpv2">
                  </div>
                </div>
                <button type="submit" name="dbwsearch" class="btn btn-primary btn-sm">Check Reports</button>
              <?php
              }
              ?>
              <!-- Today Search -->
              <?php
              if (isset($_POST['ok']) && $_POST['reportselect'] == 'datesearch') {
              ?>
                <input type="date" name="date" class="form-control inpv2">
                <button type="submit" name="datesearch" class="btn btn-primary btn-sm">Search Date Report</button>
              <?php
              }
              ?>
              <!-- Account Search -->
              <?php
              if (isset($_POST['ok']) && $_POST['reportselect'] == 'accountsearch') {
              ?>
                <div class="row">
                  <div class="col">
                    <label>Account No</label>
                    <input type="text" name="ac_code" class="form-control inpv2 mb-2" id="ac_code">
                  </div>
                  <div class="col">
                    <label>Account Name</label>
                    <div class="" id="ac_name">
                      <input type="text" disabled class="form-control inpv2 mb-2">
                    </div>
                  </div>
                </div>
                <button type="submit" name="accountsearch" class="btn btn-primary btn-sm">Check Reports</button>
              <?php
              }
              ?>
              <!-- Account And Dbw Search -->
              <?php
              if (isset($_POST['ok']) && $_POST['reportselect'] == 'accountanddbwsearch') {
              ?>
                <div class="row">
                  <div class="col">
                    <label>Account No</label>
                    <input type="text" name="ac_code" class="form-control inpv2 mb-2" id="ac_code">
                  </div>
                  <div class="col">
                    <label>Account Name</label>
                    <div class="" id="ac_name">
                      <input type="text" disabled class="form-control inpv2 mb-2">
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-6">
                    <label>Start Date</label>
                    <input type="date" name="dbwstartdate" class="form-control inpv2">
                  </div>
                  <div class="col-6">
                    <label>End Date</label>
                    <input type="date" name="dbwenddate" class="form-control inpv2">
                  </div>
                </div>
                <button type="submit" name="accountanddbwsearch" class="btn btn-primary btn-sm">Check Reports</button>
              <?php
              }
              ?>
            </form>
          </div>
          <table class="table table-bordered">
            <tr style="background-color: lightgray;">
              <th>Date</th>
              <th>Voucher No</th>
              <th>Account Name</th>
              <th>Description</th>
              <th>Debit</th>
              <th>Credit</th>
              <th>Currency</th>
              <th>Balance</th>
            </tr>
            <?php
            $search = isset($_POST['accountsearch'])
              || isset($_POST['dbwsearch'])
              || isset($_POST['datesearch'])
              || isset($_POST['accountanddbwsearch']);
            if ($search) {
              $filterAcCode = trim($_POST['ac_code'] ?? '');
              $dateFrom = $_POST['dbwstartdate'] ?? '';
              $dateTo = $_POST['dbwenddate'] ?? '';
              $singleDate = $_POST['date'] ?? '';

              $accountCodes = [];
              if ((isset($_POST['accountsearch']) || isset($_POST['accountanddbwsearch'])) && $filterAcCode !== '') {
                $accountCodes = [$filterAcCode];
              } elseif (isset($_POST['dbwsearch']) && $dateFrom !== '' && $dateTo !== '') {
                $accodestmt = $pdo->prepare('SELECT DISTINCT ac_code FROM general_ledger WHERE date BETWEEN ? AND ? ORDER BY ac_code ASC');
                $accodestmt->execute([$dateFrom, $dateTo]);
                $accountCodes = array_column($accodestmt->fetchAll(PDO::FETCH_ASSOC), 'ac_code');
              } elseif (isset($_POST['datesearch']) && $singleDate !== '') {
                $accodestmt = $pdo->prepare('SELECT DISTINCT ac_code FROM general_ledger WHERE date = ? ORDER BY ac_code ASC');
                $accodestmt->execute([$singleDate]);
                $accountCodes = array_column($accodestmt->fetchAll(PDO::FETCH_ASSOC), 'ac_code');
              }

              foreach ($accountCodes as $sectionAcCode) {
                $sql = 'SELECT * FROM general_ledger WHERE ac_code = ?';
                $params = [$sectionAcCode];
                if (isset($_POST['accountanddbwsearch']) && $dateFrom !== '' && $dateTo !== '') {
                  $sql .= ' AND date BETWEEN ? AND ?';
                  $params[] = $dateFrom;
                  $params[] = $dateTo;
                } elseif (isset($_POST['dbwsearch']) && $dateFrom !== '' && $dateTo !== '') {
                  $sql .= ' AND date BETWEEN ? AND ?';
                  $params[] = $dateFrom;
                  $params[] = $dateTo;
                } elseif (isset($_POST['datesearch']) && $singleDate !== '') {
                  $sql .= ' AND date = ?';
                  $params[] = $singleDate;
                }
                $sql .= ' ORDER BY date ASC, id ASC';
                $glstmt = $pdo->prepare($sql);
                $glstmt->execute($params);
                $gldatas = $glstmt->fetchAll(PDO::FETCH_ASSOC);
                if (empty($gldatas)) {
                  continue;
                }

                $sectionLabel = glReportAccountLabel($query, $sectionAcCode);
            ?>
                <tr>
                  <td colspan="8"><b><u><?= 'Account No. : ' . htmlspecialchars($sectionAcCode) . ' - ' . htmlspecialchars($sectionLabel); ?></u></b></td>
                </tr>
                <?php
                $runningBalance = 0.0;
                $totalDebit = 0.0;
                $totalCredit = 0.0;
                foreach ($gldatas as $gldata) {
                  $debit = (float)$gldata['debit'];
                  $credit = (float)$gldata['credit'];
                  $runningBalance += $debit - $credit;
                  $totalDebit += $debit;
                  $totalCredit += $credit;
                  $acName = glReportAccountLabel($query, $gldata['ac_code']);
                  $currency = glReportVoucherCurrency($pdo, $gldata['voucherno']);
                  ?>
                  <tr>
                    <td><?= date('d/m/Y', strtotime($gldata['date'])); ?></td>
                    <td><?= htmlspecialchars($gldata['voucherno']); ?></td>
                    <td><?= htmlspecialchars($acName); ?></td>
                    <td><?= htmlspecialchars($gldata['narration']); ?></td>
                    <td class="text-end"><?= format_lms_amount($debit, true); ?></td>
                    <td class="text-end"><?= format_lms_amount($credit, true); ?></td>
                    <td><?= htmlspecialchars($currency); ?></td>
                    <td class="text-end"><?= format_lms_amount($runningBalance); ?></td>
                  </tr>
                <?php } ?>
                <tr style="font-weight:bold;">
                  <td colspan="4" class="text-end">Total:</td>
                  <td class="text-end"><?= format_lms_amount($totalDebit); ?></td>
                  <td class="text-end"><?= format_lms_amount($totalCredit); ?></td>
                  <td></td>
                  <td class="text-end"><?= format_lms_amount($runningBalance); ?></td>
                </tr>
            <?php
              }
            } ?>
          </table>
        </div>
      </div>
    </div>
  </div>
  <?php
  $bootstrap->javascript();
  ?>
  <script type="text/javascript">
    let loadnumber = 1;
    $(document).ready(function() {
      $('#ac_code').on('keyup', function() {
        var ac_codepost = $('#ac_code').val();
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
        $('#ac_name').load('ac_name.php', {
          FirstPart: firstpart,
          LastPart: JSON.stringify(lastpart),
          Type: type
        });
      });
      $('#reportsmodal').on('hidden.bs.modal', function() {
        $('#table').show();
      })
    });
  </script>
</body>

</html>