#########################################################################################################
# Unit tests for rule_s_200_090_004_02
#########################################################################################################
package tests.sample_test

import rego.v1

# METADATA
# title: Values do not meet minimum length requirement.
# description: Each row should have a value equal or greater than the minimum length.
# custom:
#  rule_id: rule_s_200_090_004_02
#  type: ERROR
#  priority: HIGH
#  section: samples.general
rule_s_200_090_004_02_test_cases := 1

# # METADATA
# # title: <title>.
# # description: <description>.
# test_tests.sample_test_no_violation_01 if {
# 	result := rules.tests.sample_test with input as {
# 	}
# 	count(result) == 0
# }
# # METADATA
# # title: <title>.
# # description: <description>.
# test_tests.sample_test_violation_01 if {
# 	result := rules.tests.sample_test with input as {
# 	}
# 	count(result) == 1
# }
