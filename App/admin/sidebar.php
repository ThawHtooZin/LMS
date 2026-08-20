<?php
$permission = $query->select('permission', $_SESSION['role'], 'role_id');
$permissions = $permission['permission'];
?>
<div class="flex-column flex-shrink-0 p-1 text-white" style="background-color:#011d36 !important; min-height: 100vh;">
  <div class="panel-group" id="accordionsidebar">
    <div class="d-flex w-100 py-3 ps-4" style="border-bottom: 1px solid rgba(255,255,255,0.2);">
      <div>
        <span style="font-size: 23px; line-height: auto !important; color: white; font-weight:bold;" id="navtitle">Link Mark System</span><br>
        <span style="font-size: 12px; line-height: auto !important; color: white; font-weight:bold;" id="navtitle">Enterprise Management</span>
      </div>
    </div>
    <ul class="nav nav-pills flex-column mt-2">
      <!-- Home -->
      <li class="nav-item p-1" style="font-weight:bold;">
        <a href="../admin/" class="nav-link  <?= ($current_page == 'index.php' || $current_page == 'admin') ? 'active-menu' : ''; ?>" id="sidebarlink">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-speedometer2" viewBox="0 0 16 16">
            <path d="M8 4a.5.5 0 0 1 .5.5V6a.5.5 0 0 1-1 0V4.5A.5.5 0 0 1 8 4zM3.732 5.732a.5.5 0 0 1 .707 0l.915.914a.5.5 0 1 1-.708.708l-.914-.915a.5.5 0 0 1 0-.707zM2 10a.5.5 0 0 1 .5-.5h1.586a.5.5 0 0 1 0 1H2.5A.5.5 0 0 1 2 10zm9.5 0a.5.5 0 0 1 .5-.5h1.5a.5.5 0 0 1 0 1H12a.5.5 0 0 1-.5-.5zm.754-4.246a.389.389 0 0 0-.527-.02L7.547 9.31a.91.91 0 1 0 1.302 1.258l3.434-4.297a.389.389 0 0 0-.029-.518z" />
            <path fill-rule="evenodd" d="M0 10a8 8 0 1 1 15.547 2.661c-.442 1.253-1.845 1.602-2.932 1.25C11.309 13.488 9.475 13 8 13c-1.474 0-3.31.488-4.615.911-1.087.352-2.49.003-2.932-1.25A7.988 7.988 0 0 1 0 10zm8-7a7 7 0 0 0-6.603 9.329c.203.575.923.876 1.68.63C4.397 12.533 6.358 12 8 12s3.604.532 4.923.96c.757.245 1.477-.056 1.68-.631A7 7 0 0 0 8 3z" />
          </svg>
          <span id="navname">Home</span>
        </a>
      </li>
      <?php
      $current_page = basename($_SERVER['PHP_SELF']);
      $system_pages = ['manageaccounts.php', 'managerole.php', 'backupandrestore.php', 'userlog.php'];
      $is_system_active = in_array($current_page, $system_pages);
      ?>

      <?php if (str_contains($permissions, 'manage_accounts') || str_contains($permissions, 'manage_role')) { ?>
        <li class="p-1" style="font-weight:bold;">
          <a href="#" class="nav-link <?= $is_system_active ? 'active' : ''; ?>" id="sidebarlink" data-bs-toggle="collapse" data-bs-target="#system-collapse" aria-expanded="<?= $is_system_active ? 'true' : 'false'; ?>">
            <svg fill="#fff" height="20" width="20" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 512 512" xml:space="preserve">
              <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
              <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
              <g id="SVGRepo_iconCarrier">
                <g>
                  <g>
                    <g>
                      <path d="M181.173,256c-41.28,0-74.667,33.387-74.667,74.667s33.387,74.667,74.667,74.667c41.28,0,74.667-33.387,74.667-74.667 C255.84,289.493,222.453,256.107,181.173,256z M181.173,384c-29.44,0-53.333-23.893-53.333-53.333s23.893-53.333,53.333-53.333 s53.333,23.893,53.333,53.333S210.613,384,181.173,384z"></path>
                      <path d="M406.453,64c-24.533-0.107-44.373,20.693-42.667,45.547c1.387,21.013,18.453,38.08,39.467,39.68 c24.96,1.813,45.76-17.92,45.76-42.453v-0.107C449.013,83.2,430.027,64.107,406.453,64z M427.787,106.667 c-0.107,9.28-6.08,17.813-14.933,20.373c-14.72,4.373-28.053-6.72-27.733-20.907c0.213-10.987,9.067-20.16,20.053-20.8 c12.373-0.747,22.613,8.96,22.613,21.227V106.667z"></path>
                      <path d="M361.867,285.013c0.747-2.773,0.32-5.653-1.067-8.107l-42.987-73.92c-2.987-5.013-9.387-6.827-14.507-3.947 l-27.413,15.68c-12.16-10.453-26.133-18.56-41.173-23.893v-30.933c0-5.867-4.8-10.667-10.667-10.667H138.72 c-5.867,0-10.667,4.8-10.667,10.667v30.933c-15.147,5.333-29.12,13.44-41.28,23.893l-27.52-15.68 c-5.12-2.88-11.52-1.173-14.507,3.947l-43.093,73.92c-2.987,5.12-1.28,11.627,3.84,14.613L32.8,307.2 c-2.56,15.573-2.56,31.467,0,47.04L5.493,369.813c-5.12,2.88-6.827,9.493-3.947,14.613c0,0,0,0,0,0.107l42.987,73.92 c2.987,5.013,9.387,6.827,14.507,3.947l27.627-15.787c13.547,11.093,26.453,18.56,41.28,23.787v30.933 c0,5.867,4.8,10.667,10.667,10.667h85.333c5.867,0,10.667-4.8,10.667-10.667V470.4c15.04-5.333,29.013-13.44,41.173-23.893 l27.413,15.68c5.12,2.88,11.52,1.173,14.507-3.947l42.987-73.92c2.987-5.12,1.28-11.627-3.84-14.613l-27.2-15.573 c2.56-15.573,2.56-31.36,0-46.933l27.2-15.573C359.307,290.133,361.12,287.787,361.867,285.013z M312.373,292.48 c-4.053,2.347-6.08,6.933-5.12,11.52c3.84,17.6,3.84,35.947,0,53.547c-0.96,4.48,1.067,9.173,5.12,11.52L336.8,383.04 l-32.32,55.467l-24.747-14.187c-4.053-2.24-9.067-1.707-12.48,1.387c-15.787,14.08-29.227,21.867-46.4,26.773 c-4.587,1.28-7.787,5.44-7.68,10.24v27.947h-65.067v-28.053c0.96-4.8-2.24-8.96-6.827-10.24 c-17.387-4.907-30.827-12.693-46.507-26.773c-3.413-3.093-8.427-3.627-12.373-1.387L57.547,438.4l-32.213-55.467l24.533-13.973 c4.053-2.347,6.08-6.933,5.12-11.52c-3.84-17.6-3.84-35.84,0-53.547c0.96-4.48-1.067-9.173-5.12-11.52L25.333,278.4l32.32-55.467 l24.853,14.187c3.947,2.24,8.96,1.707,12.373-1.387c15.68-14.08,29.12-21.76,46.507-26.773c4.587-1.28,7.787-5.547,7.893-10.24 v-28.053h62.933v28.16c0.96,4.8,4.053,8.96,8.64,10.24c17.28,4.907,30.72,12.693,46.4,26.773 c3.413,3.093,8.427,3.627,12.373,1.28l24.853-14.187l32.213,55.467L312.373,292.48z"></path>
                      <path d="M506.293,126.933l-14.613-8.427c0.64-3.947,0.96-7.893,0.96-11.84s-0.32-7.893-0.96-11.84l14.827-8.427 c5.12-2.88,6.827-9.493,3.947-14.507c0,0,0,0,0-0.107l-21.547-37.013c-2.88-5.013-9.28-6.827-14.4-3.947l-15.893,8.747 c-6.613-4.907-13.867-8.853-21.44-11.947v-16.96C437.067,4.8,426.4,0,426.4,0h-42.667c0,0-10.667,4.8-11.627,10.667v17.067 c-6.187,2.987-12.907,6.933-18.987,11.733l-14.507-8.533c-5.12-2.987-11.627-1.28-14.613,3.84l-21.333,37.013 c-2.987,5.12-1.173,11.627,3.947,14.613c0,0,0,0,0.107,0l14.827,8.533c-0.533,3.84-0.853,7.787-0.853,11.733 s0.32,7.893,0.853,11.84l-14.827,8.427c-5.12,2.88-6.827,9.493-3.947,14.507c0,0,0,0,0,0.107l21.44,37.013 c1.387,2.453,3.733,4.267,6.507,4.907c2.773,0.747,5.653,0.32,8.107-1.173l14.187-8.427c6.08,4.8,12.8,8.747,20.053,11.733 v17.067c-0.107,5.867,10.56,10.56,10.56,10.56h42.667c0,0,10.667-4.693,9.707-10.56V185.6c8.64-3.093,15.787-7.04,22.4-11.947 l15.467,8.64c5.013,2.88,11.52,1.173,14.4-3.84l21.653-37.013C513.12,136.533,511.413,129.92,506.293,126.933z M474.293,80.107 c-3.947,2.347-5.973,7.147-4.907,11.733c2.453,9.707,2.347,19.84-0.107,29.547c-1.067,4.587,0.96,9.387,5.013,11.733 l11.947,6.827l-10.987,18.667l-12.693-7.147c-4.053-2.24-9.173-1.707-12.587,1.493c-6.507,6.08-16.533,11.733-26.88,14.933 c-4.48,1.387-7.467,5.547-7.36,10.133V192h-22.4v-13.76c0.96-4.693-2.027-8.747-6.507-10.133 c-9.493-3.093-18.133-8.107-25.387-14.933c-3.52-3.307-8.747-3.84-12.8-1.387l-11.413,6.827l-10.667-18.347l12.053-6.933 c4.16-2.347,6.187-7.147,5.12-11.733c-1.173-4.8-1.813-9.813-1.813-14.827c0-5.013,0.64-9.92,1.707-14.827 c1.067-4.587-0.96-9.387-5.12-11.733l-12.16-6.933l10.56-18.453l11.84,6.933c4.053,2.347,9.28,1.813,12.693-1.493 c7.253-6.827,15.893-11.84,25.387-14.933c4.48-1.387,7.467-5.547,7.573-10.133V21.333h20.267v13.76 c0.96,4.693,4.053,8.747,8.427,10.133c10.453,3.307,20.48,8.96,26.88,14.933c3.413,3.2,8.427,3.84,12.48,1.6l13.013-7.253 l10.88,18.667L474.293,80.107z"></path>
                    </g>
                  </g>
                </g>
              </g>
            </svg>
            <span id="navname">System</span> <i class=" arrow arrdown"></i>
          </a>
          <div class="collapse <?= $is_system_active ? 'show' : ''; ?>" id="system-collapse" data-bs-parent="#accordionsidebar">
            <ul class="btn-toggle-nav list-unstyled fw-normal ms-2">
              <?php if (str_contains($permissions, 'manage_accounts')) { ?>
                <li class="nav-item">
                  <a href="manageaccounts.php" class="nav-link sub-menu  <?= ($current_page == 'manageaccounts.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Manage Accounts
                  </a>
                </li>
              <?php } ?>
              <?php if (str_contains($permissions, 'manage_role')) { ?>
                <li class="nav-item">
                  <a href="managerole.php" class="nav-link sub-menu  <?= ($current_page == 'managerole.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Manage Role
                  </a>
                </li>
              <?php } ?>
              <?php if ($_SESSION['role'] == 1) { ?>
                <li class="nav-item">
                  <a href="backupandrestore.php" class="nav-link sub-menu  <?= ($current_page == 'backupandrestore.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Backup And Restore
                  </a>
                </li>
                <li class="nav-item">
                  <a href="userlog.php" class="nav-link sub-menu  <?= ($current_page == 'userlog.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - User Log
                  </a>
                </li>
              <?php } ?>
            </ul>
          </div>
        </li>
      <?php } ?>

      <?php
      $current_page = basename($_SERVER['PHP_SELF']);
      // ADDED THE NEW MANUAL JOURNAL PAGES HERE
      $account_pages = [
        'sales.php',
        'purchase.php',
        'cashbook.php',
        'acpayable.php',
        'accountpayable.php',
        'accountreceivable.php',
        'transaction.php',
        'general_ledger.php',
        'ledger_record.php',
        'manual_journals.php',
        'new_journal.php'
      ];

      $is_account_active = in_array($current_page, $account_pages);
      ?>

      <?php
      // ADDED THE NEW MANUAL JOURNAL PERMISSION HERE
      if (
        str_contains($permissions, 'manage_sale') ||
        str_contains($permissions, 'manage_purchase') ||
        str_contains($permissions, 'manage_cashbook') ||
        str_contains($permissions, 'manage_accountpayable') ||
        str_contains($permissions, 'manage_accountreceivable') ||
        str_contains($permissions, 'manage_general_ledger') ||
        str_contains($permissions, 'manage_ledger_record') ||
        str_contains($permissions, 'manage_acpayable') ||
        str_contains($permissions, 'manage_manual_journals')
      ) {
      ?>
        <li class="p-1" style="font-weight:bold;">
          <a href="#" class="nav-link text-white <?= $is_account_active ? 'active' : ''; ?>" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="<?= $is_account_active ? 'true' : 'false'; ?>" id="sidebarlink">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-receipt-cutoff" viewBox="0 0 16 16">
              <path d="M3 4.5a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zm0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5zM11.5 4a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1h-1z" />
              <path d="M2.354.646a.5.5 0 0 0-.801.13l-.5 1A.5.5 0 0 0 1 2v13H.5a.5.5 0 0 0 0 1h15a.5.5 0 0 0 0-1H15V2a.5.5 0 0 0-.053-.224l-.5-1a.5.5 0 0 0-.8-.13L13 1.293l-.646-.647a.5.5 0 0 0-.708 0L11 1.293l-.646-.647a.5.5 0 0 0-.708 0L9 1.293 8.354.646a.5.5 0 0 0-.708 0L7 1.293 6.354.646a.5.5 0 0 0-.708 0L5 1.293 4.354.646a.5.5 0 0 0-.708 0L3 1.293 2.354.646zm-.217 1.198.51.51a.5.5 0 0 0 .707 0L4 1.707l.646.647a.5.5 0 0 0 .708 0L6 1.707l.646.647a.5.5 0 0 0 .708 0L8 1.707l.646.647a.5.5 0 0 0 .708 0L10 1.707l.646.647a.5.5 0 0 0 .708 0L12 1.707l.646.647a.5.5 0 0 0 .708 0l.509-.51.137.274V15H2V2.118l.137-.274z" />
            </svg>
            <span id="navname">Account</span> <i class=" arrow arrdown"></i>
          </a>
          <div class="collapse <?= $is_account_active ? 'show' : ''; ?>" id="account-collapse" data-bs-parent="#accordionsidebar">
            <ul class="btn-toggle-nav list-unstyled fw-normal ms-2">
              <?php if (str_contains($permissions, 'manage_sale')) { ?>
                <li class="nav-item">
                  <a href="sales.php" class="nav-link sub-menu  <?= ($current_page == 'sales.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Sales
                  </a>
                </li>
              <?php } ?>
              <?php if (str_contains($permissions, 'manage_purchase')) { ?>
                <li class="nav-item">
                  <a href="purchase.php" class="nav-link sub-menu  <?= ($current_page == 'purchase.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Purchase
                  </a>
                </li>
              <?php } ?>
              <?php if (str_contains($permissions, 'manage_cashbook')) { ?>
                <li class="nav-item">
                  <a href="cashbook.php" class="nav-link sub-menu  <?= ($current_page == 'cashbook.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Cash Book
                  </a>
                </li>
              <?php } ?>
              <?php if (str_contains($permissions, 'manage_acpayable')) { ?>
                <li class="nav-item">
                  <a href="acpayable.php" class="nav-link sub-menu  <?= ($current_page == 'acpayable.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - A/C Payable
                  </a>
                </li>
              <?php } ?>
              <?php if (str_contains($permissions, 'manage_accountpayable')) { ?>
                <li class="nav-item">
                  <a href="accountpayable.php" class="nav-link sub-menu  <?= ($current_page == 'accountpayable.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Account Payable
                  </a>
                </li>
              <?php } ?>
              <?php if (str_contains($permissions, 'manage_accountreceivable')) { ?>
                <li class="nav-item">
                  <a href="accountreceivable.php" class="nav-link sub-menu  <?= ($current_page == 'accountreceivable.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Account Receivable
                  </a>
                </li>
              <?php } ?>
              <?php if (str_contains($permissions, 'manage_transaction')) { ?>
                <li class="nav-item">
                  <a href="transaction.php" class="nav-link sub-menu  <?= ($current_page == 'transaction.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Transaction
                  </a>
                </li>
              <?php } ?>

              <!-- ADDED MANUAL JOURNALS LINK HERE -->
              <?php if (str_contains($permissions, 'manage_manual_journals')) { ?>
                <li class="nav-item">
                  <a href="manual_journals.php" class="nav-link sub-menu  <?= ($current_page == 'manual_journals.php' || $current_page == 'new_journal.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Manual Journals
                  </a>
                </li>
              <?php } ?>

              <?php if (str_contains($permissions, 'manage_general_ledger')) { ?>
                <li class="nav-item">
                  <a href="general_ledger.php" class="nav-link sub-menu  <?= ($current_page == 'general_ledger.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - General Ledger
                  </a>
                </li>
              <?php } ?>
              <?php if (str_contains($permissions, 'manage_ledger_record')) { ?>
                <li class="nav-item">
                  <a href="ledger_record.php" class="nav-link sub-menu  <?= ($current_page == 'ledger_record.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Ledger Record
                  </a>
                </li>
              <?php } ?>
            </ul>
          </div>
        </li>
      <?php } ?>

      <?php
      $current_page = basename($_SERVER['PHP_SELF']);

      $config_pages = [
        'contacts.php',
        'coa.php',
        'products.php',
        'product_types.php',
        'currency.php',
        'unit.php'
      ];

      $is_config_active = in_array($current_page, $config_pages);
      ?>

      <?php
      if (
        str_contains($permissions, 'manage_contacts') ||
        str_contains($permissions, 'manage_products') ||
        str_contains($permissions, 'manage_product_types') ||
        str_contains($permissions, 'manage_currency') ||
        str_contains($permissions, 'manage_unit') ||
        str_contains($permissions, 'manage_coa')
      ) {
      ?>
        <li class="p-1" style="font-weight:bold;">
          <a href="#" class="nav-link text-white <?= $is_config_active ? 'active' : ''; ?>" id="sidebarlink" data-bs-toggle="collapse" data-bs-target="#config-collapse" aria-expanded="<?= $is_config_active ? 'true' : 'false'; ?>">
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-sliders2" viewBox="0 0 16 16">
              <path fill-rule="evenodd" d="M10.5 1a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-1 0V4H1.5a.5.5 0 0 1 0-1H10V1.5a.5.5 0 0 1 .5-.5ZM12 3.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Zm-6.5 2A.5.5 0 0 1 6 6v1.5h8.5a.5.5 0 0 1 0 1H6V10a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5ZM1 8a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2A.5.5 0 0 1 1 8Zm9.5 2a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-1 0V13H1.5a.5.5 0 0 1 0-1H10v-1.5a.5.5 0 0 1 .5-.5Zm1.5 2.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5Z" />
            </svg>
            <span id="navname">Configuration</span> <i class=" arrow arrdown"></i>
          </a>
          <div class="collapse <?= $is_config_active ? 'show' : ''; ?>" id="config-collapse" data-bs-parent="#accordionsidebar">
            <ul class="btn-toggle-nav list-unstyled fw-normal ms-2">
              <?php if (str_contains($permissions, 'manage_contacts')) { ?>
                <li class="nav-item">
                  <a href="contacts.php" class="nav-link sub-menu  <?= ($current_page == 'contacts.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Manage Contacts
                  </a>
                </li>
              <?php } ?>
              <?php if (str_contains($permissions, 'manage_coa')) { ?>
                <li class="nav-item">
                  <a href="coa.php" class="nav-link sub-menu  <?= ($current_page == 'coa.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Chart of Accounts
                  </a>
                </li>
              <?php } ?>
              <?php if (str_contains($permissions, 'manage_products')) { ?>
                <li class="nav-item">
                  <a href="products.php" class="nav-link sub-menu  <?= ($current_page == 'products.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Products & Services
                  </a>
                </li>
              <?php } ?>
              <?php if (str_contains($permissions, 'manage_product_types')) { ?>
                <li class="nav-item">
                  <a href="product_types.php" class="nav-link sub-menu  <?= ($current_page == 'product_types.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Product Types
                  </a>
                </li>
              <?php } ?>
              <?php if (str_contains($permissions, 'manage_currency')) { ?>
                <li class="nav-item">
                  <a href="currency.php" class="nav-link sub-menu  <?= ($current_page == 'currency.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Currencies
                  </a>
                </li>
              <?php } ?>
              <?php if (str_contains($permissions, 'manage_unit')) { ?>
                <li class="nav-item" style="cursor: not-allowed !important;">
                  <a href="unit.php" class="nav-link sub-menu  disabled <?= ($current_page == 'unit.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Unit
                  </a>
                </li>
              <?php } ?>
            </ul>
          </div>
        </li>
      <?php } ?>

      <?php
      $current_page = basename($_SERVER['PHP_SELF']);

      $production_pages = [
        'coldstorecharges.php'
      ];

      $is_production_active = in_array($current_page, $production_pages);
      ?>

      <?php
      if (str_contains($permissions, 'manage_coldstorecharges')) {
      ?>
        <li class="p-1" style="font-weight:bold;">
          <a href="#" class="nav-link text-white <?= $is_production_active ? 'active' : ''; ?>" id="sidebarlink" data-bs-toggle="collapse" data-bs-target="#production-collapse" aria-expanded="<?= $is_production_active ? 'true' : 'false'; ?>">
            <svg fill="#fff" height="20" width="20" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 512 512" xml:space="preserve">
              <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
              <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
              <g id="SVGRepo_iconCarrier">
                <g>
                  <g>
                    <g>
                      <path d="M128.141,365.695c1.555,0.762,3.231,1.136,4.9,1.136c2.422,0,4.826-0.79,6.815-2.328l44.815-34.689 c15.521,14.668,53.91,45.82,99.99,45.82c58.985,0,105.37-51.044,107.316-53.217c3.784-4.226,3.784-10.624,0-14.85 c-1.946-2.173-48.331-53.218-107.316-53.218c-46.08,0-84.47,31.151-99.99,45.82l-44.815-34.689 c-3.358-2.598-7.9-3.059-11.715-1.191c-3.812,1.871-6.229,5.747-6.229,9.994v81.419 C121.913,359.947,124.329,363.824,128.141,365.695z M284.661,276.609c36.63,0,69.043,25.425,83.197,38.397 c-14.11,12.976-46.421,38.367-83.197,38.367c-36.636,0-69.052-25.432-83.197-38.397 C215.572,302.001,247.884,276.609,284.661,276.609z M144.174,296.972l23.278,18.019l-23.278,18.018V296.972z"></path>
                      <path d="M334.338,422.957h-3.896c-6.147,0-11.13,4.984-11.13,11.13c0,6.146,4.983,11.13,11.13,11.13h3.896 c6.147,0,11.13-4.984,11.13-11.13C345.469,427.941,340.486,422.957,334.338,422.957z"></path>
                      <path d="M467.478,0H44.522c-6.147,0-11.13,4.984-11.13,11.13v111.304c0,6.146,4.983,11.13,11.13,11.13h22.261V500.87 c0,6.146,4.983,11.13,11.13,11.13h356.174c6.147,0,11.13-4.984,11.13-11.13V133.565h22.261c6.147,0,11.13-4.984,11.13-11.13 V11.13C478.609,4.984,473.626,0,467.478,0z M357.763,22.261h38.162v89.044h-38.162V22.261z M297.342,22.261h38.162v89.044 h-38.162V22.261z M236.919,22.261h38.162v89.044h-38.162V22.261z M176.496,22.261h38.162v89.044h-38.162V22.261z M116.074,22.261 h38.162v89.044h-38.162V22.261z M55.652,111.304V22.261h38.162v89.044H55.652z M422.957,422.957h-42.985 c-6.147,0-11.13,4.984-11.13,11.13c0,6.146,4.983,11.13,11.13,11.13h42.985v44.522H89.044v-44.522h189.641 c6.147,0,11.13-4.984,11.13-11.13c0-6.146-4.983-11.13-11.13-11.13H89.044V200.348h333.913V422.957z M422.957,178.087H89.044 v-44.522h333.913V178.087z M456.348,111.304h-38.162V22.261h38.162V111.304z"></path>
                    </g>
                  </g>
                </g>
              </g>
            </svg>
            <span id="navname">Production</span> <i class=" arrow arrdown"></i>
          </a>
          <div class="collapse <?= $is_production_active ? 'show' : ''; ?>" id="production-collapse" data-bs-parent="#accordionsidebar">
            <ul class="btn-toggle-nav list-unstyled fw-normal ms-2">
              <?php if (str_contains($permissions, 'manage_coldstorecharges')) { ?>
                <li class="nav-item">
                  <a href="coldstorecharges.php" class="nav-link sub-menu  <?= ($current_page == 'coldstorecharges.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Cold Store Charges
                  </a>
                </li>
              <?php } ?>
            </ul>
          </div>
        </li>
      <?php } ?>

      <?php
      $current_page = basename($_SERVER['PHP_SELF']);

      $packing_pages = [
        'configuration_coldstore.php',
        'material_purchase.php',
        'material_store_house.php',
        'material_gatepass.php',
        'temppmstock.php'
      ];

      $is_packing_active = in_array($current_page, $packing_pages);
      ?>

      <?php
      if (
        str_contains($permissions, 'material_store_house') ||
        str_contains($permissions, 'material_output') ||
        str_contains($permissions, 'manage_material_purchase') ||
        str_contains($permissions, 'material_gatepass') ||
        str_contains($permissions, 'configuration_coldstore') ||
        str_contains($permissions, 'temp_pm_stock')
      ) {
      ?>
        <li class="p-1" style="font-weight:bold;">
          <a href="#" class="nav-link text-white <?= $is_packing_active ? 'active' : ''; ?>" id="sidebarlink" data-bs-toggle="collapse" data-bs-target="#packing-collapse" aria-expanded="<?= $is_packing_active ? 'true' : 'false'; ?>">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box-seam" viewBox="0 0 16 16">
              <path d="M8.186 1.113a.5.5 0 0 0-.372 0L1.846 3.5l2.404.961L10.404 2zm3.564 1.426L5.596 5 8 5.961 14.154 3.5zm3.25 1.7-6.5 2.6v7.922l6.5-2.6V4.24zM7.5 14.762V6.838L1 4.239v7.923zM7.443.184a1.5 1.5 0 0 1 1.114 0l7.129 2.852A.5.5 0 0 1 16 3.5v8.662a1 1 0 0 1-.629.928l-7.185 2.874a.5.5 0 0 1-.372 0L.63 13.09a1 1 0 0 1-.63-.928V3.5a.5.5 0 0 1 .314-.464z" />
            </svg>
            <span id="navname">Packing Material</span> <i class=" arrow arrdown"></i>
          </a>
          <div class="collapse <?= $is_packing_active ? 'show' : ''; ?>" id="packing-collapse" data-bs-parent="#accordionsidebar">
            <ul class="btn-toggle-nav list-unstyled fw-normal ms-2">
              <?php if (str_contains($permissions, 'configuration_coldstore')) { ?>
                <li class="nav-item">
                  <a href="configuration_coldstore.php" class="nav-link sub-menu  <?= ($current_page == 'configuration_coldstore.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Configuration Coldstore
                  </a>
                </li>
              <?php } ?>
              <?php if (str_contains($permissions, 'manage_material_purchase')) { ?>
                <li class="nav-item">
                  <a href="material_purchase.php" class="nav-link sub-menu  <?= ($current_page == 'material_purchase.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Packing Material Purchase
                  </a>
                </li>
              <?php } ?>
              <?php if (str_contains($permissions, 'material_store_house')) { ?>
                <li class="nav-item">
                  <a href="material_store_house.php" class="nav-link sub-menu  <?= ($current_page == 'material_store_house.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Packing Material W/H
                  </a>
                </li>
              <?php } ?>
              <?php if (str_contains($permissions, 'material_gatepass')) { ?>
                <li class="nav-item">
                  <a href="material_gatepass.php" class="nav-link sub-menu  <?= ($current_page == 'material_gatepass.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Packing Material Gate Pass
                  </a>
                </li>
              <?php } ?>
              <?php if (str_contains($permissions, 'temp_pm_stock')) { ?>
                <li class="nav-item">
                  <a href="temppmstock.php" class="nav-link sub-menu  <?= ($current_page == 'temppmstock.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - P/M Temp ColdStore
                  </a>
                </li>
              <?php } ?>
            </ul>
          </div>
        </li>
      <?php } ?>

      <?php
      $current_page = basename($_SERVER['PHP_SELF']);

      $stock_pages = [
        'form_7.php',
        'form_10.php',
        'hhkmcstock.php',
        'gfcmcstock.php',
        'tclmcstock.php',
        'stockreport.php'
      ];

      $logistic_pages = [
        'packing_stock.php',
        'truck_packing_stock.php',
        'packingmaterial.php'
      ];

      $report_pages = [
        'salereport.php',
        'purchase_report.php',
        'payablereport.php',
        'mainstockreport.php',
        'generalledgerreport.php',
        'packing_material_report.php',
        'profit_and_loss.php'
      ];

      $is_stock_active    = in_array($current_page, $stock_pages);
      $is_logistic_active = in_array($current_page, $logistic_pages);
      $is_report_active   = in_array($current_page, $report_pages);
      ?>

      <!-- Stock Control Dropdown -->
      <?php
      if (
        str_contains($permissions, 'manage_form7') ||
        str_contains($permissions, 'manage_form10') ||
        str_contains($permissions, 'manage_hhkmcstock') ||
        str_contains($permissions, 'manage_gfcmcstock') ||
        str_contains($permissions, 'manage_tclmcstock') ||
        str_contains($permissions, 'manage_mcreport')
      ) {
      ?>
        <li class="p-1" style="font-weight:bold;">
          <a href="#" class="nav-link text-white report <?= $is_stock_active ? 'active' : ''; ?>" id="sidebarlink" data-bs-toggle="collapse" data-bs-target="#stock-collapse" aria-expanded="<?= $is_stock_active ? 'true' : 'false'; ?>">
            <svg fill="#fff" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 496 496" xml:space="preserve">
              <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
              <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
              <g id="SVGRepo_iconCarrier">
                <g>
                  <g>
                    <g>
                      <path d="M96,384h64c8.824,0,16-7.176,16-16v-32H80v32C80,376.824,87.176,384,96,384z M96,352h64l0.008,16H96V352z"></path>
                      <rect x="208" y="272" width="16" height="16"></rect>
                      <rect x="144" y="272" width="48" height="16"></rect>
                      <path d="M358.528,240c0.896-2.512,1.472-5.184,1.472-8V80h16V0H120v80h16v152c0,2.816,0.576,5.488,1.472,8H0v80h16v152 c0,13.232,10.768,24,24,24h176c13.232,0,24-10.768,24-24V320h16v152c0,13.232,10.768,24,24,24h176c13.232,0,24-10.768,24-24V320 h16v-80H358.528z M136,64V16h224v48H136z M224,472c0,4.416-3.592,8-8,8H40c-4.408,0-8-3.584-8-8V320h192V472z M240,304H16v-48 h144h80V304z M240,240h-80c-4.408,0-8-3.584-8-8V80h192v152c0,4.416-3.592,8-8,8h-80H240z M464,472c0,4.416-3.592,8-8,8H280 c-4.408,0-8-3.584-8-8V320h192V472z M480,304H256v-48h80h144V304z"></path>
                      <path d="M336,384h64c8.824,0,16-7.176,16-16v-32h-96v32C320,376.824,327.176,384,336,384z M336,352h64l0.008,16H336V352z"></path>
                      <rect x="448" y="272" width="16" height="16"></rect>
                      <rect x="384" y="272" width="48" height="16"></rect>
                      <path d="M296,128V96h-96v32c0,8.824,7.176,16,16,16h64C288.824,144,296,136.824,296,128z M216,112h64l0.008,16H216V112z"></path>
                      <rect x="328" y="32" width="16" height="16"></rect>
                      <rect x="264" y="32" width="48" height="16"></rect>
                    </g>
                  </g>
                </g>
              </g>
            </svg>
            <span id="navname">Stock Control</span> <i class=" arrow arrdown"></i>
          </a>
          <div class="collapse <?= $is_stock_active ? 'show' : ''; ?>" id="stock-collapse" data-bs-parent="#accordionsidebar">
            <ul class="btn-toggle-nav list-unstyled fw-normal ms-2">
              <?php if (str_contains($permissions, 'manage_form7')) { ?>
                <li class="nav-item">
                  <a href="form_7.php" class="nav-link sub-menu  <?= ($current_page == 'form_7.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Form-7
                  </a>
                </li>
              <?php } ?>
              <?php if (str_contains($permissions, 'manage_form10')) { ?>
                <li class="nav-item">
                  <a href="form_10.php" class="nav-link sub-menu  <?= ($current_page == 'form_10.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Form-10
                  </a>
                </li>
              <?php } ?>
              <?php if (str_contains($permissions, 'manage_hhkmcstock')) { ?>
                <li class="nav-item">
                  <a href="hhkmcstock.php" class="nav-link sub-menu  <?= ($current_page == 'hhkmcstock.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - HKK Mc Stock
                  </a>
                </li>
              <?php } ?>
              <?php if (str_contains($permissions, 'manage_gfcmcstock')) { ?>
                <li class="nav-item">
                  <a href="gfcmcstock.php" class="nav-link sub-menu  <?= ($current_page == 'gfcmcstock.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - GFC Mc Stock
                  </a>
                </li>
              <?php } ?>
              <?php if (str_contains($permissions, 'manage_tclmcstock')) { ?>
                <li class="nav-item">
                  <a href="tclmcstock.php" class="nav-link sub-menu  <?= ($current_page == 'tclmcstock.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - TCL Mc Stock
                  </a>
                </li>
              <?php } ?>
              <?php if (str_contains($permissions, 'manage_mcreport')) { ?>
                <li class="nav-item">
                  <a href="stockreport.php" class="nav-link sub-menu  <?= ($current_page == 'stockreport.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Mc Report
                  </a>
                </li>
              <?php } ?>
            </ul>
          </div>
        </li>
      <?php } ?>

      <!-- Logistic Dropdown -->
      <?php
      if (
        str_contains($permissions, 'manage_truckexport') ||
        str_contains($permissions, 'manage_shippmentexport') ||
        str_contains($permissions, 'manage_packingmaterial')
      ) {
      ?>
        <li class="p-1" style="font-weight:bold;">
          <a href="#" class="nav-link text-white report <?= $is_logistic_active ? 'active' : ''; ?>" id="sidebarlink" data-bs-toggle="collapse" data-bs-target="#logestic-collapse" aria-expanded="<?= $is_logistic_active ? 'true' : 'false'; ?>">
            <svg fill="#fff" version="1.1" width="20" height="20" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 512 512" xml:space="preserve">
              <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
              <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g>
              <g id="SVGRepo_iconCarrier">
                <g>
                  <g>
                    <path d="M371.421,245.014v-37.372h-60.475v-60.475H250.47h-30.578h-60.475v60.475v30.578v29.898h-10.195v-93.827h-48.009v-18.15 h23.245v-30.578h-23.245v-23.245H70.636v23.245H47.391v30.578h23.245v18.15H22.629v93.827H0l44.954,141.564h414.755L512,245.014 H371.421z M310.944,238.22h29.899v6.795h-18.388l-7.337,23.103h-4.174V238.22z M250.469,177.745h29.898v29.898h-29.898V177.745z M250.469,238.22h29.898v29.898h-29.898V238.22z M189.994,177.745h29.898v29.898h-29.898V177.745z M189.994,238.22h29.898v29.898 h-29.898V238.22z M53.207,204.869h65.437v63.25H53.207V204.869z M437.337,379.104H67.326l-25.533-80.409h107.428h10.195h60.475 h30.578h29.898h30.578h26.546l7.337-23.103h26.592h98.787L437.337,379.104z"></path>
                  </g>
                </g>
                <g>
                  <g>
                    <rect x="358.512" y="291.67" width="31.597" height="30.578"></rect>
                  </g>
                </g>
                <g>
                  <g>
                    <rect x="408.19" y="291.67" width="31.597" height="30.578"></rect>
                  </g>
                </g>
              </g>
            </svg>
            <span id="navname">Logestic</span> <i class=" arrow arrdown"></i>
          </a>
          <div class="collapse <?= $is_logistic_active ? 'show' : ''; ?>" id="logestic-collapse" data-bs-parent="#accordionsidebar">
            <ul class="btn-toggle-nav list-unstyled fw-normal ms-2">
              <?php if (str_contains($permissions, 'manage_shippmentexport')) { ?>
                <li class="nav-item">
                  <a href="packing_stock.php" class="nav-link sub-menu  <?= ($current_page == 'packing_stock.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Shippment Export
                  </a>
                </li>
              <?php } ?>
              <?php if (str_contains($permissions, 'manage_truckexport')) { ?>
                <li class="nav-item">
                  <a href="truck_packing_stock.php" class="nav-link sub-menu  <?= ($current_page == 'truck_packing_stock.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Truck Export
                  </a>
                </li>
              <?php } ?>
              <?php if (str_contains($permissions, 'manage_packingmaterial')) { ?>
                <li class="nav-item">
                  <a href="packingmaterial.php" class="nav-link sub-menu  <?= ($current_page == 'packingmaterial.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Packing Material
                  </a>
                </li>
              <?php } ?>
            </ul>
          </div>
        </li>
      <?php } ?>

      <!-- Reports Dropdown -->
      <?php
      if (
        str_contains($permissions, 'sale_report') ||
        str_contains($permissions, 'purchase_report') ||
        str_contains($permissions, 'payable_report') ||
        str_contains($permissions, 'manage_stockreport') ||
        str_contains($permissions, 'manage_generalledger') ||
        str_contains($permissions, 'packing_material_report') ||
        str_contains($permissions, 'profit_loss_report')
      ) {
      ?>
        <li class="p-1" style="font-weight:bold;">
          <a href="#" class="nav-link text-white report <?= $is_report_active ? 'active' : ''; ?>" id="sidebarlink" data-bs-toggle="collapse" data-bs-target="#report-collapse" aria-expanded="<?= $is_report_active ? 'true' : 'false'; ?>">
            <svg viewBox="0 0 24.00 24.00" fill="none" width="20" height="20" xmlns="http://www.w3.org/2000/svg" stroke="#fff">
              <g id="SVGRepo_bgCarrier" stroke-width="0"></g>
              <g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round" stroke="#CCCCCC" stroke-width="0.384"></g>
              <g id="SVGRepo_iconCarrier">
                <path d="M3 21V17M9 21V13M15 21V15M21 21V11M8.43934 5.56066C8.71079 5.83211 9.08579 6 9.5 6C9.91421 6 10.2892 5.83211 10.5607 5.56066M8.43934 5.56066C8.16789 5.28921 8 4.91421 8 4.5C8 3.67157 8.67157 3 9.5 3C10.3284 3 11 3.67157 11 4.5C11 4.91421 10.8321 5.28921 10.5607 5.56066M8.43934 5.56066L5.56066 8.43934M5.56066 8.43934C5.28921 8.16789 4.91421 8 4.5 8C3.67157 8 3 8.67157 3 9.5C3 10.3284 3.67157 11 4.5 11C5.32843 11 6 10.3284 6 9.5C6 9.08579 5.83211 8.71079 5.56066 8.43934ZM10.5607 5.56066L13.4393 8.43934M13.4393 8.43934C13.1679 8.71079 13 9.08579 13 9.5C13 10.3284 13.6716 11 14.5 11C15.3284 11 16 10.3284 16 9.5C16 9.08579 15.8321 8.71079 15.5607 8.43934M13.4393 8.43934C13.7108 8.16789 14.0858 8 14.5 8C14.9142 8 15.2892 8.16789 15.5607 8.43934M15.5607 8.43934L18.4393 5.56066M18.4393 5.56066C18.7108 5.83211 19.0858 6 19.5 6C20.3284 6 21 5.32843 21 4.5C21 3.67157 20.3284 3 19.5 3C18.6716 3 18 3.67157 18 4.5C18 4.91421 18.1679 5.28921 18.4393 5.56066Z" stroke="#fff" stroke-width="1.224" stroke-linecap="round" stroke-linejoin="round"></path>
              </g>
            </svg>
            <span id="navname">Reports</span> <i class=" arrow arrdown"></i>
          </a>
          <div class="collapse <?= $is_report_active ? 'show' : ''; ?>" id="report-collapse" data-bs-parent="#accordionsidebar">
            <ul class="btn-toggle-nav list-unstyled fw-normal ms-2">
              <?php if (str_contains($permissions, 'sale_report')) { ?>
                <li class="nav-item" style="cursor: not-allowed !important;">
                  <a href="salereport.php" class="nav-link sub-menu  disabled <?= ($current_page == 'salereport.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Sale Report
                  </a>
                </li>
              <?php } ?>
              <?php if (str_contains($permissions, 'purchase_report')) { ?>
                <li class="nav-item">
                  <a href="purchase_report.php" class="nav-link sub-menu  <?= ($current_page == 'purchase_report.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Purchase Report
                  </a>
                </li>
              <?php } ?>
              <?php if (str_contains($permissions, 'payable_report')) { ?>
                <li class="nav-item">
                  <a href="payablereport.php" class="nav-link sub-menu  <?= ($current_page == 'payablereport.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Payable Report
                  </a>
                </li>
              <?php } ?>
              <?php if (str_contains($permissions, 'manage_stockreport')) { ?>
                <li class="nav-item">
                  <a href="mainstockreport.php" class="nav-link sub-menu  <?= ($current_page == 'mainstockreport.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Stock Report
                  </a>
                </li>
              <?php } ?>
              <?php if (str_contains($permissions, 'manage_generalledger')) { ?>
                <li class="nav-item">
                  <a href="generalledgerreport.php" class="nav-link sub-menu  <?= ($current_page == 'generalledgerreport.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - General Ledger Report
                  </a>
                </li>
              <?php } ?>
              <?php if (str_contains($permissions, 'packing_material_report')) { ?>
                <li class="nav-item">
                  <a href="packing_material_report.php" class="nav-link sub-menu  <?= ($current_page == 'packing_material_report.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Packing Material Report
                  </a>
                </li>
              <?php } ?>
              <?php if (str_contains($permissions, 'profit_loss_report')) { ?>
                <li class="nav-item">
                  <a href="profit_and_loss.php" class="nav-link sub-menu  <?= ($current_page == 'profit_and_loss.php') ? 'active' : ''; ?>" style="font-size:13px !important;">
                    - Profit and Loss
                  </a>
                </li>
              <?php } ?>
            </ul>
          </div>
        </li>
      <?php } ?>

      <li class=" p-1" class="nav-item" style=" font-weight:bold; ">
        <a href="userg.php" class="nav-link " id="sidebarlink">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-square" viewBox="0 0 16 16">
            <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z" />
            <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0" />
          </svg>
          <span id="navname">Users Guide</span>
        </a>
      </li>
      <li class=" p-1" class="nav-item" style=" font-weight:bold; ">
        <a href="logout.php" class="nav-link " id="sidebarlink">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-door-open-fill" viewBox="0 0 16 16">
            <path d="M1.5 15a.5.5 0 0 0 0 1h13a.5.5 0 0 0 0-1H13V2.5A1.5 1.5 0 0 0 11.5 1H11V.5a.5.5 0 0 0-.57-.495l-7 1A.5.5 0 0 0 3 1.5V15H1.5zM11 2h.5a.5.5 0 0 1 .5.5V15h-1V2zm-2.5 8c-.276 0-.5-.448-.5-1s.224-1 .5-1 .5.448.5 1-.224 1-.5 1z" />
          </svg>
          <span id="navname">Logout</span>
        </a>
      </li>
    </ul>
  </div>
</div>