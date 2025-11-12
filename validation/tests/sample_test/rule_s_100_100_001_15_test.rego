# Unit tests for rule_s_100_100_001_15
package tests.sample_test

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: Missing Factor Value columns in sample file.
# description: There should be a Factor Value column in sample file for each study factor.
# custom:
#  rule_id: rule_s_100_100_001_15
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
test_rule_s_100_100_001_15 := true

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
