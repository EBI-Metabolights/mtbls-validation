#########################################################################################################
# Unit tests for rule_s_100_100_001_07
#########################################################################################################
package tests.sample_test

import rego.v1

# METADATA
# title: Empty columns in sample file.
# description: Empty columns must not exist in sample file. All column headers should be defined.
# custom:
#  rule_id: rule_s_100_100_001_07
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
rule_s_100_100_001_07_test_cases := 1

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
