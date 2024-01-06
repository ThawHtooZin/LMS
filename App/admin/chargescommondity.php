<?php

    include '../../Controllers/query.ctr.php';

    $commondityid = $_POST['commondityid'];
    $stmt = $pdo->prepare("SELECT * FROM category WHERE category_id='$commondityid'");
    $stmt->execute();
    $rate = $stmt->fetch(PDO::FETCH_ASSOC);

    echo '<input type="text" disabled class="form-control inpv2" value="'. $rate['rate'] .'">';
    echo '<input type="hidden" name="processingrate" value="'. $rate['rate']  .'">';

?>