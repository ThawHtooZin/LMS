<?php

ini_set('session.gc_maxlifetime', '10800');
session_set_cookie_params(10800, '/');
session_start();

if (empty($_SESSION['username']) || empty($_SESSION['logged_in']) || empty($_SESSION['role'])) {
    http_response_code(401);
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode(['error' => 'Login required']);
    exit;
}

$username = str_replace(["\r", "\n"], '', (string)$_SESSION['username']);
session_write_close();

$body = file_get_contents('php://input');
$cookie = $_SERVER['HTTP_COOKIE'] ?? '';
$context = stream_context_create([
    'http' => [
        'method' => 'POST',
        'header' => "Content-Type: application/json\r\nCookie: {$cookie}\r\nX-LMS-User: {$username}\r\n",
        'content' => $body,
        'timeout' => 180,
        'ignore_errors' => true,
    ],
]);

$response = @file_get_contents('http://127.0.0.1:8765/export', false, $context);
if ($response === false) {
    http_response_code(503);
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode(['error' => 'The report agent is not running. Start aiagent/start.bat.']);
    exit;
}

$status = 200;
$contentType = 'application/octet-stream';
$disposition = 'attachment';
foreach ($http_response_header as $header) {
    if (preg_match('/^HTTP\/\S+\s(\d{3})/', $header, $match)) {
        $status = (int)$match[1];
    } elseif (stripos($header, 'Content-Type:') === 0) {
        $contentType = trim(substr($header, 13));
    } elseif (stripos($header, 'Content-Disposition:') === 0) {
        $disposition = trim(substr($header, 20));
    }
}

http_response_code($status);
header('Content-Type: ' . $contentType);
header('Content-Disposition: ' . $disposition);
echo $response;
