<?php
require '../../vendor/autoload.php'; // Include the PHPSpreadsheet library

// Include your database connection file
require '../../Controllers/database.db.php';

// Create a new PHPExcel object
$spreadsheet = new PhpOffice\PhpSpreadsheet\Spreadsheet();
$sheet = $spreadsheet->getActiveSheet();

// Get the database name and table name from the GET parameters
if (isset($_GET['database_name']) && isset($_GET['table_name'])) {
    $databaseName = $_GET['database_name'];
    $tableName = $_GET['table_name'];

    // Define your database credentials
    $username = "your_username";
    $password = "your_password";

    // Connect to the database using PDO
    $db = new PDO("mysql:host=localhost;dbname=$databaseName", $username, $password);

    // Set up a query to select all columns from the specified table
    $query = "SELECT * FROM $tableName";

    // Execute the query
    $stmt = $db->query($query);
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Set headers
    $alphabet = range('A', 'Z');
    $alphid = 0;
    foreach ($alphabet as $letter) {
        $sheet->setCellValue($letter . '1', array_keys($data[0])[$alphid]);
        $alphid++;
    }

    // Set data
    $rowNum = 2;
    foreach ($data as $row) {
        $colNum = 0;
        foreach ($row as $value) {
            $colLetter = $alphabet[$colNum];
            $sheet->setCellValue($colLetter . $rowNum, $value);
            $colNum++;
        }
        $rowNum++;
    }

    // Save the Excel file
    $writer = PhpOffice\PhpSpreadsheet\IOFactory::createWriter($spreadsheet, 'Xlsx');
    $filename = 'ExportedData.xlsx';
    $writer->save($filename);

    // Send the file to the browser
    header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
    header("Content-Disposition: attachment; filename=$filename");
    header('Pragma: no-cache');
    header('Expires: 0');
    readfile($filename);

    exit();
} else {
    echo "Database name or table name not specified in the GET parameters.";
}
