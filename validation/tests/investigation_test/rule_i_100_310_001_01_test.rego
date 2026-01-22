#########################################################################################################
# Unit tests for rule_i_100_310_001_01
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: There are less than 3 Study Design Descriptors in the Study Design Descriptors section of investigation file.
# description: At least 3 study design descriptors should be defined.
# custom:
#  rule_id: rule_i_100_310_001_01
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyDesignDescriptors
rule_i_100_310_001_01_test_cases := 1

# METADATA
# title: There are multiple study design descriptors
# description: There are multiple study design descriptors in i_Investigation.txt.
test_rule_i_100_310_001_01_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [
				{
					"term": "test",
					"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
					"termSourceRef": "EFO",
				},
				{
					"term": "test 2",
					"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000002",
					"termSourceRef": "EFO",
				},
				{
					"term": "test 3",
					"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000003",
					"termSourceRef": "EFO",
				},
			],
		}],
	)
	result := rules.rule_i_100_310_001_01 with input as input_data
	count(result) == 0
}

# METADATA
# title: There are multiple study design descriptors
# description: There are multiple study design descriptors in i_Investigation.txt.
test_rule_i_100_310_001_01_no_violation_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [
				{
					"term": "test",
					"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
					"termSourceRef": "EFO",
				},
				{
					"term": "test 2",
					"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000002",
					"termSourceRef": "EFO",
				},
				{
					"term": "test 3",
					"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000003",
					"termSourceRef": "EFO",
				},
				{
					"term": "test 4",
					"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000004",
					"termSourceRef": "EFO",
				},
			],
		}],
	)
	result := rules.rule_i_100_310_001_01 with input as input_data
	count(result) == 0
}

# METADATA
# title: There is no study design descriptor.
# description: There is no study design descriptor in i_Investigation.txt.
test_rule_i_100_310_001_01_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [],
		}],
	)
	result := rules.rule_i_100_310_001_01 with input as input_data
	count(result) == 1
}
