#########################################################################################################
# Unit tests for rule___100_400_001_06
#########################################################################################################
package tests.input_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Metabolite assignment file is not referenced in assay file(s).
# description: Update assay files to reference the metabolite assignment or delete it.
# custom:
#  rule_id: rule___100_400_001_06
#  type: ERROR
#  priority: CRITICAL
#  section: metabolites.general
rule___100_400_001_06_test_cases := 1

# METADATA
# title: Metabolite assignment file is referenced in assay file.
# description: Metabolite assignment file is referenced in assay file.
test_rule___100_400_001_06_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := input_01
	result := rules.rule___100_400_001_06 with input as input_data

	count(result) == 0
}

# METADATA
# title: Metabolite assignment file is not referenced in assay file.
# description: Metabolite assignment file is not referenced in assay file.
test_rule___100_400_001_06_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "add",
				"path": "/metaboliteAssignments/m_REQ2025111188888-01.tsv",
				"value": {"assayTechnique": {"name": "MS", "mainTechnique": "MS"}},
			},
			{
				"op": "add",
				"path": "/metaboliteAssignments/m_REQ2025111188888-02.tsv",
				"value": {"assayTechnique": {"name": "MS", "mainTechnique": "MS"}},
			},
		],
	)

	result := rules.rule___100_400_001_06 with input as input_data
	count(result) == 2
}
