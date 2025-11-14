#########################################################################################################
# Unit tests for rule_s_200_200_002_02
#########################################################################################################
package tests.sample_test

import rego.v1

# METADATA
# title: Factor Value column not complete.
# description: At least two values must be defined in Factor Value column.
# custom:
#  rule_id: rule_s_200_200_002_02
#  type: ERROR
#  priority: HIGH
#  section: samples.sampleCollection
rule_s_200_200_002_02_test_cases := 1

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
