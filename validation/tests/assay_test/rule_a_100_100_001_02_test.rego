#########################################################################################################
# Unit tests for rule_a_100_100_001_02
#########################################################################################################
package tests.assay_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Unordered or unlinked column structure in assay file.
# description: There is an unordered or unlinked column in assay file. Check column order.
# custom:
#  rule_id: rule_a_100_100_001_02
#  type: ERROR
#  priority: CRITICAL
#  section: assays.columns
rule_a_100_100_001_02_test_cases := 1

# METADATA
# title: There is no Unordered or unlinked column in the assay file
# description: There is no Unordered or unlinked column in the assay file
test_rule_a_100_100_001_02_no_violation_01 if {
	result := rules.rule_a_100_100_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 9},
				{"columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Organism", "columnIndex": 9},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Factorx", "columnIndex": 9},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Term Source REF", "columnIndex": 9},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: There is  Unordered or unlinked columns in the assay file
# description: There is  Unordered or unlinked columns in the assay file
test_rule_a_100_100_001_02_violation_01 if {
	result := rules.rule_a_100_100_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnPrefix": "", "columnStructure": "ADDITIONAL_COLUMN", "columnHeader": "Sample Name", "columnIndex": 9},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Organism", "columnIndex": 3},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Factorx", "columnIndex": 9},
				{"columnPrefix": "", "columnStructure": "ADDITIONAL_COLUMN", "columnHeader": "Term Source REF", "columnIndex": 2},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 2
}
