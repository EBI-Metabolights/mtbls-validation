#########################################################################################################
# Unit tests for rule_a_100_100_005_02
#########################################################################################################
package tests.assay_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: There is only one row in assay file.
# description: Only one row is defined in assay file. Add more than one row (run). Please ensure all sample, including controls, QCs, standards, etc, are referenced.
# custom:
#  rule_id: rule_a_100_100_005_02
#  type: ERROR
#  priority: HIGH
#  section: assays.rows
rule_a_100_100_005_02_test_cases := 1

# METADATA
# title: There are more rows in the Assay file.
# description:  There are more rows in the Assay file.
test_rule_a_100_100_005_02_no_violation_01 if {
	result := rules.rule_a_100_100_005_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"table": {"rowOffset": 0, "totalRowCount": 10}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: There is one row in the Assay file.
# description:  There is one row in the Assay file.
test_rule_a_100_100_005_02_violation_01 if {
	result := rules.rule_a_100_100_005_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"table": {"rowOffset": 0, "totalRowCount": 1}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 1
}
