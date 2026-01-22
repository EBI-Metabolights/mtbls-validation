#########################################################################################################
# Unit tests for rule_m_300_090_001_01
#########################################################################################################
package tests.assignment_test

import data.metabolights.validation.v2.rules.phase3.violations as rules

import rego.v1

# METADATA
# title: Values with trailing or leading spaces in metabolite assignment file.
# description: Values in metabolite assignment file should not start or end with space characters.
# custom:
#  rule_id: rule_m_300_090_001_01
#  type: ERROR
#  priority: HIGH
#  section: metabolites.general
rule_m_300_090_001_01_test_cases := 1

# METADATA
# title: Values without trailing or leading spaces found in the assay file.
# description: Values without trailing or leading spaces found in the assay file.
test_rule_m_300_090_001_01_no_violation_01 if {
	result := rules.rule_m_300_090_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "ADDITIONAL_COLUMN", "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "Protocol", "columnStructure": "", "columnHeader": "Protocol REF", "columnIndex": 2},
				{"columnCategory": "Comment", "columnStructure": "", "columnHeader": "Comment[Sample]", "columnIndex": 4},
				{"columnCategory": "Parameter Value", "columnStructure": "", "columnHeader": "Parameter Value[Age]", "columnIndex": 5},
				{"columnCategory": "Parameter Value", "columnStructure": "", "columnHeader": "smile", "columnIndex": 8},
				{"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Source Name", "columnIndex": 11},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 14},
			],
			"columns": [
				"Sample Name",
				"Term Source REF",
			],
			"data": {
				"Sample Name": ["1", "2", "3", "4"],
				"Term Source REF": ["Metabolite Identification", "Metabolite Identification", "Metabolite Identification", "Metabolite Identification"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}

	count(result) == 0
}

# METADATA
# title: Values with trailing or leading spaces found in the assay file.
# description: Values with trailing or leading spaces found in the assay file.
test_rule_m_300_090_001_01_violation_01 if {
	result := rules.rule_m_300_090_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "ADDITIONAL_COLUMN", "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "Protocol", "columnStructure": "", "columnHeader": "Protocol REF", "columnIndex": 2},
				{"columnCategory": "Comment", "columnStructure": "", "columnHeader": "Comment[Sample]", "columnIndex": 4},
				{"columnCategory": "Parameter Value", "columnStructure": "", "columnHeader": "Parameter Value[Age]", "columnIndex": 5},
				{"columnCategory": "Parameter Value", "columnStructure": "", "columnHeader": "smile", "columnIndex": 8},
				{"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Source Name", "columnIndex": 11},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name2", "columnIndex": 14},
			],
			"columns": [
				"Sample Name",
				"Term Source REF",
			],
			"data": {
				"Sample Name": ["1", "2 ", "3", " "],
				"Term Source REF": ["Metabolite Identification ", "Metabolite Identification", "Metabolite Identification", "Metabolite Identification"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum", "templateVersion": "2.0"},
	}
	count(result) == 2
}
