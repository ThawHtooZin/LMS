<?php
include '../../Controllers/query.ctr.php';

$commondityid = $_POST['commondityid'] ?? 0;

// 1. Get the product to find its product type relationship
$stmt = $pdo->prepare("SELECT * FROM products WHERE id = ?");
$stmt->execute([$commondityid]);
$product = $stmt->fetch(PDO::FETCH_ASSOC);

$rate_val = 0;

if ($product) {
    // Looks up the rate using the product type ID linked to the product
    $type_id = $product['product_type_id'] ?? 0;

    $typeStmt = $pdo->prepare("SELECT rate FROM product_types WHERE id = ?");
    $typeStmt->execute([$type_id]);
    $typeData = $typeStmt->fetch(PDO::FETCH_ASSOC);

    if ($typeData && isset($typeData['rate'])) {
        $rate_val = $typeData['rate'];
    }
}

echo '<input type="text" disabled class="form-control inpv2" value="' . htmlspecialchars($rate_val) . '">';
echo '<input type="hidden" name="processingrate" value="' . htmlspecialchars($rate_val) . '">';
