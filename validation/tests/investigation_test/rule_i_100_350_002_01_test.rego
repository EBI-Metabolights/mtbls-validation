#########################################################################################################
# Unit tests for rule_i_100_350_002_01
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study Protocol Name length less than 3 characters.
# description: Study Protocol Name should be defined with length equal or greater than 3 characters.
# custom:
#  rule_id: rule_i_100_350_002_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyProtocols
rule_i_100_350_002_01_test_cases := 1

# METADATA
# title: study protocol name is valid.
# description: study protocol name is valid.
test_rule_i_100_350_002_01_no_violation_01 if {
	result := rules.rule_i_100_350_002_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [
			{
				"name": "Sam",
				"protocolType": {
					"term": "Sample collection",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
			{
				"name": "Mass spectrometry",
				"protocolType": {
					"term": "Extraction",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
			{
				"name": "Mass",
				"protocolType": {
					"term": "Mass spectrometry",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: study protocol name is not valid.
# description: study protocol name is not valid.
test_rule_i_100_350_002_01_violation_01 if {
	result := rules.rule_i_100_350_002_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [
			{
				"name": "Sa",
				"protocolType": {
					"term": "Sample collection",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
			{
				"name": "M",
				"protocolType": {
					"term": "Extraction",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
			{
				"name": "",
				"protocolType": {
					"term": "Mass spectrometry",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "",
				"uri": "",
				"version": "",
				"parameters": [],
				"components": [],
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 3
}
