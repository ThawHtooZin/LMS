<?php
session_start();

$query = $_SERVER['QUERY_STRING'] ?? '';
header('Location: edit_journal.php' . ($query !== '' ? '?' . $query : ''));
exit;
