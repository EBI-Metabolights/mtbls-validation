#########################################################################################################
# Unit tests for rule_s_100_100_001_04
#########################################################################################################
package tests.sample_test

import data.metabolights.validation.v2.rules.phase1.violations as rules
import rego.v1

# METADATA
# title: Unexpected column in sample file.
# description: Unexpected column in sample file. Only factor and characteristics columns can be defined in sample file.
# custom:
#  rule_id: rule_s_100_100_001_04
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
rule_s_100_100_001_04_test_cases := 1

# METADATA
# title: All columns are expected.
# description: All columns are expected.
test_rule_s_100_100_001_04_no_violation_01 if {
	result := rules.rule_s_100_100_001_04 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnCategory": "", "columnStructure": "ADDITIONAL_COLUMN", "columnHeader": "Sample Name", "columnIndex": 9},
				{"columnCategory": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Characteristics[Organism]", "columnIndex": 3},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "Protocol", "columnStructure": "", "columnHeader": "Protocol REF", "columnIndex": 1},
				{"columnCategory": "Comment", "columnStructure": "", "columnHeader": "Comment[Sample]", "columnIndex": 10},
				{"columnCategory": "Factor Value", "columnStructure": "", "columnHeader": "Factor Value[Age]", "columnIndex": 11},
				{"columnCategory": "Characteristics", "columnStructure": "", "columnHeader": "Characteristics[Organism part]", "columnIndex": 12},
				{"columnCategory": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Source Name", "columnIndex": 13},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 13},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_SAMPLE_FILE_HEADERS as {
			{"columnHeader": "Sample Name", "required": true},
			{"columnHeader": "Characteristics[Organism]", "required": true},
			{"columnHeader": "Characteristics[Organism part]", "required": true},
			{"columnHeader": "Source Name", "required": true},
			{"columnHeader": "Factor[Age]", "required": false},
		}
	count(result) == 0
}

# METADATA
# title: Unexpected column in the sample file.
# description: Unexpected column in the sample file.
test_rule_s_100_100_001_04_violation_01 if {
	result := rules.rule_s_100_100_001_04 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnCategory": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Source NameX", "columnIndex": 13},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample NameX", "columnIndex": 13},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_SAMPLE_FILE_HEADERS as {
			{"columnHeader": "Sample Name", "required": true},
			{"columnHeader": "Characteristics[Organism]", "required": true},
			{"columnHeader": "Characteristics[Organism part]", "required": true},
			{"columnHeader": "Source Name", "required": true},
			{"columnHeader": "Factor[Age]", "required": false},
		}
	count(result) == 1
}
