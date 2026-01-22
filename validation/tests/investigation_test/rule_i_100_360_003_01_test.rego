#########################################################################################################
# Unit tests for rule_i_100_360_003_01
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study Person Last Name length less than 2 characters.
# description: Study Person Last Name should be defined with length equal or greater than 2 characters.
# custom:
#  rule_id: rule_i_100_360_003_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyContacts
rule_i_100_360_003_01_test_cases := 1

# METADATA
# title: study contacts last name is valid.
# description: study contacts last name is valid.
test_rule_i_100_360_003_01_no_violation_01 if {
	result := rules.rule_i_100_360_003_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyContacts": {"people": [
			{
				"lastName": "A.",
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
			},
			{
				"lastName": "Sandras",
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
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: study contact last names are not valid.
# description: study contact last names are not valid.
test_rule_i_100_360_003_01_violation_01 if {
	result := rules.rule_i_100_360_003_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyContacts": {"people": [
			{
				"lastName": "A",
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
			},
			{
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
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 2
}
