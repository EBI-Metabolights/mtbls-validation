# Unit tests for rule_a_200_090_002_15
package tests.assay_test
import data.metabolights.validation.v2.rules.phase2.violations as rules

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: Value has not a valid pattern.
# description: The column value must have a valid pattern value.
# custom:
#  rule_id: rule_a_200_090_002_15
#  type: ERROR
#  priority: HIGH
#  section: assays.general
test_rule_a_200_090_002_15 := true

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
