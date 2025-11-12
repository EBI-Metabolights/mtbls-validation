# Unit tests for rule_a_100_100_001_03
package tests.assay_test
import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1
# METADATA
# title: Default columns not in assay file.
# description: Default columns must exist in assay file.
# custom:
#  rule_id: rule_a_100_100_001_03
#  type: ERROR
#  priority: CRITICAL
#  section: assays.columns
test_rule_a_100_100_001_03 := true

# METADATA
# title: All default columns are in assay file
# description: All default columns are in assay file
test_rule_a_100_100_001_03_no_violation_01 if {
	result := rules.rule_a_100_100_001_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnPrefix": "", "columnStructure": "ADDITIONAL_COLUMN", "columnHeader": "Sample Name", "columnIndex": 9},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Parameter Value[Scan polarity]", "columnIndex": 3},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Factorx", "columnIndex": 9},
				{"columnPrefix": "", "columnStructure": "ADDITIONAL_COLUMN", "columnHeader": "Term Source REF", "columnIndex": 2},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_ASSAY_HEADERS as {"a_MTBLS1.txt": {"headers": {
			{"columnHeader": "Sample Name", "required": true},
			{"columnHeader": "Parameter Value[Scan polarity]", "required": true},
		}}}
	count(result) == 0
}

# METADATA
# title: Some default columns are not in assay file
# description: Normalization Name and Parameter Value[Scan m/z range] are not in assay file.
test_rule_a_100_100_001_03_violation_01 if {
	result := rules.rule_a_100_100_001_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnPrefix": "", "columnStructure": "ADDITIONAL_COLUMN", "columnHeader": "Sample Name", "columnIndex": 9},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Parameter Value[Scan polarity]", "columnIndex": 3},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "Factorx", "columnIndex": 9},
				{"columnPrefix": "", "columnStructure": "ADDITIONAL_COLUMN", "columnHeader": "Term Source REF", "columnIndex": 2},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_ASSAY_HEADERS as {"a_MTBLS1.txt": {"headers": {
			{"columnHeader": "Sample Name", "required": true},
			{"columnHeader": "Parameter Value[Scan polarity]", "required": true},
			{"columnHeader": "Parameter Value[Scan m/z range]", "required": true},
			{"columnHeader": "Normalization Name", "required": true},
			{"columnHeader": "Parameter Value[Mass analyzer]", "required": false},
		}}}
	count(result) == 1
}