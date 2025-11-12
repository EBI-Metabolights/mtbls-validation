# Unit tests for rule_s_100_100_001_11
package tests.sample_test

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: Column header structure is not correct in sample file.
# description: Column header structure is not correct in sample file. Any ontology and unit column should have the leading columns, Term Source REF and Term Accession Number. Single columns must not have leading columns.
# custom:
#  rule_id: rule_s_100_100_001_11
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
test_rule_s_100_100_001_11 := true

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
