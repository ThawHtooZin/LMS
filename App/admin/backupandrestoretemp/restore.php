<?php

// Set the maximum execution time to a large value (0 for no limit).
set_time_limit(0);

$file_location = 'installdb.sql';
$connection = mysqli_connect('localhost', 'root', '', 'lms');

if ($_FILES['file']['name'] == 'installdb.sql' && !empty($connection)) {
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
  echo '<script>alert("Installed Successfully!"); window.location.href="../Login.php";</script>';
} else {
  echo '<script>alert("Error Happened When Creating Table!"); window.location.href="../index.htm";</script>';
}
