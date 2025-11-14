#########################################################################################################
# Unit tests for rule_s_200_090_002_05
#########################################################################################################
package tests.sample_test

import rego.v1

# METADATA
# title: Ontology Term Source REF of Unit is not selected from the prioritised ontologies.
# description: Select a unit term from one of the prioritised sources where possible.
# custom:
#  rule_id: rule_s_200_090_002_05
#  type: WARNING
#  priority: MEDIUM
#  section: samples.general
rule_s_200_090_002_05_test_cases := 1

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
