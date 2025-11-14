package metabolights.validation.v2.phase1.tests

import rego.v1
import data.metabolights.validation.v2.phase1.violations as rules

#########################################################################################################
# rule_i_100_360_001_01
#########################################################################################################

# METADATA
# title: There is a study contacts
# description: There is one study contacts in i_Investigation.txt.
test_rule_i_100_360_001_01_no_violation_01 if {
	result := rules.rule_i_100_360_001_01 with input as {
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
	count(result) == 0
}

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

#########################################################################################################
# rule_i_100_360_002_01
#########################################################################################################

# METADATA
# title: study contacts first name is valid.
# description: study contacts first name is valid.
test_rule_i_100_360_002_01_no_violation_01 if {
	result := rules.rule_i_100_360_002_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyContacts": {"people": [
			{
				"lastName": "",
				"firstName": "AL",
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
				"firstName": "Alex",
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
# title: study contact first names are not valid.
# description: study contact first names are not valid.
test_rule_i_100_360_002_01_violation_01 if {
	result := rules.rule_i_100_360_002_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyContacts": {"people": [
			{
				"lastName": "",
				"firstName": "A",
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

#########################################################################################################
# rule_i_100_360_003_01
#########################################################################################################

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

#########################################################################################################
# rule_i_100_360_004_01
#########################################################################################################

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

#########################################################################################################
# rule_i_100_360_004_02
#########################################################################################################

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

#########################################################################################################
# rule_i_100_360_006_01
#########################################################################################################

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
			}
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

#########################################################################################################
# rule_i_100_360_007_01
#########################################################################################################

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

#########################################################################################################
# rule_i_100_360_008_01
#########################################################################################################

# METADATA
# title: study contact role term is valid.
# description: study contact role term is valid.
test_rule_i_100_360_008_01_no_violation_01 if {
	result := rules.rule_i_100_360_008_01 with input as {
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
					"term": "Author",
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
						"term": "Author",
						"termAccessionNumber": "",
						"termSourceRef": "",
					},
					{
						"term": "Principal Investigator",
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
# title: study contact role term is not valid.
# description: study contact role term is not valid.
test_rule_i_100_360_008_01_violation_01 if {
	result := rules.rule_i_100_360_008_01 with input as {
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
					"term": "A",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				{
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
			],
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 2
}

#########################################################################################################
# rule_i_100_360_009_01
#########################################################################################################

# METADATA
# title: study contact role accession number is valid.
# description: study contact role accession number is valid.
test_rule_i_100_360_009_01_no_violation_01 if {
	result := rules.rule_i_100_360_009_01 with input as {
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
					"term": "Author",
					"termAccessionNumber": "http://",
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

# METADATA
# title: study contact role accession number is not valid.
# description: study contact role accession number is not valid.
test_rule_i_100_360_009_01_violation_01 if {
	result := rules.rule_i_100_360_009_01 with input as {
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
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 2
}

#########################################################################################################
# rule_i_100_360_010_01
#########################################################################################################

# METADATA
# title: study contact role source reference  is valid.
# description: study contact role source reference is valid.
test_rule_i_100_360_010_01_no_violation_01 if {
	result := rules.rule_i_100_360_010_01 with input as {
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
					"term": "Author",
					"termAccessionNumber": "http://",
					"termSourceRef": "NCBI",
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
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
		with data.metabolights.validation.v2.phase1.definitions._ONTOLOGY_SOURCE_REFERENCE_NAMES as ["EFO", "NCBI"]

	count(result) == 0
}

# METADATA
# title: study contact role source reference is not valid.
# description: study contact role source reference is not valid.
test_rule_i_100_360_010_01_violation_01 if {
	result := rules.rule_i_100_360_010_01 with input as {
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
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "UO",
				},
				{
					"term": "",
					"termAccessionNumber": "h",
					"termSourceRef": "MTBLS",
				},
			],
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
		with data.metabolights.validation.v2.phase1.definitions._ONTOLOGY_SOURCE_REFERENCE_NAMES as ["EFO", "NCBI"]

	count(result) == 2
}

#########################################################################################################
# rule_i_100_360_010_02
#########################################################################################################

# METADATA
# title: study contact role source reference  is  in prioritised control list.
# description: study contact role source reference is in prioritised control list.
test_rule_i_100_360_010_02_no_violation_01 if {
	result := rules.rule_i_100_360_010_02 with input as {
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
					"term": "Author",
					"termAccessionNumber": "http://",
					"termSourceRef": "NCBI",
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
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
		with data.metabolights.validation.v2.phase1.definitions.CL_STUDY_CONTACT_ROLE_REF_SOURCES as ["EFO", "NCBI"]

	count(result) == 0
}

# METADATA
# title: study contact role source reference is not in prioritised control list.
# description: study contact role source reference is not in prioritised control list.
test_rule_i_100_360_010_02_violation_01 if {
	result := rules.rule_i_100_360_010_02 with input as {
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
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "UO",
				},
				{
					"term": "",
					"termAccessionNumber": "h",
					"termSourceRef": "MTBLS",
				},
			],
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
		with data.metabolights.validation.v2.phase1.definitions.CL_STUDY_CONTACT_ROLE_REF_SOURCES as ["EFO", "NCBI"]

	count(result) == 2
}

#########################################################################################################
# rule_i_100_360_010_03
#########################################################################################################

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


#########################################################################################################
# rule_i_100_360_011_01
#########################################################################################################

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
		}
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}

	count(result) == 0
}

#########################################################################################################
# rule_i_100_360_011_02
#########################################################################################################


# METADATA
# title: Principal Investigator role details are not in study..
# description: Principal Investigator details are not in study.
test_rule_i_100_360_011_02_violation_01 if {
	result := rules.rule_i_100_360_011_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyContacts": {
			"comments": [
			{
              "name": "Study Person ORCID",
              "value": [
                "0000-0002-7899-7191", "0000-0002-7899-7192"
              ]
            },
            {
              "name": "Study Person Affiliation ROR ID",
              "value": [
                "https://ror.org/01g8f8d13", "https://ror.org/01g8f8d12"
              ]
            }			
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
		}]}}]},
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
              "value": [
                "0000-0002-7899-7191", "0000-0002-7899-7192"
              ]
            },
            {
              "name": "Study Person Affiliation ROR ID",
              "value": [
                "https://ror.org/01g8f8d13", "https://ror.org/01g8f8d12"
              ]
            }			
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
		}]}}]},
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
              "value": [
                "0000-0002-7899-7191", "0000-0002-7899-7192"
              ]
            },
            {
              "name": "Study Person Affiliation ROR ID",
              "value": [
                "https://ror.org/01g8f8d13", "https://ror.org/01g8f8d12"
              ]
            }			
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
		}]}}]},
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
              "value": [
                "0000-0002-7899-7191", "0000-0002-7899-7192"
              ]
            },
            {
              "name": "Study Person Affiliation ROR ID",
              "value": [
                "https://ror.org/01g8f8d13", "https://ror.org/01g8f8d12"
              ]
            }			
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
		}]}}]},
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
              "value": [
                "0000-0002-7899-7191", "0000-0002-7899-7192"
              ]
            },
            {
              "name": "Study Person Affiliation ROR ID",
              "value": [
                "https://ror.org/01g8f8d13", "https://ror.org/01g8f8d13"
              ]
            }			
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
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}
# METADATA
# title: Principal Investigator role is not in study.
# description: There is one Principal Investigator role in study.
test_rule_i_100_360_011_02_success_01 if {
	result := rules.rule_i_100_360_011_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyContacts": {"comments": [
			{
              "name": "Study Person ORCID",
              "value": [
                "0000-0002-7899-7191", "0000-0002-7899-7192"
              ]
            },
            {
              "name": "Study Person Affiliation ROR ID",
              "value": [
                "https://ror.org/01g8f8d13", "https://ror.org/01g8f8d12"
              ]
            }
		], "people": [
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
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}



# METADATA
# title: Principal Investigator role is not in study.
# description: There is two Principal Investigator roles in study.
test_rule_i_100_360_011_02_success_01 if {
	result := rules.rule_i_100_360_011_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyContacts": {"comments": [
			{
              "name": "Study Person ORCID",
              "value": [
                "0000-0002-7899-7191", "0000-0002-7899-7192"
              ]
            },
            {
              "name": "Study Person Affiliation ROR ID",
              "value": [
                "https://ror.org/01g8f8d13", "https://ror.org/01g8f8d12"
              ]
            }
		], "people": [
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
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}
