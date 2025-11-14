#########################################################################################################
# Unit tests for rule_i_100_310_004_02
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.definitions as def
import data.metabolights.validation.v2.rules.phase1.violations as rules
import data.tests.data.inputs.rules as test_rules
import rego.v1

# METADATA
# title: Study Design Type Term Source REF not referenced in investigation file.
# description: Study Design Type Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_310_004_02
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyDesignDescriptors
rule_i_100_310_004_02_test_cases := 1

# METADATA
# title: Study Design Type term is in the ontology list
# description: Ontology source ref present
test_rule_i_100_310_004_02_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [{
				"term": "tandem mass spectrometry",
				"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0030056",
				"termSourceRef": "EFO",
			}],
		}],
	)
	result := rules.rule_i_100_310_004_02 with input as input_data
	count(result) == 0
}

# METADATA
# title: Study Design Type term is not in the ontology list
# description: RULE_STUDY_DESIGN_TYPE empty dict
test_rule_i_100_310_004_02_violation_01 if {
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
	result := rules.rule_i_100_310_004_02 with input as input_data
	count(result) == 1
}
