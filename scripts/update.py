
import subprocess

from scripts.check_unit_tests import find_diff_between_rules_and_tests
from scripts.create_template_documentation import create_file_structure_documentation, create_recommended_assay_control_lists, create_recommended_control_lists
from scripts.create_validations_summary import create_summary_files
from scripts.format_controls import update_controls
from sync_rules import get_implemented_rules, check_integrity, update_files
from scripts.utils import get_rules

if __name__ == "__main__":
    rules = get_rules()
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
    check_integrity(set(rules.keys()), set(implemented_rules))
    update_files(rules)
    
    find_diff_between_rules_and_tests(force=True)
    update_controls()
    rules = get_rules()
    create_summary_files(rules)
    try:
        result = subprocess.run(["/bin/bash", "./build_bundle.sh"], check=True)
    except Exception as ex:
        print(ex)