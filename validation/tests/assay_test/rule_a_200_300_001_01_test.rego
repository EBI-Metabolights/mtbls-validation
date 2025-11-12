# Unit tests for rule_a_200_300_001_01
package tests.assay_test
import data.metabolights.validation.v2.rules.phase2.violations as rules

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: Both 'Raw Spectral Data File' and 'Derived Spectral Data File' not in assay file.
# description: Raw data files or Derived data files must be defined in assay file.
# custom:
#  rule_id: rule_a_200_300_001_01
#  type: ERROR
#  priority: CRITICAL
#  section: assays.mass_spectrometry
test_rule_a_200_300_001_01 := true

# METADATA
# title: Both 'Raw Spectral Data File' and 'Derived Spectral Data File' are not empty.
# description: Both 'Raw Spectral Data File' and 'Derived Spectral Data File' are not empty.
test_rule_a_200_300_001_01_no_violation_01 if {
	result := rules.rule_a_200_300_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
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
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Raw Spectral Data File", "columnName": "Raw Spectral Data File", "columnIndex": 8},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Derived Spectral Data File", "columnName": "Derived Spectral Data File", "columnIndex": 9},
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
				"Raw Spectral Data File",
				"Derived Spectral Data File",
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
				"Raw Spectral Data File": ["m_Sample 1.tsv", "m_Sample 1.tsv", "m_Sample 1.tsv", "m_Sample 1.tsv"],
				"Derived Spectral Data File": ["m_Sample 1.tsv", "m_Sample 1.tsv", "m_Sample 1.tsv", "m_Sample 1.tsv"],
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
# title: Both 'Raw Spectral Data File' and 'Derived Spectral Data File' are empty.
# description: Both 'Raw Spectral Data File' and 'Derived Spectral Data File' are empty.
test_rule_a_200_300_001_01_violation_01 if {
	result := rules.rule_a_200_300_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
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
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Raw Spectral Data File", "columnName": "Raw Spectral Data File", "columnIndex": 8},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Derived Spectral Data File", "columnName": "Derived Spectral Data File", "columnIndex": 9},
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
				"Raw Spectral Data File",
				"Derived Spectral Data File",
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
				"Raw Spectral Data File": ["m_Sample 1.tsv", "m_Sample 1.tsv", "m_Sample 1.tsv", ""],
				"Derived Spectral Data File": ["m_Sample 1.tsv", "m_Sample 1.tsv", "m_Sample 1.tsv", ""],
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