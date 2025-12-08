#########################################################################################################
# Unit tests for rule_i_100_350_003_01
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study Protocol Description length less than 40 characters.
# description: Study Protocol Description should be defined with length equal or greater than 40 characters.
# custom:
#  rule_id: rule_i_100_350_003_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyProtocols
rule_i_100_350_003_01_test_cases := 1

# METADATA
# title: study protocol description is valid.
# description: study protocol description is valid.
test_rule_i_100_350_003_01_no_violation_01 if {
	result := rules.rule_i_100_350_003_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [
			{
				"name": "",
				"protocolType": {
					"term": "Sample collection",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "Description of study protocol Description Description.",
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
				"description": "Description of study protocol. Description of study protocol Description Description.",
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
test_rule_i_100_350_003_01_violation_01 if {
	result := rules.rule_i_100_350_003_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [
			{
				"name": "Sa",
				"protocolType": {
					"term": "Sample collection",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"description": "Description of study protocol",
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
				"description": "update this protocol description -- 40.",
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
