#########################################################################################################
# Unit tests for rule___100_400_001_08
#########################################################################################################
package tests.input_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Metabolite assignment file name contains invalid characters.
# description: Use only .-_A-Za-z0-9 characters for an metabolite assignment file name. e.g. m_REQ2025010211233_LC-MS_negative_reverse-phase_metabolite_profiling_v2_maf.tsv
# custom:
#  rule_id: rule___100_400_001_08
#  type: ERROR
#  priority: CRITICAL
#  section: metabolites.general
rule___100_400_001_08_test_cases := 1

# METADATA
# title: Metabolite assignment file name is valid.
# description: Metabolite assignment file name is valid.
test_rule___100_400_001_08_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := input_01
	result := rules.rule___100_400_001_08 with input as input_data

	count(result) == 0
}

# METADATA
# title: Metabolite assignment file name is not valid  - contains space, , and +.
# description: Metabolite assignment file name is not valid.
test_rule___100_400_001_08_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "add",
				"path": "/metaboliteAssignments/m_ REQ2025111188888-02.txt",
				"value": {"assayTechnique": {"name": "MS", "mainTechnique": "MS"}},
			},
			{
				"op": "add",
				"path": "/metaboliteAssignments/x_,REQ2025111188888-02.tsv",
				"value": {"assayTechnique": {"name": "MS", "mainTechnique": "MS"}},
			},
			{
				"op": "add",
				"path": "/metaboliteAssignments/x_+REQ2025111188888-02.tsv",
				"value": {"assayTechnique": {"name": "MS", "mainTechnique": "MS"}},
			},
		],
	)
	result := rules.rule___100_400_001_08 with input as input_data
	count(result) == 3
}
