#########################################################################################################
# Unit tests for rule_i_100_320_003_02
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: DOI format invalid for study publication.
# description: If DOI is defined, its format should be a valid.
# custom:
#  rule_id: rule_i_100_320_003_02
#  type: ERROR
#  priority: MEDIUM
#  section: investigation.studyPublications
rule_i_100_320_003_02_test_cases := 1

# METADATA
# title: There are two study publications.
# description: One is empty, the other has valid DOI.
test_rule_i_100_320_003_02_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyPublications/publications",
			"value": [
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
					"doi": "10.1093/nar/gkad1045",
					"authorList": "Ehsan Irajizad, Ana Kenney",
					"title": "Publication 2 - Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
					"status": {
						"term": "Preprint",
						"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
						"termSourceRef": "MTBLS",
					},
				},
			],
		}],
	)

	result := rules.rule_i_100_320_003_02 with input as input_data
	count(result) == 0
}

# METADATA
# title: There are two study publications with DOI
# description: DOI is valid for both publications.
test_rule_i_100_320_003_02_no_violation_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyPublications/publications",
			"value": [
				{
					"pubMedId": "",
					"doi": "10.1093/nar/gkad1045",
					"authorList": "Ehsan Irajizad, Ana Kenney",
					"title": "Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
					"status": {
						"term": "published",
						"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0001796",
						"termSourceRef": "EFO",
					},
				},
				{
					"pubMedId": "",
					"doi": "10.1093/nar/222112",
					"authorList": "Ehsan Irajizad, Ana Kenney",
					"title": "Publication 2 - Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
					"status": {
						"term": "published",
						"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0001796",
						"termSourceRef": "EFO",
					},
				},
			],
		}],
	)

	result := rules.rule_i_100_320_003_02 with input as input_data
	count(result) == 0
}

# METADATA
# title: There are two study publications with invalid DOI
# description: Invalid 2 DOI formats for both publications.
test_rule_i_100_320_003_02_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyPublications/publications",
			"value": [
				{
					"pubMedId": "",
					"doi": "invalid/nar/gkad104a",
					"authorList": "Ehsan Irajizad, Ana Kenney",
					"title": "Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
					"status": {
						"term": "published",
						"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0001796",
						"termSourceRef": "EFO",
					},
				},
				{
					"pubMedId": "",
					"doi": "doi/invalid.1234",
					"authorList": "Ehsan Irajizad, Ana Kenney",
					"title": "Publication 2 - Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
					"status": {
						"term": "published",
						"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0001796",
						"termSourceRef": "EFO",
					},
				},
			],
		}],
	)

	result := rules.rule_i_100_320_003_02 with input as input_data
	count(result) == 2
}
