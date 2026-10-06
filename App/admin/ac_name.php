<?php

include '../../Controllers/query.ctr.php';
$query = new Query();

$firstPart = strval($_POST['FirstPart'] ?? '');
$lastPart = '';
if (!empty($_POST['LastPart'])) {
  $decoded = json_decode($_POST['LastPart']);
  $lastPart = is_string($decoded) ? $decoded : '';
}

$type = $_POST['Type'] ?? '';
if ($type === 'slash' && $lastPart !== '') {
  $ac_code = $firstPart . '/' . $lastPart;
} elseif ($type === 'dash' && $lastPart !== '') {
  $ac_code = $firstPart . '-' . $lastPart;
} else {
  $ac_code = trim($firstPart);
}

$data = $query->select('acname', $ac_code, 'code_no');
$ac_name = !empty($data['ac_name']) ? $data['ac_name'] : '';

echo '<input type="text" name="addac_name" id="ac_nameinput" disabled class="form-control inpv2 mb-1" value="' . htmlspecialchars($ac_name, ENT_QUOTES, 'UTF-8') . '">';
