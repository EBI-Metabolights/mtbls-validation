#########################################################################################################
# Unit tests for rule_i_100_340_006_14
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study Assay Technology Type Term Source REF not referenced in investigation file.
# description: Study Assay Technology Type Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_340_006_14
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyAssays
rule_i_100_340_006_14_test_cases := 1


# METADATA
# title: <title>.
# description: <description>.
test_rule_i_100_340_006_14_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := input_01
	result := rules.rule_i_100_340_006_14 with input as input_data
	count(result) == 0
}

# METADATA
# title: <title>.
# description: <description>.
test_rule_i_100_340_006_14_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[

			{
				"op": "replace",
				"path": "/investigation/studies/0/studyAssays/assays/0/technologyType",
				"value": {
					"term": "",
					"termAccessionNumber": "http://purl.obolibrary.org/obo/UO_0000009",
					"termSourceRef": "UOXX",
				},
			},
		],
	)
	result := rules.rule_i_100_340_006_14 with input as input_data

	count(result) == 1
}
