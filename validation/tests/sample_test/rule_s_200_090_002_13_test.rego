#########################################################################################################
# Unit tests for rule_s_200_090_002_13
#########################################################################################################
package tests.sample_test

import rego.v1

# METADATA
# title: Value has not a valid pattern.
# description: The column value MUST have a valid pattern value.
# custom:
#  rule_id: rule_s_200_090_002_13
#  type: ERROR
#  priority: HIGH
#  section: samples.general
rule_s_200_090_002_13_test_cases := 1

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
