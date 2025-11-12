# Unit tests for rule_i_100_320_007_01
package tests.investigation_test

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: Study Publication Status is not in the control list.
# description: Study Publication Status value MUST be selected from the control list.
# custom:
#  rule_id: rule_i_100_320_007_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyPublications
test_rule_i_100_320_007_01 := true

# # METADATA
# # title: <title>.
# # description: <description>.
# test_tests.investigation_test_no_violation_01 if {
# 	result := rules.tests.investigation_test with input as {
# 	}
# 	count(result) == 0
# }
# # METADATA
# # title: <title>.
# # description: <description>.
# test_tests.investigation_test_violation_01 if {
# 	result := rules.tests.investigation_test with input as {
# 	}
# 	count(result) == 1
# }
