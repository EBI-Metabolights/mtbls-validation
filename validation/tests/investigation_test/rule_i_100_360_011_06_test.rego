#########################################################################################################
# Unit tests for rule_i_100_360_011_06
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study Person ORCID is not defined for principal investigator.
# description: Study Person ORCID is not defined for principal investigator.
# custom:
#  rule_id: rule_i_100_360_011_06
#  type: WARNING
#  priority: WARNING
#  section: investigation.studyContacts
rule_i_100_360_011_06_test_cases := 1

# METADATA
# title: Study Assay term is  empty
# description: Study Assay term is empty
test_rule_i_100_360_011_06_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyContacts/comments",
				"value": [{
					"name": "Study Person ORCID",
					"value": ["1234-1234-1234-1234"],
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

	result := rules.rule_i_100_360_011_06 with input as input_data

	count(result) == 0
}

# METADATA
# title: Study Assay term is  empty
# description: Study Assay term is empty
test_rule_i_100_360_011_06_no_violation_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyContacts/comments",
				"value": [{
					"name": "Study Person ORCID",
					"value": ["1234-1234-1234-1234"],
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

	result := rules.rule_i_100_360_011_06 with input as input_data

	count(result) == 0
}

# METADATA
# title: Study Assay term is  empty
# description: Study Assay term is empty
test_rule_i_100_360_011_06_no_violation_03 if {
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

	result := rules.rule_i_100_360_011_06 with input as input_data

	count(result) == 0
}

# METADATA
# title: Study Assay term is  empty
# description: Study Assay term is empty
test_rule_i_100_360_011_06_no_violation_04 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyContacts/comments",
				"value": [{
					"name": "Study Person ORCID",
					"value": ["1234-1234-1234-1234"],
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

	result := rules.rule_i_100_360_011_06 with input as input_data

	count(result) == 0
}

# METADATA
# title: Study Assay term is  empty
# description: Study Assay term is empty
test_rule_i_100_360_011_06_violation_01 if {
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

	result := rules.rule_i_100_360_011_06 with input as input_data

	count(result) == 1
}
