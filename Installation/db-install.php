<?php

// Structure and seed data live in Installation/database.
// From the LMS folder: php Installation/migrate.php
if (PHP_SAPI !== 'cli') {
    http_response_code(403);
}
echo "This installer is retired. From the LMS folder run: php Installation/migrate.php\n";
exit(1);
