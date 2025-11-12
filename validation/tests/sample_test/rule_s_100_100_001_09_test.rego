# Unit tests for rule_s_100_100_001_09
package tests.sample_test

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: Order of characteristics column header is not correct in sample file.
# description: Order of characteristics column header is not correct in sample file. All characteristics columns should be defined before Sample collection Protocol REF column.
# custom:
#  rule_id: rule_s_100_100_001_09
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
test_rule_s_100_100_001_09 := true

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
