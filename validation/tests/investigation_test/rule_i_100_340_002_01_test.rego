#########################################################################################################
# Unit tests for rule_i_100_340_002_01
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.definitions as def
import data.metabolights.validation.v2.rules.phase1.violations as rules
import data.tests.data.inputs.rules as test_rules

import rego.v1

# METADATA
# title: Study Assay File Name is empty in investigation file.
# description: Assay file name should be set for each study in i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_340_002_01
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.studyAssays
rule_i_100_340_002_01_test_cases := 1

# METADATA
# title: Study Assay term is  empty
# description: Study Assay term is empty
test_rule_i_100_340_002_01_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := input_01
	result := rules.rule_i_100_340_002_01 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as test_rules.investigation.select_ontology_term_01

	count(result) == 0
}

# METADATA
# title: Study Assay term is  empty
# description: Study Assay term is empty
test_rule_i_100_340_002_01_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyAssays/assays/0/fileName",
			"value": "",
		}],
	)
	result := rules.rule_i_100_340_002_01 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as test_rules.investigation.select_ontology_term_01

	count(result) == 1
}
