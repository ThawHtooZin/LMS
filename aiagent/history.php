<?php

require_once __DIR__ . '/backend.php';
aiagent_require_login();

$path = (string)($_GET['path'] ?? '/chats');
$method = $_SERVER['REQUEST_METHOD'] ?? 'GET';
if (!preg_match('#^/chats(?:/([0-9]+))?$#', $path, $match)) {
    aiagent_json(['error' => 'Unknown history path'], 400);
}

if ($method === 'POST' && $path === '/chats') {
    try {
        $record = aiagent_create_record();
    } catch (Throwable $exception) {
        aiagent_json(['error' => $exception->getMessage()], 500);
    }
    aiagent_json([
        'number' => $record['number'],
        'title' => $record['title'],
        'updated' => $record['updated'],
        'turns' => [],
    ]);
}

if ($method !== 'GET') {
    aiagent_json(['error' => 'Method not allowed.'], 405);
}

try {
    if ($path === '/chats') {
        aiagent_json(['chats' => aiagent_chat_summaries()]);
    }
    $record = aiagent_read_record((int)$match[1]);
    if ($record === null) {
        aiagent_json(['error' => 'That chat does not exist.'], 404);
    }
    aiagent_json($record);
} catch (Throwable $exception) {
    aiagent_json(['error' => $exception->getMessage()], 500);
}
