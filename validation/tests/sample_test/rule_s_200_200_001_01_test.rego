#########################################################################################################
# Unit tests for rule_s_200_200_001_01
#########################################################################################################
package tests.sample_test

import rego.v1

# METADATA
# title: Sample name values are not unique in sample file.
# description: All sample names should be unique in sample file.
# custom:
#  rule_id: rule_s_200_200_001_01
#  type: ERROR
#  priority: CRITICAL
#  section: samples.sampleCollection
rule_s_200_200_001_01_test_cases := 1

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
