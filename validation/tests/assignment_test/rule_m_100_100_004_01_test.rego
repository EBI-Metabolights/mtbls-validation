#########################################################################################################
# Unit tests for rule_m_100_100_004_01
#########################################################################################################
package tests.assignment_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Metabolite assignment file not referenced in assay file.
# description: Metabolite assignment file must be referenced in assay file.
# custom:
#  rule_id: rule_m_100_100_004_01
#  type: ERROR
#  priority: CRITICAL
#  section: metabolites.general
rule_m_100_100_004_01_test_cases := 1

# METADATA
# title: Metabolite assignment file name is referenced in an assay file.
# description: MMetabolite assignment file name is referenced in an assay file.
test_rule_m_100_100_004_01_no_violation_01 if {
	result := rules.rule_m_100_100_004_01 with input as {
		"assays": {
			"a_MTBLS1.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"Sample1",
					"Sample2",
					"Sample3",
				],
			},
			"a_MTBLS1x.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"Sample2",
					"Sample3",
					"Sample4",
				],
			},
		},
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "columnIndex": 1},
				{"columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "chemical_formula", "columnIndex": 2},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "smiles", "columnIndex": 3},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "inchi", "columnIndex": 4},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 4},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Sample1", "columnIndex": 5},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Sample2", "columnIndex": 6},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Sample3", "columnIndex": 7},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Sample4", "columnIndex": 8},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum", "templateVersion": "2.0"},
	}

	count(result) == 0
}

# METADATA
# title: Metabolite assignment file name is not referenced in an assay file.
# description: Metabolite assignment file name is not referenced in an assay file.
test_rule_m_100_100_004_01_violation_01 if {
	result := rules.rule_m_100_100_004_01 with input as {
		"assays": {
			"a_MTBLS1.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"Sample1",
					"Sample2",
					"Sample3",
				],
			},
			"a_MTBLS1x.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"Sample2",
					"Sample3",
					"Sample4",
				],
			},
		},
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS3.txt": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "columnIndex": 1},
				{"columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "chemical_formula", "columnIndex": 2},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "smiles", "columnIndex": 3},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "inchi", "columnIndex": 4},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 4},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Sample1", "columnIndex": 5},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Sample4", "columnIndex": 8},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum", "templateVersion": "2.0"},
	}
	count(result) == 1
}
