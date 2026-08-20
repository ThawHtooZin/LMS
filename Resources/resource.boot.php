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
    <style>
  .modal-body {
    overflow: visible !important;
  }
  .modal .chosen-container {
    width: 100% !important;
  }
  .modal .chosen-container .chosen-drop {
    z-index: 99999 !important;
  }
    :root {
      --primary-color: #2D4CCF;
      --background-color: #F8F9FC;
      --text-muted-color: #7B809A;
      --accent-color: #B2C3F9;
    }

    body {
      background-color: var(--background-color);
      color: #333;
    }

    #content {
      // padding: 30px;
    }

    /* Welcome Card Styling */
    .welcome-card {
      background-color: var(--primary-color);
      color: white;
      border-radius: 15px;
      padding: 60px 50px;
      position: relative;
      overflow: hidden;
    }

    .welcome-card .card-title {
      font-size: 2.5rem;
      font-weight: bold;
    }

    .welcome-card .card-subtitle {
      color: rgba(255, 255, 255, 0.8);
      font-size: 1rem;
      max-width: 60%;
    }

    .shield-icon {
      position: absolute;
      right: 50px;
      top: 50%;
      transform: translateY(-50%);
      font-size: 150px;
      color: rgba(255, 255, 255, 0.15);
    }

    /* Summary Card Styling */
    .info-card {
      border: none;
      border-radius: 15px;
      padding: 40px 20px;
      box-shadow: 0 5px 25px rgba(0, 0, 0, 0.03);
    }

    .info-icon-wrapper {
      background-color: #E8EDFB;
      width: 80px;
      height: 80px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      margin: 0 auto 25px auto;
    }

    .info-icon {
      font-size: 30px;
      color: var(--primary-color);
    }

    .card-label {
      color: var(--text-muted-color);
      font-weight: 600;
      text-transform: uppercase;
      font-size: 0.8rem;
      margin-bottom: 5px;
    }

    .card-value {
      font-size: 1.8rem;
      font-weight: bold;
      color: #111;
      margin-bottom: 3px;
    }

    .card-sub-value {
      color: var(--text-muted-color);
      font-size: 0.9rem;
    }

    /* Badge Styling */
    .badge-connected {
      background-color: #E6EDFB;
      color: var(--primary-color);
      padding: 8px 15px;
      border-radius: 20px;
      font-weight: 600;
      font-size: 0.8rem;
      display: inline-flex;
      align-items: center;
    }

    .badge-connected .dot {
      width: 8px;
      height: 8px;
      background-color: var(--primary-color);
      border-radius: 50%;
      margin-right: 8px;
    }

    /* Footer Divider & Icons Styling */
    .status-summary-header {
      margin-top: 50px;
      margin-bottom: 30px;
      position: relative;
    }

    .status-summary-header span {
      background-color: var(--background-color);
      padding: 0 15px;
      color: var(--text-muted-color);
      font-size: 0.8rem;
      text-transform: uppercase;
      font-weight: 600;
    }

    .status-summary-header .line {
      height: 1px;
      background-color: #ddd;
      width: 100%;
      position: absolute;
      top: 50%;
      z-index: -1;
    }

    .status-footer-icon {
      color: var(--accent-color);
      font-size: 1.2rem;
      margin-right: 10px;
    }

    .status-text {
      color: #a0a0a0;
      font-size: 0.9rem;
      vertical-align: middle;
    }
</style>
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
    // document.getElementById("timer").innerHTML = currentTimeString;
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

        .card-header b{
          font-size: 19px !important;
        }

        table tr:has(th) {
          background: green !important;
        }

        th {
          color: white !important;
          border-right: 2px solid white !important;
        }

        [data-bs-toggle] {
          cursor: pointer !important;
        }

        [data-bs-toggle]:hover {
          cursor: pointer !important;
        }
        .nav-link{
          font-weight: bold !important;
          color: #ababab !important;
        }
        .sub-menu{
          padding-left: 30px;
        }
        /* Sidebar Hover State */
        .nav-link.h:hover {
          background-color: rgba(255, 255, 255, 0.15) !important;
          color: #fff !important;
          border-radius: 4px;
        }

        /* Submenu Active State (Discreet highlight) */
        .btn-toggle-nav .nav-link.active {
          background-color: rgba(255, 255, 255, 0.25) !important;
          color: #fff !important;
          font-weight: 600;
          border-left: 3px solid #0d6efd; /* Accent line on active sub-link */
          border-radius: 0 4px 4px 0;
        }

        /* Main Menu Active State */
        #sidebarlink.active {
          background-color: #0d6efd !important; /* Primary active background */
          color: #fff !important;
          border-radius: 4px;
        }

        .sidebarcol{
          width: 19% !important;
          z-index: 9999;
        }
        .contentcol{
            position: absolute;
            left: 17.3% !important;
            width: 82.5% !important;
            white-space: nowrap;
          }

        // @media screen and (min-width: 1300px){
        //   .contentcol{
        //     left: 14.5%;
        //     position:absolute;
        //     width: 85.5% !important;
        //   }
        //   .contentfullcol{
        //     left: 44px;
        //     position:absolute;
        //     width: 96% !important;
        //   }
        //   .sidebarnocol{
        //     position:fixed;
        //     height: 100%;
        //     width: 4.8% !important;
        //   }
        // }
        // @media screen and (min-width: 1400px){
        //   .contentcol{
        //     left: 14.55%;
        //     position:absolute;
        //     width: 85.4% !important;
        //   }
        //   .contentfullcol{
        //     left: 52px;
        //     position:absolute;
        //     width: 96% !important;
        //   }
        //   .sidebarnocol{
        //     position:fixed;
        //     height: 100%;
        //     width: 4.8% !important;
        //   }
        // }
        .redborder{
          border: 1px solid red !important;
        }
        .btn-warning{
          color: black !important;
        }
        table th{
          font-size: 14px;
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
      <div class="modal" style="display:block;" id="loadingmodal">
        <div class="modal-dialog" style="width: 100px !important; margin: 0px auto !important;margin-top:300px !important;">
          <div class="modal-content">
            <div class="modal-body text-center">
              <div class="spinner-border border-5 text-primary" role="status" style="width: 5rem; height: 5rem;">
                  <span class="visually-hidden" >Loading...</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    ';
  }
  function javascript()
  {
    echo '
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="jquery/jquery.min.js"></script>
    <script src="../../Resources\bootstrap-5.3.1-dist\js\bootstrap.min.js" charset="utf-8"></script>
    ';
?>
    <script type="text/javascript">
      var myVariable = false;

      function toggleVariable() {
        myVariable = !myVariable;
        return myVariable;
      }
      // $('#menu').on('click', function() {
      //   var newValue = toggleVariable();
      //   if (newValue === false) {
      //     setTimeout(function() {
      //       $("#navtitle").animate({
      //         opacity: "show",
      //         padding: "show"
      //       }, "normal");
      //       $("span#navname").animate({
      //         opacity: "show",
      //         padding: "show"
      //       }, "normal");
      //       $('.arrow').show("slow");
      //     }, 500);
      //     $('#sidebar').toggleClass('sidebarcol sidebarnocol');
      //     $('#thenavbar').slideToggle(800);
      //     // $('#sidebarlink').removeAttr('disabled');
      //   } else {
      //     // $('#sidebarlink').attr('disabled', true);
      //     $('#sidebar').toggleClass('sidebarcol sidebarnocol', 1000);
      //     $("#navtitle").hide();
      //     $('#menu').css('height', 82, '%');
      //     $("span#navname").hide();
      //     $('.arrow').hide();
      //     $('#thenavbar').slideToggle(500);
      //   }
      //   $('#content').toggleClass('contentcol contentfullcol');
      // });
      $('.table').removeClass('table-bordered');
      $('th').css('background-color', 'black');

      $(document).keydown(function(event) {
        // Check if Ctrl key and Enter key are pressed
        if (event.ctrlKey && event.key === 'Enter') {
          var filename = window.location.pathname.split('/').pop();;

          window.location.href = "linkpage.php?filename=" + filename;
        }
      });
      $(document).ready(function() {
        $("#loadingmodal").hide();
      });
    </script>
<?php
  }
}


?>