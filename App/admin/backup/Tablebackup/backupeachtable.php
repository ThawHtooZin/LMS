<?php

// MySQL database connection parameters
$host = 'localhost';
$user = 'root';
$pass = '';
$db = 'lms';

// Specify the table to backup
$tableToBackup = $_GET['tablename'];

// Create a backup file with a timestamp
$backupFile = 'backup_' . date('Y-m-d_H-i-s') . '_' . $tableToBackup . '.sql';

// Connect to MySQL
$mysqli = new mysqli($host, $user, $pass, $db);

// Check connection
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

// Perform a MySQL dump and save it to the backup file
$result = $mysqli->query("SHOW CREATE TABLE $tableToBackup");
$tableStructure = $result->fetch_row()[1];

// Open the backup file for writing
$fileHandle = fopen($backupFile, 'w');

// Write table structure to the file
fwrite($fileHandle, "-- Table structure for table `$tableToBackup`\n");
fwrite($fileHandle, "$tableStructure;\n");

// Export table data
$result = $mysqli->query("SELECT * FROM $tableToBackup");
$rows = $result->fetch_all(MYSQLI_ASSOC);

if (!empty($rows)) {
    fwrite($fileHandle, "\n-- Data for table `$tableToBackup`\n");
    foreach ($rows as $row) {
        $rowValues = implode("', '", array_map('addslashes', $row));
        fwrite($fileHandle, "INSERT INTO $tableToBackup VALUES ('$rowValues');\n");
    }
}

// Close the file and MySQL connection
fclose($fileHandle);
$mysqli->close();

header('location: ../../../backupandrestore.php');

?>