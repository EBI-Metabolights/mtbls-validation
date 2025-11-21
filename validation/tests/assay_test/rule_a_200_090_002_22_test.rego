#########################################################################################################
# Unit tests for rule_a_200_090_002_22
#########################################################################################################
package tests.assay_test

import data.metabolights.validation.v2.rules.phase2.violations as rules

import rego.v1

# METADATA
# title: Value is not in the predefined ontologies or controlled lists associated with this column
# description: A term SHOULD be selected from the predefined ontologies or controlled lists associated with this column.
# custom:
#  rule_id: rule_a_200_090_002_22
#  type: WARNING
#  priority: HIGH
#  section: assays.general
rule_a_200_090_002_22_test_cases := 1

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
