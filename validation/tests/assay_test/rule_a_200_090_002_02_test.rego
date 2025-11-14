#########################################################################################################
# Unit tests for rule_a_200_090_002_02
#########################################################################################################
package tests.assay_test

import data.metabolights.validation.v2.rules.phase2.violations as rules

import rego.v1

# METADATA
# title: Ontology Term Source REF is not selected from the default prioritised ontologies.
# description: Select a term from one of the prioritised sources where possible.
# custom:
#  rule_id: rule_a_200_090_002_02
#  type: WARNING
#  priority: HIGH
#  section: assays.general
rule_a_200_090_002_02_test_cases := 1

# # METADATA
# # title: <title>.
# # description: <description>.
# test_tests.assay_test_no_violation_01 if {
# 	result := rules.tests.assay_test with input as {
# 	}
# 	count(result) == 0
# }
# # METADATA
# # title: <title>.
# # description: <description>.
# test_tests.assay_test_violation_01 if {
# 	result := rules.tests.assay_test with input as {
# 	}
# 	count(result) == 1
# }
