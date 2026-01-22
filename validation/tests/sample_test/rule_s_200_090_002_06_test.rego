#########################################################################################################
# Unit tests for rule_s_200_090_002_06
#########################################################################################################
package tests.sample_test

import data.metabolights.validation.v2.rules.phase2.violations as rules
import rego.v1

# METADATA
# title: Ontology Term Source REF defined for empty unit ontology terms.
# description: Select unit ontology terms and/or change ontology Term Source REF.
# custom:
#  rule_id: rule_s_200_090_002_06
#  type: WARNING
#  priority: MEDIUM
#  section: samples.general
rule_s_200_090_002_06_test_cases := 1

# METADATA
# title: <title>.
# description: <description>.
test_rule_s_200_090_002_06_no_violation_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Factor Value[Dose]/0",
				"value": "Test data",
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Unit/0",
				"value": "Data",
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Source REF.5/0",
				"value": "Data",
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Accession Number.5/0",
				"value": "htt",
			},
		],
	)
	result := rules.rule_s_200_090_002_06 with input as input_data

	count(result) == 0
}

# METADATA
# title: <title>.
# description: <description>.
test_rule_s_200_090_002_06_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Factor Value[Dose]/0",
				"value": "Test data",
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Unit/0",
				"value": "",
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Source REF.5/0",
				"value": "Data",
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Accession Number.5/0",
				"value": "htt",
			},
		],
	)
	result := rules.rule_s_200_090_002_06 with input as input_data

	count(result) == 1
}
