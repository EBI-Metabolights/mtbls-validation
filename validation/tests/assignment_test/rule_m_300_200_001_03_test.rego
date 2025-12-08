#########################################################################################################
# Unit tests for rule_m_300_200_001_03
#########################################################################################################
package tests.assignment_test

import data.metabolights.validation.v2.rules.phase3.violations as rules

import rego.v1

# METADATA
# title: multiplicity column has empty values in metabolite assignment file.
# description: All 'multiplicity' column values should be defined in metabolite assignment file.
# custom:
#  rule_id: rule_m_300_200_001_03
#  type: WARNING
#  priority: CRITICAL
#  section: metabolites.nmr
rule_m_300_200_001_03_test_cases := 1

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
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum", "templateVersion": "2.0"},
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
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum", "templateVersion": "2.0"},
	}
	count(result) == 1
}
