<?php

include '../../Controllers/query.ctr.php';
$query = new Query();

$firstPart = strval($_POST['FirstPart']);
if(!empty($_POST['LastPart'])){
  $lastPart = json_decode($_POST['LastPart']);
}else{
  $lastPart = "";
}

$ac_code = $firstPart . '/' . $lastPart;
$data = $query->select('acname', $ac_code, 'code_no');

if(!empty($data['ac_name']))
{
  $ac_name = $data['ac_name'];
}else
{
  $ac_name = '';
}
echo '<input type="text" name="addac_name" disabled class="form-control inpv2 mb-1" value="'. $ac_name .'" style="padding-top: 2px; padding-bottom: 2px;">';

 ?>
