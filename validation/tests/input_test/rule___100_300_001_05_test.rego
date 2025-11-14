#########################################################################################################
# Unit tests for rule___100_300_001_05
#########################################################################################################
package tests.input_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: There is no assay file for the study.
# description: Define an assay file for the study.
# custom:
#  rule_id: rule___100_300_001_05
#  type: ERROR
#  priority: CRITICAL
#  section: assays.general
rule___100_300_001_05_test_cases := 1

# METADATA
# title: There is an assay file for the study
# description:  There is an assay file for the study
test_rule___100_300_001_05_no_violation_01 if {
	result := rules.rule___100_300_001_05 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: There is no Assay file for the study
# description:  There is no Assay file for the study
test_rule___100_300_001_05_violation_01 if {
	result := rules.rule___100_300_001_05 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 1
}
