# Unit tests for rule_m_100_100_006_01
package tests.assignment_test

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: There is no row in metabolite assignment file.
# description: No row is defined in metabolite assignment file. Add more than one row (assignment). Please ensure all xxx, including controls, QCs, standards, etc, are referenced.
# custom:
#  rule_id: rule_m_100_100_006_01
#  type: ERROR
#  priority: CRITICAL
#  section: metabolites.general
test_rule_m_100_100_006_01 := true

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
