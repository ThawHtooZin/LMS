<?php

    include '../../Controllers/query.ctr.php';

    $commondityid = $_POST['commondityid'];
    $stmt = $pdo->prepare("SELECT * FROM category WHERE category_id='$commondityid'");
    $stmt->execute();
    $rate = $stmt->fetch(PDO::FETCH_ASSOC);

    echo '<input type="text" name="processingrate" class="form-control inpv2" id="processingrate" value="'. $rate['rate'] .'">';

?>