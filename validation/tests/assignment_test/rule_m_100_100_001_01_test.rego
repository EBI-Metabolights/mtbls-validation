#########################################################################################################
# Unit tests for rule_m_100_100_001_01
#########################################################################################################
package tests.assignment_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Default columns not in metabolite assignment file.
# description: Default columns must exist in metabolite assignment file.
# custom:
#  rule_id: rule_m_100_100_001_01
#  type: ERROR
#  priority: CRITICAL
#  section: metabolites.general
rule_m_100_100_001_01_test_cases := 1

# METADATA
# title: all default columns are in metabolite assignment file
# description: all default columns are in metabolite assignment file
test_rule_m_100_100_001_01_no_violation_01 if {
	result := rules.rule_m_100_100_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "columnIndex": 0},
				{"columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "chemical_formula", "columnIndex": 1},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "smiles", "columnIndex": 2},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "inchi", "columnIndex": 3},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 4},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum", "templateVersion": "2.0"},
	}
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "defaultColumnIndex": 0},
				{"columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "chemical_formula", "defaultColumnIndex": 1},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "smiles", "defaultColumnIndex": 2},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "inchi", "defaultColumnIndex": 3},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "metabolite_identification", "defaultColumnIndex": 4},
			],
		}]}
	count(result) == 0
}

# METADATA
# title: Some default columns are missing in metabolite assignment file
# description: Some default columns are missing in metabolite assignment file
test_rule_m_100_100_001_01_violation_01 if {
	result := rules.rule_m_100_100_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "columnIndex": 0},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "chemical_formula", "columnIndex": 1},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "inchi", "columnIndex": 2},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 3},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum", "templateVersion": "2.0"},
	}
		with data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates as {"MS": [{
			"version": "2.0",
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "defaultColumnIndex": 0},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "chemical_formula", "defaultColumnIndex": 1},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "smiles", "defaultColumnIndex": 2},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "inchi", "defaultColumnIndex": 3},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "metabolite_identification", "defaultColumnIndex": 4},
			],
		}]}

	count(result) == 1
}
