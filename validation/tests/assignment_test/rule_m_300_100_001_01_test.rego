# Unit tests for rule_m_300_100_001_01
package tests.assignment_test

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: mass_to_charge column has empty values in metabolite assignment file.
# description: All 'mass_to_charge' column values must be defined in metabolite assignment file.
# custom:
#  rule_id: rule_m_300_100_001_01
#  type: ERROR
#  priority: HIGH
#  section: metabolites.lcms
test_rule_m_300_100_001_01 := true

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
