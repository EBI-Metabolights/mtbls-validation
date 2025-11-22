#########################################################################################################
# Unit tests for rule_i_100_360_011_04
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study Person ORCID is not valid.
# description: Study Person ORCID must have valid format.
# custom:
#  rule_id: rule_i_100_360_011_04
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyContacts
rule_i_100_360_011_04_test_cases := 1

# METADATA
# title: Study Assay term is  empty
# description: Study Assay term is empty
test_rule_i_100_360_011_04_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyContacts/comments",
			"value": [{
				"name": "Study Person ORCID",
				"value": ["1234-1234-1234-1234"],
			}],
		}],
	)
	result := rules.rule_i_100_360_011_04 with input as input_data

	count(result) == 0
}

# METADATA
# title: Study Assay term is  empty
# description: Study Assay term is empty
test_rule_i_100_360_011_04_no_violation_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyContacts/comments",
			"value": [{
				"name": "Study Person ORCID",
				"value": ["1234-1234-1234-123X"],
			}],
		}],
	)

	result := rules.rule_i_100_360_011_04 with input as input_data

	count(result) == 0
}

# METADATA
# title: Study Assay term is  empty
# description: Study Assay term is empty
test_rule_i_100_360_011_04_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyContacts/comments",
			"value": [{
				"name": "Study Person ORCID",
				"value": ["1234-1234-1234-123A"],
			}],
		}],
	)

	result := rules.rule_i_100_360_011_04 with input as input_data

	count(result) == 1
}

# METADATA
# title: Study Assay term is  empty
# description: Study Assay term is empty
test_rule_i_100_360_011_04_violation_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyContacts/comments",
			"value": [{
				"name": "Study Person ORCID",
				"value": ["1234-1234-1234-123Zs"],
			}],
		}],
	)

	result := rules.rule_i_100_360_011_04 with input as input_data

	count(result) == 1
}
