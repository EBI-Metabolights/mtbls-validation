#########################################################################################################
# Unit tests for rule_i_100_360_008_12
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules
import data.metabolights.validation.v2.rules.phase1.definitions as def
import data.tests.data.inputs.rules as test_rules

import rego.v1

# METADATA
# title: Value is not in the predefined ontologies or controlled lists associated with this field.
# description: A term SHOULD be selected from the predefined ontologies or controlled lists associated with this field.
# custom:
#  rule_id: rule_i_100_360_008_12
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyContacts
rule_i_100_360_008_12_test_cases := 1


# METADATA
# title: Study Person Roles Term term is in the control list
# description: Study Person Roles Term term is in the control list
test_rule_i_100_360_008_12_no_violation_01 if {
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
				"value": "recommended",
			},
			{
				"op": "replace",
				"path": "ontologies",
				"value": ["UO"],
			},
		],
	)
	result := rules.rule_i_100_360_008_12 with input as input_data
    	with def.RULE_STUDY_PERSON_ROLES as selected_rule
	count(result) == 0
}


# METADATA
# title: Study Person Roles Term term is in the control list
# description: Study Person Roles Term term is in the control list
test_rule_i_100_360_008_12_violation_01 if {
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
				"value": "recommended",
			},
			{
				"op": "replace",
				"path": "ontologies",
				"value": ["UO"],
			},
		],
	)
	result := rules.rule_i_100_360_008_12 with input as input_data
    	with def.RULE_STUDY_PERSON_ROLES as selected_rule
	count(result) == 1
}