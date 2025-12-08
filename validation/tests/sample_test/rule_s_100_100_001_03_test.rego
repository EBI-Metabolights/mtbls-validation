#########################################################################################################
# Unit tests for rule_s_100_100_001_03
#########################################################################################################
package tests.sample_test

import data.metabolights.validation.v2.rules.phase1.violations as rules
import rego.v1

# METADATA
# title: Some default columns are missing in sample file.
# description: All default columns should exist in sample file.
# custom:
#  rule_id: rule_s_100_100_001_03
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
rule_s_100_100_001_03_test_cases := 1

# METADATA
# title: All default columns are in sample file
# description: All default columns are in sample file
test_rule_s_100_100_001_03_no_violation_01 if {
	result := rules.rule_s_100_100_001_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnStructure": "ADDITIONAL_COLUMN", "columnHeader": "Sample Name", "columnIndex": 9},
				{"columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Characteristics[Organism]", "columnIndex": 3},
				{"columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Factorx", "columnIndex": 9},
				{"columnStructure": "ADDITIONAL_COLUMN", "columnHeader": "Term Source REF", "columnIndex": 2},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_SAMPLE_FILE_HEADERS as {
			"Sample Name": {"columnHeader": "Sample Name", "required": true},
			"Characteristics[Organism]": {"columnHeader": "Characteristics[Organism]", "required": true},
		}
	count(result) == 0
}

# METADATA
# title: Some default columns are not in sample file
# description: Source Name and Characteristics[Organism part] are not in sample file.
test_rule_s_100_100_001_03_violation_01 if {
	result := rules.rule_s_100_100_001_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnStructure": "ADDITIONAL_COLUMN", "columnHeader": "Sample Name", "columnIndex": 9},
				{"columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Characteristics[Organism]", "columnIndex": 3},
				{"columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Factorx", "columnIndex": 9},
				{"columnStructure": "ADDITIONAL_COLUMN", "columnHeader": "Term Source REF", "columnIndex": 2},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_SAMPLE_FILE_HEADERS as {
			"Sample Name": {"columnHeader": "Sample Name", "required": true},
			"Characteristics[Organism]": {"columnHeader": "Characteristics[Organism]", "required": true},
			"Characteristics[Organism part]": {"columnHeader": "Characteristics[Organism part]", "required": true},
			"Source Name": {"columnHeader": "Source Name", "required": true},
			"Factor[Age]": {"columnHeader": "Factor[Age]", "required": false},
		}
	count(result) == 1
}
