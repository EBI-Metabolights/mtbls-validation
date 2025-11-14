#########################################################################################################
# Unit tests for rule_m_100_100_002_02
#########################################################################################################
package tests.assignment_test

import rego.v1

# METADATA
# title: MS Assay Name or NMR Assay Name columns not in metabolite assignment file
# description: If Sample Name columns do not exist, MS Assay Name or NMR Assay Name columns should be defined in metabolite assignment file.
# custom:
#  rule_id: rule_m_100_100_002_02
#  type: WARNING
#  priority: CRITICAL
#  section: metabolites.general
rule_m_100_100_002_02_test_cases := 1

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
