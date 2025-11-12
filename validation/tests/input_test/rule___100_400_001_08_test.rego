# Unit tests for rule___100_400_001_08
package tests.input_test

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: Metabolite assignment file name contains invalid characters.
# description: Use only .-_A-Za-z0-9 characters for an metabolite assignment file name. e.g. m_REQ2025010211233_LC-MS_negative_reverse-phase_metabolite_profiling_v2_maf.tsv
# custom:
#  rule_id: rule___100_400_001_08
#  type: ERROR
#  priority: CRITICAL
#  section: metabolites.general
test_rule___100_400_001_08 := true

# # METADATA
# # title: <title>.
# # description: <description>.
# test_tests.input_test_no_violation_01 if {
# 	result := rules.tests.input_test with input as {
# 	}
# 	count(result) == 0
# }
# # METADATA
# # title: <title>.
# # description: <description>.
# test_tests.input_test_violation_01 if {
# 	result := rules.tests.input_test with input as {
# 	}
# 	count(result) == 1
# }
