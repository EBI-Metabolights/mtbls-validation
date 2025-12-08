#########################################################################################################
# Unit tests for rule_s_100_100_001_05
#########################################################################################################
package tests.sample_test

import data.metabolights.validation.v2.rules.phase1.violations as rules
import rego.v1

# METADATA
# title: Unexpected 'Protocol REF' column in sample file.
# description: Unexpected 'Protocol REF' column in sample file. Only one 'Protocol REF' header is allowed in sample file.
# custom:
#  rule_id: rule_s_100_100_001_05
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
rule_s_100_100_001_05_test_cases := 1

# METADATA
# title: Expected 'Protocol REF' column in the sample file.
# description: Expected 'Protocol REF' column in the sample file.
test_rule_s_100_100_001_05_no_violation_01 if {
	result := rules.rule_s_100_100_001_05 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
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
		}
	count(result) == 0
}

# METADATA
# title: Unexpected 'Protocol REF' column in the sample file.
# description: Unexpected 'Protocol REF' column in the sample file.
test_rule_s_100_100_001_05_violation_01 if {
	result := rules.rule_s_100_100_001_05 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnCategory": "Protocol", "columnStructure": "", "columnHeader": "Protocol REF", "columnIndex": 1},
				{"columnCategory": "Comment", "columnStructure": "", "columnHeader": "Comment[Sample]", "columnIndex": 10},
				{"columnCategory": "Protocol", "columnStructure": "", "columnHeader": "Protocol REF", "columnIndex": 11},
				{"columnCategory": "Comment", "columnStructure": "", "columnHeader": "Comment[Sample]", "columnIndex": 13},
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
