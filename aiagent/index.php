<?php
ini_set('session.gc_maxlifetime', '10800');
session_set_cookie_params(10800, '/');
session_start();

if (empty($_SESSION['username']) || empty($_SESSION['logged_in']) || empty($_SESSION['role'])) {
    header('Location: ../login.php');
    exit;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Link Mark Reports</title>
  <link rel="stylesheet" href="assets/chat.css?v=5">
</head>
<body>
  <aside id="chats">
    <button type="button" id="new-chat">New chat</button>
    <div id="chat-list"></div>
  </aside>
  <div class="workspace">
  <header>
    <div>
      <strong>Link Mark Reports</strong>
      <span>Ask for a report. Until you ask to filter, every row is shown.</span>
    </div>
    <div id="limits">Tokens: waiting for the first reply</div>
    <a href="../App/admin/">Back to system</a>
  </header>
  <main id="log">
    <div class="bubble assistant">
      I can open Purchase, Payable, Stock, General Ledger, Packing Material Warehouse, Gate Pass, and Profit and Loss.
      Ask for one and I will put the full table here. Excel and PDF use that same table.
    </div>
  </main>
  <form id="composer">
    <input id="message" type="text" placeholder="Show the purchase report" autocomplete="off">
    <button type="submit">Send</button>
  </form>
  <script src="assets/chat.js?v=5"></script>
  </div>
</body>
</html>
