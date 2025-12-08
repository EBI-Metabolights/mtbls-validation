#########################################################################################################
# Unit tests for rule_m_300_100_001_02
#########################################################################################################
package tests.assignment_test

import data.metabolights.validation.v2.rules.phase3.violations as rules

import rego.v1

# METADATA
# title: retention_time column has empty values in metabolite assignment file.
# description: All 'retention_time' column values must be defined in metabolite assignment file for LC-MS / GC-MS.
# custom:
#  rule_id: rule_m_300_100_001_02
#  type: ERROR
#  priority: HIGH
#  section: metabolites.lcms
rule_m_300_100_001_02_test_cases := 1

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
		"assays": {"a_MTBLS1.txt": {
			"referencedAssignmentFiles": ["m_MTBLS1.tsv"],
			"assayTechnique": {
				"name": "LC-MS",
				"mainTechnique": "MS",
				"technique": "Direct Injection",
				"subTechnique": "LC",
			},
		}},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum", "templateVersion": "2.0"},
	}
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "smile",
					"columnPrefix": "Parameter Value", "defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "retention_time",
					"columnPrefix": "Parameter Value", "defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 12,
					"minLength": 0,
					"required": true,
				},
				{
					"columnStructure": "SINGLE_COLUMN",
					"columnCategory": "Protocol",
					"columnHeader": "Protocol REF",
					"columnPrefix": "", "defaultColumnIndex": 7,
					"defaultValue": "Extraction",
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
				{
					"columnStructure": "SINGLE_COLUMN",
					"columnCategory": "Protocol",
					"columnHeader": "Protocol REF",
					"columnPrefix": "", "defaultColumnIndex": 7,
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
		"assays": {"a_MTBLS1.txt": {
			"referencedAssignmentFiles": ["m_MTBLS1.tsv"],
			"assayTechnique": {
				"name": "DI-MS",
				"mainTechnique": "MS",
				"technique": "Direct Injection",
				"subTechnique": "DI",
			},
		}},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum", "templateVersion": "2.0"},
	}
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "smile",
					"columnPrefix": "Parameter Value", "defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "retention_time",
					"columnPrefix": "Parameter Value", "defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 12,
					"minLength": 0,
					"required": true,
				},
				{
					"columnStructure": "SINGLE_COLUMN",
					"columnCategory": "Protocol",
					"columnHeader": "Protocol REF",
					"columnPrefix": "", "defaultColumnIndex": 7,
					"defaultValue": "Extraction",
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
				{
					"columnStructure": "SINGLE_COLUMN",
					"columnCategory": "Protocol",
					"columnHeader": "Protocol REF",
					"columnPrefix": "", "defaultColumnIndex": 7,
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
		"assays": {"a_MTBLS1.txt": {
			"referencedAssignmentFiles": ["m_MTBLS1.tsv"],
			"assayTechnique": {
				"name": "LC-MS",
				"mainTechnique": "MS",
				"technique": "Direct Injection",
				"subTechnique": "LC",
			},
		}},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum", "templateVersion": "2.0"},
	}
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "smile",
					"columnPrefix": "Parameter Value", "defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
				{
					"columnStructure": "ONTOLOGY_COLUMN",
					"columnCategory": "Parameter Value",
					"columnHeader": "retention_time",
					"columnPrefix": "Parameter Value", "defaultColumnIndex": 1,
					"defaultValue": null,
					"maxLength": 12,
					"minLength": 0,
					"required": true,
				},
				{
					"columnStructure": "SINGLE_COLUMN",
					"columnCategory": "Protocol",
					"columnHeader": "Protocol REF",
					"columnPrefix": "", "defaultColumnIndex": 7,
					"defaultValue": "Extraction",
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
				{
					"columnStructure": "SINGLE_COLUMN",
					"columnCategory": "Protocol",
					"columnHeader": "Protocol REF",
					"columnPrefix": "", "defaultColumnIndex": 7,
					"defaultValue": "Metabolite identification",
					"maxLength": 0,
					"minLength": 0,
					"required": false,
				},
			],
		}]}
	count(result) == 1
}
