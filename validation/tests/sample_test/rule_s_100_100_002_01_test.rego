# Unit tests for rule_s_100_100_002_01
package tests.sample_test

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: There is no row in sample file.
# description: No row is defined in sample file. Add more than one row (sample). Please ensure all xxx, including controls, QCs, standards, etc, are referenced.
# custom:
#  rule_id: rule_s_100_100_002_01
#  type: ERROR
#  priority: CRITICAL
#  section: samples.rows
test_rule_s_100_100_002_01 := true

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
