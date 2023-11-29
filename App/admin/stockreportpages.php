<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
        if(!empty($_SESSION) && !empty($_SESSION['stockreporttype'])){
            if($_SESSION['stockreporttype'] == 'hhkloosereport'){
                ?>
                <form class="row" method="post">
                    <div class="col-2">
                        <select name="hhkinoutinput" class="form-control inpv2">
                            <option value="">Select Loose In Or Out</option>
                            <option value="loosein">Loose In</option>
                            <option value="looseout">Loose Out</option>
                        </select>
                    </div>
                    <div class="col-10">
                        <button class="btn btn-success" type="submit" name="chooseinorout">Select</button>
                    </div>
                </form>
                <div class="content">
                    <?php
                    if (isset($_POST['chooseinorout'])) {
                        if($_POST['hhkinoutinput'] == 'loosein'){
                            ?>
                            <div class="mt-4">
                                <h5>HHK Loose In</h5>
                                <table class="table">
                                    <tr>
                                        <th>No</th>
                                        <th>Commondity</th>
                                        <th>Country</th>
                                        <th>Size</th>
                                        <th>Kg</th>
                                        <th>Pcs</th>
                                    </tr>
                                    <?php
                                    $looseinstmt = $pdo->prepare("SELECT * FROM hhkmcstock WHERE loosein_size!='' OR loosein_kg!='' OR loosein_pcs!='0'");
                                    $looseinstmt->execute();
                                    $looseindatas = $looseinstmt->fetchAll();
                                    $looseinno = 0;
                                    foreach($looseindatas as $looseindata){
                                    $looseinno++;
                                    $item_id = $looseindata['commondity_id'];
                                    $commonditydata = $query->select('item', $item_id, 'item_id');
                                    ?>
                                    <tr>
                                        <td><?= $looseinno; ?></td>
                                        <td><?= $commonditydata['item_name']; ?></td>
                                        <td><?= $looseindata['country']; ?></td>
                                        <td><?= $looseindata['loosein_size']; ?></td>
                                        <td><?= $looseindata['loosein_kg']; ?></td>
                                        <td><?= $looseindata['loosein_pcs']; ?></td>
                                    </tr>
                                    <?php                                    
                                    }
                                    ?>
                                </table>
                            </div>
                            <?php
                        }
                    }
                    ?>
                    <?php
                    if (isset($_POST['chooseinorout'])) {
                        if($_POST['hhkinoutinput'] == 'looseout'){
                            ?>
                            <div class="mt-4">
                                <h5>HHK Loose Out Table</h5>
                                <table class="table">
                                    <tr>
                                        <th>No</th>
                                        <th>Commondity</th>
                                        <th>Country</th>
                                        <th>Size</th>
                                        <th>Kg</th>
                                        <th>Pcs</th>
                                    </tr>
                                    <?php
                                    $looseoutstmt = $pdo->prepare("SELECT * FROM hhkmcstock WHERE looseout_size!='' OR looseout_kg!='' OR looseout_pcs!='0'");
                                    $looseoutstmt->execute();
                                    $looseoutdatas = $looseoutstmt->fetchAll();
                                    $looseoutno = 0;
                                    foreach($looseoutdatas as $looseoutdata){
                                    $looseoutno++;
                                    $item_id = $looseoutdata['commondity_id'];
                                    $commonditydata = $query->select('item', $item_id, 'item_id');
                                    ?>
                                    <tr>
                                        <td><?= $looseoutno; ?></td>
                                        <td><?= $commonditydata['item_name']; ?></td>
                                        <td><?= $looseoutdata['country']; ?></td>
                                        <td><?= $looseoutdata['looseout_size']; ?></td>
                                        <td><?= $looseoutdata['looseout_kg']; ?></td>
                                        <td><?= $looseoutdata['looseout_pcs']; ?></td>
                                    </tr>
                                    <?php                                    
                                    }
                                    ?>
                                </table>
                            </div>
                            <?php
                        }
                    }
                    ?>
                </div>
                <?php
            }
        }
    ?>
</body>
</html>