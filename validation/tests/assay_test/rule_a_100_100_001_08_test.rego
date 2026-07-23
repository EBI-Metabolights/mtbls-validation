#########################################################################################################
# Unit tests for rule_a_100_100_001_08
#########################################################################################################
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
rule_a_100_100_001_08_test_cases := 1

# METADATA
# title: Assay files columnd are ordered.
# description: Assay files columnd are ordered.
test_rule_a_100_100_001_08_no_violation_01 if {
	result := rules.rule_a_100_100_001_08 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"columns": ["Protocol REF", "Parameter Value[Scan polarity]", "Normalization Name", "Comment[Sample]", "Comment[Sample2]", "Parameter Value[Age]", "Protocol REF.1", "Parameter Value[Scan m/z range]", "Sample Name"],
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
		with data.metabolights.validation.v2.rules.phase1.definitions.SELECTED_ASSAY_FILE_TEMPLATE as {"a_MTBLS1.txt": {"headers": [
			{"columnHeader": "Protocol REF", "defaultColumnIndex": 1},
			{"columnHeader": "Parameter Value[Scan polarity]", "defaultColumnIndex": 3},
			{"columnHeader": "Normalization Name", "defaultColumnIndex": 8},
			{"columnHeader": "Parameter Value[Age]", "defaultColumnIndex": 33},
			{"columnHeader": "Protocol REF", "defaultColumnIndex": 34},
			{"columnHeader": "Parameter Value[Scan m/z range]", "defaultColumnIndex": 36},
			{"columnHeader": "Sample Name", "defaultColumnIndex": 37},
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
			"columns": ["Protocol REF", "Parameter Value[Scan polarity]", "Normalization Name", "Comment[Sample]", "Comment[Sample2]", "Parameter Value[Age]", "Protocol REF.1", "Raw Spectral Data File", "Raw Spectral Data File.1", "Parameter Value[Scan m/z range]", "Sample Name"],
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
		with data.metabolights.validation.v2.rules.phase1.definitions.SELECTED_ASSAY_FILE_TEMPLATE as {"a_MTBLS1.txt": {"headers": [
			{"columnHeader": "Protocol REF", "defaultColumnIndex": 1},
			{"columnHeader": "Parameter Value[Scan polarity]", "defaultColumnIndex": 3},
			{"columnHeader": "Normalization Name", "defaultColumnIndex": 8},
			{"columnHeader": "Parameter Value[Age]", "defaultColumnIndex": 33},
			{"columnHeader": "Protocol REF", "defaultColumnIndex": 34},
			{"columnHeader": "Parameter Value[Scan m/z range]", "defaultColumnIndex": 37},
			{"columnHeader": "Sample Name", "defaultColumnIndex": 37},
		]}}
	count(result) == 0
}

# METADATA
# title: Assay file default columns are ordered with extra non-template columns.
# description: Columns not defined in the default template do not affect default column order validation.
test_rule_a_100_100_001_08_no_violation_03 if {
	result := rules.rule_a_100_100_001_08 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"columns": ["Sample Name", "Protocol REF", "Term Source REF", "Term Accession Number", "Extract Name", "Comment[Sample]", "Protocol REF.1", "Parameter Value[Scan polarity]", "MS Assay Name"],
			"headers": [
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 1},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Term Source REF", "columnIndex": 2},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Term Accession Number", "columnIndex": 3},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Extract Name", "columnIndex": 4},
				{"columnCategory": "Comment", "columnPrefix": "", "columnStructure": "", "columnHeader": "Comment[Sample]", "columnIndex": 5},
				{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 6},
				{"columnCategory": "Parameter Value", "columnPrefix": "", "columnStructure": "", "columnHeader": "Parameter Value[Scan polarity]", "columnIndex": 7},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name", "columnIndex": 8},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.rules.phase1.definitions.SELECTED_ASSAY_FILE_TEMPLATE as {"a_MTBLS1.txt": {"headers": [
			{"columnHeader": "Sample Name", "defaultColumnIndex": 0},
			{"columnHeader": "Protocol REF", "defaultColumnIndex": 1},
			{"columnHeader": "Extract Name", "defaultColumnIndex": 2},
			{"columnHeader": "Protocol REF", "defaultColumnIndex": 3},
			{"columnHeader": "Parameter Value[Scan polarity]", "defaultColumnIndex": 4},
			{"columnHeader": "MS Assay Name", "defaultColumnIndex": 5},
		]}}
	count(result) == 0
}

# METADATA
# title: Assay file default columns are ordered when absent template columns are skipped.
# description: Missing default columns are ignored by order validation because they are reported by the missing-column rule.
test_rule_a_100_100_001_08_no_violation_04 if {
	result := rules.rule_a_100_100_001_08 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"columns": ["Sample Name", "Protocol REF", "Extract Name", "MS Assay Name"],
			"headers": [
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 1},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Extract Name", "columnIndex": 2},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name", "columnIndex": 3},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.rules.phase1.definitions.SELECTED_ASSAY_FILE_TEMPLATE as {"a_MTBLS1.txt": {"headers": [
			{"columnHeader": "Sample Name", "defaultColumnIndex": 0},
			{"columnHeader": "Protocol REF", "defaultColumnIndex": 1},
			{"columnHeader": "Parameter Value[Derivatization]", "defaultColumnIndex": 2},
			{"columnHeader": "Extract Name", "defaultColumnIndex": 3},
			{"columnHeader": "Parameter Value[Column model]", "defaultColumnIndex": 4},
			{"columnHeader": "MS Assay Name", "defaultColumnIndex": 5},
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
			"columns": ["Protocol REF", "Parameter Value[Scan polarity]", "Normalization Name", "Comment[Sample]", "Comment[Sample2]", "Parameter Value[Age]", "Protocol REF.1", "Parameter Value[Scan m/z range]", "Sample Name"],
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
		with data.metabolights.validation.v2.rules.phase1.definitions.SELECTED_ASSAY_FILE_TEMPLATE as {"a_MTBLS1.txt": {"headers": [
			{"columnHeader": "Sample Name", "defaultColumnIndex": 0},
			{"columnHeader": "Protocol REF", "defaultColumnIndex": 1},
			{"columnHeader": "Parameter Value[Scan polarity]", "defaultColumnIndex": 2},
			{"columnHeader": "Normalization Name", "defaultColumnIndex": 3},
			{"columnHeader": "Protocol REF", "defaultColumnIndex": 4},
			{"columnHeader": "Parameter Value[Age]", "defaultColumnIndex": 5},
			{"columnHeader": "Parameter Value[Scan m/z range]", "defaultColumnIndex": 6},
		]}}

	count(result) == 1
}
