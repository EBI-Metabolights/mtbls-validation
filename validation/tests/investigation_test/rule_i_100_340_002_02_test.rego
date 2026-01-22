#########################################################################################################
# Unit tests for rule_i_100_340_002_02
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.definitions as def
import data.metabolights.validation.v2.rules.phase1.violations as rules
import data.tests.data.inputs.rules as test_rules

import rego.v1

# METADATA
# title: Study Assay File Name not correct pattern.
# description: Assay file name must start with 'a_' and have extension '.txt'.
# custom:
#  rule_id: rule_i_100_340_002_02
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.studyAssays
rule_i_100_340_002_02_test_cases := 1

# METADATA
# title: Study Assay term is  empty
# description: Study Assay term is empty
test_rule_i_100_340_002_02_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyAssays/assays/0/fileName",
			"value": "a_REQ11111.txt",
		}],
	)
	result := rules.rule_i_100_340_002_02 with input as input_data

	count(result) == 0
}

# METADATA
# title: Study Assay term is  empty
# description: Study Assay term is empty
test_rule_i_100_340_002_02_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyAssays/assays/0/fileName",
			"value": "a_MTBLS1111.tsv",
		}],
	)
	result := rules.rule_i_100_340_002_02 with input as input_data

	count(result) == 1
}
