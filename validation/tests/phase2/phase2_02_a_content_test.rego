package metabolights.validation.v2.rules.phase2.tests

import data.metabolights.validation.v2.rules.phase2.violations as rules
import rego.v1

#########################################################################################################
# rule_a_200_090_001_01
#########################################################################################################

# METADATA
# title: Values without trailing or leading spaces found in the assay file.
# description: Values without trailing or leading spaces found in the assay file.
test_rule_a_200_090_001_01_no_violation_01 if {
	result := rules.rule_a_200_090_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "ADDITIONAL_COLUMN", "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "Protocol", "columnStructure": "", "columnHeader": "Protocol REF", "columnIndex": 2},
				{"columnCategory": "Comment", "columnStructure": "", "columnHeader": "Comment[Sample]", "columnIndex": 4},
				{"columnCategory": "Parameter Value", "columnStructure": "", "columnHeader": "Parameter Value[Age]", "columnIndex": 5},
				{"columnCategory": "Parameter Value", "columnStructure": "", "columnHeader": "Parameter Value[Instrument]", "columnIndex": 8},
				{"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Source Name", "columnIndex": 11},
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
# title: Values with trailing or leading spaces found in the assay file.
# description: Values with trailing or leading spaces found in the assay file.
test_rule_a_200_090_001_01_violation_01 if {
	result := rules.rule_a_200_090_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "ADDITIONAL_COLUMN", "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "Protocol", "columnStructure": "", "columnHeader": "Protocol REF", "columnIndex": 2},
				{"columnCategory": "Comment", "columnStructure": "", "columnHeader": "Comment[Sample]", "columnIndex": 4},
				{"columnCategory": "Parameter Value", "columnStructure": "", "columnHeader": "Parameter Value[Age]", "columnIndex": 5},
				{"columnCategory": "Parameter Value", "columnStructure": "", "columnHeader": "Parameter Value[Instrument]", "columnIndex": 8},
				{"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Source Name", "columnIndex": 11},
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
# rule_a_200_090_002_01
#########################################################################################################

# METADATA
# title: Ontology Term Source REF of an ontology term is in the prioritised control list.
# description: Ontology Term Source REF of an ontology term is in the prioritised control list.
test_rule_a_200_090_002_01_no_violation_01 if {
	result := rules.rule_a_200_090_002_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Chromatography Instrument]",
					"columnName": "Parameter Value[Chromatography Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 2},
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Detector]",
					"columnName": "Parameter Value[Detector]", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 5},
			],
			"columns": [
				"Parameter Value[Chromatography Instrument]",
				"Term Source REF",
				"Term Accession Number",
				"Parameter Value[Detector]",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Parameter Value[Chromatography Instrument]": ["1", "2 ", "3", " "],
				"Term Source REF": ["EFO", "EFO", "MTBLS", "BTO"],
				"Term Accession Number": ["UO", "EFO", "MTBLS", "BTO"],
				"Parameter Value[Detector]": ["1", "2 ", "3", " "],
				"Term Source REF.1": ["EFO", "EFO", "MTBLS", "BTO"],
				"Term Accession Number.1": ["UO", "EFO", "MTBLS", "BTO"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.templates.assayFileHeaderTemplates as {"LC-MS": {"headers": [
			{
				"columnStructure": "ONTOLOGY_COLUMN",
				"columnCategory": "Parameter Value",
				"columnHeader": "Parameter Value[Chromatography Instrument]",
				"columnPrefix": "Parameter Value",
				"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
				"defaultColumnIndex": 1,
				"defaultValue": null,
				"maxLength": 0,
				"minLength": 5,
				"required": true,
			},
			{
				"columnStructure": "ONTOLOGY_COLUMN",
				"columnCategory": "Parameter Value",
				"columnHeader": "Parameter Value[Detector]",
				"columnPrefix": "Parameter Value",
				"controlLists": null,
				"defaultColumnIndex": 7,
				"defaultValue": null,
				"maxLength": 0,
				"minLength": 0,
				"required": false,
			},
		]}}
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
test_rule_a_200_090_002_01_violation_01 if {
	result := rules.rule_a_200_090_002_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Chromatography Instrument]",
					"columnName": "Parameter Value[Chromatography Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 2},
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Detector]", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismPartRefSources"},
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 5},
			],
			"columns": [
				"Parameter Value[Chromatography Instrument]",
				"Term Source REF",
				"Term Accession Number",
				"Parameter Value[Instrument]",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Parameter Value[Chromatography Instrument]": ["1", "2 ", "3", " "],
				"Term Source REF": ["EFO", "EFO", "MTBLS", "NCBI"],
				"Term Accession Number": ["UO", "EFO", "MTBLS", "NCBI"],
				"Parameter Value[Detector]": ["1", "2 ", "3", " "],
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
# rule_a_200_090_002_02
#########################################################################################################

# METADATA
# title: Ontology Term Source REF of an ontology term is not in the prioritised control list.
# description: Ontology Term Source REF of an ontology term is not in the prioritised control list.
test_rule_a_200_090_002_02_no_violation_01 if {
	result := rules.rule_a_200_090_002_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Chromatography Instrument]",
					"columnName": "Parameter Value[Chromatography Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 2},
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Detector]",
					"columnName": "Parameter Value[Detector]", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 5},
			],
			"columns": [
				"Parameter Value[Chromatography Instrument]",
				"Term Source REF",
				"Term Accession Number",
				"Parameter Value[Detector]",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Parameter Value[Chromatography Instrument]": ["1", "2 ", "3", " "],
				"Term Source REF": ["UO", "EFO", "MTBLS", "NCBITaxon"],
				"Term Accession Number": ["UO", "EFO", "MTBLS", "NCBITaxon"],
				"Parameter Value[Detector]": ["1", "2 ", "3", " "],
				"Term Source REF.1": ["UO", "EFO", "MTBLS", "NCBITaxon"],
				"Term Accession Number.1": ["UO", "EFO", "MTBLS", "NCBITaxon"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
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
# title: Ontology Term Source REF of an ontology term is not in the default prioritised control list.
# description: Ontology Term Source REF of an ontology term is not in the default prioritised control list.
test_rule_a_200_090_002_02_violation_01 if {
	result := rules.rule_a_200_090_002_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Chromatography Instrument]",
					"columnName": "Parameter Value[Chromatography Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 2},
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Detector]",
					"columnName": "Parameter Value[Detector]", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 5},
			],
			"columns": [
				"Parameter Value[Chromatography Instrument]",
				"Term Source REF",
				"Term Accession Number",
				"Parameter Value[Detector]",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Parameter Value[Chromatography Instrument]": ["1", "2 ", "3", " "],
				"Term Source REF": ["UO", "EFO", "EFO", "EFO"],
				"Term Accession Number": ["UO", "EFO", "MTBLS", "NCBI"],
				"Parameter Value[Detector]": ["1", "2 ", "3", " "],
				"Term Source REF.1": ["UO", "EFO", "MTBLS", "NCBI"],
				"Term Accession Number.1": ["UO", "EFO", "MTBLS", "NCBI"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.controlLists.prioritisedDefaultTermRefSources as ["UO", "EFO"]

	count(result) == 1
}

#########################################################################################################
# rule_a_200_090_002_03
#########################################################################################################

# METADATA
# title: All Ontology Term Source REFs are in the source references section of i_Investigation.txt file.
# description: All Ontology Term Source REFs are in the source references section of i_Investigation.txt file.
test_rule_a_200_090_002_03_no_violation_01 if {
	result := rules.rule_a_200_090_002_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Chromatography Instrument]",
					"columnName": "Parameter Value[Chromatography Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 2},
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Detector]",
					"columnName": "Parameter Value[Detector]", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 5},
			],
			"columns": [
				"Parameter Value[Chromatography Instrument]",
				"Term Source REF",
				"Term Accession Number",
				"Parameter Value[Detector]",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Parameter Value[Chromatography Instrument]": ["1", "2 ", "3", " "],
				"Term Source REF": ["UO", "EFO", "MTBLS", "NCBITaxon"],
				"Term Accession Number": ["UO", "EFO", "MTBLS", "NCBITaxon"],
				"Parameter Value[Detector]": ["1", "2 ", "3", " "],
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
# title: Values with trailing or leading spaces found in the assay file.
# description: Values with trailing or leading spaces found in the assay file.
test_rule_a_200_090_002_03_violation_01 if {
	result := rules.rule_a_200_090_002_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Chromatography Instrument]",
					"columnName": "Parameter Value[Chromatography Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 2},
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Detector]",
					"columnName": "Parameter Value[Detector]", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 5},
			],
			"columns": [
				"Parameter Value[Chromatography Instrument]",
				"Term Source REF",
				"Term Accession Number",
				"Parameter Value[Detector]",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Parameter Value[Chromatography Instrument]": ["1", "2 ", "3", " "],
				"Term Source REF": ["UO", "EFO", "MTBLS", "MTBLS"],
				"Term Accession Number": ["UO", "EFO", "MTBLS", "NCBI"],
				"Parameter Value[Detector]": ["1", "2 ", "3", " "],
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
# rule_a_200_090_002_04
#########################################################################################################

# METADATA
# title: All Ontology Term Source REFs are in the source references section of i_Investigation.txt file.
# description: All Ontology Term Source REFs are in the source references section of i_Investigation.txt file.
test_rule_a_200_090_002_04_no_violation_01 if {
	result := rules.rule_a_200_090_002_04 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Chromatography Instrument]",
					"columnName": "Parameter Value[Chromatography Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 2},
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Detector]",
					"columnName": "Parameter Value[Detector]", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 5},
			],
			"columns": [
				"Parameter Value[Chromatography Instrument]",
				"Term Source REF",
				"Term Accession Number",
				"Parameter Value[Detector]",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Parameter Value[Chromatography Instrument]": ["1", "2 ", "3", "6"],
				"Term Source REF": ["UO", "EFO", "MTBLS", "NCBITaxon"],
				"Term Accession Number": ["UO", "EFO", "MTBLS", "NCBITaxon"],
				"Parameter Value[Detector]": ["1", "2 ", "3", "4"],
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
# title: Values with trailing or leading spaces found in the assay file.
# description: Values with trailing or leading spaces found in the assay file.
test_rule_a_200_090_002_04_violation_01 if {
	result := rules.rule_a_200_090_002_04 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Chromatography Instrument]",
					"columnName": "Parameter Value[Chromatography Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 2},
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Detector]",
					"columnName": "Parameter Value[Detector]", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 5},
			],
			"columns": [
				"Parameter Value[Chromatography Instrument]",
				"Term Source REF",
				"Term Accession Number",
				"Parameter Value[Detector]",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Parameter Value[Chromatography Instrument]": ["", "o2 ", " ", "o 2 "],
				"Term Source REF": ["UO", "EFO", "MTBLS", "MTBLS"],
				"Term Accession Number": ["UO", "EFO", "MTBLS", "NCBI"],
				"Parameter Value[Detector]": ["v1", "v2 ", "v3", " "],
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
# rule_a_200_090_002_05
#########################################################################################################

# METADATA
# title: Ontology Term Source REF for a unit is defined however Term Source REF is not in prioritised control list.
# description: Ontology Term Source REF for a unit is defined however Term Source REF is not in prioritised control list.
test_rule_a_200_090_002_05_no_violation_01 if {
	result := rules.rule_a_200_090_002_05 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Parameter Value[Age]",
					"columnName": "Parameter Value[Age]", "columnIndex": 0,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 2},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 3},
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Parameter Value[Time]",
					"columnName": "Parameter Value[Time]", "columnIndex": 4,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit.1", "columnIndex": 5},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 6},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 7},
			],
			"columns": [
				"Parameter Value[Age]",
				"Unit",
				"Term Source REF",
				"Term Accession Number",
				"Parameter Value[Time]",
				"Unit",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Parameter Value[Age]": ["1", "2 ", "3", "2"],
				"Unit": ["Day", "Hour ", "Year", "Year"],
				"Term Source REF": ["UO", "EFO", "NCBI", "MTBLS"],
				"Term Accession Number": ["UO", "EFO", "NCBI", "NCBI"],
				"Parameter Value[Time]": ["1", "2 ", "3", " "],
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
test_rule_a_200_090_002_05_violation_01 if {
	result := rules.rule_a_200_090_002_05 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Parameter Value[Age]",
					"columnName": "Parameter Value[Age]", "columnIndex": 0,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 2},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 3},
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Parameter Value[Time]",
					"columnName": "Parameter Value[Time]", "columnIndex": 4,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit.1", "columnIndex": 5},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 6},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 7},
			],
			"columns": [
				"Parameter Value[Age]",
				"Unit",
				"Term Source REF",
				"Term Accession Number",
				"Parameter Value[Time]",
				"Unit",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Parameter Value[Age]": ["1", "2 ", "3", "2"],
				"Unit": ["Day", "Hour ", "Year", "Year"],
				"Term Source REF": ["UO", "EFO", "NCBI", "MTBLS"],
				"Term Accession Number": ["UO", "EFO", "MTBLS", "NCBI"],
				"Parameter Value[Time]": ["1", "2 ", "3", " "],
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
# rule_a_200_090_002_06
#########################################################################################################

# METADATA
# title: Ontology Term Source REF is not defined for a empty unit ontology term.
# description: Ontology Term Source REF is not defined for a empty unit ontology term.
test_rule_a_200_090_002_06_no_violation_01 if {
	result := rules.rule_a_200_090_002_06 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Parameter Value[Age]",
					"columnName": "Parameter Value[Age]", "columnIndex": 0,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 2},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 3},
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Parameter Value[Time]",
					"columnName": "Parameter Value[Time]", "columnIndex": 4,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit.1", "columnIndex": 5},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 6},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 7},
			],
			"columns": [
				"Parameter Value[Age]",
				"Unit",
				"Term Source REF",
				"Term Accession Number",
				"Parameter Value[Time]",
				"Unit",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Parameter Value[Age]": ["1", "2 ", "3", "2"],
				"Unit": ["Day", "Hour ", "Year", "Year"],
				"Term Source REF": ["UO", "EFO", "NCBI", "MTBLS"],
				"Term Accession Number": ["UO", "EFO", "NCBI", "NCBI"],
				"Parameter Value[Time]": ["1", "2 ", "3", " "],
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
test_rule_a_200_090_002_06_violation_01 if {
	result := rules.rule_a_200_090_002_06 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Parameter Value[Age]",
					"columnName": "Parameter Value[Age]", "columnIndex": 0,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 2},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 3},
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Parameter Value[Time]",
					"columnName": "Parameter Value[Time]", "columnIndex": 4,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit.1", "columnIndex": 5},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 6},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 7},
			],
			"columns": [
				"Parameter Value[Age]",
				"Unit",
				"Term Source REF",
				"Term Accession Number",
				"Parameter Value[Time]",
				"Unit.1",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Parameter Value[Age]": ["1", "2 ", "3", "2"],
				"Unit": ["Year", "Year ", "Year", "Data"],
				"Term Source REF": ["UO", "EFO", "NCBI", "MTBLS"],
				"Term Accession Number": ["UO", "EFO", "MTBLS", "NCBI"],
				"Parameter Value[Time]": ["1", "2 ", "3", " "],
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
# rule_a_200_090_002_09
#########################################################################################################

# METADATA
# title: Term is in control list.
# description: Term is in control list.
test_rule_a_200_090_002_09_no_violation_01 if {
	result := rules.rule_a_200_090_002_09 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 2},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 3},
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Parameter Value[Time]",
					"columnName": "Parameter Value[Time]", "columnIndex": 4,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit.1", "columnIndex": 5},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 6},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 7},
			],
			"columns": [
				"Parameter Value[Instrument]",
				"Unit",
				"Term Source REF",
				"Term Accession Number",
				"Parameter Value[Time]",
				"Unit",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Parameter Value[Instrument]": ["AB SCIEX API 2000", "AB SCIEX API 4000", "AB SCIEX API 2000", "AB SCIEX API 4000"],
				"Unit": ["Day", "Hour ", "Year", "Year"],
				"Term Source REF": ["UO", "EFO", "NCBI", "MTBLS"],
				"Term Accession Number": ["UO", "EFO", "NCBI", "NCBI"],
				"Parameter Value[Time]": ["1", "2 ", "3", " "],
				"Term Accession Number.1": ["UO", "EFO", "MTBLS", "NCBI"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.controlLists.assayColumns as {"Parameter Value[Instrument]": { "controlList": [{
			"techniques": ["LC-MS"],
			"columnType": "ONTOLOGY_COLUMN",
			"values": [
				{
					"term": "AB SCIEX API 2000",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_002035",
					"termSourceRef": "MTBLS",
				},
				{
					"term": "AB SCIEX API 4000",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000593",
					"termSourceRef": "MTBLS",
				},
			],
		}]}}
	count(result) == 0
}

# METADATA
# title: Term is not in control list.
# description: Term is not in control list.
test_rule_a_200_090_002_09_violation_01 if {
	result := rules.rule_a_200_090_002_09 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 2},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 3},
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Parameter Value[Time]",
					"columnName": "Parameter Value[Time]", "columnIndex": 4,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit.1", "columnIndex": 5},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 6},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 7},
			],
			"columns": [
				"Parameter Value[Instrument]",
				"Unit",
				"Term Source REF",
				"Term Accession Number",
				"Parameter Value[Time]",
				"Unit",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Parameter Value[Instrument]": ["AB SCIEX API 2000x", "AB S", "AB SCIEX API 2000", "AB SCIEX API 4000"],
				"Unit": ["Day", "Hour ", "Year", "Year"],
				"Term Source REF": ["UO", "EFO", "NCBI", "MTBLS"],
				"Term Accession Number": ["UO", "EFO", "NCBI", "NCBI"],
				"Parameter Value[Time]": ["1", "2 ", "3", " "],
				"Term Accession Number.1": ["UO", "EFO", "MTBLS", "NCBI"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.controlLists.assayColumns as {"Parameter Value[Instrument]": { "controlList": [{
			"techniques": ["LC-MS"],
			"columnType": "ONTOLOGY_COLUMN",
			"values": [
				{
					"term": "AB SCIEX API 2000",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_002035",
					"termSourceRef": "MTBLS",
				},
				{
					"term": "AB SCIEX API 4000",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000593",
					"termSourceRef": "MTBLS",
				},
			],
		}]}}
	count(result) == 1
}


#########################################################################################################
# rule_a_200_090_002_10
#########################################################################################################

# METADATA
# title: Term for the accession number is same with current value.
# description: Term for the accession number is same with current value.
test_rule_a_200_090_002_10_no_violation_01 if {
	result := rules.rule_a_200_090_002_10 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 2},
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Parameter Value[Time]",
					"columnName": "Parameter Value[Time]", "columnIndex": 3,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 5},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 6},
			],
			"columns": [
				"Parameter Value[Instrument]",
				"Term Source REF",
				"Term Accession Number",
				"Parameter Value[Time]",
				"Unit",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Parameter Value[Instrument]": ["AB SCIEX API 2000", "AB SCIEX API 4000", "AB SCIEX API 2000", "AB SCIEX API 4000"],
				"Term Source REF": ["MTBLS", "MTBLS", "MTBLS", "MTBLS"],
				"Term Accession Number": ["http://www.ebi.ac.uk/metabolights/ontology/MTBLS_002035", "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000593", "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_002035", "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000593"],
				"Parameter Value[Time]": ["1", "2 ", "3", " "],
				"Term Accession Number.1": ["UO", "EFO", "MTBLS", "NCBI"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.controlLists.assayColumns as {"Parameter Value[Instrument]": { "controlList": [{
			"techniques": ["LC-MS"],
			"columnType": "ONTOLOGY_COLUMN",
			"values": [
				{
					"term": "AB SCIEX API 2000",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_002035",
					"termSourceRef": "MTBLS",
				},
				{
					"term": "AB SCIEX API 4000",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000593",
					"termSourceRef": "MTBLS",
				},
			],
		}]}}
	count(result) == 0
}

# METADATA
# title: Term for the accession number is different than current value.
# description: Term for the accession number is different than current value.
test_rule_a_200_090_002_10_violation_01 if {
	result := rules.rule_a_200_090_002_10 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 2},
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Parameter Value[Time]",
					"columnName": "Parameter Value[Time]", "columnIndex": 3,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 5},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 6},
			],
			"columns": [
				"Parameter Value[Instrument]",
				"Term Source REF",
				"Term Accession Number",
				"Parameter Value[Time]",
				"Unit",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Parameter Value[Instrument]": ["AB SCIEX API 2000x", "AB S", "AB SCIEX API 2000", "AB SCIEX API 4000"],
				"Term Source REF": ["MTBLS", "MTBLS", "MTBLS", "MTBLS"],
				"Term Accession Number": ["http://www.ebi.ac.uk/metabolights/ontology/MTBLS_002035", "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_002035", "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_002035", "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_002035"],
				"Parameter Value[Time]": ["1", "2 ", "3", " "],
				"Term Accession Number.1": ["UO", "EFO", "MTBLS", "NCBI"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.controlLists.assayColumns as {"Parameter Value[Instrument]": { "controlList": [{
			"techniques": ["LC-MS"],
			"columnType": "ONTOLOGY_COLUMN",
			"values": [
				{
					"term": "AB SCIEX API 2000",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_002035",
					"termSourceRef": "MTBLS",
				},
				{
					"term": "AB SCIEX API 4000",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/MTBLS_000593",
					"termSourceRef": "MTBLS",
				},
			],
		}]}}
	count(result) == 1
}



#########################################################################################################
# rule_a_200_090_003_01
#########################################################################################################

# METADATA
# title: Term Accession Number length of an ontology term is equal or greater than 3 in assay file.
# description: Term Accession Number length of an ontology term is equal or greater than 3 in assay file.
test_rule_a_200_090_003_01_no_violation_01 if {
	result := rules.rule_a_200_090_003_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				"Parameter Value[Instrument]": ["1", "2 ", "3", "6"],
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
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}

	count(result) == 0
}

# METADATA
# title: Term Accession Number length of an ontology term is less than 3 in assay file.
# description: Term Accession Number length of an ontology term is less than 3 in assay file.
test_rule_a_200_090_003_01_violation_01 if {
	result := rules.rule_a_200_090_003_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				"Parameter Value[Instrument]": ["1", "2 ", "3", "6"],
				"Term Source REF": ["UO", "EFO", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
				"Parameter Value[Column model]": ["1", "2 ", "3", "4"],
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
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.controlLists.prioritisedUnitRefSources as [
			"UO",
			"EFO",
			"NCBI",
		]

	count(result) == 1
}

#########################################################################################################
# rule_a_200_090_003_02
#########################################################################################################

# METADATA
# title: Term Source REF of a unit ontology term is not empty.
# description: Term Source REF of a unit ontology term is not empty.
test_rule_a_200_090_003_02_no_violation_01 if {
	result := rules.rule_a_200_090_003_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Parameter Value[Age]",
					"columnName": "Parameter Value[Age]", "columnIndex": 0,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 2},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 3},
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Parameter Value[Time]",
					"columnName": "Parameter Value[Time]", "columnIndex": 4,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit.1", "columnIndex": 5},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 6},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 7},
			],
			"columns": [
				"Parameter Value[Age]",
				"Unit",
				"Term Source REF",
				"Term Accession Number",
				"Parameter Value[Time]",
				"Unit",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Parameter Value[Age]": ["1", "2 ", "3", "2"],
				"Unit": ["Day", "Hour ", "Year", "Year"],
				"Term Source REF": ["UO", "EFO", "NCBI", "MTBLS"],
				"Term Accession Number": ["UOA", "EFO", "NCBI", "NCBI"],
				"Parameter Value[Time]": ["1", "2 ", "3", " "],
				"Term Accession Number.1": ["UOA", "EFO", "MTBLS", "NCBI"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
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
# title: Term Accession Number length of a unit ontology term is less than 3 in assay file.
# description: Term Accession Number length of a unit ontology term is less than 3 in assay file.
test_rule_a_200_090_003_02_violation_01 if {
	result := rules.rule_a_200_090_003_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Parameter Value[Age]",
					"columnName": "Parameter Value[Age]", "columnIndex": 0,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 2},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 3},
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Parameter Value[Time]",
					"columnName": "Parameter Value[Time]", "columnIndex": 4,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit.1", "columnIndex": 5},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 6},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 7},
			],
			"columns": [
				"Parameter Value[Age]",
				"Unit",
				"Term Source REF",
				"Term Accession Number",
				"Parameter Value[Time]",
				"Unit.1",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Parameter Value[Age]": ["1", "2 ", "3", "2"],
				"Unit": ["Year", "Year ", "Year", "Data"],
				"Term Source REF": ["", "EFO", "NCBI", "MTBLS"],
				"Term Accession Number": ["UOF", "EFO", "MTBLS", "NCBI"],
				"Parameter Value[Time]": ["1", "2 ", "3", " "],
				"Unit.1": ["Day", "  ", "Hour", "Year"],
				"Term Source REF.1": ["UO", "EFO", "", " "],
				"Term Accession Number.1": ["UO", "EFO", "MTBLS", "NCBI"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
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
# rule_a_200_090_003_03
#########################################################################################################

# METADATA
# title: Term Accession Number is defined for an empty ontology term.
# description: Term Accession Number is defined for an empty ontology term.
test_rule_a_200_090_003_03_no_violation_01 if {
	result := rules.rule_a_200_090_003_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				"Parameter Value[Instrument]": ["1", "2 ", "3", "6"],
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
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}

	count(result) == 0
}

# METADATA
# title: Term Accession Number is defined for an empty ontology term.
# description: Term Accession Number is defined for an empty ontology term.
test_rule_a_200_090_003_03_violation_01 if {
	result := rules.rule_a_200_090_003_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				"Parameter Value[Instrument]": ["1", "2 ", "3", "6"],
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
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}

	}
		with data.metabolights.validation.v2.controlLists.prioritisedUnitRefSources as [
			"UO",
			"EFO",
			"NCBI",
		]

	count(result) == 1
}

#########################################################################################################
# rule_a_200_090_003_04
#########################################################################################################

# METADATA
# title: Term Accession Number is defined for an empty unit ontology term.
# description: Term Accession Number is defined for an empty unit ontology term.
test_rule_a_200_090_003_04_no_violation_01 if {
	result := rules.rule_a_200_090_003_04 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Parameter Value[Age]",
					"columnName": "Parameter Value[Age]", "columnIndex": 0,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 2},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 3},
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Parameter Value[Time]",
					"columnName": "Parameter Value[Time]", "columnIndex": 4,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit.1", "columnIndex": 5},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 6},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 7},
			],
			"columns": [
				"Parameter Value[Age]",
				"Unit",
				"Term Source REF",
				"Term Accession Number",
				"Parameter Value[Time]",
				"Unit",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Parameter Value[Age]": ["1", "2 ", "3", "2"],
				"Unit": ["", "Hour ", "Year", "Year"],
				"Term Source REF": ["UO", "EFO", "NCBI", "MTBLS"],
				"Term Accession Number": ["UOA", "EFO", "NCBI", "NCBI"],
				"Parameter Value[Time]": ["1", "2 ", "3", ""],
				"Term Accession Number.1": ["UOA", "EFO", "MTBLS", "NCBI"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}

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
test_rule_a_200_090_003_04_violation_01 if {
	result := rules.rule_a_200_090_003_04 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Parameter Value[Age]",
					"columnName": "Parameter Value[Age]", "columnIndex": 0,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 2},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 3},
				{
					"columnCategory": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Parameter Value[Time]",
					"columnName": "Parameter Value[Time]", "columnIndex": 4,
					"additionalColumns": ["Unit", "Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Unit", "columnName": "Unit.1", "columnIndex": 5},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 6},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 7},
			],
			"columns": [
				"Parameter Value[Age]",
				"Unit",
				"Term Source REF",
				"Term Accession Number",
				"Parameter Value[Time]",
				"Unit.1",
				"Term Source REF.1",
				"Term Accession Number.1",
			],
			"data": {
				"Parameter Value[Age]": ["1", "2 ", "3", "2"],
				"Unit": ["Year", "Year ", "Year", "Data"],
				"Term Source REF": ["EFO", "EFO", "NCBI", "MTBLS"],
				"Term Accession Number": ["UOF", "EFO", "MTBLS", "NCBI"],
				"Parameter Value[Time]": ["", " ", "3", " "],
				"Unit.1": ["Day", "  ", "Hour", "Year"],
				"Term Source REF.1": ["UO", "EFO", "", " "],
				"Term Accession Number.1": ["EFO", "EFO", "MTBLS", "NCBI"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}

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
# rule_a_200_090_004_01
#########################################################################################################

# METADATA
# title: There is no empty value in the required column.
# description: There is no empty value in the required column.
test_rule_a_200_090_004_01_no_violation_01 if {
	result := rules.rule_a_200_090_004_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				"Parameter Value[Instrument]": ["samplex", "mus musculus ", "homo sapiens", "sapiens"],
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
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}

	}
		with data.metabolights.validation.v2.templates.assayFileHeaderTemplates as {"LC-MS": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "Parameter Value[Instrument]",
					"columnPrefix": "Parameter Value",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 5,
					"required": true,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "Parameter Value[Column model]",
					"columnPrefix": "Parameter Value",
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
test_rule_a_200_090_004_01_violation_01 if {
	result := rules.rule_a_200_090_004_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				"Parameter Value[Instrument]": ["1", "2 ", "", ""],
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
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}

	}
		with data.metabolights.validation.v2.templates.assayFileHeaderTemplates as {"LC-MS": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "Parameter Value[Instrument]",
					"columnPrefix": "Parameter Value",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 5,
					"required": true,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "Parameter Value[Column model]",
					"columnPrefix": "Parameter Value",
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
# rule_a_200_090_004_02
#########################################################################################################

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
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}

	}
		with data.metabolights.validation.v2.templates.assayFileHeaderTemplates as {"LC-MS": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "Parameter Value[Instrument]",
					"columnPrefix": "Parameter Value",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 5,
					"required": true,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "Parameter Value[Column model]",
					"columnPrefix": "Parameter Value",
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
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}

	}
		with data.metabolights.validation.v2.templates.assayFileHeaderTemplates as {"LC-MS": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "Parameter Value[Instrument]",
					"columnPrefix": "Parameter Value",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 5,
					"required": true,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "Parameter Value[Column model]",
					"columnPrefix": "Parameter Value",
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
# rule_a_200_090_004_03
#########################################################################################################

# METADATA
# title: Value is not greater than max length requirement.
# description: Value is not greater than max length requirement.
test_rule_a_200_090_004_03_no_violation_01 if {
	result := rules.rule_a_200_090_004_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.templates.assayFileHeaderTemplates as {"LC-MS": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "Parameter Value[Instrument]",
					"columnPrefix": "Parameter Value",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 5,
					"required": true,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "Parameter Value[Column model]",
					"columnPrefix": "Parameter Value",
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
test_rule_a_200_090_004_03_violation_01 if {
	result := rules.rule_a_200_090_004_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				"Parameter Value[Column model]": ["Sample Value 123", "Test Value", "Exceptional Case is", ""],
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
		with data.metabolights.validation.v2.templates.assayFileHeaderTemplates as {"LC-MS": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "Parameter Value[Instrument]",
					"columnPrefix": "Parameter Value",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 5,
					"required": true,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "Parameter Value[Column model]",
					"columnPrefix": "Parameter Value",
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
# rule_a_200_090_005_01
#########################################################################################################

# METADATA
# title: All values are valid in Protocol REF column.
# description: All values are valid in Protocol REF column.
test_rule_a_200_090_005_01_no_violation_01 if {
	result := rules.rule_a_200_090_005_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
			],
			"data": {
				"Parameter Value[Instrument]": ["1", "2 ", "", "1234"],
				"Term Source REF": ["UO", "EFO", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
				"Parameter Value[Column model]": ["Sample Value 123", "Test Value", "Exceptional Case is", ""],
				"Term Source REF.1": ["UO", "Sam", "MTBLS", "NCBITaxon"],
				"Term Accession Number.1": ["UO", "MTBLS", "MTBLS", "NCBITaxon"],
				"Protocol REF": ["Extraction", "Extraction", "Extraction", "Extraction"],
				"Protocol REF.1": ["Metabolite identification", "Metabolite identification", "Metabolite identification", "Metabolite identification"],
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
		with data.metabolights.validation.v2.templates.assayFileHeaderTemplates as {"LC-MS": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "Parameter Value[Instrument]",
					"columnPrefix": "Parameter Value",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 5,
					"required": true,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "Parameter Value[Column model]",
					"columnPrefix": "Parameter Value",
					"controlLists": null,
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 5,
					"required": true,
				},
				{
					"columnStructure": "SINGLE_COLUMN",
					"columnCategory": "Protocol",
					"columnHeader": "Protocol REF",
					"columnPrefix": "",
					"controlLists": null,
					"defaultColumnIndex": 7,
					"defaultValue": "Extraction",
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
				{
					"columnStructure": "SINGLE_COLUMN",
					"columnCategory": "Protocol",
					"columnHeader": "Protocol REF",
					"columnPrefix": "",
					"controlLists": null,
					"defaultColumnIndex": 7,
					"defaultValue": "Metabolite identification",
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
			],
		}]}

	count(result) == 0
}

# METADATA
# title: There are invalid values in Protocol REF column.
# description: There are invalid values in Protocol REF column.
test_rule_a_200_090_005_01_violation_01 if {
	result := rules.rule_a_200_090_005_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
		with data.metabolights.validation.v2.templates.assayFileHeaderTemplates as {"LC-MS": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "Parameter Value[Instrument]",
					"columnPrefix": "Parameter Value",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 5,
					"required": true,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "Parameter Value[Column model]",
					"columnPrefix": "Parameter Value",
					"controlLists": null,
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 5,
					"required": true,
				},
				{
					"columnStructure": "SINGLE_COLUMN",
					"columnCategory": "Protocol",
					"columnHeader": "Protocol REF",
					"columnPrefix": "",
					"controlLists": null,
					"defaultColumnIndex": 7,
					"defaultValue": "Extraction",
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
				{
					"columnStructure": "SINGLE_COLUMN",
					"columnCategory": "Protocol",
					"columnHeader": "Protocol REF",
					"columnPrefix": "",
					"controlLists": null,
					"defaultColumnIndex": 8,
					"defaultValue": "Metabolite identification",
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
			],
		}]}
	count(result) == 1
}

#########################################################################################################
# rule_a_200_100_001_01
#########################################################################################################

# METADATA
# title: Sample Name is referenced in the assay file.
# description: Sample Name is referenced in the assay file.
test_rule_a_200_100_001_01_no_violation_01 if {
	result := rules.rule_a_200_100_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnName": "Sample Name", "columnIndex": 8},
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
				"Sample Name",
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
# title: Sample Name is not referenced in the assay file.
# description: Sample Name is not referenced in the assay file.
test_rule_a_200_100_001_01_violation_01 if {
	result := rules.rule_a_200_100_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnName": "Sample Name", "columnIndex": 8},
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
				"Sample Name",
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
				"Sample Name": ["Sample 1", "Sample 2", "Sample 3", "Sample 55"],
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
# rule_a_200_090_006_01
#########################################################################################################

# METADATA
# title: Valid values for some assay columns
# description: Valid values for some assay columns
test_rule_a_200_090_006_01_no_violation_01 if {
	result := rules.rule_a_200_090_006_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnName": "Sample Name", "columnIndex": 8},
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
				"Sample Name",
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
# title: Valid values for some assay columns
# description: Valid values for some assay columns
test_rule_a_200_090_006_01_violation_01 if {
	result := rules.rule_a_200_090_006_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 2},
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Chromatography Instrument]",
					"columnName": "Parameter Value[Chromatography Instrument]", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 5},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF", "columnIndex": 6},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF.1", "columnIndex": 7},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnName": "Sample Name", "columnIndex": 8},
			],
			"columns": [
				"Parameter Value[Instrument]",
				"Term Source REF",
				"Term Accession Number",
				"Parameter Value[Chromatography Instrument]",
				"Term Source REF.1",
				"Term Accession Number.1",
				"Protocol REF",
				"Protocol REF.1",
				"Sample Name",
			],
			"data": {
				"Parameter Value[Instrument]": ["N/A", "undefined", "", "1234"],
				"Term Source REF": ["UO", "EFO", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
				"Parameter Value[Chromatography Instrument]": ["Sample Value 123", "not applicable", "Exceptional Case is", ""],
				"Term Source REF.1": ["UO", "Sam", "MTBLS", "NCBITaxon"],
				"Term Accession Number.1": ["UO", "MTBLS", "MTBLS", "NCBITaxon"],
				"Protocol REF": ["Extraction", "Extraction", "Extraction", "Extraction"],
				"Protocol REF.1": ["Extraction", "  ", "Metabolite identification", "Mass spectrometry"],
				"Sample Name": ["Sample 1", "Sample 2", "Sample 3", "Sample 55"],
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
	count(result) == 2
}

#########################################################################################################
# rule_a_200_100_001_02
#########################################################################################################

# METADATA
# title: Sample Name is unique in the assay file.
# description: Sample Name is unique in the assay file.
test_rule_a_200_100_001_02_no_violation_01 if {
	result := rules.rule_a_200_100_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4, "rowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnName": "Sample Name", "columnIndex": 8},
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
				"Sample Name",
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
# title: Sample Name is not unique in the assay file.
# description: Sample Name is not unique in the assay file.
test_rule_a_200_100_001_02_violation_01 if {
	result := rules.rule_a_200_100_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4, "rowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnName": "Sample Name", "columnIndex": 8},
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
				"Sample Name",
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
				"Sample Name": ["Sample 1", "Sample 2", "Sample 3", ""],
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
# rule_a_200_200_001_01
#########################################################################################################

# METADATA
# title: File name pattern of the metabolite assignment file is correct.
# description: File name pattern of the metabolite assignment file is correct.
test_rule_a_200_200_001_01_no_violation_01 if {
	result := rules.rule_a_200_200_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4, "rowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Metabolite Assignment File", "columnName": "Metabolite Assignment File", "columnIndex": 8},
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
				"Metabolite Assignment File",
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
				"Metabolite Assignment File": ["m_Sample 1.tsv", "m_Sample 1.tsv", "m_Sample 1.tsv", "m_Sample 1.tsv"],
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
# title: File name pattern of the metabolite assignment file is not correct.
# description: File name pattern of the metabolite assignment file is not correct.
test_rule_a_200_200_001_01_violation_01 if {
	result := rules.rule_a_200_200_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4, "rowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Metabolite Assignment File", "columnName": "Metabolite Assignment File", "columnIndex": 8},
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
				"Metabolite Assignment File",
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
				"Metabolite Assignment File": ["m_Sample 1.txt", "m_Sample 1.xlsx", "", "m_Sample 1.tsv"],
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
# rule_a_200_200_001_02
#########################################################################################################

# METADATA
# title: There are not invalid characters in metabolite assignment file name.
# description: There are not invalid characters in metabolite assignment file name.
test_rule_a_200_200_001_02_no_violation_01 if {
	result := rules.rule_a_200_200_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4, "rowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Metabolite Assignment File", "columnName": "Metabolite Assignment File", "columnIndex": 8},
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
				"Metabolite Assignment File",
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
				"Metabolite Assignment File": ["m_Sample_1.tsv", "m_Sample_1.tsv", "m_Sample1.tsv", "m_Sample1.tsv"],
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
# title: There are invalid characters in metabolite assignment file name.
# description: There are invalid characters in metabolite assignment file name.
test_rule_a_200_200_001_02_violation_01 if {
	result := rules.rule_a_200_200_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4, "rowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Metabolite Assignment File", "columnName": "Metabolite Assignment File", "columnIndex": 8},
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
				"Metabolite Assignment File",
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
				"Metabolite Assignment File": ["m_Sample 1.txt", "m_Sample$1.xlsx", "", "m_Sample+1.tsv"],
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
# rule_a_200_300_001_01
#########################################################################################################

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
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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

#########################################################################################################
# rule_a_200_300_001_02
#########################################################################################################

# METADATA
# title: Derived Spectral Data File is defined and Raw Spectral Data File is not empty.
# description: Derived Spectral Data File is defined and Raw Spectral Data File is not empty.
test_rule_a_200_300_001_02_no_violation_01 if {
	result := rules.rule_a_200_300_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4, "rowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
# title: Derived Spectral Data File is defined however Raw Spectral Data File is empty.
# description: Derived Spectral Data File is defined however Raw Spectral Data File is empty.
test_rule_a_200_300_001_02_violation_01 if {
	result := rules.rule_a_200_300_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4, "rowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				"Raw Spectral Data File": ["m_Sample 1.tsv", "m_Sample 1.tsv", "", "m_Sample 1.tsv"],
				"Derived Spectral Data File": ["m_Sample 1.tsv", "m_Sample 1.tsv", "m_Sample 1.tsv", "m_Sample 2.tsv"],
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
# rule_a_200_300_001_03
#########################################################################################################

# METADATA
# title: File extension is correct in Derived Spectral Data File column.
# description: File extension is correct in Derived Spectral Data File column.
test_rule_a_200_300_001_03_no_violation_01 if {
	result := rules.rule_a_200_300_001_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4, "rowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				"Raw Spectral Data File": ["x.ZIP", "y.CMP", "test.wiff.scan", ".RAW"],
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
# title: File extension is not correct in Derived Spectral Data File column.
# description: File extension is not correct in Derived Spectral Data File column.
test_rule_a_200_300_001_03_violation_01 if {
	result := rules.rule_a_200_300_001_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4, "rowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Derived Spectral Data File", "columnName": "Derived Spectral Data File.1", "columnIndex": 9},
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
				"Derived Spectral Data File.1",
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
				"Raw Spectral Data File": ["x.mzML", "y.mzData", "test.mgf", "value.x"],
				"Derived Spectral Data File.1": ["x.mzML", "y.mzData", "test.wiff", "value.rar"],
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
# rule_a_200_300_002_01
#########################################################################################################

# METADATA
# title: Some values in MS Assay Name column are  unique.
# description: Some values in MS Assay Name column are unique.
test_rule_a_200_300_002_01_no_violation_01 if {
	result := rules.rule_a_200_300_002_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4, "rowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name", "columnName": "MS Assay Name", "columnIndex": 8},
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
				"MS Assay Name",
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
				"MS Assay Name": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"],
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
# title: Some values in MS Assay Name column are empty or not unique.
# description: Some values in MS Assay Name column are empty or not unique.
test_rule_a_200_300_002_01_violation_01 if {
	result := rules.rule_a_200_300_002_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4, "rowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "MS Assay Name", "columnName": "MS Assay Name", "columnIndex": 8},
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
				"MS Assay Name",
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
				"MS Assay Name": ["Sample 1", "Sample 2", " ", ""],
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
# rule_a_200_300_003_01
#########################################################################################################

# METADATA
# title: Scan Polarity column values are same as assay file name
# description: Scan Polarity column values not same as assay file name
test_rule_a_200_300_003_01_no_violation_01 if {
	result := rules.rule_a_200_300_003_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1_GC-MS_positive.txt": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4, "rowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Scan polarity]",
					"columnName": "Parameter Value[Scan polarity]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
				},				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Column model]",
					"columnName": "Parameter Value[Column model]", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},

			],
			"columns": [
				"Parameter Value[Scan polarity]",
				"Parameter Value[Column model]"
			],
			"data": {
				"Parameter Value[Scan polarity]": ["positive", "positive", "positive", "positive"],
				"Parameter Value[Column model]": ["1", "2 ", "", "1234"],
			},
		}}},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: Scan Polarity column values are not same as assay file name
# description: Scan Polarity column values are not same as assay file name
test_rule_a_200_300_003_01_violation_01 if {
	result := rules.rule_a_200_300_003_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "GC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4, "rowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Scan polarity]",
					"columnName": "Parameter Value[Scan polarity]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Column model]",
					"columnName": "Parameter Value[Column model]", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},

			],
			"columns": [
				"Parameter Value[Scan polarity]",
				"Parameter Value[Column model]"
			],
			"data": {
				"Parameter Value[Scan polarity]": ["positive", "positive", "positive", "positive"],
				"Parameter Value[Column model]": ["1", "2 ", "", "1234"],
			},
		}}},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}




#########################################################################################################
# rule_a_200_300_003_02
#########################################################################################################

# METADATA
# title: Scan Polarity column values are same as assay file name
# description: Scan Polarity column values not same as assay file name
test_rule_a_200_300_003_02_no_violation_01 if {
	result := rules.rule_a_200_300_003_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1_GC-MS_positive.txt": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4, "rowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Scan polarity]",
					"columnName": "Parameter Value[Scan polarity]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
				},				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Column model]",
					"columnName": "Parameter Value[Column model]", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},

			],
			"columns": [
				"Parameter Value[Scan polarity]",
				"Parameter Value[Column model]"
			],
			"data": {
				"Parameter Value[Scan polarity]": ["positive", "positive", "positive", "positive"],
				"Parameter Value[Column model]": ["1", "2 ", "", "1234"],
			},
		}}},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: Scan Polarity column values are not same as assay file name
# description: Scan Polarity column values are not same as assay file name
test_rule_a_200_300_003_02_violation_01 if {
	result := rules.rule_a_200_300_003_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "GC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4, "rowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Scan polarity]",
					"columnName": "Parameter Value[Scan polarity]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Column model]",
					"columnName": "Parameter Value[Column model]", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},

			],
			"columns": [
				"Parameter Value[Scan polarity]",
				"Parameter Value[Column model]"
			],
			"data": {
				"Parameter Value[Scan polarity]": ["positive", "positive", "positive", "negative"],
				"Parameter Value[Column model]": ["1", "2 ", "", "1234"],
			},
		}}},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}

#########################################################################################################
# rule_a_200_400_001_01
#########################################################################################################

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
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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

#########################################################################################################
# rule_a_200_400_002_01
#########################################################################################################

# METADATA
# title: Some values in NMR Assay Name column are  unique.
# description: Some values in NMR Assay Name column are unique.
test_rule_a_200_400_002_01_no_violation_01 if {
	result := rules.rule_a_200_400_002_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "NMR", "mainTechnique": "NMR"}, "table": {
			"rowOffset": 0, "totalRowCount": 4, "rowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "NMR Assay Name", "columnName": "NMR Assay Name", "columnIndex": 8},
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
				"NMR Assay Name",
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
				"NMR Assay Name": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"],
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
# title: Some values in NMR Assay Name column are empty or not unique.
# description: Some values in NMR Assay Name column are empty or not unique.
test_rule_a_200_400_002_01_violation_01 if {
	result := rules.rule_a_200_400_002_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "NMR", "mainTechnique": "NMR"}, "table": {
			"rowOffset": 0, "totalRowCount": 4, "rowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "NMR Assay Name", "columnName": "NMR Assay Name", "columnIndex": 8},
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
				"NMR Assay Name",
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
				"NMR Assay Name": ["Sample 1", "Sample 2", " ", ""],
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
# rule_a_200_500_001_01
#########################################################################################################

# METADATA
# title: File extension is correct in Derived Spectral Data File column.
# description: File extension is correct in Derived Spectral Data File column.
test_rule_a_200_500_001_01_no_violation_01 if {
	result := rules.rule_a_200_500_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4, "rowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				"Protocol REF.1": ["Extraction", "", "Metabolite identification", "Mass spectrometry"],
				"Raw Spectral Data File": ["x.raw", "y.raw", "test.raw", "value.raw"],
				"Derived Spectral Data File": ["x.mzML", "y.xml", "test.wiff", "value.cdf"],
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
# title: File extension is not correct in Derived Spectral Data File column.
# description: File extension is not correct in Derived Spectral Data File column.
test_rule_a_200_500_001_01_violation_02 if {
	result := rules.rule_a_200_500_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4, "rowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Derived Spectral Data File.1", "columnName": "Derived Spectral Data File.1", "columnIndex": 10},
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
				"Derived Spectral Data File.1",
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
				"Raw Spectral Data File": ["cc", "cc", "ss", "cc"],
				"Derived Spectral Data File": ["x.mzML", "y.mzData", "test.wiff", "value.x"],
				"Derived Spectral Data File.1": ["x.mzML", "y.mzData", "test.wiff", "value.rar"],
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
# title: File extension is not correct in Derived Spectral Data File column.
# description: File extension is not correct in Derived Spectral Data File column.
test_rule_a_200_500_001_01_violation_01 if {
	result := rules.rule_a_200_500_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4, "rowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Derived Spectral Data File.1", "columnName": "Derived Spectral Data File.1", "columnIndex": 10},
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
				"Derived Spectral Data File.1",
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
				"Raw Spectral Data File": ["", "", "", ""],
				"Derived Spectral Data File": ["x.mzML", "y.mzData", "test.wiff", "value.x"],
				"Derived Spectral Data File.1": ["x.mzML", "y.mzData", "test.wiff", "value.rar"],
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
	count(result) == 2
}



# METADATA
# title: File extension is not correct in Derived Spectral Data File column.
# description: File extension is not correct in Derived Spectral Data File column.
test_rule_a_200_500_001_01_violation_03 if {
	result := rules.rule_a_200_500_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4, "rowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Instrument]",
					"columnName": "Parameter Value[Instrument]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
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
				"Derived Spectral Data File.1",
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
				"Raw Spectral Data File": ["", "", "", ""],
				"Derived Spectral Data File": ["x.xml", "y.d", "z.zip", "v.raw"],

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
# rule_a_200_600_001_01
#########################################################################################################

# METADATA
# title: Column Type column values are not same as assay file name
# description: Column Type column values are same as assay file name
test_rule_a_200_600_001_01_no_violation_01 if {
	result := rules.rule_a_200_600_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1_GC-MS.txt": {"assayTechnique": {"name": "GC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4, "rowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Column type]",
					"columnName": "Parameter Value[Column type]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
				},				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Column model]",
					"columnName": "Parameter Value[Column model]", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},

			],
			"columns": [
				"Parameter Value[Column type]",
				"Parameter Value[Column model]"
			],
			"data": {
				"Parameter Value[Column type]": ["hilic", "reverse phase", "hilic", "reverse phase"],
				"Parameter Value[Column model]": ["1", "2 ", "", "1234"],
			},
		}}},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: Column Type column values are not same as assay file name
# description: Column Type column values are not same as assay file name
test_rule_a_200_600_001_01_violation_01 if {
	result := rules.rule_a_200_600_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "GC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4, "rowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Column type]",
					"columnName": "Parameter Value[Column type]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
				},				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Column model]",
					"columnName": "Parameter Value[Column model]", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},

			],
			"columns": [
				"Parameter Value[Column type]",
				"Parameter Value[Column model]"
			],
			"data": {
				"Parameter Value[Column type]": ["high polarity", "high polarity", "high polarity", "high polarity"],
				"Parameter Value[Column model]": ["1", "2 ", "", "1234"],
			},
		}}},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}

