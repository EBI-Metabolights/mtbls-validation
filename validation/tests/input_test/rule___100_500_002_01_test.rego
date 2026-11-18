#########################################################################################################
# Unit tests for rule___100_500_001_01
#########################################################################################################
package tests.input_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Submitter affiliation length is too short.
# description: Submitter affiliation length must be equal or greater than 9. Use full name of the affiliation such as European Bioinformatics Institute (Instead of EBI). Open user profile to update submitter affiliation.
# custom:
#  rule_id: rule___100_500_001_01
#  type: ERROR
#  priority: CRITICAL
#  section: metabolites.general
rule___100_500_001_01_test_cases := 1

# METADATA
# title: Submitter user name is valid.
# description: Metabolite assignment file name is valid.
test_rule___100_500_002_01_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01

	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/studyDbMetadata/submitters",
				"value": [
					{
						"userName": "test@gmail.com",
						"firstName": "Test",
						"lastName": "User",
					},
				],
			},
		],
	)
	result := rules.rule___100_500_001_01 with input as input_data

	count(result) == 0
}

# METADATA
# title: Submitter user name is not valid
# description: Metabolite assignment file name is not valid.
test_rule___100_500_002_01_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/studyDbMetadata/submitters",
				"value": [
					{
						"userName": "test@gmail.com",
						"firstName": "L",
						"lastName": "L",
					},
					{
						"userName": "test2@gmail.com",
						"firstName": "",
						"lastName": "",
					},
					{
						"userName": "test3@gmail.com",
						"firstName": "L",
						"lastName": "User",
					},
				],
			},
		],
	)
	result := rules.rule___100_500_002_01 with input as input_data
	count(result) == 2
}
