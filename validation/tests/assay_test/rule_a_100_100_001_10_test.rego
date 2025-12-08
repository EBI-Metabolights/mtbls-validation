#########################################################################################################
# Unit tests for rule_a_100_100_001_10
#########################################################################################################
package tests.assay_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Column header name defined in template is not unique in assay file.
# description: Default column header name (except Data File and Protocol REF columns) should be unique in assay file.
# custom:
#  rule_id: rule_a_100_100_001_10
#  type: WARNING
#  priority: HIGH
#  section: assays.columns
rule_a_100_100_001_10_test_cases := 1

# METADATA
# title: Parameter Value column names are unique.
# description: Parameter Value column names are unique.
test_rule_a_100_100_001_10_no_violation_01 if {
	result := rules.rule_a_100_100_001_10 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 1},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Parameter Value[Scan polarity]", "columnIndex": 3},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Normalization Name", "columnIndex": 8},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "", "columnHeader": "Derived Spectral Data File", "columnIndex": 20},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "", "columnHeader": "Derived Spectral Data File", "columnIndex": 32},
				{"columnCategory": "Parameter Value", "columnPrefix": "", "columnStructure": "", "columnHeader": "Parameter Value[Age]", "columnIndex": 33},
				{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 34},
				{"columnCategory": "Characteristics", "columnPrefix": "", "columnStructure": "", "columnHeader": "Parameter Value[Scan m/z range]", "columnIndex": 36},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 37},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_ASSAY_HEADERS as {"a_MTBLS1.txt": [{"version": "2.0", "headers": [{
			"columnCategory": "Parameter Value",
			"columnHeader": "Parameter Value[Scan polarity]",
			"columnIndex": 3,
		}]}]}
	count(result) == 0
}

# METADATA
# title: Parameter Value column names are not unique
# description: Parameter Value column names are not unique
test_rule_a_100_100_001_10_violation_01 if {
	result := rules.rule_a_100_100_001_10 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 1},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "", "columnHeader": "Parameter Value[Scan polarity]", "columnIndex": 3},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Normalization Name", "columnIndex": 8},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "", "columnHeader": "Derived Spectral Data File", "columnIndex": 20},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "", "columnHeader": "Parameter Value[Scan polarity]", "columnIndex": 32},
				{"columnCategory": "Parameter Value", "columnPrefix": "", "columnStructure": "", "columnHeader": "Parameter Value[Age]", "columnIndex": 33},
				{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 34},
				{"columnCategory": "Characteristics", "columnPrefix": "", "columnStructure": "", "columnHeader": "Parameter Value[Scan m/z range]", "columnIndex": 36},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 37},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum", "templateVersion": "2.0"},
	}
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_ASSAY_HEADERS as {"a_MTBLS1.txt": [{"version": "2.0", "headers": [{
			"columnCategory": "Parameter Value",
			"columnHeader": "Parameter Value[Scan polarity]",
			"columnIndex": 3,
		}]}]}
	count(result) == 1
}
