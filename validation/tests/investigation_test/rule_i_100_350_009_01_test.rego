#########################################################################################################
# Unit tests for rule_i_100_350_009_01
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study Protocol Parameters Name not used in assay files.
# description: Study Protocol Parameters Name values in i_Investigation.txt must be referenced by at least one assay Parameter Value column.
# custom:
#  rule_id: rule_i_100_350_009_01
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.studyProtocols
rule_i_100_350_009_01_test_cases := 1

# METADATA
# title: Study protocol parameters are used in assay files.
# description: All study protocol parameters are referenced by at least one assay Parameter Value column.
test_rule_i_100_350_009_01_no_violation_01 if {
	result := rules.rule_i_100_350_009_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [
			{"name": "Mass spectrometry", "parameters": [
				{"term": "Scan polarity", "termAccessionNumber": "", "termSourceRef": ""},
				{"term": "Scan m/z range", "termAccessionNumber": "", "termSourceRef": ""},
			]},
			{"name": "Chromatography", "parameters": [{"term": "Column model", "termAccessionNumber": "", "termSourceRef": ""}]},
		]}}]},
		"assays": {
			"a_MTBLS1_ms.txt": {"table": {"headers": [
				{"columnHeader": "Parameter Value[Scan polarity]", "columnIndex": 1},
				{"columnHeader": "Parameter Value[Scan m/z range]", "columnIndex": 2},
			]}},
			"a_MTBLS1_chromatography.txt": {"table": {"headers": [{"columnHeader": "Parameter Value[Column model]", "columnIndex": 1}]}},
		},
	}
	count(result) == 0
}

# METADATA
# title: Study protocol parameters are not used in assay files.
# description: Study protocol parameter names missing from all assay Parameter Value columns are reported.
test_rule_i_100_350_009_01_violation_01 if {
	result := rules.rule_i_100_350_009_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyProtocols": {"protocols": [
			{"name": "Mass spectrometry", "parameters": [
				{"term": "Scan polarity", "termAccessionNumber": "", "termSourceRef": ""},
				{"term": "Mass analyzer", "termAccessionNumber": "", "termSourceRef": ""},
			]},
			{"name": "Chromatography", "parameters": [{"term": "Column model", "termAccessionNumber": "", "termSourceRef": ""}]},
		]}}]},
		"assays": {"a_MTBLS1_ms.txt": {"table": {"headers": [
			{"columnHeader": "Parameter Value[Scan polarity]", "columnIndex": 1},
			{"columnHeader": "Parameter Value[Column model]", "columnIndex": 2},
		]}}},
	}
	count(result) == 1
	violation := result[_]
	violation.identifier == "rule_i_100_350_009_01"
	"Mass analyzer" in violation.values
}
