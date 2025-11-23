import subprocess

from scripts.update.checks.check_unit_tests import (
    check_differences_between_rules_and_tests,
)
from scripts.update.pages.create_all_controls_json import create_all_controls_json
from scripts.update.pages.create_all_templates_json import create_all_templates_json
from scripts.update.pages.create_investigation_file_templates import (
    create_investigation_file_templates,
)
from scripts.update.pages.create_summary_page import create_index_md_file
from scripts.update.pages.create_template_documentation import (
    create_control_and_template_pages,
)
from scripts.update.pages.create_validation_rule_summary_pages import (
    create_validation_rule_summary_pages,
)
from scripts.update.rules.update_control_json_files import (
    update_control_list_json_files,
)
from scripts.update.rules.update_rego_rule_metadata_comments import (
    check_excel_and_rego_rules_integrity,
    get_implemented_rules,
    update_rego_rule_metadata_comments,
)
from scripts.update.rules.update_template_json_files import (
    update_template_json_files,
)
from scripts.utils import read_rules_from_excel


def check_uniqueness(rules):
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


if __name__ == "__main__":
    excel_rules = read_rules_from_excel()
    implemented_rules = get_implemented_rules()
    try:
        result = subprocess.run(["uv", "run", "ruff", "check", "--fix"], check=True)
        print(result)
        result = subprocess.run(["uv", "run", "ruff", "format"], check=True)
        print(result)
    except Exception as ex:
        print(ex)

    check_uniqueness(excel_rules)

    check_excel_and_rego_rules_integrity(
        set(excel_rules.keys()), set(implemented_rules)
    )

    update_rego_rule_metadata_comments(excel_rules)

    check_differences_between_rules_and_tests(force=True)

    update_control_list_json_files()
    update_template_json_files()
    create_all_templates_json()
    create_all_controls_json()
    create_investigation_file_templates()
    create_validation_rule_summary_pages(excel_rules)
    create_control_and_template_pages()
    create_index_md_file()
    try:
        result = subprocess.run(["/bin/bash", "./build_bundle.sh"], check=True)
    except Exception as ex:
        print(ex)
