#########################################################################################################
# Unit tests for rule_i_100_360_011_02
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Principal Investigator contact details not defined.
# description: Principal Investigator first name, last name, affiliation, and email must be defined.
# custom:
#  rule_id: rule_i_100_360_011_02
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.studyContacts
rule_i_100_360_011_02_test_cases := 1

# METADATA
# title: Principal Investigator role details are not in study..
# description: Principal Investigator details are not in study.
test_rule_i_100_360_011_02_violation_01 if {
	result := rules.rule_i_100_360_011_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyContacts": {
			"comments": [
				{
					"name": "Study Person ORCID",
					"value": ["0000-0002-7899-7191", "0000-0002-7899-7192"],
				},
				{
					"name": "Study Person Affiliation ROR ID",
					"value": ["https://ror.org/01g8f8d13", "https://ror.org/01g8f8d12"],
				},
			],
			"people": [{
				"lastName": "Test",
				"firstName": "",
				"midInitials": "",
				"email": "help@ebi.ac.uk",
				"phone": "",
				"fax": "",
				"address": "",
				"affiliation": "EMBL European Bioinformatics Institute",
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
			}],
		}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

# METADATA
# title: Principal Investigator role details are not in study..
# description: Principal Investigator details are not in study.
test_rule_i_100_360_011_02_violation_02 if {
	result := rules.rule_i_100_360_011_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyContacts": {
			"comments": [
				{
					"name": "Study Person ORCID",
					"value": ["0000-0002-7899-7191", "0000-0002-7899-7192"],
				},
				{
					"name": "Study Person Affiliation ROR ID",
					"value": ["https://ror.org/01g8f8d13", "https://ror.org/01g8f8d12"],
				},
			],
			"people": [{
				"lastName": "",
				"firstName": "Test",
				"midInitials": "",
				"email": "help@ebi.ac.uk",
				"phone": "",
				"fax": "",
				"address": "",
				"affiliation": "EMBL European Bioinformatics Institute",
				"roles": [
					{
						"term": "Author",
						"termAccessionNumber": "http://",
						"termSourceRef": "",
					},
					{
						"term": "Grant Principal Investigator",
						"termAccessionNumber": "http://",
						"termSourceRef": "",
					},
				],
			}],
		}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

# METADATA
# title: Principal Investigator role details are not in study..
# description: Principal Investigator details are not in study.
test_rule_i_100_360_011_02_violation_03 if {
	result := rules.rule_i_100_360_011_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyContacts": {
			"comments": [
				{
					"name": "Study Person ORCID",
					"value": ["0000-0002-7899-7191", "0000-0002-7899-7192"],
				},
				{
					"name": "Study Person Affiliation ROR ID",
					"value": ["https://ror.org/01g8f8d13", "https://ror.org/01g8f8d12"],
				},
			],
			"people": [{
				"lastName": "Test",
				"firstName": "Test",
				"midInitials": "Test2",
				"email": "",
				"phone": "",
				"fax": "",
				"address": "",
				"affiliation": "EMBL European Bioinformatics Institute",
				"roles": [
					{
						"term": "Author",
						"termAccessionNumber": "http://",
						"termSourceRef": "",
					},
					{
						"term": "Grant Principal Investigator",
						"termAccessionNumber": "http://",
						"termSourceRef": "",
					},
				],
			}],
		}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

# METADATA
# title: Principal Investigator role details are not in study..
# description: Principal Investigator details are not in study.
test_rule_i_100_360_011_02_violation_04 if {
	result := rules.rule_i_100_360_011_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyContacts": {
			"comments": [
				{
					"name": "Study Person ORCID",
					"value": ["0000-0002-7899-7191", "0000-0002-7899-7192"],
				},
				{
					"name": "Study Person Affiliation ROR ID",
					"value": ["https://ror.org/01g8f8d13", "https://ror.org/01g8f8d12"],
				},
			],
			"people": [{
				"lastName": "Test",
				"firstName": "Test",
				"midInitials": "Test2",
				"email": "help@ebi.ac.uk",
				"phone": "",
				"fax": "",
				"address": "",
				"affiliation": "",
				"roles": [
					{
						"term": "Author",
						"termAccessionNumber": "http://",
						"termSourceRef": "",
					},
					{
						"term": "Grant Principal Investigator",
						"termAccessionNumber": "http://",
						"termSourceRef": "",
					},
				],
			}],
		}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

# METADATA
# title: Principal Investigator role details are not in study..
# description: Principal Investigator details are not in study.
test_rule_i_100_360_011_02_violation_07 if {
	result := rules.rule_i_100_360_011_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyContacts": {
			"comments": [
				{
					"name": "Study Person ORCID",
					"value": ["0000-0002-7899-7191", "0000-0002-7899-7192"],
				},
				{
					"name": "Study Person Affiliation ROR ID",
					"value": ["https://ror.org/01g8f8d13", "https://ror.org/01g8f8d13"],
				},
			],
			"people": [{
				"lastName": "",
				"firstName": "",
				"midInitials": "",
				"email": "help@ebi.ac.uk",
				"phone": "",
				"fax": "",
				"address": "",
				"affiliation": "Cambridge University",
				"roles": [
					{
						"term": "Author",
						"termAccessionNumber": "http://",
						"termSourceRef": "",
					},
					{
						"term": "Grant Principal Investigator",
						"termAccessionNumber": "http://",
						"termSourceRef": "",
					},
				],
			}],
		}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

# METADATA
# title: Principal Investigator role is not in study.
# description: There is one Principal Investigator role in study.
test_rule_i_100_360_011_02_success_01 if {
	result := rules.rule_i_100_360_011_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyContacts": {
			"comments": [
				{
					"name": "Study Person ORCID",
					"value": ["0000-0002-7899-7191", "0000-0002-7899-7192"],
				},
				{
					"name": "Study Person Affiliation ROR ID",
					"value": ["https://ror.org/01g8f8d13", "https://ror.org/01g8f8d12"],
				},
			],
			"people": [
				{
					"lastName": "test",
					"firstName": "test",
					"midInitials": "",
					"email": "test@ebi.ac.uk",
					"phone": "",
					"fax": "",
					"address": "",
					"affiliation": "EBML European Bioinformatics Institute",
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
					"lastName": "test2",
					"firstName": "test3",
					"midInitials": "",
					"email": "test2@ebi.ac.uk",
					"phone": "",
					"fax": "",
					"address": "",
					"affiliation": "EBML European Bioinformatics Institute",
					"roles": [
						{
							"term": "Author",
							"termAccessionNumber": "http://",
							"termSourceRef": "",
						},
						{
							"term": "Grant Principal Investigator",
							"termAccessionNumber": "http://",
							"termSourceRef": "",
						},
					],
				},
			],
		}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Principal Investigator role is not in study.
# description: There is two Principal Investigator roles in study.
test_rule_i_100_360_011_02_success_02 if {
	result := rules.rule_i_100_360_011_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyContacts": {
			"comments": [
				{
					"name": "Study Person ORCID",
					"value": ["0000-0002-7899-7191", "0000-0002-7899-7192"],
				},
				{
					"name": "Study Person Affiliation ROR ID",
					"value": ["https://ror.org/01g8f8d13", "https://ror.org/01g8f8d12"],
				},
			],
			"people": [
				{
					"lastName": "test",
					"firstName": "test",
					"midInitials": "",
					"email": "test@ebi.ac.uk",
					"phone": "",
					"fax": "",
					"address": "",
					"affiliation": "EBML European Bioinformatics Institute",
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
				},
				{
					"lastName": "test2",
					"firstName": "test3",
					"midInitials": "",
					"email": "test2@ebi.ac.uk",
					"phone": "",
					"fax": "",
					"address": "",
					"affiliation": "EBML European Bioinformatics Institute",
					"roles": [
						{
							"term": "Author",
							"termAccessionNumber": "http://",
							"termSourceRef": "",
						},
						{
							"term": "Grant Principal Investigator",
							"termAccessionNumber": "http://",
							"termSourceRef": "",
						},
					],
				},
			],
		}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}
