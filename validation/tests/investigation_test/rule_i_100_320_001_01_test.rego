# Unit tests for rule_i_100_320_001_01
package tests.investigation_test

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: No study publications referenced in investigation file.
# description: At least one study publications must be defined in i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_320_001_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyPublications
test_rule_i_100_320_001_01 := true

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
