#########################################################################################################
# Unit tests for rule_i_100_320_006_01
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study Publication Author List is empty.
# description: Study Publication Author List must be defined.
# custom:
#  rule_id: rule_i_100_320_006_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyPublications
rule_i_100_320_006_01_test_cases := 1

# METADATA
# title: TStudy Publication Author List is not empty.
# description: Author List are not empty for 2 publications
test_rule_i_100_320_006_01_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyPublications/publications",
			"value": [
				{"authorList": "Contribution of the micro"},
				{"authorList": "O.Y."},
			],
		}],
	)

	result := rules.rule_i_100_320_006_01 with input as input_data
	count(result) == 0
}

# METADATA
# title: Study Publication Author List is empty.
# description: Study Publication Author List is empty.
test_rule_i_100_320_006_01_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyPublications/publications",
			"value": [
				{"title": "Publication 1", "authorList": ""},
				{"title": "Publication 2", "authorList": "A.B"},
			],
		}],
	)

	result := rules.rule_i_100_320_006_01 with input as input_data
	count(result) == 2
}
