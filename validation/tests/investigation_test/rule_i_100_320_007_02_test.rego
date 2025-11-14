#########################################################################################################
# Unit tests for rule_i_100_320_007_02
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.definitions as def
import data.metabolights.validation.v2.rules.phase1.violations as rules
import data.tests.data.inputs.rules as test_rules
import rego.v1

# METADATA
# title: Study Publication Status is not selected from the selected ontologies.
# description: Study Publication Status value MUST be selected from the selected ontologies.
# custom:
#  rule_id: rule_i_100_320_007_02
#  type: ERROR
#  priority: MEDIUM
#  section: investigation.studyPublications
rule_i_100_320_007_02_test_cases := 1

# METADATA
# title: Study Design Type term is in the control list
# description: Study Design Type term is in the control list
test_rule_i_100_320_007_02_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "remove",
				"path": "/investigation/studies/0/studyPublications/publications/1",
			},
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyPublications/publications/0/status",
				"value": {
					"term": "kilogram",
					"termAccessionNumber": "http://purl.obolibrary.org/obo/UO_0000009",
					"termSourceRef": "UO",
				},
			},
		],
	)
	result := rules.rule_i_100_320_007_02 with input as input_data
		with def.RULE_PUBLICATION_STATUS as test_rules.investigation.any_ontology_term_01
	count(result) == 0
}

# METADATA
# title: Study Design Type term is in the control list
# description: Study Design Type term is in the control list
test_rule_i_100_320_007_02_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "remove",
				"path": "/investigation/studies/0/studyPublications/publications/1",
			},
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyPublications/publications/0/status",
				"value": {
					"term": "kilogram",
					"termAccessionNumber": "http://purl.obolibrary.org/obo/UO_0000009",
					"termSourceRef": "UOX",
				},
			},
		],
	)
	result := rules.rule_i_100_320_007_02 with input as input_data
		with def.RULE_PUBLICATION_STATUS as test_rules.investigation.any_ontology_term_01
	count(result) == 1
}
