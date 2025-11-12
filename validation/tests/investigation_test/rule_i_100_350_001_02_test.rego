# Unit tests for rule_i_100_350_001_02
package tests.investigation_test

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: A study protocol is missing in investigation file.
# description: All study protocols should be defined considering assay technologies used in study.
# custom:
#  rule_id: rule_i_100_350_001_02
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.studyProtocols
test_rule_i_100_350_001_02 := true

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
