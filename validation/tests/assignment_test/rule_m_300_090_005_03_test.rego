#########################################################################################################
# Unit tests for rule_m_300_090_005_03
#########################################################################################################
package tests.assignment_test

import rego.v1

# METADATA
# title: Values do not meet maximum length requirement.
# description: Each row must have a value equal or less than the maximum length.
# custom:
#  rule_id: rule_m_300_090_005_03
#  type: ERROR
#  priority: HIGH
#  section: metabolites.general
rule_m_300_090_005_03_test_cases := 1

# # METADATA
# # title: <title>.
# # description: <description>.
# test_tests.assignment_test_no_violation_01 if {
# 	result := rules.tests.assignment_test with input as {
# 	}
# 	count(result) == 0
# }
# # METADATA
# # title: <title>.
# # description: <description>.
# test_tests.assignment_test_violation_01 if {
# 	result := rules.tests.assignment_test with input as {
# 	}
# 	count(result) == 1
# }
