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
      <script src="../../Resources/jquery.resc.js"></script>

      <script src="../../Resources/chosenselect/jquery-1.9.3.js"></script>

      <script src="../../Resources/chosenselect/jquery-ui.js"></script>

      <script src="../../Resources/chosenselect/chosen.jquery.js"></script>

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
    <script type="text/javascript">
    setInterval(function() {
    var currentTime = new Date ( );
    var currentHours = currentTime.getHours ( );
    var currentMinutes = currentTime.getMinutes ( );
    var currentSeconds = currentTime.getSeconds ( );
    currentMinutes = ( currentMinutes < 10 ? "0" : "" ) + currentMinutes;
    currentSeconds = ( currentSeconds < 10 ? "0" : "" ) + currentSeconds;
    var timeOfDay = ( currentHours < 12 ) ? "AM" : "PM";
    currentHours = ( currentHours > 12 ) ? currentHours - 12 : currentHours;
    currentHours = ( currentHours == 0 ) ? 12 : currentHours;
    var currentTimeString = currentHours + ":" + currentMinutes + ":" + currentSeconds + " " + timeOfDay;
    document.getElementById("timer").innerHTML = currentTimeString;
    }, 100);
    </script>
      <style>
      /* Example CSS class to reset styles for the "card" element */
      .card-reset {
          /* Reset or modify styles as needed */
          /* For example: */
          padding: 0; /* Reset padding */
          margin: 0; /* Reset margin */
          /* Other style adjustments */
      }
      
      [data-bs-toggle] {
        cursor: pointer !important;
      }

      [data-bs-toggle]:hover {
        cursor: pointer !important;
      }
      *{
        font-size: 13px;
      }
      row{
        padding: 0px !important;
      }
      #content > .card > .card-header > #menu{
        display:inline !important;
      }
      #content > .card > .card-header > h4{
        display:inline !important;
      }
      #content > .card > .card-header > h5{
        display:inline !important;
      }
      #content > .card > .card-header > p{
        display:inline !important;
      }
      #content > .card > .card-header > b{
        display:inline !important;
      }

      #content > .card > .card-header > button{
        color:white;
      }
      #content > .card > .card-header > form > button{
        color:white;
      }
      #content > .card > form > .card-header> button{
        color:white;
      }
      #sidebar {
        transition: all 0.5s ease;
      }
      #content{
        transition: all 0.5s ease;
      }
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
      .arrow {
        float:right;
        border: solid white;
        border-width: 0 2px 2px 0;
        display: inline;
        margin-top:8px;
        padding: 1.8px;
      }
      .arrdown{
        transform: rotate(45deg);
        -webkit-transform: rotate(45deg);
      }
        .h:hover{
          color:  white !important;
          boder-radius: 1px !important;
          background:  rgb(22, 172, 170);
          // #ffff33
        }
        .row{
          margin: 0 !important;
          margin-left: -12px !important;
        }
        th{
          background-color: black !important;
        }
        tr.info>*{
           background-color:lightblue !important;
        }
        .inpv2{
          border: 1px solid gray !important;
        }
        .table>tbody>tr:hover>*{
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
        .modal-content{
          border-radius: 0 !important;
        }
        .modal-header{
          border-radius: 0 !important;
        }
        .sidebarcol{
          position:fixed;
          height: 100%;
          width: 16% !important;
        }

        @media screen and (min-width: 1300px){
          .contentcol{
            left: 14.5%;
            position:absolute;
            width: 85.5% !important;
          }
          .contentfullcol{
            left: 44px;
            position:absolute;
            width: 96% !important;
          }
          .sidebarnocol{
            position:fixed;
            height: 100%;
            width: 4.8% !important;
          }
        }
        @media screen and (min-width: 1400px){
          .contentcol{
            left: 14.5%;
            position:absolute;
            width: 85.5% !important;
          }
          .contentfullcol{
            left: 52px;
            position:absolute;
            width: 96% !important;
          }
          .sidebarnocol{
            position:fixed;
            height: 100%;
            width: 4.8% !important;
          }
        }
      </style>
      <script src="../../Resources/sweetalert.js" charset="utf-8"></script>
      <link rel="stylesheet" href="../../Resources/chosenselect/jquery-ui.css">
      <link rel="stylesheet" href="../../Resources/chosenselect/chosen.css">
      <script src="../../Resources/jquery.resc.js"></script>
      <script src="../../Resources/chosenselect/jquery-1.9.3.js"></script>
      <script src="../../Resources/chosenselect/jquery-ui.js"></script>
      <script src="../../Resources/chosenselect/chosen.jquery.js"></script>
      <script>
      $(function() {
        $(".chzn-select").chosen();
      });
      </script>
    ';
  }
  function javascript()
  {
    echo '

    <script src="../../Resources\bootstrap-5.3.1-dist\js\bootstrap.min.js" charset="utf-8"></script>

    <script type="text/javascript">
    // (function(e){
    //   let h3 = document.getElementsByTagName("h3");
    //   let stm = e.target.dataset.num;
    //   console.log(stm);
    // })();
    </script>

    ';
    ?>
    <script type="text/javascript">
    var myVariable = false;
    function toggleVariable() {
      myVariable = !myVariable;
      return myVariable;
    }
    $('#menu').on('click', function(){
      var newValue = toggleVariable();
      if(newValue === false){
        setTimeout(function(){
          $("#navtitle").animate({
            opacity: "show",
            padding: "show"
          }, "normal");
          $("span#navname").animate({
            opacity: "show",
            padding: "show"
          }, "normal");
          $('.arrow').show("slow");
        }, 500);
        $('#sidebar').toggleClass('sidebarcol sidebarnocol');
        $('#thenavbar').slideToggle(800);
        // $('#sidebarlink').removeAttr('disabled');
      }else{
        // $('#sidebarlink').attr('disabled', true);
        $('#sidebar').toggleClass('sidebarcol sidebarnocol', 1000);
        $("#navtitle").hide();
        $('#menu').css('height', 82, '%');
        $("span#navname").hide();
        $('.arrow').hide();
        $('#thenavbar').slideToggle(500);
      }
      $('#content').toggleClass('contentcol contentfullcol');
    });
    $('.table').removeClass('table-bordered');
    $('th').css('background-color', 'black');

    $(document).keydown(function(event) {
      // Check if Ctrl key and Enter key are pressed
      if (event.ctrlKey && event.key === 'Enter') {
        var filename = window.location.pathname.split('/').pop();;

        window.location.href="linkpage.php?filename="+filename;
      }
    });
    </script>
    <?php
  }

}


?>
