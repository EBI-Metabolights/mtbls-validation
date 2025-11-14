#########################################################################################################
# Unit tests for rule_i_100_330_002_01
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Study Factor Name is empty.
# description: Study Factor Name must be defined.
# custom:
#  rule_id: rule_i_100_330_002_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyFactors
rule_i_100_330_002_01_test_cases := 1

# METADATA
# title: There is a study factor
# description: There is one study factor in i_Investigation.txt.
test_rule_i_100_330_002_01_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyFactors/factors",
			"value": [{
				"name": "Disease",
				"type": {
					"term": "disease",
					"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000408",
					"termSourceRef": "EFO",
				},
			}],
		}],
	)

	result := rules.rule_i_100_330_002_01 with input as input_data
	count(result) == 0
}

# METADATA
# title: There are two study factors
# description: There are two study factors in i_Investigation.txt.
test_rule_i_100_330_002_01_violation_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyFactors/factors",
			"value": [
				{
					"name": "Disease",
					"type": {
						"term": "disease",
						"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000408",
						"termSourceRef": "EFO",
					},
				},
				{
					"name": "",
					"type": {
						"term": "dose",
						"termAccessionNumber": "",
						"termSourceRef": "",
					},
				},
			],
		}],
	)

	result := rules.rule_i_100_330_002_01 with input as input_data
	count(result) == 1
}
