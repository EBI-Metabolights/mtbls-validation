#########################################################################################################
# Unit tests for rule_s_100_100_001_10
#########################################################################################################
package tests.sample_test

import data.metabolights.validation.v2.rules.phase1.violations as rules
import rego.v1

# METADATA
# title: Order of factor column header is not correct in sample file.
# description: Order of factor column header is not correct in sample file. All factor columns should be defined after Sample Name column.
# custom:
#  rule_id: rule_s_100_100_001_10
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
rule_s_100_100_001_10_test_cases := 1

# METADATA
# title: Order of characteristics column header is  correct in the sample file
# description: Order of characteristics column header is correct in the sample file
test_rule_s_100_100_001_10_no_violation_01 if {
	result := rules.rule_s_100_100_001_10 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Source Name", "columnIndex": 0},
				{"columnCategory": "Comment", "columnStructure": "", "columnHeader": "Comment[Sample]", "columnIndex": 1},
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]", "columnIndex": 2},
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism part]", "columnIndex": 5},
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Variant]", "columnIndex": 8},
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Subvariant]", "columnIndex": 11},
				{"columnCategory": "Comment", "columnStructure": "", "columnHeader": "Comment[Organism]", "columnIndex": 14},
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Sample type]", "columnIndex": 15},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 18},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 19},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Factor Value[test]", "columnIndex": 20},
				{"columnCategory": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Factor Value[test2]", "columnIndex": 21},
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
# title: Order of characteristics column header is  correct in the sample file
# description: Order of characteristics column header is correct in the sample file
test_rule_s_100_100_001_10_violation_01 if {
	result := rules.rule_s_100_100_001_10 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Source Name", "columnIndex": 0},
				{"columnCategory": "Comment", "columnStructure": "", "columnHeader": "Comment[Sample]", "columnIndex": 1},
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]", "columnIndex": 2},
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism part]", "columnIndex": 5},
				{"columnCategory": "Factor Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Factor Value[Variant]", "columnIndex": 8},
				{"columnCategory": "Factor Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Factor Value[Subvariant]", "columnIndex": 11},
				{"columnCategory": "Comment", "columnStructure": "", "columnHeader": "Comment[Organism]", "columnIndex": 14},
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Sample type]", "columnIndex": 15},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 18},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 19},
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Data]", "columnIndex": 22},
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Value]", "columnIndex": 25},
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
	count(result) == 1
}
