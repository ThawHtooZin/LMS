<?php
session_start();
header('Content-Type: application/json');

include '../../Auth/authrize.ctr.php';
include '../../Controllers/query.ctr.php';

$auth = new auth();
$auth->checkadmin();

// Ensure POST request
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['success' => false, 'message' => 'Invalid request method.']);
    exit;
}

// Database Credentials
$host   = '127.0.0.1';
$user   = 'root';
$pass   = ''; 
$dbname = 'lms';

// Establish PDO Connection
try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $user, $pass, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]);
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Database connection failed.']);
    exit;
}

// Extract Session & Inputs
$inputPassword = $_POST['admin_password'] ?? '';
$adminId       = $_SESSION['admin_id'] ?? $_SESSION['user_id'] ?? $_SESSION['id'] ?? null;
$adminEmail    = $_SESSION['email'] ?? null;
$adminUsername = $_SESSION['username'] ?? $_SESSION['user'] ?? null;

if (empty($inputPassword)) {
    echo json_encode(['success' => false, 'message' => 'Please enter your password.']);
    exit;
}

// Validate Admin Password
$adminAccount = null;
if ($adminId) {
    $stmt = $pdo->prepare("SELECT * FROM accounts WHERE id = ? LIMIT 1");
    $stmt->execute([$adminId]);
    $adminAccount = $stmt->fetch();
} elseif ($adminEmail) {
    $stmt = $pdo->prepare("SELECT * FROM accounts WHERE email = ? LIMIT 1");
    $stmt->execute([$adminEmail]);
    $adminAccount = $stmt->fetch();
} elseif ($adminUsername) {
    $stmt = $pdo->prepare("SELECT * FROM accounts WHERE username = ? LIMIT 1");
    $stmt->execute([$adminUsername]);
    $adminAccount = $stmt->fetch();
}

if (!$adminAccount || $adminAccount['password'] !== $inputPassword) {
    echo json_encode(['success' => false, 'message' => 'Authentication failed: Incorrect admin password.']);
    exit;
}

// STEP 1: If JavaScript only checks authentication, stop here and return success
if (isset($_POST['check_auth_only'])) {
    echo json_encode(['success' => true]);
    exit;
}

// STEP 2: Execute Restore
if (isset($_POST['execute_restore'])) {
    if (!isset($_FILES['sql_file']) || $_FILES['sql_file']['error'] !== UPLOAD_ERR_OK) {
        echo json_encode(['success' => false, 'msg' => 'upload_failed']);
        exit;
    }

    $uploadedFile = $_FILES['sql_file']['tmp_name'];
    $fileExtension = strtolower(pathinfo($_FILES['sql_file']['name'], PATHINFO_EXTENSION));

    if ($fileExtension !== 'sql') {
        echo json_encode(['success' => false, 'msg' => 'invalid_file_type']);
        exit;
    }

    try {
        $sqlContent = file_get_contents($uploadedFile);
        $pdo->exec("SET FOREIGN_KEY_CHECKS = 0;");
        $pdo->exec($sqlContent);
        $pdo->exec("SET FOREIGN_KEY_CHECKS = 1;");

        echo json_encode(['success' => true]);
        exit;
    } catch (PDOException $e) {
        error_log("Restore Error: " . $e->getMessage());
        echo json_encode(['success' => false, 'msg' => 'restore_failed']);
        exit;
    }
}