#!/usr/bin/env python3
"""Split a mysqldump into one structure migration and one seeder file per table that has rows.

Login history is not seed data, so `userlogs` inserts are left out.
"""

import re
import sys
from pathlib import Path

SKIP_SEED_TABLES = {"userlogs"}
SOURCE_NAME = "lms_backup_2026-10-12_06-16-00.sql"


def main() -> int:
    root = Path(__file__).resolve().parent
    dump_path = Path(sys.argv[1]) if len(sys.argv) > 1 else (
        root.parents[1] / "App" / "admin" / "backup" / "db_backups" / SOURCE_NAME
    )
    text = dump_path.read_text(encoding="utf-8", errors="replace")
    lines = text.splitlines(keepends=True)

    header_end = next(i for i, line in enumerate(lines) if line.startswith("-- Table structure for table "))
    footer_start = next(i for i, line in enumerate(lines) if line.startswith("/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */"))

    migrations = root / "migrations"
    seeders = root / "seeders"
    migrations.mkdir(exist_ok=True)
    seeders.mkdir(exist_ok=True)

    structure_parts = [
        "-- Baseline structure taken from " + dump_path.name + ".\n",
        "-- Fixed schema. Later structure changes go in new files in this folder.\n",
        "-- Drops and recreates every table. migrate.php runs this only on an empty database, or with --fresh.\n",
        "\n",
    ]
    structure_parts.extend(lines[:header_end])

    inserts = {}
    i = header_end
    while i < footer_start:
        line = lines[i]
        if line.startswith("-- Table structure for table "):
            table = re.search(r"`([^`]+)`", line).group(1)
            block = [line]
            i += 1
            while i < footer_start and not lines[i].startswith("-- Dumping data for table ") and not lines[i].startswith("-- Table structure for table "):
                block.append(lines[i])
                i += 1
            structure_parts.extend(block)
            if not structure_parts[-1].endswith("\n"):
                structure_parts.append("\n")
            structure_parts.append("\n")
            continue
        if line.startswith("INSERT INTO `"):
            table = re.search(r"INSERT INTO `([^`]+)`", line).group(1)
            inserts.setdefault(table, []).append(line if line.endswith("\n") else line + "\n")
        i += 1

    structure_parts.append("\n")
    structure_parts.extend(lines[footer_start:])
    schema_path = migrations / "2026_10_12_061600_baseline_structure.sql"
    schema_sql = "".join(structure_parts)
    schema_path.write_text(schema_sql, encoding="utf-8")

    seed_tables = [name for name in inserts if name not in SKIP_SEED_TABLES]
    width = max(2, len(str(len(seed_tables))))
    written = []
    for index, table in enumerate(seed_tables, start=1):
        filename = f"2026_10_12_061600_{index:0{width}d}_seed_{table}.sql"
        body = [
            f"-- Fixed seeder for `{table}` from {dump_path.name}.\n",
            "-- Applied once. To add more data, create a new .sql file in this folder and run migrate.php again.\n",
            "\n",
        ]
        body.extend(inserts[table])
        path = seeders / filename
        path.write_text("".join(body), encoding="utf-8")
        written.append(path.name)

    print(f"schema: {schema_path.name}")
    print(f"create tables: {schema_sql.count(chr(10) + 'CREATE TABLE ')}")
    print(f"seeders: {len(written)}")
    for name in written:
        print(f"  {name}")
    skipped = sorted(set(inserts) & SKIP_SEED_TABLES)
    if skipped:
        print("skipped seed tables:", ", ".join(skipped))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
