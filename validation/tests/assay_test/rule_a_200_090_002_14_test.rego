#########################################################################################################
# Unit tests for rule_a_200_090_002_14
#########################################################################################################
package tests.assay_test

import data.metabolights.validation.v2.rules.phase2.violations as rules

import rego.v1

# METADATA
# title: Term is not a child of of the selected ontology terms.
# description: The term MUST be a child of the selected ontology terms.
# custom:
#  rule_id: rule_a_200_090_002_14
#  type: ERROR
#  priority: HIGH
#  section: assays.general
rule_a_200_090_002_14_test_cases := 1

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
