package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules
import rego.v1

# METADATA
# title: Study Title length less than 20 characters.
# description: Study Title should be defined with length equal or greater than 20 characters. Please use same title as first publication.
# custom:
#  rule_id: rule_i_100_300_003_01
#  type: ERROR
#  priority: CRITICAL
#  section: investigation.studies
rule_i_100_300_003_01_test_cases := 1

# METADATA
# title: Study title is defined.
# description: Study title length is greater than 25.
test_rule_i_100_300_003_01_no_violation_01 if {
	result := rules.rule_i_100_300_003_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "title": "Study title is greater than 25"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study title is defined.
# description: Study title length is 25.
test_rule_i_100_300_003_01_no_violation_02 if {
	result := rules.rule_i_100_300_003_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "title": "Study title length is 25."}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study title is empty.
# description: Study title is empty.
test_rule_i_100_300_003_01_violation_01 if {
	result := rules.rule_i_100_300_003_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "title": ""}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

# METADATA
# title: Study title is not valid.
# description: Study title length is less than 25.
test_rule_i_100_300_003_01_violation_02 if {
	result := rules.rule_i_100_300_003_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "title": "Short"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}
