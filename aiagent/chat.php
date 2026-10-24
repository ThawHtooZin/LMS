<?php

require_once __DIR__ . '/backend.php';

if (($_SERVER['REQUEST_METHOD'] ?? '') !== 'POST') {
    aiagent_json(['error' => 'Method not allowed.'], 405);
}

aiagent_chat(aiagent_read_json());
