#########################################################################################################
# Unit tests for rule_i_100_300_005_01
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study Submission Date not valid.
# description: Study Submission Date should be valid date and ISO8601 format (e.g., 2023-01-01).
# custom:
#  rule_id: rule_i_100_300_005_01
#  type: WARNING
#  priority: MEDIUM
#  section: investigation.studies
rule_i_100_300_005_01_test_cases := 1

# METADATA
# title: Study submission date is valid.
# description: Study submission date is valid format.
test_rule_i_100_300_005_01_no_violation_01 if {
	result := rules.rule_i_100_300_005_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "submissionDate": "2024-01-02"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study submission date is valid.
# description: Study submission date is valid.
test_rule_i_100_300_005_01_no_violation_02 if {
	result := rules.rule_i_100_300_005_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "submissionDate": "2012-01-02"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study submission date is invalid.
# description: Study submission date is empty.
test_rule_i_100_300_005_01_violation_01 if {
	result := rules.rule_i_100_300_005_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "submissionDate": ""}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

# METADATA
# title: Study submission date is invalid.
# description: Study submission date format is not ISO8601.
test_rule_i_100_300_005_01_violation_02 if {
	result := rules.rule_i_100_300_005_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "submissionDate": "2024/01/02"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

# METADATA
# title: Study submission date is invalid.
# description: Study submission date format is not ISO8601.
test_rule_i_100_300_005_01_violation_03 if {
	result := rules.rule_i_100_300_005_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "submissionDate": "12/01/2024"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}
