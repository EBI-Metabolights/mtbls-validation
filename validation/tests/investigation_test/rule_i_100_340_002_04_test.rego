# Unit tests for rule_i_100_340_002_04
package tests.investigation_test

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: Study Assay File Name must be unique.
# description: Assay file name must be unique for each study in i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_340_002_04
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyAssays
test_rule_i_100_340_002_04 := true

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
