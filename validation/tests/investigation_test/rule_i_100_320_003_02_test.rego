# Unit tests for rule_i_100_320_003_02
package tests.investigation_test

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: DOI format invalid for study publication.
# description: If DOI is defined, its format should be a valid.
# custom:
#  rule_id: rule_i_100_320_003_02
#  type: ERROR
#  priority: MEDIUM
#  section: investigation.studyPublications
test_rule_i_100_320_003_02 := true

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
