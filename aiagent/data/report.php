<?php

session_start();
header('Content-Type: application/json; charset=utf-8');

require_once __DIR__ . '/../../Controllers/database.db.php';

if (empty($_SESSION['username']) || empty($_SESSION['logged_in']) || empty($_SESSION['role'])) {
    http_response_code(401);
    echo json_encode(['error' => 'Login required']);
    exit;
}

$raw = file_get_contents('php://input');
$body = json_decode($raw ?: '{}', true);
if (!is_array($body)) {
    $body = [];
}

$report = trim((string)($body['report'] ?? ''));
$permissions = [
    'purchase' => 'purchase_report',
    'payable' => 'payable_report',
    'stock' => 'manage_stockreport',
    'general_ledger' => 'manage_generalledger',
    'packing_warehouse' => 'packing_material_report',
    'packing_gatepass' => 'packing_material_report',
    'profit_and_loss' => 'profit_loss_report',
];

if (!isset($permissions[$report])) {
    http_response_code(400);
    echo json_encode(['error' => 'Unknown report']);
    exit;
}

if ((int)$_SESSION['role'] !== 1 && !roleHas($pdo, $_SESSION['role'], $permissions[$report])) {
    http_response_code(403);
    echo json_encode(['error' => 'This login cannot open that report']);
    exit;
}

try {
    $tables = match ($report) {
        'purchase' => [purchaseReport($pdo, $body)],
        'payable' => [payableReport($pdo, $body)],
        'stock' => stockReport($pdo, $body),
        'general_ledger' => [generalLedgerReport($pdo, $body)],
        'packing_warehouse' => [warehouseReport($pdo, $body)],
        'packing_gatepass' => [gatepassReport($pdo, $body)],
        'profit_and_loss' => [profitAndLossReport($pdo, $body)],
    };
    echo json_encode(['tables' => $tables], JSON_UNESCAPED_UNICODE);
} catch (Throwable $e) {
    http_response_code(500);
    echo json_encode(['error' => $e->getMessage()]);
}

function roleHas(PDO $pdo, $roleId, string $needle): bool
{
    $stmt = $pdo->prepare('SELECT permission FROM permission WHERE role_id = ? LIMIT 1');
    $stmt->execute([$roleId]);
    $permission = (string)$stmt->fetchColumn();
    return $permission !== '' && str_contains($permission, $needle);
}

function field(array $body, string $key): string
{
    return trim((string)($body[$key] ?? ''));
}

function productMap(PDO $pdo): array
{
    $map = [];
    foreach ($pdo->query('SELECT id, name, unit FROM products')->fetchAll(PDO::FETCH_ASSOC) as $row) {
        $map[(string)$row['id']] = $row;
    }
    return $map;
}

function contactMap(PDO $pdo): array
{
    $map = [];
    foreach ($pdo->query('SELECT id, name, contact_type FROM contacts')->fetchAll(PDO::FETCH_ASSOC) as $row) {
        $map[(string)$row['id']] = $row;
    }
    return $map;
}

function productIdsByName(PDO $pdo, string $name): array
{
    if ($name === '') {
        return [];
    }
    $stmt = $pdo->prepare('SELECT id FROM products WHERE name LIKE ?');
    $stmt->execute(['%' . $name . '%']);
    return array_map('strval', $stmt->fetchAll(PDO::FETCH_COLUMN));
}

function num($value): float
{
    return (float)($value ?? 0);
}

function cols(array $pairs): array
{
    $columns = [];
    foreach ($pairs as $key => $label) {
        $columns[] = ['key' => $key, 'label' => $label];
    }
    return $columns;
}

function table(string $title, array $columns, array $rows, array $filters): array
{
    return [
        'title' => $title,
        'columns' => $columns,
        'rows' => array_values($rows),
        'row_count' => count($rows),
        'filters' => $filters,
    ];
}

function purchaseReport(PDO $pdo, array $body): array
{
    $sql = "SELECT pl.product_id, pl.size, pl.viss, pl.pcs, pl.unit_price, pl.line_amount,
                   p.date, p.voucher_no, p.tclfrozen, p.status, p.contact_id
            FROM purchase_lines pl
            JOIN purchases p ON pl.purchase_id = p.id
            WHERE 1 = 1";
    $params = [];
    $filters = [];

    $from = field($body, 'date_from');
    $to = field($body, 'date_to');
    if ($from !== '' && $to !== '') {
        $sql .= ' AND p.date BETWEEN ? AND ?';
        array_push($params, $from, $to);
        $filters['date'] = $from . ' to ' . $to;
    } elseif ($from !== '') {
        $sql .= ' AND p.date >= ?';
        $params[] = $from;
        $filters['date_from'] = $from;
    } elseif ($to !== '') {
        $sql .= ' AND p.date <= ?';
        $params[] = $to;
        $filters['date_to'] = $to;
    }

    $supplier = field($body, 'supplier');
    if ($supplier !== '') {
        $sql .= ' AND p.contact_id IN (SELECT id FROM contacts WHERE name LIKE ?)';
        $params[] = '%' . $supplier . '%';
        $filters['supplier'] = $supplier;
    }

    $commodity = field($body, 'commodity');
    if ($commodity !== '') {
        $ids = productIdsByName($pdo, $commodity);
        if ($ids === []) {
            $sql .= ' AND 1 = 0';
        } else {
            $sql .= ' AND pl.product_id IN (' . implode(',', array_fill(0, count($ids), '?')) . ')';
            $params = array_merge($params, $ids);
        }
        $filters['commodity'] = $commodity;
    }

    $voucher = field($body, 'voucher_no');
    if ($voucher !== '') {
        $sql .= ' AND p.voucher_no = ?';
        $params[] = $voucher;
        $filters['voucher_no'] = $voucher;
    }

    $size = field($body, 'size');
    if ($size !== '') {
        $sql .= ' AND pl.size = ?';
        $params[] = $size;
        $filters['size'] = $size;
    }

    $sql .= ' ORDER BY p.date ASC, p.id ASC, pl.id ASC';
    $stmt = $pdo->prepare($sql);
    $stmt->execute($params);
    $products = productMap($pdo);
    $contacts = contactMap($pdo);
    $rows = [];
    foreach ($stmt->fetchAll(PDO::FETCH_ASSOC) as $line) {
        $viss = num($line['viss']);
        $rows[] = [
            'date' => $line['date'],
            'voucher_no' => $line['voucher_no'],
            'type' => $line['tclfrozen'],
            'status' => $line['status'],
            'supplier' => $contacts[(string)$line['contact_id']]['name'] ?? 'Unknown',
            'commodity' => $products[(string)$line['product_id']]['name'] ?? 'Unknown',
            'size' => $line['size'],
            'viss' => $viss,
            'kg' => round($viss * 1.634, 3),
            'pcs' => num($line['pcs']),
            'price' => num($line['unit_price']),
            'amount' => num($line['line_amount']),
        ];
    }

    return table(
        'Purchase Report',
        cols([
            'date' => 'Date',
            'voucher_no' => 'Voucher No',
            'type' => 'Type',
            'status' => 'Status',
            'supplier' => 'Supplier',
            'commodity' => 'Commodity',
            'size' => 'Size',
            'viss' => 'Viss',
            'kg' => 'Kg',
            'pcs' => 'Pcs',
            'price' => 'Price',
            'amount' => 'Amount',
        ]),
        $rows,
        $filters
    );
}

function payableReport(PDO $pdo, array $body): array
{
    $from = field($body, 'date_from');
    $to = field($body, 'date_to');
    if ($from === '') {
        $from = '1900-01-01';
    }
    if ($to === '') {
        $to = date('Y-m-d');
    }
    $type = field($body, 'supplier_type');
    $categories = [
        'Fish Supplier' => 'Payable for Supplier',
        'Material Supplier' => 'Materials',
        'Cold Store Factory' => 'Cold Store Charges Balance',
    ];
    if ($type !== '' && $type !== 'All' && isset($categories[$type])) {
        $categories = [$type => $categories[$type]];
    }

    $rows = [];
    $contactStmt = $pdo->prepare('SELECT id, name FROM contacts WHERE contact_type = ? ORDER BY name ASC');
    $openPur = $pdo->prepare("SELECT COALESCE(SUM(grand_total), 0) FROM purchases WHERE contact_id = ? AND date < ? AND status IN ('AWAITING_PAYMENT', 'PAID')");
    $openPay = $pdo->prepare('SELECT COALESCE(SUM(pp.amount), 0) FROM purchase_payments pp JOIN purchases p ON pp.purchase_id = p.id WHERE p.contact_id = ? AND pp.payment_date < ?');
    $addStmt = $pdo->prepare("SELECT COALESCE(SUM(grand_total), 0) FROM purchases WHERE contact_id = ? AND date BETWEEN ? AND ? AND status IN ('AWAITING_PAYMENT', 'PAID')");
    $paidStmt = $pdo->prepare('SELECT COALESCE(SUM(pp.amount), 0) FROM purchase_payments pp JOIN purchases p ON pp.purchase_id = p.id WHERE p.contact_id = ? AND pp.payment_date BETWEEN ? AND ?');

    foreach ($categories as $dbType => $title) {
        $contactStmt->execute([$dbType]);
        foreach ($contactStmt->fetchAll(PDO::FETCH_ASSOC) as $contact) {
            $id = $contact['id'];
            $openPur->execute([$id, $from]);
            $openPay->execute([$id, $from]);
            $opening = num($openPur->fetchColumn()) - num($openPay->fetchColumn());
            $addStmt->execute([$id, $from, $to]);
            $paidStmt->execute([$id, $from, $to]);
            $add = num($addStmt->fetchColumn());
            $paid = num($paidStmt->fetchColumn());
            $rows[] = [
                'supplier_type' => $title,
                'name' => $contact['name'],
                'opening' => $opening,
                'add_amt' => $add,
                'paid_amt' => $paid,
                'balance' => ($opening + $add) - $paid,
            ];
        }
    }

    $filters = ['date' => $from . ' to ' . $to];
    if ($type !== '') {
        $filters['supplier_type'] = $type;
    }

    return table(
        'Payable Report',
        cols([
            'supplier_type' => 'Supplier Type',
            'name' => 'Name',
            'opening' => 'Opening Balance',
            'add_amt' => 'Add Amt',
            'paid_amt' => 'Paid Amt',
            'balance' => 'Balance',
        ]),
        $rows,
        $filters
    );
}

function stockReport(PDO $pdo, array $body): array
{
    $view = field($body, 'stock_view');
    $views = [
        'hhk_loose' => 'HHK Loose',
        'hhk_balance' => 'HHK Balance',
        'gfc_loose' => 'GFC Loose',
        'gfc_balance' => 'GFC Balance',
        'mc' => 'Mc Report',
    ];
    if ($view === '' || !isset($views[$view])) {
        throw new RuntimeException('stock_view must be hhk_loose, hhk_balance, gfc_loose, gfc_balance, or mc');
    }
    if ($view === 'mc') {
        return [mcReport($pdo, $body)];
    }
    if (str_ends_with($view, '_loose')) {
        $tableName = str_starts_with($view, 'hhk') ? 'hhkmcstock' : 'gfcmcstock';
        return [looseReport($pdo, $body, $tableName, $views[$view])];
    }
    $tableName = str_starts_with($view, 'hhk') ? 'hhkmcstock' : 'gfcmcstock';
    $mode = str_starts_with($view, 'hhk') ? 'hhk' : 'gfc';
    return [balanceReport($pdo, $body, $tableName, $mode, $views[$view])];
}

function stockFilters(PDO $pdo, array $body, string $alias = ''): array
{
    $prefix = $alias === '' ? '' : $alias . '.';
    $sql = '';
    $params = [];
    $filters = [];
    $from = field($body, 'date_from');
    $to = field($body, 'date_to');
    if ($from !== '' && $to !== '') {
        $sql .= " AND {$prefix}date BETWEEN ? AND ?";
        array_push($params, $from, $to);
        $filters['date'] = $from . ' to ' . $to;
    }
    $country = field($body, 'country');
    if ($country !== '') {
        $sql .= " AND {$prefix}country = ?";
        $params[] = $country;
        $filters['country'] = $country;
    }
    $fish = field($body, 'fish_type');
    if ($fish !== '') {
        $sql .= " AND {$prefix}fish_type = ?";
        $params[] = $fish;
        $filters['fish_type'] = $fish;
    }
    $commodity = field($body, 'commodity');
    if ($commodity !== '') {
        $ids = productIdsByName($pdo, $commodity);
        if ($ids === []) {
            $sql .= ' AND 1 = 0';
        } else {
            $sql .= " AND {$prefix}commondity_id IN (" . implode(',', array_fill(0, count($ids), '?')) . ')';
            $params = array_merge($params, $ids);
        }
        $filters['commodity'] = $commodity;
    }
    return [$sql, $params, $filters];
}

function looseReport(PDO $pdo, array $body, string $tableName, string $title): array
{
    [$extra, $params, $filters] = stockFilters($pdo, $body);
    $direction = field($body, 'direction');
    $stmt = $pdo->prepare("SELECT * FROM {$tableName} WHERE 1 = 1 {$extra} ORDER BY date ASC, id ASC");
    $stmt->execute($params);
    $products = productMap($pdo);
    $rows = [];
    foreach ($stmt->fetchAll(PDO::FETCH_ASSOC) as $line) {
        $name = $products[(string)$line['commondity_id']]['name'] ?? 'Unknown';
        $base = [
            'date' => $line['date'] ?? '',
            'commodity' => $name,
            'country' => $line['country'] ?? '',
            'fish_type' => $line['fish_type'] ?? '',
        ];
        $hasIn = trim((string)($line['loosein_size'] ?? '')) !== '' || num($line['loosein_kg'] ?? 0) != 0 || num($line['loosein_pcs'] ?? 0) != 0;
        $hasOut = trim((string)($line['looseout_size'] ?? '')) !== '' || num($line['looseout_kg'] ?? 0) != 0 || num($line['looseout_pcs'] ?? 0) != 0;
        if ($hasIn && $direction !== 'looseout') {
            $rows[] = $base + [
                'direction' => 'Loose In',
                'size' => $line['loosein_size'] ?? '',
                'kg' => num($line['loosein_kg'] ?? 0),
                'pcs' => num($line['loosein_pcs'] ?? 0),
            ];
        }
        if ($hasOut && $direction !== 'loosein') {
            $rows[] = $base + [
                'direction' => 'Loose Out',
                'size' => $line['looseout_size'] ?? '',
                'kg' => num($line['looseout_kg'] ?? 0),
                'pcs' => num($line['looseout_pcs'] ?? 0),
            ];
        }
    }
    if ($direction !== '') {
        $filters['direction'] = $direction;
    }
    return table(
        $title,
        cols([
            'date' => 'Date',
            'commodity' => 'Commodity',
            'country' => 'Country',
            'fish_type' => 'Fish Type',
            'direction' => 'Direction',
            'size' => 'Size',
            'kg' => 'Kg',
            'pcs' => 'Pcs',
        ]),
        $rows,
        $filters
    );
}

function balanceReport(PDO $pdo, array $body, string $tableName, string $mode, string $title): array
{
    [$extra, $params, $filters] = stockFilters($pdo, $body);
    $stmt = $pdo->prepare("SELECT commondity_id, country, fish_type, size, kg, mc, particular FROM {$tableName} WHERE 1 = 1 {$extra}");
    $stmt->execute($params);
    $products = productMap($pdo);
    $groups = [];
    foreach ($stmt->fetchAll(PDO::FETCH_ASSOC) as $line) {
        $key = implode('|', [
            $line['commondity_id'],
            $line['country'],
            $line['fish_type'],
            $line['size'],
        ]);
        if (!isset($groups[$key])) {
            $groups[$key] = [
                'commodity' => $products[(string)$line['commondity_id']]['name'] ?? 'Unknown',
                'country' => $line['country'],
                'fish_type' => $line['fish_type'],
                'size' => $line['size'],
                'kg' => 0,
                'mc' => 0,
            ];
        }
        $groups[$key]['kg'] += num($line['kg']);
        $particular = (string)($line['particular'] ?? '');
        $mc = num($line['mc']);
        if ($mode === 'hhk') {
            $groups[$key]['mc'] += stripos($particular, 'to') === false ? $mc : -$mc;
        } else {
            $groups[$key]['mc'] += strcasecmp($particular, 'HHK to GFC') === 0 ? $mc : -$mc;
        }
    }
    return table(
        $title,
        cols([
            'commodity' => 'Commodity',
            'country' => 'Country',
            'fish_type' => 'Fish Type',
            'size' => 'Size',
            'kg' => 'Kg',
            'mc' => 'Mc',
        ]),
        array_values($groups),
        $filters
    );
}

function mcReport(PDO $pdo, array $body): array
{
    [$hhkSql, $params, $filters] = stockFilters($pdo, $body, 'h');
    [$gfcSql] = stockFilters($pdo, $body, 'g');
    $hhk = $pdo->prepare("SELECT h.* FROM hhkmcstock h WHERE 1 = 1 {$hhkSql} ORDER BY h.id ASC");
    $hhk->execute($params);
    $gfc = $pdo->prepare("SELECT g.* FROM gfcmcstock g WHERE 1 = 1 {$gfcSql} ORDER BY g.id ASC");
    $gfc->execute($params);
    $products = productMap($pdo);
    $latest = [];
    $absorb = function (array $line, string $side) use (&$latest, $products) {
        $key = implode('|', [
            $line['commondity_id'] ?? '',
            $line['country'] ?? '',
            $line['fish_type'] ?? '',
            $line['size'] ?? '',
            $line['kg'] ?? '',
        ]);
        if (!isset($latest[$key])) {
            $latest[$key] = [
                'commodity' => $products[(string)($line['commondity_id'] ?? '')]['name'] ?? 'Unknown',
                'fish_type' => $line['fish_type'] ?? '',
                'country' => $line['country'] ?? '',
                'size' => $line['size'] ?? '',
                'kg' => num($line['kg'] ?? 0),
                'hhk_mc' => 0,
                'gfc_mc' => 0,
            ];
        }
        $latest[$key][$side] = num($line['balance_mc'] ?? 0);
    };
    foreach ($hhk->fetchAll(PDO::FETCH_ASSOC) as $line) {
        $absorb($line, 'hhk_mc');
    }
    foreach ($gfc->fetchAll(PDO::FETCH_ASSOC) as $line) {
        $absorb($line, 'gfc_mc');
    }
    $rows = [];
    foreach ($latest as $row) {
        $row['total_mc'] = $row['hhk_mc'] + $row['gfc_mc'];
        $rows[] = $row;
    }
    return table(
        'Mc Report',
        cols([
            'commodity' => 'Fish Name',
            'fish_type' => 'Fish Type',
            'country' => 'Country',
            'size' => 'Size',
            'kg' => 'Kg',
            'hhk_mc' => 'HHK Mc',
            'gfc_mc' => 'GFC Mc',
            'total_mc' => 'Total Mc',
        ]),
        $rows,
        $filters
    );
}

function generalLedgerReport(PDO $pdo, array $body): array
{
    $sql = 'SELECT date, voucherno, ac_code, narration, debit, credit FROM general_ledger WHERE 1 = 1';
    $params = [];
    $filters = [];
    $code = field($body, 'account_code');
    if ($code !== '') {
        $sql .= ' AND ac_code = ?';
        $params[] = $code;
        $filters['account_code'] = $code;
    }
    $from = field($body, 'date_from');
    $to = field($body, 'date_to');
    if ($from !== '' && $to !== '') {
        $sql .= ' AND date BETWEEN ? AND ?';
        array_push($params, $from, $to);
        $filters['date'] = $from . ' to ' . $to;
    } elseif ($from !== '') {
        $sql .= ' AND date >= ?';
        $params[] = $from;
        $filters['date_from'] = $from;
    } elseif ($to !== '') {
        $sql .= ' AND date <= ?';
        $params[] = $to;
        $filters['date_to'] = $to;
    }
    $sql .= ' ORDER BY ac_code ASC, date ASC, id ASC';
    $stmt = $pdo->prepare($sql);
    $stmt->execute($params);
    $lines = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $names = [];
    foreach ($pdo->query('SELECT code_no, ac_name FROM acname')->fetchAll(PDO::FETCH_ASSOC) as $row) {
        $names[(string)$row['code_no']] = $row['ac_name'];
    }
    $currencies = [];
    $currencyFor = function (string $voucher) use ($pdo, &$currencies): string {
        if ($voucher === '') {
            return 'MMK';
        }
        if (isset($currencies[$voucher])) {
            return $currencies[$voucher];
        }
        $sale = $pdo->prepare('SELECT currency FROM sales WHERE sr_no = ? LIMIT 1');
        $sale->execute([$voucher]);
        $currency = $sale->fetchColumn();
        if (!$currency) {
            $purchase = $pdo->prepare('SELECT currency FROM purchases WHERE voucher_no = ? LIMIT 1');
            $purchase->execute([$voucher]);
            $currency = $purchase->fetchColumn();
        }
        $currencies[$voucher] = $currency ? (string)$currency : 'MMK';
        return $currencies[$voucher];
    };

    $rows = [];
    $running = 0.0;
    $current = null;
    foreach ($lines as $line) {
        if ($current !== $line['ac_code']) {
            $current = $line['ac_code'];
            $running = 0.0;
        }
        $debit = num($line['debit']);
        $credit = num($line['credit']);
        $running += $debit - $credit;
        $rows[] = [
            'date' => $line['date'],
            'voucher_no' => $line['voucherno'],
            'account_code' => $line['ac_code'],
            'account_name' => $names[(string)$line['ac_code']] ?? $line['ac_code'],
            'description' => $line['narration'],
            'debit' => $debit,
            'credit' => $credit,
            'currency' => $currencyFor((string)$line['voucherno']),
            'balance' => $running,
        ];
    }

    return table(
        'General Ledger Report',
        cols([
            'date' => 'Date',
            'voucher_no' => 'Voucher No',
            'account_code' => 'Account Code',
            'account_name' => 'Account Name',
            'description' => 'Description',
            'debit' => 'Debit',
            'credit' => 'Credit',
            'currency' => 'Currency',
            'balance' => 'Balance',
        ]),
        $rows,
        $filters
    );
}

function warehouseReport(PDO $pdo, array $body): array
{
    $sql = 'SELECT * FROM material_store_house WHERE 1 = 1';
    $params = [];
    $filters = [];
    $from = field($body, 'date_from');
    $to = field($body, 'date_to');
    if ($from !== '' && $to !== '') {
        $sql .= ' AND `date` BETWEEN ? AND ?';
        array_push($params, $from, $to);
        $filters['date'] = $from . ' to ' . $to;
    }
    $movement = field($body, 'movement');
    if ($movement === 'in') {
        $sql .= ' AND out_quantity IS NULL';
        $filters['movement'] = 'in';
    } elseif ($movement === 'out') {
        $sql .= ' AND in_quantity IS NULL';
        $filters['movement'] = 'out';
    }
    $material = field($body, 'material');
    if ($material !== '') {
        $ids = productIdsByName($pdo, $material);
        if ($ids === []) {
            $sql .= ' AND 1 = 0';
        } else {
            $sql .= ' AND material_id IN (' . implode(',', array_fill(0, count($ids), '?')) . ')';
            $params = array_merge($params, $ids);
        }
        $filters['material'] = $material;
    }
    $sql .= ' ORDER BY material_id ASC, `date` ASC, id ASC';
    $stmt = $pdo->prepare($sql);
    $stmt->execute($params);
    $products = productMap($pdo);
    $contacts = contactMap($pdo);
    $rows = [];
    $running = [];
    foreach ($stmt->fetchAll(PDO::FETCH_ASSOC) as $line) {
        $mid = (string)$line['material_id'];
        $in = num($line['in_quantity'] ?? 0);
        $out = num($line['out_quantity'] ?? 0);
        $running[$mid] = ($running[$mid] ?? 0) + $in - $out;
        $rows[] = [
            'date' => $line['date'] ?? '',
            'voucher_no' => $line['voucher_no'] ?? '',
            'supplier' => $contacts[(string)($line['supplier_id'] ?? '')]['name'] ?? '',
            'item' => $products[$mid]['name'] ?? 'Unknown',
            'unit' => $products[$mid]['unit'] ?? '',
            'in_qty' => $in,
            'out_qty' => $out,
            'balance' => $running[$mid],
        ];
    }
    return table(
        'Packing Material Warehouse Report',
        cols([
            'date' => 'Date',
            'voucher_no' => 'Voucher No',
            'supplier' => 'Supplier',
            'item' => 'Item',
            'unit' => 'Unit',
            'in_qty' => 'In',
            'out_qty' => 'Out',
            'balance' => 'Balance',
        ]),
        $rows,
        $filters
    );
}

function gatepassReport(PDO $pdo, array $body): array
{
    $sql = 'SELECT * FROM stock_output_group WHERE 1 = 1';
    $params = [];
    $filters = [];
    $from = field($body, 'date_from');
    $to = field($body, 'date_to');
    if ($from !== '' && $to !== '') {
        $sql .= ' AND `date` BETWEEN ? AND ?';
        array_push($params, $from, $to);
        $filters['date'] = $from . ' to ' . $to;
    }
    $destination = field($body, 'destination');
    if ($destination !== '') {
        $sql .= ' AND stock_to = ?';
        $params[] = $destination;
        $filters['destination'] = $destination;
    }
    $material = field($body, 'material');
    if ($material !== '') {
        $ids = productIdsByName($pdo, $material);
        if ($ids === []) {
            $sql .= ' AND 1 = 0';
        } else {
            $sql .= ' AND material_id IN (' . implode(',', array_fill(0, count($ids), '?')) . ')';
            $params = array_merge($params, $ids);
        }
        $filters['material'] = $material;
    }
    $sql .= ' ORDER BY stock_to ASC, material_id ASC, `date` ASC, id ASC';
    $stmt = $pdo->prepare($sql);
    $stmt->execute($params);
    $products = productMap($pdo);
    $contacts = contactMap($pdo);
    $rows = [];
    foreach ($stmt->fetchAll(PDO::FETCH_ASSOC) as $line) {
        $mid = (string)($line['material_id'] ?? '');
        $rows[] = [
            'date' => $line['date'] ?? '',
            'voucher_no' => $line['voucher_no'] ?? '',
            'destination' => $line['stock_to'] ?? '',
            'supplier' => $contacts[(string)($line['supplier_id'] ?? '')]['name'] ?? '',
            'item' => $products[$mid]['name'] ?? 'Unknown',
            'unit' => $products[$mid]['unit'] ?? '',
            'quantity' => num($line['quantity'] ?? $line['in_quantity'] ?? 0),
        ];
    }
    return table(
        'Gate Pass Report',
        cols([
            'date' => 'Date',
            'voucher_no' => 'Voucher No',
            'destination' => 'Destination',
            'supplier' => 'Supplier',
            'item' => 'Item',
            'unit' => 'Unit',
            'quantity' => 'Quantity',
        ]),
        $rows,
        $filters
    );
}

function profitAndLossReport(PDO $pdo, array $body): array
{
    $from = field($body, 'date_from');
    $to = field($body, 'date_to');
    if ($from === '') {
        $from = '1900-01-01';
    }
    if ($to === '') {
        $to = date('Y-m-d');
    }

    $pull = function (array $keywords, bool $isRevenue) use ($pdo, $from, $to): array {
        $math = $isRevenue ? '(SUM(gl.credit) - SUM(gl.debit))' : '(SUM(gl.debit) - SUM(gl.credit))';
        $parts = [];
        $params = [$from, $to];
        foreach ($keywords as $word) {
            $parts[] = 'a.class LIKE ?';
            $parts[] = 'a.type LIKE ?';
            $params[] = '%' . $word . '%';
            $params[] = '%' . $word . '%';
        }
        $sql = "SELECT a.code, a.name, COALESCE($math, 0) AS amount,
                       SUM(gl.debit) AS debit, SUM(gl.credit) AS credit
                FROM general_ledger gl
                JOIN accodes a ON gl.ac_code = a.code
                WHERE gl.date BETWEEN ? AND ? AND (" . implode(' OR ', $parts) . ")
                GROUP BY a.code, a.name
                HAVING SUM(gl.debit) != 0 OR SUM(gl.credit) != 0
                ORDER BY a.code ASC";
        $stmt = $pdo->prepare($sql);
        $stmt->execute($params);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    };

    $income = $pull(['Revenue', 'Income', 'Sales'], true);
    $cos = $pull(['Direct Costs', 'Cost of Sales', 'COGS', 'Purchase'], false);
    $expense = $pull(['Expense', 'Operating', 'Overhead'], false);
    $caught = array_merge(
        array_column($income, 'code'),
        array_column($cos, 'code'),
        array_column($expense, 'code')
    );

    if ($caught !== []) {
        $placeholders = implode(',', array_fill(0, count($caught), '?'));
        $sql = "SELECT gl.ac_code AS code, COALESCE(a.name, gl.ac_code) AS name,
                       (SUM(gl.debit) - SUM(gl.credit)) AS amount
                FROM general_ledger gl
                LEFT JOIN accodes a ON gl.ac_code = a.code
                WHERE gl.date BETWEEN ? AND ? AND gl.ac_code NOT IN ($placeholders)
                GROUP BY gl.ac_code, a.name
                HAVING SUM(gl.debit) != 0 OR SUM(gl.credit) != 0";
        $params = array_merge([$from, $to], $caught);
    } else {
        $sql = "SELECT gl.ac_code AS code, COALESCE(a.name, gl.ac_code) AS name,
                       (SUM(gl.debit) - SUM(gl.credit)) AS amount
                FROM general_ledger gl
                LEFT JOIN accodes a ON gl.ac_code = a.code
                WHERE gl.date BETWEEN ? AND ?
                GROUP BY gl.ac_code, a.name
                HAVING SUM(gl.debit) != 0 OR SUM(gl.credit) != 0";
        $params = [$from, $to];
    }
    $stmt = $pdo->prepare($sql);
    $stmt->execute($params);
    $uncategorized = [];
    foreach ($stmt->fetchAll(PDO::FETCH_ASSOC) as $account) {
        $digit = substr((string)$account['code'], 0, 1);
        if (in_array($digit, ['5', '6', '8', '9'], true)) {
            $uncategorized[] = $account;
        }
    }

    $rows = [];
    $push = function (string $section, array $accounts) use (&$rows) {
        foreach ($accounts as $account) {
            $rows[] = [
                'section' => $section,
                'account' => $account['name'],
                'code' => $account['code'],
                'amount' => num($account['amount']),
            ];
        }
    };
    $push('Trading Income', $income);
    $push('Cost of Sales', $cos);
    $totalIncome = array_sum(array_column($income, 'amount'));
    $totalCos = array_sum(array_column($cos, 'amount'));
    $gross = $totalIncome - $totalCos;
    $rows[] = ['section' => 'Gross Profit', 'account' => 'Gross Profit', 'code' => '', 'amount' => $gross];
    $push('Operating Expenses', $expense);
    $push('Uncategorized', $uncategorized);
    $net = $gross - array_sum(array_column($expense, 'amount')) - array_sum(array_column($uncategorized, 'amount'));
    $rows[] = ['section' => 'Net Profit', 'account' => 'Net Profit', 'code' => '', 'amount' => $net];

    return table(
        'Profit and Loss',
        cols([
            'section' => 'Section',
            'account' => 'Account',
            'code' => 'Code',
            'amount' => 'Amount',
        ]),
        $rows,
        ['date' => $from . ' to ' . $to]
    );
}
