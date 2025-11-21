#########################################################################################################
# Unit tests for rule_a_100_100_001_04
#########################################################################################################
package tests.assay_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Unexpected column in assay file.
# description: Rename or remove unexpected columns in assay file.
# custom:
#  rule_id: rule_a_100_100_001_04
#  type: ERROR
#  priority: CRITICAL
#  section: assays.columns
rule_a_100_100_001_04_test_cases := 1




# METADATA
# title: <title>.
# description: <description>.
test_rule_a_100_100_001_04_no_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := input_01
	result := rules.rule_a_100_100_001_04 
		with input as input_data 
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_ASSAY_HEADER_NAMES as {"a_REQ2025111188888-01_MS_metabolite_profiling.txt": {
            "Sample Name",
            "Protocol REF",
            "Parameter Value[Post Extraction]",
            "Parameter Value[Derivatization]",
            "Extract Name",
            "Label",
            "Term Source REF",
            "Term Accession Number",
            "Parameter Value[Scan polarity]",
            "Parameter Value[Scan m/z range]",
            "Parameter Value[Instrument]",
            "Parameter Value[Ion source]",
            "Parameter Value[Mass analyzer]",
            "Parameter Value[Test Data]",
            "Unit",
            "MS Assay Name",
            "Raw Spectral Data File",
            "Normalization Name",
            "Derived Spectral Data File",
            "Data Transformation Name",
            "Metabolite Assignment File"
		}}

	count(result) == 0
}


# METADATA
# title: <title>.
# description: <description>.
test_rule_a_100_100_001_04_no_violation_02 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := json.patch(
		input_01,
		[
			{
				"op": "add",
				"path": "/assays/a_REQ2025111188888-01_MS_metabolite_profiling.txt/table/headers/-",
				"value": {
					"columnHeader": "Comment[Data]",
					"columnName": "Comment[Data]",
					"columnIndex": 32,
				},
			},
		],
	)
	result := rules.rule_a_100_100_001_04 
		with input as input_data 
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_ASSAY_HEADER_NAMES as {"a_REQ2025111188888-01_MS_metabolite_profiling.txt": {
            "Sample Name",
            "Protocol REF",
            "Parameter Value[Post Extraction]",
            "Parameter Value[Derivatization]",
            "Extract Name",
            "Label",
            "Term Source REF",
            "Term Accession Number",
            "Parameter Value[Scan polarity]",
            "Parameter Value[Scan m/z range]",
            "Parameter Value[Instrument]",
            "Parameter Value[Ion source]",
            "Parameter Value[Mass analyzer]",
            "Parameter Value[Test Data]",
            "Unit",
            "MS Assay Name",
            "Raw Spectral Data File",
            "Normalization Name",
            "Derived Spectral Data File",
            "Data Transformation Name",
            "Metabolite Assignment File"
		}}

	count(result) == 0
}


# METADATA
# title: <title>.
# description: <description>.
test_rule_a_100_100_001_04_violation_01 if {
	input_01 := data.tests.data.inputs.minimum_01
	input_data := input_01

	result := rules.rule_a_100_100_001_04 
		with input as input_data 
		with data.metabolights.validation.v2.rules.phase1.definitions._DEFAULT_ASSAY_HEADER_NAMES as {"a_REQ2025111188888-01_MS_metabolite_profiling.txt": {
            "Sample Name",
            "Protocol REF",
            "Parameter Value[Post Extraction]",
            "Parameter Value[Derivatization]",
            "Extract Name",
            "Label",
            "Term Source REF",
            "Term Accession Number",
            "Parameter Value[Scan polarity]",
            "Parameter Value[Scan m/z range]",
            "Parameter Value[Instrument]",
            "Parameter Value[Ion source]",
            "Parameter Value[Mass analyzer]",
            "Parameter Value[Test Data]",
            "Unit",
            "MS Assay Name",
            "Raw Spectral Data File",
            "Derived Spectral Data File",
            "Data Transformation Name",
            "Metabolite Assignment File"
		}}
	# print(result)
	count(result) == 1
}

