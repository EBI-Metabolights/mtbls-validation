#########################################################################################################
# Unit tests for rule_s_200_090_002_03
#########################################################################################################
package tests.sample_test

import data.metabolights.validation.v2.rules.phase2.violations as rules
import rego.v1

# METADATA
# title: Ontology Term Source REF not referenced in investigation file.
# description: All ontology Term Source REFs should be referenced in ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt.
# custom:
#  rule_id: rule_s_200_090_002_03
#  type: WARNING
#  priority: HIGH
#  section: samples.general
rule_s_200_090_002_03_test_cases := 1

# METADATA
# title: <title>.
# description: <description>.
test_rule_s_200_090_002_03_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Factor Value[Disease]/0",
				"value": "data",
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Source REF.4/0",
				"value": "NCBITaxon",
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Accession Number.4/0",
				"value": "htt",
			},
		],
	)

	result := rules.rule_s_200_090_002_03 with input as input_data
	count(result) == 0
}

# METADATA
# title: <title>.
# description: <description>.
test_rule_s_200_090_002_03_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Factor Value[Disease]/0",
				"value": "data",
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Source REF.4/0",
				"value": "UBERON",
			},
			{
				"op": "replace",
				"path": "/samples/s_REQ2025111188888.txt/table/data/Term Accession Number.4/0",
				"value": "htt",
			},
		],
	)

	result := rules.rule_s_200_090_002_03 with input as input_data
	count(result) == 1
}
