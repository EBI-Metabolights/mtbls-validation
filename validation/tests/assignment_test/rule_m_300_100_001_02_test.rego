#########################################################################################################
# Unit tests for rule_m_300_100_001_02
#########################################################################################################
package tests.assignment_test

import rego.v1

# METADATA
# title: retention_time column has empty values in metabolite assignment file.
# description: All 'retention_time' column values must be defined in metabolite assignment file for LC-MS / GC-MS.
# custom:
#  rule_id: rule_m_300_100_001_02
#  type: ERROR
#  priority: HIGH
#  section: metabolites.lcms
rule_m_300_100_001_02_test_cases := 1

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
