#########################################################################################################
# Unit tests for rule___100_100_100_02
#########################################################################################################
package tests.input_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: There is a file parse error for i_Investigation.txt.
# description: Update i_Investigation.txt file considering error messages.
# custom:
#  rule_id: rule___100_100_100_02
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.parserMessages
rule___100_100_100_02_test_cases := 1

# METADATA
# title: Input has no parser message.
# description: Input has no parser message.
test_rule___100_100_100_02_no_violation_01 if {
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
	result := rules.rule___100_100_100_02 with input as input_data
	count(result) == 0
}

# METADATA
# title: Input has only warning parser messages.
# description: Input has only warning parser messages.
test_rule___100_100_100_02_no_violation_02 if {
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
						"type": "WARNING",
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
	result := rules.rule___100_100_100_02 with input as input_data
	count(result) == 0
}

# METADATA
# title: Input has an error parser message.
# description: Input has an error parser message.
test_rule___100_100_100_02_violation_01 if {
	input_01 := data.tests.data.inputs.empty
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/parserMessages",
				"value": {"i_Investigation.txt": [{
					"detail": "Error message.",
					"short": "test 1",
					"column": "",
					"line": "",
					"section": "",
					"type": "ERROR",
				}]},
			},
			{
				"op": "replace",
				"path": "/investigationFilePath",
				"value": "i_Investigation.txt",
			},
		],
	)
	result := rules.rule___100_100_100_02 with input as input_data
	count(result) == 1
}

# METADATA
# title: Input has multiple error parser messages.
# description: Input has multiple error parser messages.
test_rule___100_100_100_02_violation_02 if {
	input_01 := data.tests.data.inputs.empty
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/parserMessages",
				"value": {"i_Investigation.txt": [
					{
						"detail": "Error message.",
						"short": "test 1",
						"column": "",
						"line": "",
						"section": "",
						"type": "ERROR",
					},
					{
						"detail": "Error message 2.",
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
	result := rules.rule___100_100_100_02 with input as input_data
	count(result) == 2
}
