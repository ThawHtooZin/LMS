<div class="d-flex flex-column flex-shrink-0 p-1 text-white bg-secondary" style="width: 16%; height:100%; position:fixed;">
      <div class="text-center bg-light text-dark p-3">
        <b class="fs-5">Link Mark System</b>
        <br>
        <b class="text-warning">Version 1.0.0</b>
      </div>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">
      <li class="nav-item  rounded" style=" border: 2px solid black; ">
        <a href="../user/" class="nav-link home text-light" aria-current="page">
          <svg class="bi" width="16" height="16"><i class="bi bi-speedometer2"></i></svg>
          Dashboard
        </a>
      </li>
      <li class="nav-item  rounded" style=" border: 2px solid black; ">
        <a href="logout.php" class="nav-link salereports text-light" aria-current="page">
          <svg class="bi" width="16" height="16"><i class="bi bi-card-list"></i></svg>
          Logout
        </a>
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
