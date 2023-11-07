<?php

$filename = $_GET['filename'];

if ($filename == '') {
  echo "
  <script>window.location.href='/LMS/App/admin/';</script>
  ";
}else{
  echo "
  <script>window.location.href='{$filename}';</script>
  ";
}

 ?>
