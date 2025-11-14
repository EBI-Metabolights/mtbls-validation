#########################################################################################################
# Unit tests for rule_m_100_100_002_01
#########################################################################################################
package tests.assignment_test

import rego.v1

# METADATA
# title: Sample Name columns not in metabolite assignment file.
# description: Sample Name columns must exist in metabolite assignment file.
# custom:
#  rule_id: rule_m_100_100_002_01
#  type: WARNING
#  priority: CRITICAL
#  section: metabolites.general
rule_m_100_100_002_01_test_cases := 1

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
