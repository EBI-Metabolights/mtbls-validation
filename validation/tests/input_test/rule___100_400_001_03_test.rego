#########################################################################################################
# Unit tests for rule___100_400_001_03
#########################################################################################################
package tests.input_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: There is a file parse warning for the metabolite assignment file.
# description: There is a file parse warning for the metabolite assignment file.
# custom:
#  rule_id: rule___100_400_001_03
#  type: WARNING
#  priority: MEDIUM
#  section: metabolites.parserMessages
rule___100_400_001_03_test_cases := 1

# METADATA
# title: There is no  parser warning message
# description:  There is no  parser warning message
test_rule___100_400_001_03_no_violation_01 if {
	result := rules.rule___100_400_001_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"m_MTBLS1.tsv": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "INFO",
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
	count(result) == 0
}

# METADATA
# title: There is no  parser warning message
# description:  There is no  parser warning message
test_rule___100_400_001_03_no_violation_02 if {
	result := rules.rule___100_400_001_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"m_MTBLS1.tsv": []},
	}
	count(result) == 0
}

# METADATA
# title: There is one  parser warning message
# description:  There is one  parser warning message
test_rule___100_400_001_03_violation_01 if {
	result := rules.rule___100_400_001_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"m_MTBLS1.tsv": [
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
	some result_object in result
	count(result_object.values) == 1
}

# METADATA
# title: There are two  parser warning messages
# description:  There are two  parser warning messages
test_rule___100_400_001_03_violation_02 if {
	result := rules.rule___100_400_001_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"m_MTBLS1.tsv": [
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
	count(result) == 1
	some result_object in result
	count(result_object.values) == 2
}
