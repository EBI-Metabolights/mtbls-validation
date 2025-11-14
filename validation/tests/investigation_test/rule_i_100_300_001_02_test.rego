#########################################################################################################
# Unit tests for rule_i_100_300_001_02
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules
import rego.v1

# METADATA
# title: More than one study referenced in investigation file.
# description: Only one study should be defined in i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_300_001_02
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.studies
rule_i_100_300_001_02_test_cases := 1

# METADATA
# title: There is a study in i_Investigation.txt.
# description: There is one study in i_Investigation.txt.
test_rule_i_100_300_001_02_no_violation_01 if {
	result := rules.rule_i_100_300_001_02 with input as {
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: There is more than one study in i_Investigation.txt.
# description: Define one study in i_Investigation.txt.
test_rule_i_100_300_001_02_violation_01 if {
	result := rules.rule_i_100_300_001_02 with input as {
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}, {"fileName": "s_MTBLS1.txt"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}
