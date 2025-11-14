#########################################################################################################
# Unit tests for rule_i_100_350_003_02
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Non-printable characters in Study Protocol Description.
# description: Study Protocol Description should contain only printable characters.
# custom:
#  rule_id: rule_i_100_350_003_02
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyProtocols
rule_i_100_350_003_02_test_cases := 1

# METADATA
# title: study protocol description is valid.
# description: study protocol description is valid.
test_rule_i_100_350_003_02_no_violation_01 if {
	result := rules.rule_i_100_350_003_02 with input as {
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
				"description": "Description of study protocol. Description of study protocol.",
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
# title: study protocol description is not valid.
# description: study protocol description is not valid.
test_rule_i_100_350_003_02_violation_01 if {
	result := rules.rule_i_100_350_003_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [
			{
				"name": "Sa",
				"protocolType": {
					"term": "Sample collection",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "Description ⋿of study protocol\u000e",
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
				"description": "\t",
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
				"description": "\t\n\b",
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
