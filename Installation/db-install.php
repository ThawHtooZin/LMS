<?php

// Set the maximum execution time to a large value (0 for no limit).
set_time_limit(0);

  $file_location = 'installdb.sql';
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
  echo "<script>alert('Database Installed Successfully'); window.location.href='login.php'</script>";
