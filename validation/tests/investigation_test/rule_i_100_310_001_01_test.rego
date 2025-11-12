# Unit tests for rule_i_100_310_001_01
package tests.investigation_test

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: There are less than 3 Study Design Descriptors in the Study Design Descriptors section of investigation file.
# description: At least 3 study design descriptors should be defined.
# custom:
#  rule_id: rule_i_100_310_001_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyDesignDescriptors
test_rule_i_100_310_001_01 := true

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
