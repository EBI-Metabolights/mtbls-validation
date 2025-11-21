import os
import shutil

from scripts.utils import get_rules

folder_map = {
    "rule_i_": "investigation_test",
    "rule_a_": "assay_test",
    "rule_s_": "sample_test",
    "rule_m_": "assignment_test",
    "rule_f_": "file_test",
    "rule___": "input_test",
}

tests_root_path = "validation/tests"
package_root_path = "tests"

rules = get_rules()
for rule in rules:
    if len(rule) <= len("rule_m_100_100"):
        continue
    prefix = rule[:7]
    folder = folder_map.get(prefix)
    if not folder:
        raise ValueError("rule id has an unexpected prefix")
    folder_path = os.path.join(tests_root_path, folder)
    package_name = os.path.join(package_root_path, folder).replace(os.sep, ".")
    test_file_path = os.path.join(folder_path, f"{rule}_test.rego")
    template = False
    if os.path.exists(test_file_path):
        with open(test_file_path) as f:
            lines = len(f.readlines())
            if lines < 31:
                template = True
    if template:
        os.remove(test_file_path)
    if not os.path.exists(test_file_path):
        os.makedirs(folder_path, exist_ok=True)

        test_template = f"""#########################################################################################################
# Unit tests for {rule}
#########################################################################################################
package {package_name}

import rego.v1
# METADATA
# title: Term Source File length less than 2 characters in investigation file.
# description: Term Source File should be defined with length equal or greater than 2 characters in the ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt.
# custom:
#  rule_id: {rule}
#  type: WARNING
#  priority: HIGH
#  section: investigation.ontologySourceReferences
{rule}_test_cases := 1

# # METADATA
# # title: <title>.
# # description: <description>.
# test_{package_name}_no_violation_01 if {{
# 	result := rules.{package_name} with input as {{
# 	}}
# 	count(result) == 0
# }}
# # METADATA
# # title: <title>.
# # description: <description>.
# test_{package_name}_violation_01 if {{
# 	result := rules.{package_name} with input as {{
# 	}}
# 	count(result) == 1
# }}
"""

        with open(test_file_path, "w") as f:
            f.write(test_template)
