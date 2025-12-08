#########################################################################################################
# Unit tests for rule_i_100_350_008_01
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study Protocol Parameters Name length less than 3 characters.
# description: Study protocol parameters name should be defined with length equal or greater than 3 characters.
# custom:
#  rule_id: rule_i_100_350_008_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyProtocols
rule_i_100_350_008_01_test_cases := 1

# METADATA
# title: study protocol type parameter term is valid.
# description: study protocol type parameter term is valid.
test_rule_i_100_350_008_01_no_violation_01 if {
	result := rules.rule_i_100_350_008_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [
			{
				"name": "",
				"protocolType": {
					"term": "Sample collection",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "Description of study protocol.",
				"uri": "",
				"version": "",
				"parameters": [{
					"term": "Post Extraction",
					"termAccessionNumber": "",
					"termSourceRef": "",
				}],
				"components": [],
			},
			{
				"name": "Mass spectrometry",
				"protocolType": {
					"term": "Extraction",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "Description of study protocol. Description of study protocol.",
				"uri": "",
				"version": "",
				"parameters": [
					{
						"term": "UO",
						"termAccessionNumber": "",
						"termSourceRef": "",
					},
					{
						"term": "Derivatization",
						"termAccessionNumber": "",
						"termSourceRef": "",
					},
				],
				"components": [],
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: study protocol type parameter term is not valid.
# description: study protocol type parameter term is not valid.
test_rule_i_100_350_008_01_violation_01 if {
	result := rules.rule_i_100_350_008_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [{
			"name": "Sa",
			"protocolType": {
				"term": "Sa",
				"termAccessionNumber": "",
				"termSourceRef": "",
			},
			"description": "Description of study protocol",
			"uri": "",
			"version": "",
			"parameters": [
				{
					"term": "UFO",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				{
					"term": "U",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				{
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
			],
			"components": [],
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 2
}
