#########################################################################################################
# Unit tests for rule_i_100_320_007_03
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.definitions as def
import data.metabolights.validation.v2.rules.phase1.violations as rules
import data.tests.data.inputs.rules as test_rules

import rego.v1

# METADATA
# title: Study Publication Status is not selected from the default ontology list.
# description: Study Publication Status value MAY be selected from the default ontology list.
# custom:
#  rule_id: rule_i_100_320_007_03
#  type: WARNING
#  priority: MEDIUM
#  section: investigation.studyPublications
rule_i_100_320_007_03_test_cases := 1

# METADATA
# title: Study Publication Status term is in the ontology list - RULE_PUBLICATION_STATUS null
# description: Study Publication Status term is in the ontology list
test_rule_i_100_320_007_03_no_violation_01 if {
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
	result := rules.rule_i_100_320_007_03 with input as input_data
		with def.RULE_PUBLICATION_STATUS as null
		with def.RULE_DEFAULT_ONTOLOGIES as test_rules.investigation.any_ontology_term_01
	count(result) == 0
}

# METADATA
# title: Study Publication Status term is in the ontology list
# description: RULE_PUBLICATION_STATUS empty dict
test_rule_i_100_320_007_03_no_violation_02 if {
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
				"value": [{
					"term": "kilogram",
					"termAccessionNumber": "http://purl.obolibrary.org/obo/UO_0000009",
					"termSourceRef": "UO",
				}],
			},
		],
	)
	result := rules.rule_i_100_320_007_03 with input as input_data
		with def.RULE_PUBLICATION_STATUS as {}
		with def.RULE_DEFAULT_ONTOLOGIES as test_rules.investigation.any_ontology_term_01
	count(result) == 0
}

# METADATA
# title: Study Publication Status term is in the ontology list
# description:  RULE_PUBLICATION_STATUS  is 'check-only-constraints' type
test_rule_i_100_320_007_03_no_violation_03 if {
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
	result := rules.rule_i_100_320_007_03 with input as input_data
		with def.RULE_PUBLICATION_STATUS as {"validationType": "check-only-constraints"}
		with def.RULE_DEFAULT_ONTOLOGIES as test_rules.investigation.any_ontology_term_01
	count(result) == 0
}

# METADATA
# title: Study Publication Status term is not in the ontology list
# description: RULE_PUBLICATION_STATUS null
test_rule_i_100_320_007_03_violation_01 if {
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
	result := rules.rule_i_100_320_007_03 with input as input_data
		with def.RULE_PUBLICATION_STATUS as null
		with def.RULE_DEFAULT_ONTOLOGIES as test_rules.investigation.any_ontology_term_01
	count(result) == 1
}

# METADATA
# title: Study Publication Status term is not in the ontology list
# description: RULE_PUBLICATION_STATUS empty dict
test_rule_i_100_320_007_03_violation_02 if {
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
	result := rules.rule_i_100_320_007_03 with input as input_data
		with def.RULE_PUBLICATION_STATUS as {}
		with def.RULE_DEFAULT_ONTOLOGIES as test_rules.investigation.any_ontology_term_01
	count(result) == 1
}

# METADATA
# title: Study Publication Status term is not in the ontology list
# description:  RULE_PUBLICATION_STATUS  is 'check-only-constraints' type
test_rule_i_100_320_007_03_violation_03 if {
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
	result := rules.rule_i_100_320_007_03 with input as input_data
		with def.RULE_PUBLICATION_STATUS as {"validationType": "check-only-constraints"}
		with def.RULE_DEFAULT_ONTOLOGIES as test_rules.investigation.any_ontology_term_01
	count(result) == 1
}
