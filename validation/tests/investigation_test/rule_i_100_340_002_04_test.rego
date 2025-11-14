#########################################################################################################
# Unit tests for rule_i_100_340_002_04
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study Assay File Name must be unique.
# description: Assay file name must be unique for each study in i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_340_002_04
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyAssays
rule_i_100_340_002_04_test_cases := 1

# METADATA
# title: Study Assay term is  empty
# description: Study Assay term is empty
test_rule_i_100_340_002_04_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyAssays/assays/0/fileName",
				"value": "a_REQ1111_test-data.txt",
			},
			{
				"op": "add",
				"path": "/investigation/studies/0/studyAssays/assays/-",
				"value": {"fileName": "a_REQ1111_test-data1.txt"},
			},
		],
	)
	result := rules.rule_i_100_340_002_04 with input as input_data

	count(result) == 0
}

# METADATA
# title: Study Assay term is  empty
# description: Study Assay term is empty
test_rule_i_100_340_002_04_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "add",
				"path": "/investigation/studies/0/studyAssays/assays/-",
				"value": {"fileName": "a_REQ1111_test-data1.txt"},
			},
			{
				"op": "add",
				"path": "/investigation/studies/0/studyAssays/assays/-",
				"value": {"fileName": "a_REQ1111_test-data1.txt"},
			},
		],
	)
	result := rules.rule_i_100_340_002_04 with input as input_data

	count(result) == 1
}
