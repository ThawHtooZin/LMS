<?php

ini_set('session.gc_maxlifetime', '10800');
session_set_cookie_params(10800, '/');
session_start();

header('Content-Type: application/json; charset=utf-8');

if (empty($_SESSION['username']) || empty($_SESSION['logged_in']) || empty($_SESSION['role'])) {
    http_response_code(401);
    echo json_encode(['error' => 'Login required']);
    exit;
}

$username = str_replace(["\r", "\n"], '', (string)$_SESSION['username']);
session_write_close();

$path = $_GET['path'] ?? '/chats';
if (!preg_match('#^/chats(?:/[0-9]+)?$#', $path)) {
    http_response_code(400);
    echo json_encode(['error' => 'Unknown history path']);
    exit;
}

$method = ($_SERVER['REQUEST_METHOD'] ?? 'GET') === 'POST' ? 'POST' : 'GET';
$cookie = $_SERVER['HTTP_COOKIE'] ?? '';
$context = stream_context_create([
    'http' => [
        'method' => $method,
        'header' => "Content-Type: application/json\r\nCookie: {$cookie}\r\nX-LMS-User: {$username}\r\n",
        'content' => $method === 'POST' ? '{}' : '',
        'timeout' => 30,
        'ignore_errors' => true,
    ],
]);

$response = @file_get_contents('http://127.0.0.1:8765' . $path, false, $context);
if ($response === false) {
    http_response_code(503);
    echo json_encode(['error' => 'The report agent is not running. Start aiagent/start.bat, then try again.']);
    exit;
}

$status = 200;
if (isset($http_response_header[0]) && preg_match('/\s(\d{3})\s/', $http_response_header[0], $match)) {
    $status = (int)$match[1];
}
http_response_code($status);
echo $response;
