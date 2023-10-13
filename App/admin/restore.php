<?php

// Set the maximum execution time to a large value (0 for no limit).
set_time_limit(0);

$file_location = $_FILES['file']['tmp_name'];
if ($_FILES['file']['name'] == 'lms.sql') {
  $conn = mysqli_connect('localhost', 'root', '');
  mysqli_query($conn, "CREATE DATABASE lms");

  $connection = mysqli_connect('localhost', 'root', '', 'lms');
  $filename = $file_location;
  $handle = fopen($filename, "r+");
  $contents = fread($handle, filesize($filename));
  $sql = explode(';', $contents);
  foreach ($sql as $query) {
    $result = mysqli_query($connection, $query);
  }
  fclose($handle);
  echo '<script>alert("Successfully imported!"); window.location.href="backupandrestore.php";</script>';
} else {
  echo '<script>alert("Wrong Database File. Note: Your restore file name and extension must be lms.sql!"); window.location.href="backupandrestore.php";</script>';
}
