# Unit tests for rule_a_100_100_001_12
package tests.assay_test
import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1
# METADATA
# title: Column name defined in MetaboLights template does not exist in assay file.
# description: Add all missing columns defined in MetaboLights assay template.
# custom:
#  rule_id: rule_a_100_100_001_12
#  type: ERROR
#  priority: CRITICAL
#  section: assays.columns
test_rule_a_100_100_001_12 := true

# METADATA
# title: Parameter Value column names are defined.
# description: Parameter Value column names are defined.
test_rule_a_100_100_001_12_no_violation_01 if {
	result := rules.rule_a_100_100_001_12 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 1},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Parameter Value[Scan polarity]", "columnIndex": 3},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Normalization Name", "columnIndex": 8},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Derived Spectral Data File", "columnIndex": 20},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Derived Spectral Data File", "columnIndex": 32},
				{"columnCategory": "Parameter Value", "columnPrefix": "", "columnStructure": "", "columnHeader": "Parameter Value[Age]", "columnIndex": 33},
				{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 34},
				{"columnCategory": "Characteristics", "columnPrefix": "", "columnStructure": "", "columnHeader": "Parameter Value[Scan m/z range]", "columnIndex": 36},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 37},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Spectral Raw Data File", "columnIndex": 38},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_ASSAY_HEADERS as {"a_MTBLS1.txt": [{"version": "2.0", "headers": [
			{"columnCategory": "", 
			"columnHeader": "Spectral Raw Data File", 
			"columnIndex": 3
			}
		]}]}
	count(result) == 0
}

# METADATA
# title: Parameter Value column names are not defined
# description: Parameter Value column names are not defined
test_rule_a_100_100_001_12_violation_01 if {
	result := rules.rule_a_100_100_001_12 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 1},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Parameter Value[Scan polarity]", "columnIndex": 3},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Normalization Name", "columnIndex": 8},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "", "columnHeader": "Derived Spectral Data File", "columnIndex": 20},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "", "columnHeader": "Derived Spectral Data File", "columnIndex": 32},
				{"columnCategory": "Parameter Value", "columnPrefix": "", "columnStructure": "", "columnHeader": "Parameter Value[Age]", "columnIndex": 33},
				{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 34},
				{"columnCategory": "Characteristics", "columnPrefix": "", "columnStructure": "", "columnHeader": "Parameter Value[Scan m/z range]", "columnIndex": 36},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Sample Name", "columnIndex": 37},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_ASSAY_HEADERS as {"a_MTBLS1.txt": [{"version": "2.0", "headers": [
			{"columnCategory": "Spectral Raw Data File", 
			"columnHeader": "Spectral Raw Data File", 
			"columnIndex": 3
			}
		]}]}
	count(result) == 1
}
