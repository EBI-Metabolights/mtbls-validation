#########################################################################################################
# Unit tests for rule_s_200_090_002_01
#########################################################################################################
package tests.sample_test

import data.metabolights.validation.v2.rules.phase1.definitions as def
import data.tests.data.inputs.rules as test_rules

import data.metabolights.validation.v2.rules.phase2.violations as rules
import rego.v1

# METADATA
# title: Ontology Term Source REF is not selected from the prioritised ontologies.
# description: The term is not in the control list or selected ontologies.
# custom:
#  rule_id: rule_s_200_090_002_01
#  type: WARNING
#  priority: HIGH
#  section: samples.general
rule_s_200_090_002_01_test_cases := 1

# METADATA
# title: Study Publication Status term is in the ontology list - RULE_PUBLICATION_STATUS null
# description: Study Publication Status term is in the ontology list
test_rule_s_200_090_002_01_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/samples//studies/0/studyPublications/publications/0/status",
			"value": {
				"term": "kilogram",
				"termAccessionNumber": "http://purl.obolibrary.org/obo/UO_0000009",
				"termSourceRef": "UO",
			},
		}],
	)
	result := rules.rule_s_200_090_002_01 with input as input_data
		with def.RULE_PUBLICATION_STATUS as null
		with def.RULE_DEFAULT_ONTOLOGIES as test_rules.investigation.any_ontology_term_01
	count(result) == 0
}
