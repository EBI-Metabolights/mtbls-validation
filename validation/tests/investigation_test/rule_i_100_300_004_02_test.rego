#########################################################################################################
# Unit tests for rule_i_100_300_004_02
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study abstract/description contains only template message.
# description: Study abstract/description should be updated. Do not use template message 'Please update the study abstract/description'.
# custom:
#  rule_id: rule_i_100_300_004_02
#  type: ERROR
#  priority: HIGH
#  section: investigation.studies
rule_i_100_300_004_02_test_cases := 1

# METADATA
# title: Study title is valid.
# description: Study title is valid.
test_rule_i_100_300_004_02_no_violation_01 if {
	result := rules.rule_i_100_300_004_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "description": "Valid study title with long content and valid description."}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study title has template message.
# description: Study title contains template message.
test_rule_i_100_300_004_02_violation_01 if {
	result := rules.rule_i_100_300_004_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "description": "Please update"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}
