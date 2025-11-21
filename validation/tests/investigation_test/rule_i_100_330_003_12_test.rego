#########################################################################################################
# Unit tests for rule_i_100_330_003_12
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.definitions as def
import data.metabolights.validation.v2.rules.phase1.violations as rules
import data.tests.data.inputs.rules as test_rules
import rego.v1

# METADATA
# title: Value is not in the predefined ontologies or controlled lists associated with this field.
# description: A term SHOULD be selected from the predefined ontologies or controlled lists associated with this field.
# custom:
#  rule_id: rule_i_100_330_003_12
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyFactors
rule_i_100_330_003_12_test_cases := 1

# METADATA
# title: Study Design Type term is in the control list
# description: Study Design Type term is in the control list
test_rule_i_100_330_003_12_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "remove",
				"path": "/investigation/studies/0/studyFactors/factors/1",
			},
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyFactors/factors/0/type",
				"value": {
					"term": "kilogram",
					"termAccessionNumber": "http://purl.obolibrary.org/obo/UO_0000009",
					"termSourceRef": "UO",
				},
			},
		],
	)
	result := rules.rule_i_100_330_003_12 with input as input_data
		with def.RULE_STUDY_FACTOR_TYPE as test_rules.investigation.any_ontology_term_01
	count(result) == 0
}

# METADATA
# title: Study Design Type term is in the control list
# description: Study Design Type term is in the control list
test_rule_i_100_330_003_12_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "remove",
				"path": "/investigation/studies/0/studyFactors/factors/1",
			},
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyFactors/factors/0/type",
				"value": {
					"term": "disease",
					"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000408",
					"termSourceRef": "EFO",
				},
			},
		],
	)
	result := rules.rule_i_100_330_003_12 with input as input_data
		with def.RULE_STUDY_FACTOR_TYPE as test_rules.investigation.any_ontology_term_01
	count(result) == 1
}
