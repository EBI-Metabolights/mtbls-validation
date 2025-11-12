# Unit tests for rule_i_100_300_003_02
package tests.investigation_test

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: Non-printable characters in Study Title.
# description: Study title should contain only printable characters.
# custom:
#  rule_id: rule_i_100_300_003_02
#  type: ERROR
#  priority: HIGH
#  section: investigation.studies
test_rule_i_100_300_003_02 := true

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
