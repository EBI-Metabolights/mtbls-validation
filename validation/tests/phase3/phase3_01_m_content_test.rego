package metabolights.validation.v2.rules.phase3.tests

import rego.v1
import data.metabolights.validation.v2.rules.phase3.violations as rules

#########################################################################################################
# rule_m_300_090_001_01
#########################################################################################################

# METADATA
# title: Values without trailing or leading spaces found in the assay file.
# description: Values without trailing or leading spaces found in the assay file.
test_rule_m_300_090_001_01_no_violation_01 if {
	result := rules.rule_m_300_090_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "ADDITIONAL_COLUMN", "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "Protocol", "columnStructure": "", "columnHeader": "Protocol REF", "columnIndex": 2},
				{"columnCategory": "Comment", "columnStructure": "", "columnHeader": "Comment[Sample]", "columnIndex": 4},
				{"columnCategory": "Parameter Value", "columnStructure": "", "columnHeader": "Parameter Value[Age]", "columnIndex": 5},
				{"columnCategory": "Parameter Value", "columnStructure": "", "columnHeader": "smile", "columnIndex": 8},
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
test_rule_m_300_090_001_01_violation_01 if {
	result := rules.rule_m_300_090_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "ADDITIONAL_COLUMN", "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "Protocol", "columnStructure": "", "columnHeader": "Protocol REF", "columnIndex": 2},
				{"columnCategory": "Comment", "columnStructure": "", "columnHeader": "Comment[Sample]", "columnIndex": 4},
				{"columnCategory": "Parameter Value", "columnStructure": "", "columnHeader": "Parameter Value[Age]", "columnIndex": 5},
				{"columnCategory": "Parameter Value", "columnStructure": "", "columnHeader": "smile", "columnIndex": 8},
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
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
	count(result) == 2
}

#########################################################################################################
# rule_m_300_090_005_01
#########################################################################################################

# METADATA
# title: Empty value is found in a required column.
# description: Empty value is found in a required column.
test_rule_m_300_090_005_01_no_violation_01 if {
	result := rules.rule_m_300_090_005_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "smile",
					"columnName": "smile", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 2},
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "metabolite_identification",
					"columnName": "metabolite_identification", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 5},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF", "columnIndex": 6},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF.1", "columnIndex": 7},
			],
			"columns": [
				"smile",
				"Term Source REF",
				"Term Accession Number",
				"metabolite_identification",
				"Term Source REF.1",
				"Term Accession Number.1",
				"Protocol REF",
				"Protocol REF.1",
			],
			"data": {
				"smile": ["1", "2 ", "", "1234"],
				"Term Source REF": ["UO", "EFO", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
				"metabolite_identification": ["Sample Value 123", "Test Value", "Exceptional Case is", "Datad"],
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
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "smile",
					"columnPrefix": "Parameter Value",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "metabolite_identification",
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
# title: Empty value is found in a required column.
# description: Empty value is found in a required column.
test_rule_m_300_090_005_01_violation_01 if {
	result := rules.rule_m_300_090_005_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "smile",
					"columnName": "smile", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 2},
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "metabolite_identification",
					"columnName": "metabolite_identification", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 5},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF", "columnIndex": 6},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF.1", "columnIndex": 7},
			],
			"columns": [
				"smile",
				"Term Source REF",
				"Term Accession Number",
				"metabolite_identification",
				"Term Source REF.1",
				"Term Accession Number.1",
				"Protocol REF",
				"Protocol REF.1",
			],
			"data": {
				"smile": ["1", "2 ", "", "1234"],
				"Term Source REF": ["UO", "EFO", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
				"metabolite_identification": [" ", "Test Value", "Exceptional Case is", ""],
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
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "smile",
					"columnPrefix": "Parameter Value",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "metabolite_identification",
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
# rule_m_300_090_005_02
#########################################################################################################

# METADATA
# title: Column value does not violate minimum length requirement.
# description: Column value does not violate minimum length requirement.
test_rule_m_300_090_005_02_no_violation_01 if {
	result := rules.rule_m_300_090_005_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "smile",
					"columnName": "smile", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 2},
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "metabolite_identification",
					"columnName": "metabolite_identification", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 5},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF", "columnIndex": 6},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF.1", "columnIndex": 7},
			],
			"columns": [
				"smile",
				"Term Source REF",
				"Term Accession Number",
				"metabolite_identification",
				"Term Source REF.1",
				"Term Accession Number.1",
				"Protocol REF",
				"Protocol REF.1",
			],
			"data": {
				"smile": ["1", "2 ", "", "1234"],
				"Term Source REF": ["UO", "EFO", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
				"metabolite_identification": ["Sample Value 123", "Test Value", "Exceptional Case is", "Datad"],
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
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "smile",
					"columnPrefix": "Parameter Value",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "metabolite_identification",
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
# title: Column value violates minimum length requirement.
# description: Column value violates minimum length requirement.
test_rule_m_300_090_005_02_violation_01 if {
	result := rules.rule_m_300_090_005_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "smile",
					"columnName": "smile", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 2},
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "metabolite_identification",
					"columnName": "metabolite_identification", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 5},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF", "columnIndex": 6},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF.1", "columnIndex": 7},
			],
			"columns": [
				"smile",
				"Term Source REF",
				"Term Accession Number",
				"metabolite_identification",
				"Term Source REF.1",
				"Term Accession Number.1",
				"Protocol REF",
				"Protocol REF.1",
			],
			"data": {
				"smile": ["1", "2 ", "", "1234"],
				"Term Source REF": ["UO", "EFO", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
				"metabolite_identification": ["Test1", "Test", "Exceptional Case is", "  "],
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
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "smile",
					"columnPrefix": "Parameter Value",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "metabolite_identification",
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
# rule_m_300_090_005_03
#########################################################################################################

# METADATA
# title: Column value does not violate maximum length requirement.
# description: Column value does not violate maximum length requirement.
test_rule_m_300_090_005_03_no_violation_01 if {
	result := rules.rule_m_300_090_005_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "smile",
					"columnName": "smile", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 2},
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "metabolite_identification",
					"columnName": "metabolite_identification", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 5},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF", "columnIndex": 6},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF.1", "columnIndex": 7},
			],
			"columns": [
				"smile",
				"Term Source REF",
				"Term Accession Number",
				"metabolite_identification",
				"Term Source REF.1",
				"Term Accession Number.1",
				"Protocol REF",
				"Protocol REF.1",
			],
			"data": {
				"smile": ["1", "2 ", "", "1234"],
				"Term Source REF": ["UO", "EFO", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
				"metabolite_identification": ["Sample Value", "Test Value", "Exceptional", "Datad"],
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
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "smile",
					"columnPrefix": "Parameter Value",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "metabolite_identification",
					"columnPrefix": "Parameter Value",
					"controlLists": null,
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 12,
					"minLength": 0,
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
# title: Column value violates maximum length requirement.
# description: Column value violates maximum length requirement.
test_rule_m_300_090_005_03_violation_01 if {
	result := rules.rule_m_300_090_005_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "smile",
					"columnName": "smile", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 2},
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "metabolite_identification",
					"columnName": "metabolite_identification", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 5},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF", "columnIndex": 6},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF.1", "columnIndex": 7},
			],
			"columns": [
				"smile",
				"Term Source REF",
				"Term Accession Number",
				"metabolite_identification",
				"Term Source REF.1",
				"Term Accession Number.1",
				"Protocol REF",
				"Protocol REF.1",
			],
			"data": {
				"smile": ["1", "2 ", "", "1234"],
				"Term Source REF": ["UO", "EFO", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
				"metabolite_identification": ["Test1", "Test", "Exceptional Case is", "  "],
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
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "smile",
					"columnPrefix": "Parameter Value",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "metabolite_identification",
					"columnPrefix": "Parameter Value",
					"controlLists": null,
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 12,
					"minLength": 0,
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
# rule_m_300_100_001_01
#########################################################################################################

# METADATA
# title: All 'mass_to_charge' values are numeric.
# description: All 'mass_to_charge' values are numeric.
test_rule_m_300_100_001_01_no_violation_01 if {
	result := rules.rule_m_300_100_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "smile",
					"columnName": "smile", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 2},
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "mass_to_charge",
					"columnName": "mass_to_charge", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 5},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF", "columnIndex": 6},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF.1", "columnIndex": 7},
			],
			"columns": [
				"smile",
				"Term Source REF",
				"Term Accession Number",
				"mass_to_charge",
				"Term Source REF.1",
				"Term Accession Number.1",
				"Protocol REF",
				"Protocol REF.1",
			],
			"data": {
				"smile": ["1", "2 ", "", "1234"],
				"Term Source REF": ["UO", "EFO", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
				"mass_to_charge": ["122", "2333.1", "1233", "4411.21222"],
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
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "smile",
					"columnPrefix": "Parameter Value",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "mass_to_charge",
					"columnPrefix": "Parameter Value",
					"controlLists": null,
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 12,
					"minLength": 0,
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
# title: All 'mass_to_charge' values should be numeric.
# description: All 'mass_to_charge' values should be numeric.
test_rule_m_300_100_001_01_violation_01 if {
	result := rules.rule_m_300_100_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "smile",
					"columnName": "smile", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 2},
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "mass_to_charge",
					"columnName": "mass_to_charge", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 5},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF", "columnIndex": 6},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF.1", "columnIndex": 7},
			],
			"columns": [
				"smile",
				"Term Source REF",
				"Term Accession Number",
				"mass_to_charge",
				"Term Source REF.1",
				"Term Accession Number.1",
				"Protocol REF",
				"Protocol REF.1",
			],
			"data": {
				"smile": ["1", "2 ", "", "1234"],
				"Term Source REF": ["UO", "EFO", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
				"mass_to_charge": ["", "2333.1|2.34|122", "", "4411.21222"],
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
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "smile",
					"columnPrefix": "Parameter Value",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "mass_to_charge",
					"columnPrefix": "Parameter Value",
					"controlLists": null,
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 12,
					"minLength": 0,
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
	count(result) == 1
}

#########################################################################################################
# rule_m_300_100_001_02
#########################################################################################################

# METADATA
# title: Current 'retention_time' values are not empty.
# description: Current 'retention_time' values are not empty.
test_rule_m_300_100_001_02_no_violation_01 if {
	result := rules.rule_m_300_100_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "smile",
					"columnName": "smile", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 2},
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "retention_time",
					"columnName": "retention_time", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 5},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF", "columnIndex": 6},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF.1", "columnIndex": 7},
			],
			"columns": [
				"smile",
				"Term Source REF",
				"Term Accession Number",
				"retention_time",
				"Term Source REF.1",
				"Term Accession Number.1",
				"Protocol REF",
				"Protocol REF.1",
			],
			"data": {
				"smile": ["1", "2 ", "", "1234"],
				"Term Source REF": ["UO", "EFO", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
				"retention_time": ["122", "2333.1", "1233", "4411.21222"],
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
		"assays": {
			"a_MTBLS1.txt": {
				"referencedAssignmentFiles": [
						"m_MTBLS1.tsv"
				],
				"assayTechnique": {
						"name": "LC-MS",
						"mainTechnique": "MS",
						"technique": "Direct Injection",
						"subTechnique": "LC"
				},
			}
		},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "smile",
					"columnPrefix": "Parameter Value",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "retention_time",
					"columnPrefix": "Parameter Value",
					"controlLists": null,
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 12,
					"minLength": 0,
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
# title: MAF file is not referenced in LC-MS or GC-MS study.
# description: MAF file is not referenced in LC-MS or GC-MS study.
test_rule_m_300_100_001_02_no_violation_02 if {
	result := rules.rule_m_300_100_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "smile",
					"columnName": "smile", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 2},
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "retention_time",
					"columnName": "retention_time", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 5},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF", "columnIndex": 6},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF.1", "columnIndex": 7},
			],
			"columns": [
				"smile",
				"Term Source REF",
				"Term Accession Number",
				"retention_time",
				"Term Source REF.1",
				"Term Accession Number.1",
				"Protocol REF",
				"Protocol REF.1",
			],
			"data": {
				"smile": ["1", "2 ", "", "1234"],
				"Term Source REF": ["UO", "EFO", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
				"retention_time": ["122", "", "", ""],
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
		"assays": {
			"a_MTBLS1.txt": {
				"referencedAssignmentFiles": [
						"m_MTBLS1.tsv"
				],
				"assayTechnique": {
						"name": "DI-MS",
						"mainTechnique": "MS",
						"technique": "Direct Injection",
						"subTechnique": "DI"
				},
			}
		},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "smile",
					"columnPrefix": "Parameter Value",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "retention_time",
					"columnPrefix": "Parameter Value",
					"controlLists": null,
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 12,
					"minLength": 0,
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
# title: All 'retention_time' values are empty.
# description: All 'retention_time' values are empty.
test_rule_m_300_100_001_02_violation_01 if {
	result := rules.rule_m_300_100_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "smile",
					"columnName": "smile", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 2},
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "retention_time",
					"columnName": "retention_time", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 5},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF", "columnIndex": 6},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF.1", "columnIndex": 7},
			],
			"columns": [
				"smile",
				"Term Source REF",
				"Term Accession Number",
				"retention_time",
				"Term Source REF.1",
				"Term Accession Number.1",
				"Protocol REF",
				"Protocol REF.1",
			],
			"data": {
				"smile": ["1", "2 ", "", "1234"],
				"Term Source REF": ["UO", "EFO", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
				"retention_time": ["122x", "", "", "4411.21222"],
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
		"assays": {
			"a_MTBLS1.txt": {
				"referencedAssignmentFiles": [
						"m_MTBLS1.tsv"
				],
				"assayTechnique": {
						"name": "LC-MS",
						"mainTechnique": "MS",
						"technique": "Direct Injection",
						"subTechnique": "LC"
				},
			}
		},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "smile",
					"columnPrefix": "Parameter Value",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "retention_time",
					"columnPrefix": "Parameter Value",
					"controlLists": null,
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 12,
					"minLength": 0,
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
	count(result) == 1
}

#########################################################################################################
# rule_m_300_100_001_03
#########################################################################################################

# METADATA
# title: All 'retention_time' values are numeric.
# description: All 'retention_time' values are numeric.
test_rule_m_300_100_001_03_no_violation_01 if {
	result := rules.rule_m_300_100_001_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "smile",
					"columnName": "smile", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 2},
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "retention_time",
					"columnName": "retention_time", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 5},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF", "columnIndex": 6},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF.1", "columnIndex": 7},
			],
			"columns": [
				"smile",
				"Term Source REF",
				"Term Accession Number",
				"retention_time",
				"Term Source REF.1",
				"Term Accession Number.1",
				"Protocol REF",
				"Protocol REF.1",
			],
			"data": {
				"smile": ["1", "2 ", "", "1234"],
				"Term Source REF": ["UO", "EFO", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
				"retention_time": ["122", "2333.1", "1233", "4411.21222"],
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
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "smile",
					"columnPrefix": "Parameter Value",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "retention_time",
					"columnPrefix": "Parameter Value",
					"controlLists": null,
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 12,
					"minLength": 0,
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
# title: All 'retention_time' values should be numeric.
# description: All 'retention_time' values should be numeric.
test_rule_m_300_100_001_03_violation_01 if {
	result := rules.rule_m_300_100_001_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "smile",
					"columnName": "smile", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number", "columnIndex": 2},
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "retention_time",
					"columnName": "retention_time", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnName": "Term Source REF.1", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Accession Number", "columnName": "Term Accession Number.1", "columnIndex": 5},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF", "columnIndex": 6},
				{"columnCategory": "Protocol", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnName": "Protocol REF.1", "columnIndex": 7},
			],
			"columns": [
				"smile",
				"Term Source REF",
				"Term Accession Number",
				"retention_time",
				"Term Source REF.1",
				"Term Accession Number.1",
				"Protocol REF",
				"Protocol REF.1",
			],
			"data": {
				"smile": ["1", "2 ", "", "1234"],
				"Term Source REF": ["UO", "EFO", "", " "],
				"Term Accession Number": ["UOO", "EFO", "MTBLS", "NCBITaxon"],
				"retention_time": ["122x", "2333.1|2.34|122", "1233.0|122.777s", "4411.21222"],
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
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "smile",
					"columnPrefix": "Parameter Value",
					"controlLists": {"termSourceRef": "prioritisedOrganismRefSources"},
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "retention_time",
					"columnPrefix": "Parameter Value",
					"controlLists": null,
					"defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 12,
					"minLength": 0,
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
	count(result) == 1
}


#########################################################################################################
# rule_m_300_200_001_01
#########################################################################################################

# METADATA
# title: Values for chemical_shift column numeric in metabolite assignment file.
# description: Values for chemical_shift column numeric in metabolite assignment file.
test_rule_m_300_200_001_01_no_violation_01 if {
		result := rules.rule_m_300_200_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {"assayTechnique": {"mainTechnique": "NMR"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [ 
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnName": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "multiplicity", "columnName": "multiplicity", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "chemical_shift", "columnName": "chemical_shift", "columnIndex": 2},
			],
			"columns": [
				"Sample Name",
				"multiplicity",
				"chemical_shift"
			],
			"data": {
				"Sample Name": ["1", "2 ", "3", "4"],
				"multiplicity": ["1", "2 ", "3", "1"],
				"chemical_shift": ["1", "2", "3", "1"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
	count(result) == 0
}

# METADATA
# title: Values for chemical_shift column not numeric in metabolite assignment file.
# description: Values for chemical_shift column not numeric in metabolite assignment file.
test_rule_m_300_200_001_01_violation_01 if {
		result := rules.rule_m_300_200_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {"assayTechnique": {"mainTechnique": "NMR"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [ 
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnName": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "multiplicity", "columnName": "multiplicity", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "chemical_shift", "columnName": "chemical_shift", "columnIndex": 2},
			],
			"columns": [
				"Sample Name",
				"multiplicity",
				"chemical_shift"
			],
			"data": {
				"Sample Name": ["1", "2 ", "3", "4"],
				"multiplicity": ["1", "2 ", "3", "1"],
				"chemical_shift": ["1", "2 ", "", ""],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
	count(result) == 1
}



#########################################################################################################
# rule_m_300_200_001_02
#########################################################################################################

# METADATA
# title: Values for chemical_shift column numeric in metabolite assignment file.
# description: Values for chemical_shift column numeric in metabolite assignment file.
test_rule_m_300_200_001_02_no_violation_01 if {
		result := rules.rule_m_300_200_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {"assayTechnique": {"mainTechnique": "NMR"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [ 
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnName": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "multiplicity", "columnName": "multiplicity", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "chemical_shift", "columnName": "chemical_shift", "columnIndex": 2},
			],
			"columns": [
				"Sample Name",
				"multiplicity",
				"chemical_shift"
			],
			"data": {
				"Sample Name": ["1", "2 ", "3", "4"],
				"multiplicity": ["1", "2 ", "3", "1"],
				"chemical_shift": ["1", "2", "3", "1"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
	count(result) == 0
}

# METADATA
# title: Values for chemical_shift column not numeric in metabolite assignment file.
# description: Values for chemical_shift column not numeric in metabolite assignment file.
test_rule_m_300_200_001_02_violation_01 if {
		result := rules.rule_m_300_200_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {"assayTechnique": {"mainTechnique": "NMR"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [ 
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnName": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "multiplicity", "columnName": "multiplicity", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "chemical_shift", "columnName": "chemical_shift", "columnIndex": 2},
			],
			"columns": [
				"Sample Name",
				"multiplicity",
				"chemical_shift"
			],
			"data": {
				"Sample Name": ["1", "2 ", "3", "4"],
				"multiplicity": ["1", "2 ", "3", "1"],
				"chemical_shift": ["1", "2 ", "3", "1..2"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
	count(result) == 1
}



#########################################################################################################
# rule_m_300_200_001_03
#########################################################################################################

# METADATA
# title: Values for multiplicity column  in metabolite assignment file.
# description: Values for multiplicity column  in metabolite assignment file.
test_rule_m_300_200_001_03_no_violation_01 if {
		result := rules.rule_m_300_200_001_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {"assayTechnique": {"mainTechnique": "NMR"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnName": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "multiplicity", "columnName": "multiplicity", "columnIndex": 1},
			],
			"columns": [
				"Sample Name",
				"multiplicity",
			],
			"data": {
				"Sample Name": ["1", "2 ", "3", "4"],
				"multiplicity": ["1", "2 ", "3", "1"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
	count(result) == 0
}

# METADATA
# title: Values for multiplicity column not in metabolite assignment file.
# description: Values for multiplicity column not in metabolite assignment file.
test_rule_m_300_200_001_03_violation_01 if {
	result := rules.rule_m_300_200_001_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {"assayTechnique": {"mainTechnique": "NMR"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnName": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "multiplicity", "columnName": "multiplicity", "columnIndex": 1},
			],
			"columns": [
				"Sample Name",
				"multiplicity",
			],
			"data": {
				"Sample Name": ["1", "2 ", "3", " "],
				"multiplicity": ["1", "2 ", "3", ""],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
	count(result) == 1
}
