#########################################################################################################
# Unit tests for rule_a_200_900_001_01
#########################################################################################################
package tests.assay_test

import data.metabolights.validation.v2.rules.phase2.violations as rules

import rego.v1

# METADATA
# title: Ontology terms are not validated on ontology search service (e.g. OLS).
# description: Ensure ontology terms are valid and accessible on ontology search service.
# custom:
#  rule_id: rule_a_200_900_001_01
#  type: WARNING
#  priority: HIGH
#  section: assay.general
rule_a_200_900_001_01_test_cases := 1

# METADATA
# title: <title>.
# description: <description>.
test_rule_a_200_900_001_01_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01

	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/headers",
				"value": [{
					"columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]",
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnIndex": 0,
				}],
			},
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/columns",
				"value": ["Parameter Value[Instrument]", "Term Source REF", "Term Accession Number"],
			},
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data",
				"value": {
					"Parameter Value[Instrument]": ["", "gram", "gram"],
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
	result := rules.rule_a_200_900_001_01 with input as input_data
	count(result) == 0
}

# METADATA
# title: <title>.
# description: <description>.
test_rule_a_200_900_001_01_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01

	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/headers",
				"value": [{
					"columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]",
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnIndex": 0,
				}],
			},
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/columns",
				"value": ["Parameter Value[Instrument]", "Term Source REF", "Term Accession Number"],
			},
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data",
				"value": {
					"Parameter Value[Instrument]": ["gram", "gram", "gram"],
					"Term Source REF.2": ["UO", "UO", "UO"],
					"Term Accession Number.2": [
						"http://purl.obolibrary.org/obo/UO_0000021",
						"http://purl.obolibrary.org/obo/UO_0000021",
						"http://purl.obolibrary.org/obo/UO_0000021",
					],
				},
			},
		],
	)

	result := rules.rule_a_200_900_001_01 with input as input_data
	count(result) == 0
}
