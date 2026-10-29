<?php

declare(strict_types=1);

const AIAGENT_SYSTEM_PROMPT_SUFFIX = "\n\nThe owner is logged into Link Mark. Speak in plain sentences. The table on screen is the data. Your reply is only the explanation.";

function aiagent_config(): array
{
    static $config;
    if (isset($config)) {
        return $config;
    }

    $defaults = [
        'API_KEY' => '',
        'MODEL' => '',
        'BASE_URL' => 'https://api.groq.com/openai/v1',
        'TEMPERATURE' => 1,
        'TOP_P' => 1,
        'MAX_COMPLETION_TOKENS' => 2048,
        'REASONING_EFFORT' => 'medium',
        'LMS_BASE' => 'http://127.0.0.1/LMS',
    ];
    $config = [];
    $envPath = dirname(__DIR__) . '/.env';
    if (is_file($envPath)) {
        $source = file($envPath, FILE_IGNORE_NEW_LINES);
        if ($source === false) {
            throw new RuntimeException('Unable to read the project .env file.');
        }
        foreach ($source as $line) {
            $line = trim($line);
            if ($line === '' || str_starts_with($line, '#') || !str_contains($line, '=')) {
                continue;
            }
            [$name, $value] = explode('=', $line, 2);
            $name = trim($name);
            $value = trim($value);
            if (!array_key_exists($name, $defaults)) {
                continue;
            }
            if (strlen($value) >= 2 && (($value[0] === '"' && str_ends_with($value, '"')) || ($value[0] === "'" && str_ends_with($value, "'")))) {
                $value = stripcslashes(substr($value, 1, -1));
            }
            $config[$name] = $value;
        }
    }
    $config = array_replace($defaults, $config);
    foreach (['TEMPERATURE', 'TOP_P', 'MAX_COMPLETION_TOKENS'] as $numericKey) {
        $config[$numericKey] = is_numeric($config[$numericKey]) ? (0 + $config[$numericKey]) : $defaults[$numericKey];
    }
    return $config;
}

function aiagent_require_login(): void
{
    if (session_status() !== PHP_SESSION_ACTIVE) {
        ini_set('session.gc_maxlifetime', '10800');
        session_set_cookie_params(10800, '/');
        session_start();
    }
    if (empty($_SESSION['username']) || empty($_SESSION['logged_in']) || empty($_SESSION['role'])) {
        aiagent_json(['error' => 'Login required'], 401);
    }
}

function aiagent_json(array $body, int $status = 200): never
{
    http_response_code($status);
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode($body, JSON_UNESCAPED_UNICODE | JSON_INVALID_UTF8_SUBSTITUTE);
    exit;
}

function aiagent_read_json(): array
{
    $decoded = json_decode(file_get_contents('php://input') ?: '{}', true);
    return is_array($decoded) ? $decoded : [];
}

function aiagent_owner(): string
{
    $username = (string)($_SESSION['username'] ?? 'owner');
    $safe = preg_replace('/[^\p{L}\p{N}_-]/u', '', $username);
    return $safe !== '' ? $safe : 'owner';
}

function aiagent_chat_folder(): string
{
    $folder = __DIR__ . '/chats/' . aiagent_owner();
    if (!is_dir($folder) && !mkdir($folder, 0770, true) && !is_dir($folder)) {
        throw new RuntimeException('Unable to create the chat history folder.');
    }
    return $folder;
}

function aiagent_chat_path(int $number): string
{
    if ($number < 1) {
        throw new InvalidArgumentException('Invalid chat number.');
    }
    return aiagent_chat_folder() . '/chat' . $number . '.txt';
}

function aiagent_now(): string
{
    return date('Y-m-d H:i:s');
}

function aiagent_read_record(int $number): ?array
{
    if ($number < 1) {
        return null;
    }
    $path = aiagent_chat_path($number);
    if (!is_file($path)) {
        return null;
    }
    $record = json_decode((string)file_get_contents($path), true);
    return is_array($record) ? $record : null;
}

function aiagent_write_record(array &$record): void
{
    $record['updated'] = aiagent_now();
    if (empty($record['title']) || $record['title'] === 'New chat') {
        foreach ($record['turns'] ?? [] as $turn) {
            if (($turn['role'] ?? '') === 'user' && !empty($turn['text'])) {
                $record['title'] = mb_substr(preg_replace('/\s+/u', ' ', trim($turn['text'])), 0, 48);
                break;
            }
        }
        $record['title'] = $record['title'] ?? 'New chat';
    }

    $path = aiagent_chat_path((int)$record['number']);
    $json = json_encode($record, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_INVALID_UTF8_SUBSTITUTE);
    if ($json === false || file_put_contents($path, $json, LOCK_EX) === false) {
        throw new RuntimeException('Unable to save chat history.');
    }
}

function aiagent_create_record(): array
{
    $highest = 0;
    foreach (glob(aiagent_chat_folder() . '/chat*.txt') ?: [] as $path) {
        if (preg_match('/^chat([0-9]+)\.txt$/', basename($path), $match)) {
            $highest = max($highest, (int)$match[1]);
        }
    }
    $record = ['number' => $highest + 1, 'title' => 'New chat', 'updated' => aiagent_now(), 'turns' => []];
    aiagent_write_record($record);
    return $record;
}

function aiagent_chat_summaries(): array
{
    $found = [];
    foreach (glob(aiagent_chat_folder() . '/chat*.txt') ?: [] as $path) {
        $record = json_decode((string)file_get_contents($path), true);
        if (!is_array($record)) {
            continue;
        }
        $found[] = [
            'number' => (int)($record['number'] ?? 0),
            'title' => $record['title'] ?? 'New chat',
            'updated' => $record['updated'] ?? '',
        ];
    }
    usort($found, static fn(array $a, array $b): int => $b['number'] <=> $a['number']);
    return $found;
}

function aiagent_remember_turn(array &$record, string $role, string $text, array $tables = [], array $debug = []): void
{
    $record['turns'][] = ['role' => $role, 'text' => $text, 'tables' => $tables, 'debug' => $debug];
    aiagent_write_record($record);
}

function aiagent_system_prompt(): string
{
    $context = file_get_contents(__DIR__ . '/source_context.md');
    if ($context === false) {
        throw new RuntimeException('The report assistant instructions could not be loaded.');
    }
    return $context . AIAGENT_SYSTEM_PROMPT_SUFFIX;
}

function aiagent_tools(): array
{
    return [
        [
            'type' => 'function',
            'function' => [
                'name' => 'get_report',
                'description' => 'Load a full Link Mark report. Leave filters empty unless the owner asked for them.',
                'parameters' => [
                    'type' => 'object',
                    'properties' => [
                        'report' => ['type' => 'string', 'enum' => ['purchase', 'payable', 'stock', 'general_ledger', 'packing_warehouse', 'packing_gatepass', 'profit_and_loss']],
                        'date_from' => ['type' => 'string'],
                        'date_to' => ['type' => 'string'],
                        'supplier' => ['type' => 'string'],
                        'commodity' => ['type' => 'string'],
                        'voucher_no' => ['type' => 'string'],
                        'size' => ['type' => 'string'],
                        'supplier_type' => ['type' => 'string'],
                        'stock_view' => ['type' => 'string'],
                        'direction' => ['type' => 'string'],
                        'country' => ['type' => 'string'],
                        'fish_type' => ['type' => 'string'],
                        'account_code' => ['type' => 'string'],
                        'material' => ['type' => 'string'],
                        'destination' => ['type' => 'string'],
                        'movement' => ['type' => 'string'],
                    ],
                    'required' => ['report'],
                ],
            ],
        ],
        [
            'type' => 'function',
            'function' => [
                'name' => 'shape_table',
                'description' => 'Filter, sort, choose columns, or group the report already on screen. Every matching row is kept.',
                'parameters' => [
                    'type' => 'object',
                    'properties' => [
                        'table_id' => ['type' => 'string'],
                        'columns' => ['type' => 'array', 'items' => ['type' => 'string']],
                        'filters' => [
                            'type' => 'array',
                            'items' => [
                                'type' => 'object',
                                'properties' => [
                                    'column' => ['type' => 'string'],
                                    'op' => ['type' => 'string', 'enum' => ['eq', 'contains', 'gt', 'gte', 'lt', 'lte']],
                                    'value' => ['type' => 'string'],
                                ],
                                'required' => ['column', 'op', 'value'],
                            ],
                        ],
                        'sort_by' => ['type' => 'string'],
                        'sort_dir' => ['type' => 'string', 'enum' => ['asc', 'desc']],
                        'group_by' => ['type' => 'string'],
                        'sum_columns' => ['type' => 'array', 'items' => ['type' => 'string']],
                    ],
                ],
            ],
        ],
    ];
}

function aiagent_numeric_totals(array $columns, array $rows): array
{
    $totals = [];
    foreach ($columns as $column) {
        $key = $column['key'] ?? '';
        if ($key === '' || $key === 'balance' || $rows === []) {
            continue;
        }
        $values = array_column($rows, $key);
        if (count($values) === count($rows) && count(array_filter($values, 'is_numeric')) === count($rows)) {
            $totals[$key] = round(array_sum(array_map('floatval', $values)), 3);
        }
    }
    return $totals;
}

function aiagent_store_table(array $table): array
{
    $table['id'] = bin2hex(random_bytes(16));
    $table['totals'] = aiagent_numeric_totals($table['columns'] ?? [], $table['rows'] ?? []);
    return $table;
}

function aiagent_model_view(array $table): array
{
    return [
        'table_id' => $table['id'],
        'title' => $table['title'] ?? '',
        'row_count' => $table['row_count'] ?? count($table['rows'] ?? []),
        'columns' => $table['columns'] ?? [],
        'totals' => $table['totals'] ?? [],
        'filters' => $table['filters'] ?? [],
        'note' => "Every row is already in the owner's table. Do not list rows or say a sample is showing.",
    ];
}

function aiagent_compare(mixed $left, string $op, mixed $right): bool
{
    if ($op === 'contains') {
        return mb_stripos((string)$left, (string)$right) !== false;
    }
    if ($op === 'eq') {
        return mb_strtolower((string)$left) === mb_strtolower((string)$right);
    }
    if (!in_array($op, ['gt', 'gte', 'lt', 'lte'], true)) {
        return false;
    }
    if (is_numeric($left) && is_numeric($right)) {
        $left = (float)$left;
        $right = (float)$right;
    } else {
        $left = mb_strtolower((string)$left);
        $right = mb_strtolower((string)$right);
    }
    return match ($op) {
        'gt' => $left > $right,
        'gte' => $left >= $right,
        'lt' => $left < $right,
        'lte' => $left <= $right,
    };
}

function aiagent_shape_table(array $tables, ?string $lastTableId, array $arguments): array
{
    $tableId = (string)($arguments['table_id'] ?? $lastTableId ?? '');
    $source = $tables[$tableId] ?? null;
    if (!is_array($source)) {
        return ['error' => 'Load a report before shaping it.'];
    }
    $rows = $source['rows'] ?? [];
    foreach ($arguments['filters'] ?? [] as $filter) {
        $column = (string)($filter['column'] ?? '');
        $op = (string)($filter['op'] ?? '');
        $value = $filter['value'] ?? '';
        $rows = array_values(array_filter($rows, static fn(array $row): bool => aiagent_compare($row[$column] ?? null, $op, $value)));
    }

    $columns = $source['columns'] ?? [];
    $keep = $arguments['columns'] ?? [];
    if ($keep !== []) {
        $columns = array_values(array_filter($columns, static fn(array $column): bool => in_array($column['key'] ?? '', $keep, true)));
        if ($columns === []) {
            $columns = array_map(static fn(string $key): array => ['key' => $key, 'label' => $key], $keep);
        }
    }

    $groupBy = (string)($arguments['group_by'] ?? '');
    if ($groupBy !== '') {
        $sumColumns = $arguments['sum_columns'] ?? array_values(array_filter(array_column($columns, 'key'), static fn(string $key): bool => $key !== $groupBy));
        $groups = [];
        foreach ($rows as $row) {
            $key = (string)($row[$groupBy] ?? '');
            $groups[$key] ??= ['count' => 0];
            $groups[$key]['count']++;
            foreach ($sumColumns as $name) {
                if (is_numeric($row[$name] ?? null)) {
                    $groups[$key][$name] = ($groups[$key][$name] ?? 0) + (float)$row[$name];
                } else {
                    $groups[$key][$name] = $row[$name] ?? null;
                }
            }
        }
        $rows = [];
        foreach ($groups as $key => $values) {
            $row = [$groupBy => $key, 'count' => $values['count']];
            foreach ($sumColumns as $name) {
                if ($name !== $groupBy) {
                    $row[$name] = $values[$name] ?? 0;
                }
            }
            $rows[] = $row;
        }
        $columns = [['key' => $groupBy, 'label' => $groupBy], ['key' => 'count', 'label' => 'Count']];
        foreach ($sumColumns as $name) {
            if ($name !== $groupBy) {
                $columns[] = ['key' => $name, 'label' => $name];
            }
        }
    }

    $sortBy = (string)($arguments['sort_by'] ?? '');
    if ($sortBy !== '') {
        $descending = ($arguments['sort_dir'] ?? 'asc') === 'desc';
        usort($rows, static function (array $a, array $b) use ($sortBy, $descending): int {
            $left = $a[$sortBy] ?? '';
            $right = $b[$sortBy] ?? '';
            $comparison = is_numeric($left) && is_numeric($right)
                ? ((float)$left <=> (float)$right)
                : strcasecmp((string)$left, (string)$right);
            return $descending ? -$comparison : $comparison;
        });
    }

    return ['tables' => [[
        'title' => ($source['title'] ?? 'Report') . ' (shaped)',
        'columns' => $columns,
        'rows' => array_values($rows),
        'row_count' => count($rows),
        'filters' => ['shaped_from' => $tableId, 'request' => $arguments],
    ]]];
}

function aiagent_report_url(): string
{
    $config = aiagent_config();
    return rtrim((string)($config['LMS_BASE'] ?? 'http://127.0.0.1/LMS'), '/') . '/aiagent/data/report.php';
}

function aiagent_call_report(array $arguments, string $cookie): array
{
    $curl = curl_init(aiagent_report_url());
    curl_setopt_array($curl, [
        CURLOPT_POST => true,
        CURLOPT_POSTFIELDS => json_encode($arguments, JSON_UNESCAPED_UNICODE),
        CURLOPT_HTTPHEADER => ['Content-Type: application/json', 'Cookie: ' . $cookie],
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_TIMEOUT => 120,
    ]);
    $response = curl_exec($curl);
    $status = (int)curl_getinfo($curl, CURLINFO_RESPONSE_CODE);
    $error = curl_error($curl);
    curl_close($curl);
    if ($response === false) {
        return ['error' => 'Could not load the report: ' . $error];
    }
    $decoded = json_decode($response, true);
    if (!is_array($decoded)) {
        return ['error' => 'The report endpoint returned an invalid response.'];
    }
    if ($status >= 400 && empty($decoded['error'])) {
        return ['error' => 'Report request failed with HTTP ' . $status . '.'];
    }
    return $decoded;
}

function aiagent_llm(array $messages, ?string $toolChoice, array &$limits): array
{
    $config = aiagent_config();
    $apiKey = trim((string)($config['API_KEY'] ?? ''));
    $model = trim((string)($config['MODEL'] ?? ''));
    if ($apiKey === '' || $model === '') {
        throw new RuntimeException('Set API_KEY and MODEL in the project-root .env file.');
    }
    $baseUrl = rtrim((string)($config['BASE_URL'] ?? 'https://api.groq.com/openai/v1'), '/');
    $body = [
        'model' => $model,
        'temperature' => $config['TEMPERATURE'] ?? 1,
        'top_p' => $config['TOP_P'] ?? 1,
        'max_completion_tokens' => $config['MAX_COMPLETION_TOKENS'] ?? 2048,
        'messages' => $messages,
        'tools' => aiagent_tools(),
        'stream' => false,
    ];
    if ($toolChoice !== null) {
        $body['tool_choice'] = $toolChoice;
    }
    if (!empty($config['REASONING_EFFORT']) && str_contains($model, 'gpt-oss')) {
        $body['reasoning_effort'] = $config['REASONING_EFFORT'];
    }

    $responseHeaders = [];
    $curl = curl_init($baseUrl . '/chat/completions');
    curl_setopt_array($curl, [
        CURLOPT_POST => true,
        CURLOPT_POSTFIELDS => json_encode($body, JSON_UNESCAPED_UNICODE | JSON_INVALID_UTF8_SUBSTITUTE),
        CURLOPT_HTTPHEADER => [
            'Authorization: Bearer ' . $apiKey,
            'Content-Type: application/json',
            'User-Agent: LinkMarkAgent/1.0',
        ],
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_TIMEOUT => 120,
        CURLOPT_HEADERFUNCTION => static function ($curl, string $line) use (&$responseHeaders): int {
            $length = strlen($line);
            if (str_contains($line, ':')) {
                [$name, $value] = explode(':', $line, 2);
                $responseHeaders[strtolower(trim($name))] = trim($value);
            }
            return $length;
        },
    ]);
    $response = curl_exec($curl);
    $status = (int)curl_getinfo($curl, CURLINFO_RESPONSE_CODE);
    $curlError = curl_error($curl);
    curl_close($curl);

    $limits = ['model' => $model];
    foreach ([
        'limit_tokens' => 'x-ratelimit-limit-tokens',
        'remaining_tokens' => 'x-ratelimit-remaining-tokens',
        'reset_tokens' => 'x-ratelimit-reset-tokens',
        'limit_requests' => 'x-ratelimit-limit-requests',
        'remaining_requests' => 'x-ratelimit-remaining-requests',
        'reset_requests' => 'x-ratelimit-reset-requests',
    ] as $key => $header) {
        if (isset($responseHeaders[$header])) {
            $limits[$key] = $responseHeaders[$header];
        }
    }
    if ($response === false) {
        throw new RuntimeException('Could not reach the AI provider: ' . $curlError);
    }
    $data = json_decode($response, true);
    if (!is_array($data)) {
        throw new RuntimeException('The AI provider returned an invalid response.');
    }
    if ($status >= 400) {
        $message = $data['error']['message'] ?? $response;
        if (($data['error']['code'] ?? '') === 'rate_limit_exceeded') {
            $wait = '';
            if (preg_match('/Please try again in ([^.]+)/i', (string)$message, $match)) {
                $wait = trim($match[1]);
            }
            $message = 'Groq rate limit on this model. Wait ' . ($wait !== '' ? $wait : 'a few seconds') . ' and send it again.';
        }
        throw new RuntimeException((string)$message);
    }
    foreach (['prompt_tokens', 'completion_tokens', 'total_tokens'] as $key) {
        if (isset($data['usage'][$key])) {
            $limits[$key] = $data['usage'][$key];
        }
    }
    return $data;
}

function aiagent_asks_for_rows(string $text): bool
{
    $lowered = mb_strtolower($text);
    $question = false;
    foreach (['what ', 'which ', 'list', 'can i', 'how do'] as $part) {
        $question = $question || str_contains($lowered, $part);
    }
    $show = false;
    foreach (['show', 'give me', 'load', 'open the', 'export', 'download'] as $part) {
        $show = $show || str_contains($lowered, $part);
    }
    if ($question && !$show) {
        return false;
    }
    foreach (['show', 'give me', 'load', 'purchase', 'payable', 'statement', 'stock', 'ledger', 'warehouse', 'gate pass', 'profit', 'table', 'supplier'] as $part) {
        if (str_contains($lowered, $part)) {
            return true;
        }
    }
    return false;
}

function aiagent_friendly_error(Throwable $exception): string
{
    $technicalMessage = mb_strtolower($exception->getMessage());
    if (str_contains($technicalMessage, 'tool call validation failed') || str_contains($technicalMessage, 'did not match schema')) {
        return "I couldn't apply that report request correctly. Try asking for the report first, then tell me what you want filtered.";
    }
    return "I couldn't complete that request right now. Please try again.";
}

function aiagent_chat(array $body): never
{
    aiagent_require_login();
    $message = trim((string)($body['message'] ?? ''));
    if ($message === '') {
        aiagent_json(['error' => 'Type a message first.'], 400);
    }
    $record = aiagent_read_record((int)($body['chat_id'] ?? 0)) ?? aiagent_create_record();
    $messages = [['role' => 'system', 'content' => aiagent_system_prompt()]];
    $tables = [];
    $lastTableId = null;
    foreach ($record['turns'] ?? [] as $turn) {
        $role = ($turn['role'] ?? '') === 'user' ? 'user' : 'assistant';
        $messages[] = ['role' => $role, 'content' => $turn['text'] ?: ($role === 'assistant' ? 'Here is the table.' : '')];
        foreach ($turn['tables'] ?? [] as $table) {
            if (!empty($table['id'])) {
                $tables[$table['id']] = $table;
                $lastTableId = $table['id'];
            }
        }
    }
    $messages[] = ['role' => 'user', 'content' => $message];
    aiagent_remember_turn($record, 'user', $message);
    $cookie = (string)($_SERVER['HTTP_COOKIE'] ?? '');
    if (session_status() === PHP_SESSION_ACTIVE) {
        session_write_close();
    }
    $chatNumber = (int)$record['number'];
    $shown = [];
    $debug = [['step' => 'request', 'detail' => $message]];
    $config = aiagent_config();
    $debug[] = ['step' => 'model', 'detail' => (string)($config['MODEL'] ?? '')];
    $limits = ['model' => (string)($config['MODEL'] ?? '')];

    $consume = static function (?string $toolChoice = null) use (&$messages, &$tables, &$lastTableId, &$shown, &$debug, &$limits, $cookie): bool {
        $debug[] = ['step' => 'call', 'detail' => 'tool_choice=' . ($toolChoice ?? 'auto')];
        $data = aiagent_llm($messages, $toolChoice, $limits);
        $choice = $data['choices'][0]['message'] ?? [];
        $usage = $data['usage'] ?? [];
        $debug[] = [
            'step' => 'tokens',
            'detail' => 'prompt ' . ($usage['prompt_tokens'] ?? '?') . ' + completion ' . ($usage['completion_tokens'] ?? '?') .
                ' = ' . ($usage['total_tokens'] ?? '?') . '. Remaining ' . ($limits['remaining_tokens'] ?? '?') .
                ' / ' . ($limits['limit_tokens'] ?? '?') . '. Reset ' . ($limits['reset_tokens'] ?? '?') . '.',
        ];
        $toolCalls = $choice['tool_calls'] ?? [];
        $debug[] = ['step' => 'finish', 'detail' => $data['choices'][0]['finish_reason'] ?? 'unknown'];
        if (!empty($choice['content'])) {
            $debug[] = ['step' => 'reply', 'detail' => mb_substr((string)$choice['content'], 0, 400)];
        }
        $assistant = ['role' => 'assistant', 'content' => $choice['content'] ?? null];
        if (!empty($choice['reasoning'])) {
            $assistant['reasoning'] = $choice['reasoning'];
        }
        if ($toolCalls !== []) {
            $assistant['tool_calls'] = $toolCalls;
        }
        $messages[] = $assistant;
        if ($toolCalls === []) {
            return false;
        }
        foreach ($toolCalls as $call) {
            $name = $call['function']['name'] ?? '';
            $arguments = json_decode((string)($call['function']['arguments'] ?? '{}'), true);
            $arguments = is_array($arguments) ? $arguments : [];
            if ($name === 'get_report') {
                $result = aiagent_call_report($arguments, $cookie);
            } elseif ($name === 'shape_table') {
                $result = aiagent_shape_table($tables, $lastTableId, $arguments);
            } else {
                $result = ['error' => 'Unknown tool'];
            }

            $view = $result;
            $storedTables = [];
            if (empty($result['error'])) {
                $views = [];
                foreach ($result['tables'] ?? [] as $table) {
                    $saved = aiagent_store_table($table);
                    $tables[$saved['id']] = $saved;
                    $lastTableId = $saved['id'];
                    $storedTables[] = $saved;
                    $views[] = aiagent_model_view($saved);
                }
                $view = ['tables' => $views];
                array_push($shown, ...$storedTables);
            }
            if (!empty($view['error'])) {
                $debug[] = ['step' => 'tool', 'detail' => $name . ' failed: ' . $view['error']];
            } else {
                $counts = [];
                foreach ($view['tables'] ?? [] as $item) {
                    $counts[] = ($item['title'] ?? '') . ' ' . ($item['row_count'] ?? 0) . ' rows';
                }
                $debug[] = ['step' => 'tool', 'detail' => $name . ' ' . json_encode($arguments) . ' -> ' . (implode(', ', $counts) ?: 'no rows')];
            }
            $messages[] = [
                'role' => 'tool',
                'tool_call_id' => $call['id'] ?? 'call',
                'content' => json_encode($view, JSON_UNESCAPED_UNICODE | JSON_INVALID_UTF8_SUBSTITUTE),
            ];
        }
        return true;
    };

    try {
        for ($i = 0; $i < 6; $i++) {
            if (!$consume()) {
                break;
            }
        }
        if ($shown === [] && aiagent_asks_for_rows($message)) {
            $debug[] = ['step' => 'retry', 'detail' => 'No table yet, so the next call requires a tool.'];
            $messages[] = [
                'role' => 'user',
                'content' => 'No table was loaded. Call get_report for the report the owner asked for. Leave filters empty unless they named one. Do not invent rows or a row count.',
            ];
            for ($i = 0; $i < 2; $i++) {
                $called = $consume('required');
                if (!$called || $shown !== []) {
                    break;
                }
            }
        } elseif ($shown === []) {
            $debug[] = ['step' => 'skip', 'detail' => 'Question did not ask for rows, so no tool was required.'];
        }
    } catch (Throwable $exception) {
        error_log('AI agent request failed: ' . $exception->getMessage());
        $friendlyError = aiagent_friendly_error($exception);
        $debug[] = ['step' => 'error', 'detail' => $friendlyError];
        aiagent_remember_turn($record, 'assistant', $friendlyError, [], $debug);
        aiagent_json([
            'error' => $friendlyError,
            'debug' => $debug,
            'limits' => $limits,
            'chat_id' => $chatNumber,
            'title' => $record['title'],
        ], 500);
    }

    $reply = '';
    foreach (array_reverse($messages) as $past) {
        if (($past['role'] ?? '') === 'assistant' && !empty($past['content'])) {
            $reply = (string)$past['content'];
            break;
        }
    }
    if ($reply === '' && $shown !== []) {
        $reply = 'Here is the full table.';
    }
    if ($reply === '' && $shown === []) {
        $reply = 'I can open Purchase, Payable, Stock, General Ledger, Packing Material Warehouse, Gate Pass, and Profit and Loss.';
    }
    aiagent_remember_turn($record, 'assistant', $reply, $shown, $debug);
    aiagent_json([
        'reply' => $reply,
        'tables' => $shown,
        'debug' => $debug,
        'limits' => $limits,
        'chat_id' => $chatNumber,
        'title' => $record['title'],
    ]);
}

function aiagent_export_table(string $tableId, int $chatId): ?array
{
    $record = aiagent_read_record($chatId);
    if (!$record) {
        return null;
    }
    foreach ($record['turns'] ?? [] as $turn) {
        foreach ($turn['tables'] ?? [] as $table) {
            if (($table['id'] ?? '') === $tableId) {
                return $table;
            }
        }
    }
    return null;
}

function aiagent_xml(string $value): string
{
    return htmlspecialchars($value, ENT_XML1 | ENT_COMPAT, 'UTF-8');
}

function aiagent_build_xlsx(array $table): string
{
    if (!class_exists(ZipArchive::class)) {
        throw new RuntimeException('The PHP zip extension is required for Excel downloads.');
    }
    $temp = tempnam(sys_get_temp_dir(), 'lms-ai-report-');
    if ($temp === false) {
        throw new RuntimeException('Unable to create the Excel export.');
    }
    $zip = new ZipArchive();
    if ($zip->open($temp, ZipArchive::OVERWRITE) !== true) {
        @unlink($temp);
        throw new RuntimeException('Unable to create the Excel export.');
    }
    $zip->addFromString('[Content_Types].xml', '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types"><Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/><Default Extension="xml" ContentType="application/xml"/><Override PartName="/xl/workbook.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml"/><Override PartName="/xl/worksheets/sheet1.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml"/><Override PartName="/xl/styles.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.styles+xml"/></Types>');
    $zip->addFromString('_rels/.rels', '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="xl/workbook.xml"/></Relationships>');
    $zip->addFromString('xl/workbook.xml', '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><workbook xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships"><sheets><sheet name="Report" sheetId="1" r:id="rId1"/></sheets></workbook>');
    $zip->addFromString('xl/_rels/workbook.xml.rels', '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/worksheet" Target="worksheets/sheet1.xml"/><Relationship Id="rId2" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles" Target="styles.xml"/></Relationships>');
    $zip->addFromString('xl/styles.xml', '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><styleSheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main"><fonts count="2"><font><sz val="11"/><name val="Calibri"/></font><font><b/><sz val="11"/><name val="Calibri"/></font></fonts><fills count="2"><fill><patternFill patternType="none"/></fill><fill><patternFill patternType="gray125"/></fill></fills><borders count="1"><border><left/><right/><top/><bottom/><diagonal/></border></borders><cellStyleXfs count="1"><xf numFmtId="0" fontId="0" fillId="0" borderId="0"/></cellStyleXfs><cellXfs count="2"><xf numFmtId="0" fontId="0" fillId="0" borderId="0" xfId="0"/><xf numFmtId="0" fontId="1" fillId="0" borderId="0" xfId="0"/></cellXfs></styleSheet>');

    $rows = [];
    $rows[] = [$table['title'] ?? 'Report'];
    $rows[] = array_map(static fn(array $column): string => (string)($column['label'] ?? $column['key'] ?? ''), $table['columns'] ?? []);
    $keys = array_column($table['columns'] ?? [], 'key');
    foreach ($table['rows'] ?? [] as $row) {
        $rows[] = array_map(static fn(string $key): mixed => $row[$key] ?? '', $keys);
    }
    $sheet = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><worksheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main"><sheetData>';
    foreach ($rows as $rowIndex => $row) {
        $number = $rowIndex + 1;
        $sheet .= '<row r="' . $number . '">';
        foreach ($row as $columnIndex => $value) {
            $columnName = '';
            for ($n = $columnIndex + 1; $n > 0; $n = intdiv($n - 1, 26)) {
                $columnName = chr(65 + (($n - 1) % 26)) . $columnName;
            }
            $reference = $columnName . $number;
            if ($rowIndex >= 2 && is_numeric($value)) {
                $sheet .= '<c r="' . $reference . '"><v>' . (string)$value . '</v></c>';
            } else {
                $style = $rowIndex === 1 ? ' s="1"' : '';
                $sheet .= '<c r="' . $reference . '" t="inlineStr"' . $style . '><is><t xml:space="preserve">' . aiagent_xml((string)$value) . '</t></is></c>';
            }
        }
        $sheet .= '</row>';
    }
    $sheet .= '</sheetData></worksheet>';
    $zip->addFromString('xl/worksheets/sheet1.xml', $sheet);
    $zip->close();
    $content = file_get_contents($temp);
    unlink($temp);
    if ($content === false) {
        throw new RuntimeException('Unable to read the Excel export.');
    }
    return $content;
}

function aiagent_pdf_text(string $text): string
{
    $converted = iconv('UTF-8', 'ASCII//TRANSLIT//IGNORE', $text);
    $converted = $converted === false ? $text : $converted;
    return str_replace(['\\', '(', ')', "\r", "\n"], ['\\\\', '\\(', '\\)', ' ', ' '], $converted);
}

function aiagent_build_pdf(array $table): string
{
    $columns = $table['columns'] ?? [];
    if ($columns === []) {
        throw new RuntimeException('The report has no columns to export.');
    }
    $pageChunks = array_chunk($table['rows'] ?? [], 48);
    if ($pageChunks === []) {
        $pageChunks = [[]];
    }
    $objects = [];
    $objects[1] = '<< /Type /Catalog /Pages 2 0 R >>';
    $objects[3] = '<< /Type /Font /Subtype /Type1 /BaseFont /Helvetica >>';
    $pageRefs = [];
    $width = 792 / count($columns);
    foreach ($pageChunks as $pageIndex => $rows) {
        $pageId = 4 + $pageIndex * 2;
        $contentId = $pageId + 1;
        $pageRefs[] = $pageId . ' 0 R';
        $content = "BT /F1 12 Tf 28 565 Td (" . aiagent_pdf_text((string)($table['title'] ?? 'Report')) . ") Tj ET\n";
        $content .= "BT /F1 7 Tf 28 550 Td (All " . count($table['rows'] ?? []) . " rows) Tj ET\n";
        $y = 530;
        $lineHeight = 10;
        $drawRow = static function (array $values, bool $bold) use (&$content, &$y, $columns, $width, $lineHeight): void {
            $font = $bold ? 'B' : '';
            $x = 28;
            foreach ($columns as $index => $column) {
                $value = $values[$index] ?? '';
                if (is_float($value)) {
                    $value = (string)round($value, 3);
                }
                $text = mb_substr(aiagent_pdf_text((string)$value), 0, max(3, (int)floor($width / 4)));
                $content .= sprintf("%.2F %.2F %.2F %.2F re S\n", $x, $y - $lineHeight + 2, $width, $lineHeight);
                $content .= "BT /" . ($bold ? 'FB' : 'F1') . " 6 Tf " . ($x + 2) . " " . ($y - 5) . " Td (" . $text . ") Tj ET\n";
                $x += $width;
            }
            $y -= $lineHeight;
        };
        $drawRow(array_map(static fn(array $column): string => (string)($column['label'] ?? $column['key'] ?? ''), $columns), true);
        foreach ($rows as $row) {
            $drawRow(array_map(static fn(array $column): mixed => $row[$column['key']] ?? '', $columns), false);
        }
        $stream = $content;
        $objects[$pageId] = '<< /Type /Page /Parent 2 0 R /MediaBox [0 0 842 595] /Resources << /Font << /F1 3 0 R /FB 3 0 R >> >> /Contents ' . $contentId . ' 0 R >>';
        $objects[$contentId] = '<< /Length ' . strlen($stream) . " >>\nstream\n" . $stream . "endstream";
    }
    $objects[2] = '<< /Type /Pages /Kids [' . implode(' ', $pageRefs) . '] /Count ' . count($pageRefs) . ' >>';
    ksort($objects);
    $pdf = "%PDF-1.4\n";
    $offsets = [0];
    foreach ($objects as $id => $object) {
        $offsets[$id] = strlen($pdf);
        $pdf .= $id . " 0 obj\n" . $object . "\nendobj\n";
    }
    $xref = strlen($pdf);
    $maxId = max(array_keys($objects));
    $pdf .= "xref\n0 " . ($maxId + 1) . "\n0000000000 65535 f \n";
    for ($id = 1; $id <= $maxId; $id++) {
        $pdf .= sprintf("%010d 00000 n \n", $offsets[$id] ?? 0);
    }
    $pdf .= "trailer\n<< /Size " . ($maxId + 1) . " /Root 1 0 R >>\nstartxref\n" . $xref . "\n%%EOF";
    return $pdf;
}
