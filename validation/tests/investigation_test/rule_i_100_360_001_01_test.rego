#########################################################################################################
# Unit tests for rule_i_100_360_001_01
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: No study contacts referenced in investigation file.
# description: At least one study contacts should be defined in i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_360_001_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyContacts
rule_i_100_360_001_01_test_cases := 1

# METADATA
# title: There are two study contacts
# description: There are two study contacts in i_Investigation.txt.
test_rule_i_100_360_001_01_no_violation_02 if {
	result := rules.rule_i_100_360_001_01 with input as {
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
# title: There is no study contacts.
# description: There is no study contacts in i_Investigation.txt.
test_rule_i_100_360_001_01_violation_01 if {
	result := rules.rule_i_100_360_001_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyContacts": {"people": []}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}
