#########################################################################################################
# Unit tests for rule_s_200_090_003_03
#########################################################################################################
package tests.sample_test

import data.metabolights.validation.v2.rules.phase2.violations as rules
import rego.v1

# METADATA
# title: Term Accession Number defined for empty ontology terms.
# description: Select ontology terms and/or change ontology Term Accession Number.
# custom:
#  rule_id: rule_s_200_090_003_03
#  type: WARNING
#  priority: HIGH
#  section: samples.general
rule_s_200_090_003_03_test_cases := 1

# METADATA
# title: <title>.
# description: <description>.
test_rule_s_200_090_003_03_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := input_01
	result := rules.rule_s_200_090_003_03 with input as input_data
	print(result)
	count(result) == 0
}

# METADATA
# title: <title>.
# description: <description>.
test_rule_s_200_090_003_03_no_violation_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Characteristics[Organism]/0",
				"value": "data",
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Source REF/0",
				"value": "OBI",
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Accession Number/0",
				"value": "htt",
			},
		],
	)
	result := rules.rule_s_200_090_003_03 with input as input_data

	count(result) == 0
}

# METADATA
# title: <title>.
# description: <description>.
test_rule_s_200_090_003_03_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Characteristics[Organism]/0",
				"value": "",
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Source REF/0",
				"value": "",
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Accession Number/0",
				"value": "OB",
			},
		],
	)
	result := rules.rule_s_200_090_003_03 with input as input_data

	count(result) == 1
}
