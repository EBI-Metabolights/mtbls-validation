#########################################################################################################
# Unit tests for rule_i_100_360_011_03
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study Person Affiliation ROR ID is not valid.
# description: Study Person ROR ID must have valid format. e.g., https //ror.org/02catss52 . If your affiliation ROR ID is not defined, you may provide wikidata URL of your primary affiliation. e.g., https //www.wikidata.org/wiki/Q1341845
# custom:
#  rule_id: rule_i_100_360_011_03
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyContacts
rule_i_100_360_011_03_test_cases := 1

# METADATA
# title: Study Assay term is  empty
# description: Study Assay term is empty
test_rule_i_100_360_011_03_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyContacts/comments",
			"value": [{
				"name": "Study Person Affiliation ROR ID",
				"value": ["https://ror.org/xyzxyzxyz"],
			}],
		}],
	)
	print(input_data.investigation.studies[0].studyContacts.comments)
	result := rules.rule_i_100_360_011_03 with input as input_data

	count(result) == 0
}

# METADATA
# title: Study Assay term is  empty
# description: Study Assay term is empty
test_rule_i_100_360_011_03_no_violation_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyContacts/comments",
			"value": [{
				"name": "Study Person Affiliation ROR ID",
				"value": ["https://www.wikidata.org/wiki/Q212"],
			}],
		}],
	)
	print(input_data.investigation.studies[0].studyContacts.comments)
	result := rules.rule_i_100_360_011_03 with input as input_data

	count(result) == 0
}

# METADATA
# title: Study Assay term is  empty
# description: Study Assay term is empty
test_rule_i_100_360_011_03_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyContacts/comments",
			"value": [{
				"name": "Study Person Affiliation ROR ID",
				"value": ["https://ebi.ac.uk"],
			}],
		}],
	)
	print(input_data.investigation.studies[0].studyContacts.comments)
	result := rules.rule_i_100_360_011_03 with input as input_data

	count(result) == 1
}

# METADATA
# title: Study Assay term is  empty
# description: Study Assay term is empty
test_rule_i_100_360_011_03_violation_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyContacts/comments",
			"value": [{
				"name": "Study Person Affiliation ROR ID",
				"value": ["https://www.wikidata.org/wiki/212"],
			}],
		}],
	)
	print(input_data.investigation.studies[0].studyContacts.comments)
	result := rules.rule_i_100_360_011_03 with input as input_data

	count(result) == 1
}
