#########################################################################################################
# Unit tests for rule_s_200_090_006_03
#########################################################################################################
package tests.sample_test

import rego.v1

# METADATA
# title: Unexpected value in the column.
# description: There is an unexpected value list for the selected column. Use valid text, ontology term or controlled vocabulary for the selected column.
# custom:
#  rule_id: rule_s_200_090_006_03
#  type: ERROR
#  priority: HIGH
#  section: samples.general
rule_s_200_090_006_03_test_cases := 1

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
