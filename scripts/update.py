
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

    # assay_controlled_terms = create_recommended_assay_control_lists()

    # templates_path = (
    #     "validation/metabolights/validation/v2/controlLists/investigationFile"
    # )
    # file_name = "investigation-file"
    # title = "Investigation File"
    # create_recommended_control_lists(
    #     templates_path=templates_path, file_name=file_name, title=title
    # )
    # templates_path = "validation/metabolights/validation/v2/controlLists/sampleColumns"
    # file_name = "sample-file"
    # title = "Sample File"
    # sample_controlled_terms = create_recommended_control_lists(
    #     templates_path=templates_path, file_name=file_name, title=title
    # )

    # templates_path = "validation/metabolights/validation/v2/controlLists/unitColumns"
    # file_name = "unit-columns"
    # title = "Unit Columns"
    # create_recommended_control_lists(
    #     templates_path=templates_path, file_name=file_name, title=title
    # )

    # create_file_structure_documentation(
    #     assay_controlled_terms=assay_controlled_terms,
    #     sample_controlled_terms=sample_controlled_terms,
    # )
