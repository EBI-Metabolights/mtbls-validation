# Unit tests for rule_m_300_200_001_02
package tests.assignment_test

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: chemical_shift column values not numeric in metabolite assignment file.
# description: All 'chemical_shift' column values should be numeric in metabolite assignment file.
# custom:
#  rule_id: rule_m_300_200_001_02
#  type: WARNING
#  priority: HIGH
#  section: metabolites.nmr
test_rule_m_300_200_001_02 := true

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
