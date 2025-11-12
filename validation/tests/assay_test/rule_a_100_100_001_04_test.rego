# Unit tests for rule_a_100_100_001_04
package tests.assay_test
import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1
# METADATA
# title: Unexpected column in assay file.
# description: Rename or remove unexpected columns in assay file.
# custom:
#  rule_id: rule_a_100_100_001_04
#  type: ERROR
#  priority: CRITICAL
#  section: assays.columns
test_rule_a_100_100_001_04 := true

# METADATA
# title: All columns are expected.
# description: All columns are expected.
test_rule_a_100_100_001_04_no_violation_01 if {
	result := rules.rule_a_100_100_001_04 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "ADDITIONAL_COLUMN", "columnHeader": "Sample Name", "columnIndex": 9},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Parameter Value[Scan polarity]", "columnIndex": 3},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "LINKED_COLUMN", "columnHeader": "Term Source REF", "columnIndex": 1},
				{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "", "columnHeader": "Protocol REF", "columnIndex": 1},
				{"columnCategory": "Comment", "columnPrefix": "", "columnStructure": "", "columnHeader": "Comment[Sample]", "columnIndex": 10},
				{"columnCategory": "Parameter Value", "columnPrefix": "", "columnStructure": "", "columnHeader": "Parameter Value[Age]", "columnIndex": 11},
				{"columnCategory": "Characteristics", "columnPrefix": "", "columnStructure": "", "columnHeader": "Parameter Value[Scan m/z range]", "columnIndex": 12},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Normalization Name", "columnIndex": 13},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 13},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_ASSAY_HEADER_NAMES as {"a_MTBLS1.txt": {
			"Sample Name",
			"Parameter Value[Scan polarity]",
			"Parameter Value[Scan m/z range]",
			"Normalization Name",
			"Parameter Value[Mass analyzer]",
		}}
	count(result) == 0
}
