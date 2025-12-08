#########################################################################################################
# Unit tests for rule___100_100_001_01
#########################################################################################################
package tests.input_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: There is no input data.
# description: There is no input.
# custom:
#  rule_id: rule___100_100_001_01
#  type: ERROR
#  priority: CRITICAL
#  section: input
rule___100_100_001_01_test_cases := 1

# METADATA
# title: Input data is valid but with empty content.
# description: Valid input json content does not produce a violation.
test_rule___100_100_001_01_no_violation_01 if {
	result := rules.rule___100_100_001_01 with input as data.tests.data.inputs.empty
	count(result) == 0
}

# METADATA
# title: Valid input json content does not produce a violation.
# description: Valid input json content does not produce a violation.
test_rule___100_100_001_01_no_violation_02 if {
	result := rules.rule___100_100_001_01 with input as data.tests.data.inputs.minimum_01
	count(result) == 0
}

# METADATA
# title: Input data is empty dict.
# description: Input data is empty.
test_rule___100_100_001_01_violation_01 if {
	result := rules.rule___100_100_001_01 with input as {}
	count(result) == 1
}
