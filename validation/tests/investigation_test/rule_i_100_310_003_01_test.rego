#########################################################################################################
# Unit tests for rule_i_100_310_003_01
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.definitions as def
import data.metabolights.validation.v2.rules.phase1.violations as rules
import data.tests.data.inputs.rules as test_rules

import rego.v1

# METADATA
# title: Study Design Type is not selected from the selected ontologies.
# description: Study Design Type value MUST be selected from the selected ontologies.
# custom:
#  rule_id: rule_i_100_310_003_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyDesignDescriptors
rule_i_100_310_003_01_test_cases := 1

# METADATA
# title: Study Design Type term is in the control list
# description: Study Design Type term is in the control list
test_rule_i_100_310_003_01_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [{
				"term": "kilogram",
				"termAccessionNumber": "http://purl.obolibrary.org/obo/UO_0000009",
				"termSourceRef": "UO",
			}],
		}],
	)
	result := rules.rule_i_100_310_003_01 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as test_rules.investigation.any_ontology_term_01
	count(result) == 0
}

# METADATA
# title: Study Design Type term is in the control list
# description: Study Design Type term is in the control list
test_rule_i_100_310_003_01_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [
				{
					"term": "kilogram",
					"termAccessionNumber": "http://purl.obolibrary.org/obo/UO_0000009",
					"termSourceRef": "UOX",
				},
				{
					"term": "kilogram",
					"termAccessionNumber": "http://purl.obolibrary.org/obo/UO_0000009",
					"termSourceRef": "NCBITAXON",
				},
			],
		}],
	)
	result := rules.rule_i_100_310_003_01 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as test_rules.investigation.any_ontology_term_01
	count(result) == 2
}
