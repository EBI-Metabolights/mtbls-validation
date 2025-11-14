#########################################################################################################
# Unit tests for rule_m_100_100_001_03
#########################################################################################################
package tests.assignment_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Empty columns in metabolite assignment file.
# description: Empty columns must not exist in metabolite assignment file. All column headers should be defined.
# custom:
#  rule_id: rule_m_100_100_001_03
#  type: ERROR
#  priority: CRITICAL
#  section: metabolites.general
rule_m_100_100_001_03_test_cases := 1

# METADATA
# title: Metabolite assignment file has no empty column headers.
# description: Metabolite assignment file has empty column headers.
test_rule_m_100_100_001_03_no_violation_01 if {
	result := rules.rule_m_100_100_001_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "columnIndex": 1},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "chemical_formula", "columnIndex": 2},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "smiles", "columnIndex": 3},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "inchi", "columnIndex": 4},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 5},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum", "templateVersion": "2.0"},
	}
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "defaultColumnIndex": 1},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "chemical_formula", "defaultColumnIndex": 2},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "smiles", "defaultColumnIndex": 3},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "inchi", "defaultColumnIndex": 4},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "metabolite_identification", "defaultColumnIndex": 5},
			],
		}]}
	count(result) == 0
}

# METADATA
# title: Metabolite assignment file has no empty column headers.
# description: Metabolite assignment file has empty column headers.
test_rule_m_100_100_001_03_violation_01 if {
	result := rules.rule_m_100_100_001_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {
			"m_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
				"rowOffset": 0, "totalRowCount": 0,
				"headers": [
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "columnIndex": 1},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "chemical_formula", "columnIndex": 2},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "inchi", "columnIndex": 4},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 4},
				],
			}},
			"m_MTBLS2.txt": {"table": {
				"rowOffset": 0, "totalRowCount": 0,
				"headers": [
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "defaultColumnIndex": 1},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": " ", "defaultColumnIndex": 2},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "smiles", "defaultColumnIndex": 3},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "", "defaultColumnIndex": 4},
					{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "metabolite_identification", "defaultColumnIndex": 5},
				],
			}},
		},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum", "templateVersion": "2.0"},
	}
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "defaultColumnIndex": 1},
				{"columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "chemical_formula", "defaultColumnIndex": 2},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 3},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "smiles", "defaultColumnIndex": 4},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "inchi", "defaultColumnIndex": 5},
			],
		}]}
	count(result) == 1
}
