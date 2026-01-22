#########################################################################################################
# Unit tests for rule_i_100_350_001_02
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: A study protocol is missing in investigation file.
# description: All study protocols should be defined considering assay technologies used in study.
# custom:
#  rule_id: rule_i_100_350_001_02
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.studyProtocols
rule_i_100_350_001_02_test_cases := 1

# METADATA
# title: study protocol file name is not empty
# description: study protocol file name is not empty.
test_rule_i_100_350_001_02_no_violation_01 if {
	result := rules.rule_i_100_350_001_02 with input as {
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
		"assays": {"a_MTBLS1_metabolite_profiling.txt": {"assayTechnique": {
			"name": "LC-MS",
			"mainTechnique": "MS",
			"technique": "LC-MS",
			"subTechnique": "LC",
		}}},
	}
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_MERGED_STUDY_PROTOCOLS as [
			"Extraction",
			"Sample collection",
		]
		with data.metabolights.validation.v2.rules.phase1.definitions._PROTOCOL_TECHNOLOGY_MAP as {
			"Extraction": ["LC-MS"],
			"Sample collection": ["LC-MS"],
		}
	count(result) == 0
}

# METADATA
# title: study protocol is missing.
# description:  study protocol is missing.
test_rule_i_100_350_001_02_violation_01 if {
	result := rules.rule_i_100_350_001_02 with input as {
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
		"assays": {"a_MTBLS1_metabolite_profiling.txt": {"assayTechnique": {
			"name": "LC-MS",
			"mainTechnique": "MS",
			"technique": "LC-MS",
			"subTechnique": "LC",
		}}},
	}
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_MERGED_STUDY_PROTOCOLS as [
			"Extraction",
			"Sample collection",
			"Mass spectrometry",
			"Metabolite identification",
		]
		with data.metabolights.validation.v2.rules.phase1.definitions._PROTOCOL_TECHNOLOGY_MAP as {
			"Extraction": ["LC-MS"],
			"Sample collection": ["LC-MS"],
			"Mass spectrometry": ["LC-MS"],
			"Metabolite identification": ["LC-MS"],
		}
	count(result) == 2
}

# METADATA
# title: study protocol is missing.
# description:  study protocol is missing.
test_rule_i_100_350_001_02_violation_02 if {
	result := rules.rule_i_100_350_001_02 with input as {
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
		"assays": {
			"a_MTBLS1_metabolite_profiling.txt": {"assayTechnique": {
				"name": "LC-MS",
				"mainTechnique": "MS",
				"technique": "LC-MS",
				"subTechnique": "LC",
			}},
			"a_MTBLS1_2_metabolite_profiling.txt": {"assayTechnique": {
				"name": "GC-MS",
				"mainTechnique": "MS",
				"technique": "GC-MS",
				"subTechnique": "GC",
			}},
		},
	}
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_MERGED_STUDY_PROTOCOLS as [
			"Extraction",
			"Sample collection",
			"Mass spectrometry",
			"Metabolite identification1",
			"Metabolite identification2",
		]
		with data.metabolights.validation.v2.rules.phase1.definitions._PROTOCOL_TECHNOLOGY_MAP as {
			"Extraction": ["LC-MS", "GC-MS"],
			"Sample collection": ["LC-MS", "GC-MS"],
			"Mass spectrometry": ["LC-MS", "GC-MS"],
			"Metabolite identification1": ["GC-MS"],
			"Metabolite identification2": ["GC-MS"],
		}
	count(result) == 3
}
