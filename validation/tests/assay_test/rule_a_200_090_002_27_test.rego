#########################################################################################################
# Unit tests for rule_a_200_090_002_27
#########################################################################################################
package tests.assay_test

import data.metabolights.validation.v2.rules.phase2.violations as rules

import rego.v1

# METADATA
# title: The value appears in the list of not-recommended values for this column.
# description: Select an alternative value that meets the requirement or leave it empty (if it is not required).
# custom:
#  rule_id: rule_a_200_090_002_27
#  type: WARNING
#  priority: HIGH
#  section: assays.general
rule_a_200_090_002_27_test_cases := 1

# # METADATA
# # title: <title>.
# # description: <description>.
# test_tests.assay_test_no_violation_01 if {
# 	result := rules.tests.assay_test with input as {
# 	}
# 	count(result) == 0
# }
# # METADATA
# # title: <title>.
# # description: <description>.
# test_tests.assay_test_violation_01 if {
# 	result := rules.tests.assay_test with input as {
# 	}
# 	count(result) == 1
# }
