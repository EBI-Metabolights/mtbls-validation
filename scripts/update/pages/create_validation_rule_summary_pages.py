import datetime
import json
from pathlib import Path
from typing import OrderedDict

import pandas as pd
from pydantic.alias_generators import to_pascal

from scripts.models import PolicyMessageType, Violation
from scripts.utils import escape, read_rules_from_excel

metadata_lines = [
    "# METADATA",
    "# title:",
    "# description:",
    "# custom:",
    "#  rule_id:",
    "#  type:",
    "#  priority:",
    "#  section:",
]


def create_validation_rule_summary_pages(rules: dict[str, pd.Series]):
    now = datetime.datetime.now(datetime.timezone.utc).isoformat()
    version_file = "validation/metabolights/validation/v2/configuration/version.json"
    with open(version_file, "r") as f:
        version_content = json.loads(f.read())
    version = version_content["version"]

    violations_file = "docs/json/all_rules.json"
    violations, summary = get_items(rules)
    violations_json = [x.model_dump() for x in violations]
    summary_json = [x.model_dump() for x in summary]
    versioned_content = {
        "validation_version": version,
        "created_at": now,
        "violations": violations_json,
        "summary": summary_json,
    }
    with open(violations_file, "w") as f:
        json.dump(versioned_content, f, indent=4)

    summary_file = "validation/metabolights/validation/v2/configuration/rules.json"
    with open(summary_file, "w") as f:
        json.dump({"rules": versioned_content}, f, indent=4)

    section_violations: OrderedDict[str, list[Violation]] = OrderedDict()
    for item in violations:
        if item.section not in section_violations:
            section_violations[item.section] = []
        section_violations[item.section].append(item)
    validations_path = Path("docs/validation-rules")
    validations_path.mkdir(parents=True, exist_ok=True)
    for section in section_violations:
        with open(
            f"docs/validation-rules/{section.removesuffix('s')}-validation-rules.md",
            "w",
        ) as f:
            f.write(f"# {to_pascal(section)} Validation Rules\n\n")
            f.write(
                "| # |RULE ID  | TYPE  | TITLE  | DESCRIPTION |\n"
                "|---|---------|-------|--------|-------------|\n"
            )
            for idx, item in enumerate(section_violations[section]):
                f.write(
                    f"| {idx + 1} "
                    f"| {escape(item.rule_id)} "
                    f"| {escape(item.type.value)} "
                    f"| {escape(item.title)} "
                    f"| {escape(item.description)} |\n"
                )

    with open("docs/validation-rules/all-rules.md", "w") as f:
        f.write(
            "| # |RULE ID  | TYPE  | TITLE   | DESCRIPTION  |\n"
            "|---|---------|-------|---------|--------------|\n"
        )
        for idx, item in enumerate(violations):
            f.write(
                f"| {idx + 1} "
                f"| {escape(item.rule_id)} "
                f"| {escape(item.type.value)} "
                f"| {escape(item.title)} "
                f"| {escape(item.description)} |\n"
            )


def get_items(rules):
    violations: list[Violation] = []
    summary: list[Violation] = []
    for rule_id, rule in rules.items():
        item = Violation(
            rule_id=rule_id,
            title=str(rule["TITLE"]).strip(),
            description=str(rule["DESCRIPTION"]).strip(),
            type=PolicyMessageType(
                str(rule["TYPE"].strip()) if rule["TYPE"] else PolicyMessageType.INFO
            ),
            section=str(rule["SECTION"].split(".")[0]),
            priority=str(rule["PRIORITY"].split(".")[0]),
        )
        if len(rule_id) < 15:
            summary.append(item)
        else:
            violations.append(item)
    for items in (violations, summary):
        items.sort(key=lambda x: x.rule_id)
    return violations, summary


if __name__ == "__main__":
    rules = read_rules_from_excel()
    create_validation_rule_summary_pages(rules)
