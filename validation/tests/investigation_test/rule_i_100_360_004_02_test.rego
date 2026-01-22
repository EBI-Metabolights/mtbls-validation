#########################################################################################################
# Unit tests for rule_i_100_360_004_02
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study Person Email not valid.
# description: Study Person Email must have valid format.
# custom:
#  rule_id: rule_i_100_360_004_02
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyContacts
rule_i_100_360_004_02_test_cases := 1

# METADATA
# title: study contact email is valid.
# description: study contact email is valid.
test_rule_i_100_360_004_02_no_violation_01 if {
	result := rules.rule_i_100_360_004_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyContacts": {"people": [
			{
				"lastName": "",
				"firstName": "",
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
				"email": "test@ebi.embl.ac.uk",
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
test_rule_i_100_360_004_02_violation_02 if {
	result := rules.rule_i_100_360_004_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyContacts": {"people": [
			{
				"lastName": "",
				"firstName": "",
				"midInitials": "",
				"email": "ebi@ac,uk",
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
				"email": "@ebi.ac.uk",
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
				"email": "test@ebi",
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
				"email": "test@ebi-ac.uk",
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
	count(result) == 3
}
