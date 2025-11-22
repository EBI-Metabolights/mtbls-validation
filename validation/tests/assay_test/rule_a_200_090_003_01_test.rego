#########################################################################################################
# Unit tests for rule_a_200_090_003_01
#########################################################################################################
package tests.assay_test

import data.metabolights.validation.v2.rules.phase2.violations as rules

import rego.v1

# METADATA
# title: Term Accession Number length of ontology terms less than 3 characters.
# description: Term Accession Number of ontology terms should be defined with length equal or greater than 3 characters.
# custom:
#  rule_id: rule_a_200_090_003_01
#  type: WARNING
#  priority: HIGH
#  section: assays.general
rule_a_200_090_003_01_test_cases := 1

# METADATA
# title: <title>.
# description: <description>.
test_rule_a_200_090_003_01_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := input_01
	result := rules.rule_a_200_090_003_01 with input as input_data
	count(result) == 0
}

# METADATA
# title: <title>.
# description: <description>.
test_rule_a_200_090_003_01_no_violation_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Parameter Value[Instrument]/0",
				"value": "",
			},
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Term Source REF.2/0",
				"value": "OBI",
			},
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Term Accession Number.2/0",
				"value": "htt",
			},
		],
	)
	result := rules.rule_a_200_090_003_01 with input as input_data

	count(result) == 0
}

# METADATA
# title: <title>.
# description: <description>.
test_rule_a_200_090_003_01_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Parameter Value[Instrument]/0",
				"value": "Test Data",
			},
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Term Source REF.2/0",
				"value": "OBI",
			},
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Term Accession Number.2/0",
				"value": "OB",
			},
		],
	)
	result := rules.rule_a_200_090_003_01 with input as input_data

	count(result) == 1
}
