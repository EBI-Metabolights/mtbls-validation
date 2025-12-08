#########################################################################################################
# Unit tests for rule_i_100_300_003_02
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Non-printable characters in Study Title.
# description: Study title should contain only printable characters.
# custom:
#  rule_id: rule_i_100_300_003_02
#  type: ERROR
#  priority: HIGH
#  section: investigation.studies
rule_i_100_300_003_02_test_cases := 1

# METADATA
# title: Study title has no unprintable characters.
# description: Study title has no unprintable characters.
test_rule_i_100_300_003_02_no_violation_01 if {
	result := rules.rule_i_100_300_003_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "title": "Short"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study title has unprintable characters.
# description: Study title contains tab and carriage return characters.
test_rule_i_100_300_003_02_violation_01 if {
	result := rules.rule_i_100_300_003_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "title": "\u3000\u007f\u0000 \tShort\n\t\n\u205f\u009f\u000e"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}
