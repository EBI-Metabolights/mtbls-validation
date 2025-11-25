#########################################################################################################
# Unit tests for rule_s_200_900_001_01
#########################################################################################################
package tests.sample_test

import data.metabolights.validation.v2.rules.phase2.violations as rules

import rego.v1

# METADATA
# title: Ontology terms are not validated on ontology search service (e.g. OLS).
# description: Ensure ontology terms are valid and accessible on ontology search service.
# custom:
#  rule_id: rule_s_200_900_001_01
#  type: WARNING
#  priority: HIGH
#  section: samples.general
rule_s_200_900_001_01_test_cases := 1

# METADATA
# title: <title>.
# description: <description>.
test_rule_s_200_900_001_01_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01

	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/headers",
				"value": [{
					"columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]",
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnIndex": 0,
				}],
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/columns",
				"value": ["Characteristics[Organism]", "Term Source REF", "Term Accession Number"],
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data",
				"value": {
					"Characteristics[Organism]": ["", "gram", "gram"],
					"Term Source REF": ["UO", "", "UO"],
					"Term Accession Number": [
						"http://purl.obolibrary.org/obo/UO_0000021",
						"http://purl.obolibrary.org/obo/UO_0000021",
						"",
					],
				},
			},
		],
	)

	result := rules.rule_s_200_900_001_01 with input as input_data
	count(result) == 0
}

# METADATA
# title: <title>.
# description: <description>.
test_rule_s_200_900_001_01_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01

	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/headers",
				"value": [{
					"columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]",
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnIndex": 0,
				}],
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/columns",
				"value": ["Characteristics[Organism]", "Term Source REF", "Term Accession Number"],
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data",
				"value": {
					"Characteristics[Organism]": ["gram", "gram", "gram"],
					"Term Source REF": ["UO", "UO", "UO"],
					"Term Accession Number": [
						"http://purl.obolibrary.org/obo/UO_0000021",
						"http://purl.obolibrary.org/obo/UO_0000021",
						"http://purl.obolibrary.org/obo/UO_0000021",
					],
				},
			},
		],
	)

	result := rules.rule_s_200_900_001_01 with input as input_data
	count(result) == 1
}
