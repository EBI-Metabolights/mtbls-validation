#########################################################################################################
# Unit tests for rule_i_100_360_011_01
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: There is no study contact with Principal Investigator role.
# description: At least one study contact must have Principal Investigator role.
# custom:
#  rule_id: rule_i_100_360_011_01
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.studyContacts
rule_i_100_360_011_01_test_cases := 1

# METADATA
# title: Principal Investigator role is not in study.
# description: There is no Principal Investigator role in study.
test_rule_i_100_360_011_01_violation_01 if {
	result := rules.rule_i_100_360_011_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyContacts": {"people": [{
			"lastName": "",
			"firstName": "",
			"midInitials": "",
			"email": "",
			"phone": "",
			"fax": "",
			"address": "",
			"affiliation": "E",
			"roles": [
				{
					"term": "Author",
					"termAccessionNumber": "http://",
					"termSourceRef": "",
				},
				{
					"term": "Investigator",
					"termAccessionNumber": "http://",
					"termSourceRef": "",
				},
			],
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}

	count(result) == 1
}

# METADATA
# title: Principal Investigator role is not in study.
# description: There is one Principal Investigator role in study.
test_rule_i_100_360_011_01_success_01 if {
	result := rules.rule_i_100_360_011_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyContacts": {"people": [{
			"lastName": "",
			"firstName": "",
			"midInitials": "",
			"email": "",
			"phone": "",
			"fax": "",
			"address": "",
			"affiliation": "E",
			"roles": [
				{
					"term": "Author",
					"termAccessionNumber": "http://",
					"termSourceRef": "",
				},
				{
					"term": "Principal Investigator",
					"termAccessionNumber": "http://",
					"termSourceRef": "",
				},
			],
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}

	count(result) == 0
}

# METADATA
# title: Principal Investigator role is not in study.
# description: There is two Principal Investigator roles in study.
test_rule_i_100_360_011_01_success_02 if {
	result := rules.rule_i_100_360_011_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyContacts": {"people": [
			{
				"lastName": "",
				"firstName": "",
				"midInitials": "",
				"email": "",
				"phone": "",
				"fax": "",
				"address": "",
				"affiliation": "E",
				"roles": [
					{
						"term": "Author",
						"termAccessionNumber": "http://",
						"termSourceRef": "",
					},
					{
						"term": "Principal Investigator",
						"termAccessionNumber": "http://",
						"termSourceRef": "",
					},
				],
			},
			{
				"lastName": "",
				"firstName": "",
				"midInitials": "",
				"email": "",
				"phone": "",
				"fax": "",
				"address": "",
				"affiliation": "E",
				"roles": [
					{
						"term": "Author",
						"termAccessionNumber": "http://",
						"termSourceRef": "",
					},
					{
						"term": "Principal Investigator",
						"termAccessionNumber": "http://",
						"termSourceRef": "",
					},
				],
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}

	count(result) == 0
}
