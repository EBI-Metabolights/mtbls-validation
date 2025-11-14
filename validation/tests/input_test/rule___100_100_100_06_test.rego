#########################################################################################################
# Unit tests for rule___100_100_100_06
#########################################################################################################
package tests.input_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Unreferenced investigation files.
# description: Delete multiple investigation file within study folder.
# custom:
#  rule_id: rule___100_100_100_06
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.general
rule___100_100_100_06_test_cases := 1

# METADATA
# title: One i_Investigation.txt.
# description: One i_Investigation.txt.
test_rule___100_100_100_06_no_violation_01 if {
	result := rules.rule___100_100_100_06 with input as {
		"studyFolderMetadata": {"files": {"i_Investigation.txt": {}}},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Multiple i_Investigation.txt.
# description: There are multiple investigation files.
test_rule___100_100_100_06_violation_01 if {
	result := rules.rule___100_100_100_06 with input as {
		"studyFolderMetadata": {"files": {
			"i_Investigation.txt": {},
			"i_investigation.txt": {},
			"i_investigation2.txt": {},
		}},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 2
}
