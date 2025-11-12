# Unit tests for rule_a_100_100_001_05
package tests.assay_test
import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1
# METADATA
# title: Unexpected 'Protocol REF' column in assay file.
# description: Unexpected 'Protocol REF' column in assay file. Only one 'Protocol REF' header is allowed in assay file.
# custom:
#  rule_id: rule_a_100_100_001_05
#  type: ERROR
#  priority: CRITICAL
#  section: assays.columns
test_rule_a_100_100_001_05 := true

# METADATA
# title: Assay files contain expected number of 'Protocol REF' columns.
# description: Assay files contain expected number of 'Protocol REF' columns.
test_rule_a_100_100_001_05_no_violation_01 if {
	result := rules.rule_a_100_100_001_05 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 1},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Parameter Value[Scan polarity]", "columnIndex": 3},
				{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 5},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Normalization Name", "columnIndex": 8},
				{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 17},
				{"columnCategory": "Comment", "columnPrefix": "", "columnStructure": "", "columnHeader": "Comment[Sample]", "columnIndex": 20},
				{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 31},
				{"columnCategory": "Comment", "columnPrefix": "", "columnStructure": "", "columnHeader": "Comment[Sample]", "columnIndex": 32},
				{"columnCategory": "Parameter Value", "columnPrefix": "", "columnStructure": "", "columnHeader": "Parameter Value[Age]", "columnIndex": 33},
				{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 34},
				{"columnCategory": "Characteristics", "columnPrefix": "", "columnStructure": "", "columnHeader": "Parameter Value[Scan m/z range]", "columnIndex": 36},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 37},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.rules.phase1.definitions.__ASSAY_PROTOCOL_HEADER_COLUMNS as {"a_MTBLS1.txt": [
			1,
			5,
			17,
			31,
			34,
		]}
		with data.metabolights.validation.v2.rules.phase1.definitions.__ASSAY_DEFAULT_PROTOCOL_HEADERS as {"a_MTBLS1.txt": [
			"Extraction",
			"Chromatography",
			"Mass spectrometry",
			"Data transformation",
			"Metabolite identification",
		]}
	count(result) == 0
}

# METADATA
# title: Assay files contain extra 'Protocol REF' columns.
# description: Assay files extra 'Protocol REF' columns.
test_rule_a_100_100_001_05_violation_01 if {
	result := rules.rule_a_100_100_001_05 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 1},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Parameter Value[Scan polarity]", "columnIndex": 3},
				{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 5},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Normalization Name", "columnIndex": 8},
				{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 17},
				{"columnCategory": "Comment", "columnPrefix": "", "columnStructure": "", "columnHeader": "Comment[Sample]", "columnIndex": 20},
				{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 31},
				{"columnCategory": "Comment", "columnPrefix": "", "columnStructure": "", "columnHeader": "Comment[Sample]", "columnIndex": 32},
				{"columnCategory": "Parameter Value", "columnPrefix": "", "columnStructure": "", "columnHeader": "Parameter Value[Age]", "columnIndex": 33},
				{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 34},
				{"columnCategory": "Characteristics", "columnPrefix": "", "columnStructure": "", "columnHeader": "Parameter Value[Scan m/z range]", "columnIndex": 36},
				{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 37},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.rules.phase1.definitions.__ASSAY_PROTOCOL_HEADER_COLUMNS as {"a_MTBLS1.txt": [
			1,
			5,
			17,
			31,
			34,
			37,
		]}
		with data.metabolights.validation.v2.rules.phase1.definitions.__ASSAY_DEFAULT_PROTOCOL_HEADERS as {"a_MTBLS1.txt": [
			"Extraction",
			"Chromatography",
			"Mass spectrometry",
			"Data transformation",
			"Metabolite identification",
		]}
	count(result) == 1
}