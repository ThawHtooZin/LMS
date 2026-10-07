#!/usr/bin/env python3
"""Merge mysqldump schema with data sections from an older backup file."""

import re
import sys
from pathlib import Path

CONTACT_TYPES = (
    "Fish Supplier",
    "Material Supplier",
    "Cold Store Factory",
    "Export Customer",
    "Other",
)


def extract_table_names(schema_text: str) -> list[str]:
    return re.findall(r"-- Table structure for table `([^`]+)`", schema_text)


def extract_structure_block(schema_text: str, table: str) -> str:
    pattern = (
        rf"-- Table structure for table `{re.escape(table)}`\s*\n"
        rf"(.*?)(?=\n-- Table structure for table `|\Z)"
    )
    m = re.search(pattern, schema_text, re.DOTALL)
    return m.group(0).strip() + "\n\n" if m else ""


def extract_data_block(old_text: str, table: str) -> str:
    pattern = (
        rf"-- Dumping data for table `{re.escape(table)}`\s*\n"
        rf"(.*?UNLOCK TABLES;\s*\n)"
    )
    m = re.search(pattern, old_text, re.DOTALL)
    return m.group(0) if m else ""


def fix_contacts_insert(data_block: str) -> str:
    if "INSERT INTO `contacts`" not in data_block:
        return data_block
    for ct in CONTACT_TYPES:
        data_block = data_block.replace(f"'{ct}',", f"'{ct}',NULL,")
    return data_block


def main() -> int:
    if len(sys.argv) != 4:
        print("Usage: merge_schema_with_backup_data.py <schema.sql> <old_backup.sql> <out.sql>")
        return 1

    schema_path = Path(sys.argv[1])
    old_path = Path(sys.argv[2])
    out_path = Path(sys.argv[3])

    schema_text = schema_path.read_text(encoding="utf-8", errors="replace")
    old_text = old_path.read_text(encoding="utf-8", errors="replace")

    header_end = schema_text.find("-- Table structure for table ")
    header = schema_text[:header_end] if header_end != -1 else ""
    footer_match = re.search(r"/\*!40103 SET TIME_ZONE=@OLD_TIME_ZONE \*/.*", schema_text, re.DOTALL)
    footer = footer_match.group(0) if footer_match else ""

    parts = [header]
    for table in extract_table_names(schema_text):
        block = extract_structure_block(schema_text, table)
        if not block:
            continue
        parts.append(block)
        data = extract_data_block(old_text, table)
        if data:
            if table == "contacts":
                data = fix_contacts_insert(data)
            parts.append(data)
            parts.append("\n")

    parts.append(footer)
    out_path.write_text("".join(parts), encoding="utf-8")
    print(f"Wrote {out_path} ({len(extract_table_names(schema_text))} tables)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
