#########################################################################################################
# Unit tests for rule_s_100_100_001_08
#########################################################################################################
package tests.sample_test

import data.metabolights.validation.v2.rules.phase1.violations as rules
import rego.v1

# METADATA
# title: Order of default column header is not correct in sample file.
# description: Order of default column header is not correct in sample file.
# custom:
#  rule_id: rule_s_100_100_001_08
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
rule_s_100_100_001_08_test_cases := 1

# METADATA
# title: Order of default column header is correct in the sample file.
# description: Order of default column header is correct in the sample file.
test_rule_s_100_100_001_08_no_violation_01 if {
	result := rules.rule_s_100_100_001_08 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Source Name", "columnIndex": 0},
				{"columnCategory": "Comment", "columnStructure": "", "columnHeader": "Comment[Sample]", "columnIndex": 1},
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]", "columnIndex": 2},
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism part]", "columnIndex": 5},
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Variant]", "columnIndex": 8},
				{"columnCategory": "Comment", "columnStructure": "", "columnHeader": "Comment[Organism]", "columnIndex": 11},
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Sample type]", "columnIndex": 12},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 15},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 16},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_SAMPLE_FILE_HEADERS as [{
			"version": "2.0",
			"headers": [
				{"columnHeader": "Source Name", "required": true},
				{"columnHeader": "Characteristics[Organism]", "required": true},
				{"columnHeader": "Characteristics[Organism part]", "required": true},
				{"columnHeader": "Characteristics[Variant]", "required": true},
				{"columnHeader": "Characteristics[Sample type]", "required": true},
				{"columnHeader": "Protocol REF", "required": true},
				{"columnHeader": "Sample Name", "required": true},
			],
		}]
	count(result) == 0
}

# METADATA
# title: Order of default column header is not correct in the sample file.
# description: Order of default column header is not correct in the sample file.
test_rule_s_100_100_001_08_violation_01 if {
	result := rules.rule_s_100_100_001_08 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Source Name", "columnIndex": 3},
				{"columnCategory": "Comment", "columnStructure": "", "columnHeader": "Comment[Sample]", "columnIndex": 4},
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Variant]", "columnIndex": 5},
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism part]", "columnIndex": 8},
				{"columnCategory": "Comment", "columnStructure": "", "columnHeader": "Comment[Organism]", "columnIndex": 11},
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Sample type]", "columnIndex": 12},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 15},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 16},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_SAMPLE_HEADER_NAMES as [
			"Characteristics[Organism part]",
			"Characteristics[Organism]",
			"Characteristics[Sample type]",
			"Characteristics[Variant]",
			"Protocol REF",
			"Sample Name",
			"Source Name",
		]
		with data.metabolights.validation.v2.rules.phase1.definitions.SELECTED_STUDY_SAMPLE_FILE_TEMPLATE_HEADERS as [
			{"columnHeader": "Source Name", "required": true},
			{"columnHeader": "Characteristics[Organism]", "required": true},
			{"columnHeader": "Characteristics[Organism part]", "required": true},
			{"columnHeader": "Characteristics[Variant]", "required": true},
			{"columnHeader": "Characteristics[Sample type]", "required": true},
			{"columnHeader": "Protocol REF", "required": true},
			{"columnHeader": "Sample Name", "required": true},
		]
	count(result) == 1
}
