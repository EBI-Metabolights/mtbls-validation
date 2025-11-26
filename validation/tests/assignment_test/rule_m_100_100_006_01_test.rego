#########################################################################################################
# Unit tests for rule_m_100_100_006_01
#########################################################################################################
package tests.assignment_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: There is no row in metabolite assignment file.
# description: No row is defined in metabolite assignment file. Add more than one row (assignment). Please ensure all xxx, including controls, QCs, standards, etc, are referenced.
# custom:
#  rule_id: rule_m_100_100_006_01
#  type: ERROR
#  priority: CRITICAL
#  section: metabolites.general
rule_m_100_100_006_01_test_cases := 1

# METADATA
# title: There are more rows in the metabolite assignment file.
# description:  There are more rows in the metabolite assignment file.
test_rule_m_100_100_006_01_no_violation_01 if {
	result := rules.rule_m_100_100_006_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"a_MTBLS1.tsv": {"table": {"rowOffset": 0, "totalRowCount": 10}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: There is no row in the metabolite assignment file.
# description:  There is no row in the metabolite assignment file.
test_rule_m_100_100_006_01_violation_01 if {
	result := rules.rule_m_100_100_006_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"a_MTBLS1.tsv": {"table": {"data": {"database_identification": []}, "rowOffset": 0, "totalRowCount": 0}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 1
}
