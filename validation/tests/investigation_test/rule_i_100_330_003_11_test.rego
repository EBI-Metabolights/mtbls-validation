#########################################################################################################
# Unit tests for rule_i_100_330_003_11
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.definitions as def
import data.metabolights.validation.v2.rules.phase1.violations as rules
import data.tests.data.inputs.rules as test_rules

import rego.v1

# METADATA
# title: Value is not in the required ontologies or controlled lists associated with this field.
# description: A term MUST be selected from the required ontologies or controlled lists associated with this field.
# custom:
#  rule_id: rule_i_100_330_003_11
#  type: ERROR
#  priority: HIGH
#  section: investigation.studyFactors
rule_i_100_330_003_11_test_cases := 1

# METADATA
# title: Study Factor Type term is in the control list
# description: There are two study publication. Update both of them
test_rule_i_100_330_003_11_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyFactors/factors/0/type",
				"value": {
					"term": "kilogram",
					"termAccessionNumber": "http://purl.obolibrary.org/obo/UO_0000009",
					"termSourceRef": "UO",
				},
			},
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyFactors/factors/1/type",
				"value": {
					"term": "kilogram",
					"termAccessionNumber": "http://purl.obolibrary.org/obo/UO_0000009",
					"termSourceRef": "UO",
				},
			},
		],
	)
	test_rule := json.patch(
		test_rules.investigation.select_ontology_term_01,
		[
			{
				"op": "replace",
				"path": "/termEnforcementLevel",
				"value": "required",
			},
		],
	)
	result := rules.rule_i_100_330_003_11 with input as input_data
		with def.RULE_STUDY_FACTOR_TYPE as test_rule
	count(result) == 0
}

# METADATA
# title: Study Factor Type term is wikidata input
# description: Study Factor Type term is wikidata input
test_rule_i_100_330_003_11_no_violation_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyFactors/factors/0/type",
				"value": {
					"term": "kilogram",
					"termAccessionNumber": "https://www.wikidata.org/wiki/Q11570",
					"termSourceRef": "wikidata",
				},
			},
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyFactors/factors/1/type",
				"value": {
					"term": "kilogram",
					"termAccessionNumber": "http://uri.interlex.org/base/ilx_12233",
					"termSourceRef": "ILX",
				},
			},
		],
	)
	test_rule := json.patch(
		test_rules.investigation.selected_ontologies_01,
		[
			{
				"op": "replace",
				"path": "/termEnforcementLevel",
				"value": "required",
			},
		],
	)
	result := rules.rule_i_100_330_003_11 with input as input_data
		with def.RULE_STUDY_FACTOR_TYPE as test_rule
	count(result) == 0
}

# METADATA
# title: Study Factor Type term has missing data input value
# description: Study Factor Type term has missing data input value
test_rule_i_100_330_003_11_no_violation_03 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyFactors/factors/0/type",
				"value": {
					"term": "Not Applicable",
					"termAccessionNumber": "http://purl.obolibrary.org/obo/NCIT_C48660",
					"termSourceRef": "NCIT",
				},
			},
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyFactors/factors/1/type",
				"value": {
					"term": "kilogram",
					"termAccessionNumber": "http://uri.interlex.org/base/ilx_12233",
					"termSourceRef": "ILX",
				},
			},
		],
	)
	test_rule := json.patch(
		test_rules.investigation.child_ontology_term_01,
		[
			{
				"op": "replace",
				"path": "/termEnforcementLevel",
				"value": "required",
			},
		],
	)
	result := rules.rule_i_100_330_003_11 with input as input_data
		with def.RULE_STUDY_FACTOR_TYPE as test_rule
	count(result) == 0
}

# METADATA
# title: Study Factor Type term has placeholder value
# description: Study Factor Type term has placeholder value
test_rule_i_100_330_003_11_no_violation_04 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyFactors/factors/0/type",
				"value": {
					"term": "Example",
					"termAccessionNumber": "http://www.ebi.ac.uk/metabolights/ontology/placeholder",
					"termSourceRef": "MTBLS",
				},
			},
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyFactors/factors/1/type",
				"value": {
					"term": "kilogram",
					"termAccessionNumber": "http://uri.interlex.org/base/ilx_12233",
					"termSourceRef": "ILX",
				},
			},
		],
	)
	test_rule := json.patch(
		test_rules.investigation.any_ontology_term_01,
		[
			{
				"op": "replace",
				"path": "/termEnforcementLevel",
				"value": "required",
			},
		],
	)
	result := rules.rule_i_100_330_003_11 with input as input_data
		with def.RULE_STUDY_FACTOR_TYPE as test_rule
	count(result) == 0
}


# METADATA
# title: Study Factor Type term is  empty
# description: Study Factor Type term is empty
test_rule_i_100_330_003_11_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "remove",
				"path": "/investigation/studies/0/studyFactors/factors/1",
			},
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyFactors/factors/0/type",
				"value": {
					"term": "",
					"termAccessionNumber": "http://purl.obolibrary.org/obo/UO_0000009",
					"termSourceRef": "UO",
				},
			},
		],
	)
	test_rule := json.patch(
		test_rules.investigation.select_ontology_term_01,
		[
			{
				"op": "replace",
				"path": "/termEnforcementLevel",
				"value": "required",
			},
		],
	)
	result := rules.rule_i_100_330_003_11 with input as input_data
		with def.RULE_STUDY_FACTOR_TYPE as test_rule
	count(result) == 1
}

# METADATA
# title: Study Factor Type term source ref is  empty
# description: Study Factor Type term  source ref is empty
test_rule_i_100_330_003_11_violation_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "remove",
				"path": "/investigation/studies/0/studyFactors/factors/1",
			},
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyFactors/factors/0/type",
				"value": {
					"term": "kilogram",
					"termAccessionNumber": "http://purl.obolibrary.org/obo/UO_0000009",
					"termSourceRef": "",
				},
			},
		],
	)
	test_rule := json.patch(
		test_rules.investigation.child_ontology_term_01,
		[
			{
				"op": "replace",
				"path": "/termEnforcementLevel",
				"value": "required",
			},
		],
	)
	result := rules.rule_i_100_330_003_11 with input as input_data
		with def.RULE_STUDY_FACTOR_TYPE as test_rule
	count(result) == 1
}

# METADATA
# title: Study Factor Type term accession is  empty
# description: Study Factor Type term accession is empty
test_rule_i_100_330_003_11_violation_03 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "remove",
				"path": "/investigation/studies/0/studyFactors/factors/1",
			},
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyFactors/factors/0/type",
				"value": {
					"term": "kilogram",
					"termAccessionNumber": "",
					"termSourceRef": "UOX",
				},
			},
		],
	)
	test_rule := json.patch(
		test_rules.investigation.selected_ontologies_01,
		[
			{
				"op": "replace",
				"path": "/termEnforcementLevel",
				"value": "required",
			},
		],
	)
	result := rules.rule_i_100_330_003_11 with input as input_data
		with def.RULE_STUDY_FACTOR_TYPE as test_rule
	count(result) == 1
}

# METADATA
# title: Study Factor Type term is not in the control list
# description: Study Factor Type term is not in the control list
test_rule_i_100_330_003_11_violation_04 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "remove",
				"path": "/investigation/studies/0/studyFactors/factors/1",
			},
			{
				"op": "replace",
				"path": "/investigation/studies/0/studyFactors/factors/0/type",
				"value": {
					"term": "microgram",
					"termAccessionNumber": "http://purl.obolibrary.org/obo/UO_0000023",
					"termSourceRef": "",
				},
			},
		],
	)
	test_rule := json.patch(
		test_rules.investigation.any_ontology_term_01,
		[
			{
				"op": "replace",
				"path": "/termEnforcementLevel",
				"value": "required",
			},
		],
	)
	result := rules.rule_i_100_330_003_11 with input as input_data
		with def.RULE_STUDY_FACTOR_TYPE as test_rule
	count(result) == 1
}
