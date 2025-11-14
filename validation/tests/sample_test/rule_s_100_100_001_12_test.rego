#########################################################################################################
# Unit tests for rule_s_100_100_001_12
#########################################################################################################
package tests.sample_test

import rego.v1

# METADATA
# title: Factor Value column structure is not correct in sample file.
# description: Factor Value column structure should be ontology (with Term Source REF and Term Accession Number) or a value with unit (and Term Source REF and Term Accession Number) in sample file.
# custom:
#  rule_id: rule_s_100_100_001_12
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
rule_s_100_100_001_12_test_cases := 1

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
