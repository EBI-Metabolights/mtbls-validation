#########################################################################################################
# Unit tests for rule_a_200_400_001_01
#########################################################################################################
package tests.assay_test

import data.metabolights.validation.v2.rules.phase2.violations as rules

import rego.v1

# METADATA
# title: Derived Spectral Data Files, Acquisition Parameter Data File and Free Induction Decay Data File values are empty in NMR assays.
# description: At least one file should be defined in Derived Spectral Data Files, Free Induction Decay Data File or Acquisition Parameter Data File columns.
# custom:
#  rule_id: rule_a_200_400_001_01
#  type: ERROR
#  priority: CRITICAL
#  section: assays.nmr_assay
rule_a_200_400_001_01_test_cases := 1

# METADATA
# title: Derived Spectral Data File, Acquisition Parameter Data File and Free Induction Decay Data File are not empty for NMR assay file.
# description: Derived Spectral Data File, Acquisition Parameter Data File and Free Induction Decay Data File are not empty for NMR assay file.
test_rule_a_200_400_001_01_no_violation_01 if {
	result := rules.rule_a_200_400_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "NMR", "mainTechnique": "NMR"}, "table": {
			"rowOffset": 0, "totalRowCount": 4, "rowCount": 4,
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
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF", "columnIndex": 6},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF.1", "columnIndex": 7},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Derived Spectral Data File", "columnName": "Derived Spectral Data File", "columnIndex": 8},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Acquisition Parameter Data File", "columnName": "Acquisition Parameter Data File", "columnIndex": 9},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Acquisition Parameter Data File", "columnName": "Acquisition Parameter Data File", "columnIndex": 10},
			],
			"columns": [
				"Parameter Value[Instrument]",
				"Term Source REF",
				"Term Accession Number",
				"Parameter Value[Column model]",
				"Term Source REF.1",
				"Term Accession Number.1",
				"Protocol REF",
				"Protocol REF.1",
				"Derived Spectral Data File",
				"Acquisition Parameter Data File",
				"Free Induction Decay Data File",
			],
			"data": {
				"Parameter Value[Instrument]": ["1", "2 ", "", "1234"],
				"Term Source REF": ["UO", "EFO", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
				"Parameter Value[Column model]": ["Sample Value 123", "Test Value", "Exceptional Case is", ""],
				"Term Source REF.1": ["UO", "Sam", "MTBLS", "NCBITaxon"],
				"Term Accession Number.1": ["UO", "MTBLS", "MTBLS", "NCBITaxon"],
				"Protocol REF": ["Extraction", "Extraction", "Extraction", "Extraction"],
				"Protocol REF.1": ["Extraction", "  ", "Metabolite identification", "Mass spectrometry"],
				"Derived Spectral Data File": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"],
				"Acquisition Parameter Data File": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"],
				"Free Induction Decay Data File": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"],
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
# title: Derived Spectral Data File, Acquisition Parameter Data File and Free Induction Decay Data File are empty for NMR assay file.
# description: Derived Spectral Data File, Acquisition Parameter Data File and Free Induction Decay Data File are empty for NMR assay file.
test_rule_a_200_400_001_01_violation_01 if {
	result := rules.rule_a_200_400_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "NMR", "mainTechnique": "NMR"}, "table": {
			"rowOffset": 0, "totalRowCount": 4, "rowCount": 4,
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
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF", "columnIndex": 6},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF.1", "columnIndex": 7},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Derived Spectral Data File", "columnName": "Derived Spectral Data File", "columnIndex": 8},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Acquisition Parameter Data File", "columnName": "Acquisition Parameter Data File", "columnIndex": 9},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Acquisition Parameter Data File", "columnName": "Acquisition Parameter Data File", "columnIndex": 10},
			],
			"columns": [
				"Parameter Value[Instrument]",
				"Term Source REF",
				"Term Accession Number",
				"Parameter Value[Column model]",
				"Term Source REF.1",
				"Term Accession Number.1",
				"Protocol REF",
				"Protocol REF.1",
				"Derived Spectral Data File",
				"Acquisition Parameter Data File",
				"Free Induction Decay Data File",
			],
			"data": {
				"Parameter Value[Instrument]": ["1", "2 ", "", "1234"],
				"Term Source REF": ["UO", "EFO", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
				"Parameter Value[Column model]": ["Sample Value 123", "Test Value", "Exceptional Case is", ""],
				"Term Source REF.1": ["UO", "Sam", "MTBLS", "NCBITaxon"],
				"Term Accession Number.1": ["UO", "MTBLS", "MTBLS", "NCBITaxon"],
				"Protocol REF": ["Extraction", "Extraction", "Extraction", "Extraction"],
				"Protocol REF.1": ["Extraction", "  ", "Metabolite identification", "Mass spectrometry"],
				"Derived Spectral Data File": ["Sample 1", "Sample 2", "", "Sample 4"],
				"Acquisition Parameter Data File": ["Sample 1", "Sample 2", "", "Sample 4"],
				"Free Induction Decay Data File": ["Sample 1", "Sample 2", "", "Sample 4"],
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
