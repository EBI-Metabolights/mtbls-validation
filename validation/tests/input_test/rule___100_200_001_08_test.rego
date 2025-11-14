#########################################################################################################
# Unit tests for rule___100_200_001_08
#########################################################################################################
package tests.input_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Sample file name pattern is not correct.
# description: Sample file name must start with 's_', contain study identifier and have extension '.txt'.
# custom:
#  rule_id: rule___100_200_001_08
#  type: ERROR
#  priority: CRITICAL
#  section: samples.general
rule___100_200_001_08_test_cases := 1

# METADATA
# title: Sample file name is valid.
# description:  Sample file name is valid.
test_rule___100_200_001_08_no_violation_01 if {
	result := rules.rule___100_200_001_08 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: Sample file name is valid.
# description:  Sample file name is valid.
test_rule___100_200_001_08_no_violation_02 if {
	result := rules.rule___100_200_001_08 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_REQ1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_REQ1.txt"}]},
		"parserMessages": {"s_REQ1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: Sample file name is not valid.
# description:  Sample file name is not valid.
test_rule___100_200_001_08_violation_01 if {
	result := rules.rule___100_200_001_08 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}

# METADATA
# title: Sample file name is not valid.
# description:  Sample file name is not valid.
test_rule___100_200_001_08_violation_02 if {
	result := rules.rule___100_200_001_08 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1233333333312333333333.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}

# METADATA
# title: Sample file name is not valid.
# description:  Sample file name is not valid.
test_rule___100_200_001_08_violation_03 if {
	result := rules.rule___100_200_001_08 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_REX12333333333.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}

# METADATA
# title: Sample file name is not valid.
# description:  Sample file name is not valid.
test_rule___100_200_001_08_violation_04 if {
	result := rules.rule___100_200_001_08 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLSREQ12333333333.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}
