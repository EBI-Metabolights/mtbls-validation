#########################################################################################################
# Unit tests for rule_i_100_350_002_02
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study Protocol Name must be unique.
# description: Study Protocol Name must be unique for each study in i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_350_002_02
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyProtocols
rule_i_100_350_002_02_test_cases := 1

# METADATA
# title: study protocol names are unique.
# description: study protocol names are unique.
test_rule_i_100_350_002_02_no_violation_01 if {
	result := rules.rule_i_100_350_002_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [
			{
				"name": "Sample collection",
				"protocolType": {"term": "Sample collection"},
				"description": "",
				"parameters": [],
				"components": [],
			},
			{
				"name": "Extraction",
				"protocolType": {"term": "Extraction"},
				"description": "",
				"parameters": [],
				"components": [],
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: study protocol names are not unique.
# description: study protocol names are not unique.
test_rule_i_100_350_002_02_violation_01 if {
	result := rules.rule_i_100_350_002_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [
			{
				"name": "Extraction",
				"protocolType": {"term": "Sample collection"},
				"description": "",
				"parameters": [],
				"components": [],
			},
			{
				"name": "Extraction",
				"protocolType": {"term": "Extraction"},
				"description": "",
				"parameters": [],
				"components": [],
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}
