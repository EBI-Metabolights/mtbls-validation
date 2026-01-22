#########################################################################################################
# Unit tests for rule_s_200_100_002_01
#########################################################################################################
package tests.sample_test

import data.metabolights.validation.v2.rules.phase2.violations as rules
import rego.v1

# METADATA
# title: User defined Characteristics column is empty.
# description: At least one value should be defined in Characteristics column.
# custom:
#  rule_id: rule_s_200_100_002_01
#  type: ERROR
#  priority: HIGH
#  section: samples.source
rule_s_200_100_002_01_test_cases := 1

# METADATA
# title: There is no empty value in the user defined characteristics column.
# description: There is no empty value in the user defined characteristics column. list.
test_rule_s_200_100_002_01_no_violation_01 if {
	result := rules.rule_s_200_100_002_01 with input as {
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
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[VariantX]",
					"columnName": "Characteristics[VariantX]", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 5},
			],
			"columns": [
				"Characteristics[Organism]",
				"Term Source REF",
				"Term Accession Number",
				"Characteristics[VariantX]",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Characteristics[Organism]": ["samplex", "mus musculus ", "homo sapiens", "sapiens"],
				"Term Source REF": ["UO", "EFO", "MTBLS", "NCBITaxon"],
				"Term Accession Number": ["https://", "EFO", "MTBLS", "NCBITaxon"],
				"Characteristics[VariantX]": ["1", "2 ", "3", "4"],
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
	count(result) == 0
}

# METADATA
# title: User defined Characteristics column is empty.
# description: There are empty values in the user defined characteristics column.
test_rule_s_200_100_002_01_violation_01 if {
	result := rules.rule_s_200_100_002_01 with input as {
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
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[VariantX]",
					"columnName": "Characteristics[VariantX]", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 5},
			],
			"columns": [
				"Characteristics[Organism]",
				"Term Source REF",
				"Term Accession Number",
				"Characteristics[VariantX]",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Characteristics[Organism]": ["rat", "mouse", "unk:nown", "und:efined"],
				"Term Source REF": ["UO", "EFO", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
				"Characteristics[VariantX]": ["", " ", "", ""],
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
	count(result) == 1
}
