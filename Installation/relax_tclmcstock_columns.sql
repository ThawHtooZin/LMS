-- tclmcstock: legacy inserts omit opening_mc; transfer/load use tclmc_transactions.
ALTER TABLE `tclmcstock`
  MODIFY `opening_mc` int(11) NULL DEFAULT NULL,
  MODIFY `form10mc` int(11) NULL DEFAULT NULL,
  MODIFY `pcs` int(9) NULL DEFAULT NULL,
  MODIFY `kg` float NULL DEFAULT NULL,
  MODIFY `grandtotal_mc` bigint(77) NULL DEFAULT NULL;
