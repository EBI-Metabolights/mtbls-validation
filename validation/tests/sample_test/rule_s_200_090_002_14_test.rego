#########################################################################################################
# Unit tests for rule_s_200_090_002_14
#########################################################################################################
package tests.sample_test

import data.metabolights.validation.v2.rules.phase2.violations as rules
import data.tests.data.inputs.rules as test_rules

import rego.v1

# METADATA
# title: The value does not match the recommended pattern.
# description: The column value SHOULD have a valid pattern value.
# custom:
#  rule_id: rule_s_200_090_002_14
#  type: WARNING
#  priority: HIGH
#  section: samples.general
rule_s_200_090_002_14_test_cases := 1

# METADATA
# title: <title>.
# description: <description>.
test_rule_s_200_090_002_14_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/samples/s_REQ2025111188888.txt/table/data/Sample Name/0",
			"value": "data",
		}],
	)

	selected_rule := json.patch(
		test_rules.sample.any_ontology_term_01,
		[{
			"op": "replace",
			"path": "constraints",
			"value": {"pattern": {
				"constraint": ".+",
				"errorMessage": "Sample error",
				"enforcementLevel": "recommended",
			}},
		}],
	)
	result := rules.rule_s_200_090_002_14 with input as input_data
		with data.metabolights.validation.v2.controls.sampleFileControls as {"Sample Name": [selected_rule]}
	count(result) == 0
}

# METADATA
# title: <title>.
# description: <description>.
test_rule_s_200_090_002_14_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/samples/s_REQ2025111188888.txt/table/data/Sample Name/0",
			"value": "data",
		}],
	)

	selected_rule := json.patch(
		test_rules.sample.any_ontology_term_01,
		[{
			"op": "replace",
			"path": "constraints",
			"value": {"pattern": {
				"constraint": ".+ value",
				"errorMessage": "Sample error",
				"enforcementLevel": "recommended",
			}},
		}],
	)
	result := rules.rule_s_200_090_002_14 with input as input_data
		with data.metabolights.validation.v2.controls.sampleFileControls as {"Sample Name": [selected_rule]}
	count(result) == 1
}
