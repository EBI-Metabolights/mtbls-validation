#########################################################################################################
# Unit tests for rule_s_100_100_001_02
#########################################################################################################
package tests.sample_test

import data.metabolights.validation.v2.rules.phase1.violations as rules
import rego.v1

# METADATA
# title: Unordered or unlinked column structure in sample file.
# description: There is an unordered or unlinked column in sample file. Check column order.
# custom:
#  rule_id: rule_s_100_100_001_02
#  type: ERROR
#  priority: CRITICAL
#  section: samples.columns
rule_s_100_100_001_02_test_cases := 1

# METADATA
# title: There is no Unordered or unlinked column in the sample file
# description: There is no Unordered or unlinked column in the sample file
test_rule_s_100_100_001_02_no_violation_01 if {
	result := rules.rule_s_100_100_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 9},
				{"columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Organism", "columnIndex": 9},
				{"columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Factorx", "columnIndex": 9},
				{"columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Term Source REF", "columnIndex": 9},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: There is  Unordered or unlinked columns in the sample file
# description: There is  Unordered or unlinked columns in the sample file
test_rule_s_100_100_001_02_violation_01 if {
	result := rules.rule_s_100_100_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnStructure": "ADDITIONAL_COLUMN", "columnHeader": "Sample Name", "columnIndex": 9},
				{"columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Organism", "columnIndex": 3},
				{"columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Factorx", "columnIndex": 9},
				{"columnStructure": "ADDITIONAL_COLUMN", "columnHeader": "Term Source REF", "columnIndex": 2},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 2
}
