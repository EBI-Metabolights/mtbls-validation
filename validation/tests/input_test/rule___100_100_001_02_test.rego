#########################################################################################################
# Unit tests for rule___100_100_001_02
#########################################################################################################
package tests.input_test

import data.metabolights.validation.v2.rules.phase1.violations as rules
import data.metabolights.validation.v2.utils.functions as f

import rego.v1

# METADATA
# title: Input data format is not valid.
# description: Input data must have valid schema.
# custom:
#  rule_id: rule___100_100_001_02
#  type: ERROR
#  priority: CRITICAL
#  section: input
rule___100_100_001_02_test_cases := 1

# METADATA
# title: Input data is compliance with the schema with empty.
# description: Input has all fields and no extra fields.
test_rule___100_100_001_02_no_violation_01 if {
	result := rules.rule___100_100_001_02 with input as data.tests.data.inputs.empty
	print(result)
	count(result) == 0
}

# METADATA
# title: Input data is compliance with the schema with empty.
# description: Input has all fields and no extra fields.
test_rule___100_100_001_02_no_violation_02 if {
	result := rules.rule___100_100_001_02 with input as data.tests.data.inputs.minimum_01
	count(result) == 0
}

# METADATA
# title: Input data is not compliance with the schema.
# description: Input is invalid for empty input.
test_rule___100_100_001_02_violation_01 if {
	input_01 := data.tests.data.inputs.empty
	input_data := json.remove(input_01, {"investigation"})
	result := rules.rule___100_100_001_02 with input as input_data
	count(result) == 1
}

# METADATA
# title: Input data is not compliance with the schema.
# description: Input has missing and additional fields.
test_rule___100_100_001_02_violation_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(input_01, [{"op": "replace", "path": "/investigationFilePath", "value": 2}])

	result := rules.rule___100_100_001_02 with input as input_data
	count(result) == 1
}
