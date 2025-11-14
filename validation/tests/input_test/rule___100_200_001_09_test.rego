#########################################################################################################
# Unit tests for rule___100_200_001_09
#########################################################################################################
package tests.input_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Sample file is not referenced in i_Investigation.txt file.
# description: Update i_Investigation.txt file to reference the sample file or delete it.
# custom:
#  rule_id: rule___100_200_001_09
#  type: ERROR
#  priority: CRITICAL
#  section: samples.general
rule___100_200_001_09_test_cases := 1

# METADATA
# title: Sample file is referenced in i_Investigation.txt file..
# description:  Sample file is not referenced in i_Investigation.txt file.
test_rule___100_200_001_09_no_violation_01 if {
	result := rules.rule___100_200_001_09 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: Sample file is not referenced in i_Investigation.txt file..
# description:  Sample file is not referenced in i_Investigation.txt file.
test_rule___100_200_001_09_violation_01 if {
	result := rules.rule___100_200_001_09 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS2.txt"}]},
		"parserMessages": {"s_MTBLS2.txt": []},
	}
	count(result) == 1
}
