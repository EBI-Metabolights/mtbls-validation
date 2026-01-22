#########################################################################################################
# Unit tests for rule_i_100_360_007_01
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study Person Roles is empty.
# description: At least one role should be defined for a study contact.
# custom:
#  rule_id: rule_i_100_360_007_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyContacts
rule_i_100_360_007_01_test_cases := 1

# METADATA
# title: study contact roles are valid.
# description: study contact roles are valid.
test_rule_i_100_360_007_01_no_violation_01 if {
	result := rules.rule_i_100_360_007_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyContacts": {"people": [
			{
				"lastName": "",
				"firstName": "",
				"midInitials": "",
				"email": "",
				"phone": "",
				"fax": "",
				"address": "",
				"affiliation": "EU",
				"roles": [{
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				}],
			},
			{
				"lastName": "",
				"firstName": "",
				"midInitials": "",
				"email": "t",
				"phone": "",
				"fax": "",
				"address": "",
				"affiliation": "EMBL",
				"roles": [
					{
						"term": "",
						"termAccessionNumber": "",
						"termSourceRef": "",
					},
					{
						"term": "",
						"termAccessionNumber": "",
						"termSourceRef": "",
					},
				],
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: study contact role is empty.
# description: study contact role is empty.
test_rule_i_100_360_007_01_violation_01 if {
	result := rules.rule_i_100_360_007_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyContacts": {"people": [{
			"lastName": "",
			"firstName": "",
			"midInitials": "",
			"email": "",
			"phone": "",
			"fax": "",
			"address": "",
			"affiliation": "E",
			"roles": [],
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}
