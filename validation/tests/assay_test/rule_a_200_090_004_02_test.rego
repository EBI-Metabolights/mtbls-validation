#########################################################################################################
# Unit tests for rule_a_200_090_004_02
#########################################################################################################
package tests.assay_test

import data.metabolights.validation.v2.rules.phase2.violations as rules

import rego.v1

# METADATA
# title: Values do not meet minimum length requirement.
# description: Each row should have a value equal or greater than the minimum length.
# custom:
#  rule_id: rule_a_200_090_004_02
#  type: ERROR
#  priority: HIGH
#  section: assays.general
rule_a_200_090_004_02_test_cases := 1

# METADATA
# title: Value is not less than minimum length requirement.
# description: Value is not less than minimum length requirement.
test_rule_a_200_090_004_02_no_violation_01 if {
	result := rules.rule_a_200_090_004_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 2},
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Column model]",
					"columnName": "Parameter Value[Column model]", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 5},
			],
			"columns": [
				"Parameter Value[Instrument]",
				"Term Source REF",
				"Term Accession Number",
				"Parameter Value[Column model]",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Parameter Value[Instrument]": ["sample", "mus musculus ", "homo sapiens", "sapiens"],
				"Term Source REF": ["UO", "EFO", "MTBLS", "NCBITaxon"],
				"Term Accession Number": ["https://", "EFO", "MTBLS", "NCBITaxon"],
				"Parameter Value[Column model]": ["1", "2 ", "3", "4"],
				"Term Source REF.1": ["UO", "EFO", "MTBLS", "NCBITaxon"],
				"Term Accession Number.1": ["https://", "EFO", "MTBLS", "NCBITaxon"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}], "ontologySourceReferences": {"references": [
			{"sourceName": "EFO"},
			{"sourceName": "UO"},
			{"sourceName": "MTBLS"},
			{"sourceName": "NCBITaxon"},
		]}},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum", "templateVersion": "2.0"},
	}
		with data.metabolights.validation.v2.templates.assayFileHeaderTemplates as {"LC-MS": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "Parameter Value[Instrument]",
					"columnPrefix": "Parameter Value", "defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 5,
					"required": true,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "Parameter Value[Column model]",
					"columnPrefix": "Parameter Value", "defaultColumnIndex": 7,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
			],
		}]}

	count(result) == 0
}

# METADATA
# title: Value is less than minimum length requirement.
# description: Value is less than minimum length requirement.
test_rule_a_200_090_004_02_violation_01 if {
	result := rules.rule_a_200_090_004_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 2},
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Column model]",
					"columnName": "Parameter Value[Column model]", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 5},
			],
			"columns": [
				"Parameter Value[Instrument]",
				"Term Source REF",
				"Term Accession Number",
				"Parameter Value[Column model]",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Parameter Value[Instrument]": ["1", "2 ", "", "1234"],
				"Term Source REF": ["UO", "EFO", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
				"Parameter Value[Column model]": ["1", "2 ", "", ""],
				"Term Source REF.1": ["UO", "Sam", "MTBLS", "NCBITaxon"],
				"Term Accession Number.1": ["UO", "MTBLS", "MTBLS", "NCBITaxon"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}], "ontologySourceReferences": {"references": [
			{"sourceName": "EFO"},
			{"sourceName": "UO"},
			{"sourceName": "MTBLS"},
			{"sourceName": "NCBITaxon"},
		]}},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum", "templateVersion": "2.0"},
	}
		with data.metabolights.validation.v2.templates.assayFileHeaderTemplates as {"LC-MS": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "Parameter Value[Instrument]",
					"columnPrefix": "Parameter Value", "defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 5,
					"required": true,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "Parameter Value[Column model]",
					"columnPrefix": "Parameter Value", "defaultColumnIndex": 7,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
			],
		}]}

	count(result) == 1
}
