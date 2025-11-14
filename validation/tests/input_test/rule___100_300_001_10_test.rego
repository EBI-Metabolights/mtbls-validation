#########################################################################################################
# Unit tests for rule___100_300_001_10
#########################################################################################################
package tests.input_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Assay file name contains invalid characters.
# description: Use only .-_A-Za-z0-9 characters for an assay file name. e.g. a_REQ2025010211233_LC-MS_negative_reverse-phase_metabolite_profiling.txt
# custom:
#  rule_id: rule___100_300_001_10
#  type: ERROR
#  priority: CRITICAL
#  section: assays.general
rule___100_300_001_10_test_cases := 1

# METADATA
# title: Assay file name is valid.
# description:  Assay file is referenced.
test_rule___100_300_001_10_no_violation_01 if {
	result := rules.rule___100_300_001_10 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {}, "a_MTBLS13.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: Assay file names have invalid characters.
# description:  Assay file names are not valid.
test_rule___100_300_001_10_violation_01 if {
	result := rules.rule___100_300_001_10 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS 1.txt": {}, "a_MTBLS,13.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": [], "a_MTBLS13.txt": []},
	}
	count(result) == 2
}
