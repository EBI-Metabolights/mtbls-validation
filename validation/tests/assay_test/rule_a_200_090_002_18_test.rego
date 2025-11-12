# Unit tests for rule_a_200_090_002_18
package tests.assay_test
import data.metabolights.validation.v2.rules.phase2.violations as rules

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: Unexpected value in the column.
# description: There is an unexpected value list for the selected column. Use valid text, ontology term or controlled vocabulary for the selected column.
# custom:
#  rule_id: rule_a_200_090_002_18
#  type: ERROR
#  priority: HIGH
#  section: assays.general
test_rule_a_200_090_002_18 := true

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
