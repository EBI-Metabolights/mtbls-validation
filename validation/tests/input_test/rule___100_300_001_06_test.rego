# Unit tests for rule___100_300_001_06
package tests.input_test

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: Technology type not defined for assay file.
# description: Assay file technology type must be defined to execute validation rules.
# custom:
#  rule_id: rule___100_300_001_06
#  type: ERROR
#  priority: CRITICAL
#  section: assays.general
test_rule___100_300_001_06 := true

# # METADATA
# # title: <title>.
# # description: <description>.
# test_tests.input_test_no_violation_01 if {
# 	result := rules.tests.input_test with input as {
# 	}
# 	count(result) == 0
# }
# # METADATA
# # title: <title>.
# # description: <description>.
# test_tests.input_test_violation_01 if {
# 	result := rules.tests.input_test with input as {
# 	}
# 	count(result) == 1
# }
