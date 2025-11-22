#########################################################################################################
# Unit tests for rule_i_100_310_002_01
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study Design Type is empty.
# description: Study Design Type should be defined.
# custom:
#  rule_id: rule_i_100_310_002_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyDesignDescriptors
rule_i_100_310_002_01_test_cases := 1

# METADATA
# title: Study Factor Type term is in the control list
# description: There are two study publication. Update both of them
test_rule_i_100_310_002_01_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [{
				"term": "kilogram",
				"termAccessionNumber": "http://purl.obolibrary.org/obo/UO_0000009",
				"termSourceRef": "UO",
			}],
		}],
	)

	result := rules.rule_i_100_310_002_01 with input as input_data
	count(result) == 0
}

# METADATA
# title: Study Factor Type term is in the control list
# description: There are two study publication. Update both of them
test_rule_i_100_310_002_01_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [{
				"term": "",
				"termAccessionNumber": "http://purl.obolibrary.org/obo/UO_0000009",
				"termSourceRef": "UO",
			}],
		}],
	)

	result := rules.rule_i_100_310_002_01 with input as input_data
	count(result) == 1
}
