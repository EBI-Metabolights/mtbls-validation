# Unit tests for rule_s_100_100_003_01
package tests.sample_test

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: Sample file not referenced in investigation file.
# description: Only one sample file is allowed and its name should be 's_(accession number).txt'.
# custom:
#  rule_id: rule_s_100_100_003_01
#  type: ERROR
#  priority: CRITICAL
#  section: samples.filename
test_rule_s_100_100_003_01 := true

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
