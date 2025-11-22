#########################################################################################################
# Unit tests for rule_a_200_090_002_24
#########################################################################################################
package tests.assay_test

import data.metabolights.validation.v2.rules.phase2.violations as rules
import data.tests.data.inputs.rules as test_rules

import rego.v1

# METADATA
# title: The value does not match the required pattern.
# description: The column value MUST have a valid pattern value.
# custom:
#  rule_id: rule_a_200_090_002_24
#  type: ERROR
#  priority: HIGH
#  section: assays.general
rule_a_200_090_002_24_test_cases := 1

# METADATA
# title: <title>.
# description: <description>.
test_rule_a_200_090_002_24_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Sample Name/0",
			"value": "data",
		}],
	)

	selected_rule := json.patch(
		test_rules.assay.any_ontology_term_01,
		[{
			"op": "replace",
			"path": "constraints",
			"value": {"pattern": {
				"constraint": ".+",
				"errorMessage": "Sample error",
				"enforcementLevel": "required",
			}},
		}],
	)
	result := rules.rule_a_200_090_002_24 with input as input_data
		with data.metabolights.validation.v2.controls.assayFileControls as {"Sample Name": [selected_rule]}
	count(result) == 0
}

# METADATA
# title: <title>.
# description: <description>.
test_rule_a_200_090_002_24_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Sample Name/0",
			"value": "data",
		}],
	)

	selected_rule := json.patch(
		test_rules.assay.any_ontology_term_01,
		[{
			"op": "replace",
			"path": "constraints",
			"value": {"pattern": {
				"constraint": ".+ value",
				"errorMessage": "Sample error",
				"enforcementLevel": "required",
			}},
		}],
	)
	result := rules.rule_a_200_090_002_24 with input as input_data
		with data.metabolights.validation.v2.controls.assayFileControls as {"Sample Name": [selected_rule]}
	count(result) == 1
}
