#########################################################################################################
# Unit tests for rule___100_300_001_02
#########################################################################################################
package tests.input_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: There is a file parse error for the assay file.
# description: There is a file parse error for the assay file.
# custom:
#  rule_id: rule___100_300_001_02
#  type: ERROR
#  priority: HIGH
#  section: assays.general
rule___100_300_001_02_test_cases := 1

# METADATA
# title: There is no  parser error
# description: There is no  parser error
test_rule___100_300_001_02_no_violation_01 if {
	result := rules.rule___100_300_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "WARNING",
			},
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "WARNING",
			},
		]},
	}
	count(result) == 0
}

# METADATA
# title: There is no  parser error
# description: There is no  parser error
test_rule___100_300_001_02_no_violation_02 if {
	result := rules.rule___100_300_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: There is one  parser error
# description: There is one  parser error
test_rule___100_300_001_02_violation_01 if {
	result := rules.rule___100_300_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "ERROR",
			},
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "WARNING",
			},
		]},
	}
	count(result) == 1
	some error in result
	count(error.values) == 1
}

# METADATA
# title: There are two  parser errors
# description: There are two  parser errors
test_rule___100_300_001_02_violation_02 if {
	result := rules.rule___100_300_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "ERROR",
			},
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "ERROR",
			},
		]},
	}
	count(result) == 1
	some result_object in result
	count(result_object.values) == 2
}
