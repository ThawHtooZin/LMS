<?php
if(!empty($message)){
  if(strpos($message, 'Successfully')){
    $successmessage = $message;
  }

  if(strpos($message, 'Error')){
    $errmessage = $message;
  }

  if(strpos($message, 'following')){
    $errormessage = $message;
  }
}

?>

<?php
  if(!empty($errormessage)){
  ?>
  <div class="alert alert-danger alert-dismissible fade show">
    <strong>Error! </strong> <?php echo $errormessage; ?>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>
  <?php
}
if(!empty($errmessage)){
  ?>
  <div class="alert alert-danger alert-dismissible fade show">
    <strong>Error! </strong> <?php echo $errmessage; ?>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>
  <?php
}
if(!empty($successmessage)){
  ?>
  <div class="alert alert-success alert-dismissible fade show">
    <strong>Success! </strong> <?php echo $successmessage; ?>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </div>
  <?php
}
?>
