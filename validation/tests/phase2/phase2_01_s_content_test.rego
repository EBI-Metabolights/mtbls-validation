package metabolights.validation.v2.phase2.tests

import rego.v1
import data.metabolights.validation.v2.phase2.violations as rules

#########################################################################################################
# rule_s_200_090_001_01
#########################################################################################################

# METADATA
# title: Values without trailing or leading spaces found in the sample file.
# description: Values without trailing or leading spaces found in the sample file.
test_rule_s_200_090_001_01_no_violation_01 if {
	result := rules.rule_s_200_090_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "ADDITIONAL_COLUMN", "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "Protocol", "columnStructure": "", "columnHeader": "Protocol REF", "columnIndex": 2},
				{"columnCategory": "Comment", "columnStructure": "", "columnHeader": "Comment[Sample]", "columnIndex": 4},
				{"columnCategory": "Factor Value", "columnStructure": "", "columnHeader": "Factor Value[Age]", "columnIndex": 5},
				{"columnCategory": "Characteristics", "columnStructure": "", "columnHeader": "Characteristics[Organism part]", "columnIndex": 8},
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Source Name", "columnIndex": 11},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 14},
			],
			"columns": [
				"Sample Name",
				"Term Source REF",
			],
			"data": {
				"Sample Name": ["1", "2", "3", "4"],
				"Term Source REF": ["Metabolite Identification", "Metabolite Identification", "Metabolite Identification", "Metabolite Identification"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}

	count(result) == 0
}

# METADATA
# title: Values with trailing or leading spaces found in the sample file.
# description: Values with trailing or leading spaces found in the sample file.
test_rule_s_200_090_001_01_violation_01 if {
	result := rules.rule_s_200_090_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "ADDITIONAL_COLUMN", "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "Protocol", "columnStructure": "", "columnHeader": "Protocol REF", "columnIndex": 2},
				{"columnCategory": "Comment", "columnStructure": "", "columnHeader": "Comment[Sample]", "columnIndex": 4},
				{"columnCategory": "Factor Value", "columnStructure": "", "columnHeader": "Factor Value[Age]", "columnIndex": 5},
				{"columnCategory": "Characteristics", "columnStructure": "", "columnHeader": "Characteristics[Organism part]", "columnIndex": 8},
				{"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Source Name", "columnIndex": 11},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name2", "columnIndex": 14},
			],
			"columns": [
				"Sample Name",
				"Term Source REF",
			],
			"data": {
				"Sample Name": ["1", "2 ", "3", " "],
				"Term Source REF": ["Metabolite Identification ", "Metabolite Identification", "Metabolite Identification", "Metabolite Identification"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 2
}

#########################################################################################################
# rule_s_200_090_002_01
#########################################################################################################

# METADATA
# title: Ontology Term Source REF of an ontology term is in the prioritised control list.
# description: Ontology Term Source REF of an ontology term is in the prioritised control list.
test_rule_s_200_090_002_01_no_violation_01 if {
	result := rules.rule_s_200_090_002_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				"Characteristics[Organism]": ["1", "2 ", "3", " "],
				"Term Source REF": ["EFO", "EFO", "MTBLS", "BTO"],
				"Term Accession Number": ["UO", "EFO", "MTBLS", "BTO"],
				"Characteristics[Variant]": ["1", "2 ", "3", " "],
				"Term Source REF.1": ["EFO", "EFO", "MTBLS", "BTO"],
				"Term Accession Number.1": ["UO", "EFO", "MTBLS", "BTO"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.controlLists.prioritisedOrganismRefSources as [
			"MTBLS",
			"EFO",
			"BTO",
		]

	count(result) == 0
}

# METADATA
# title: Ontology Term Source REF of an ontology term is not in the prioritised control list.
# description: Ontology Term Source REF of an ontology term is not in the prioritised control list.
test_rule_s_200_090_002_01_violation_01 if {
	result := rules.rule_s_200_090_002_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 2},
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism part]",
					"columnName": "Characteristics[Variant]", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismPartRefSources"},
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 5},
			],
			"columns": [
				"Characteristics[Organism]",
				"Term Source REF",
				"Term Accession Number",
				"Characteristics[Organism part]",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Characteristics[Organism]": ["1", "2 ", "3", " "],
				"Term Source REF": ["EFO", "EFO", "MTBLS", "NCBI"],
				"Term Accession Number": ["UO", "EFO", "MTBLS", "NCBI"],
				"Characteristics[Variant]": ["1", "2 ", "3", " "],
				"Term Source REF.1": ["EFO", "EFO", "MTBLS", "NCBI"],
				"Term Accession Number.1": ["UO", "EFO", "MTBLS", "NCBI"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.controlLists.prioritisedOrganismRefSources as [
			"MTBLS",
			"EFO",
			"NCBI",
		]
		with data.metabolights.validation.v2.controlLists.prioritisedOrganismPartRefSources as [
			"MTBLS",
			"EFO",
			"BTO",
		]
		
	count(result) == 1
}


#########################################################################################################
# rule_s_200_090_002_03
#########################################################################################################

# METADATA
# title: All Ontology Term Source REFs are in the source references section of i_Investigation.txt file.
# description: All Ontology Term Source REFs are in the source references section of i_Investigation.txt file.
test_rule_s_200_090_002_03_no_violation_01 if {
	result := rules.rule_s_200_090_002_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				"Characteristics[Organism]": ["1", "2 ", "3", " "],
				"Term Source REF": ["UO", "EFO", "MTBLS", "NCBITaxon"],
				"Term Accession Number": ["UO", "EFO", "MTBLS", "NCBITaxon"],
				"Characteristics[Variant]": ["1", "2 ", "3", " "],
				"Term Source REF.1": ["UO", "EFO", "MTBLS", "NCBITaxon"],
				"Term Accession Number.1": ["UO", "EFO", "MTBLS", "NCBITaxon"],
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
		with data.metabolights.validation.v2.controlLists.prioritisedDefaultTermRefSources as [
			"MTBLS",
			"EFO",
			"NCBITaxon",
			"BTO",
			"CHEBI",
			"CHMO",
			"NCIT",
			"PO",
			"UO",
		]

	count(result) == 0
}

# METADATA
# title: Values with trailing or leading spaces found in the sample file.
# description: Values with trailing or leading spaces found in the sample file.
test_rule_s_200_090_002_03_violation_01 if {
	result := rules.rule_s_200_090_002_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				"Characteristics[Organism]": ["1", "2 ", "3", " "],
				"Term Source REF": ["UO", "EFO", "MTBLS", "MTBLS"],
				"Term Accession Number": ["UO", "EFO", "MTBLS", "NCBI"],
				"Characteristics[Variant]": ["1", "2 ", "3", " "],
				"Term Source REF.1": ["UO", "EFO", "NCBI", "NCBI"],
				"Term Accession Number.1": ["UO", "EFO", "NCBI", "NCBI"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}], "ontologySourceReferences": {"references": [
			{"sourceName": "EFO"},
			{"sourceName": "UO"},
		]}},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.controlLists.prioritisedDefaultTermRefSources as ["UO", "EFO"]

	count(result) == 2
}

#########################################################################################################
# rule_s_200_090_002_04
#########################################################################################################

# METADATA
# title: All Ontology Term Source REFs are in the source references section of i_Investigation.txt file.
# description: All Ontology Term Source REFs are in the source references section of i_Investigation.txt file.
test_rule_s_200_090_002_04_no_violation_01 if {
	result := rules.rule_s_200_090_002_04 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				"Characteristics[Organism]": ["1", "2 ", "3", "6"],
				"Term Source REF": ["UO", "EFO", "MTBLS", "NCBITaxon"],
				"Term Accession Number": ["UO", "EFO", "MTBLS", "NCBITaxon"],
				"Characteristics[Variant]": ["1", "2 ", "3", "4"],
				"Term Source REF.1": ["UO", "EFO", "MTBLS", "NCBITaxon"],
				"Term Accession Number.1": ["UO", "EFO", "MTBLS", "NCBITaxon"],
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
		with data.metabolights.validation.v2.controlLists.prioritisedDefaultTermRefSources as [
			"MTBLS",
			"EFO",
			"NCBITaxon",
			"BTO",
			"CHEBI",
			"CHMO",
			"NCIT",
			"PO",
			"UO",
		]

	count(result) == 0
}

# METADATA
# title: Values with trailing or leading spaces found in the sample file.
# description: Values with trailing or leading spaces found in the sample file.
test_rule_s_200_090_002_04_violation_01 if {
	result := rules.rule_s_200_090_002_04 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				"Characteristics[Organism]": ["", "o2 ", " ", "o 2 "],
				"Term Source REF": ["UO", "EFO", "MTBLS", "MTBLS"],
				"Term Accession Number": ["UO", "EFO", "MTBLS", "NCBI"],
				"Characteristics[Variant]": ["v1", "v2 ", "v3", " "],
				"Term Source REF.1": ["UO", "EFO", "NCBI", "NCBI"],
				"Term Accession Number.1": ["UO", "EFO", "NCBI", "NCBI"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}], "ontologySourceReferences": {"references": [
			{"sourceName": "EFO"},
			{"sourceName": "UO"},
		]}},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.controlLists.prioritisedDefaultTermRefSources as ["UO", "EFO"]

	count(result) == 2
}

#########################################################################################################
# rule_s_200_090_002_05
#########################################################################################################

# METADATA
# title: Ontology Term Source REF for a unit is defined however Term Source REF is not in prioritised control list.
# description: Ontology Term Source REF for a unit is defined however Term Source REF is not in prioritised control list.
test_rule_s_200_090_002_05_no_violation_01 if {
	result := rules.rule_s_200_090_002_05 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Factor Value[Age]",
					"columnName": "Factor Value[Age]", "columnIndex": 0,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 2},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 3},
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Factor Value[Time]",
					"columnName": "Factor Value[Time]", "columnIndex": 4,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit.1", "columnIndex": 5},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 6},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 7},
			],
			"columns": [
				"Factor Value[Age]",
				"Unit",
				"Term Source REF",
				"Term Accession Number",
				"Factor Value[Time]",
				"Unit",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Factor Value[Age]": ["1", "2 ", "3", "2"],
				"Unit": ["Day", "Hour ", "Year", "Year"],
				"Term Source REF": ["UO", "EFO", "NCBI", "MTBLS"],
				"Term Accession Number": ["UO", "EFO", "NCBI", "NCBI"],
				"Factor Value[Time]": ["1", "2 ", "3", " "],
				"Term Accession Number.1": ["UO", "EFO", "MTBLS", "NCBI"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.controlLists.prioritisedUnitRefSources as [
			"UO",
			"EFO",
			"NCBI",
			"MTBLS",
		]

	count(result) == 0
}

# METADATA
# title: Ontology Term Source REF of an ontology term is not in the prioritised control list.
# description: Ontology Term Source REF of an ontology term is not in the prioritised control list.
test_rule_s_200_090_002_05_violation_01 if {
	result := rules.rule_s_200_090_002_05 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Factor Value[Age]",
					"columnName": "Factor Value[Age]", "columnIndex": 0,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 2},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 3},
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Factor Value[Time]",
					"columnName": "Factor Value[Time]", "columnIndex": 4,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit.1", "columnIndex": 5},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 6},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 7},
			],
			"columns": [
				"Factor Value[Age]",
				"Unit",
				"Term Source REF",
				"Term Accession Number",
				"Factor Value[Time]",
				"Unit",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Factor Value[Age]": ["1", "2 ", "3", "2"],
				"Unit": ["Day", "Hour ", "Year", "Year"],
				"Term Source REF": ["UO", "EFO", "NCBI", "MTBLS"],
				"Term Accession Number": ["UO", "EFO", "MTBLS", "NCBI"],
				"Factor Value[Time]": ["1", "2 ", "3", " "],
				"Term Accession Number.1": ["UO", "EFO", "MTBLS", "NCBI"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.controlLists.prioritisedUnitRefSources as [
			"UO",
			"EFO",
			"NCBI",
		]

	count(result) == 1
}

#########################################################################################################
# rule_s_200_090_002_06
#########################################################################################################

# METADATA
# title: Ontology Term Source REF is not defined for a empty unit ontology term.
# description: Ontology Term Source REF is not defined for a empty unit ontology term.
test_rule_s_200_090_002_06_no_violation_01 if {
	result := rules.rule_s_200_090_002_06 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Factor Value[Age]",
					"columnName": "Factor Value[Age]", "columnIndex": 0,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 2},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 3},
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Factor Value[Time]",
					"columnName": "Factor Value[Time]", "columnIndex": 4,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit.1", "columnIndex": 5},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 6},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 7},
			],
			"columns": [
				"Factor Value[Age]",
				"Unit",
				"Term Source REF",
				"Term Accession Number",
				"Factor Value[Time]",
				"Unit",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Factor Value[Age]": ["1", "2 ", "3", "2"],
				"Unit": ["Day", "Hour ", "Year", "Year"],
				"Term Source REF": ["UO", "EFO", "NCBI", "MTBLS"],
				"Term Accession Number": ["UO", "EFO", "NCBI", "NCBI"],
				"Factor Value[Time]": ["1", "2 ", "3", " "],
				"Term Accession Number.1": ["UO", "EFO", "MTBLS", "NCBI"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.controlLists.prioritisedUnitRefSources as [
			"UO",
			"EFO",
			"NCBI",
			"MTBLS",
		]

	count(result) == 0
}

# METADATA
# title: Ontology Term Source REF is defined for a empty unit ontology term.
# description: Ontology Term Source REF is defined for a empty unit ontology term.
test_rule_s_200_090_002_06_violation_01 if {
	result := rules.rule_s_200_090_002_06 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Factor Value[Age]",
					"columnName": "Factor Value[Age]", "columnIndex": 0,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 2},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 3},
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Factor Value[Time]",
					"columnName": "Factor Value[Time]", "columnIndex": 4,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit.1", "columnIndex": 5},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 6},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 7},
			],
			"columns": [
				"Factor Value[Age]",
				"Unit",
				"Term Source REF",
				"Term Accession Number",
				"Factor Value[Time]",
				"Unit.1",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Factor Value[Age]": ["1", "2 ", "3", "2"],
				"Unit": ["Year", "Year ", "Year", "Data"],
				"Term Source REF": ["UO", "EFO", "NCBI", "MTBLS"],
				"Term Accession Number": ["UO", "EFO", "MTBLS", "NCBI"],
				"Factor Value[Time]": ["1", "2 ", "3", " "],
				"Unit.1": ["Day", "  ", "", "Year"],
				"Term Source REF.1": ["UO", "EFO", "", " "],
				"Term Accession Number.1": ["UO", "EFO", "MTBLS", "NCBI"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.controlLists.prioritisedUnitRefSources as [
			"UO",
			"EFO",
			"NCBI",
			"MTBLS",
		]

	count(result) == 1
}

#########################################################################################################
# rule_s_200_090_003_01
#########################################################################################################

# METADATA
# title: Term Accession Number length of an ontology term is equal or greater than 3 in sample file.
# description: Term Accession Number length of an ontology term is equal or greater than 3 in sample file.
test_rule_s_200_090_003_01_no_violation_01 if {
	result := rules.rule_s_200_090_003_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				"Characteristics[Organism]": ["1", "2 ", "3", "6"],
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

	count(result) == 0
}

# METADATA
# title: Term Accession Number length of an ontology term is less than 3 in sample file.
# description: Term Accession Number length of an ontology term is less than 3 in sample file.
test_rule_s_200_090_003_01_violation_01 if {
	result := rules.rule_s_200_090_003_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				"Characteristics[Organism]": ["1", "2 ", "3", "6"],
				"Term Source REF": ["UO", "EFO", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
				"Characteristics[Variant]": ["1", "2 ", "3", "4"],
				"Term Source REF.1": ["UO", "", "MTBLS", "NCBITaxon"],
				"Term Accession Number.1": ["UO", "", "MTBLS", "NCBITaxon"],
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
		with data.metabolights.validation.v2.controlLists.prioritisedUnitRefSources as [
			"UO",
			"EFO",
			"NCBI",
		]

	count(result) == 1
}

#########################################################################################################
# rule_s_200_090_003_02
#########################################################################################################

# METADATA
# title: Term Source REF of a unit ontology term is not empty.
# description: Term Source REF of a unit ontology term is not empty.
test_rule_s_200_090_003_02_no_violation_01 if {
	result := rules.rule_s_200_090_003_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Factor Value[Age]",
					"columnName": "Factor Value[Age]", "columnIndex": 0,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 2},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 3},
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Factor Value[Time]",
					"columnName": "Factor Value[Time]", "columnIndex": 4,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit.1", "columnIndex": 5},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 6},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 7},
			],
			"columns": [
				"Factor Value[Age]",
				"Unit",
				"Term Source REF",
				"Term Accession Number",
				"Factor Value[Time]",
				"Unit",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Factor Value[Age]": ["1", "2 ", "3", "2"],
				"Unit": ["Day", "Hour ", "Year", "Year"],
				"Term Source REF": ["UO", "EFO", "NCBI", "MTBLS"],
				"Term Accession Number": ["UOA", "EFO", "NCBI", "NCBI"],
				"Factor Value[Time]": ["1", "2 ", "3", " "],
				"Term Accession Number.1": ["UOA", "EFO", "MTBLS", "NCBI"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.controlLists.prioritisedUnitRefSources as [
			"UO",
			"EFO",
			"NCBI",
			"MTBLS",
		]

	count(result) == 0
}

# METADATA
# title: Term Accession Number length of a unit ontology term is less than 3 in sample file.
# description: Term Accession Number length of a unit ontology term is less than 3 in sample file.
test_rule_s_200_090_003_02_violation_01 if {
	result := rules.rule_s_200_090_003_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Factor Value[Age]",
					"columnName": "Factor Value[Age]", "columnIndex": 0,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 2},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 3},
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Factor Value[Time]",
					"columnName": "Factor Value[Time]", "columnIndex": 4,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit.1", "columnIndex": 5},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 6},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 7},
			],
			"columns": [
				"Factor Value[Age]",
				"Unit",
				"Term Source REF",
				"Term Accession Number",
				"Factor Value[Time]",
				"Unit.1",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Factor Value[Age]": ["1", "2 ", "3", "2"],
				"Unit": ["Year", "Year ", "Year", "Data"],
				"Term Source REF": ["", "EFO", "NCBI", "MTBLS"],
				"Term Accession Number": ["UOF", "EFO", "MTBLS", "NCBI"],
				"Factor Value[Time]": ["1", "2 ", "3", " "],
				"Unit.1": ["Day", "  ", "Hour", "Year"],
				"Term Source REF.1": ["UO", "EFO", "", " "],
				"Term Accession Number.1": ["UO", "EFO", "MTBLS", "NCBI"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.controlLists.prioritisedUnitRefSources as [
			"UO",
			"EFO",
			"NCBI",
			"MTBLS",
		]

	count(result) == 1
}

#########################################################################################################
# rule_s_200_090_003_03
#########################################################################################################

# METADATA
# title: Term Accession Number is defined for an empty ontology term.
# description: Term Accession Number is defined for an empty ontology term.
test_rule_s_200_090_003_03_no_violation_01 if {
	result := rules.rule_s_200_090_003_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				"Characteristics[Organism]": ["1", "2 ", "3", "6"],
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

	count(result) == 0
}

# METADATA
# title: Term Accession Number is defined for an empty ontology term.
# description: Term Accession Number is defined for an empty ontology term.
test_rule_s_200_090_003_03_violation_01 if {
	result := rules.rule_s_200_090_003_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				"Characteristics[Organism]": ["1", "2 ", "3", "6"],
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
		with data.metabolights.validation.v2.controlLists.prioritisedUnitRefSources as [
			"UO",
			"EFO",
			"NCBI",
		]

	count(result) == 1
}

#########################################################################################################
# rule_s_200_090_003_04
#########################################################################################################

# METADATA
# title: Term Accession Number is defined for an empty unit ontology term.
# description: Term Accession Number is defined for an empty unit ontology term.
test_rule_s_200_090_003_04_no_violation_01 if {
	result := rules.rule_s_200_090_003_04 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Factor Value[Age]",
					"columnName": "Factor Value[Age]", "columnIndex": 0,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 2},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 3},
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Factor Value[Time]",
					"columnName": "Factor Value[Time]", "columnIndex": 4,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit.1", "columnIndex": 5},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 6},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 7},
			],
			"columns": [
				"Factor Value[Age]",
				"Unit",
				"Term Source REF",
				"Term Accession Number",
				"Factor Value[Time]",
				"Unit",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Factor Value[Age]": ["1", "2 ", "3", "2"],
				"Unit": ["", "Hour ", "Year", "Year"],
				"Term Source REF": ["UO", "EFO", "NCBI", "MTBLS"],
				"Term Accession Number": ["UOA", "EFO", "NCBI", "NCBI"],
				"Factor Value[Time]": ["1", "2 ", "3", ""],
				"Term Accession Number.1": ["UOA", "EFO", "MTBLS", "NCBI"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.controlLists.prioritisedUnitRefSources as [
			"UO",
			"EFO",
			"NCBI",
			"MTBLS",
		]

	count(result) == 0
}

# METADATA
# title: Term Accession Number is defined for an empty unit ontology term.
# description: Term Accession Number is defined for an empty unit ontology term.
test_rule_s_200_090_003_04_violation_01 if {
	result := rules.rule_s_200_090_003_04 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Factor Value[Age]",
					"columnName": "Factor Value[Age]", "columnIndex": 0,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 2},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 3},
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Factor Value[Time]",
					"columnName": "Factor Value[Time]", "columnIndex": 4,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit.1", "columnIndex": 5},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 6},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 7},
			],
			"columns": [
				"Factor Value[Age]",
				"Unit",
				"Term Source REF",
				"Term Accession Number",
				"Factor Value[Time]",
				"Unit.1",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Factor Value[Age]": ["1", "2 ", "3", "2"],
				"Unit": ["Year", "Year ", "Year", "Data"],
				"Term Source REF": ["EFO", "EFO", "NCBI", "MTBLS"],
				"Term Accession Number": ["UOF", "EFO", "MTBLS", "NCBI"],
				"Factor Value[Time]": ["", " ", "3", " "],
				"Unit.1": ["Day", "  ", "Hour", "Year"],
				"Term Source REF.1": ["UO", "EFO", "", " "],
				"Term Accession Number.1": ["EFO", "EFO", "MTBLS", "NCBI"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.controlLists.prioritisedUnitRefSources as [
			"UO",
			"EFO",
			"NCBI",
			"MTBLS",
		]

	count(result) == 1
}

#########################################################################################################
# rule_s_200_090_004_01
#########################################################################################################

# METADATA
# title: There is no empty value in the required column.
# description: There is no empty value in the required column.
test_rule_s_200_090_004_01_no_violation_01 if {
	result := rules.rule_s_200_090_004_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "Basic", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Source Name", "columnName": "Source Name",  "columnIndex": 0},
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]", "columnIndex": 1,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 2},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 3},
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Variant]",
					"columnName": "Characteristics[Variant]", "columnIndex": 4,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex":5},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 6},
			],
			"columns": [
				"Source Name",
				"Characteristics[Organism]",
				"Term Source REF",
				"Term Accession Number",
				"Characteristics[Variant]",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Source Name": ["Source 1", "Source 2", "Source 3", "Source 4"],
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
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.templates.sampleFileHeaderTemplates as { "minimum":  [{
			"version": "2.0",
			"headers": [
				{
						"columnStructure": "SINGLE_COLUMN",
						"columnCategory": "Basic",
						"columnHeader": "Source Name",
						"columnPrefix": "",
						"controlLists": null,
						"defaultColumnIndex": 0,
						"defaultValue": null,
						"maxLength": 128,
						"minLength": 3,
						"required": true
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Organism]",
					"columnPrefix": "Characteristics",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 5,
					"required": true,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Variant]",
					"columnPrefix": "Characteristics",
					"controlLists": null,
					"defaultColumnIndex": 7,
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
# title: Empty value is found in the required column.
# description: Empty value is found in the required column.
test_rule_s_200_090_004_01_violation_01 if {
	result := rules.rule_s_200_090_004_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "Basic", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Source Name", "columnName": "Source Name",  "columnIndex": 0},
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]", "columnIndex": 1,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 2},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 3},
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Variant]",
					"columnName": "Characteristics[Variant]", "columnIndex": 4,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 5},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 6},
			],
			"columns": [
				"Source Name",
				"Characteristics[Organism]",
				"Term Source REF",
				"Term Accession Number",
				"Characteristics[Variant]",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Source Name": ["1xx", "122", "", ""],
				"Characteristics[Organism]": ["1", "2 ", "", ""],
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
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.templates.sampleFileHeaderTemplates as { "minimum":  [{
			"version": "2.0",
			"headers": [
				{
						"columnStructure": "SINGLE_COLUMN",
						"columnCategory": "Basic",
						"columnHeader": "Source Name",
						"columnPrefix": "",
						"controlLists": null,
						"defaultColumnIndex": 0,
						"defaultValue": null,
						"maxLength": 128,
						"minLength": 3,
						"required": true
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Organism]",
					"columnPrefix": "Characteristics",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 5,
					"required": true,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Variant]",
					"columnPrefix": "Characteristics",
					"controlLists": null,
					"defaultColumnIndex": 7,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
			],
		}]}
	count(result) == 2
}

#########################################################################################################
# rule_s_200_090_004_02
#########################################################################################################

# METADATA
# title: Value is not less than minimum length requirement.
# description: Value is not less than minimum length requirement.
test_rule_s_200_090_004_02_no_violation_01 if {
	result := rules.rule_s_200_090_004_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				"Characteristics[Organism]": ["sample", "mus musculus ", "homo sapiens", "sapiens"],
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
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.templates.sampleFileHeaderTemplates as  { "minimum": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Organism]",
					"columnPrefix": "Characteristics",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 5,
					"required": true,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Variant]",
					"columnPrefix": "Characteristics",
					"controlLists": null,
					"defaultColumnIndex": 7,
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
test_rule_s_200_090_004_02_violation_01 if {
	result := rules.rule_s_200_090_004_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				"Characteristics[Organism]": ["1", "2 ", "", "1234"],
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
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.templates.sampleFileHeaderTemplates as  { "minimum": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Organism]",
					"columnPrefix": "Characteristics",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 5,
					"required": true,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Variant]",
					"columnPrefix": "Characteristics",
					"controlLists": null,
					"defaultColumnIndex": 7,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
			],
		}]}
	count(result) == 1
}

#########################################################################################################
# rule_s_200_090_004_03
#########################################################################################################

# METADATA
# title: Value is not greater than max length requirement.
# description: Value is not greater than max length requirement.
test_rule_s_200_090_004_03_no_violation_01 if {
	result := rules.rule_s_200_090_004_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				"Characteristics[Organism]": ["sample", "mus musculus ", "homo sapiens", "sapiens"],
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
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.templates.sampleFileHeaderTemplates as { "minimum": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Organism]",
					"columnPrefix": "Characteristics",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 5,
					"required": true,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Variant]",
					"columnPrefix": "Characteristics",
					"controlLists": null,
					"defaultColumnIndex": 7,
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
# title: Value is greater than maximum length requirement.
# description: Value is greater than maximum length requirement.
test_rule_s_200_090_004_03_violation_01 if {
	result := rules.rule_s_200_090_004_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				"Characteristics[Organism]": ["1", "2 ", "", "1234"],
				"Term Source REF": ["UO", "EFO", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
				"Characteristics[Variant]": ["Sample Value 123", "Test Value", "Exceptional Case is", ""],
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
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.templates.sampleFileHeaderTemplates as { "minimum": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Organism]",
					"columnPrefix": "Characteristics",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 5,
					"required": true,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Variant]",
					"columnPrefix": "Characteristics",
					"controlLists": null,
					"defaultColumnIndex": 7,
					"defaultValue": null,
					"maxLength": 10,
					"minLength": 0,
					"required": false,
				},
			],
		}]}

	count(result) == 1
}

#########################################################################################################
# rule_s_200_090_005_01
#########################################################################################################

# METADATA
# title: All values are valid in Protocol REF column.
# description: All values are valid in Protocol REF column.
test_rule_s_200_090_005_01_no_violation_01 if {
	result := rules.rule_s_200_090_005_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF", "columnIndex": 6},
			],
			"columns": [
				"Characteristics[Organism]",
				"Term Source REF",
				"Term Accession Number",
				"Characteristics[Variant]",
				"Term Source REF.1",
				"Term Accession Number.1",
				"Protocol REF",
			],
			"data": {
				"Characteristics[Organism]": ["1", "2 ", "", "1234"],
				"Term Source REF": ["UO", "EFO", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
				"Characteristics[Variant]": ["Sample Value 123", "Test Value", "Exceptional Case is", ""],
				"Term Source REF.1": ["UO", "Sam", "MTBLS", "NCBITaxon"],
				"Term Accession Number.1": ["UO", "MTBLS", "MTBLS", "NCBITaxon"],
				"Protocol REF": ["Sample collection", "Sample collection", "Sample collection", "Sample collection"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}], "ontologySourceReferences": {"references": [
			{"sourceName": "EFO"},
			{"sourceName": "UO"},
			{"sourceName": "MTBLS"},
			{"sourceName": "NCBITaxon"},
		]}},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
	count(result) == 0
}

# METADATA
# title: There are invalid values in Protocol REF column.
# description: There are invalid values in Protocol REF column.
test_rule_s_200_090_005_01_violation_01 if {
	result := rules.rule_s_200_090_005_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF", "columnIndex": 6},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF.1", "columnIndex": 7},
			],
			"columns": [
				"Characteristics[Organism]",
				"Term Source REF",
				"Term Accession Number",
				"Characteristics[Variant]",
				"Term Source REF.1",
				"Term Accession Number.1",
				"Protocol REF",
				"Protocol REF.1",
			],
			"data": {
				"Characteristics[Organism]": ["1", "2 ", "", "1234"],
				"Term Source REF": ["UO", "EFO", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
				"Characteristics[Variant]": ["Sample Value 123", "Test Value", "Exceptional Case is", ""],
				"Term Source REF.1": ["UO", "Sam", "MTBLS", "NCBITaxon"],
				"Term Accession Number.1": ["UO", "MTBLS", "MTBLS", "NCBITaxon"],
				"Protocol REF": ["Extraction", "Extraction", "Extraction", "Extraction"],
				"Protocol REF.1": ["Extraction", "  ", "Metabolite identification", "Mass spectrometry"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}], "ontologySourceReferences": {"references": [
			{"sourceName": "EFO"},
			{"sourceName": "UO"},
			{"sourceName": "MTBLS"},
			{"sourceName": "NCBITaxon"},
		]}},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		
	count(result) == 1
}

#########################################################################################################
# rule_s_200_090_006_01
#########################################################################################################

# METADATA
# title: Organism name is an ontology term.
# description: Organism name is not an ontology term.
test_rule_s_200_090_006_01_no_violation_01 if {
	result := rules.rule_s_200_090_006_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
		with data.metabolights.validation.v2.templates.sampleFileHeaderTemplates as { "minimum": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Organism]",
					"columnPrefix": "Characteristics",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 5,
					"required": true,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Variant]",
					"columnPrefix": "Characteristics",
					"controlLists": null,
					"defaultColumnIndex": 7,
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
test_rule_s_200_090_006_01_violation_01 if {
	result := rules.rule_s_200_090_006_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
		with data.metabolights.validation.v2.templates.sampleFileHeaderTemplates as { "minimum": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Organism]",
					"columnPrefix": "Characteristics",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 5,
					"required": true,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Variant]",
					"columnPrefix": "Characteristics",
					"controlLists": null,
					"defaultColumnIndex": 7,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
			],
		}]}
	count(result) == 1
}

#########################################################################################################
# rule_s_200_100_002_01
#########################################################################################################

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
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
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
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
	count(result) == 1
}

#########################################################################################################
# rule_s_200_100_002_02
#########################################################################################################

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
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.phase2.definitions._SAMPLES_DEFAULT_CHARACTERISTICS_HEADERS as [
        "Characteristics[Sample type]",
	]

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
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
	with data.metabolights.validation.v2.phase2.definitions._SAMPLES_DEFAULT_CHARACTERISTICS_HEADERS as [
        "Characteristics[Organism]",
        "Characteristics[Sample type]",
	]
	count(result) == 1
}


#########################################################################################################
# rule_s_200_100_002_04
#########################################################################################################

# METADATA
# title: Term Source REF of the user defined characteristics ontology term is not empty.
# description: Term Source REF of the user defined characteristics ontology term is not empty.
test_rule_s_200_100_002_04_no_violation_01 if {
	result := rules.rule_s_200_100_002_04 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
		with data.metabolights.validation.v2.templates.sampleFileHeaderTemplates as { "minimum": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Organism]",
					"columnPrefix": "Characteristics",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 5,
					"required": true,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Sample type]",
					"columnPrefix": "Characteristics",
					"controlLists": null,
					"defaultColumnIndex": 7,
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
# title: Term Source REF of the user defined characteristics ontology term is empty.
# description: Term Source REF of the user defined characteristics ontology term is empty.
test_rule_s_200_100_002_04_violation_01 if {
	result := rules.rule_s_200_100_002_04 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				"Term Accession Number.1": ["", "", "", "NCBITaxon"],
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
		with data.metabolights.validation.v2.templates.sampleFileHeaderTemplates as { "minimum": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Organism]",
					"columnPrefix": "Characteristics",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 5,
					"required": true,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Sample type]",
					"columnPrefix": "Characteristics",
					"controlLists": null,
					"defaultColumnIndex": 7,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
			],
		}]}

	count(result) == 1
}

#########################################################################################################
# rule_s_200_200_001_01
#########################################################################################################

# METADATA
# title: Sample name values are unique in the sample file.
# description: Sample name values are unique in the sample file.
test_rule_s_200_200_001_01_no_violation_01 if {
	result := rules.rule_s_200_200_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"], "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				"Sample Name",
			],
			"data": {
				"Characteristics[Organism]": ["samplex", "mus musculus ", "homo sapiens", "sapiens"],
				"Term Source REF": ["UO", "EFO", "MTBLS", "NCBITaxon"],
				"Term Accession Number": ["https://", "EFO", "MTBLS", "NCBITaxon"],
				"Characteristics[Variant]": ["1", "2 ", "3", "4"],
				"Term Source REF.1": ["UO", "EFO", "MTBLS", "NCBITaxon"],
				"Term Accession Number.1": ["https://", "EFO", "MTBLS", "NCBITaxon"],
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
# title: Sample name values are not unique in the sample file.
# description: Sample name values are not unique in the sample file.
test_rule_s_200_200_001_01_violation_01 if {
	result := rules.rule_s_200_200_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 1 ", "Sample 3", "Sample 4"], "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				"Sample Name",
			],
			"data": {
				"Characteristics[Organism]": ["samplex", "mus musculus ", "homo sapiens", "sapiens"],
				"Term Source REF": ["UO", "EFO", "MTBLS", "NCBITaxon"],
				"Term Accession Number": ["https://", "EFO", "MTBLS", "NCBITaxon"],
				"Characteristics[Variant]": ["1", "2 ", "3", "4"],
				"Term Source REF.1": ["UO", "EFO", "MTBLS", "NCBITaxon"],
				"Term Accession Number.1": ["https://", "EFO", "MTBLS", "NCBITaxon"],
				"Sample Name": ["https://", "EFO", "MTBLS", "NCBITaxon"],
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

#########################################################################################################
# rule_s_200_200_001_02
#########################################################################################################

# METADATA
# title: Sample names are referenced in any assay file.
# description: Sample names are referenced in any assay file.
test_rule_s_200_200_001_02_no_violation_01 if {
	result := rules.rule_s_200_200_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_x.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 1 ", "Sample 3", "Sample 4"], "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnName": "Sample Name", "columnIndex": 6},
			],
			"columns": [
				"Characteristics[Organism]",
				"Term Source REF",
				"Term Accession Number",
				"Characteristics[Variant]",
				"Term Source REF.1",
				"Term Accession Number.1",
				"Sample Name",
			],
			"data": {
				"Characteristics[Organism]": ["rat", "mouse", "unk:nown", "und:efined"],
				"Term Source REF": ["UO", "EFO", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
				"Characteristics[Variant]": ["1", " ", "2", ""],
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
		with data.metabolights.validation.v2.templates.sampleFileHeaderTemplates as { "minimum": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Organism]",
					"columnPrefix": "Characteristics",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 5,
					"required": true,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Sample type]",
					"columnPrefix": "Characteristics",
					"controlLists": null,
					"defaultColumnIndex": 7,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
				{
					"columnStructure": "SINGLE_COLUMN",
					"columnCategory": "",
					"columnHeader": "Sample Name",
					"columnPrefix": "",
					"controlLists": null,
					"defaultColumnIndex": 7,
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
# title: Sample names are not referenced in any assay file.
# description: Sample names are not referenced in any assay file.
test_rule_s_200_200_001_02_violation_01 if {
	result := rules.rule_s_200_200_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_x.txt": {"sampleNames": ["Sample 1", "Sample 1 ", "Sample 3", "Sample 5"]}},
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 1 ", "Sample 3", "Sample 2"], "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnName": "Sample Name", "columnIndex": 6},
			],
			"columns": [
				"Characteristics[Organism]",
				"Term Source REF",
				"Term Accession Number",
				"Characteristics[Variant]",
				"Term Source REF.1",
				"Term Accession Number.1",
				"Sample Name",
			],
			"data": {
				"Characteristics[Organism]": ["rat", "mouse", "unk:nown", "und:efined"],
				"Term Source REF": ["UO", "EFO", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
				"Characteristics[Variant]": ["1", " ", "2", ""],
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
		with data.metabolights.validation.v2.templates.sampleFileHeaderTemplates as { "minimum": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Organism]",
					"columnPrefix": "Characteristics",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 5,
					"required": true,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Sample type]",
					"columnPrefix": "Characteristics",
					"controlLists": null,
					"defaultColumnIndex": 7,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
				{
					"columnStructure": "SINGLE_COLUMN",
					"columnCategory": "",
					"columnHeader": "Sample Name",
					"columnPrefix": "",
					"controlLists": null,
					"defaultColumnIndex": 7,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
			],
		}]}
	count(result) == 1
}

#########################################################################################################
# rule_s_200_200_002_01
#########################################################################################################

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
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
		with data.metabolights.validation.v2.templates.sampleFileHeaderTemplates as { "minimum": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Organism]",
					"columnPrefix": "Characteristics",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 5,
					"required": true,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Sample type]",
					"columnPrefix": "Characteristics",
					"controlLists": null,
					"defaultColumnIndex": 7,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
				{
					"columnStructure": "SINGLE_COLUMN",
					"columnCategory": "",
					"columnHeader": "Sample Name",
					"columnPrefix": "",
					"controlLists": null,
					"defaultColumnIndex": 7,
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
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
		with data.metabolights.validation.v2.templates.sampleFileHeaderTemplates as { "minimum": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Organism]",
					"columnPrefix": "Characteristics",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 5,
					"required": true,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Factor Value",
					"columnHeader": "Factor Value[Sample type]",
					"columnPrefix": "Factor Value",
					"controlLists": null,
					"defaultColumnIndex": 7,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
				{
					"columnStructure": "SINGLE_COLUMN",
					"columnCategory": "",
					"columnHeader": "Sample Name",
					"columnPrefix": "",
					"controlLists": null,
					"defaultColumnIndex": 7,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
			],
		}]}
	count(result) == 1
}

#########################################################################################################
# rule_s_200_200_003_01
#########################################################################################################

# METADATA
# title: Term Source REFs of the factor ontology term is in the prioritised control list.
# description: Term Source REFs of the factor ontology term is in the prioritised control list.
test_rule_s_200_200_003_01_no_violation_01 if {
	result := rules.rule_s_200_200_003_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_x.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 1 ", "Sample 3", "Sample 4"], "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
		with data.metabolights.validation.v2.templates.sampleFileHeaderTemplates as { "minimum": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Organism]",
					"columnPrefix": "Characteristics",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 5,
					"required": true,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Sample type]",
					"columnPrefix": "Characteristics",
					"controlLists": null,
					"defaultColumnIndex": 7,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
				{
					"columnStructure": "SINGLE_COLUMN",
					"columnCategory": "",
					"columnHeader": "Sample Name",
					"columnPrefix": "",
					"controlLists": null,
					"defaultColumnIndex": 7,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
			],
		}]}
		with data.metabolights.validation.v2.controlLists.prioritisedStudyFactorRefSources as ["MTBLS", "NCBITaxon"]

	count(result) == 0
}

# METADATA
# title: Term Source REFs of the factor ontology term is not in the prioritised control list.
# description: Term Source REFs of the factor ontology term is not in the prioritised control list.
test_rule_s_200_200_003_01_violation_01 if {
	result := rules.rule_s_200_200_003_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_x.txt": {"sampleNames": ["Sample 1", "Sample 1 ", "Sample 3", "Sample 5"]}},
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 1 ", "Sample 3", "Sample 2"], "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Characteristics", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Characteristics[Organism]",
					"columnName": "Characteristics[Organism]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				"Factor Value[Sample type]": ["Data", "Value", "2", "Test"],
				"Term Source REF.1": ["MTBLS", "Sam", "UO", "NCBITaxon"],
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
		with data.metabolights.validation.v2.templates.sampleFileHeaderTemplates as { "minimum": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Characteristics",
					"columnHeader": "Characteristics[Organism]",
					"columnPrefix": "Characteristics",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 5,
					"required": true,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Factor Value",
					"columnHeader": "Factor Value[Sample type]",
					"columnPrefix": "Factor Value",
					"controlLists": null,
					"defaultColumnIndex": 7,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
				{
					"columnStructure": "SINGLE_COLUMN",
					"columnCategory": "",
					"columnHeader": "Sample Name",
					"columnPrefix": "",
					"controlLists": null,
					"defaultColumnIndex": 7,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
			],
		}]}
		with data.metabolights.validation.v2.controlLists.prioritisedStudyFactorRefSources as ["MTBLS", "NCBITaxon"]
	count(result) == 1
}

#########################################################################################################
# rule_s_200_200_002_02
#########################################################################################################

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
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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