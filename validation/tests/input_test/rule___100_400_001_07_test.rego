#########################################################################################################
# Unit tests for rule___100_400_001_07
#########################################################################################################
package tests.input_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Metabolite assignment file name not correct pattern.
# description: Metabolite assignment file name must start with 'm_' and have extension '.tsv'.
# custom:
#  rule_id: rule___100_400_001_07
#  type: ERROR
#  priority: CRITICAL
#  section: metabolites.general
rule___100_400_001_07_test_cases := 1

# METADATA
# title: Metabolite assignment file name is valid.
# description: Metabolite assignment file name is valid.
test_rule___100_400_001_07_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := input_01
	result := rules.rule___100_400_001_07 with input as input_data

	count(result) == 0
}

# METADATA
# title: Metabolite assignment file name extensions and prefixes are not valid.
# description: Metabolite assignment file name extensions and prefixes are not valid.
test_rule___100_400_001_07_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "add",
				"path": "/metaboliteAssignments/m_REQ2025111188888-02.txt",
				"value": {"assayTechnique": {"name": "MS", "mainTechnique": "MS"}},
			},
			{
				"op": "add",
				"path": "/metaboliteAssignments/x_REQ2025111188888-02.tsv",
				"value": {"assayTechnique": {"name": "MS", "mainTechnique": "MS"}},
			},
		],
	)
	result := rules.rule___100_400_001_07 with input as input_data
	count(result) == 2
}
