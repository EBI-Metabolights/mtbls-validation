#########################################################################################################
# Unit tests for rule_i_100_350_004_01
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study Protocol Type length less than 3 characters.
# description: Study Protocol Type should be defined with length equal or greater than 3 characters.
# custom:
#  rule_id: rule_i_100_350_004_01
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyProtocols
rule_i_100_350_004_01_test_cases := 1

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
