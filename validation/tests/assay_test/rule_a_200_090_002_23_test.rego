#########################################################################################################
# Unit tests for rule_a_200_090_002_23
#########################################################################################################
package tests.assay_test

import data.metabolights.validation.v2.rules.phase2.violations as rules
import data.tests.data.inputs.rules as test_rules

import rego.v1

# METADATA
# title: Value is not in the default ontologies or controlled lists
# description: A term SHOULD be selected from the default ontologies or controlled lists.
# custom:
#  rule_id: rule_a_200_090_002_23
#  type: WARNING
#  priority: HIGH
#  section: assays.general
rule_a_200_090_002_23_test_cases := 1

# METADATA
# title: <title>.
# description: <description>.
test_rule_a_200_090_002_23_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Parameter Value[Instrument]/0",
				"value": "data",
			},
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Term Source REF.2/0",
				"value": "OBI",
			},
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Term Accession Number.2/0",
				"value": "htt",
			},
		],
	)

	selected_rule := json.patch(
		test_rules.assay.any_ontology_term_01,
		[
			{
				"op": "replace",
				"path": "termEnforcementLevel",
				"value": "recommended",
			},
			{
				"op": "replace",
				"path": "allowedPlaceholders",
				"value": [],
			},
		],
	)
	result := rules.rule_a_200_090_002_23 with input as input_data
		with data.metabolights.validation.v2.controls.assayFileControls as {
			"__default__": [selected_rule],
			"Sample Name": [],
			"Protocol REF": [],
			"Parameter Value[Post Extraction]": [],
			"Parameter Value[Derivatization]": [],
			"Extract Name": [],
			"Label": [],
			"Parameter Value[Scan polarity]": [],
			"Parameter Value[Scan m/z range]": [],
			"Parameter Value[Ion source]": [],
			"Parameter Value[Mass analyzer]": [],
			"Parameter Value[Test Data]": [],
			"MS Assay Name": [],
			"Raw Spectral Data File": [],
			"Normalization Name": [],
			"Derived Spectral Data File": [],
			"Data Transformation Name": [],
			"Metabolite Assignment File": [],
			"Protocol REF.4": [],
			"Protocol REF.3": [],
			"Protocol REF.2": [],
			"Protocol REF.1": [],
		}

	count(result) == 0
}

# METADATA
# title: <title>.
# description: <description>.
test_rule_a_200_090_002_23_no_violation_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Parameter Value[Instrument]",
				"value": ["gram", "gram", "gram"],
			},
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Term Source REF.2",
				"value": ["UO", "UO", "UO"],
			},
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Term Accession Number.2",
				"value": [
					"http://purl.obolibrary.org/obo/UO_0000021",
					"http://purl.obolibrary.org/obo/UO_0000021",
					"http://purl.obolibrary.org/obo/UO_0000021",
				],
			},
		],
	)

	selected_rule := json.patch(
		test_rules.assay.select_ontology_term_01,
		[
			{
				"op": "replace",
				"path": "termEnforcementLevel",
				"value": "recommended",
			},
			{
				"op": "replace",
				"path": "allowedPlaceholders",
				"value": [],
			},
		],
	)
	result := rules.rule_a_200_090_002_23 with input as input_data
		with data.metabolights.validation.v2.controls.assayFileControls as {
			"__default__": [selected_rule],
			"Sample Name": [],
			"Protocol REF": [],
			"Parameter Value[Post Extraction]": [],
			"Parameter Value[Derivatization]": [],
			"Extract Name": [],
			"Label": [],
			"Parameter Value[Scan polarity]": [],
			"Parameter Value[Scan m/z range]": [],
			"Parameter Value[Ion source]": [],
			"Parameter Value[Mass analyzer]": [],
			"Parameter Value[Test Data]": [],
			"MS Assay Name": [],
			"Raw Spectral Data File": [],
			"Normalization Name": [],
			"Derived Spectral Data File": [],
			"Data Transformation Name": [],
			"Metabolite Assignment File": [],
			"Protocol REF.4": [],
			"Protocol REF.3": [],
			"Protocol REF.2": [],
			"Protocol REF.1": [],
		}
	count(result) == 0
}

# METADATA
# title: <title>.
# description: <description>.
test_rule_a_200_090_002_23_no_violation_03 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Parameter Value[Instrument]",
				"value": ["gram", "gram", "gram"],
			},
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Term Source REF.2",
				"value": ["UO", "UO", "UO"],
			},
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Term Accession Number.2",
				"value": ["http://purl.obolibrary.org/obo/UO_0000021", "http://purl.obolibrary.org/obo/UO_0000021", "http://purl.obolibrary.org/obo/UO_0000021"],
			},
		],
	)

	selected_rule := json.patch(
		test_rules.assay.selected_ontologies_01,
		[
			{
				"op": "replace",
				"path": "termEnforcementLevel",
				"value": "recommended",
			},
			{
				"op": "replace",
				"path": "allowedPlaceholders",
				"value": [],
			},
		],
	)
	result := rules.rule_a_200_090_002_23 with input as input_data
		with data.metabolights.validation.v2.controls.assayFileControls as {
			"__default__": [selected_rule],
			"Sample Name": [],
			"Protocol REF": [],
			"Parameter Value[Post Extraction]": [],
			"Parameter Value[Derivatization]": [],
			"Extract Name": [],
			"Label": [],
			"Parameter Value[Scan polarity]": [],
			"Parameter Value[Scan m/z range]": [],
			"Parameter Value[Ion source]": [],
			"Parameter Value[Mass analyzer]": [],
			"Parameter Value[Test Data]": [],
			"MS Assay Name": [],
			"Raw Spectral Data File": [],
			"Normalization Name": [],
			"Derived Spectral Data File": [],
			"Data Transformation Name": [],
			"Metabolite Assignment File": [],
			"Protocol REF.4": [],
			"Protocol REF.3": [],
			"Protocol REF.2": [],
			"Protocol REF.1": [],
		}
	count(result) == 0
}

# METADATA
# title: <title>.
# description: <description>.
test_rule_a_200_090_002_23_no_violation_04 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Parameter Value[Instrument]",
				"value": ["gram", "gram", "gram"],
			},
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Term Source REF.2",
				"value": ["UO", "UO", "UO"],
			},
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Term Accession Number.2",
				"value": ["http://purl.obolibrary.org/obo/UO_0000021", "http://purl.obolibrary.org/obo/UO_0000021", "http://purl.obolibrary.org/obo/UO_0000021"],
			},
		],
	)

	selected_rule := json.patch(
		test_rules.assay.child_ontology_term_01,
		[
			{
				"op": "replace",
				"path": "termEnforcementLevel",
				"value": "recommended",
			},
			{
				"op": "replace",
				"path": "allowedPlaceholders",
				"value": [],
			},
		],
	)
	result := rules.rule_a_200_090_002_23 with input as input_data
		with data.metabolights.validation.v2.controls.assayFileControls as {
			"__default__": [selected_rule],
			"Sample Name": [],
			"Protocol REF": [],
			"Parameter Value[Post Extraction]": [],
			"Parameter Value[Derivatization]": [],
			"Extract Name": [],
			"Label": [],
			"Parameter Value[Scan polarity]": [],
			"Parameter Value[Scan m/z range]": [],
			"Parameter Value[Ion source]": [],
			"Parameter Value[Mass analyzer]": [],
			"Parameter Value[Test Data]": [],
			"MS Assay Name": [],
			"Raw Spectral Data File": [],
			"Normalization Name": [],
			"Derived Spectral Data File": [],
			"Data Transformation Name": [],
			"Metabolite Assignment File": [],
			"Protocol REF.4": [],
			"Protocol REF.3": [],
			"Protocol REF.2": [],
			"Protocol REF.1": [],
		}
	count(result) == 0
}

# METADATA
# title: <title>.
# description: <description>.
test_rule_a_200_090_002_23_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Parameter Value[Instrument]/0",
				"value": "data",
			},
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Term Source REF.2/0",
				"value": "",
			},
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Term Accession Number.2/0",
				"value": "htt",
			},
		],
	)

	selected_rule := json.patch(
		test_rules.assay.any_ontology_term_01,
		[
			{
				"op": "replace",
				"path": "termEnforcementLevel",
				"value": "recommended",
			},
			{
				"op": "replace",
				"path": "allowedPlaceholders",
				"value": [],
			},
		],
	)
	result := rules.rule_a_200_090_002_23 with input as input_data
		with data.metabolights.validation.v2.controls.assayFileControls as {
			"__default__": [selected_rule],
			"Sample Name": [],
			"Protocol REF": [],
			"Parameter Value[Post Extraction]": [],
			"Parameter Value[Derivatization]": [],
			"Extract Name": [],
			"Label": [],
			"Parameter Value[Scan polarity]": [],
			"Parameter Value[Scan m/z range]": [],
			"Parameter Value[Ion source]": [],
			"Parameter Value[Mass analyzer]": [],
			"Parameter Value[Test Data]": [],
			"MS Assay Name": [],
			"Raw Spectral Data File": [],
			"Normalization Name": [],
			"Derived Spectral Data File": [],
			"Data Transformation Name": [],
			"Metabolite Assignment File": [],
			"Protocol REF.4": [],
			"Protocol REF.3": [],
			"Protocol REF.2": [],
			"Protocol REF.1": [],
		}

	count(result) == 1
}

# METADATA
# title: <title>.
# description: <description>.
test_rule_a_200_090_002_23_violation_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Parameter Value[Instrument]",
				"value": ["gram", "gram", "gram"],
			},
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Term Source REF.2",
				"value": ["UOX", "UO", "UO"],
			},
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Term Accession Number.2",
				"value": ["http://purl.obolibrary.org/obo/UO_0000021", "http://purl.obolibrary.org/obo/UO_0000021", "http://purl.obolibrary.org/obo/UO_0000021"],
			},
		],
	)

	selected_rule := json.patch(
		test_rules.assay.select_ontology_term_01,
		[
			{
				"op": "replace",
				"path": "termEnforcementLevel",
				"value": "recommended",
			},
			{
				"op": "replace",
				"path": "allowedPlaceholders",
				"value": [],
			},
		],
	)
	result := rules.rule_a_200_090_002_23 with input as input_data
		with data.metabolights.validation.v2.controls.assayFileControls as {
			"__default__": [selected_rule],
			"Sample Name": [],
			"Protocol REF": [],
			"Parameter Value[Post Extraction]": [],
			"Parameter Value[Derivatization]": [],
			"Extract Name": [],
			"Label": [],
			"Parameter Value[Scan polarity]": [],
			"Parameter Value[Scan m/z range]": [],
			"Parameter Value[Ion source]": [],
			"Parameter Value[Mass analyzer]": [],
			"Parameter Value[Test Data]": [],
			"MS Assay Name": [],
			"Raw Spectral Data File": [],
			"Normalization Name": [],
			"Derived Spectral Data File": [],
			"Data Transformation Name": [],
			"Metabolite Assignment File": [],
			"Protocol REF.4": [],
			"Protocol REF.3": [],
			"Protocol REF.2": [],
			"Protocol REF.1": [],
		}

	count(result) == 1
}

# METADATA
# title: <title>.
# description: <description>.
test_rule_a_200_090_002_23_violation_03 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Parameter Value[Instrument]",
				"value": ["gram", "gram", "gram"],
			},
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Term Source REF.2",
				"value": ["UOX", "UO", "UO"],
			},
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Term Accession Number.2",
				"value": ["http://purl.obolibrary.org/obo/UO_0000021", "http://purl.obolibrary.org/obo/UO_0000021", "http://purl.obolibrary.org/obo/UO_0000021"],
			},
		],
	)

	selected_rule := json.patch(
		test_rules.assay.selected_ontologies_01,
		[
			{
				"op": "replace",
				"path": "termEnforcementLevel",
				"value": "recommended",
			},
			{
				"op": "replace",
				"path": "allowedPlaceholders",
				"value": [],
			},
		],
	)
	result := rules.rule_a_200_090_002_23 with input as input_data
		with data.metabolights.validation.v2.controls.assayFileControls as {
			"__default__": [selected_rule],
			"Sample Name": [],
			"Protocol REF": [],
			"Parameter Value[Post Extraction]": [],
			"Parameter Value[Derivatization]": [],
			"Extract Name": [],
			"Label": [],
			"Parameter Value[Scan polarity]": [],
			"Parameter Value[Scan m/z range]": [],
			"Parameter Value[Ion source]": [],
			"Parameter Value[Mass analyzer]": [],
			"Parameter Value[Test Data]": [],
			"MS Assay Name": [],
			"Raw Spectral Data File": [],
			"Normalization Name": [],
			"Derived Spectral Data File": [],
			"Data Transformation Name": [],
			"Metabolite Assignment File": [],
			"Protocol REF.4": [],
			"Protocol REF.3": [],
			"Protocol REF.2": [],
			"Protocol REF.1": [],
		}
	count(result) == 1
}

# METADATA
# title: <title>.
# description: <description>.
test_rule_a_200_090_002_23_violation_04 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Parameter Value[Instrument]",
				"value": ["gram", "gram", "gram"],
			},
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Term Source REF.2",
				"value": ["UOX", "UO", "UO"],
			},
			{
				"op": "replace",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/data/Term Accession Number.2",
				"value": ["http://purl.obolibrary.org/obo/UO_0000021", "http://purl.obolibrary.org/obo/UO_0000021", "http://purl.obolibrary.org/obo/UO_0000021"],
			},
		],
	)

	selected_rule := json.patch(
		test_rules.assay.child_ontology_term_01,
		[
			{
				"op": "replace",
				"path": "termEnforcementLevel",
				"value": "recommended",
			},
			{
				"op": "replace",
				"path": "allowedPlaceholders",
				"value": [],
			},
		],
	)
	result := rules.rule_a_200_090_002_23 with input as input_data
		with data.metabolights.validation.v2.controls.assayFileControls as {
			"__default__": [selected_rule],
			"Sample Name": [],
			"Protocol REF": [],
			"Parameter Value[Post Extraction]": [],
			"Parameter Value[Derivatization]": [],
			"Extract Name": [],
			"Label": [],
			"Parameter Value[Scan polarity]": [],
			"Parameter Value[Scan m/z range]": [],
			"Parameter Value[Ion source]": [],
			"Parameter Value[Mass analyzer]": [],
			"Parameter Value[Test Data]": [],
			"MS Assay Name": [],
			"Raw Spectral Data File": [],
			"Normalization Name": [],
			"Derived Spectral Data File": [],
			"Data Transformation Name": [],
			"Metabolite Assignment File": [],
			"Protocol REF.4": [],
			"Protocol REF.3": [],
			"Protocol REF.2": [],
			"Protocol REF.1": [],
		}
	count(result) == 1
}
