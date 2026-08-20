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
    $ac_code = $_POST['ac_code'] ?? '';

    // If it's a POST request (search) or full view, fetch data using the new optimized engine
    if (isset($_POST['searchgeneralledger']) || isset($_GET['fullview'])) {

        $ledgerData = $query->getOptimizedLedger($date_from, $date_to, $ac_code);
        $allAccounts = $query->getAllAccountNames(); // Fetches all names in 1 query

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
            $realbalance = 0;
            $t_debit = 0;
            $t_credit = 0;

            foreach ($transactions as $t) {
                $offset_code = $t['offset_ac_code'];

                // Offset Account Naming Logic
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

                $realbalance += $movement;
                $t_debit += $debit;
                $t_credit += $credit;

                // Safe fallback for currency 
                $currency_display = 'MMK';
                if (str_contains((string)$current_ac_code, '3600/002')) {
                    $currency_display = 'USD';
                }
            ?>
                <tr>
                    <td><?php echo date('d/m/Y', strtotime($t['date'])); ?></td>
                    <td><?php echo htmlspecialchars($t['voucherno']); ?></td>
                    <td><?php echo htmlspecialchars($offset_name); ?></td>
                    <td><?php echo htmlspecialchars($t['narration']); ?></td>
                    <td><?php echo number_format($debit, 2); ?></td>
                    <td><?php echo number_format($credit, 2); ?></td>
                    <td><?php echo $currency_display; ?></td>
                    <td><?php echo number_format($realbalance, 2); ?></td>
                    <td>
                        <a href="edittransaction.php?voucher_no=<?= urlencode($t['voucherno']); ?>&file=general_ledger&id=<?= $t['id']; ?>" style="<?php if (str_contains(strtolower((string)$offset_name), 'purchase')) {
                                                                                                                                                        echo "display:none;";
                                                                                                                                                    } ?>">
                            <button type="button" class="btn btn-warning btn-sm text-light"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                    <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                                </svg>
                            </button>
                        </a>
                    </td>
                </tr>
            <?php } ?>
            <tr style="font-weight:bold;">
                <td>Total:</td>
                <td></td>
                <td></td>
                <td></td>
                <td><?= number_format($t_debit, 2); ?></td>
                <td><?= number_format($t_credit, 2); ?></td>
                <td></td>
                <td><?= number_format($t_debit - $t_credit, 2); ?></td>
                <td></td>
            </tr>
    <?php
        }
    }
    ?>
</table>