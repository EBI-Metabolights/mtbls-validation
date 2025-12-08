#########################################################################################################
# Unit tests for rule_s_100_100_001_11
#########################################################################################################
package tests.sample_test

import data.metabolights.validation.v2.rules.phase1.violations as rules
import rego.v1

# METADATA
# title: Column header structure is not correct in sample file.
# description: Column header structure is not correct in sample file. Any ontology and unit column should have the leading columns, Term Source REF and Term Accession Number. Single columns must not have leading columns.
# custom:
#  rule_id: rule_s_100_100_001_11
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
rule_s_100_100_001_11_test_cases := 1

# METADATA
# title: Valid Factor Value columns in sample file.
# description: Valid Factor Value columns in sample file.
test_rule_s_100_100_001_11_no_violation_01 if {
	result := rules.rule_s_100_100_001_11 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Source Name", "columnIndex": 0},
				{"columnCategory": "Comment", "columnStructure": "", "columnHeader": "Comment[Sample]", "columnIndex": 1},
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]", "columnIndex": 2},
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism part]", "columnIndex": 5},
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Variant]", "columnIndex": 8},
				{"columnCategory": "Factor Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Factor Value[Age]", "columnIndex": 12},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 15},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 16},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyFactors": {"factors": [{"name": "Age"}]}}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_SAMPLE_FILE_HEADERS as {
			"Source Name": {"columnHeader": "Source Name", "required": true, "columnStructure": "SINGLE_COLUMN", "columnIndex": 0},
			"Characteristics[Organism]": {"columnHeader": "Characteristics[Organism]", "required": true, "columnStructure": "ONTOLOGY_COLUMN", "columnIndex": 0},
			"Characteristics[Organism part]": {"columnHeader": "Characteristics[Organism part]", "required": true, "columnStructure": "ONTOLOGY_COLUMN", "columnIndex": 0},
			"Characteristics[Variant]": {"columnHeader": "Characteristics[Variant]", "required": true, "columnStructure": "ONTOLOGY_COLUMN", "columnIndex": 0},
			"Characteristics[Sample type]": {"columnHeader": "Characteristics[Sample type]", "required": true, "columnStructure": "ONTOLOGY_COLUMN", "columnIndex": 0},
			"Protocol REF": {"columnHeader": "Protocol REF", "required": true, "columnStructure": "SINGLE_COLUMN", "columnIndex": 0},
			"Sample Name": {"columnHeader": "Sample Name", "required": true, "columnStructure": "SINGLE_COLUMN", "columnIndex": 0},
		}

	count(result) == 0
}

# METADATA
# title: Invalid Factor Value columns in sample file.
# description: Invalid Factor Value columns in sample file.
test_rule_s_100_100_001_11_violation_01 if {
	result := rules.rule_s_100_100_001_11 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnCategory": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Source Name", "columnIndex": 0},
				{"columnCategory": "Comment", "columnStructure": "", "columnHeader": "Comment[Sample]", "columnIndex": 1},
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]", "columnIndex": 2},
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism part]", "columnIndex": 5},
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Variant]", "columnIndex": 8},
				{"columnCategory": "Factor Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Factor Value[Age]", "columnIndex": 12},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 15},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 16},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyFactors": {"factors": [{"name": "Age"}]}}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_SAMPLE_FILE_HEADERS as {
			"Source Name": {"columnHeader": "Source Name", "required": true, "columnStructure": "SINGLE_COLUMN", "columnIndex": 0},
			"Characteristics[Organism]": {"columnHeader": "Characteristics[Organism]", "required": true, "columnStructure": "ONTOLOGY_COLUMN", "columnIndex": 0},
			"Characteristics[Organism part]": {"columnHeader": "Characteristics[Organism part]", "required": true, "columnStructure": "ONTOLOGY_COLUMN", "columnIndex": 0},
			"Characteristics[Variant]": {"columnHeader": "Characteristics[Variant]", "required": true, "columnStructure": "ONTOLOGY_COLUMN", "columnIndex": 0},
			"Characteristics[Sample type]": {"columnHeader": "Characteristics[Sample type]", "required": true, "columnStructure": "ONTOLOGY_COLUMN", "columnIndex": 0},
			"Protocol REF": {"columnHeader": "Protocol REF", "required": true, "columnStructure": "SINGLE_COLUMN", "columnIndex": 0},
			"Sample Name": {"columnHeader": "Sample Name", "required": true, "columnStructure": "SINGLE_COLUMN", "columnIndex": 0},
		}
	count(result) == 1
}
