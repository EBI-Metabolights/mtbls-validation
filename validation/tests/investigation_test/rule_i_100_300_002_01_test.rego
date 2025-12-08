package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules
import rego.v1

# METADATA
# title: Study Identifier not valid.
# description: Study Identifier should be valid format (e.g., MTBLS(positive_number) or REQ(datetime)).
# custom:
#  rule_id: rule_i_100_300_002_01
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.studies
rule_i_100_300_002_01_test_cases := 1

# METADATA
# title: Investigation identifier is valid.
# description: Investigation identifier is valid.
test_rule_i_100_300_002_01_no_violation_01 if {
	result := rules.rule_i_100_300_002_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Investigation identifier is valid.
# description: Investigation identifier is valid.
test_rule_i_100_300_002_01_no_violation_02 if {
	result := rules.rule_i_100_300_002_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS111112"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Investigation identifier is valid.
# description: Investigation identifier is valid.
test_rule_i_100_300_002_01_no_violation_03 if {
	result := rules.rule_i_100_300_002_01 with input as {
		"investigation": {"studies": [{"identifier": "REQ20250101111112"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Investigation identifier is not valid.
# description: Investigation identifier is lowercase.
test_rule_i_100_300_002_01_violation_01 if {
	result := rules.rule_i_100_300_002_01 with input as {
		"investigation": {"studies": [{"identifier": "mtbls1"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

# METADATA
# title: Investigation identifier is not valid.
# description: Investigation identifier is not valid format.
test_rule_i_100_300_002_01_violation_02 if {
	result := rules.rule_i_100_300_002_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLSI1"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

# METADATA
# title: Investigation identifier is not valid.
# description: Investigation identifier is not valid format.
test_rule_i_100_300_002_01_violation_03 if {
	result := rules.rule_i_100_300_002_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1A"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}
