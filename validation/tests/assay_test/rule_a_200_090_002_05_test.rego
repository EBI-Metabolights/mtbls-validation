# Unit tests for rule_a_200_090_002_05
package tests.assay_test
import data.metabolights.validation.v2.rules.phase2.violations as rules

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: Ontology Term Source REF of Unit is not selected from the prioritised ontologies.
# description: Select a unit term from one of the prioritised sources where possible.
# custom:
#  rule_id: rule_a_200_090_002_05
#  type: WARNING
#  priority: HIGH
#  section: assays.general
test_rule_a_200_090_002_05 := true

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
