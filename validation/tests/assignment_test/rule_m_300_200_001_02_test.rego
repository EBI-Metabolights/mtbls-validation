#########################################################################################################
# Unit tests for rule_m_300_200_001_02
#########################################################################################################
package tests.assignment_test

import data.metabolights.validation.v2.rules.phase3.violations as rules

import rego.v1

# METADATA
# title: chemical_shift column values not numeric in metabolite assignment file.
# description: All 'chemical_shift' column values should be numeric in metabolite assignment file.
# custom:
#  rule_id: rule_m_300_200_001_02
#  type: WARNING
#  priority: HIGH
#  section: metabolites.nmr
rule_m_300_200_001_02_test_cases := 1

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
				"chemical_shift",
			],
			"data": {
				"Sample Name": ["1", "2 ", "3", "4"],
				"multiplicity": ["1", "2 ", "3", "1"],
				"chemical_shift": ["1", "2", "3", "1"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum", "templateVersion": "2.0"},
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
				"chemical_shift",
			],
			"data": {
				"Sample Name": ["1", "2 ", "3", "4"],
				"multiplicity": ["1", "2 ", "3", "1"],
				"chemical_shift": ["1", "2 ", "3", "1..2"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum", "templateVersion": "2.0"},
	}
	count(result) == 1
}
