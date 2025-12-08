#########################################################################################################
# Unit tests for rule___100_300_001_07
#########################################################################################################
package tests.input_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Technology type not supported for assay file.
# description: Assay file technology type not supported.
# custom:
#  rule_id: rule___100_300_001_07
#  type: ERROR
#  priority: CRITICAL
#  section: assays.general
rule___100_300_001_07_test_cases := 1

# METADATA
# title: Assay file technology type is supported.
# description:  Assay file technology type is defined.
test_rule___100_300_001_07_no_violation_01 if {
	result := rules.rule___100_300_001_07 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"filePath": "a_MTBLS1.txt", "table": {"rowOffset": 0, "totalRowCount": 1}, "assayTechnique": {
			"name": "LC-MS",
			"mainTechnique": "MS",
			"technique": "LC-MS",
			"subTechnique": "LC",
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.rules.phase1.definitions.__ASSAY_TECHNIQUES as {"a_MTBLS1.txt": "LC-MS"}
		with data.metabolights.validation.v2.templates.assayFileHeaderTemplates as {
			"LC-MS": {},
			"GC-MS": {},
		}
	count(result) == 0
}

# METADATA
# title: Assay file technology type is not supported.
# description:  Assay file technology type is not supported.
test_rule___100_300_001_07_violation_01 if {
	result := rules.rule___100_300_001_07 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"filePath": "a_MTBLS1.txt", "table": {"rowOffset": 0, "totalRowCount": 1}, "assayTechnique": {
			"name": "LC-MS",
			"mainTechnique": "MS",
			"technique": "LC-MS",
			"subTechnique": "LC",
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.rules.phase1.definitions.__ASSAY_TECHNIQUES as {"a_MTBLS1.txt": "LC-MS"}
		with data.metabolights.validation.v2.templates.assayFileHeaderTemplates as {"GC-MS": {}}

	count(result) == 1
}
