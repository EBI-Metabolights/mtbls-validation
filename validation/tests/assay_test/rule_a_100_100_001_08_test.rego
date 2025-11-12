# Unit tests for rule_a_100_100_001_08
package tests.assay_test
import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1
# METADATA
# title: Order of default column header is not correct in assay file.
# description: Order of default column header is not correct in assay file.
# custom:
#  rule_id: rule_a_100_100_001_08
#  type: ERROR
#  priority: CRITICAL
#  section: assays.columns
test_rule_a_100_100_001_08 := true

# METADATA
# title: Assay files columnd are ordered.
# description: Assay files columnd are ordered.
test_rule_a_100_100_001_08_no_violation_01 if {
	result := rules.rule_a_100_100_001_08 with input as {
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
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_ASSAY_HEADER_NAMES as {"a_MTBLS1.txt": {
			"Protocol REF",
			"Parameter Value[Scan polarity]",
			"Normalization Name",
			"Parameter Value[Age]",
			"Parameter Value[Scan m/z range]",
			"Sample Name",
		}}
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_ASSAY_HEADERS as {"a_MTBLS1.txt": {"headers": [
			{"columnHeader": "Protocol REF"},
			{"columnHeader": "Parameter Value[Scan polarity]"},
			{"columnHeader": "Normalization Name"},
			{"columnHeader": "Parameter Value[Age]"},
			{"columnHeader": "Protocol REF"},
			{"columnHeader": "Parameter Value[Scan m/z range]"},
			{"columnHeader": "Sample Name"},
		]}}
	count(result) == 0
}

# METADATA
# title: Assay files columnd are ordered with multiple Data File Column.
# description: Assay files columnd are ordered.
test_rule_a_100_100_001_08_no_violation_02 if {
	result := rules.rule_a_100_100_001_08 with input as {
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
				{"columnCategory": "Parameter Value", "columnPrefix": "", "columnStructure": "", "columnHeader": "Raw Spectral Data File", "columnIndex": 35},
				{"columnCategory": "Parameter Value", "columnPrefix": "", "columnStructure": "", "columnHeader": "Raw Spectral Data File", "columnIndex": 36},
				{"columnCategory": "Characteristics", "columnPrefix": "", "columnStructure": "", "columnHeader": "Parameter Value[Scan m/z range]", "columnIndex": 37},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 37},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_ASSAY_HEADER_NAMES as {"a_MTBLS1.txt": {
			"Protocol REF",
			"Parameter Value[Scan polarity]",
			"Normalization Name",
			"Parameter Value[Age]",
			"Parameter Value[Scan m/z range]",
			"Sample Name",
		}}
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_ASSAY_HEADERS as {"a_MTBLS1.txt": {"headers": [
			{"columnHeader": "Protocol REF"},
			{"columnHeader": "Parameter Value[Scan polarity]"},
			{"columnHeader": "Normalization Name"},
			{"columnHeader": "Parameter Value[Age]"},
			{"columnHeader": "Protocol REF"},
			{"columnHeader": "Parameter Value[Scan m/z range]"},
			{"columnHeader": "Sample Name"},
		]}}
	count(result) == 0
}

# METADATA
# title: Missing 'Protocol REF' column in the assay file.
# description: Missing 'Protocol REF' column in the assay file.
test_rule_a_100_100_001_08_violation_01 if {
	result := rules.rule_a_100_100_001_08 with input as {
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
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_ASSAY_HEADER_NAMES as {"a_MTBLS1.txt": [
			"Protocol REF",
			"Parameter Value[Scan polarity]",
			"Normalization Name",
			"Parameter Value[Age]",
			"Protocol REF",
			"Parameter Value[Scan m/z range]",
			"Sample Name",
		]}
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_ASSAY_HEADERS as {"a_MTBLS1.txt": {"headers": [
			{"columnHeader": "Sample Name"},
			{"columnHeader": "Protocol REF"},
			{"columnHeader": "Parameter Value[Scan polarity]"},
			{"columnHeader": "Normalization Name"},
			{"columnHeader": "Protocol REF"},
			{"columnHeader": "Parameter Value[Age]"},
			{"columnHeader": "Parameter Value[Scan m/z range]"},
		]}}

	count(result) == 1
}

