# Unit tests for rule_i_100_360_011_02
package tests.investigation_test

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: Principal Investigator contact details not defined.
# description: Principal Investigator first name, last name, ORCID, affiliation, affiliation ROR id and email must be defined. At least one of them is not defined.
# custom:
#  rule_id: rule_i_100_360_011_02
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.studyContacts
test_rule_i_100_360_011_02 := true

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
