#########################################################################################################
# Unit tests for rule_i_100_340_003_01
#########################################################################################################
package tests.investigation_test

import rego.v1

# METADATA
# title: Study Assay Measurement Type is empty
# description: Study Assay Measurement Type should be defined.
# custom:
#  rule_id: rule_i_100_340_003_01
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyAssays
rule_i_100_340_003_01_test_cases := 1

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
