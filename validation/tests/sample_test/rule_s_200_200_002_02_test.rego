#########################################################################################################
# Unit tests for rule_s_200_200_002_02
#########################################################################################################
package tests.sample_test

import data.metabolights.validation.v2.rules.phase2.violations as rules
import rego.v1

# METADATA
# title: Factor Value column not complete.
# description: At least two values must be defined in Factor Value column.
# custom:
#  rule_id: rule_s_200_200_002_02
#  type: ERROR
#  priority: HIGH
#  section: samples.sampleCollection
rule_s_200_200_002_02_test_cases := 1

# METADATA
# title: Term Source REFs of the factor ontology term is in the prioritised control list.
# description: Term Source REFs of the factor ontology term is in the prioritised control list.
test_rule_s_200_200_002_02_no_violation_01 if {
	result := rules.rule_s_200_200_002_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_x.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 1 ", "Sample 3", "Sample 4"], "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Factor Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Factor Value[Organism]",
					"columnName": "Factor Value[Organism]", "columnIndex": 0,
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
				"Factor Value[Organism]",
				"Term Source REF",
				"Term Accession Number",
				"Factor Value[Sample type]",
				"Term Source REF.1",
				"Term Accession Number.1",
				"Sample Name",
			],
			"data": {
				"Factor Value[Organism]": ["rat", "mouse", "unk:nown", "und:efined"],
				"Term Source REF": ["UO", "EFO", "MTBLS", "NCBITaxon"],
				"Term Accession Number": ["UO", "EFO", "MTBLS", "NCBITaxon"],
				"Factor Value[Sample type]": ["1", "2", "2", "4"],
				"Term Source REF.1": ["MTBLS", "MTBLS", "NCBITaxon", "NCBITaxon"],
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
	count(result) == 0
}

# METADATA
# title: Term Source REFs of the factor ontology term is not in the prioritised control list.
# description: Term Source REFs of the factor ontology term is not in the prioritised control list.
test_rule_s_200_200_002_02_violation_01 if {
	result := rules.rule_s_200_200_002_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_x.txt": {"sampleNames": ["Sample 1", "Sample 1 ", "Sample 3", "Sample 5"]}},
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 1 ", "Sample 3", "Sample 2"], "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Factor Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Factor Value[Organism]",
					"columnName": "Factor Value[Organism]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 2},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnName": "Sample Name", "columnIndex": 6},
			],
			"columns": [
				"Factor Value[Organism]",
				"Term Source REF",
				"Term Accession Number",
				"Sample Name",
			],
			"data": {
				"Factor Value[Organism]": ["", "", "", ""],
				"Term Source REF": ["", "", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
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

	count(result) == 1
}

# METADATA
# title: Term Source REFs of the factor ontology term is not in the prioritised control list.
# description: Term Source REFs of the factor ontology term is not in the prioritised control list.
test_rule_s_200_200_002_02_violation_02 if {
	result := rules.rule_s_200_200_002_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_x.txt": {"sampleNames": ["Sample 1", "Sample 1 ", "Sample 3", "Sample 5"]}},
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 1 ", "Sample 3", "Sample 2"], "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Factor Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Factor Value[Organism]",
					"columnName": "Factor Value[Organism]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 2},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnName": "Sample Name", "columnIndex": 6},
			],
			"columns": [
				"Factor Value[Organism]",
				"Term Source REF",
				"Term Accession Number",
				"Sample Name",
			],
			"data": {
				"Factor Value[Organism]": ["Sample", "", "", ""],
				"Term Source REF": ["", "", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
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

	count(result) == 1
}
