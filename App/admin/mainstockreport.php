<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();
$bootstrap = new Bootstrap();
$query = new Query();

$reportType = $_GET['type'] ?? null;

// Function to add box only for Balance reports
function getIcon($svg, $title)
{
    if (str_contains($title, 'Balance')) {
        return '<div style="border: 2px solid #0dcaf0; padding: 10px; border-radius: 8px; margin-bottom: 10px; display: inline-block;">' . $svg . '</div>';
    }
    return '<div style="margin-bottom: 10px;">' . $svg . '</div>';
}

$raw_reports = [
    ['type' => 'hhkloosereport', 'title' => 'HHK Loose', 'svg' => '<svg width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="#0dcaf0" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>'],
    ['type' => 'hhkkgreport', 'title' => 'HHK Balance', 'svg' => '<svg width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="#0dcaf0" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"></circle><line x1="12" y1="8" x2="12" y2="16"></line><line x1="8" y1="12" x2="16" y2="12"></line></svg>'],
    ['type' => 'gfcloosereport', 'title' => 'GFC Loose', 'svg' => '<svg width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="#0dcaf0" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path><polyline points="13 2 13 9 20 9"></polyline></svg>'],
    ['type' => 'mcreport', 'title' => 'Mc Report', 'svg' => '<svg width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="#0dcaf0" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg>'],
    ['type' => 'gfckgreport', 'title' => 'GFC Balance', 'svg' => '<svg width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="#0dcaf0" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><line x1="12" y1="2" x2="12" y2="22"></line><path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path></svg>']
];

$reports = array_map(function ($r) {
    $r['icon'] = getIcon($r['svg'], $r['title']);
    return $r;
}, $raw_reports);
?>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <title>Admin | Stock Reports</title>
    <?php $bootstrap->css(); ?>
    <style>
        .nav-card {
            transition: transform 0.2s ease, box-shadow 0.2s ease;
            border-radius: 15px;
            background: #ffffff;
            border: 2px solid #0dcaf0;
            text-decoration: none;
            color: #333;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 200px;
            padding: 15px;
        }

        .nav-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .nav-card-title {
            font-family: 'Teko', sans-serif;
            font-size: 1.5rem;
            margin-top: 10px;
        }
    </style>
</head>

<body>
    <div class="row">
        <div class="sidebarcol" id="sidebar"><?php include 'sidebar.php'; ?></div>
        <div class="contentcol">
            <?php require 'navbar.php'; ?>

            <div class="container-fluid d-flex flex-column justify-content-center" style="min-height: 80vh;">
                <?php if (empty($reportType)): ?>
                    <div class="row justify-content-center g-4 mb-4">
                        <?php foreach (array_slice($reports, 0, 3) as $r): ?>
                            <div class="col-lg-3">
                                <a href="?type=<?php echo $r['type']; ?>" class="nav-card">
                                    <?php echo $r['icon']; ?>
                                    <div class="nav-card-title"><?php echo $r['title']; ?></div>
                                </a>
                            </div>
                        <?php endforeach; ?>
                    </div>
                    <div class="row justify-content-center g-4">
                        <?php foreach (array_slice($reports, 3, 2) as $r): ?>
                            <div class="col-lg-3">
                                <a href="?type=<?php echo $r['type']; ?>" class="nav-card">
                                    <?php echo $r['icon']; ?>
                                    <div class="nav-card-title"><?php echo $r['title']; ?></div>
                                </a>
                            </div>
                        <?php endforeach; ?>
                    </div>
                <?php else: ?>
                    <div class="card">
                        <div class="card-header bg-info text-light d-flex justify-content-between">
                            <h4 class="mb-0">Report: <?php echo htmlspecialchars($reportType); ?></h4>
                            <a href="mainstockreport.php" class="btn btn-light btn-sm">Back</a>
                        </div>
                        <div class="card-body"><?php include 'stockreportpages.php'; ?></div>
                    </div>
                <?php endif; ?>
            </div>
        </div>
    </div>
    <?php $bootstrap->javascript(); ?>
</body>

</html>