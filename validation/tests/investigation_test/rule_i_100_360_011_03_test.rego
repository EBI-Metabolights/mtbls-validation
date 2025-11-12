# Unit tests for rule_i_100_360_011_03
package tests.investigation_test

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: Study Person Affiliation ROR ID is not valid.
# description: Study Person ROR ID must have valid format. e.g., https //ror.org/02catss52 . If your affiliation ROR ID is not defined, you may provide wikidata URL of your primary affiliation. e.g., https //www.wikidata.org/wiki/Q1341845
# custom:
#  rule_id: rule_i_100_360_011_03
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyContacts
test_rule_i_100_360_011_03 := true

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
