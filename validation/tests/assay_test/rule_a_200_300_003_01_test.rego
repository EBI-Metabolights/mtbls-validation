#########################################################################################################
# Unit tests for rule_a_200_300_003_01
#########################################################################################################
package tests.assay_test

import data.metabolights.validation.v2.rules.phase2.violations as rules

import rego.v1

# METADATA
# title: Scan Polarity column values are not same as assay file name.
# description: Values for Scan Polarity column is not same as assay file name.
# custom:
#  rule_id: rule_a_200_300_003_01
#  type: WARNING
#  priority: CRITICAL
#  section: assays.mass_spectrometry
rule_a_200_300_003_01_test_cases := 1

# METADATA
# title: Scan Polarity column values are same as assay file name
# description: Scan Polarity column values not same as assay file name
test_rule_a_200_300_003_01_no_violation_01 if {
	result := rules.rule_a_200_300_003_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1_GC-MS_positive.txt": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4, "rowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Scan polarity]",
					"columnName": "Parameter Value[Scan polarity]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Column model]",
					"columnName": "Parameter Value[Column model]", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
			],
			"columns": [
				"Parameter Value[Scan polarity]",
				"Parameter Value[Column model]",
			],
			"data": {
				"Parameter Value[Scan polarity]": ["positive", "positive", "positive", "positive"],
				"Parameter Value[Column model]": ["1", "2 ", "", "1234"],
			},
		}}},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: Scan Polarity column values are not same as assay file name
# description: Scan Polarity column values are not same as assay file name
test_rule_a_200_300_003_01_violation_01 if {
	result := rules.rule_a_200_300_003_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"sampleNames": ["Sample 1", "Sample 2", "Sample 3", "Sample 4"]}},
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "GC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4, "rowCount": 4,
			"headers": [
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Scan polarity]",
					"columnName": "Parameter Value[Scan polarity]", "columnIndex": 0,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
				{
					"columnCategory": "Parameter Value", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "Parameter Value[Column model]",
					"columnName": "Parameter Value[Column model]", "columnIndex": 3,
					"additionalColumns": ["Term Source REF", "Term Accession Number"],
				},
			],
			"columns": [
				"Parameter Value[Scan polarity]",
				"Parameter Value[Column model]",
			],
			"data": {
				"Parameter Value[Scan polarity]": ["positive", "positive", "positive", "positive"],
				"Parameter Value[Column model]": ["1", "2 ", "", "1234"],
			},
		}}},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}
