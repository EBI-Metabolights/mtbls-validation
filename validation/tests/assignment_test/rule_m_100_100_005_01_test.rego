#########################################################################################################
# Unit tests for rule_m_100_100_005_01
#########################################################################################################
package tests.assignment_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Metabolite assignment file name not correct pattern.
# description: Metabolite assignment file name must start with 'm_' and have extension '.tsv'.
# custom:
#  rule_id: rule_m_100_100_005_01
#  type: ERROR
#  priority: CRITICAL
#  section: metabolites.general
rule_m_100_100_005_01_test_cases := 1

# METADATA
# title: Assignment file name is valid.
# description:  Assignment file name is valid.
test_rule_m_100_100_005_01_no_violation_01 if {
	result := rules.rule_m_100_100_005_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {"table": {"rowOffset": 0, "totalRowCount": 10}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: Assignment file name is not valid.
# description:  Assignment file name is not valid.
test_rule_m_100_100_005_01_violation_01 if {
	result := rules.rule_m_100_100_005_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"a_MTBLS1.tsv": {"table": {"rowOffset": 0, "totalRowCount": 1}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 1
}

# METADATA
# title: Assignment file name is not valid.
# description:  Assignment file name is not valid.
test_rule_m_100_100_005_01_violation_02 if {
	result := rules.rule_m_100_100_005_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.txt": {"table": {"rowOffset": 0, "totalRowCount": 1}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 1
}

# METADATA
# title: Assignment file name is not valid.
# description:  Assignment file name is not valid.
test_rule_m_100_100_005_01_violation_03 if {
	result := rules.rule_m_100_100_005_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"": {"table": {"rowOffset": 0, "totalRowCount": 1}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 1
}
