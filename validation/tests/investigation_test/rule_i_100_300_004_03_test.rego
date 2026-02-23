#########################################################################################################
# Unit tests for rule_i_100_300_004_03
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Unexpected characters in Study Description.
# description: Study description should contain only printable characters.
# custom:
#  rule_id: rule_i_100_300_004_03
#  type: ERROR
#  priority: HIGH
#  section: investigation.studies
rule_i_100_300_004_03_test_cases := 1

# METADATA
# title: Study title has no unprintable characters.
# description: Study title has no unprintable characters.
test_rule_i_100_300_004_03_no_violation_01 if {
	result := rules.rule_i_100_300_004_03 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "description": "Short"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study title has unprintable characters.
# description: Study title contains tab and carriage return characters.
test_rule_i_100_300_004_03_violation_01 if {
	result := rules.rule_i_100_300_004_03 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "description": "背景开发高质量"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}
