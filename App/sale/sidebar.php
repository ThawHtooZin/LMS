<div class="d-flex flex-column flex-shrink-0 p-1 text-white bg-secondary" style="width: 16%; height:100%; position:fixed;">
      <div class="text-center bg-light text-dark p-3">
        <b class="fs-5">Link Mark System</b>
        <br>
        <b class="text-warning">Version 1.0.0</b>
      </div>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item  rounded" style=" border: 2px solid black; ">
        <a href="../sale/" class="nav-link home text-light" aria-current="page">
          <svg class="bi" width="16" height="16"><i class="bi bi-speedometer2"></i></svg>
          Dashboard
        </a>
      </li>
      <li style=" border: 2px solid black; " class="rounded">
        <a href="#" class="nav-link text-white account" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
          <svg class="bi" width="16" height="16"><i class="bi bi-card-list"></i></svg>
          Account >
        </a>
        <div class="collapse" id="account-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal">
            <li class="nav-item  rounded">
              <a href="sales.php" class="nav-link h sales text-light show" aria-current="page">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-tags"></i></svg>
                - Sales
              </a>
            </li>
            <li class="nav-item  rounded">
              <a href="accountreceivable.php" class="nav-link accountreceivable h text-light" aria-current="page">
                <svg class="bi" style="padding-right: 15px !important;" width="16" height="16"><i class="bi bi-box"></i></svg>
                - Account Receivable
              </a>
            </li>
          </ul>
        </div>
        <li class="nav-item  rounded" style=" border: 2px solid black; ">
          <a href="logout.php" class="nav-link salereports text-light" aria-current="page">
            <svg class="bi" width="16" height="16"><i class="bi bi-card-list"></i></svg>
            Logout
          </a>
        </li>
      </li>
    </ul>
    <hr>
    <h5>Time:</h5>
    <div class="bg-light text-dark text-center pt-3 pb-3">
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
      <div id="timer"></div>
    </div>
  </div>
