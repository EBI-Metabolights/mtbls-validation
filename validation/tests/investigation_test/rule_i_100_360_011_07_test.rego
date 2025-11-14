#########################################################################################################
# Unit tests for rule_i_100_360_011_07
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study Person Affiliation ROR ID is not defined for principal investigator.
# description: Study Person Affiliation ROR ID is not defined for principal investigator.
# custom:
#  rule_id: rule_i_100_360_011_07
#  type: WARNING
#  priority: WARNING
#  section: investigation.studyContacts
rule_i_100_360_011_05_test_cases := 1

# METADATA
# title: Study Assay term is  empty
# description: Study Assay term is empty
test_rule_i_100_360_011_07_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyContacts/comments",
				"value": [{
					"name": "Study Person Affiliation ROR ID",
					"value": ["https://www.wikidata.org/wiki/212"],
				}],
			},
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyContacts/people/0/roles",
				"value": [{
					"term": "Principal Investigator",
					"termAccessionNumber": "http://purl.obolibrary.org/obo/NCIT_C19924",
					"termSourceRef": "NCIT",
				}],
			},
		],
	)
	print("rule_i_100_360_011_07", input_data)
	result := rules.rule_i_100_360_011_07 with input as input_data

	count(result) == 0
}

# METADATA
# title: Study Assay term is  empty
# description: Study Assay term is empty
test_rule_i_100_360_011_07_no_violation_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyContacts/comments",
				"value": [{
					"name": "Study Person Affiliation ROR ID",
					"value": ["https://ror.org/xyzxyzxyz"],
				}],
			},
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyContacts/people/0/roles",
				"value": [{
					"term": "grant principal investigator",
					"termAccessionNumber": "http://purl.obolibrary.org/obo/NCIT_C19924",
					"termSourceRef": "NCIT",
				}],
			},
		],
	)
	result := rules.rule_i_100_360_011_07 with input as input_data

	count(result) == 0
}

# METADATA
# title: Study Assay term is  empty
# description: Study Assay term is empty
test_rule_i_100_360_011_07_no_violation_03 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyContacts/comments",
				"value": [],
			},
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyContacts/people/0/roles",
				"value": [{
					"term": "Investigator",
					"termAccessionNumber": "http://purl.obolibrary.org/obo/NCIT_C19924",
					"termSourceRef": "NCIT",
				}],
			},
		],
	)
	print(input_data.investigation.studies[0].studyContacts.comments)
	result := rules.rule_i_100_360_011_07 with input as input_data

	count(result) == 0
}

# METADATA
# title: Study Assay term is  empty
# description: Study Assay term is empty
test_rule_i_100_360_011_07_no_violation_04 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyContacts/comments",
				"value": [{
					"name": "Study Person Affiliation ROR ID",
					"value": ["https://ror.org/invalid"],
				}],
			},
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyContacts/people/0/roles",
				"value": [{
					"term": "investigator",
					"termAccessionNumber": "http://purl.obolibrary.org/obo/NCIT_C19924",
					"termSourceRef": "NCIT",
				}],
			},
		],
	)
	print(input_data.investigation.studies[0].studyContacts.comments)
	result := rules.rule_i_100_360_011_07 with input as input_data

	count(result) == 0
}

# METADATA
# title: Study Assay term is  empty
# description: Study Assay term is empty
test_rule_i_100_360_011_07_no_violation_05 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyContacts/comments",
				"value": [{
					"name": "Study Person Affiliation ROR ID",
					"value": [""],
				}],
			},
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyContacts/people/0/roles",
				"value": [{
					"term": "investigator",
					"termAccessionNumber": "http://purl.obolibrary.org/obo/NCIT_C19924",
					"termSourceRef": "NCIT",
				}],
			},
		],
	)
	print(input_data.investigation.studies[0].studyContacts.comments)
	result := rules.rule_i_100_360_011_07 with input as input_data

	count(result) == 0
}

# METADATA
# title: Study Assay term is  empty
# description: Study Assay term is empty
test_rule_i_100_360_011_07_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyContacts/comments",
				"value": [],
			},
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyContacts/people/0/roles",
				"value": [{
					"term": "Principal Investigator",
					"termAccessionNumber": "http://purl.obolibrary.org/obo/NCIT_C19924",
					"termSourceRef": "NCIT",
				}],
			},
		],
	)
	print(input_data.investigation.studies[0].studyContacts.comments)
	result := rules.rule_i_100_360_011_07 with input as input_data

	count(result) == 1
}

# METADATA
# title: Study Assay term is  empty
# description: Study Assay term is empty
test_rule_i_100_360_011_07_violation_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyContacts/comments",
				"value": [""],
			},
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyContacts/people/0/roles",
				"value": [{
					"term": "Principal Investigator",
					"termAccessionNumber": "http://purl.obolibrary.org/obo/NCIT_C19924",
					"termSourceRef": "NCIT",
				}],
			},
		],
	)
	print(input_data.investigation.studies[0].studyContacts.comments)
	result := rules.rule_i_100_360_011_07 with input as input_data

	count(result) == 1
}
