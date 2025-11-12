# Unit tests for rule_m_300_100_001_03
package tests.assignment_test

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: retention_time column values not numeric in metabolite assignment file.
# description: All 'retention_time' column values should be numeric.
# custom:
#  rule_id: rule_m_300_100_001_03
#  type: WARNING
#  priority: HIGH
#  section: metabolites.lcms
test_rule_m_300_100_001_03 := true

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
