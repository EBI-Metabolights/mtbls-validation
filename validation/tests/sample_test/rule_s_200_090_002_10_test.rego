# Unit tests for rule_s_200_090_002_10
package tests.sample_test

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: Term is not a child of of the selected ontology terms.
# description: The term MUST be a child of the selected ontology terms.
# custom:
#  rule_id: rule_s_200_090_002_10
#  type: ERROR
#  priority: HIGH
#  section: samples.general
test_rule_s_200_090_002_10 := true

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
