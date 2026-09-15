<?php
// function copyDirectory($source, $destination)
// {

//    if (!is_dir($destination)) {
//       mkdir($destination . '/lms', 0755, true);
//    }

//    $files = scandir($source);
//    foreach ($files as $file) {
//       if ($file !== '.' && $file !== '..') {
//          $sourceFile = $source . '/' . $file;
//          $destinationFile = $destination . '/' . $file;
//          if (is_dir($sourceFile)) {
//             copyDirectory($sourceFile, $destinationFile);
//          } else {
//             copy($sourceFile, $destinationFile);
//          }
//       }
//    }
// }
// $sourceDirectory = __DIR__ . '/../../../../mysql/data/lms';
// $destinationDirectory = __DIR__ . '/../../../../DataBackup/lms';
// copyDirectory($sourceDirectory, $destinationDirectory);
// header('location:backupandrestore.php?status=success');

session_start();
include '../../Auth/authrize.ctr.php';
$auth = new auth();
$auth->checkadmin();

// Database Credentials
$host   = '127.0.0.1';
$user   = 'root';
$pass   = ''; // Set your MySQL password if configured
$dbname = 'lms';

// 1. Target directory: C:\xampp\htdocs\LMS\App\admin\backup\db_backups\
$backupDir = __DIR__ . '/backup/db_backups/';
if (!file_exists($backupDir)) {
    mkdir($backupDir, 0755, true);
}

// Security: Prevent direct URL access to raw SQL files
$htaccessFile = $backupDir . '.htaccess';
if (!file_exists($htaccessFile)) {
    file_put_contents($htaccessFile, "Deny from all");
}

// 2. Dynamic binary locator for cross-PC compatibility
function getMysqldumpPath() {
    if (strtoupper(substr(PHP_OS, 0, 3)) === 'WIN') {
        $testPath = shell_exec('where mysqldump');
        if (!empty($testPath) && strpos($testPath, 'Could not find') === false) {
            return 'mysqldump';
        }
        $commonPaths = [
            'C:\xampp\mysql\bin\mysqldump.exe',
            'C:\wamp64\bin\mysql\mysql' . PHP_VERSION . '\bin\mysqldump.exe',
            'C:\laragon\bin\mysql\current\bin\mysqldump.exe'
        ];
        foreach ($commonPaths as $path) {
            if (file_exists($path)) return '"' . $path . '"';
        }
    } else {
        $testPath = shell_exec('which mysqldump');
        if (!empty(trim($testPath))) return trim($testPath);
    }
    return 'mysqldump';
}

$dumpBinary   = getMysqldumpPath();
$fileName     = $dbname . '_backup_' . date('Y-m-d_H-i-s') . '.sql';
$fullSavePath = $backupDir . $fileName;

// 3. Dump database directly into C:\xampp\htdocs\LMS\App\admin\backup\db_backups\
$command = sprintf(
    '%s --host=%s --user=%s %s --default-character-set=utf8 --single-transaction --quick %s > %s',
    $dumpBinary,
    escapeshellarg($host),
    escapeshellarg($user),
    !empty($pass) ? '--password=' . escapeshellarg($pass) : '',
    escapeshellarg($dbname),
    escapeshellarg($fullSavePath)
);

$output = [];
$returnVar = 0;
exec($command . ' 2>&1', $output, $returnVar);

// 4. Verify local file creation, then stream to user browser
if ($returnVar === 0 && file_exists($fullSavePath) && filesize($fullSavePath) > 0) {
    
    // Trigger browser file download
    header('Content-Description: File Transfer');
    header('Content-Type: application/octet-stream');
    header('Content-Disposition: attachment; filename="' . basename($fullSavePath) . '"');
    header('Content-Length: ' . filesize($fullSavePath));
    header('Pragma: public');
    header('Expires: 0');
    header('Cache-Control: must-revalidate, post-check=0, pre-check=0');

    ob_clean();
    flush();
    readfile($fullSavePath);
    exit;

} else {
    // Clean up partial file on failure
    if (file_exists($fullSavePath)) {
        unlink($fullSavePath);
    }
    error_log("Backup Error: " . implode("\n", $output));
    header('Location: backupandrestore.php?status=error');
    exit;
}