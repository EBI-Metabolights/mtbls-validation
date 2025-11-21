#########################################################################################################
# Unit tests for rule_s_200_090_007_04
#########################################################################################################
package tests.sample_test

import data.metabolights.validation.v2.rules.phase2.violations as rules
import data.tests.data.inputs.rules as test_rules
import rego.v1

# METADATA
# title: The value appears in the list of default not-recommended values.
# description: Select an alternative value that meets the requirement or leave it empty (if it is not required).
# custom:
#  rule_id: rule_s_200_090_007_04
#  type: WARNING
#  priority: HIGH
#  section: samples.general
rule_s_200_090_007_04_test_cases := 1


# METADATA
# title: <title>.
# description: <description>.
test_rule_s_200_090_007_04_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Factor Value[Disease]",
				"value": ["gram", "gram", "gram"],
			},{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Source REF.4",
				"value": ["UO", "UO", "UO"],
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Accession Number.4",
				"value": ["http://purl.obolibrary.org/obo/UO_0000021", "http://purl.obolibrary.org/obo/UO_0000021", "http://purl.obolibrary.org/obo/UO_0000021"],
			},
		],
	)
    
    selected_rule := json.patch(
        test_rules.sample.selected_ontologies_01,
        [
			{
				"op": "replace",
				"path": "unexpectedTermEnforcementLevel",
				"value": "recommended",
			},
            {
				"op": "replace",
				"path": "allowedPlaceholders",
				"value": [],
			},
            {
				"op": "replace",
				"path": "unexpectedTerms",
				"value": ["unexpected value"],
			},
            
		],
    )
	result := rules.rule_s_200_090_007_04 with input as input_data
    with data.metabolights.validation.v2.controls.sampleFileControls as {
        "__default__": [selected_rule]
    }
	count(result) == 0
}



# METADATA
# title: <title>.
# description: <description>.
test_rule_s_200_090_007_04_no_violation_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Factor Value[Disease]",
				"value": ["unexpected value", "gram", "gram"],
			},{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Source REF.4",
				"value": ["UO", "UO", "UO"],
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Accession Number.4",
				"value": ["http://purl.obolibrary.org/obo/UO_0000021", "http://purl.obolibrary.org/obo/UO_0000021", "http://purl.obolibrary.org/obo/UO_0000021"],
			},
		],
	)
    
    selected_rule := json.patch(
        test_rules.sample.selected_ontologies_01,
        [
			{
				"op": "replace",
				"path": "unexpectedTermEnforcementLevel",
				"value": "required",
			},
            {
				"op": "replace",
				"path": "allowedPlaceholders",
				"value": [],
			},
            {
				"op": "replace",
				"path": "unexpectedTerms",
				"value": ["unexpected value"],
			},
            
		],
    )
	result := rules.rule_s_200_090_007_04 with input as input_data
    with data.metabolights.validation.v2.controls.sampleFileControls as {
        "__default__": [selected_rule]
    }
	count(result) == 0
}


# METADATA
# title: <title>.
# description: <description>.
test_rule_s_200_090_007_04_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Factor Value[Disease]",
				"value": ["unexpected value", "gram", "gram"],
			},{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Source REF.4",
				"value": ["UO", "UO", "UO"],
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Accession Number.4",
				"value": ["http://purl.obolibrary.org/obo/UO_0000021", "http://purl.obolibrary.org/obo/UO_0000021", "http://purl.obolibrary.org/obo/UO_0000021"],
			},
		],
	)
    
    selected_rule := json.patch(
        test_rules.sample.selected_ontologies_01,
        [
			{
				"op": "replace",
				"path": "unexpectedTermEnforcementLevel",
				"value": "recommended",
			},
            {
				"op": "replace",
				"path": "allowedPlaceholders",
				"value": [],
			},
            {
				"op": "replace",
				"path": "unexpectedTerms",
				"value": ["unexpected value"],
			},
            
		],
    )
	result := rules.rule_s_200_090_007_04 with input as input_data
    with data.metabolights.validation.v2.controls.sampleFileControls as {
        "__default__": [selected_rule]
    }
	count(result) == 1
}
