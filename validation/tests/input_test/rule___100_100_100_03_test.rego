#########################################################################################################
# Unit tests for rule___100_100_100_03
#########################################################################################################
package tests.input_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: There is a file parse warning for i_Investigation.txt.
# description: Update i_Investigation.txt file considering warning messages.
# custom:
#  rule_id: rule___100_100_100_03
#  type: WARNING
#  priority: HIGH
#  section: investigation.parserMessages
rule___100_100_100_03_test_cases := 1

# METADATA
# title: Input has no parser message.
# description: Input has no parser message.
test_rule___100_100_100_03_no_violation_01 if {
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
	result := rules.rule___100_100_100_03 with input as input_data
	count(result) == 0
}

# METADATA
# title: Input has only warning parser messages.
# description: Input has only warning parser messages.
test_rule___100_100_100_03_no_violation_02 if {
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
						"type": "INFO",
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
	result := rules.rule___100_100_100_03 with input as input_data
	count(result) == 0
}

# METADATA
# title: Input has a warning parser message.
# description: Input has a warning parser message.
test_rule___100_100_100_03_violation_01 if {
	input_01 := data.tests.data.inputs.empty
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/parserMessages",
				"value": {"i_Investigation.txt": [{
					"detail": "Warning message.",
					"short": "test 1",
					"column": "",
					"line": "",
					"section": "",
					"type": "WARNING",
				}]},
			},
			{
				"op": "replace",
				"path": "/investigationFilePath",
				"value": "i_Investigation.txt",
			},
		],
	)
	result := rules.rule___100_100_100_03 with input as input_data
	count(result) == 1
}

# METADATA
# title: Input has multiple warning parser messages.
# description: Input has multiple warning parser messages.
test_rule___100_100_100_03_violation_02 if {
	input_01 := data.tests.data.inputs.empty
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/parserMessages",
				"value": {"i_Investigation.txt": [
					{
						"detail": "Warning message.",
						"short": "test 1",
						"column": "",
						"line": "",
						"section": "",
						"type": "WARNING",
					},
					{
						"detail": "Warning message 2.",
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
	result := rules.rule___100_100_100_03 with input as input_data
	count(result) == 2
}
