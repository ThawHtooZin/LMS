<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
        if(!empty($_SESSION) && !empty($_SESSION['stockreporttype'])){
            // ================================================
            // HHK Loose Report
            if($_SESSION['stockreporttype'] == 'hhkloosereport'){
                ?>
                <form method="post" style="width: 450px; display: inline-flex;">
                    <div class="col-5 me-2">
                        <select name="hhkcommondityinput" class="form-control inpv2">
                            <option value="">Select Commondity</option>
                            <?php
                                $hhkmcstockcommonditystmt = $pdo->prepare("SELECT * FROM hhkmcstock WHERE loosein_size!='' OR loosein_kg!='' OR loosein_pcs!='0' OR looseout_size!='' AND looseout_kg!='' OR looseout_pcs!='0' GROUP BY commondity_id");
                                $hhkmcstockcommonditystmt->execute();
                                $hhkmcstockcommonditydatas = $hhkmcstockcommonditystmt->fetchAll();
                                foreach($hhkmcstockcommonditydatas as $hhkmcstockcommonditydata){
                                    $item_id = $hhkmcstockcommonditydata['commondity_id'];
                                    $commonditydata = $query->select('item', $item_id, 'item_id');
                                    ?>
                                    <option value="<?= $hhkmcstockcommonditydata['commondity_id']; ?>"><?= $commonditydata['item_name'];?></option>
                                    <?php
                                }
                            ?>
                        </select>
                    </div>
                    <div class="col-5 me-1">
                        <select name="hhkinoutinput" class="form-control inpv2">
                            <option value="">Select Loose In Or Out</option>
                            <option value="loosein">Loose In</option>
                            <option value="looseout">Loose Out</option>
                        </select>
                    </div>
                    <div class="col-2">
                        <button class="btn btn-success" type="submit" name="chooseinorout">Select</button>
                    </div>
                </form>
                <?php
                    if (isset($_POST['chooseinorout'])) {
                        if($_POST['hhkinoutinput'] == 'loosein'){
                            ?>
                                <h4 class="float-end">HHK Loose In</h4>
                            <?php
                        }
                        if($_POST['hhkinoutinput'] == 'looseout'){
                            ?>
                                <h4 class="float-end">HHK Loose Out</h4>
                            <?php
                        }
                    }
                ?>
                <div class="content">
                    <?php
                    if (isset($_POST['chooseinorout'])) {
                        if($_POST['hhkinoutinput'] == 'loosein'){
                            ?>
                                <table class="table table-striped table-hover" style="margin-top: 13px;">
                                    <tr>
                                        <th>No</th>
                                        <th>Commondity</th>
                                        <th>Country</th>
                                        <th>Size</th>
                                        <th>Kg</th>
                                        <th>Pcs</th>
                                    </tr>
                                    <?php
                                    if(empty($_POST['hhkcommondityinput'])){
                                        $looseinstmt = $pdo->prepare("SELECT * FROM hhkmcstock WHERE loosein_size!=''AND loosein_kg!=''AND loosein_pcs!='0'");
                                    }else{
                                        $hhksearchcommondity = $_POST['hhkcommondityinput'];
                                        $looseinstmt = $pdo->prepare("SELECT * FROM hhkmcstock WHERE commondity_id='$hhksearchcommondity' AND loosein_size!=''AND loosein_kg!=''AND loosein_pcs!='0'");
                                    }
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
                            <?php
                        }
                    }
                    ?>
                    <?php
                    if (isset($_POST['chooseinorout'])) {
                        if($_POST['hhkinoutinput'] == 'looseout'){
                            ?>
                                <table class="table table-striped table-hover" style="margin-top: 13px;">
                                    <tr>
                                        <th>No</th>
                                        <th>Commondity</th>
                                        <th>Country</th>
                                        <th>Size</th>
                                        <th>Kg</th>
                                        <th>Pcs</th>
                                    </tr>
                                    <?php
                                    if(empty($_POST['hhkcommondityinput'])){
                                        $looseoutstmt = $pdo->prepare("SELECT * FROM hhkmcstock WHERE looseout_size!=''AND looseout_kg!=''AND looseout_pcs!='0'");
                                    }else{
                                        $hhksearchcommondity = $_POST['hhkcommondityinput'];
                                        $looseoutstmt = $pdo->prepare("SELECT * FROM hhkmcstock WHERE commondity_id='$hhksearchcommondity' AND looseout_size!=''AND looseout_kg!=''AND looseout_pcs!='0'");
                                    }
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
                            <?php
                        }
                    }
                    ?>
                </div>
                <?php
            }
            // ==================================================================
            // HHK KG REPORT
            if($_SESSION['stockreporttype'] == 'hhkkgreport'){
                ?>
                <form method="post" style="width: 450px; display: inline-flex;">
                    <div class="col-10 me-2">
                        <select name="hhkkgcommondityinput" class="form-control inpv2">
                            <option value="">Select Commondity</option>
                            <?php
                                $hhkmcstockcommonditystmt = $pdo->prepare("SELECT * FROM hhkmcstock GROUP BY commondity_id");
                                $hhkmcstockcommonditystmt->execute();
                                $hhkmcstockcommonditydatas = $hhkmcstockcommonditystmt->fetchAll();
                                foreach($hhkmcstockcommonditydatas as $hhkmcstockcommonditydata){
                                    $item_id = $hhkmcstockcommonditydata['commondity_id'];
                                    $commonditydata = $query->select('item', $item_id, 'item_id');
                                    ?>
                                    <option value="<?= $hhkmcstockcommonditydata['commondity_id']; ?>"><?= $commonditydata['item_name'];?></option>
                                    <?php
                                }
                            ?>
                        </select>
                    </div>
                    <div class="col-2">
                        <button class="btn btn-success" type="submit" name="choosekgcommondity">Select</button>
                    </div>
                </form>
                <?php
                    if (isset($_POST['choosekgcommondity'])) {
                        // if($_POST['hhkinoutinput'] == 'loosein'){
                        //     ?>
                                 <!-- <h4 class="float-end">HHK Loose In</h4> -->
                             <?php
                        // }
                        
                    }
                ?>
                <div class="content">
                    <?php
                            ?>
                                <table class="table table-striped table-hover" style="margin-top: 13px;">
                                    <tr>
                                        <th>No</th>
                                        <th>Commondity</th>
                                        <th>Country</th>
                                        <th>Size</th>
                                        <th>Kg</th>
                                        <th>Mc</th>
                                    </tr>
                                    <?php
                                    if(isset($_POST['choosekgcommondity'])){
                                        $searchcommondity = $_POST['hhkkgcommondityinput'];
                                        $stmt = $pdo->prepare("SELECT * FROM hhkmcstock WHERE commondity_id='$searchcommondity' GROUP BY commondity_id,size");
                                    }else{
                                        $stmt = $pdo->prepare("SELECT * FROM hhkmcstock WHERE particular LIKE '%from%' GROUP BY commondity_id,size");
                                    }
                                    $totalkg = 0;
                                    $stmt->execute();
                                    $datas = $stmt->fetchall();
                                    $hhkkgno = 0;
                                    foreach ($datas as $hhkstockdata) {
                                        $hhkkgno++;
                                        $item_id = $hhkstockdata['commondity_id'];
                                        $commonditydata = $query->select('item', $item_id, 'item_id');
                                        $size = $hhkstockdata['size'];
                                        $kg = $hhkstockdata['kg'];
                                        $commondity_id = $hhkstockdata['commondity_id'];
                                        $sizestmt = $pdo->prepare("SELECT * FROM hhkmcstock WHERE size='$size' ORDER BY id DESC");
                                        $sizestmt->execute();
                                        $sizedata = $sizestmt->fetch(PDO::FETCH_ASSOC);
                                        $totalmcstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM hhkmcstock WHERE size='$size' AND commondity_id='$commondity_id' AND particular NOT LIKE '%to%'");
                                        $totalmcstmt->execute();
                                        $totalmcnotsub = $totalmcstmt->fetch(PDO::FETCH_ASSOC);
                                        $totalmcsubnumstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM hhkmcstock WHERE size='$size' AND commondity_id='$commondity_id' AND particular LIKE '%to%'");
                                        $totalmcsubnumstmt->execute();
                                        $totalmcsubnum = $totalmcsubnumstmt->fetch(PDO::FETCH_ASSOC);
                                        $totalmc = $totalmcnotsub['total_mc'] - $totalmcsubnum['total_mc'];
                                        if($totalmc != 0){
                                            $totalkg = $totalkg + $hhkstockdata['kg'];
                                        }
                                    ?>
                                    <tr style="<?php if($totalmc == '0'){ echo 'display:none;'; } ?>">
                                        <td><?= $hhkkgno; ?></td>
                                        <td><?php echo $commonditydata['item_name']; ?></td>
                                        <td><?php echo $hhkstockdata['country']; ?></td>
                                        <td><?php echo $hhkstockdata['size']; ?></td>
                                        <td><?php echo $hhkstockdata['kg']; ?></td>
                                        <td><?php echo $totalmc; ?></td>
                                    </tr>
                                    <?php
                                    }
                                    if(isset($_POST['choosekgcommondity'])){              
                                        // $totalmctostmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM hhkmcstock WHERE particular LIKE '%to%' AND commondity_id='$searchcommondity'");
                                        // $totalmctostmt->execute();
                                        // $totalmcto = $totalmctostmt->fetch(PDO::FETCH_ASSOC);
                                        // $totalmcfromstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM hhkmcstock WHERE particular LIKE '%from%' AND commondity_id='$searchcommondity'");
                                        // $totalmcfromstmt->execute();
                                        // $totalmcfrom = $totalmcfromstmt->fetch(PDO::FETCH_ASSOC);
                                        
                                        // $totalmc = $totalmcfrom['total_mc'] - $totalmcto['total_mc'];
                                        
                                    }else{
                                        $totalkgstmt = $pdo->prepare("SELECT SUM(kg) AS total_kg FROM hhkmcstock WHERE particular LIKE '%to%' AND mc!='0'");
                                        $totalkgstmt->execute();
                                        $totalkg = $totalkgstmt->fetch(PDO::FETCH_ASSOC);
    
                                        $totalkg = $totalkg['total_kg'];
    
                                        $totalmctostmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM hhkmcstock WHERE particular LIKE '%to%'");
                                        $totalmctostmt->execute();
                                        $totalmcto = $totalmctostmt->fetch(PDO::FETCH_ASSOC);
                                        $totalmcfromstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM hhkmcstock WHERE particular LIKE '%from%'");
                                        $totalmcfromstmt->execute();
                                        $totalmcfrom = $totalmcfromstmt->fetch(PDO::FETCH_ASSOC);
    
                                        $totalmc = $totalmcfrom['total_mc'] - $totalmcto['total_mc'];
                                    }
                                    ?>
                                    <tr style="font-weight:bold;">
                                        <td colspan="4">Total:</td>
                                        <td><?php if(str_contains('-', $totalkg)){ echo '0'; }else{ echo $totalkg; }; ?></td>
                                        <td><?php if(str_contains('-', $totalmc)){ echo '0'; }else{ echo $totalmc; }; ?></td>
                                    </tr>
                                </table>
                            <?php
                    ?>
                </div>
                <?php
            }
            
        }
    ?>
</body>
</html>