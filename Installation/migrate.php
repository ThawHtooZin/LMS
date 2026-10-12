<?php
/**
 * Apply pending structure files, then pending seeders.
 *
 *   php Installation/migrate.php
 *   php Installation/migrate.php --status
 *   php Installation/migrate.php --stamp
 *   php Installation/migrate.php --fresh --yes
 *
 * A file is applied once. Its name is stored in the `migrations` table.
 * Add another .sql file under Installation/database/seeders (or migrations)
 * and run this again. Already recorded files are skipped.
 *
 * --stamp   Record the current files as applied without executing them.
 *           Use this on the live database that already matches the 2026-10-12 dump.
 * --fresh   Drop and recreate the database, then run every file. Requires --yes.
 */

if (PHP_SAPI !== 'cli') {
    http_response_code(403);
    echo "Run from the command line: php Installation/migrate.php\n";
    exit(1);
}

$host = '127.0.0.1';
$user = 'root';
$pass = '';
$dbName = 'lms';

$stamp = in_array('--stamp', $argv, true);
$fresh = in_array('--fresh', $argv, true);
$yes = in_array('--yes', $argv, true);
$statusOnly = in_array('--status', $argv, true);

if ($fresh && !$yes) {
    fwrite(STDERR, "Refusing to drop the database. Re-run with: php Installation/migrate.php --fresh --yes\n");
    exit(1);
}
if ($fresh && $stamp) {
    fwrite(STDERR, "Use either --fresh or --stamp, not both.\n");
    exit(1);
}

$root = __DIR__ . DIRECTORY_SEPARATOR . 'database';
$migrationFiles = listSql($root . DIRECTORY_SEPARATOR . 'migrations');
$seederFiles = listSql($root . DIRECTORY_SEPARATOR . 'seeders');

if ($migrationFiles === []) {
    fwrite(STDERR, "No migration files in Installation/database/migrations.\n");
    exit(1);
}

mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

try {
    try {
        $server = new mysqli($host, $user, $pass, '', 3306);
    } catch (mysqli_sql_exception $e) {
        fwrite(STDERR, "Could not connect to MySQL at {$host} as {$user}. Start MySQL in XAMPP, then run this again.\n");
        exit(1);
    }
    $server->set_charset('utf8mb4');

    if ($fresh) {
        echo "Dropping and recreating `{$dbName}`.\n";
        $server->query("DROP DATABASE IF EXISTS `{$dbName}`");
    }
    $server->query(
        "CREATE DATABASE IF NOT EXISTS `{$dbName}` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci"
    );
    $server->select_db($dbName);
    ensureMigrationsTable($server);

    $applied = appliedNames($server);
    $pendingMigrations = pending($migrationFiles, $applied);
    $pendingSeeders = pending($seederFiles, $applied);

    if ($statusOnly) {
        printStatus($migrationFiles, $seederFiles, $applied);
        exit(0);
    }

    $hasAppTables = databaseHasAppTables($server);
    $baselinePending = false;
    foreach ($pendingMigrations as $file) {
        if (str_contains(basename($file), 'baseline_structure')) {
            $baselinePending = true;
        }
    }

    if ($baselinePending && $hasAppTables && !$fresh && !$stamp) {
        fwrite(STDERR, "Database `{$dbName}` already has tables, and the baseline structure has not been recorded.\n");
        fwrite(STDERR, "Nothing was changed.\n");
        fwrite(STDERR, "  Live database that already matches this dump: php Installation/migrate.php --stamp\n");
        fwrite(STDERR, "  Empty install that should be rebuilt:          php Installation/migrate.php --fresh --yes\n");
        exit(1);
    }

    if ($pendingMigrations === [] && $pendingSeeders === []) {
        echo "Nothing pending.\n";
        exit(0);
    }

    $batch = nextBatch($server);

    foreach ($pendingMigrations as $file) {
        runFile($server, $file, $batch, $stamp);
    }
    foreach ($pendingSeeders as $file) {
        runFile($server, $file, $batch, $stamp);
    }

    $verb = $stamp ? 'Stamped' : 'Applied';
    echo $verb . ' ' . (count($pendingMigrations) + count($pendingSeeders)) . " file(s) in batch {$batch}.\n";
} catch (Throwable $e) {
    fwrite(STDERR, "Migration failed: " . $e->getMessage() . "\n");
    exit(1);
}

function listSql(string $dir): array
{
    if (!is_dir($dir)) {
        return [];
    }
    $files = glob($dir . DIRECTORY_SEPARATOR . '*.sql') ?: [];
    $files = array_values(array_filter($files, function ($file) {
        $base = basename($file);
        return $base[0] !== '_' && $base[0] !== '.';
    }));
    sort($files, SORT_STRING);
    return $files;
}

function ensureMigrationsTable(mysqli $db): void
{
    $db->query(
        "CREATE TABLE IF NOT EXISTS `migrations` (
            `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
            `migration` varchar(255) NOT NULL,
            `batch` int(11) NOT NULL,
            PRIMARY KEY (`id`)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci"
    );
}

function appliedNames(mysqli $db): array
{
    $names = [];
    $result = $db->query("SELECT `migration` FROM `migrations`");
    while ($row = $result->fetch_assoc()) {
        $names[$row['migration']] = true;
    }
    $result->free();
    return $names;
}

function pending(array $files, array $applied): array
{
    $pending = [];
    foreach ($files as $file) {
        $name = pathinfo($file, PATHINFO_FILENAME);
        if (!isset($applied[$name])) {
            $pending[] = $file;
        }
    }
    return $pending;
}

function nextBatch(mysqli $db): int
{
    $result = $db->query("SELECT COALESCE(MAX(`batch`), 0) + 1 AS next_batch FROM `migrations`");
    $row = $result->fetch_assoc();
    $result->free();
    return (int) $row['next_batch'];
}

function databaseHasAppTables(mysqli $db): bool
{
    $result = $db->query("SHOW TABLES");
    $count = 0;
    while ($row = $result->fetch_row()) {
        if ($row[0] !== 'migrations') {
            $count++;
        }
    }
    $result->free();
    return $count > 0;
}

function runFile(mysqli $db, string $file, int $batch, bool $stamp): void
{
    $name = pathinfo($file, PATHINFO_FILENAME);
    echo ($stamp ? 'stamp ' : 'run   ') . $name . "\n";

    if (!$stamp) {
        $sql = file_get_contents($file);
        if ($sql === false) {
            throw new RuntimeException("Could not read {$file}");
        }
        if (!$db->multi_query($sql)) {
            throw new RuntimeException(basename($file) . ': ' . $db->error);
        }
        do {
            if ($result = $db->store_result()) {
                $result->free();
            }
            if ($db->errno) {
                throw new RuntimeException(basename($file) . ': ' . $db->error);
            }
        } while ($db->more_results() && $db->next_result());
        if ($db->errno) {
            throw new RuntimeException(basename($file) . ': ' . $db->error);
        }
    }

    $stmt = $db->prepare("INSERT INTO `migrations` (`migration`, `batch`) VALUES (?, ?)");
    $stmt->bind_param('si', $name, $batch);
    $stmt->execute();
    $stmt->close();
}

function printStatus(array $migrationFiles, array $seederFiles, array $applied): void
{
    echo "Migrations\n";
    foreach ($migrationFiles as $file) {
        $name = pathinfo($file, PATHINFO_FILENAME);
        echo (isset($applied[$name]) ? '  applied  ' : '  pending  ') . $name . "\n";
    }
    echo "Seeders\n";
    foreach ($seederFiles as $file) {
        $name = pathinfo($file, PATHINFO_FILENAME);
        echo (isset($applied[$name]) ? '  applied  ' : '  pending  ') . $name . "\n";
    }
}
