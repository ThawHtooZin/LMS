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
    if (isset($_POST['searchgeneralledger'])) {
        $date_from = $_POST['date_from'];
        $date_to = $_POST['date_to'];
        $ac_code = $_POST['ac_code'];

        if (!empty($date_from) && !empty($date_to) && !empty($ac_code)) {
            $acnamecountstmt = $pdo->prepare("SELECT COUNT(DISTINCT ac_code) FROM general_ledger  WHERE `date` BETWEEN '$date_from' AND '$date_to' AND ac_code='$ac_code'");
            $acnamecountstmt->execute();
            $acnamecount = $acnamecountstmt->fetchColumn();
            $acnamedontloop = 1;
        } elseif (!empty($date_from) && !empty($date_to) && empty($ac_code)) {
            $acnamecountstmt = $pdo->prepare("SELECT COUNT(DISTINCT ac_code) FROM general_ledger  WHERE `date` BETWEEN '$date_from' AND '$date_to'");
            $acnamecountstmt->execute();
            $acnamecount = $acnamecountstmt->fetchColumn();
            $acnamedontloop = 2;
        } elseif (!empty($date_to) || !empty($date_from) && !empty($ac_code)) {
            if (!empty($date_from)) {
                $acnamecountstmt = $pdo->prepare("SELECT COUNT(DISTINCT ac_code) FROM general_ledger  WHERE `date`='$date_from' AND ac_code='$ac_code'");
                $acnamecountstmt->execute();
                $acnamecount = $acnamecountstmt->fetchColumn();
                $acnamedontloop = 1;
                $acnamecount = 1;
            } elseif (!empty($date_to)) {
                $acnamecountstmt = $pdo->prepare("SELECT COUNT(DISTINCT ac_code) FROM general_ledger  WHERE `date`='$date_to' AND ac_code='$ac_code'");
                $acnamecountstmt->execute();
                $acnamecount = $acnamecountstmt->fetchColumn();
                $acnamedontloop = 1;
                $acnamecount = 1;
            }
        } elseif (!empty($date_to) || !empty($date_from) && empty($ac_code)) {
            if (!empty($date_from)) {
                $acnamecountstmt = $pdo->prepare("SELECT COUNT(DISTINCT ac_code) FROM general_ledger  WHERE `date`='$date_from'");
                $acnamecountstmt->execute();
                $acnamecount = $acnamecountstmt->fetchColumn();
                $acnamedontloop = 2;
            } elseif (!empty($date_to)) {
                $acnamecountstmt = $pdo->prepare("SELECT COUNT(DISTINCT ac_code) FROM general_ledger  WHERE `date`='$date_to'");
                $acnamecountstmt->execute();
                $acnamecount = $acnamecountstmt->fetchColumn();
                $acnamedontloop = 2;
            }
        } else {
            $acnamecount = 1;
            $acnamedontloop = 1;
        }
        for ($i = 0; $i < $acnamecount; $i++) {
            $accodestmt = $pdo->prepare("SELECT DISTINCT ac_code FROM general_ledger");
            $accodestmt->execute();
            $accodedata = $accodestmt->fetchall();
            $accode = $accodedata[$i]['ac_code'];

            if (!empty($acnamedontloop) && $acnamedontloop > 1) {
                $gldatas = $query->search('general_ledger', 'ac_code', $accode);
                $acnametoshow = $query->select('acname', $accode, 'code_no');
            } else {
                $gldatas = $query->search('general_ledger', 'ac_code', $ac_code);
                $acnametoshow = $query->select('acname', $ac_code, 'code_no');
            }
    ?>
            <tr>
                <td colspan="8"><b><u><?php echo "Account No. : " . $ac_code . " - " . ($acnametoshow['ac_name'] ?? ''); ?></u></b></td>
            </tr>
            <?php
            $realbalance = 0;
            foreach ($gldatas as $gldata) : ?>
                <?php
                $ac_code = $gldata['ac_code'];
                $acname = $query->select('acname', $ac_code, 'code_no');

                // acnamechange (Now querying general_ledger instead of transaction to find the offset account)
                $voucher_no = $gldata['voucherno'];
                $description = $gldata['narration'];
                $acselectstmt = $pdo->prepare("SELECT * FROM general_ledger WHERE voucherno=:voucher_no AND ac_code!='$ac_code' LIMIT 1");
                $acselectstmt->execute(
                    array(':voucher_no' => $voucher_no)
                );
                $acselect = $acselectstmt->fetch(PDO::FETCH_ASSOC);
                $accode = $acselect['ac_code'] ?? '';

                if (str_contains($accode, '4000/')) {
                    $acname = 'Supplier';
                } else {
                    $acnamedata = $query->select('acname', $accode, 'code_no');
                    $acname = $acnamedata['ac_name'] ?? '';
                }
                // acnamechange

                $movement = floatval($gldata['debit']) - floatval($gldata['credit']);
                $realbalance += $movement;

                if ($gldata['debit'] == 0 && $gldata['credit'] == 0) {
                    $debitorcredit = 'balance';
                } elseif ($gldata['debit'] != 0) {
                    $debitorcredit = 'debit';
                } else {
                    $debitorcredit = 'credit';
                }

                // Fetch currency without transactionid
                if (str_contains($gldata['ac_code'], '3300/')) {
                    $currencystmt = $pdo->prepare("SELECT * FROM currency WHERE voucher_no=:voucher_no AND debitorcredit='$debitorcredit'");
                } else {
                    $currencystmt = $pdo->prepare("SELECT * FROM currency WHERE voucher_no=:voucher_no AND debitorcredit='$debitorcredit'");
                }
                $currencystmt->execute(
                    array(':voucher_no' => $voucher_no)
                );
                $currencydata = $currencystmt->fetch(PDO::FETCH_ASSOC);
                ?>
                <tr>
                    <td><?php echo date('d/m/Y', strtotime($gldata['date'])); ?></td>
                    <td><?php echo $gldata['voucherno']; ?></td>
                    <td><?php echo $acname; ?></td>
                    <td><?php echo $gldata['narration']; ?></td>
                    <td><?php echo $gldata['debit']; ?></td>
                    <td><?php echo $gldata['credit']; ?></td>
                    <td><?php if (empty($currencydata['usd_amount']) || $currencydata['usd_amount'] == 0 || str_contains($gldata['ac_code'], '3600/001') || str_contains($gldata['ac_code'], '3700/003')) {
                            echo 'MMK';
                        } else {
                            echo 'USD';
                        } ?></td>
                    <td><?php echo number_format($realbalance, 2); ?></td>
                    <td>
                        <a href="edittransaction.php?voucher_no=<?= $gldata['voucherno']; ?>&file=general_ledger&id=<?= $gldata['id']; ?>" style="<?php if (str_contains(strtolower($acname), 'purchase')) {
                                                                                                                                                        echo "display:none;";
                                                                                                                                                    } ?>">
                            <button type="submit" class="btn btn-warning btn-sm text-light" name="updatebutton"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                    <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                                </svg>
                            </button>
                        </a>
                    </td>
                </tr>
            <?php endforeach;
            $debitstmt = $pdo->prepare("SELECT SUM(debit) AS total_debit FROM general_ledger WHERE ac_code='$ac_code'");
            $debitstmt->execute();
            $totaldebit = $debitstmt->fetch(PDO::FETCH_ASSOC);
            $creditstmt = $pdo->prepare("SELECT SUM(credit) AS total_credit FROM general_ledger WHERE ac_code='$ac_code'");
            $creditstmt->execute();
            $totalcredit = $creditstmt->fetch(PDO::FETCH_ASSOC);
            $totalbalance = $totaldebit['total_debit'] - $totalcredit['total_credit'];
            ?>
            <tr style="font-weight:bold;">
                <td>Total:</td>
                <td></td>
                <td></td>
                <td></td>
                <td><?= $totaldebit['total_debit']; ?></td>
                <td><?= $totalcredit['total_credit']; ?></td>
                <td></td>
                <td><?= number_format($totalbalance, 2); ?></td>
                <td></td>
            </tr>
        <?php
        }
    } else {
        $acnamecountstmt = $pdo->prepare("SELECT COUNT(DISTINCT ac_code) FROM general_ledger");
        $acnamecountstmt->execute();
        $acnamecount = $acnamecountstmt->fetchColumn();
        for ($i = 0; $i < $acnamecount; $i++) {
            $accodestmt = $pdo->prepare("SELECT DISTINCT ac_code FROM general_ledger");
            $accodestmt->execute();
            $accodedata = $accodestmt->fetchall();
            $accode = $accodedata[$i]['ac_code'];
            $gldatas = $query->search('general_ledger', 'ac_code', $accode);
            $acname = $query->select('acname', $accode, 'code_no');
        ?>
            <tr>
                <td colspan="8"><b><u><?php echo "Account No. : " . $accode . " - " . ($acname['ac_name'] ?? ''); ?></u></b></td>
            </tr>
            <?php
            $realbalance = 0;
            foreach ($gldatas as $gldata) : ?>
                <?php
                $ac_code = $gldata['ac_code'];
                $acname = $query->select('acname', $ac_code, 'code_no');

                // acnamechange (Querying general_ledger instead of transaction to find offset account)
                $voucher_no = $gldata['voucherno'];
                $description = $gldata['narration'];
                $acselectstmt = $pdo->prepare("SELECT * FROM general_ledger WHERE voucherno=:voucher_no AND ac_code!='$ac_code' LIMIT 1");
                $acselectstmt->execute([
                    ':voucher_no' => $voucher_no
                ]);
                $acselect = $acselectstmt->fetch(PDO::FETCH_ASSOC);

                if (!empty($acselect['ac_code'])) {
                    $accode = $acselect['ac_code'];

                    if (str_contains($accode, '4000/')) {
                        $acname = 'Supplier';
                    } else {
                        $acnamedata = $query->select('acname', $accode, 'code_no');
                        $acname = $acnamedata['ac_name'] ?? '';
                    }
                } else {
                    if (str_contains($accode, '4000/')) {
                        if (str_contains($gldata['narration'], "balance") || str_contains($gldata['narration'], "Balance")) {
                            $acname = '';
                        } else {
                            $acname = 'Purchase';
                        }
                    } else {
                        $acnamedata = $query->select('acname', $accode, 'code_no');
                        $acname = $acnamedata['ac_name'] ?? '';
                    }
                }

                $movement = floatval($gldata['debit']) - floatval($gldata['credit']);
                $realbalance += $movement;

                if ($gldata['debit'] == 0 && $gldata['credit'] == 0) {
                    $debitorcredit = 'balance';
                } elseif ($gldata['debit'] != 0) {
                    $debitorcredit = 'debit';
                } else {
                    $debitorcredit = 'credit';
                }

                // Fetch currency without transactionid
                $currencystmt = $pdo->prepare("SELECT * FROM currency WHERE voucher_no=:voucher_no AND debitorcredit='$debitorcredit'");
                $currencystmt->execute(
                    array(':voucher_no' => $voucher_no)
                );
                $currencydata = $currencystmt->fetch(PDO::FETCH_ASSOC);
                ?>
                <tr>
                    <td><?php echo date('d/m/Y', strtotime($gldata['date'])); ?></td>
                    <td><?php echo $gldata['voucherno']; ?></td>
                    <td><?php echo $acname; ?></td>
                    <td><?php echo $gldata['narration']; ?></td>
                    <td><?php echo $gldata['debit']; ?></td>
                    <td><?php echo $gldata['credit']; ?></td>
                    <td><?php if (empty($currencydata['usd_amount']) || $currencydata['usd_amount'] == 0 || str_contains($gldata['ac_code'], '3600/001')) {
                            echo 'MMK';
                        } else {
                            echo 'USD';
                        } ?></td>
                    <td><?php echo number_format($realbalance, 2); ?></td>
                    <td>
                        <a href="edittransaction.php?voucher_no=<?= $gldata['voucherno']; ?>&file=general_ledger&id=<?= $gldata['id']; ?>" style="<?php if (str_contains(strtolower($acname), 'purchase')) {
                                                                                                                                                        echo "display:none;";
                                                                                                                                                    } ?>">
                            <button type="submit" class="btn btn-warning btn-sm text-light" name="updatebutton"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                    <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                    <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                                </svg>
                            </button>
                        </a>
                    </td>
                </tr>

                <!-- Data Update Modal -->
                <!-- <div class="modal fade" id="updatemodal<?php echo $gldata['id']; ?>" tabindex="-1" role="dialog" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content" style="width:600px !important;">
                      <div class="modal-header bg-warning text-light">
                        <h5 class="modal-title" id="updatemodallabel">Update An Account</h5>
                        <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true" class="h3">&times;</span>
                        </button>
                      </div>
                      <form action="" method="post" autocomplete="off">
                        <div class="modal-body">
                          <?php
                            $id = $gldata['id'];
                            $updatedata = $query->select('general_ledger', $id, 'id');
                            $voucher_no = $updatedata['voucherno'];
                            $acstmt = $pdo->prepare("SELECT ac_code FROM general_ledger WHERE voucherno=:voucher_no AND ac_code!=:ac_code LIMIT 1");
                            $acstmt->execute([
                                ':voucher_no' => $voucher_no,
                                ':ac_code' => $gldata['ac_code']
                            ]);
                            $acdata = $acstmt->fetch(PDO::FETCH_ASSOC);
                            if (!empty($acdata)) {
                                $ac_code = $acdata['ac_code'];
                            } else {
                            }
                            $acnamedata = $query->select('acname', $ac_code, 'code_no');

                            ?>
                          <input type="hidden" name="updateid" value="<?php echo $gldata['id']; ?>">
                          <div class="row">
                            <div class="col">
                              <label>Date</label>
                              <input type="date" name="date" class="form-control inpv2 mb-2" value="<?= $gldata['date']; ?>">
                            </div>
                            <div class="col">
                              <label>Voucher No</label>
                              <input type="text" name="voucher_no" class="form-control inpv2 mb-2" value="<?= $gldata['voucherno']; ?>">
                            </div>
                          </div>
                          <div class="row">
                            <div class="col">
                              <label>A/C Name</label>
                              <input type="text" name="ac_name" class="form-control inpv2 mb-2" value="<?= $acnamedata['ac_name'] ?? ''; ?>">
                            </div>
                            <div class="col">
                              <label>Particular</label>
                              <input type="text" name="particular" class="form-control inpv2 mb-2" value="<?= $gldata['narration']; ?>">
                            </div>
                          </div>
                          <div class="row">
                            <div class="col">
                              <label>Debit</label>
                              <input type="number" name="debit" class="form-control inpv2 mb-2" value="<?= $gldata['debit']; ?>">
                            </div>
                            <div class="col">
                              <label>Credit</label>
                              <input type="number" name="credit" class="form-control inpv2 mb-2" value="<?= $gldata['credit']; ?>">
                            </div>
                          </div>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                          <button type="submit" class="btn btn-warning" name="updateaccount">Update</button>
                        </div>
                      </form>
                    </div>
                  </div>
                </div> -->
                <!-- Update Modal -->
            <?php endforeach; ?>
            <?php

            $ac_code = $gldata['ac_code'];
            $acname = $query->select('acname', $ac_code, 'code_no');
            $debitstmt = $pdo->prepare("SELECT SUM(debit) AS total_debit FROM general_ledger WHERE ac_code='$ac_code'");
            $debitstmt->execute();
            $totaldebit = $debitstmt->fetch(PDO::FETCH_ASSOC);
            $creditstmt = $pdo->prepare("SELECT SUM(credit) AS total_credit FROM general_ledger WHERE ac_code='$ac_code'");
            $creditstmt->execute();
            $totalcredit = $creditstmt->fetch(PDO::FETCH_ASSOC);

            // Dynamic running balance calculation
            $totalbalance = floatval($totaldebit['total_debit']) - floatval($totalcredit['total_credit']);

            ?>
            <tr style="font-weight:bold;">
                <td>Total:</td>
                <td></td>
                <td></td>
                <td></td>
                <td><?= number_format($totaldebit['total_debit'], 2); ?></td>
                <td><?= number_format($totalcredit['total_credit'], 2); ?></td>
                <td></td>
                <td><?= number_format($totalbalance, 2); ?></td>
                <td></td>
            </tr>
    <?php }
    } ?>
</table>