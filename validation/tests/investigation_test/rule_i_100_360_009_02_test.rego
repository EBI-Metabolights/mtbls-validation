#########################################################################################################
# Unit tests for rule_i_100_360_009_02
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study Person Role is not valid.
# description: Study Person Role SHOULD be selected from the default prioritised ontologies.
# custom:
#  rule_id: rule_i_100_360_009_02
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyContacts
rule_i_100_360_009_02_test_cases := 1

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
