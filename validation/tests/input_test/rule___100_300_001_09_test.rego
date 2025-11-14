#########################################################################################################
# Unit tests for rule___100_300_001_09
#########################################################################################################
package tests.input_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Assay file is not referenced in i_Investigation.txt file.
# description: Update i_Investigation.txt file to reference the assay file or delete it.
# custom:
#  rule_id: rule___100_300_001_09
#  type: ERROR
#  priority: CRITICAL
#  section: assays.general
rule___100_300_001_09_test_cases := 1

# METADATA
# title: Assay file name is referenced.
# description:  Assay file is referenced.
test_rule___100_300_001_09_no_violation_01 if {
	result := rules.rule___100_300_001_09 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: Assay file name is not referenced.
# description:  Assay file is not referenced.
test_rule___100_300_001_09_violation_01 if {
	result := rules.rule___100_300_001_09 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {}, "a_MTBLS13.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": [], "a_MTBLS13.txt": []},
	}
	count(result) == 1
}
