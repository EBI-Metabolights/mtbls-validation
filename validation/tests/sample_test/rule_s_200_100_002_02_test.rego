#########################################################################################################
# Unit tests for rule_s_200_100_002_02
#########################################################################################################
package tests.sample_test

import data.metabolights.validation.v2.rules.phase2.violations as rules
import rego.v1

# METADATA
# title: Term Source REF of the user defined characteristics ontology term is not in the priotirised control list.
# description: We highly recommend to use the prioritised ontologies for the characteristics ontology term.
# custom:
#  rule_id: rule_s_200_100_002_02
#  type: WARNING
#  priority: MEDIUM
#  section: samples.source
rule_s_200_100_002_02_test_cases := 1

# METADATA
# title: Term Source REF of the user defined characteristics ontology term is in the prioritised control list.
# description: Term Source REF of the user defined characteristics ontology term is in the prioritised control list.
test_rule_s_200_100_002_02_no_violation_01 if {
	result := rules.rule_s_200_100_002_02 with input as {
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
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum", "templateVersion": "2.0"},
	}
		with data.metabolights.validation.v2.rules.phase2.definitions._SAMPLES_DEFAULT_CHARACTERISTICS_HEADERS as ["Characteristics[Sample type]"]

	count(result) == 0
}

# METADATA
# title: Term Source REF of the user defined characteristics ontology term is not in the prioritised control list.
# description: Term Source REF of the user defined characteristics ontology term is not in the prioritised control list.
test_rule_s_200_100_002_02_violation_01 if {
	result := rules.rule_s_200_100_002_02 with input as {
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
				"Characteristics[Organism]": ["rat", "mouse", "unk:nown", "und:efined"],
				"Term Source REF": ["UO", "EFO", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
				"Characteristics[Variant]": ["1", " ", "2", ""],
				"Term Source REF.1": ["", "Sam", "", "NCBITaxon"],
				"Term Accession Number.1": ["UO", "", "", "NCBITaxon"],
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
		with data.metabolights.validation.v2.rules.phase2.definitions._SAMPLES_DEFAULT_CHARACTERISTICS_HEADERS as [
			"Characteristics[Organism]",
			"Characteristics[Sample type]",
		]
	count(result) == 1
}
