#########################################################################################################
# Unit tests for rule_s_200_090_006_04
#########################################################################################################
package tests.sample_test

import data.metabolights.validation.v2.rules.phase2.violations as rules
import rego.v1

# METADATA
# title: Unexpected value in the column.
# description: There is a general unexpected value list. Use valid text, ontology term or controlled vocabulary for the selected column.
# custom:
#  rule_id: rule_s_200_090_006_04
#  type: ERROR
#  priority: HIGH
#  section: samples.general
rule_s_200_090_006_04_test_cases := 1

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
