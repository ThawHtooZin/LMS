-- Run after restore/import on MySQL 8+ / strict sql_mode.
-- Legacy PHP often INSERTs partial rows into Form 7 tables; omitted NOT NULL columns cause error 1364.

ALTER TABLE `form7stock`
  MODIFY `viss` varchar(11) NULL DEFAULT NULL,
  MODIFY `kg` varchar(15) NULL DEFAULT NULL,
  MODIFY `pcspervr` varchar(15) NULL DEFAULT NULL,
  MODIFY `pcsperf7` int(11) NULL DEFAULT NULL,
  MODIFY `link_id` int(11) NULL DEFAULT NULL,
  MODIFY `water_kg` int(11) NULL DEFAULT NULL,
  MODIFY `fish_type` varchar(255) NULL DEFAULT NULL;

ALTER TABLE `form7stocktcl`
  MODIFY `date` date NULL DEFAULT NULL,
  MODIFY `viss` varchar(11) NULL DEFAULT NULL,
  MODIFY `kg` varchar(15) NULL DEFAULT NULL,
  MODIFY `pcspervr` varchar(15) NULL DEFAULT NULL,
  MODIFY `pcsperf7` int(11) NULL DEFAULT NULL,
  MODIFY `link_id` int(11) NULL DEFAULT NULL;
