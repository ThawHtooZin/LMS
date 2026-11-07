<?php
session_start();
include '../../Auth/authrize.ctr.php';
include '../../Resources/resource.boot.php';

$auth = new auth();
$auth->checkadmin();

$dateValue = $_GET['date'] ?? '';
$date = is_string($dateValue) ? DateTime::createFromFormat('!Y-m-d', $dateValue) : false;
if (!$date || $date->format('Y-m-d') !== $dateValue) {
    http_response_code(400);
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode(['error' => 'A valid date is required.']);
    exit;
}

$stmt = $pdo->prepare("
    SELECT rate FROM exchange_rates
    WHERE currency_code = 'USD' AND effective_date <= ?
    ORDER BY effective_date DESC LIMIT 1
");
$stmt->execute([$date->format('Y-m-d')]);
$rate = $stmt->fetchColumn();

header('Content-Type: application/json; charset=utf-8');
echo json_encode(['rate' => $rate === false ? null : $rate]);
