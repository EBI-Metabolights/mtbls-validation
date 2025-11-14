#########################################################################################################
# Unit tests for rule_i_100_320_009_01
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.definitions as def
import data.metabolights.validation.v2.rules.phase1.violations as rules
import data.tests.data.inputs.rules as test_rules
import rego.v1

# METADATA
# title: Study Publication Status is not selected from the default ontology list.
# description: Study Publication Status value MAY be selected from the default ontology list.
# custom:
#  rule_id: rule_i_100_320_009_01
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyPublications
rule_i_100_320_009_01_test_cases := 1
