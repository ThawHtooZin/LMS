<?php
include '../../Controllers/query.ctr.php';

$commondityid = $_POST['commondityid'] ?? 0;
// Updated to query the unified products table using 'id'
$stmt = $pdo->prepare("SELECT * FROM products WHERE id = ?");
$stmt->execute([$commondityid]);
$product = $stmt->fetch(PDO::FETCH_ASSOC);

// Fallback to 0 if no rate or record is found
$rate_val = $product['rate'] ?? 0;

echo '<input type="text" disabled class="form-control inpv2" value="' . htmlspecialchars($rate_val) . '">';
echo '<input type="hidden" name="processingrate" value="' . htmlspecialchars($rate_val) . '">';
