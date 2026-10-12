-- Fixed seeder for `role` from lms_backup_2026-10-12_06-16-00.sql.
-- Applied once. To add more data, create a new .sql file in this folder and run migrate.php again.

INSERT INTO `role` VALUES (1,'Admin'),(2,'Stock'),(3,'Shippment'),(4,'TCL'),(5,'Coldstore'),(6,'Visitor');
