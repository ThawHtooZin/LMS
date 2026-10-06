    <?php
        $stockReportType = $stockReportType ?? ($_SESSION['stockreporttype'] ?? null);
        $reportFormAction = 'mainstockreport.php?type=' . urlencode((string)$stockReportType);

        if (!empty($stockReportType)) {
            if ($stockReportType === 'mcreport') {
                ?>
                <p class="mb-3">View HHK / GFC MC stock by country, fish type, and commodity.</p>
                <a href="stockreport.php" class="btn btn-primary">Open Mc Report</a>
                <?php
            }
            // ================================================
            // HHK Loose Report
            if($stockReportType == 'hhkloosereport'){
                ?>
                <form method="post" action="<?= htmlspecialchars($reportFormAction); ?>" class="row g-2 align-items-end stock-report-filter mb-3">
                    <div class="col-md-5">
                        <select name="hhkcommondityinput" class="form-control inpv2">
                            <option value="">Select Commondity</option>
                            <?php
                                $hhkmcstockcommonditystmt = $pdo->prepare("SELECT * FROM hhkmcstock WHERE loosein_size!='' OR loosein_kg!='' OR loosein_pcs!='0' OR looseout_size!='' AND looseout_kg!='' OR looseout_pcs!='0' GROUP BY commondity_id");
                                $hhkmcstockcommonditystmt->execute();
                                $hhkmcstockcommonditydatas = $hhkmcstockcommonditystmt->fetchAll();
                                foreach($hhkmcstockcommonditydatas as $hhkmcstockcommonditydata){
                                    $item_id = $hhkmcstockcommonditydata['commondity_id'];
                                    $commonditydata = $query->select('products', $item_id, 'id');
                                    ?>
                                    <option value="<?= $hhkmcstockcommonditydata['commondity_id']; ?>"><?= $commonditydata['name'];?></option>
                                    <?php
                                }
                            ?>
                        </select>
                    </div>
                    <div class="col-md-5">
                        <select name="hhkinoutinput" class="form-control inpv2">
                            <option value="">Select Loose In Or Out</option>
                            <option value="loosein">Loose In</option>
                            <option value="looseout">Loose Out</option>
                        </select>
                    </div>
                    <div class="col-md-auto">
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
                                <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover stock-report-table w-100 mb-0">
                                    <thead><tr>
                                        <th>No</th>
                                        <th>Commondity</th>
                                        <th>Country</th>
                                        <th>Size</th>
                                        <th class="text-end">Kg</th>
                                        <th class="text-end">Pcs</th>
                                    </tr></thead><tbody>
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
                                    $commonditydata = $query->select('products', $item_id, 'id');
                                    ?>
                                    <tr>
                                        <td><?= $looseinno; ?></td>
                                        <td><?= $commonditydata['name']; ?></td>
                                        <td><?= $looseindata['country']; ?></td>
                                        <td><?= $looseindata['loosein_size']; ?></td>
                                        <td><?= $looseindata['loosein_kg']; ?></td>
                                        <td><?= $looseindata['loosein_pcs']; ?></td>
                                    </tr>
                                    <?php                                    
                                    }
                                    ?>
                                </tbody></table>
                                </div>
                            <?php
                        }
                    }
                    ?>
                    <?php
                    if (isset($_POST['chooseinorout'])) {
                        if($_POST['hhkinoutinput'] == 'looseout'){
                            ?>
                                <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover stock-report-table w-100 mb-0">
                                    <thead><tr>
                                        <th>No</th>
                                        <th>Commondity</th>
                                        <th>Country</th>
                                        <th>Size</th>
                                        <th class="text-end">Kg</th>
                                        <th class="text-end">Pcs</th>
                                    </tr></thead><tbody>
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
                                    $commonditydata = $query->select('products', $item_id, 'id');
                                    ?>
                                    <tr>
                                        <td><?= $looseoutno; ?></td>
                                        <td><?= $commonditydata['name']; ?></td>
                                        <td><?= $looseoutdata['country']; ?></td>
                                        <td><?= $looseoutdata['looseout_size']; ?></td>
                                        <td><?= $looseoutdata['looseout_kg']; ?></td>
                                        <td><?= $looseoutdata['looseout_pcs']; ?></td>
                                    </tr>
                                    <?php                                    
                                    }
                                    ?>
                                </tbody></table>
                                </div>
                            <?php
                        }
                    }
                    ?>
                </div>
                <?php
            }
            // ==================================================================
            // HHK KG REPORT
            if($stockReportType == 'hhkkgreport'){
                ?>
                <form method="post" action="<?= htmlspecialchars($reportFormAction); ?>" class="row g-2 align-items-end stock-report-filter mb-3">
                    <div class="col-md-10">
                        <select name="hhkkgcommondityinput" class="form-control inpv2">
                            <option value="">Select Commondity</option>
                            <?php
                                $hhkmcstockcommonditystmt = $pdo->prepare("SELECT * FROM hhkmcstock GROUP BY commondity_id");
                                $hhkmcstockcommonditystmt->execute();
                                $hhkmcstockcommonditydatas = $hhkmcstockcommonditystmt->fetchAll();
                                foreach($hhkmcstockcommonditydatas as $hhkmcstockcommonditydata){
                                    $item_id = $hhkmcstockcommonditydata['commondity_id'];
                                    $commonditydata = $query->select('products', $item_id, 'id');
                                    ?>
                                    <option value="<?= $hhkmcstockcommonditydata['commondity_id']; ?>"><?= $commonditydata['name'];?></option>
                                    <?php
                                }
                            ?>
                        </select>
                    </div>
                    <div class="col-md-auto">
                        <button class="btn btn-success" type="submit" name="choosekgcommondity">Select</button>
                    </div>
                </form>
                <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover stock-report-table w-100 mb-0">
                                    <thead><tr>
                                        <th>No</th>
                                        <th>Commondity</th>
                                        <th>Country</th>
                                        <th>Size</th>
                                        <th class="text-end">Kg</th>
                                        <th class="text-end">Mc</th>
                                    </tr></thead>
                                    <tbody>
                                    <?php
                                    if(isset($_POST['choosekgcommondity']) && $_POST['hhkkgcommondityinput'] !== ''){
                                        $searchcommondity = $_POST['hhkkgcommondityinput'];
                                        $stmt = $pdo->prepare("SELECT * FROM hhkmcstock WHERE commondity_id='$searchcommondity' GROUP BY commondity_id,size");
                                    }else{
                                        $stmt = $pdo->prepare("SELECT * FROM hhkmcstock WHERE particular LIKE '%from%' GROUP BY commondity_id,size");
                                    }
                                    $sumDisplayKg = 0;
                                    $sumDisplayMc = 0;
                                    $stmt->execute();
                                    $datas = $stmt->fetchall();
                                    $hhkkgno = 0;
                                    foreach ($datas as $hhkstockdata) {
                                        $item_id = $hhkstockdata['commondity_id'];
                                        $commonditydata = $query->select('products', $item_id, 'id');
                                        $size = $hhkstockdata['size'];
                                        $commondity_id = $hhkstockdata['commondity_id'];
                                        $totalmcstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM hhkmcstock WHERE size='$size' AND commondity_id='$commondity_id' AND particular NOT LIKE '%to%'");
                                        $totalmcstmt->execute();
                                        $totalmcnotsub = $totalmcstmt->fetch(PDO::FETCH_ASSOC);
                                        $totalmcsubnumstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM hhkmcstock WHERE size='$size' AND commondity_id='$commondity_id' AND particular LIKE '%to%'");
                                        $totalmcsubnumstmt->execute();
                                        $totalmcsubnum = $totalmcsubnumstmt->fetch(PDO::FETCH_ASSOC);
                                        $rowMc = (float)$totalmcnotsub['total_mc'] - (float)$totalmcsubnum['total_mc'];
                                        if ($rowMc == 0) {
                                            continue;
                                        }
                                        $hhkkgno++;
                                        $sumDisplayKg += (float)$hhkstockdata['kg'];
                                        $sumDisplayMc += $rowMc;
                                    ?>
                                    <tr>
                                        <td><?= $hhkkgno; ?></td>
                                        <td><?php echo htmlspecialchars($commonditydata['name'] ?? ''); ?></td>
                                        <td><?php echo htmlspecialchars($hhkstockdata['country']); ?></td>
                                        <td><?php echo htmlspecialchars($hhkstockdata['size']); ?></td>
                                        <td class="text-end"><?php echo htmlspecialchars((string)$hhkstockdata['kg']); ?></td>
                                        <td class="text-end"><?php echo $rowMc; ?></td>
                                    </tr>
                                    <?php
                                    }
                                    ?>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td colspan="4" class="text-end">Total:</td>
                                        <td class="text-end"><?= $sumDisplayKg; ?></td>
                                        <td class="text-end"><?= $sumDisplayMc; ?></td>
                                    </tr>
                                    </tfoot>
                                </table>
                </div>
                <?php
            }
            // ================================================
            // GFC Loose Report
            if($stockReportType == 'gfcloosereport'){
                ?>
                <form method="post" action="<?= htmlspecialchars($reportFormAction); ?>" class="row g-2 align-items-end stock-report-filter mb-3">
                    <div class="col-md-5">
                        <select name="gfccommondityinput" class="form-control inpv2">
                            <option value="">Select Commondity</option>
                            <?php
                                $gfcmcstockcommonditystmt = $pdo->prepare("SELECT * FROM gfcmcstock WHERE loosein_size!='' OR loosein_kg!='' OR loosein_pcs!='0' OR looseout_size!='' AND looseout_kg!='' OR looseout_pcs!='0' GROUP BY commondity_id");
                                $gfcmcstockcommonditystmt->execute();
                                $gfcmcstockcommonditydatas = $gfcmcstockcommonditystmt->fetchAll();
                                foreach($gfcmcstockcommonditydatas as $gfcmcstockcommonditydata){
                                    $item_id = $gfcmcstockcommonditydata['commondity_id'];
                                    $commonditydata = $query->select('products', $item_id, 'id');
                                    ?>
                                    <option value="<?= $gfcmcstockcommonditydata['commondity_id']; ?>"><?= $commonditydata['name'];?></option>
                                    <?php
                                }
                            ?>
                        </select>
                    </div>
                    <div class="col-md-5">
                        <select name="gfcinoutinput" class="form-control inpv2">
                            <option value="">Select Loose In Or Out</option>
                            <option value="loosein">Loose In</option>
                            <option value="looseout">Loose Out</option>
                        </select>
                    </div>
                    <div class="col-md-auto">
                        <button class="btn btn-success" type="submit" name="chooseinorout">Select</button>
                    </div>
                </form>
                <?php
                    if (isset($_POST['chooseinorout'])) {
                        if($_POST['gfcinoutinput'] == 'loosein'){
                            ?>
                                <h5 class="mb-2">GFC Loose In</h5>
                            <?php
                        }
                        if($_POST['gfcinoutinput'] == 'looseout'){
                            ?>
                                <h5 class="mb-2">GFC Loose Out</h5>
                            <?php
                        }
                    }
                ?>
                <div class="content">
                    <?php
                    if (isset($_POST['chooseinorout'])) {
                        if($_POST['gfcinoutinput'] == 'loosein'){
                            ?>
                                <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover stock-report-table w-100 mb-0">
                                    <thead><tr>
                                        <th>No</th>
                                        <th>Commondity</th>
                                        <th>Country</th>
                                        <th>Size</th>
                                        <th class="text-end">Kg</th>
                                        <th class="text-end">Pcs</th>
                                    </tr></thead><tbody>
                                    <?php
                                    if(empty($_POST['gfccommondityinput'])){
                                        $looseinstmt = $pdo->prepare("SELECT * FROM gfcmcstock WHERE loosein_size!=''AND loosein_kg!=''AND loosein_pcs!='0'");
                                    }else{
                                        $gfcsearchcommondity = $_POST['gfccommondityinput'];
                                        $looseinstmt = $pdo->prepare("SELECT * FROM gfcmcstock WHERE commondity_id='$gfcsearchcommondity' AND loosein_size!=''AND loosein_kg!=''AND loosein_pcs!='0'");
                                    }
                                    $looseinstmt->execute();
                                    $looseindatas = $looseinstmt->fetchAll();
                                    $looseinno = 0;
                                    foreach($looseindatas as $looseindata){
                                    $looseinno++;
                                    $item_id = $looseindata['commondity_id'];
                                    $commonditydata = $query->select('products', $item_id, 'id');
                                    ?>
                                    <tr>
                                        <td><?= $looseinno; ?></td>
                                        <td><?= $commonditydata['name']; ?></td>
                                        <td><?= $looseindata['country']; ?></td>
                                        <td><?= $looseindata['loosein_size']; ?></td>
                                        <td><?= $looseindata['loosein_kg']; ?></td>
                                        <td><?= $looseindata['loosein_pcs']; ?></td>
                                    </tr>
                                    <?php                                    
                                    }
                                    ?>
                                </tbody></table>
                                </div>
                            <?php
                        }
                    }
                    ?>
                    <?php
                    if (isset($_POST['chooseinorout'])) {
                        if($_POST['gfcinoutinput'] == 'looseout'){
                            ?>
                                <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover stock-report-table w-100 mb-0">
                                    <thead><tr>
                                        <th>No</th>
                                        <th>Commondity</th>
                                        <th>Country</th>
                                        <th>Size</th>
                                        <th class="text-end">Kg</th>
                                        <th class="text-end">Pcs</th>
                                    </tr></thead><tbody>
                                    <?php
                                    if(empty($_POST['gfccommondityinput'])){
                                        $looseoutstmt = $pdo->prepare("SELECT * FROM gfcmcstock WHERE looseout_size!=''AND looseout_kg!=''AND looseout_pcs!='0'");
                                    }else{
                                        $gfcsearchcommondity = $_POST['gfccommondityinput'];
                                        $looseoutstmt = $pdo->prepare("SELECT * FROM gfcmcstock WHERE commondity_id='$gfcsearchcommondity' AND looseout_size!=''AND looseout_kg!=''AND looseout_pcs!='0'");
                                    }
                                    $looseoutstmt->execute();
                                    $looseoutdatas = $looseoutstmt->fetchAll();
                                    $looseoutno = 0;
                                    foreach($looseoutdatas as $looseoutdata){
                                    $looseoutno++;
                                    $item_id = $looseoutdata['commondity_id'];
                                    $commonditydata = $query->select('products', $item_id, 'id');
                                    ?>
                                    <tr>
                                        <td><?= $looseoutno; ?></td>
                                        <td><?= $commonditydata['name']; ?></td>
                                        <td><?= $looseoutdata['country']; ?></td>
                                        <td><?= $looseoutdata['looseout_size']; ?></td>
                                        <td><?= $looseoutdata['looseout_kg']; ?></td>
                                        <td><?= $looseoutdata['looseout_pcs']; ?></td>
                                    </tr>
                                    <?php                                    
                                    }
                                    ?>
                                </tbody></table>
                                </div>
                            <?php
                        }
                    }
                    ?>
                </div>
                <?php
            }
            // ==================================================================
            // gfc KG REPORT
            if($stockReportType == 'gfckgreport'){
                ?>
                <form method="post" action="<?= htmlspecialchars($reportFormAction); ?>" class="row g-2 align-items-end stock-report-filter mb-3">
                    <div class="col-md-10">
                        <select name="gfckgcommondityinput" class="form-control inpv2">
                            <option value="">Select Commondity</option>
                            <?php
                                $gfcmcstockcommonditystmt = $pdo->prepare("SELECT * FROM gfcmcstock GROUP BY commondity_id");
                                $gfcmcstockcommonditystmt->execute();
                                $gfcmcstockcommonditydatas = $gfcmcstockcommonditystmt->fetchAll();
                                foreach($gfcmcstockcommonditydatas as $gfcmcstockcommonditydata){
                                    $item_id = $gfcmcstockcommonditydata['commondity_id'];
                                    $commonditydata = $query->select('products', $item_id, 'id');
                                    ?>
                                    <option value="<?= $gfcmcstockcommonditydata['commondity_id']; ?>"><?= $commonditydata['name'];?></option>
                                    <?php
                                }
                            ?>
                        </select>
                    </div>
                    <div class="col-md-auto">
                        <button class="btn btn-success" type="submit" name="choosekgcommondity">Select</button>
                    </div>
                </form>
                <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover stock-report-table w-100 mb-0">
                                    <thead><tr>
                                        <th>No</th>
                                        <th>Commondity</th>
                                        <th>Country</th>
                                        <th>Size</th>
                                        <th class="text-end">Kg</th>
                                        <th class="text-end">Mc</th>
                                    </tr></thead>
                                    <tbody>
                                    <?php
                                    if(isset($_POST['choosekgcommondity']) && $_POST['gfckgcommondityinput'] !== ''){
                                        $searchcommondity = $_POST['gfckgcommondityinput'];
                                        $stmt = $pdo->prepare("SELECT * FROM gfcmcstock WHERE commondity_id='$searchcommondity' GROUP BY commondity_id,size");
                                    }else{
                                        $stmt = $pdo->prepare("SELECT * FROM gfcmcstock WHERE particular LIKE '%to%' GROUP BY commondity_id,size");
                                    }
                                    $sumDisplayKg = 0;
                                    $sumDisplayMc = 0;
                                    $stmt->execute();
                                    $datas = $stmt->fetchall();
                                    $gfckgno = 0;
                                    foreach ($datas as $gfcstockdata) {
                                        $item_id = $gfcstockdata['commondity_id'];
                                        $commonditydata = $query->select('products', $item_id, 'id');
                                        $size = $gfcstockdata['size'];
                                        $commondity_id = $gfcstockdata['commondity_id'];
                                        $totalmcstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM gfcmcstock WHERE size='$size' AND commondity_id='$commondity_id' AND particular='HHK to GFC'");
                                        $totalmcstmt->execute();
                                        $totalmcnotsub = $totalmcstmt->fetch(PDO::FETCH_ASSOC);
                                        $totalmcsubnumstmt = $pdo->prepare("SELECT SUM(mc) AS total_mc FROM gfcmcstock WHERE size='$size' AND commondity_id='$commondity_id' AND particular!='HHK to GFC'");
                                        $totalmcsubnumstmt->execute();
                                        $totalmcsubnum = $totalmcsubnumstmt->fetch(PDO::FETCH_ASSOC);
                                        $rowMc = (float)$totalmcnotsub['total_mc'] - (float)$totalmcsubnum['total_mc'];
                                        if ($rowMc == 0) {
                                            continue;
                                        }
                                        $gfckgno++;
                                        $sumDisplayKg += (float)$gfcstockdata['kg'];
                                        $sumDisplayMc += $rowMc;
                                    ?>
                                    <tr>
                                        <td><?= $gfckgno; ?></td>
                                        <td><?php echo htmlspecialchars($commonditydata['name'] ?? ''); ?></td>
                                        <td><?php echo htmlspecialchars($gfcstockdata['country']); ?></td>
                                        <td><?php echo htmlspecialchars($gfcstockdata['size']); ?></td>
                                        <td class="text-end"><?php echo htmlspecialchars((string)$gfcstockdata['kg']); ?></td>
                                        <td class="text-end"><?php echo $rowMc; ?></td>
                                    </tr>
                                    <?php
                                    }
                                    ?>
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <td colspan="4" class="text-end">Total:</td>
                                        <td class="text-end"><?= $sumDisplayKg; ?></td>
                                        <td class="text-end"><?= $sumDisplayMc; ?></td>
                                    </tr>
                                    </tfoot>
                                </table>
                </div>
                <?php
            }
        } else {
            echo '<p class="text-muted mb-0">Unknown or missing report type. Use Back and choose a report from the menu.</p>';
        }
    ?>