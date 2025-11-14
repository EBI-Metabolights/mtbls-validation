#########################################################################################################
# Unit tests for rule_s_100_100_001_03
#########################################################################################################
package tests.sample_test

import rego.v1

# METADATA
# title: Some default columns are missing in sample file.
# description: All default columns should exist in sample file.
# custom:
#  rule_id: rule_s_100_100_001_03
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
rule_s_100_100_001_03_test_cases := 1

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
