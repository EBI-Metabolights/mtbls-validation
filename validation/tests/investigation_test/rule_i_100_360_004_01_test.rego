#########################################################################################################
# Unit tests for rule_i_100_360_004_01
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study contacts have no email address.
# description: At least one study contact must have an email address.
# custom:
#  rule_id: rule_i_100_360_004_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyContacts
rule_i_100_360_004_01_test_cases := 1

# METADATA
# title: study contact email is valid.
# description: study contact email is valid.
test_rule_i_100_360_004_01_no_violation_01 if {
	result := rules.rule_i_100_360_004_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyContacts": {"people": [
			{
				"lastName": "xa",
				"firstName": "xx",
				"midInitials": "",
				"email": "test@ebi.ac.uk",
				"phone": "",
				"fax": "",
				"address": "",
				"affiliation": "",
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
				"affiliation": "",
				"roles": [{
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				}],
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: study contact emails are not valid.
# description: study contact emails are not valid.
test_rule_i_100_360_004_01_violation_01 if {
	result := rules.rule_i_100_360_004_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyContacts": {"people": [{
			"lastName": "",
			"firstName": "",
			"midInitials": "",
			"email": "",
			"phone": "",
			"fax": "",
			"address": "",
			"affiliation": "",
			"roles": [{
				"term": "",
				"termAccessionNumber": "",
				"termSourceRef": "",
			}],
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}
