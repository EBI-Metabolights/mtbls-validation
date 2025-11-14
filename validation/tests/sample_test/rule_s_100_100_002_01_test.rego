#########################################################################################################
# Unit tests for rule_s_100_100_002_01
#########################################################################################################
package tests.sample_test

import data.metabolights.validation.v2.rules.phase1.violations as rules
import rego.v1

# METADATA
# title: There is no row in sample file.
# description: No row is defined in sample file. Add more than one row (sample). Please ensure all xxx, including controls, QCs, standards, etc, are referenced.
# custom:
#  rule_id: rule_s_100_100_002_01
#  type: ERROR
#  priority: CRITICAL
#  section: samples.rows
rule_s_100_100_002_01_test_cases := 1

# METADATA
# title: There are more rows in the sample file.
# description:  There are more rows in the sample file.
test_rule_s_100_100_002_01_no_violation_01 if {
	result := rules.rule_s_100_100_002_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {"rowOffset": 0, "totalRowCount": 10}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: There is no row in the sample file.
# description:  There is no row in the sample file.
test_rule_s_100_100_002_01_violation_01 if {
	result := rules.rule_s_100_100_002_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {"rowOffset": 0, "totalRowCount": 0}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}
