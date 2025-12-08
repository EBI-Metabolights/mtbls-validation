#########################################################################################################
# Unit tests for rule___100_400_001_05
#########################################################################################################
package tests.input_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Technology type not defined for metabolite assignment file.
# description: Assignment file technology type must be defined to execute file type validation rules.
# custom:
#  rule_id: rule___100_400_001_05
#  type: ERROR
#  priority: CRITICAL
#  section: metabolites.general
rule___100_400_001_05_test_cases := 1

# METADATA
# title: Metabolite assignment file technology type is defined.
# description: Metabolite assignment file technology type is defined.
test_rule___100_400_001_05_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/metaboliteAssignments/m_REQ2025111188888-01_MS_metabolite-profiling_v2_maf.tsv",
			"value": {"assayTechnique": {"name": "MS", "mainTechnique": "MS"}},
		}],
	)

	result := rules.rule___100_400_001_05 with input as input_data
	count(result) == 0
}

# METADATA
# title: Metabolite assignment file technology type is not defined.
# description: Metabolite assignment file technology type is not defined.
test_rule___100_400_001_05_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/metaboliteAssignments/m_REQ2025111188888-01_MS_metabolite-profiling_v2_maf.tsv",
			"value": {"assayTechnique": {"name": "", "mainTechnique": ""}},
		}],
	)
	result := rules.rule___100_400_001_05 with input as input_data
	count(result) == 1
}
