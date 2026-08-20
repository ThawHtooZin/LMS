<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();

// Fetch all manual journals with their total amounts
$stmt = $pdo->query("
    SELECT mj.*, 
           (SELECT SUM(debit) FROM manual_journal_lines mjl WHERE mjl.journal_id = mj.id) as total_amount 
    FROM manual_journals mj 
    ORDER BY mj.journal_date DESC, mj.id DESC
");
$journals = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <title>Manual Journals</title>
    <?php $bootstrap->css(); ?>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
    <style>
        .xero-card {
            background: #fff;
            border: 1px solid #e2e8f0;
            border-radius: 4px;
            padding: 30px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
        }

        .status-draft {
            background-color: #fef08a;
            color: #9a3412;
            padding: 3px 8px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: bold;
        }

        .status-posted {
            background-color: #bbf7d0;
            color: #166534;
            padding: 3px 8px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: bold;
        }

        .clickable-row {
            cursor: pointer;
        }

        .clickable-row:hover {
            background-color: #f8fafc !important;
        }
    </style>
</head>

<body>
    <div class="row m-0">
        <div class="sidebarcol" id="sidebar"><?php include 'sidebar.php'; ?></div>
        <div class="contentcol" id="content">
            <?php require 'navbar.php'; ?>

            <div class="p-4">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h4 class="fw-bold m-0">Manual Journals</h4>
                    <a href="new_journal.php" class="btn btn-primary fw-bold btn-sm"><i class="bi bi-plus-lg"></i> New Journal</a>
                </div>

                <div class="xero-card">
                    <table class="table table-hover align-middle">
                        <thead class="table-light">
                            <tr>
                                <th>Date</th>
                                <th>Narration</th>
                                <th>Amount</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php if (empty($journals)): ?>
                                <tr>
                                    <td colspan="4" class="text-center text-muted py-4">There are no manual journals to display.</td>
                                </tr>
                            <?php else: ?>
                                <?php foreach ($journals as $j): ?>
                                    <tr class="clickable-row" onclick="window.location.href='view_journal.php?id=<?= $j['id'] ?>'">
                                        <td class="fw-bold text-primary"><?= date('d M Y', strtotime($j['journal_date'])) ?></td>
                                        <td><?= htmlspecialchars($j['narration']) ?></td>
                                        <td><?= number_format($j['total_amount'], 2) ?></td>
                                        <td>
                                            <?php if ($j['status'] === 'DRAFT'): ?>
                                                <span class="status-draft">Draft</span>
                                            <?php else: ?>
                                                <span class="status-posted">Posted</span>
                                            <?php endif; ?>
                                        </td>
                                    </tr>
                                <?php endforeach; ?>
                            <?php endif; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <?php $bootstrap->javascript(); ?>
</body>

</html>