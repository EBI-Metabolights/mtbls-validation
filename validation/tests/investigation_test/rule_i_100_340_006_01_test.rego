#########################################################################################################
# Unit tests for rule_i_100_340_006_01
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study Assay Technology Type is not in the control list.
# description: Study Assay Technology Type value MUST be selected from the control list.
# custom:
#  rule_id: rule_i_100_340_006_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyAssays
rule_i_100_340_006_01_test_cases := 1

# # METADATA
# # title: <title>.
# # description: <description>.
# test_tests.investigation_test_no_violation_01 if {
# 	result := rules.tests.investigation_test with input as {
# 	}
# 	count(result) == 0
# }
# # METADATA
# # title: <title>.
# # description: <description>.
# test_tests.investigation_test_violation_01 if {
# 	result := rules.tests.investigation_test with input as {
# 	}
# 	count(result) == 1
# }
