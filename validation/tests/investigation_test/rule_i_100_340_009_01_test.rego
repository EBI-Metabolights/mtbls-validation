#########################################################################################################
# Unit tests for rule_i_100_340_009_01
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study Assay Technology Platform is empty.
# description: Study Assay Technology Platform should be defined.
# custom:
#  rule_id: rule_i_100_340_009_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyAssays
rule_i_100_340_009_01_test_cases := 1

# METADATA
# title: Assay technology platform is valid.
# description: Assay technology platform is valid.
test_rule_i_100_340_009_01_no_violation_01 if {
	result := rules.rule_i_100_340_009_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [{
			"fileName": "",
			"measurementType": {
				"term": "",
				"termAccessionNumber": "",
				"termSourceRef": "",
			},
			"technologyType": {
				"term": "",
				"termAccessionNumber": "",
				"termSourceRef": "",
			},
			"technologyPlatform": "Not empty",
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Assay technology platforms are valid.
# description: Assay technology platforms are valid.
test_rule_i_100_340_009_01_no_violation_02 if {
	result := rules.rule_i_100_340_009_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [
			{
				"fileName": "a_TEST.txt",
				"technologyPlatform": "Not Empty",
			},
			{
				"fileName": "a_TEST2.txt",
				"technologyPlatform": "X",
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Assay platform is invalid
# description: Assay platform is invalid
test_rule_i_100_340_009_01_violation_01 if {
	result := rules.rule_i_100_340_009_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [
			{
				"fileName": "a_TEST.txt",
				"technologyPlatform": "",
			},
			{
				"fileName": "a_TEST2.txt",
				"technologyPlatform": "X",
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}
