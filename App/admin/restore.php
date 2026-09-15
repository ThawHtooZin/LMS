<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();

// Ensure script is accessed via POST request
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Location: backupandrestore.php');
    exit;
}

// Database Credentials
$host   = '127.0.0.1';
$user   = 'root';
$pass   = ''; 
$dbname = 'lms';

// 1. Password Verification Check
$inputPassword = $_POST['admin_password'] ?? '';

if (empty($inputPassword)) {
    header('Location: backupandrestore.php?status=error&msg=missing_credentials');
    exit;
}

// Extract session identifiers dynamically
$adminId       = $_SESSION['admin_id'] ?? $_SESSION['user_id'] ?? $_SESSION['id'] ?? null;
$adminEmail    = $_SESSION['email'] ?? null;
$adminUsername = $_SESSION['username'] ?? $_SESSION['user'] ?? null;

$adminAccount = null;

// Query the 'accounts' table
if ($adminId) {
    $stmt = $pdo->prepare("SELECT * FROM accounts WHERE id = ? LIMIT 1");
    $stmt->execute([$adminId]);
    $adminAccount = $stmt->fetch(PDO::FETCH_ASSOC);
} elseif ($adminEmail) {
    $stmt = $pdo->prepare("SELECT * FROM accounts WHERE email = ? LIMIT 1");
    $stmt->execute([$adminEmail]);
    $adminAccount = $stmt->fetch(PDO::FETCH_ASSOC);
} elseif ($adminUsername) {
    $stmt = $pdo->prepare("SELECT * FROM accounts WHERE username = ? LIMIT 1");
    $stmt->execute([$adminUsername]);
    $adminAccount = $stmt->fetch(PDO::FETCH_ASSOC);
}

// Verify password against plain-text entry in 'accounts'
$passwordValid = false;
if ($adminAccount && isset($adminAccount['password'])) {
    if ($adminAccount['password'] === $inputPassword) {
        $passwordValid = true;
    }
}

if (!$passwordValid) {
    header('Location: backupandrestore.php?status=error&msg=invalid_password');
    exit;
}

// 2. Validate Uploaded File
if (!isset($_FILES['sql_file']) || $_FILES['sql_file']['error'] !== UPLOAD_ERR_OK) {
    header('Location: backupandrestore.php?status=error&msg=upload_failed');
    exit;
}

$uploadedFile  = $_FILES['sql_file']['tmp_name'];
$fileName      = $_FILES['sql_file']['name'];
$fileExtension = strtolower(pathinfo($fileName, PATHINFO_EXTENSION));

if ($fileExtension !== 'sql') {
    header('Location: backupandrestore.php?status=error&msg=invalid_file_type');
    exit;
}

// 3. Dynamic binary locator for mysql executable
function getMysqlPath() {
    if (strtoupper(substr(PHP_OS, 0, 3)) === 'WIN') {
        $testPath = shell_exec('where mysql');
        if (!empty($testPath) && strpos($testPath, 'Could not find') === false) {
            return 'mysql';
        }
        $commonPaths = [
            'C:\xampp\mysql\bin\mysql.exe',
            'C:\wamp64\bin\mysql\mysql' . PHP_VERSION . '\bin\mysql.exe',
            'C:\laragon\bin\mysql\current\bin\mysql.exe'
        ];
        foreach ($commonPaths as $path) {
            if (file_exists($path)) return '"' . $path . '"';
        }
    } else {
        $testPath = shell_exec('which mysql');
        if (!empty(trim($testPath))) return trim($testPath);
    }
    return 'mysql';
}

$mysqlBinary = getMysqlPath();

// 4. Build and execute SQL restoration command
$command = sprintf(
    '%s --host=%s --user=%s %s --default-character-set=utf8 %s < %s',
    $mysqlBinary,
    escapeshellarg($host),
    escapeshellarg($user),
    !empty($pass) ? '--password=' . escapeshellarg($pass) : '',
    escapeshellarg($dbname),
    escapeshellarg($uploadedFile)
);

$output = [];
$returnVar = 0;
exec($command . ' 2>&1', $output, $returnVar);

// 5. Verification & Redirect
if ($returnVar === 0) {
    header('Location: backupandrestore.php?status=success');
    exit;
} else {
    error_log("Restore Error: " . implode("\n", $output));
    header('Location: backupandrestore.php?status=error&msg=restore_failed');
    exit;
}