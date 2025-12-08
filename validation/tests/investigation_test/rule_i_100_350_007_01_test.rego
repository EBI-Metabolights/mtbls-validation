#########################################################################################################
# Unit tests for rule_i_100_350_007_01
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study protocol parameter is missing for a study protocol.
# description: All default study protocol parameters should be defined for study protocol.
# custom:
#  rule_id: rule_i_100_350_007_01
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.studyProtocols
rule_i_100_350_007_01_test_cases := 1

# METADATA
# title: study protocol parameter is missing.
# description:  study protocol parameter is missing.
test_rule_i_100_350_007_01_no_violation_01 if {
	result := rules.rule_i_100_350_007_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [{
			"name": "Extraction",
			"protocolType": {
				"term": "Extraction",
				"termAccessionNumber": "",
				"termSourceRef": "",
			},
			"description": "",
			"uri": "",
			"version": "",
			"parameters": [
				{
					"term": "Derivatization",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				{
					"term": "Post Extraction",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
			],
			"components": [],
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_MERGED_STUDY_PROTOCOL_PARAMETERS as {"Extraction": [
			"Derivatization",
			"Post Extraction",
		]}
	count(result) == 0
}

# METADATA
# title: study protocol parameter is missing.
# description:  study protocol parameter is missing.
test_rule_i_100_350_007_01_violation_01 if {
	result := rules.rule_i_100_350_007_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [
			{
				"name": "Sample collection",
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
				"name": "Chromatography",
				"protocolType": {
					"term": "Chromatography",
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
				"name": "Extraction",
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
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_MERGED_STUDY_PROTOCOL_PARAMETERS as {
			"Sample collection": [
				"Instrument",
				"Ion source",
				"Mass analyzer",
				"Scan m/z range",
				"Scan polarity",
			],
			"Extraction": [
				"Derivatization",
				"Post Extraction",
			],
			"Chromatography": [
				"Autosampler model",
				"Chromatography Instrument",
				"Column model",
				"Column type",
				"Guard column",
			],
		}
	count(result) == 3
}
