#########################################################################################################
# Unit tests for rule___100_400_001_04
#########################################################################################################
package tests.input_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: There is no parser information for metabolite assignment file.
# description: Define metabolite assignment file in parserMessages.
# custom:
#  rule_id: rule___100_400_001_04
#  type: ERROR
#  priority: HIGH
#  section: metabolites.parserMessages
rule___100_400_001_04_test_cases := 1

# METADATA
# title: Input data has parser message list for metabolite assignment file.
# description: There is an metabolite assignment key in parserMessages.
test_rule___100_400_001_04_no_violation_01 if {
	result := rules.rule___100_400_001_04 with input as {
		"parserMessages": {"i_Investigation.txt": [], "s_MTBLS1.txt": [], "a_MTBLS1.txt": [], "m_MTBLS1.tsv": []},
		"metaboliteAssignments": {"m_MTBLS1.tsv": {}},
		"samples": {"s_MTBLS1.txt": []},
		"assays": {"a_MTBLS1.txt": []},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Input data has no parser message list for metabolite assignment file.
# description: metabolite assignment key is missing in parserMessages.
test_rule___100_400_001_04_violation_01 if {
	result := rules.rule___100_400_001_04 with input as {
		"parserMessages": {"i_Investigation.txt": [], "s_MTBLS1.txt": []},
		"metaboliteAssignments": {"m_MTBLS1.tsv": {}},
		"assays": {"a_MTBLS1.txt": []},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}
