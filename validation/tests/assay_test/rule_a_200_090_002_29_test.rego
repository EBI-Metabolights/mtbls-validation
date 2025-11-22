#########################################################################################################
# Unit tests for rule_a_200_090_002_29
#########################################################################################################
package tests.assay_test

import data.metabolights.validation.v2.rules.phase2.violations as rules
import data.tests.data.inputs.rules as test_rules

import rego.v1

# METADATA
# title: The value appears in the list of default not-recommended values.
# description: Select an alternative value that meets the requirement or leave it empty (if it is not required).
# custom:
#  rule_id: rule_a_200_090_002_29
#  type: WARNING
#  priority: HIGH
#  section: assays.general
rule_a_200_090_002_29_test_cases := 1

# METADATA
# title: <title>.
# description: <description>.
test_rule_a_200_090_002_29_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Parameter Value[Instrument]",
				"value": ["gram", "gram", "gram"],
			},
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Term Source REF.2",
				"value": ["UO", "UO", "UO"],
			},
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Term Accession Number.2",
				"value": ["http://purl.obolibrary.org/obo/UO_0000021", "http://purl.obolibrary.org/obo/UO_0000021", "http://purl.obolibrary.org/obo/UO_0000021"],
			},
		],
	)

	selected_rule := json.patch(
		test_rules.assay.selected_ontologies_01,
		[
			{
				"op": "replace",
				"path": "unexpectedTermEnforcementLevel",
				"value": "recommended",
			},
			{
				"op": "replace",
				"path": "allowedPlaceholders",
				"value": [],
			},
			{
				"op": "replace",
				"path": "unexpectedTerms",
				"value": ["unexpected value"],
			},
		],
	)
	result := rules.rule_a_200_090_002_29 with input as input_data
		with data.metabolights.validation.v2.controls.assayFileControls as {"__default__": [selected_rule]}
    count(result) == 0
}

# METADATA
# title: <title>.
# description: <description>.
test_rule_a_200_090_002_29_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Parameter Value[Instrument]", 
                "value": ["unexpected value", "gram", "gram"],
			},
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Term Source REF.2",
				"value": ["UO", "UO", "UO"],
			},
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Term Accession Number.2",
				"value": [
					"http://purl.obolibrary.org/obo/UO_0000021",
					"http://purl.obolibrary.org/obo/UO_0000021",
					"http://purl.obolibrary.org/obo/UO_0000021",
				],
			},
		],
	)

	selected_rule := json.patch(
		test_rules.assay.selected_ontologies_01,
		[
			{
				"op": "replace",
				"path": "unexpectedTermEnforcementLevel",
				"value": "recommended",
			},
			{
				"op": "replace",
				"path": "allowedPlaceholders",
				"value": [],
			},
			{
				"op": "replace",
				"path": "unexpectedTerms",
				"value": ["unexpected value"],
			},
		],
	)
	result := rules.rule_a_200_090_002_29 with input as input_data
		with data.metabolights.validation.v2.controls.assayFileControls as {"__default__": [selected_rule]}

    count(result) == 1
}