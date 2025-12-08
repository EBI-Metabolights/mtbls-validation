#########################################################################################################
# Unit tests for rule___100_100_100_05
#########################################################################################################
package tests.input_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: There is no parser information for i_Investigation.txt.
# description: Define i_Investigation.txt in parserMessages.
# custom:
#  rule_id: rule___100_100_100_05
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.parserMessages
rule___100_100_100_05_test_cases := 1

# METADATA
# title: Input data has parser message list for i_Investigation.txt.
# description: There is i_Investigation.txt key in parserMessages.
test_rule___100_100_100_05_no_violation_01 if {
	result := rules.rule___100_100_100_05 with input as {
		"parserMessages": {"i_Investigation.txt": []},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Input data has no parser message list for i_Investigation.txt.
# description: i_Investigation.txt key is missing in parserMessages.
test_rule___100_100_100_05_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/parserMessages",
			"value": [],
		}],
	)

	result := rules.rule___100_100_100_05 with input as input_data
	count(result) == 1
}
