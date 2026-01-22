import json
from pathlib import Path
from typing import OrderedDict

from scripts import models as models


def compare_rules(
    baseline_rules_json_path: str = "rules-main.json",
    new_rules_json_path: str = "validation/metabolights/validation/v2/configuration/rules.json",
    output_path: str = "rule_comparison.tsv",
):
    baseline_rules_path = Path(baseline_rules_json_path)
    new_rules_path = Path(new_rules_json_path)
    rule_comparison = Path(output_path)

    baseline_rules_content = (
        json.loads(baseline_rules_path.read_text())
        .get("rules", {})
        .get("violations", [])
    )
    new_rules_content = (
        json.loads(new_rules_path.read_text()).get("rules", {}).get("violations", [])
    )
    baseline_map = OrderedDict((k["rule_id"], k) for k in baseline_rules_content)
    new_map = OrderedDict((k["rule_id"], k) for k in new_rules_content)
    all_rules_map = new_map.copy()
    all_rules_map.update(baseline_map)

    baseline_rules_set = {k["rule_id"] for k in baseline_rules_content}
    new_rules_set = {k["rule_id"] for k in new_rules_content}

    new_rules = new_rules_set - baseline_rules_set
    deleted_rules = baseline_rules_set - new_rules_set
    # same_rules = baseline_rules_set.intersection(new_rules_set)
    all_rules = list(baseline_rules_set.union(new_rules_set))
    all_rules.sort()
    with rule_comparison.open("w") as f:
        f.write(
            "\t".join(
                [
                    "RULE ID",
                    "STATUS",
                    "OLD TITLE",
                    "NEW TITLE",
                    "OLD DESCRIPTION",
                    "NEW DESCRIPTION",
                    "OLD TYPE",
                    "NEW TYPE",
                    "OLD SECTION",
                    "NEW SECTION",
                ]
            )
            + "\n"
        )

        for rule_id in all_rules:
            rule = all_rules_map.get(rule_id, {})
            row = [""] * 10
            row_updated = False
            row[0] = rule.get("rule_id")
            if rule_id in deleted_rules:
                row[1] = "DELETED"
                baseline_rule = baseline_map.get(rule_id, {})
                row[2] = baseline_rule.get("title", "")
                row[4] = baseline_rule.get("description", "")
                row[6] = baseline_rule.get("type", "")
                row[8] = baseline_rule.get("section", "")
                row_updated = True
            elif rule_id in new_rules:
                row[1] = "ADDED"
                new_rule = new_map.get(rule_id, {})
                row[3] = new_rule.get("title", "")
                row[5] = new_rule.get("description", "")
                row[7] = new_rule.get("type", "")
                row[9] = new_rule.get("section", "")
                row_updated = True
            else:
                baseline_rule = baseline_map.get(rule_id, {})
                new_rule = new_map.get(rule_id, {})
                if new_rule.get("title", "") != baseline_rule.get("title", ""):
                    row[2] = baseline_rule.get("title", "")
                    row[3] = new_rule.get("title", "")
                    row_updated = True
                if new_rule.get("description", "") != baseline_rule.get(
                    "description", ""
                ):
                    row[4] = baseline_rule.get("description", "")
                    row[5] = new_rule.get("description", "")
                    row_updated = True
                if new_rule.get("type", "") != baseline_rule.get("type", ""):
                    row[6] = baseline_rule.get("type", "")
                    row[7] = new_rule.get("type", "")
                    row_updated = True
                if new_rule.get("section", "") != baseline_rule.get("section", ""):
                    row[8] = baseline_rule.get("section", "")
                    row[9] = new_rule.get("section", "")
                    row_updated = True
                if row_updated:
                    row[1] = "UPDATED"
                    row[2] = baseline_rule.get("title", "")
                    row[3] = new_rule.get("title", "")
                    row[4] = baseline_rule.get("description", "")
                    row[5] = new_rule.get("description", "")
                else:
                    row[1] = "-"
            if row_updated:
                f.write("\t".join(row) + "\n")


if __name__ == "__main__":
    compare_rules()
