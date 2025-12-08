#########################################################################################################
# Unit tests for rule_i_100_300_004_01
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study Description length less than 60 characters.
# description: Study Description should be defined with length equal or greater than 60 characters. Please use abstract of first publication.
# custom:
#  rule_id: rule_i_100_300_004_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studies
rule_i_100_300_004_01_test_cases := 1

# METADATA
# title: Study description is defined.
# description: Study description length is greater than 60.
test_rule_i_100_300_004_01_no_violation_01 if {
	result := rules.rule_i_100_300_004_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "description": "Study description is greater than 60. Study description is greater than 60. Study description is greater than 60."}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study description is defined.
# description: Study description length is 60.
test_rule_i_100_300_004_01_no_violation_02 if {
	result := rules.rule_i_100_300_004_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "description": "Study description is about 60,study description is about 60."}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study description is empty.
# description: Study description is empty.
test_rule_i_100_300_004_01_violation_01 if {
	result := rules.rule_i_100_300_004_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "description": ""}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

# METADATA
# title: Study description is not valid.
# description: Study description length is less than 60.
test_rule_i_100_300_004_01_violation_02 if {
	result := rules.rule_i_100_300_004_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "description": "Short"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}
