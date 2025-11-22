#########################################################################################################
# Unit tests for rule_i_100_360_011_05
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study Person Additional Email Address is not valid.
# description: Study Person Additional Email Address must have valid format.
# custom:
#  rule_id: rule_i_100_360_011_05
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyContacts
rule_i_100_360_011_05_test_cases := 1

# METADATA
# title: Study Assay term is  empty
# description: Study Assay term is empty
test_rule_i_100_360_011_05_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyContacts/comments",
			"value": [{
				"name": "Study Person Alternative Email",
				"value": ["a@gov.uk"],
			}],
		}],
	)

	# print(input_data.investigation.studies[0].studyContacts.comments)
	result := rules.rule_i_100_360_011_05 with input as input_data

	count(result) == 0
}

# METADATA
# title: Study Assay term is  empty
# description: Study Assay term is empty
test_rule_i_100_360_011_05_no_violation_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyContacts/comments",
			"value": [{
				"name": "Study Person Alternative Email",
				"value": ["help@ebi.ac.uk"],
			}],
		}],
	)

	# print(input_data.investigation.studies[0].studyContacts.comments)
	result := rules.rule_i_100_360_011_05 with input as input_data

	count(result) == 0
}

# METADATA
# title: Study Assay term is  empty
# description: Study Assay term is empty
test_rule_i_100_360_011_05_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyContacts/comments",
			"value": [{
				"name": "Study Person Alternative Email",
				"value": ["aww!@ebi.ac.uk"],
			}],
		}],
	)

	# print(input_data.investigation.studies[0].studyContacts.comments)
	result := rules.rule_i_100_360_011_05 with input as input_data

	count(result) == 1
}

# METADATA
# title: Study Assay term is  empty
# description: Study Assay term is empty
test_rule_i_100_360_011_05_violation_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyContacts/comments",
			"value": [{
				"name": "Study Person Alternative Email",
				"value": ["www.ebi.ac.uk"],
			}],
		}],
	)

	# print(input_data.investigation.studies[0].studyContacts.comments)
	result := rules.rule_i_100_360_011_05 with input as input_data

	count(result) == 1
}
