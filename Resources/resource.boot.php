<?php

class Bootstrap
{
  function cssindex()
  {
    echo '
      <link rel="stylesheet" href="Resources\bootstrap-5.3.1-dist\css\bootstrap.css">
    ';
  }
  function javascriptindex()
  {
    echo '
      <script src="Resources/bootstrap-5.3.1-dist/js/bootstrap.min.js" charset="utf-8"></script>
    ';
  }
  function css()
  {
    echo '
      <link rel="stylesheet" href="../../Resources\bootstrap-5.3.1-dist\css\bootstrap.css">
      <style>
        .h:hover{
          color:  black !important;
          background:  rgb(254, 254, 51, 0.9);
          // #ffff33
        }
        .row{
          margin: 0 !important;
          margin-left: -12px !important;
        }
      </style>
    ';
  }
  function javascript()
  {
    echo '
      <script src="../../Resources\bootstrap-5.3.1-dist\js\bootstrap.bundle.min.js" charset="utf-8"></script>
    ';
  }
}


?>
