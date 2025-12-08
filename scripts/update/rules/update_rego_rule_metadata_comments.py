import glob

import pandas as pd

from scripts.utils import read_rules_from_excel

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


def update_rego_rule_metadata_comments(rules: dict[str, pd.Series]):
    files = [x for x in glob.iglob("./validation/**/*.rego", recursive=True)]
    for file in files:
        rows = []
        updated: bool = False
        with open(file, "r") as f:
            rows = f.readlines()
            total_lines = len(rows)
            for line in range(total_lines):
                if (line + 5) < total_lines:
                    metadata_header = True
                    for i in range(8):
                        if not rows[line + i].startswith(metadata_lines[i]):
                            metadata_header = False
                            break
                    if metadata_header:
                        rule_id = rows[line + 4].split(":")[1].strip()
                        if rule_id in rules:
                            rule = rules[rule_id]
                            updated = True
                            rows[line + 1] = get_value(rule, "title")
                            rows[line + 2] = get_value(rule, "description")
                            rows[line + 5] = get_value(rule, "type", "  ")
                            rows[line + 6] = get_value(rule, "priority", "  ")
                            rows[line + 7] = get_value(rule, "section", "  ")

        if updated:
            # print(f"Updating file: {file}")
            with open(file, "w") as f:
                f.writelines(rows)


def get_implemented_rules():
    files = [
        x
        for x in glob.iglob("./validation/**/*.rego", recursive=True)
        if "/tests/" not in x
    ]
    rules: list[str] = []
    non_unique_rules = set()
    unique_rules = set()

    for file in files:
        with open(file, "r") as f:
            rows = f.readlines()
            total_lines = len(rows)
            for line in range(total_lines):
                rule_id = True
                if rows[line].startswith("#  rule_id:"):
                    rule_id = rows[line].split(":")[1].strip()
                    rules.append(rule_id)
                    if rule_id not in unique_rules:
                        unique_rules.add(rule_id)
                    else:
                        non_unique_rules.add(rule_id)
    if non_unique_rules:
        print("Some implemented rules are not unique")
        print(non_unique_rules)
    return rules


def get_value(rule, key: str, padding: str = " "):
    return (
        f"#{padding}{key}: "
        + " ".join(rule[key.upper()].strip().split())
        .replace(":", " ")
        .replace("<<", "{")
        .replace(">>", "}")
        + "\n"
    )


def check_excel_and_rego_rules_integrity(rules: set[str], implemented_rules: set[str]):
    non_implemented_rules = rules - implemented_rules
    unexpected_implementations = implemented_rules - rules

    if non_implemented_rules:
        print("These rules are not implemented:")
        print(non_implemented_rules)

    if unexpected_implementations:
        print("These implemented rules are not listed rules:")
        print(unexpected_implementations)


if __name__ == "__main__":
    rules = read_rules_from_excel()
    implemented_rules = get_implemented_rules()
    listed_rules = list(rules.keys())
    unique_rules = set()
    non_unique_rules = set()
    for rule in listed_rules:
        if rule not in unique_rules:
            unique_rules.add(rule)
        else:
            non_unique_rules.add(rule)
    if non_unique_rules:
        print("Some listed rules are not unique:")
        print(non_unique_rules)
    check_excel_and_rego_rules_integrity(set(rules.keys()), set(implemented_rules))
    update_rego_rule_metadata_comments(rules)
