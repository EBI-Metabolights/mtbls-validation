#########################################################################################################
# Unit tests for rule___100_200_001_03
#########################################################################################################
package tests.input_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: There is a file parse warning for the sample file.
# description: There is a file parse warning for the sample file.
# custom:
#  rule_id: rule___100_200_001_03
#  type: WARNING
#  priority: MEDIUM
#  section: samples.parserMessages
rule___100_200_001_03_test_cases := 1

# METADATA
# title: There is no parser warning for sample file
# description: There is no parser warning sample file
test_rule___100_200_001_03_no_violation_01 if {
	input_01 := data.tests.data.inputs.empty
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/investigationFilePath",
				"value": "i_Investigation.txt",
			},
			{
				"op": "replace",
				"path": "/investigation",
				"value": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
			},
			{
				"op": "replace",
				"path": "/samples",
				"value": {"s_MTBLS1.txt": {}},
			},
			{
				"op": "replace",
				"path": "/parserMessages",
				"value": {"s_MTBLS1.txt": [
					{
						"column": "",
						"detail": ".",
						"line": "",
						"section": "",
						"short": "test 1",
						"type": "INFO",
					},
					{
						"column": "",
						"detail": ".",
						"line": "",
						"section": "",
						"short": "test 2",
						"type": "INFO",
					},
				]},
			},
		],
	)

	result := rules.rule___100_200_001_03 with input as input_data
	count(result) == 0
}

# METADATA
# title: There is no parser warning
# description: There is no parser warning
test_rule___100_200_001_03_no_violation_02 if {
	input_01 := data.tests.data.inputs.empty
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/investigationFilePath",
				"value": "i_Investigation.txt",
			},
			{
				"op": "replace",
				"path": "/investigation",
				"value": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
			},
			{
				"op": "replace",
				"path": "/samples",
				"value": {"s_MTBLS1.txt": {}},
			},
			{
				"op": "replace",
				"path": "/parserMessages",
				"value": {"s_MTBLS1.txt": []},
			},
		],
	)
	result := rules.rule___100_200_001_03 with input as input_data
	count(result) == 0
}

# METADATA
# title: There is one parser warning
# description: There is one parser warning
test_rule___100_200_001_03_violation_01 if {
	input_01 := data.tests.data.inputs.empty
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/investigationFilePath",
				"value": "i_Investigation.txt",
			},
			{
				"op": "replace",
				"path": "/investigation",
				"value": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
			},
			{
				"op": "replace",
				"path": "/samples",
				"value": {"s_MTBLS1.txt": {}},
			},
			{
				"op": "replace",
				"path": "/parserMessages",
				"value": {"s_MTBLS1.txt": [
					{
						"column": "",
						"detail": ".",
						"line": "",
						"section": "",
						"short": "test 1",
						"type": "WARNING",
					},
					{
						"column": "",
						"detail": ".",
						"line": "",
						"section": "",
						"short": "test 2",
						"type": "INFO",
					},
				]},
			},
		],
	)

	result := rules.rule___100_200_001_03 with input as input_data
	count(result) == 1
	some result_object in result
	count(result_object.values) == 1
}

# METADATA
# title: There are two parser warnings
# description: There are two parser warnings
test_rule___100_200_001_03_violation_02 if {
	input_01 := data.tests.data.inputs.empty
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/investigationFilePath",
				"value": "i_Investigation.txt",
			},
			{
				"op": "replace",
				"path": "/investigation",
				"value": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
			},
			{
				"op": "replace",
				"path": "/samples",
				"value": {"s_MTBLS1.txt": {}},
			},
			{
				"op": "replace",
				"path": "/parserMessages",
				"value": {"s_MTBLS1.txt": [
					{
						"column": "",
						"detail": ".",
						"line": "",
						"section": "",
						"short": "test 1",
						"type": "WARNING",
					},
					{
						"column": "",
						"detail": ".",
						"line": "",
						"section": "",
						"short": "test 2",
						"type": "WARNING",
					},
				]},
			},
		],
	)

	result := rules.rule___100_200_001_03 with input as input_data

	count(result) == 1
	some result_object in result
	count(result_object.values) == 2
}
