#########################################################################################################
# Unit tests for rule_m_100_100_001_04
#########################################################################################################
package tests.assignment_test

import rego.v1

# METADATA
# title: Default column header name is not unique in the metabolite assignment file.
# description: Default column header name should be unique in the metabolite assignment file.
# custom:
#  rule_id: rule_m_100_100_001_04
#  type: ERROR
#  priority: CRITICAL
#  section: metabolites.general
rule_m_100_100_001_04_test_cases := 1

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
