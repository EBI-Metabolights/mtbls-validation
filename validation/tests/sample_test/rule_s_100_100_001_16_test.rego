#########################################################################################################
# Unit tests for rule_s_100_100_001_16
#########################################################################################################
package tests.sample_test

import rego.v1

# METADATA
# title: Unexpected Factor Value columns in sample file.
# description: There should be a study factor for each Factor Value column in sample file.
# custom:
#  rule_id: rule_s_100_100_001_16
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
rule_s_100_100_001_16_test_cases := 1

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
