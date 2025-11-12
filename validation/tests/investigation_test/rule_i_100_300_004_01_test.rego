# Unit tests for rule_i_100_300_004_01
package tests.investigation_test

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: Study Description length less than 60 characters.
# description: Study Description should be defined with length equal or greater than 60 characters. Please use abstract of first publication.
# custom:
#  rule_id: rule_i_100_300_004_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studies
test_rule_i_100_300_004_01 := true

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
