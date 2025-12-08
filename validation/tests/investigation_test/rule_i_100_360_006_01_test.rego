#########################################################################################################
# Unit tests for rule_i_100_360_006_01
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study Person affiliation length is less than 10 characters.
# description: Define full name of contact's primary affiliation. e.g. European Bioinformatics Institute
# custom:
#  rule_id: rule_i_100_360_006_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyContacts
rule_i_100_360_006_01_test_cases := 1

# METADATA
# title: study contact affiliation is valid.
# description: study contact affiliation is valid.
test_rule_i_100_360_006_01_no_violation_01 if {
	result := rules.rule_i_100_360_006_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyContacts": {"people": [
			{
				"lastName": "",
				"firstName": "",
				"midInitials": "",
				"email": "",
				"phone": "",
				"fax": "",
				"address": "",
				"affiliation": "EMBL European Bioinformatics Institute",
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
				"affiliation": "Cambridge University",
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
# title: study contact affiliations are not valid.
# description: study contact affiliations are not valid.
test_rule_i_100_360_006_01_violation_01 if {
	result := rules.rule_i_100_360_006_01 with input as {
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
				"affiliation": "Cambridge",
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
				"affiliation": "Cambridge1",
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

# METADATA
# title: study first contact's affiliation is empty.
# description: first contact's affiliation is empty.
test_rule_i_100_360_006_01_violation_02 if {
	result := rules.rule_i_100_360_006_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyContacts": {"people": [
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
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}
