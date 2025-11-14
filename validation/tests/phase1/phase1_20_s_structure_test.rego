package metabolights.validation.v2.phase1.tests

import rego.v1
import data.metabolights.validation.v2.phase1.violations as rules

#########################################################################################################
#########################################################################################################
# SAMPLE FILE: COLUMNS and CONTENT
#########################################################################################################
#########################################################################################################

#########################################################################################################
# rule_s_100_100_001_01
#########################################################################################################

# METADATA
# title: There is no invalid multi-column structure in the sample file
# description: There is no invalid multi-column structure in the sample file
test_rule_s_100_100_001_01_no_violation_01 if {
	result := rules.rule_s_100_100_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 9},
				{"columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Organism", "columnIndex": 9},
				{"columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Factorx", "columnIndex": 9},
				{"columnStructure": "ADDITIONAL_COLUMN", "columnHeader": "Term Source REF", "columnIndex": 9},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: There are invalid multi-column structures in the sample file
# description: There are  invalid multi-column structures in the sample file
test_rule_s_100_100_001_01_violation_01 if {
	result := rules.rule_s_100_100_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 9},
				{"columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Organism", "columnIndex": 3},
				{"columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Factorx", "columnIndex": 9},
				{"columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Term Source REF", "columnIndex": 2},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 2
}

#########################################################################################################
# rule_s_100_100_001_02
#########################################################################################################

# METADATA
# title: There is no Unordered or unlinked column in the sample file
# description: There is no Unordered or unlinked column in the sample file
test_rule_s_100_100_001_02_no_violation_01 if {
	result := rules.rule_s_100_100_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 9},
				{"columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Organism", "columnIndex": 9},
				{"columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Factorx", "columnIndex": 9},
				{"columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Term Source REF", "columnIndex": 9},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: There is  Unordered or unlinked columns in the sample file
# description: There is  Unordered or unlinked columns in the sample file
test_rule_s_100_100_001_02_violation_01 if {
	result := rules.rule_s_100_100_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnStructure": "ADDITIONAL_COLUMN", "columnHeader": "Sample Name", "columnIndex": 9},
				{"columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Organism", "columnIndex": 3},
				{"columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Factorx", "columnIndex": 9},
				{"columnStructure": "ADDITIONAL_COLUMN", "columnHeader": "Term Source REF", "columnIndex": 2},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 2
}

#########################################################################################################
# rule_s_100_100_001_03
#########################################################################################################

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
		with data.metabolights.validation.v2.phase1.definitions._DEFAULT_SAMPLE_FILE_HEADERS as {
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
		with data.metabolights.validation.v2.phase1.definitions._DEFAULT_SAMPLE_FILE_HEADERS as {
		"Sample Name":	{"columnHeader": "Sample Name", "required": true},
		"Characteristics[Organism]":	{"columnHeader": "Characteristics[Organism]", "required": true},
		"Characteristics[Organism part]":	{"columnHeader": "Characteristics[Organism part]", "required": true},
		"Source Name":	{"columnHeader": "Source Name", "required": true},
		"Factor[Age]": {"columnHeader": "Factor[Age]", "required": false},
		}
	count(result) == 1
}

#########################################################################################################
# rule_s_100_100_001_04
#########################################################################################################

# METADATA
# title: All columns are expected.
# description: All columns are expected.
test_rule_s_100_100_001_04_no_violation_01 if {
	result := rules.rule_s_100_100_001_04 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnCategory": "", "columnStructure": "ADDITIONAL_COLUMN", "columnHeader": "Sample Name", "columnIndex": 9},
				{"columnCategory": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Characteristics[Organism]", "columnIndex": 3},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnIndex": 1},
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
		with data.metabolights.validation.v2.phase1.definitions._DEFAULT_SAMPLE_FILE_HEADERS as {
			{"columnHeader": "Sample Name", "required": true},
			{"columnHeader": "Characteristics[Organism]", "required": true},
			{"columnHeader": "Characteristics[Organism part]", "required": true},
			{"columnHeader": "Source Name", "required": true},
			{"columnHeader": "Factor[Age]", "required": false},
		}
	count(result) == 0
}

# METADATA
# title: Unexpected column in the sample file.
# description: Unexpected column in the sample file.
test_rule_s_100_100_001_04_violation_01 if {
	result := rules.rule_s_100_100_001_04 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnCategory": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Source NameX", "columnIndex": 13},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample NameX", "columnIndex": 13},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.phase1.definitions._DEFAULT_SAMPLE_FILE_HEADERS as {
			{"columnHeader": "Sample Name", "required": true},
			{"columnHeader": "Characteristics[Organism]", "required": true},
			{"columnHeader": "Characteristics[Organism part]", "required": true},
			{"columnHeader": "Source Name", "required": true},
			{"columnHeader": "Factor[Age]", "required": false},
		}
	count(result) == 1
}

#########################################################################################################
# rule_s_100_100_001_05
#########################################################################################################

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
		with data.metabolights.validation.v2.phase1.definitions._DEFAULT_SAMPLE_FILE_HEADERS as {
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
		with data.metabolights.validation.v2.phase1.definitions._DEFAULT_SAMPLE_FILE_HEADERS as {
			{"columnHeader": "Sample Name", "required": true},
			{"columnHeader": "Characteristics[Organism]", "required": true},
			{"columnHeader": "Characteristics[Organism part]", "required": true},
			{"columnHeader": "Source Name", "required": true},
			{"columnHeader": "Factor[Age]", "required": false},
		}
	count(result) == 1
}

# #########################################################################################################
# # rule_s_100_100_001_06
# #########################################################################################################

# METADATA
# title: There is one factor column in the sample file.
# description: There is one factor column in the sample file.
test_rule_s_100_100_001_06_no_violation_01 if {
	result := rules.rule_s_100_100_001_06 with input as {
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
		with data.metabolights.validation.v2.phase1.definitions._DEFAULT_SAMPLE_FILE_HEADERS as {
			{"columnHeader": "Sample Name", "required": true},
			{"columnHeader": "Characteristics[Organism]", "required": true},
		}
	count(result) == 0
}

# METADATA
# title: There is no factor column in the sample file.
# description: There is no factor column in the sample file.
test_rule_s_100_100_001_06_violation_01 if {
	result := rules.rule_s_100_100_001_06 with input as {
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
		with data.metabolights.validation.v2.phase1.definitions._DEFAULT_SAMPLE_FILE_HEADERS as {
			{"columnHeader": "Sample Name", "required": true},
			{"columnHeader": "Characteristics[Organism]", "required": true},
			{"columnHeader": "Characteristics[Organism part]", "required": true},
			{"columnHeader": "Source Name", "required": true},
			{"columnHeader": "Factor[Age]", "required": false},
		}
	count(result) == 1
}

#########################################################################################################
# rule_s_100_100_001_07
#########################################################################################################

# METADATA
# title: There is one factor column in the sample file.
# description: There is one factor column in the sample file.
test_rule_s_100_100_001_07_no_violation_01 if {
	result := rules.rule_s_100_100_001_07 with input as {
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
		with data.metabolights.validation.v2.phase1.definitions._DEFAULT_SAMPLE_FILE_HEADERS as {
			{"columnHeader": "Sample Name", "required": true},
			{"columnHeader": "Characteristics[Organism]", "required": true},
		}
	count(result) == 0
}

# METADATA
# title: There is no factor column in the sample file.
# description: There is no factor column in the sample file.
test_rule_s_100_100_001_07_violation_01 if {
	result := rules.rule_s_100_100_001_07 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnCategory": "Protocol", "columnStructure": "", "columnHeader": "", "columnIndex": 1},
				{"columnCategory": "Comment", "columnStructure": "", "columnHeader": "Comment[Sample]", "columnIndex": 10},
				{"columnCategory": "Protocol", "columnStructure": "", "columnHeader": " ", "columnIndex": 11},
				{"columnCategory": "Comment", "columnStructure": "", "columnHeader": "\t", "columnIndex": 13},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.phase1.definitions._DEFAULT_SAMPLE_FILE_HEADERS as {
			{"columnHeader": "Sample Name", "required": true},
			{"columnHeader": "Characteristics[Organism]", "required": true},
			{"columnHeader": "Characteristics[Organism part]", "required": true},
			{"columnHeader": "Source Name", "required": true},
			{"columnHeader": "Factor[Age]", "required": false},
		}
	count(result) == 1
	some result_obj in result
	count(result_obj.values) == 2
}

#########################################################################################################
# rule_s_100_100_001_08
#########################################################################################################

# METADATA
# title: Order of default column header is correct in the sample file.
# description: Order of default column header is correct in the sample file.
test_rule_s_100_100_001_08_no_violation_01 if {
	result := rules.rule_s_100_100_001_08 with input as {
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
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Sample type]", "columnIndex": 12},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 15},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 16},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.phase1.definitions._DEFAULT_SAMPLE_FILE_HEADERS as [{
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
# title: Order of default column header is not correct in the sample file.
# description: Order of default column header is not correct in the sample file.
test_rule_s_100_100_001_08_violation_01 if {
	result := rules.rule_s_100_100_001_08 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Source Name", "columnIndex": 3},
				{"columnCategory": "Comment", "columnStructure": "", "columnHeader": "Comment[Sample]", "columnIndex": 4},
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Variant]", "columnIndex": 5},
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism part]", "columnIndex": 8},
				{"columnCategory": "Comment", "columnStructure": "", "columnHeader": "Comment[Organism]", "columnIndex": 11},
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Sample type]", "columnIndex": 12},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 15},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 16},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.phase1.definitions._DEFAULT_SAMPLE_HEADER_NAMES as [
			"Characteristics[Organism part]",
			"Characteristics[Organism]",
			"Characteristics[Sample type]",
			"Characteristics[Variant]",
			"Protocol REF",
			"Sample Name",
			"Source Name"
		]
		with  data.metabolights.validation.v2.phase1.definitions.SELECTED_STUDY_SAMPLE_FILE_TEMPLATE_HEADERS as [
			{"columnHeader": "Source Name", "required": true},
			{"columnHeader": "Characteristics[Organism]", "required": true},
			{"columnHeader": "Characteristics[Organism part]", "required": true},
			{"columnHeader": "Characteristics[Variant]", "required": true},
			{"columnHeader": "Characteristics[Sample type]", "required": true},
			{"columnHeader": "Protocol REF", "required": true},
			{"columnHeader": "Sample Name", "required": true},
		]
	count(result) == 1
}

#########################################################################################################
# rule_s_100_100_001_09
#########################################################################################################

# METADATA
# title: Order of characteristics column header is  correct in the sample file
# description: Order of characteristics column header is correct in the sample file
test_rule_s_100_100_001_09_no_violation_01 if {
	result := rules.rule_s_100_100_001_09 with input as {
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
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.phase1.definitions._DEFAULT_SAMPLE_FILE_HEADERS as [{
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
test_rule_s_100_100_001_09_violation_01 if {
	result := rules.rule_s_100_100_001_09 with input as {
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
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Data]", "columnIndex": 22},
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Value]", "columnIndex": 25},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.phase1.definitions._DEFAULT_SAMPLE_FILE_HEADERS as [{
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

#########################################################################################################
# rule_s_100_100_001_10
#########################################################################################################

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
		with data.metabolights.validation.v2.phase1.definitions._DEFAULT_SAMPLE_FILE_HEADERS as [{
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
		with data.metabolights.validation.v2.phase1.definitions._DEFAULT_SAMPLE_FILE_HEADERS as [{
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



#########################################################################################################
# rule_s_100_100_001_11
#########################################################################################################

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
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 16}
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyFactors": { "factors": [ {"name": "Age"}]}}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	with data.metabolights.validation.v2.phase1.definitions._DEFAULT_SAMPLE_FILE_HEADERS as {

		"Source Name": {"columnHeader": "Source Name", "required": true, "columnStructure": "SINGLE_COLUMN", "columnIndex": 0},
		"Characteristics[Organism]": {"columnHeader": "Characteristics[Organism]", "required": true, "columnStructure": "ONTOLOGY_COLUMN", "columnIndex": 0},
		"Characteristics[Organism part]": {"columnHeader": "Characteristics[Organism part]", "required": true, "columnStructure": "ONTOLOGY_COLUMN", "columnIndex": 0},
		"Characteristics[Variant]": {"columnHeader": "Characteristics[Variant]", "required": true, "columnStructure": "ONTOLOGY_COLUMN", "columnIndex": 0},
		"Characteristics[Sample type]": {"columnHeader": "Characteristics[Sample type]", "required": true, "columnStructure": "ONTOLOGY_COLUMN", "columnIndex": 0},
		"Protocol REF": {"columnHeader": "Protocol REF", "required": true, "columnStructure": "SINGLE_COLUMN", "columnIndex": 0},
		"Sample Name": {"columnHeader": "Sample Name", "required": true, "columnStructure": "SINGLE_COLUMN", "columnIndex": 0}
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
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyFactors": { "factors": [ {"name": "Age"}]}}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	with data.metabolights.validation.v2.phase1.definitions._DEFAULT_SAMPLE_FILE_HEADERS as  {

		"Source Name": {"columnHeader": "Source Name", "required": true, "columnStructure": "SINGLE_COLUMN", "columnIndex": 0},
		"Characteristics[Organism]": {"columnHeader": "Characteristics[Organism]", "required": true, "columnStructure": "ONTOLOGY_COLUMN", "columnIndex": 0},
		"Characteristics[Organism part]": {"columnHeader": "Characteristics[Organism part]", "required": true, "columnStructure": "ONTOLOGY_COLUMN", "columnIndex": 0},
		"Characteristics[Variant]": {"columnHeader": "Characteristics[Variant]", "required": true, "columnStructure": "ONTOLOGY_COLUMN", "columnIndex": 0},
		"Characteristics[Sample type]": {"columnHeader": "Characteristics[Sample type]", "required": true, "columnStructure": "ONTOLOGY_COLUMN", "columnIndex": 0},
		"Protocol REF": {"columnHeader": "Protocol REF", "required": true, "columnStructure": "SINGLE_COLUMN", "columnIndex": 0},
		"Sample Name": {"columnHeader": "Sample Name", "required": true, "columnStructure": "SINGLE_COLUMN", "columnIndex": 0}
		}
	count(result) == 1
}


#########################################################################################################
# rule_s_100_100_001_12
#########################################################################################################

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
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyFactors": { "factors": [ {"name": "Age"}]}}]},
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
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyFactors": { "factors": [{"name": "Age"}, {"name": "Year"}]}}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}



#########################################################################################################
# rule_s_100_100_001_13
#########################################################################################################

# METADATA
# title: expected Factor Value columns in sample file.
# description: expected Factor Value columns in sample file.
test_rule_s_100_100_001_13_no_violation_01 if {
	result := rules.rule_s_100_100_001_13 with input as {
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
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyFactors": { "factors": [ {"name": "Age"}]}}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.phase1.definitions._DEFAULT_SAMPLE_HEADER_NAMES as {"Characteristics[Organism]", "Characteristics[Organism part]"}
	count(result) == 0
}

# METADATA
# title: Missing Factor Value columns in sample file.
# description: Missing Factor Value columns in sample file.
test_rule_s_100_100_001_13_violation_01 if {
	result := rules.rule_s_100_100_001_13 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Source Name", "columnIndex": 0},
				{"columnCategory": "Comment", "columnStructure": "", "columnHeader": "Comment[Sample]", "columnIndex": 1},
				{"columnCategory": "Characteristics", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Characteristics[Organism]", "columnIndex": 2},
				{"columnCategory": "Factor Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Factor Value[Age]", "columnIndex": 8},
				{"columnCategory": "Comment", "columnStructure": "", "columnHeader": "Comment[Organism]", "columnIndex": 11},
				{"columnCategory": "Factor Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Factor Value[Age]", "columnIndex": 12},

				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 15},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 16},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyFactors": { "factors": [{"name": "Age"}, {"name": "Year"}]}}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.phase1.definitions._DEFAULT_SAMPLE_HEADER_NAMES as {"Characteristics[Organism part]"}

	count(result) == 1
}

#########################################################################################################
# rule_s_100_100_001_14
#########################################################################################################

# METADATA
# title: expected Factor Value columns in sample file.
# description: expected Factor Value columns in sample file.
test_rule_s_100_100_001_14_no_violation_01 if {
	result := rules.rule_s_100_100_001_14 with input as {
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
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyFactors": { "factors": [ {"name": "Age"}]}}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: Missing Factor Value columns in sample file.
# description: Missing Factor Value columns in sample file.
test_rule_s_100_100_001_14_violation_01 if {
	result := rules.rule_s_100_100_001_14 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Source Name", "columnIndex": 0},
				{"columnCategory": "Comment", "columnStructure": "", "columnHeader": "Comment[Sample]", "columnIndex": 1},
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]", "columnIndex": 2},
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]", "columnIndex": 5},
				{"columnCategory": "Factor Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Factor Value[Age]", "columnIndex": 8},
				{"columnCategory": "Comment", "columnStructure": "", "columnHeader": "Comment[Organism]", "columnIndex": 11},
				{"columnCategory": "Factor Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Factor Value[Age]", "columnIndex": 12},
				{"columnCategory": "Factor Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Factor Value[Age]", "columnIndex": 13},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 15},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 16},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyFactors": { "factors": [{"name": "Age"}, {"name": "Year"}]}}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}

#########################################################################################################
# rule_s_100_100_001_15
#########################################################################################################

# METADATA
# title: expected Factor Value columns in sample file.
# description: expected Factor Value columns in sample file.
test_rule_s_100_100_001_15_no_violation_01 if {
	result := rules.rule_s_100_100_001_15 with input as {
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
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyFactors": { "factors": [ {"name": "Age"}]}}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: Missing Factor Value columns in sample file.
# description: Missing Factor Value columns in sample file.
test_rule_s_100_100_001_15_violation_01 if {
	result := rules.rule_s_100_100_001_15 with input as {
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
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyFactors": { "factors": [{"name": "Age"}, {"name": "Year"}]}}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}


#########################################################################################################
# rule_s_100_100_001_16
#########################################################################################################

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
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyFactors": { "factors": [ {"name": "Age"}]}}]},
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
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyFactors": { "factors": []}}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}

#########################################################################################################
# rule_s_100_100_002_01
#########################################################################################################

# METADATA
# title: There are more rows in the sample file.
# description:  There are more rows in the sample file.
test_rule_s_100_100_002_01_no_violation_01 if {
	result := rules.rule_s_100_100_002_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {"rowOffset": 0, "totalRowCount": 10}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: There is no row in the sample file.
# description:  There is no row in the sample file.
test_rule_s_100_100_002_01_violation_01 if {
	result := rules.rule_s_100_100_002_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {"rowOffset": 0, "totalRowCount": 0}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}

#########################################################################################################
# rule_s_100_100_002_02
#########################################################################################################

# METADATA
# title: There are more rows in the sample file.
# description:  There are more rows in the sample file.
test_rule_s_100_100_002_02_no_violation_01 if {
	result := rules.rule_s_100_100_002_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {"rowOffset": 0, "totalRowCount": 10}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: There is one row in the sample file.
# description:  There is one row in the sample file.
test_rule_s_100_100_002_02_violation_01 if {
	result := rules.rule_s_100_100_002_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {"rowOffset": 0, "totalRowCount": 1}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}

#########################################################################################################
# rule_s_100_100_003_01
#########################################################################################################

# METADATA
# title: Sample file name is referenced in i_Investigation.txt file
# description:  Sample file name is referenced in i_Investigation.txt file
test_rule_s_100_100_003_01_no_violation_01 if {
	result := rules.rule_s_100_100_003_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: Sample file name is not referenced in i_Investigation.txt file
# description:  Sample file name is not referenced in i_Investigation.txt file
test_rule_s_100_100_003_01_violation_01 if {
	result := rules.rule_s_100_100_003_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.tsv": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}

# METADATA
# title: Sample file name is not referenced in i_Investigation.txt file
# description:  Sample file name is not referenced in i_Investigation.txt file
test_rule_s_100_100_003_01_violation_02 if {
	result := rules.rule_s_100_100_003_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": ""}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}