#########################################################################################################
# Unit tests for rule___100_400_001_01
#########################################################################################################
package tests.input_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: There is a critical file parse error for the metabolite assignment file.
# description: There is a critical file parse error for the metabolite assignment file.
# custom:
#  rule_id: rule___100_400_001_01
#  type: ERROR
#  priority: CRITICAL
#  section: metabolites.parserMessages
rule___100_400_001_01_test_cases := 1

# METADATA
# title: There is no critical parser error
# description: There is no critical parser error
test_rule___100_400_001_01_no_violation_01 if {
	result := rules.rule___100_400_001_01 with input as {
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
	count(result) == 0
}

# METADATA
# title: There is no critical parser error
# description: There is no critical parser error
test_rule___100_400_001_01_no_violation_02 if {
	result := rules.rule___100_400_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"m_MTBLS1.tsv": []},
	}
	count(result) == 0
}

# METADATA
# title: There is one critical parser error
# description: There is one critical parser error
test_rule___100_400_001_01_violation_01 if {
	result := rules.rule___100_400_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"m_MTBLS1.tsv": [{
			"column": "",
			"detail": "Critical message.",
			"line": "",
			"section": "",
			"short": "test 1",
			"type": "CRITICAL",
		}]},
	}
	count(result) == 1
	some result_object in result
	count(result_object.values) == 1
}

# METADATA
# title: There are two critical parser errors
# description: There are two critical parser errors
test_rule___100_400_001_01_violation_02 if {
	result := rules.rule___100_400_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"m_MTBLS1.tsv": [
			{
				"column": "",
				"detail": "Critical message.",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "CRITICAL",
			},
			{
				"column": "",
				"detail": "Critical message.",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "CRITICAL",
			},
		]},
	}
	count(result) == 1
	some result_object in result
	count(result_object.values) == 2
}
