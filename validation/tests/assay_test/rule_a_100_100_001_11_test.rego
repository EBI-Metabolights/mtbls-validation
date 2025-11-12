# Unit tests for rule_a_100_100_001_11
package tests.assay_test
import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1
# METADATA
# title: Assay Parameter Value names not in investigation file.
# description: Assay Parameter Value names must be referenced in i_Investigation.txt.
# custom:
#  rule_id: rule_a_100_100_001_11
#  type: ERROR
#  priority: CRITICAL
#  section: assays.columns
test_rule_a_100_100_001_11 := true

# METADATA
# title: Assay Parameter Values names in investigation file.
# description: Assay Parameter Values names in investigation file.
test_rule_a_100_100_001_11_no_violation_01 if {
	result := rules.rule_a_100_100_001_11 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 1},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Parameter Value[Scan polarity]", "columnIndex": 3},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Normalization Name", "columnIndex": 8},
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
	}
		with input.investigation.studies as [
			{
			"studyProtocols": {
				"protocols": [ {
					"parameters": [{"term": "Scan polarity"}, {"term": "Age"}, {"term": "Scan m/z range"}]
				}]
			}}
		]
	count(result) == 0
}

# METADATA
# title: Assay Parameter Values names not in investigation file.
# description: Assay Parameter Values names not in investigation file.
test_rule_a_100_100_001_11_violation_01 if {
	result := rules.rule_a_100_100_001_11 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnCategory": "Protocol", "columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "Protocol REF", "columnIndex": 1},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "", "columnHeader": "Parameter Value[Scan polarity]", "columnIndex": 3},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Normalization Name", "columnIndex": 8},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "", "columnHeader": "Derived Spectral Data File", "columnIndex": 20},
				{"columnCategory": "", "columnPrefix": "", "columnStructure": "", "columnHeader": "Parameter Value[Column model]", "columnIndex": 32},
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
		with input.investigation.studies as [
			{
			"studyProtocols": {
				"protocols": [ {
					"parameters": [{"term": "Scan polarity"}, {"term": "Age"}, {"term": "Scan m/z range"}]
				}]
			}}
		]
	count(result) == 1
}
