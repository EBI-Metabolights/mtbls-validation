#########################################################################################################
# Unit tests for rule_s_200_200_001_02
#########################################################################################################
package tests.sample_test

import rego.v1

# METADATA
# title: Values for Sample Name column not in any assay file.
# description: Each sample name should be referenced at least one time in assay files.
# custom:
#  rule_id: rule_s_200_200_001_02
#  type: ERROR
#  priority: CRITICAL
#  section: samples.sampleCollection
rule_s_200_200_001_02_test_cases := 1

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
