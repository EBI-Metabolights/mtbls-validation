#########################################################################################################
# Unit tests for rule_a_200_090_003_04
#########################################################################################################
package tests.assay_test

import data.metabolights.validation.v2.rules.phase2.violations as rules

import rego.v1

# METADATA
# title: Term Accession Number defined for empty unit ontology terms.
# description: Select unit ontology terms and/or change ontology Term Accession Number.
# custom:
#  rule_id: rule_a_200_090_003_04
#  type: WARNING
#  priority: HIGH
#  section: assays.general
rule_a_200_090_003_04_test_cases := 1


# METADATA
# title: <title>.
# description: <description>.
test_rule_a_200_090_003_04_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := input_01
	result := rules.rule_a_200_090_003_04 with input as input_data
	count(result) == 0
}

# METADATA
# title: <title>.
# description: <description>.
test_rule_a_200_090_003_04_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Parameter Value[Test Data]/0",
				"value": "Test data",
			},
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Unit/0",
				"value": "Data",
			},
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Term Source REF.5/0",
				"value": "",
			},
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Term Accession Number.5/0",
				"value": "OBI",
			},
		],
	)
	result := rules.rule_a_200_090_003_04 with input as input_data

	count(result) == 1
}
