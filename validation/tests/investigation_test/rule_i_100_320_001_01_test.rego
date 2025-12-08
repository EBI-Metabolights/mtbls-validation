#########################################################################################################
# Unit tests for rule_i_100_320_001_01
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: No study publications referenced in investigation file.
# description: At least one study publications must be defined in i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_320_001_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyPublications
rule_i_100_320_001_01_test_cases := 1

# METADATA
# title: There is a study publication
# description: There is one study publication in i_Investigation.txt.
test_rule_i_100_320_001_01_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyPublications/publications",
			"value": [{
				"pubMedId": "",
				"doi": "",
				"authorList": "Ehsan Irajizad, Ana Kenney",
				"title": "Contribution of the microbiome to a metabolomic signature predictive of risk for pancreatic cancer",
				"status": {
					"term": "Preprint",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000004",
					"termSourceRef": "MTBLS",
				},
			}],
		}],
	)

	result := rules.rule_i_100_320_001_01 with input as input_data
	count(result) == 0
}

# METADATA
# title: There are two study publications
# description: There are two study publications in i_Investigation.txt.
test_rule_i_100_320_001_01_no_violation_02 if {
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
					"doi": "",
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

	result := rules.rule_i_100_320_001_01 with input as input_data
	count(result) == 0
}

# METADATA
# title: There is no study publication.
# description: There is no study publication in i_Investigation.txt.
test_rule_i_100_320_001_01_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyPublications/publications",
			"value": [],
		}],
	)
	result := rules.rule_i_100_320_001_01 with input as input_data
	count(result) == 1
}
