# Unit tests for rule_i_100_350_007_01
package tests.investigation_test

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: Study protocol parameter is missing for a study protocol.
# description: All default study protocol parameters should be defined for study protocol.
# custom:
#  rule_id: rule_i_100_350_007_01
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.studyProtocols
test_rule_i_100_350_007_01 := true

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
