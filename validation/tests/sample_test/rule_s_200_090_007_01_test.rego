#########################################################################################################
# Unit tests for rule_s_200_090_007_01
#########################################################################################################
package tests.sample_test

import data.metabolights.validation.v2.rules.phase2.violations as rules
import rego.v1

# METADATA
# title: The value appears in the list of unexpected values for this column.
# description: Select an alternative term or value that meets the requirement.
# custom:
#  rule_id: rule_s_200_090_007_01
#  type: ERROR
#  priority: HIGH
#  section: samples.general
rule_s_200_090_007_01_test_cases := 1

# METADATA
# title: Organism name is an ontology term.
# description: Organism name is not an ontology term.
test_rule_s_200_090_007_01_no_violation_01 if {
	result := rules.rule_s_200_090_007_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
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
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Variant]",
					"columnName": "Characteristics[Variant]", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 5},
			],
			"columns": [
				"Characteristics[Organism]",
				"Term Source REF",
				"Term Accession Number",
				"Characteristics[Variant]",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Characteristics[Organism]": ["samplex", "mus musculus ", "homo sapiens", "sapiens"],
				"Term Source REF": ["UO", "EFO", "MTBLS", "NCBITaxon"],
				"Term Accession Number": ["https://", "EFO", "MTBLS", "NCBITaxon"],
				"Characteristics[Variant]": ["1", "2 ", "3", "4"],
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
					"columnHeader": "Characteristics[Variant]",
					"columnPrefix": "Characteristics", "defaultColumnIndex": 7,
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
# title: Organism name is not an ontology term.
# description: Organism name is not an ontology term.
test_rule_s_200_090_007_01_violation_01 if {
	result := rules.rule_s_200_090_007_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
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
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Variant]",
					"columnName": "Characteristics[Variant]", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 5},
			],
			"columns": [
				"Characteristics[Organism]",
				"Term Source REF",
				"Term Accession Number",
				"Characteristics[Variant]",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Characteristics[Organism]": ["rat", "mouse", "unknown", "undefined"],
				"Term Source REF": ["UO", "EFO", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
				"Characteristics[Variant]": ["1", "2 ", "", ""],
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
					"columnHeader": "Characteristics[Variant]",
					"columnPrefix": "Characteristics", "defaultColumnIndex": 7,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
			],
		}]}
	count(result) == 1
}
