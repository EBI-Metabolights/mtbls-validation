#########################################################################################################
# Unit tests for rule_i_100_340_003_14
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study Assay Measurement Type Term Source REF not referenced in investigation file.
# description: Study Assay Measurement Type Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_340_003_14
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyAssays
rule_i_100_340_003_14_test_cases := 1

# METADATA
# title: Study Assay Measurement Type term is in the control list
# description: Study Assay Measurement Type term is in the control list
test_rule_i_100_340_003_14_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyAssays/assays/0/measurementType",
			"value": {
				"term": "disease",
				"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000408",
				"termSourceRef": "EFO",
			},
		}],
	)

	result := rules.rule_i_100_340_003_14 with input as input_data
	count(result) == 0
}

# METADATA
# title: Study Assay Measurement Type term is in the control list
# description: Study Assay Measurement Type term is in the control list
test_rule_i_100_340_003_14_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyAssays/assays/0/measurementType",
			"value": {
				"term": "kilogram",
				"termAccessionNumber": "http://purl.obolibrary.org/obo/UO_0000009",
				"termSourceRef": "UO",
			},
		}],
	)
	result := rules.rule_i_100_340_003_14 with input as input_data
	count(result) == 1
}
