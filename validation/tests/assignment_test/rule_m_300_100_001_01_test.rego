#########################################################################################################
# Unit tests for rule_m_300_100_001_01
#########################################################################################################
package tests.assignment_test

import data.metabolights.validation.v2.rules.phase3.violations as rules

import rego.v1

# METADATA
# title: mass_to_charge column has empty values in metabolite assignment file.
# description: All 'mass_to_charge' column values must be defined in metabolite assignment file.
# custom:
#  rule_id: rule_m_300_100_001_01
#  type: ERROR
#  priority: HIGH
#  section: metabolites.lcms
rule_m_300_100_001_01_test_cases := 1

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
					"columnHeader": "mass_to_charge",
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
					"columnHeader": "mass_to_charge",
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
