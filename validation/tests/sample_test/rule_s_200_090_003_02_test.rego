#########################################################################################################
# Unit tests for rule_s_200_090_003_02
#########################################################################################################
package tests.sample_test

import data.metabolights.validation.v2.rules.phase2.violations as rules
import rego.v1

# METADATA
# title: Term Accession Number length of unit ontology terms less than 3 characters.
# description: Term Accession Number of unit ontology terms should be defined with length equal or greater than 3 characters.
# custom:
#  rule_id: rule_s_200_090_003_02
#  type: WARNING
#  priority: HIGH
#  section: samples.general
rule_s_200_090_003_02_test_cases := 1

# # METADATA
# # title: <title>.
# # description: <description>.
# test_tests.sample_test_no_violation_01 if {
# 	result := rules.tests.sample_test with input as {
# 	}
# 	count(result) == 0
# }
# # METADATA
# # title: <title>.
# # description: <description>.
# test_tests.sample_test_violation_01 if {
# 	result := rules.tests.sample_test with input as {
# 	}
# 	count(result) == 1
# }
