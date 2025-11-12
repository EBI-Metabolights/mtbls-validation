# Unit tests for rule_s_100_100_001_01
package tests.sample_test

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: Invalid multi-column structure in sample file.
# description: There is an invalid multi-column structure in sample file. Check column order.
# custom:
#  rule_id: rule_s_100_100_001_01
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
test_rule_s_100_100_001_01 := true

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
