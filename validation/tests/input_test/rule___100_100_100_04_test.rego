#########################################################################################################
# Unit tests for rule___100_100_100_04
#########################################################################################################
package tests.input_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Investigation file name is not i_Investigation.txt
# description: Update investigation name as i_Investigation.txt
# custom:
#  rule_id: rule___100_100_100_04
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.general
rule___100_100_100_04_test_cases := 1

# METADATA
# title: Valid investigation file name.
# description: Only i_Investigation.txt file name is valid.
test_rule___100_100_100_04_no_violation_01 if {
	result := rules.rule___100_100_100_04 with input as {"investigationFilePath": "i_Investigation.txt"}
	count(result) == 0
}

# METADATA
# title: Invalid investigation file name.
# description: File  extension does not match.
test_rule___100_100_100_04_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigationFilePath",
			"value": "i_Investigation.tsv",
		}],
	)
	result := rules.rule___100_100_100_04 with input as input_data
	count(result) == 1
}

# METADATA
# title: Invalid investigation file name.
# description: i_Investigation.txt file name is case sensitive so other combinations are invalid.
test_rule___100_100_100_04_violation_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigationFilePath",
			"value": "i_investigation.txt",
		}],
	)
	result := rules.rule___100_100_100_04 with input as input_data
	count(result) == 1
}
