#########################################################################################################
# Unit tests for rule_i_100_310_002_13
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.definitions as def
import data.metabolights.validation.v2.rules.phase1.violations as rules
import data.tests.data.inputs.rules as test_rules

import rego.v1

# METADATA
# title: Value is not in the default ontologies or controlled lists
# description: A term SHOULD be selected from the default ontologies or controlled lists.
# custom:
#  rule_id: rule_i_100_310_002_13
#  type: WARNING
#  priority: HIGH
#  section: investigation.studyDesignDescriptors
rule_i_100_310_002_13_test_cases := 1

# METADATA
# title: Study Design Type term is in the ontology list - RULE_STUDY_DESIGN_TYPE null
# description: Study Design Type term is in the ontology list
test_rule_i_100_310_002_13_no_violation_01 if {
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
	result := rules.rule_i_100_310_002_13 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as null
		with def.RULE_DEFAULT_ONTOLOGIES as test_rules.investigation.any_ontology_term_01
	count(result) == 0
}

# METADATA
# title: Study Design Type term is in the ontology list
# description: RULE_STUDY_DESIGN_TYPE empty dict
test_rule_i_100_310_002_13_no_violation_02 if {
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
	result := rules.rule_i_100_310_002_13 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as {}
		with def.RULE_DEFAULT_ONTOLOGIES as test_rules.investigation.any_ontology_term_01
	count(result) == 0
}

# METADATA
# title: Study Design Type term is in the ontology list
# description:  RULE_STUDY_DESIGN_TYPE  is 'check-only-constraints' type
test_rule_i_100_310_002_13_no_violation_03 if {
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
	result := rules.rule_i_100_310_002_13 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as {"validationType": "check-only-constraints"}
		with def.RULE_DEFAULT_ONTOLOGIES as test_rules.investigation.any_ontology_term_01
	count(result) == 0
}

# METADATA
# title: Study Design Type term is not in the ontology list
# description: RULE_STUDY_DESIGN_TYPE null
test_rule_i_100_310_002_13_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [{
				"term": "kilogram",
				"termAccessionNumber": "http://purl.obolibrary.org/obo/UO_0000009",
				"termSourceRef": "UOX",
			}],
		}],
	)
	result := rules.rule_i_100_310_002_13 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as null
		with def.RULE_DEFAULT_ONTOLOGIES as test_rules.investigation.any_ontology_term_01
	count(result) == 1
}

# METADATA
# title: Study Design Type term is not in the ontology list
# description: RULE_STUDY_DESIGN_TYPE empty dict
test_rule_i_100_310_002_13_violation_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [{
				"term": "kilogram",
				"termAccessionNumber": "http://purl.obolibrary.org/obo/UO_0000009",
				"termSourceRef": "UOX",
			}],
		}],
	)
	result := rules.rule_i_100_310_002_13 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as {}
		with def.RULE_DEFAULT_ONTOLOGIES as test_rules.investigation.any_ontology_term_01
	count(result) == 1
}

# METADATA
# title: Study Design Type term is not in the ontology list
# description:  RULE_STUDY_DESIGN_TYPE  is 'check-only-constraints' type
test_rule_i_100_310_002_13_violation_03 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[{
			"op": "replace",
			"path": "/investigation/studies/0/studyDesignDescriptors/designTypes",
			"value": [{
				"term": "kilogram",
				"termAccessionNumber": "http://purl.obolibrary.org/obo/UO_0000009",
				"termSourceRef": "UOX",
			}],
		}],
	)
	result := rules.rule_i_100_310_002_13 with input as input_data
		with def.RULE_STUDY_DESIGN_TYPE as {"validationType": "check-only-constraints"}
		with def.RULE_DEFAULT_ONTOLOGIES as test_rules.investigation.any_ontology_term_01
	count(result) == 1
}
