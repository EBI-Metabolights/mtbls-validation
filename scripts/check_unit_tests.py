import glob
import re

from scripts.utils import get_rules

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


def get_unit_tests() -> dict[str, dict[str, list[str]]]:
    files = [
        x
        for x in glob.iglob("./validation/tests/**/*.rego", recursive=True)
        if x.endswith("_test.rego")
    ]
    pattern = (
        r"^\s*test_(rule_[isamf_]_[0-9]{3}_[0-9]{3}_[0-9]{3}_[0-9]{2})_(.+)\s+if \{"
    )
    unit_tests: dict[str, dict[str, list[str]]] = {}
    for file in files:
        with open(file, "r") as f:
            rows = f.readlines()
            total_lines = len(rows)
            for line in range(total_lines):
                match = re.match(pattern, rows[line])
                if match:
                    rule = match.groups()[0]
                    if rule not in unit_tests:
                        unit_tests[rule] = {}
                    rules = unit_tests[rule]
                    if file not in rules:
                        rules[file] = []
                    test_cases = rules[file]
                    test_cases.append(rows[line].strip())
    return unit_tests


def find_diff_between_rules_and_tests(force: bool = False):
    unit_tests = get_unit_tests()
    rules = get_rules()
    rule_names = {x for x in rules.keys() if len(x) > 14}
    test_names = {x for x in unit_tests.keys() if len(x) > 14}
    diff = list(rule_names.difference(test_names))
    if diff:
        diff.sort()
        print("Some rules do not have unit tests:")
        print("\n".join(diff))
    else:
        print("All rules have at least one unit test")

    extras = list(test_names.difference(rule_names))

    if extras:
        extras.sort()
        print("Some unit tests do not have a rule:")
        print("\n".join(extras))

    test_cases_in_multiple_files = list(
        {x for x, y in unit_tests.items() if len(y) > 1}
    )
    if test_cases_in_multiple_files:
        test_cases_in_multiple_files.sort()
        print("Some unit tests are in multiple files:")
        print("\n".join(test_cases_in_multiple_files))

    header_printed = False
    for rule, file_rules in unit_tests.items():
        cases = sum([len(x) for x in file_rules.values()])
        if cases < 2:
            if not header_printed:
                print("Some rules have less than 2 test cases:")
                header_printed = True
            print(rule)


if __name__ == "__main__":
    rules = find_diff_between_rules_and_tests(force=True)
