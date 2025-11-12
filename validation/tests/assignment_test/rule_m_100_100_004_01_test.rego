# Unit tests for rule_m_100_100_004_01
package tests.assignment_test

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: Metabolite assignment file not referenced in assay file.
# description: Metabolite assignment file must be referenced in assay file.
# custom:
#  rule_id: rule_m_100_100_004_01
#  type: ERROR
#  priority: CRITICAL
#  section: metabolites.general
test_rule_m_100_100_004_01 := true

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
