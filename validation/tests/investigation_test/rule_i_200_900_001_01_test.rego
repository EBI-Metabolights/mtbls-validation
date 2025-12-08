#########################################################################################################
# Unit tests for rule_i_200_900_001_01
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Ontology terms are not validated on ontology search service (e.g. OLS).
# description: Ensure ontology terms are valid and accessible on ontology search service.
# custom:
#  rule_id: rule_i_200_900_001_01
#  type: WARNING
#  priority: HIGH
#  section: investigation.general
rule_i_200_900_001_01_test_cases := 1

# METADATA
# title: <title>.
# description: <description>.
test_rule_i_200_900_001_01_no_violation_01 if {
	input_01 := data.tests.data.inputs.empty
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
	result := rules.rule_i_200_900_001_01 with input as input_data

	# print(result)
	count(result) == 0
}

# METADATA
# title: <title>.
# description: <description>.
test_rule_i_200_900_001_01_violation_01 if {
	input_01 := data.tests.data.inputs.empty
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
	result := rules.rule_i_200_900_001_01 with input as input_data
	count(result) == 1
}
