#########################################################################################################
# Unit tests for rule_i_100_360_010_03
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study Person Roles Term Source REF is empty.
# description: Study Person Roles Term Source REF should be defined.
# custom:
#  rule_id: rule_i_100_360_010_03
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyContacts
rule_i_100_360_010_03_test_cases := 1

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
