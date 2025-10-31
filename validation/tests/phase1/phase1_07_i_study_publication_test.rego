package metabolights.validation.v2.phase1.tests

import rego.v1
import data.metabolights.validation.v2.phase1.violations as rules

#########################################################################################################
# rule_i_100_320_001_01
#########################################################################################################

# METADATA
# title: There is a study publication
# description: There is one study publication in i_Investigation.txt.
test_rule_i_100_320_001_01_no_violation_01 if {
	result := rules.rule_i_100_320_001_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyPublications": {"publications": [{
			"pubMedId": "",
			"doi": "",
			"authorList": "Ehsan Irajizad, Ana Kenney",
			"title": "Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
			"status": {
				"term": "Preprint",
				"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
				"termSourceRef": "MTBLS",
			},
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: There are two study publications
# description: There are two study publications in i_Investigation.txt.
test_rule_i_100_320_001_01_no_violation_02 if {
	result := rules.rule_i_100_320_001_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyPublications": {"publications": [
			{
				"pubMedId": "",
				"doi": "",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
				"status": {
					"term": "Preprint",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
			{
				"pubMedId": "",
				"doi": "",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
				"status": {
					"term": "Preprint",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: There is no study publication.
# description: There is no study publication in i_Investigation.txt.
test_rule_i_100_320_001_01_violation_01 if {
	result := rules.rule_i_100_320_001_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyPublications": {"publications": []}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

#########################################################################################################
# rule_i_100_320_003_01
#########################################################################################################

# METADATA
# title: Study publication is Published and valid DOI
# description: Study publication status is publieshed and DOI is valid.
test_rule_i_100_320_003_01_no_violation_01 if {
	result := rules.rule_i_100_320_003_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyPublications": {"publications": [
			{
				"pubMedId": "",
				"doi": "10.1234/sam/stest:data",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
				"status": {
					"term": "Published",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
			{
				"pubMedId": "",
				"doi": "10.1093/nar/gkad1045",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
				"status": {
					"term": "Published",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study publication is Published and has invalid DOI
# description: Study publication status is publieshed and DOI is invalid.
test_rule_i_100_320_003_01_violation_01 if {
	result := rules.rule_i_100_320_003_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyPublications": {"publications": [
			{
				"pubMedId": "",
				"doi": "",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
				"status": {
					"term": "Published",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
			{
				"pubMedId": "1234",
				"doi": "",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
				"status": {
					"term": "Published",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
			{
				"pubMedId": "",
				"doi": "",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
				"status": {
					"term": "Published",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
			{
				"pubMedId": "",
				"doi": "20.1093/nar/gkad1045",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
				"status": {
					"term": "Published",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 3
}

#########################################################################################################
# rule_i_100_320_003_02
#########################################################################################################

# METADATA
# title: Study publication is not Published and valid DOI
# description: Study publication status is not publieshed and DOI is valid.
test_rule_i_100_320_003_02_no_violation_01 if {
	result := rules.rule_i_100_320_003_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyPublications": {"publications": [
			{
				"pubMedId": "",
				"doi": "10.1234/sam.-;/stest:data",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
				"status": {
					"term": "Preprint",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
			{
				"pubMedId": "",
				"doi": "10.1093/nar/gkad1045",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
				"status": {
					"term": "Preprint",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study publication is not Published and has invalid DOI
# description: Study publication status is publieshed and DOI is not invalid.
test_rule_i_100_320_003_02_violation_01 if {
	result := rules.rule_i_100_320_003_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyPublications": {"publications": [
			{
				"pubMedId": "",
				"doi": "10.109/nar/gkad1045",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
				"status": {
					"term": "Published",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
			{
				"pubMedId": "",
				"doi": "https://doi.org/10.1093/nar/gkad1045",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
				"status": {
					"term": "In Review",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
			{
				"pubMedId": "",
				"doi": "10.x1093nargkad1045",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
				"status": {
					"term": "In Review",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
			{
				"pubMedId": "",
				"doi": "20.1093/nar/gkad1045",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
				"status": {
					"term": "In Review",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 3
}

#########################################################################################################
# rule_i_100_320_004_02
#########################################################################################################

# METADATA
# title: Study publication is not Published and valid PubMedId
# description: Study publication status is not publieshed and PubMedId is valid.
test_rule_i_100_320_004_02_no_violation_01 if {
	result := rules.rule_i_100_320_004_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyPublications": {"publications": [
			{
				"pubMedId": "1234563",
				"doi": "10.1234/sam.-;/stest:data",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
				"status": {
					"term": "Preprint",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
			{
				"pubMedId": "37971328",
				"doi": "10.1093/nar/gkad1045",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
				"status": {
					"term": "Preprint",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Non Published publications have invalid PubMedId
# description: Study publication status is publieshed and PubMedId is not invalid.
test_rule_i_100_320_004_02_violation_01 if {
	result := rules.rule_i_100_320_004_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyPublications": {"publications": [
			{
				"pubMedId": "",
				"doi": "10.109/nar/gkad1045",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
				"status": {
					"term": "Published",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
			{
				"pubMedId": "asdd",
				"doi": "https://doi.org/10.1093/nar/gkad1045",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
				"status": {
					"term": "In Review",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
			{
				"pubMedId": "1233222222212222212332222222122222",
				"doi": "10.x1093/nar/gkad1045",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
				"status": {
					"term": "In Review",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
			{
				"pubMedId": "x379713281",
				"doi": "20.1093/nar/gkad1045",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
				"status": {
					"term": "In Review",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 3
}

#########################################################################################################
# rule_i_100_320_005_01
#########################################################################################################

# METADATA
# title: Valid study publication title.
# description: Study publication is greater than 25.
test_rule_i_100_320_005_01_no_violation_01 if {
	result := rules.rule_i_100_320_005_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyPublications": {"publications": [
			{
				"pubMedId": "1234563",
				"doi": "10.1234/sam.-;/stest:data",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
				"status": {
					"term": "Preprint",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
			{
				"pubMedId": "37971328",
				"doi": "10.1093/nar/gkad1045",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Sample test data has valid publication title.",
				"status": {
					"term": "Preprint",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Two study publications' title is not valid
# description: Two study publications' title is less than 25.
test_rule_i_100_320_005_01_violation_01 if {
	result := rules.rule_i_100_320_005_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyPublications": {"publications": [
			{
				"pubMedId": "1234563",
				"doi": "10.1234/sam.-;/stest:data",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Contribution of the microb",
				"status": {
					"term": "Preprint",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
			{
				"pubMedId": "37971328",
				"doi": "10.1093/nar/gkad1045",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "publication title.",
				"status": {
					"term": "Preprint",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
			{
				"pubMedId": "37971328",
				"doi": "10.1093/nar/gkad1045",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "",
				"status": {
					"term": "Preprint",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 2
}

#########################################################################################################
# rule_i_100_320_006_01
#########################################################################################################

# METADATA
# title: Valid study publication title.
# description: Study publication is greater than 25.
test_rule_i_100_320_006_01_no_violation_01 if {
	result := rules.rule_i_100_320_006_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyPublications": {"publications": [
			{
				"pubMedId": "1234563",
				"doi": "10.1234/sam.-;/stest:data",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
				"status": {
					"term": "Preprint",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
			{
				"pubMedId": "37971328",
				"doi": "10.1093/nar/gkad1045",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Sample test data has valid publication title.",
				"status": {
					"term": "Preprint",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study publication's author list is empty
# description: Study publication's author list is empty.
test_rule_i_100_320_006_01_violation_01 if {
	result := rules.rule_i_100_320_006_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyPublications": {"publications": [
			{
				"pubMedId": "1234563",
				"doi": "10.1234/sam.-;/stest:data",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Contribution of the microb",
				"status": {
					"term": "Preprint",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
			{
				"pubMedId": "37971328",
				"doi": "10.1093/nar/gkad1045",
				"authorList": "",
				"title": "publication title.",
				"status": {
					"term": "Preprint",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
			{
				"pubMedId": "37971328",
				"doi": "10.1093/nar/gkad1045",
				"authorList": "x, Ehsan Irajizad, A.B, Ana Kenney",
				"title": "publication title.",
				"status": {
					"term": "Preprint",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 2
}

#########################################################################################################
# rule_i_100_320_007_01
#########################################################################################################

# METADATA
# title: Valid study publication status.
# description: Study publication status term greater than 0.
test_rule_i_100_320_007_01_no_violation_01 if {
	result := rules.rule_i_100_320_007_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyPublications": {"publications": [
			{
				"pubMedId": "1234563",
				"doi": "10.1234/sam.-;/stest:data",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
				"status": {
					"term": "Preprint",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
			{
				"pubMedId": "37971328",
				"doi": "10.1093/nar/gkad1045",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Sample test data has valid publication title.",
				"status": {
					"term": "In Review",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title:  Study publication's status is empty
# description: Study publication's status is empty.
test_rule_i_100_320_007_01_violation_01 if {
	result := rules.rule_i_100_320_007_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyPublications": {"publications": [
			{
				"pubMedId": "1234563",
				"doi": "10.1234/sam.-;/stest:data",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Contribution of the microb",
				"status": {
					"term": "",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
			{
				"pubMedId": "37971328",
				"doi": "10.1093/nar/gkad1045",
				"authorList": "",
				"title": "publication title.",
				"status": {
					"term": "Preprint",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}


#########################################################################################################
# rule_i_100_320_009_01
#########################################################################################################

# METADATA
# title: Study publication status term source ref is not empty.
# description: Study publication status term source ref is not empty.
test_rule_i_100_320_009_01_no_violation_01 if {
	result := rules.rule_i_100_320_009_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyPublications": {"publications": [
			{
				"pubMedId": "1234563",
				"doi": "10.1234/sam.-;/stest:data",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
				"status": {
					"term": "published",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "E",
				},
			},
			{
				"pubMedId": "37971328",
				"doi": "10.1093/nar/gkad1045",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Sample test data has valid publication title.",
				"status": {
					"term": "submitted",
					"termAccessionNumber": "x",
					"termSourceRef": "MTBLS",
				},
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title:  One publication status term source ref is empty.
# description: One publication status term source ref is empty.
test_rule_i_100_320_009_01_violation_01 if {
	result := rules.rule_i_100_320_009_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyPublications": {"publications": [
			{
				"pubMedId": "1234563",
				"doi": "10.1234/sam.-;/stest:data",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Contribution of the microb",
				"status": {
					"term": "",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			},
			{
				"pubMedId": "37971328",
				"doi": "10.1093/nar/gkad1045",
				"authorList": "",
				"title": "publication title.",
				"status": {
					"term": "Preprint",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

#########################################################################################################
# rule_i_100_320_009_02
#########################################################################################################

# METADATA
# title: Study publication status term source ref is in the Ontology Source Reference section.
# description: Study publication status term source ref is in the Ontology Source Reference section.
test_rule_i_100_320_009_02_no_violation_01 if {
	result := rules.rule_i_100_320_009_02 with input as {
		"investigation": {
			"studies": [{"identifier": "MTBLS1", "studyPublications": {"publications": [
				{
					"pubMedId": "1234563",
					"doi": "10.1234/sam.-;/stest:data",
					"authorList": "Ehsan Irajizad, Ana Kenney",
					"title": "Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
					"status": {
						"term": "published",
						"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
						"termSourceRef": "EFO",
					},
				},
				{
					"pubMedId": "37971328",
					"doi": "10.1093/nar/gkad1045",
					"authorList": "Ehsan Irajizad, Ana Kenney",
					"title": "Sample test data has valid publication title.",
					"status": {
						"term": "submitted",
						"termAccessionNumber": "x",
						"termSourceRef": "MTBLS",
					},
				},
			]}}],
			"ontologySourceReferences": {"references": [
				{
					"sourceName": "EFO",
					"sourceFile": "https://www.ebi.ac.uk/metabolights/",
					"sourceVersion": "1",
					"sourceDescription": "NCBI",
				},
				{
					"sourceName": "MTBLS",
					"sourceFile": "https://www.ebi.ac.uk/metabolights/",
					"sourceVersion": "1",
					"sourceDescription": "MTBLS",
				},
			]},
		},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title:  One publication status term source ref is not in the Ontology Source Reference section.
# description: One publication status term source ref is not in the Ontology Source Reference section.
test_rule_i_100_320_009_02_violation_01 if {
	result := rules.rule_i_100_320_009_02 with input as {
		"investigation": {
			"studies": [{"identifier": "MTBLS1", "studyPublications": {"publications": [
				{
					"pubMedId": "1234563",
					"doi": "10.1234/sam.-;/stest:data",
					"authorList": "Ehsan Irajizad, Ana Kenney",
					"title": "Contribution of the microb",
					"status": {
						"term": "",
						"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
						"termSourceRef": "MTBLS",
					},
				},
				{
					"pubMedId": "37971328",
					"doi": "10.1093/nar/gkad1045",
					"authorList": "",
					"title": "publication title.",
					"status": {
						"term": "Preprint",
						"termAccessionNumber": "",
						"termSourceRef": "EFOX",
					},
				},
			]}}],
			"ontologySourceReferences": {"references": [
				{
					"sourceName": "EFO",
					"sourceFile": "https://www.ebi.ac.uk/metabolights/",
					"sourceVersion": "1",
					"sourceDescription": "NCBI",
				},
				{
					"sourceName": "MTBLS",
					"sourceFile": "https://www.ebi.ac.uk/metabolights/",
					"sourceVersion": "1",
					"sourceDescription": "MTBLS",
				},
			]},
		},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}
