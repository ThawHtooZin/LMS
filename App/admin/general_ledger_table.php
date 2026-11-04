<table class="table table-bordered" id="table">
    <tr style="background-color: lightgray;">
        <th>Date</th>
        <th>Voucher No</th>
        <th>Account Name</th>
        <th>Description</th>
        <th>Debit</th>
        <th>Credit</th>
        <th>Currency</th>
        <th>Balance</th>
        <th>Action</th>
    </tr>
    <?php
    $date_from = $_POST['date_from'] ?? '';
    $date_to = $_POST['date_to'] ?? '';
    // Capture array of selected account codes
    $ac_codes = $_POST['ac_codes'] ?? [];

    if (isset($_POST['searchgeneralledger']) || isset($_GET['fullview'])) {

        // Pass array of codes to the ledger engine (if empty, engine handles full view)
        $ledgerData = $query->getOptimizedLedger($date_from, $date_to, $ac_codes);

        // FIXED: Fetch account names from accodes table
        $allAccounts = $query->getAllAccountNames();
        $editableVouchers = [];
        $eligibleStmt = $pdo->prepare("
            SELECT gl.voucherno
            FROM general_ledger gl
            LEFT JOIN manual_journal_lines mjl
                ON mjl.id = gl.manual_journal_line_id
               AND mjl.voucher_no = gl.voucherno
            LEFT JOIN manual_journals mj ON mj.id = mjl.journal_id
            GROUP BY gl.voucherno
            HAVING COUNT(*) >= 2
                AND COUNT(mjl.id) = COUNT(*)
                AND COUNT(DISTINCT mj.id) = 1
                AND MAX(mj.status) = 'POSTED'
                AND MIN(gl.date) = MAX(gl.date)
                AND MIN(gl.date) >= ?
                AND MAX(gl.date) <= ?
        ");
        $eligibleStmt->execute([
            date('Y-m-01'),
            date('Y-m-t')
        ]);
        foreach ($eligibleStmt->fetchAll(PDO::FETCH_COLUMN) as $editableVoucher) {
            $editableVouchers[$editableVoucher] = true;
        }

        if (empty($ledgerData)) {
            echo "<tr><td colspan='9' class='text-center fw-bold py-4'>No records found for the selected criteria.</td></tr>";
        }

        foreach ($ledgerData as $current_ac_code => $transactions) {
            $main_ac_name = $allAccounts[$current_ac_code] ?? $current_ac_code;
    ?>
            <tr>
                <td colspan="9"><b><u><?php echo "Account No. : " . htmlspecialchars($current_ac_code) . " - " . htmlspecialchars($main_ac_name); ?></u></b></td>
            </tr>
            <?php
            $balances_by_currency = [];
            $debits_by_currency = [];
            $credits_by_currency = [];

            foreach ($transactions as $t) {
                $offset_code = $t['offset_ac_code'];

                if (str_contains((string)$offset_code, '4000/')) {
                    $offset_name = 'Supplier';
                } elseif (!empty($offset_code)) {
                    $offset_name = $allAccounts[$offset_code] ?? $offset_code;
                } else {
                    if (str_contains((string)$current_ac_code, '4000/')) {
                        if (stripos((string)$t['narration'], "balance") !== false) {
                            $offset_name = '';
                        } else {
                            $offset_name = 'Purchase';
                        }
                    } else {
                        $offset_name = $main_ac_name;
                    }
                }

                $debit = floatval($t['debit']);
                $credit = floatval($t['credit']);
                $movement = $debit - $credit;

                $currency_display = $t['currency'] ?? 'MMK';
                $usdRate = $currency_display === 'USD' && is_numeric($t['transaction_usd_rate'] ?? null)
                    ? (float) $t['transaction_usd_rate']
                    : 0.0;
                if (!isset($balances_by_currency[$currency_display])) {
                    $balances_by_currency[$currency_display] = 0.0;
                    $debits_by_currency[$currency_display] = 0.0;
                    $credits_by_currency[$currency_display] = 0.0;
                }
                $balances_by_currency[$currency_display] += $movement;
                $debits_by_currency[$currency_display] += $debit;
                $credits_by_currency[$currency_display] += $credit;
            ?>
                <tr>
                    <td><?php echo date('d/m/Y', strtotime($t['date'])); ?></td>
                    <td><?php echo htmlspecialchars($t['voucherno']); ?></td>
                    <td><?php echo htmlspecialchars($offset_name); ?></td>
                    <td><?php echo htmlspecialchars($t['narration']); ?></td>
                    <td>
                        <?php echo format_lms_amount($debit); ?>
                        <?php if ($usdRate > 0 && $debit != 0): ?><small class="d-block text-muted">MMK <?php echo format_lms_amount($debit * $usdRate); ?> at transaction-date rate</small><?php endif; ?>
                    </td>
                    <td>
                        <?php echo format_lms_amount($credit); ?>
                        <?php if ($usdRate > 0 && $credit != 0): ?><small class="d-block text-muted">MMK <?php echo format_lms_amount($credit * $usdRate); ?> at transaction-date rate</small><?php endif; ?>
                    </td>
                    <td><?php echo htmlspecialchars((string) $currency_display); ?></td>
                    <td><?php echo htmlspecialchars((string) $currency_display); ?> <?php echo format_lms_amount($balances_by_currency[$currency_display]); ?></td>
                    <td>
                        <?php if (isset($editableVouchers[$t['voucherno']]) && !str_contains(strtolower((string) $offset_name), 'purchase')): ?>
                            <a href="edit_journal.php?voucherno=<?= urlencode($t['voucherno']); ?>" class="btn btn-warning btn-sm text-light" aria-label="Edit journal">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                    <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                                </svg>
                            </a>
                        <?php endif; ?>
                    </td>
                </tr>
            <?php } ?>
            <tr style="font-weight:bold;">
                <td>Total:</td>
                <td></td>
                <td></td>
                <td></td>
                <td><?php foreach ($debits_by_currency as $currency => $amount): ?><?= htmlspecialchars((string) $currency); ?> <?= format_lms_amount($amount); ?><br><?php endforeach; ?></td>
                <td><?php foreach ($credits_by_currency as $currency => $amount): ?><?= htmlspecialchars((string) $currency); ?> <?= format_lms_amount($amount); ?><br><?php endforeach; ?></td>
                <td></td>
                <td><?php foreach ($balances_by_currency as $currency => $balance): ?><?= htmlspecialchars((string) $currency); ?> <?= format_lms_amount($balance); ?><br><?php endforeach; ?></td>
                <td></td>
            </tr>
    <?php
        }
    }
    ?>
</table>