#########################################################################################################
# Unit tests for rule_s_200_200_002_01
#########################################################################################################
package tests.sample_test

import data.metabolights.validation.v2.rules.phase2.violations as rules
import rego.v1

# METADATA
# title: There are empty values in Factor Value column.
# description: Factor values should be defined for each row.
# custom:
#  rule_id: rule_s_200_200_002_01
#  type: WARNING
#  priority: HIGH
#  section: samples.sampleCollection
rule_s_200_200_002_01_test_cases := 1

# METADATA
# title: There are empty values in factor column.
# description: There are empty values in factor column.
test_rule_s_200_200_002_01_no_violation_01 if {
	result := rules.rule_s_200_200_002_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_x.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 1 ", "Sample 3", "Sample 4"], "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 2},
				{
					"columnCategory": "Factor Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Factor Value[Variant]",
					"columnName": "Factor Value[Variant]", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 5},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnName": "Sample Name", "columnIndex": 6},
			],
			"columns": [
				"Characteristics[Organism]",
				"Term Source REF",
				"Term Accession Number",
				"Factor Value[Sample type]",
				"Term Source REF.1",
				"Term Accession Number.1",
				"Sample Name",
			],
			"data": {
				"Characteristics[Organism]": ["rat", "mouse", "unk:nown", "und:efined"],
				"Term Source REF": ["UO", "EFO", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
				"Factor Value[Sample type]": ["1", "Test", "2", "Data"],
				"Term Source REF.1": ["", "Sam", "", "NCBITaxon"],
				"Term Accession Number.1": ["", "", "", "NCBITaxon"],
				"Sample Name": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}], "ontologySourceReferences": {"references": [
			{"sourceName": "EFO"},
			{"sourceName": "UO"},
			{"sourceName": "MTBLS"},
			{"sourceName": "NCBITaxon"},
		]}},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.templates.sampleFileHeaderTemplates as {"minimum": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Organism]",
					"columnPrefix": "Characteristics", "defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 5,
					"required": true,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Sample type]",
					"columnPrefix": "Characteristics", "defaultColumnIndex": 7,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
				{
					"columnStructure": "SINGLE_COLUMN",
					"columnCategory": "",
					"columnHeader": "Sample Name",
					"columnPrefix": "", "defaultColumnIndex": 7,
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
# title: There are empty values in factor column.
# description: There are empty values in factor column.
test_rule_s_200_200_002_01_violation_01 if {
	result := rules.rule_s_200_200_002_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_x.txt": {"sampleNames": ["Sample 1", "Sample 1 ", "Sample 3", "Sample 5"]}},
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 1 ", "Sample 3", "Sample 2"], "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 2},
				{
					"columnCategory": "Factor Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Factor Value[Sample type]",
					"columnName": "Factor Value[Sample type]", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 5},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnName": "Sample Name", "columnIndex": 6},
			],
			"columns": [
				"Characteristics[Organism]",
				"Term Source REF",
				"Term Accession Number",
				"Factor Value[Sample type]",
				"Term Source REF.1",
				"Term Accession Number.1",
				"Sample Name",
			],
			"data": {
				"Characteristics[Organism]": ["rat", "mouse", "unk:nown", "und:efined"],
				"Term Source REF": ["UO", "EFO", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
				"Factor Value[Sample type]": ["", "", "2", ""],
				"Term Source REF.1": ["", "Sam", "", "NCBITaxon"],
				"Term Accession Number.1": ["", "", "", "NCBITaxon"],
				"Sample Name": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}], "ontologySourceReferences": {"references": [
			{"sourceName": "EFO"},
			{"sourceName": "UO"},
			{"sourceName": "MTBLS"},
			{"sourceName": "NCBITaxon"},
		]}},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.templates.sampleFileHeaderTemplates as {"minimum": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Organism]",
					"columnPrefix": "Characteristics", "defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 5,
					"required": true,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Factor Value",
					"columnHeader": "Factor Value[Sample type]",
					"columnPrefix": "Factor Value", "defaultColumnIndex": 7,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
				{
					"columnStructure": "SINGLE_COLUMN",
					"columnCategory": "",
					"columnHeader": "Sample Name",
					"columnPrefix": "", "defaultColumnIndex": 7,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
			],
		}]}
	count(result) == 1
}
