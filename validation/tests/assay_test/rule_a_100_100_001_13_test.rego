#########################################################################################################
# Unit tests for rule_a_100_100_001_13
#########################################################################################################
package tests.assay_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Column header structure is not correct in assay file.
# description: Column header structure is not correct in assay file. Any ontology and unit column should have the leading columns, Term Source REF and Term Accession Number. Single columns must not have leading columns.
# custom:
#  rule_id: rule_a_100_100_001_13
#  type: ERROR
#  priority: CRITICAL
#  section: assays.columns
rule_a_100_100_001_13_test_cases := 1

# METADATA
# title: Parameter Value column structures are valid
# description: Parameter Value column structures are valid
test_rule_a_100_100_001_13_no_violation_01 if {
	result := rules.rule_a_100_100_001_13 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {
			"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"},
			"table": {
				"rowOffset": 0, "totalRowCount": 0,
				"headers": [
					{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 1},
					{"columnCategory": "", "columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Scan polarity]", "columnIndex": 3},
					{"columnCategory": "", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Normalization Name", "columnIndex": 8},
					{"columnCategory": "", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Derived Spectral Data File", "columnIndex": 20},
					{"columnCategory": "", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Derived Spectral Data File", "columnIndex": 32},
					{"columnCategory": "Parameter Value", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Parameter Value[Age]", "columnIndex": 33},
					{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 34},
					{"columnCategory": "Characteristics", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Parameter Value[Scan m/z range]", "columnIndex": 36},
					{"columnCategory": "", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 37},
					{"columnCategory": "", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Spectral Raw Data File", "columnIndex": 38},
				],
			},
		}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum", "templateVersion": "2.0"},
	}
		with data.metabolights.validation.v2.templates.assayFileHeaderTemplates as {"LC-MS": [{
			"version": "2.0",
			"headers": [
				{
					"columnCategory": "",
					"columnHeader": "Spectral Raw Data File",
					"columnStructure": "SINGLE_COLUMN",
					"columnIndex": 3,
				},
				{
					"columnCategory": "",
					"columnHeader": "Parameter Value[Scan polarity]",
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnIndex": 3,
				},
				{
					"columnCategory": "",
					"columnHeader": "Parameter Value[Age]",
					"columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY",
					"columnIndex": 3,
				},
			],
		}]}

	count(result) == 0
}

# METADATA
# title: Parameter Value column structures are not valid
# description: Parameter Value column structures are not valid
test_rule_a_100_100_001_13_violation_01 if {
	result := rules.rule_a_100_100_001_13 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {
			"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"},
			"table": {
				"rowOffset": 0, "totalRowCount": 0,
				"headers": [
					{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 1},
					{"columnCategory": "", "columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Scan polarity]", "columnIndex": 3},
					{"columnCategory": "", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Normalization Name", "columnIndex": 8},
					{"columnCategory": "", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Derived Spectral Data File", "columnIndex": 20},
					{"columnCategory": "", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Derived Spectral Data File", "columnIndex": 32},
					{"columnCategory": "Parameter Value", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Parameter Value[Age]", "columnIndex": 33},
					{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 34},
					{"columnCategory": "Characteristics", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Parameter Value[Scan m/z range]", "columnIndex": 36},
					{"columnCategory": "", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 37},
					{"columnCategory": "", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Spectral Raw Data File", "columnIndex": 38},
				],
			},
		}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum", "templateVersion": "2.0"},
	}
		with data.metabolights.validation.v2.templates.assayFileHeaderTemplates as {"LC-MS": [{
			"version": "2.0",
			"headers": [
				{
					"columnCategory": "",
					"columnHeader": "Spectral Raw Data File",
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnIndex": 3,
				},
				{
					"columnCategory": "",
					"columnHeader": "Parameter Value[Scan polarity]",
					"columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY",
					"columnIndex": 3,
				},
				{
					"columnCategory": "",
					"columnHeader": "Parameter Value[Age]",
					"columnStructure": "SINGLE_COLUMN",
					"columnIndex": 3,
				},
			],
		}]}
	count(result) == 3
}
