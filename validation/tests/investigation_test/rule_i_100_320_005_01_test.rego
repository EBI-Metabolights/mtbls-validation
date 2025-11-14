#########################################################################################################
# Unit tests for rule_i_100_320_005_01
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study Publication Title length less than 20 characters.
# description: Study Publication Title must be defined with length equal or greater than 25 characters.
# custom:
#  rule_id: rule_i_100_320_005_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyPublications
rule_i_100_320_005_01_test_cases := 1

# METADATA
# title: There are two study publications with valid title size.
# description: Publication title sizes are equal or greater 25.
test_rule_i_100_320_005_01_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyPublications/publications",
			"value": [
				{"title": "Contribution of the micro"},
				{"title": "Contribution of the microbiome"},
			],
		}],
	)

	result := rules.rule_i_100_320_005_01 with input as input_data
	count(result) == 0
}

# METADATA
# title: There are two study publications with invalid title size
# description: Publication title sizes are less than 25.
test_rule_i_100_320_005_01_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyPublications/publications",
			"value": [
				{"title": ""},
				{"title": "Contribution of"},
			],
		}],
	)

	result := rules.rule_i_100_320_005_01 with input as input_data
	count(result) == 2
}
