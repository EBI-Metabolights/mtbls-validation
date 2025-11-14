#########################################################################################################
# Unit tests for rule___100_200_001_02
#########################################################################################################
package tests.input_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: There is a file parse error for the sample file.
# description: There is a file parse error for the sample file.
# custom:
#  rule_id: rule___100_200_001_02
#  type: ERROR
#  priority: HIGH
#  section: samples.parserMessages
rule___100_200_001_02_test_cases := 1

# METADATA
# title: There is a file parse error for the sample file.
# description: There is a file parse error for the sample file.
# custom:
#  rule_id: rule___100_200_001_02
#  type: ERROR
#  priority: CRITICAL
#  section: samples.parserMessages
rule___100_200_001_02_test_cases := 1

# METADATA
# title: There is no parser error for sample file
# description: There is no parser error sample file
test_rule___100_200_001_02_no_violation_01 if {
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
						"type": "WARNING",
					},
				]},
			},
		],
	)

	result := rules.rule___100_200_001_02 with input as input_data
	count(result) == 0
}

# METADATA
# title: There is no parser error
# description: There is no parser error
test_rule___100_200_001_02_no_violation_02 if {
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
	result := rules.rule___100_200_001_02 with input as input_data
	count(result) == 0
}

# METADATA
# title: There is one parser error
# description: There is one parser error
test_rule___100_200_001_02_violation_01 if {
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
						"type": "ERROR",
					},
				]},
			},
		],
	)

	result := rules.rule___100_200_001_02 with input as input_data
	count(result) == 1
	some result_object in result
	count(result_object.values) == 1
}

# METADATA
# title: There are two parser errors
# description: There are two parser errors
test_rule___100_200_001_02_violation_02 if {
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
						"type": "ERROR",
					},
					{
						"column": "",
						"detail": ".",
						"line": "",
						"section": "",
						"short": "test 2",
						"type": "ERROR",
					},
				]},
			},
		],
	)

	result := rules.rule___100_200_001_02 with input as input_data

	count(result) == 1
	some result_object in result
	count(result_object.values) == 2
}
