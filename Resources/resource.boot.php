<?php

class Bootstrap
{
  function cssindex()
  {
    echo '
      <link rel="stylesheet" href="Resources\bootstrap-5.3.1-dist\css\bootstrap.css">
      <!-- Font Awesome -->
      <link rel="stylesheet" href="Resources/plugins/fontawesome-free/css/all.min.css">
      <!-- icheck bootstrap -->
      <link rel="stylesheet" href="Resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
      <!-- Theme style -->
      <link rel="stylesheet" href="Resources/dist/css/adminlte.min.css">
    ';
  }
  function javascriptindex()
  {
    echo '
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
      <script src="Resources/bootstrap-5.3.1-dist/js/bootstrap.min.js" charset="utf-8"></script>
      <!-- jQuery -->
      <script src="Resources/plugins/jquery/jquery.min.js"></script>
      <!-- Bootstrap 4 -->
      <script src="Resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
      <!-- AdminLTE App -->
      <script src="Resources/dist/js/adminlte.min.js"></script>
    ';
  }
  function cssprint()
  {
    echo '
      <link rel="stylesheet" href="../../../Resources\bootstrap-5.3.1-dist\css\bootstrap.css">
    ';
  }
  function javascriptprint()
  {
    echo '
      <script src="../../../Resources/bootstrap-5.3.1-dist/js/bootstrap.min.js" charset="utf-8"></script>
    ';
  }
  function css()
  {
    echo '
      <link rel="stylesheet" href="../../Resources\bootstrap-5.3.1-dist\css\bootstrap.min.css">
      <style>
      ::-webkit-scrollbar {
        width: 10px;
      }
      ::-webkit-scrollbar-track {
        box-shadow: inset 0 0 5px grey !important;
        border-radius: 10px !important;
      }
      ::-webkit-scrollbar-thumb {
        background:rgba(0,0,0,0.3) !important;
        border-radius: 5px !important;
      }
        .h:hover{
          color:  black !important;
          background:  rgb(254, 254, 51, 0.9);
          // #ffff33
        }
        .row{
          margin: 0 !important;
          margin-left: -12px !important;
        }
        th{
          background-color: #D9D9D9 !important;
        }
        tr.info>*{
           background-color:lightblue !important;
        }
        .inpv2{
          border: 1px solid gray !important;
        }
        .table-hover>tbody>tr:hover>*{
          background-color: rgb(0,0,0,0.1) !important;
          color:black;
        }
        label{
          font-weight: bold;
        }
        .hide{
          display:none;
        }
        .color{
          border-radius: 5px;
          background-color:grey;
          color:white !important;
        }
        .table>tbody>tr>*{
          background-color: transparent !important;
        }
        .col-2{
          width: 16%;
        }
        .col-10{
          width: 84%;
        }
        .modal-content{
          border-radius: 0 !important;
        }
        .modal-header{
          border-radius: 0 !important;
        }
      </style>
      <script src="../../Resources/sweetalert.js" charset="utf-8"></script>
      <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.4.2/chosen.css">
      <script src="../../Resources/jquery.resc.js"></script>
    ';
  }
  function javascript()
  {
    echo '

    <script src="../../Resources\bootstrap-5.3.1-dist\js\bootstrap.bundle.min.js" charset="utf-8"></script>
    <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
    <script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.4.2/chosen.jquery.js"></script>

    <script type="text/javascript">
    $(function() {
      $(".chzn-select").chosen();
    });

    // (function(e){
    //   let h3 = document.getElementsByTagName("h3");
    //   let stm = e.target.dataset.num;
    //   console.log(stm);
    // })();
    </script>
    ';
  }

}


?>
