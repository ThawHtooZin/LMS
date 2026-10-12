-- Fixed seeder for `config_coldstore` from lms_backup_2026-10-12_06-16-00.sql.
-- Applied once. To add more data, create a new .sql file in this folder and run migrate.php again.

INSERT INTO `config_coldstore` VALUES (1,'HHK'),(2,'GFC');
