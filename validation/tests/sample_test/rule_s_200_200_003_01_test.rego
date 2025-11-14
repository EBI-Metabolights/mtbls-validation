#########################################################################################################
# Unit tests for rule_s_200_200_003_01
#########################################################################################################
package tests.sample_test

import data.metabolights.validation.v2.rules.phase2.violations as rules
import rego.v1

# METADATA
# title: Term Source REF of the factor value ontology term is not in the priotirised control list.
# description: We highly recommend to use the prioritised Ontology Source Refs for the factor ontology term.
# custom:
#  rule_id: rule_s_200_200_003_01
#  type: WARNING
#  priority: LOW
#  section: samples.sampleCollection
rule_s_200_200_003_01_test_cases := 1

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
