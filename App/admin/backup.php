<?php

// Enable error reporting
error_reporting(E_ALL);
ini_set('display_errors', 1);

function copyDirectory($source, $destination)
{
  if(is_dir($source))
  {
    if(!is_dir($destination))
    {
      mkdir($destination, 0777, true);
    }

    $files = scandir($source);
    foreach ($files as $file) {
      if ($file != '.' && $file != "..") {
        $src = "$source/$file";
        $dst = "$destination/$file";

        if (is_file($src)) {
          copyDirectory($src, $dst);
        } else {
          copy($src, $dst);
        }
      }
    }
  } elseif (is_file($source)) {
    copy($source, $destination);
  }
}

// Use the CopyDirectory Function
$sourceDirectory = '../../../../mysql/data/lms';
$destinationDirectory = '../../../DatabaseBackup/lms';

copyDirectory($sourceDirectory, $destinationDirectory);

?>
