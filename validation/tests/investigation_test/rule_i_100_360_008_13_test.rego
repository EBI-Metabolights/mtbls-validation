#########################################################################################################
# Unit tests for rule_i_100_360_008_13
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.definitions as def
import data.metabolights.validation.v2.rules.phase1.violations as rules
import data.tests.data.inputs.rules as test_rules

import rego.v1

# METADATA
# title: Value is not in the default ontologies or controlled lists
# description: A term SHOULD be selected from the default ontologies or controlled lists.
# custom:
#  rule_id: rule_i_100_360_008_13
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyContacts
rule_i_100_360_008_13_test_cases := 1

# METADATA
# title: Study Person Roles Term term is in the control list
# description: Study Person Roles Term term is in the control list
test_rule_i_100_360_008_13_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyContacts/people/0/roles/0",
			"value": {
				"term": "kilogram",
				"termAccessionNumber": "http://purl.obolibrary.org/obo/UO_0000009",
				"termSourceRef": "UO",
			},
		}],
	)
	selected_rule := json.patch(
		test_rules.investigation.selected_ontologies_01,
		[
			{
				"op": "replace",
				"path": "termEnforcementLevel",
				"value": "required",
			},
			{
				"op": "replace",
				"path": "ontologies",
				"value": ["UO"],
			},
		],
	)
	result := rules.rule_i_100_360_008_13 with input as input_data
		with def.RULE_DEFAULT_ONTOLOGIES as selected_rule
		with def.RULE_STUDY_PERSON_ROLES as {}
	count(result) == 0
}

# METADATA
# title: Study Person Roles Term term is in the control list
# description: Study Person Roles Term term is in the control list
test_rule_i_100_360_008_13_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyContacts/people/0/roles/0",
			"value": {
				"term": "kilogram",
				"termAccessionNumber": "http://purl.obolibrary.org/obo/UO_0000009",
				"termSourceRef": "UOX",
			},
		}],
	)
	selected_rule := json.patch(
		test_rules.investigation.selected_ontologies_01,
		[
			{
				"op": "replace",
				"path": "termEnforcementLevel",
				"value": "required",
			},
			{
				"op": "replace",
				"path": "ontologies",
				"value": ["UO"],
			},
		],
	)
	result := rules.rule_i_100_360_008_13 with input as input_data
		with def.RULE_DEFAULT_ONTOLOGIES as selected_rule
		with def.RULE_STUDY_PERSON_ROLES as {}
	count(result) == 1
}
