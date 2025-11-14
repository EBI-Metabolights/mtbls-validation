#########################################################################################################
# Unit tests for rule___100_100_100_01
#########################################################################################################
package tests.input_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: There is a critical file parse error for i_Investigation.txt.
# description: Update i_Investigation.txt file considering error messages.
# custom:
#  rule_id: rule___100_100_100_01
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.parserMessages
rule___100_100_100_01_test_cases := 1

# METADATA
# title: Input has no parser message.
# description: Input has no parser message.
test_rule___100_100_100_01_no_violation_01 if {
	input_01 := data.tests.data.inputs.empty
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/parserMessages",
				"value": {"i_Investigation.txt": []},
			},
			{
				"op": "replace",
				"path": "/investigationFilePath",
				"value": "i_Investigation.txt",
			},
		],
	)
	result := rules.rule___100_100_100_01 with input as input_data
	count(result) == 0
}

# METADATA
# title: Input has multiple error messages.
# description: Input has multiple error messages.
test_rule___100_100_100_01_no_violation_2 if {
	input_01 := data.tests.data.inputs.empty
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/parserMessages",
				"value": {"i_Investigation.txt": [
					{
						"detail": "Critical message.",
						"short": "test 1",
						"column": "",
						"line": "",
						"section": "",
						"type": "WARNING",
					},
					{
						"detail": "Critical message 2.",
						"short": "test 2",
						"column": "",
						"line": "",
						"section": "",
						"type": "ERROR",
					},
				]},
			},
			{
				"op": "replace",
				"path": "/investigationFilePath",
				"value": "i_Investigation.txt",
			},
		],
	)
	result := rules.rule___100_100_100_01 with input as input_data
	count(result) == 0
}

# METADATA
# title: Input has a critical parser message.
# description: Input has a critical parser message.
test_rule___100_100_100_01_violation_01 if {
	input_01 := data.tests.data.inputs.empty
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/parserMessages",
				"value": {"i_Investigation.txt": [{
					"detail": "Critical message.",
					"short": "test 1",
					"column": "",
					"line": "",
					"section": "",
					"type": "CRITICAL",
				}]},
			},
			{
				"op": "replace",
				"path": "/investigationFilePath",
				"value": "i_Investigation.txt",
			},
		],
	)
	result := rules.rule___100_100_100_01 with input as input_data
	count(result) == 1
}

# METADATA
# title: Input data is compliance with the schema with empty.
# description: Input has all fields and no extra fields.
test_rule___100_100_100_01_violation_02 if {
	input_01 := data.tests.data.inputs.empty
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/parserMessages",
				"value": {"i_Investigation.txt": [
					{
						"detail": "Critical message.",
						"short": "test 1",
						"column": "",
						"line": "",
						"section": "",
						"type": "CRITICAL",
					},
					{
						"detail": "Critical message 2.",
						"short": "test 2",
						"column": "",
						"line": "",
						"section": "",
						"type": "CRITICAL",
					},
				]},
			},
			{
				"op": "replace",
				"path": "/investigationFilePath",
				"value": "i_Investigation.txt",
			},
		],
	)
	result := rules.rule___100_100_100_01 with input as input_data
	count(result) == 2
}
