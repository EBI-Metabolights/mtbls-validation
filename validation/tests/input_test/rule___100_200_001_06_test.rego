#########################################################################################################
# Unit tests for rule___100_200_001_06
#########################################################################################################
package tests.input_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: There are multiple sample files.
# description: Define only one sample file for the study.
# custom:
#  rule_id: rule___100_200_001_06
#  type: ERROR
#  priority: CRITICAL
#  section: samples.general
rule___100_200_001_06_test_cases := 1

# METADATA
# title: There is a sample file for the study
# description:  There is a sample file for the study
test_rule___100_200_001_06_no_violation_01 if {
	result := rules.rule___100_200_001_06 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: There are multiple sample files for the study
# description:  There are multiple sample files for the study
test_rule___100_200_001_06_violation_01 if {
	result := rules.rule___100_200_001_06 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {}, "s_MTBLS1_x.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}
