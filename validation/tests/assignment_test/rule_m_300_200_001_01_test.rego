#########################################################################################################
# Unit tests for rule_m_300_200_001_01
#########################################################################################################
package tests.assignment_test

import rego.v1

# METADATA
# title: chemical_shift column has empty values in metabolite assignment file.
# description: All 'chemical_shift' column values should be defined in metabolite assignment file.
# custom:
#  rule_id: rule_m_300_200_001_01
#  type: WARNING
#  priority: CRITICAL
#  section: metabolites.nmr
rule_m_300_200_001_01_test_cases := 1

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
