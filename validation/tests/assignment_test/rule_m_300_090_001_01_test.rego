#########################################################################################################
# Unit tests for rule_m_300_090_001_01
#########################################################################################################
package tests.assignment_test

import rego.v1

# METADATA
# title: Values with trailing or leading spaces in metabolite assignment file.
# description: Values in metabolite assignment file should not start or end with space characters.
# custom:
#  rule_id: rule_m_300_090_001_01
#  type: ERROR
#  priority: HIGH
#  section: metabolites.general
rule_m_300_090_001_01_test_cases := 1

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
