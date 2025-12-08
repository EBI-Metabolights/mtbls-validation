#########################################################################################################
# Unit tests for rule___100_300_001_04
#########################################################################################################
package tests.input_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: There is no parser information for assay file.
# description: Define assay file in parserMessages.
# custom:
#  rule_id: rule___100_300_001_04
#  type: ERROR
#  priority: HIGH
#  section: assays.general
rule___100_300_001_04_test_cases := 1

# METADATA
# title: Input data has parser message list for assay file.
# description: There is an assay file key in parserMessages.
test_rule___100_300_001_04_no_violation_01 if {
	result := rules.rule___100_300_001_04 with input as {
		"parserMessages": {"i_Investigation.txt": [], "s_MTBLS1.txt": [], "a_MTBLS1.txt": []},
		"samples": {"s_MTBLS1.txt": []},
		"assays": {"a_MTBLS1.txt": []},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Input data has no parser message list for assay file.
# description: assay file key is missing in parserMessages.
test_rule___100_300_001_04_violation_01 if {
	result := rules.rule___100_300_001_04 with input as {
		"parserMessages": {"i_Investigation.txt": [], "s_MTBLS1.txt": []},
		"samples": {"s_MTBLS1.txt": []},
		"assays": {"a_MTBLS1.txt": []},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}
