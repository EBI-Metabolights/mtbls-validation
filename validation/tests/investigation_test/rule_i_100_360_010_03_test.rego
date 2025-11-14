#########################################################################################################
# Unit tests for rule_i_100_360_010_03
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study Person Roles Term Source REF is empty.
# description: Study Person Roles Term Source REF should be defined.
# custom:
#  rule_id: rule_i_100_360_010_03
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyContacts
rule_i_100_360_010_03_test_cases := 1

# METADATA
# title: study contact role source reference  is  in prioritised control list.
# description: study contact role source reference is in prioritised control list.
test_rule_i_100_360_010_03_no_violation_01 if {
	result := rules.rule_i_100_360_010_03 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyContacts": {"people": [{
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
					"term": "Author",
					"termAccessionNumber": "http://",
					"termSourceRef": "NCBI",
				},
				{
					"term": "Principal Investigator",
					"termAccessionNumber": "http://",
					"termSourceRef": "EFO",
				},
			],
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}

	count(result) == 0
}

# METADATA
# title: study contact role source reference is not in prioritised control list.
# description: study contact role source reference is not in prioritised control list.
test_rule_i_100_360_010_03_violation_01 if {
	result := rules.rule_i_100_360_010_03 with input as {
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

	count(result) == 2
}
