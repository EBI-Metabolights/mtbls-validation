#########################################################################################################
# Unit tests for rule_i_100_320_009_02
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.definitions as def
import data.metabolights.validation.v2.rules.phase1.violations as rules
import data.tests.data.inputs.rules as test_rules
import rego.v1

# METADATA
# title: Study Publication Status Term Source REF not referenced in investigation file.
# description: Study Publication Status Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_320_009_02
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyPublications
rule_i_100_320_009_02_test_cases := 1

# METADATA
# title: Study Publication Status term is in the ontology list
# description: Ontology source ref present
test_rule_i_100_320_009_02_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "remove",
				"path": "/investigation/studies/0/studyPublications/publications/1",
			},
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyPublications/publications/0/status",
				"value": {
					"term": "published",
					"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0001796",
					"termSourceRef": "EFO",
				},
			},
		],
	)
	result := rules.rule_i_100_320_009_02 with input as input_data
	count(result) == 0
}

# METADATA
# title: Study Publication Status term is not in the ontology list
# description: RULE_STUDY_DESIGN_TYPE empty dict
test_rule_i_100_320_009_02_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "remove",
				"path": "/investigation/studies/0/studyPublications/publications/1",
			},
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyPublications/publications/0/status",
				"value": {
					"term": "published",
					"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0001796",
					"termSourceRef": "EFOX",
				},
			},
		],
	)
	result := rules.rule_i_100_320_009_02 with input as input_data
	count(result) == 1
}
