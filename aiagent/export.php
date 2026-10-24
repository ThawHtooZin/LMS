<?php

require_once __DIR__ . '/backend.php';
aiagent_require_login();

if (($_SERVER['REQUEST_METHOD'] ?? '') !== 'POST') {
    aiagent_json(['error' => 'Method not allowed.'], 405);
}

$body = aiagent_read_json();
$table = aiagent_export_table((string)($body['table_id'] ?? ''), (int)($body['chat_id'] ?? 0));
if ($table === null) {
    aiagent_json(['error' => 'That table is no longer available. Ask for the report again.'], 404);
}

try {
    if (($body['format'] ?? '') === 'xlsx') {
        $content = aiagent_build_xlsx($table);
        $mime = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
        $filename = 'report.xlsx';
    } elseif (($body['format'] ?? '') === 'pdf') {
        $content = aiagent_build_pdf($table);
        $mime = 'application/pdf';
        $filename = 'report.pdf';
    } else {
        aiagent_json(['error' => 'Use xlsx or pdf.'], 400);
    }
} catch (Throwable $exception) {
    aiagent_json(['error' => $exception->getMessage()], 500);
}

header('Content-Type: ' . $mime);
header('Content-Disposition: attachment; filename="' . $filename . '"');
header('Content-Length: ' . strlen($content));
echo $content;
