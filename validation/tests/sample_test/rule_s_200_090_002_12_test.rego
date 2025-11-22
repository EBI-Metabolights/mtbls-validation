#########################################################################################################
# Unit tests for rule_s_200_090_002_12
#########################################################################################################
package tests.sample_test

import data.metabolights.validation.v2.rules.phase2.violations as rules
import data.tests.data.inputs.rules as test_rules

import rego.v1

# METADATA
# title: Characteristic value is not in the predefined ontologies or controlled lists associated with this column
# description: A term SHOULD be selected from the predefined ontologies or controlled lists associated with this column.
# custom:
#  rule_id: rule_s_200_090_002_12
#  type: WARNING
#  priority: HIGH
#  section: samples.general
rule_s_200_090_002_12_test_cases := 1

# METADATA
# title: <title>.
# description: <description>.
test_rule_s_200_090_002_12_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Characteristics[Organism]/0",
				"value": "data",
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Source REF/0",
				"value": "OBI",
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Accession Number/0",
				"value": "htt",
			},
		],
	)

	selected_rule := json.patch(
		test_rules.sample.any_ontology_term_01,
		[
			{
				"op": "replace",
				"path": "termEnforcementLevel",
				"value": "required",
			},
			{
				"op": "replace",
				"path": "allowedPlaceholders",
				"value": [],
			},
		],
	)
	result := rules.rule_s_200_090_002_12 with input as input_data
		with data.metabolights.validation.v2.controls.sampleFileControls as {"__default_characteristic__": [selected_rule]}

	count(result) == 0
}

# METADATA
# title: <title>.
# description: <description>.
test_rule_s_200_090_002_12_no_violation_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Characteristics[Organism]",
				"value": ["gram", "gram", "gram"],
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Source REF",
				"value": ["UO", "UO", "UO"],
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Accession Number",
				"value": ["http://purl.obolibrary.org/obo/UO_0000021", "http://purl.obolibrary.org/obo/UO_0000021", "http://purl.obolibrary.org/obo/UO_0000021"],
			},
		],
	)

	selected_rule := json.patch(
		test_rules.sample.select_ontology_term_01,
		[
			{
				"op": "replace",
				"path": "termEnforcementLevel",
				"value": "required",
			},
			{
				"op": "replace",
				"path": "allowedPlaceholders",
				"value": [],
			},
		],
	)
	result := rules.rule_s_200_090_002_12 with input as input_data
		with data.metabolights.validation.v2.controls.sampleFileControls as {
			"__default_characteristic__": [selected_rule],
			"Characteristics[Organism part]": [],
			"Characteristics[Variant]": [],
			"Characteristics[Sample type]": [],
		}
	count(result) == 0
}

# METADATA
# title: <title>.
# description: <description>.
test_rule_s_200_090_002_12_no_violation_03 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Characteristics[Organism]",
				"value": ["gram", "gram", "gram"],
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Source REF",
				"value": ["UO", "UO", "UO"],
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Accession Number",
				"value": ["http://purl.obolibrary.org/obo/UO_0000021", "http://purl.obolibrary.org/obo/UO_0000021", "http://purl.obolibrary.org/obo/UO_0000021"],
			},
		],
	)

	selected_rule := json.patch(
		test_rules.sample.selected_ontologies_01,
		[
			{
				"op": "replace",
				"path": "termEnforcementLevel",
				"value": "required",
			},
			{
				"op": "replace",
				"path": "allowedPlaceholders",
				"value": [],
			},
		],
	)
	result := rules.rule_s_200_090_002_12 with input as input_data
		with data.metabolights.validation.v2.controls.sampleFileControls as {
			"__default_characteristic__": [selected_rule],
			"Characteristics[Organism part]": [],
			"Characteristics[Variant]": [],
			"Characteristics[Sample type]": [],
		}
	count(result) == 0
}

# METADATA
# title: <title>.
# description: <description>.
test_rule_s_200_090_002_12_no_violation_04 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Characteristics[Organism]",
				"value": ["gram", "gram", "gram"],
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Source REF",
				"value": ["UO", "UO", "UO"],
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Accession Number",
				"value": ["http://purl.obolibrary.org/obo/UO_0000021", "http://purl.obolibrary.org/obo/UO_0000021", "http://purl.obolibrary.org/obo/UO_0000021"],
			},
		],
	)

	selected_rule := json.patch(
		test_rules.sample.child_ontology_term_01,
		[
			{
				"op": "replace",
				"path": "termEnforcementLevel",
				"value": "required",
			},
			{
				"op": "replace",
				"path": "allowedPlaceholders",
				"value": [],
			},
		],
	)
	result := rules.rule_s_200_090_002_12 with input as input_data
		with data.metabolights.validation.v2.controls.sampleFileControls as {
			"__default_characteristic__": [selected_rule],
			"Characteristics[Organism part]": [],
			"Characteristics[Variant]": [],
			"Characteristics[Sample type]": [],
		}
	count(result) == 0
}

# METADATA
# title: <title>.
# description: <description>.
test_rule_s_200_090_002_12_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Characteristics[Organism]/0",
				"value": "data",
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Source REF/0",
				"value": "",
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Accession Number/0",
				"value": "htt",
			},
		],
	)

	selected_rule := json.patch(
		test_rules.sample.any_ontology_term_01,
		[
			{
				"op": "replace",
				"path": "termEnforcementLevel",
				"value": "required",
			},
			{
				"op": "replace",
				"path": "allowedPlaceholders",
				"value": [],
			},
		],
	)
	result := rules.rule_s_200_090_002_12 with input as input_data
		with data.metabolights.validation.v2.controls.sampleFileControls as {
			"__default_characteristic__": [selected_rule],
			"Characteristics[Organism part]": [],
			"Characteristics[Variant]": [],
			"Characteristics[Sample type]": [],
		}

	count(result) == 1
}

# METADATA
# title: <title>.
# description: <description>.
test_rule_s_200_090_002_12_violation_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Characteristics[Organism]",
				"value": ["gram", "gram", "gram"],
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Source REF",
				"value": ["UOX", "UO", "UO"],
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Accession Number",
				"value": ["http://purl.obolibrary.org/obo/UO_0000021", "http://purl.obolibrary.org/obo/UO_0000021", "http://purl.obolibrary.org/obo/UO_0000021"],
			},
		],
	)

	selected_rule := json.patch(
		test_rules.sample.select_ontology_term_01,
		[
			{
				"op": "replace",
				"path": "termEnforcementLevel",
				"value": "required",
			},
			{
				"op": "replace",
				"path": "allowedPlaceholders",
				"value": [],
			},
		],
	)
	result := rules.rule_s_200_090_002_12 with input as input_data
		with data.metabolights.validation.v2.controls.sampleFileControls as {
			"__default_characteristic__": [selected_rule],
			"Characteristics[Organism part]": [],
			"Characteristics[Variant]": [],
			"Characteristics[Sample type]": [],
		}

	count(result) == 1
}

# METADATA
# title: <title>.
# description: <description>.
test_rule_s_200_090_002_12_violation_03 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Characteristics[Organism]",
				"value": ["gram", "gram", "gram"],
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Source REF",
				"value": ["UOX", "UO", "UO"],
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Accession Number",
				"value": ["http://purl.obolibrary.org/obo/UO_0000021", "http://purl.obolibrary.org/obo/UO_0000021", "http://purl.obolibrary.org/obo/UO_0000021"],
			},
		],
	)

	selected_rule := json.patch(
		test_rules.sample.selected_ontologies_01,
		[
			{
				"op": "replace",
				"path": "termEnforcementLevel",
				"value": "required",
			},
			{
				"op": "replace",
				"path": "allowedPlaceholders",
				"value": [],
			},
		],
	)
	result := rules.rule_s_200_090_002_12 with input as input_data
		with data.metabolights.validation.v2.controls.sampleFileControls as {
			"__default_characteristic__": [selected_rule],
			"Characteristics[Organism part]": [],
			"Characteristics[Variant]": [],
			"Characteristics[Sample type]": [],
		}
	count(result) == 1
}

# METADATA
# title: <title>.
# description: <description>.
test_rule_s_200_090_002_12_violation_04 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Characteristics[Organism]",
				"value": ["gram", "gram", "gram"],
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Source REF",
				"value": ["UOX", "UO", "UO"],
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Accession Number",
				"value": ["http://purl.obolibrary.org/obo/UO_0000021", "http://purl.obolibrary.org/obo/UO_0000021", "http://purl.obolibrary.org/obo/UO_0000021"],
			},
		],
	)

	selected_rule := json.patch(
		test_rules.sample.child_ontology_term_01,
		[
			{
				"op": "replace",
				"path": "termEnforcementLevel",
				"value": "required",
			},
			{
				"op": "replace",
				"path": "allowedPlaceholders",
				"value": [],
			},
		],
	)
	result := rules.rule_s_200_090_002_12 with input as input_data
		with data.metabolights.validation.v2.controls.sampleFileControls as {
			"__default_characteristic__": [selected_rule],
			"Characteristics[Organism part]": [],
			"Characteristics[Variant]": [],
			"Characteristics[Sample type]": [],
		}
	count(result) == 1
}
