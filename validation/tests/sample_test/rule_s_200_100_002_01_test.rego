# Unit tests for rule_s_200_100_002_01
package tests.sample_test

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: User defined Characteristics column is empty.
# description: At least one value should be defined in Characteristics column.
# custom:
#  rule_id: rule_s_200_100_002_01
#  type: ERROR
#  priority: HIGH
#  section: samples.source
test_rule_s_200_100_002_01 := true

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
