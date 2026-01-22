#########################################################################################################
# Unit tests for rule_s_100_100_003_01
#########################################################################################################
package tests.sample_test

import data.metabolights.validation.v2.rules.phase1.violations as rules
import rego.v1

# METADATA
# title: Sample file not referenced in investigation file.
# description: Only one sample file is allowed and its name should be 's_(accession number).txt'.
# custom:
#  rule_id: rule_s_100_100_003_01
#  type: ERROR
#  priority: CRITICAL
#  section: samples.filename
rule_s_100_100_003_01_test_cases := 1

# METADATA
# title: Sample file name is referenced in i_Investigation.txt file
# description:  Sample file name is referenced in i_Investigation.txt file
test_rule_s_100_100_003_01_no_violation_01 if {
	result := rules.rule_s_100_100_003_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: Sample file name is not referenced in i_Investigation.txt file
# description:  Sample file name is not referenced in i_Investigation.txt file
test_rule_s_100_100_003_01_violation_01 if {
	result := rules.rule_s_100_100_003_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.tsv": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}

# METADATA
# title: Sample file name is not referenced in i_Investigation.txt file
# description:  Sample file name is not referenced in i_Investigation.txt file
test_rule_s_100_100_003_01_violation_02 if {
	result := rules.rule_s_100_100_003_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": ""}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}
