#########################################################################################################
# Unit tests for rule_a_100_100_002_01
#########################################################################################################
package tests.assay_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Assay file not referenced in investigation file.
# description: Assay file must be referenced in i_Investigation.txt.
# custom:
#  rule_id: rule_a_100_100_002_01
#  type: ERROR
#  priority: CRITICAL
#  section: assays.filename
rule_a_100_100_002_01_test_cases := 1

# METADATA
# title: Assay file name is referenced in i_Investigation.txt file
# description:  Assay file name is referenced in i_Investigation.txt file
test_rule_a_100_100_002_01_no_violation_01 if {
	result := rules.rule_a_100_100_002_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: Assay file name is not referenced in i_Investigation.txt file
# description:  Assay file name is not referenced in i_Investigation.txt file
test_rule_a_100_100_002_01_violation_01 if {
	result := rules.rule_a_100_100_002_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"s_MTBLS1.tsv": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 1
}

# METADATA
# title: Assay file name is not referenced in i_Investigation.txt file
# description:  Assay file name is not referenced in i_Investigation.txt file
test_rule_a_100_100_002_01_violation_02 if {
	result := rules.rule_a_100_100_002_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": ""}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 1
}
