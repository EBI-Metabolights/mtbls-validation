#########################################################################################################
# Unit tests for rule_s_100_100_001_16
#########################################################################################################
package tests.sample_test

import data.metabolights.validation.v2.rules.phase1.violations as rules
import rego.v1

# METADATA
# title: Unexpected Factor Value columns in sample file.
# description: There should be a study factor for each Factor Value column in sample file.
# custom:
#  rule_id: rule_s_100_100_001_16
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
rule_s_100_100_001_16_test_cases := 1

# METADATA
# title: expected Factor Value columns in sample file.
# description: expected Factor Value columns in sample file.
test_rule_s_100_100_001_16_no_violation_01 if {
	result := rules.rule_s_100_100_001_16 with input as {
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
				{"columnCategory": "Factor Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Factor Value[Age]", "columnIndex": 12},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 15},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 16},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyFactors": {"factors": [{"name": "Age"}]}}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: Unexpected Factor Value columns in sample file.
# description: Unexpected Factor Value columns in sample file.
test_rule_s_100_100_001_16_violation_01 if {
	result := rules.rule_s_100_100_001_16 with input as {
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
				{"columnCategory": "Factor Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Factor Value[Age]", "columnIndex": 12},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 15},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 16},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyFactors": {"factors": []}}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}
