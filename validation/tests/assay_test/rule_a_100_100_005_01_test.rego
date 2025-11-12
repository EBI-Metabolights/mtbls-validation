# Unit tests for rule_a_100_100_005_01
package tests.assay_test
import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: There is no row in assay file.
# description: No row is defined in assay file. Add more than one row (run). Please ensure all samples, including controls, QCs, standards, etc, are referenced.
# custom:
#  rule_id: rule_a_100_100_005_01
#  type: ERROR
#  priority: CRITICAL
#  section: assays.rows
test_rule_a_100_100_005_01 := true

# METADATA
# title: There are more rows in the Assay file.
# description:  There are more rows in the Assay file.
test_rule_a_100_100_005_01_no_violation_01 if {
	result := rules.rule_a_100_100_005_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"table": {"rowOffset": 0, "totalRowCount": 10}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: There is no row in the Assay file.
# description:  There is no row in the Assay file.
test_rule_a_100_100_005_01_violation_01 if {
	result := rules.rule_a_100_100_005_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"table": {"rowOffset": 0, "totalRowCount": 0}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 1
}
