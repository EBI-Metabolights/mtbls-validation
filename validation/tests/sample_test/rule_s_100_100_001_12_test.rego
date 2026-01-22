#########################################################################################################
# Unit tests for rule_s_100_100_001_12
#########################################################################################################
package tests.sample_test

import data.metabolights.validation.v2.rules.phase1.violations as rules
import rego.v1

# METADATA
# title: Factor Value column structure is not correct in sample file.
# description: Factor Value column structure should be ontology (with Term Source REF and Term Accession Number) or a value with unit (and Term Source REF and Term Accession Number) in sample file.
# custom:
#  rule_id: rule_s_100_100_001_12
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
rule_s_100_100_001_12_test_cases := 1

# METADATA
# title: Valid Factor Value columns in sample file.
# description: Valid Factor Value columns in sample file.
test_rule_s_100_100_001_12_no_violation_01 if {
	result := rules.rule_s_100_100_001_12 with input as {
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
# title: Invalid Factor Value columns in sample file.
# description: Invalid Factor Value columns in sample file.
test_rule_s_100_100_001_12_violation_01 if {
	result := rules.rule_s_100_100_001_12 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Source Name", "columnIndex": 0},
				{"columnCategory": "Comment", "columnStructure": "", "columnHeader": "Comment[Sample]", "columnIndex": 1},
				{"columnCategory": "Characteristics", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Characteristics[Organism]", "columnIndex": 2},
				{"columnCategory": "Factor Value", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Factor Value[Age]", "columnIndex": 8},
				{"columnCategory": "Comment", "columnStructure": "", "columnHeader": "Comment[Organism]", "columnIndex": 11},
				{"columnCategory": "Factor Value", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Factor Value[Age]", "columnIndex": 12},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 15},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 16},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyFactors": {"factors": [{"name": "Age"}, {"name": "Year"}]}}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}
