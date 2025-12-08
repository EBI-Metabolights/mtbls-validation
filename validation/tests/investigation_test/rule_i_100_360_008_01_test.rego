#########################################################################################################
# Unit tests for rule_i_100_360_008_01
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study Person Role value is empty.
# description: Study Person Role should be defined.
# custom:
#  rule_id: rule_i_100_360_008_01
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyContacts
rule_i_100_360_008_01_test_cases := 1

# METADATA
# title: Study Person Roles Term term is in the control list
# description: Study Person Roles Term term is in the control list
test_rule_i_100_360_008_01_no_violation_01 if {
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
	result := rules.rule_i_100_360_008_01 with input as input_data
	count(result) == 0
}

# METADATA
# title: Study Person Roles Term term is in the control list
# description: Study Person Roles Term term is in the control list
test_rule_i_100_360_008_01_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyContacts/people/0/roles/0",
			"value": {
				"term": "",
				"termAccessionNumber": "http://purl.obolibrary.org/obo/UO_0000009",
				"termSourceRef": "UOX",
			},
		}],
	)
	result := rules.rule_i_100_360_008_01 with input as input_data
	count(result) == 1
}
