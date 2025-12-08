#########################################################################################################
# Unit tests for rule_a_100_100_001_09
#########################################################################################################
package tests.assay_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Multiple Parameter Value columns with same header are not allowed in assay file.
# description: Parameter Value column headers should be unique in assay file.
# custom:
#  rule_id: rule_a_100_100_001_09
#  type: WARNING
#  priority: HIGH
#  section: assays.columns
rule_a_100_100_001_09_test_cases := 1

# METADATA
# title: Parameter Value column names are unique.
# description: Parameter Value column names are unique.
test_rule_a_100_100_001_09_no_violation_01 if {
	result := rules.rule_a_100_100_001_09 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 1},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Parameter Value[Scan polarity]", "columnIndex": 3},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Normalization Name", "columnIndex": 8},
				{"columnCategory": "Comment", "columnPrefix": "", "columnStructure": "", "columnHeader": "Comment[Sample]", "columnIndex": 20},
				{"columnCategory": "Comment", "columnPrefix": "", "columnStructure": "", "columnHeader": "Comment[Sample2]", "columnIndex": 32},
				{"columnCategory": "Parameter Value", "columnPrefix": "", "columnStructure": "", "columnHeader": "Parameter Value[Age]", "columnIndex": 33},
				{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 34},
				{"columnCategory": "Characteristics", "columnPrefix": "", "columnStructure": "", "columnHeader": "Parameter Value[Scan m/z range]", "columnIndex": 36},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 37},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: Parameter Value column names are not unique
# description: Parameter Value column names are not unique
test_rule_a_100_100_001_09_violation_01 if {
	result := rules.rule_a_100_100_001_09 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 1},
				{"columnCategory": "Parameter Value", "columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Parameter Value[Scan polarity]", "columnIndex": 3},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Normalization Name", "columnIndex": 8},
				{"columnCategory": "Comment", "columnPrefix": "", "columnStructure": "", "columnHeader": "Comment[Sample]", "columnIndex": 20},
				{"columnCategory": "Comment", "columnPrefix": "", "columnStructure": "", "columnHeader": "Comment[Sample2]", "columnIndex": 32},
				{"columnCategory": "Parameter Value", "columnPrefix": "", "columnStructure": "", "columnHeader": "Parameter Value[Scan polarity]", "columnIndex": 33},
				{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 34},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "", "columnHeader": "Raw Spectral Data File", "columnIndex": 35},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "", "columnHeader": "Raw Spectral Data File", "columnIndex": 36},
				{"columnCategory": "Characteristics", "columnPrefix": "", "columnStructure": "", "columnHeader": "Parameter Value[Scan m/z range]", "columnIndex": 37},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 37},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}
