#########################################################################################################
# Unit tests for rule___100_300_001_08
#########################################################################################################
package tests.input_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Assay file name not correct pattern.
# description: Assay file name must start with 'a_' and have extension '.txt'.
# custom:
#  rule_id: rule___100_300_001_08
#  type: ERROR
#  priority: CRITICAL
#  section: assays.general
rule___100_300_001_08_test_cases := 1

# METADATA
# title: Assay file name is valid.
# description:  Assay file name is valid.
test_rule___100_300_001_08_no_violation_01 if {
	result := rules.rule___100_300_001_08 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: Assay file name is not valid.
# description:  Assay file name is not valid.
test_rule___100_300_001_08_violation_01 if {
	result := rules.rule___100_300_001_08 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"x_MTBLS1.txts": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 1
}

# METADATA
# title: Assay file name is not valid.
# description:  Assay file name is not valid.
test_rule___100_300_001_08_violation_02 if {
	result := rules.rule___100_300_001_08 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"sample.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 1
}
