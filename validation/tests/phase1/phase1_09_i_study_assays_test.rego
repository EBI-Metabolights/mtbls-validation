package metabolights.validation.v2.phase1.tests

import rego.v1
import data.metabolights.validation.v2.phase1.violations as rules


#########################################################################################################
# rule_i_100_340_001_01
#########################################################################################################

# METADATA
# title: There is a study assay
# description: There is one study assay in i_Investigation.txt.
test_rule_i_100_340_001_01_no_violation_01 if {
	result := rules.rule_i_100_340_001_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [{
			"fileName": "",
			"measurementType": {
				"term": "",
				"termAccessionNumber": "",
				"termSourceRef": "",
			},
			"technologyType": {
				"term": "",
				"termAccessionNumber": "",
				"termSourceRef": "",
			},
			"technologyPlatform": "",
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: There are two study assays
# description: There are two study assays in i_Investigation.txt.
test_rule_i_100_340_001_01_no_violation_02 if {
	result := rules.rule_i_100_340_001_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: There is no study assay.
# description: There is no study assay in i_Investigation.txt.
test_rule_i_100_340_001_01_violation_01 if {
	result := rules.rule_i_100_340_001_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": []}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

#########################################################################################################
# rule_i_100_340_002_01
#########################################################################################################

# METADATA
# title: study assay file name is not empty
# description: study assay file name is not empty.
test_rule_i_100_340_002_01_no_violation_01 if {
	result := rules.rule_i_100_340_002_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [{
			"fileName": "a_test.txt",
			"measurementType": {
				"term": "",
				"termAccessionNumber": "",
				"termSourceRef": "",
			},
			"technologyType": {
				"term": "",
				"termAccessionNumber": "",
				"termSourceRef": "",
			},
			"technologyPlatform": "",
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: study assay file names are not empty
# description: study assay file names are not empty
test_rule_i_100_340_002_01_no_violation_02 if {
	result := rules.rule_i_100_340_002_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [
			{
				"fileName": "a_test2.txt",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
			{
				"fileName": "a_test.txt",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: One study assay is empty
# description: One study assay is empty
test_rule_i_100_340_002_01_violation_01 if {
	result := rules.rule_i_100_340_002_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [
			{
				"fileName": "x_test.txt",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

#########################################################################################################
# rule_i_100_340_002_02
#########################################################################################################

# METADATA
# title: study assay file name pattern is valid
# description: study assay file name pattern is valid
test_rule_i_100_340_002_02_no_violation_01 if {
	result := rules.rule_i_100_340_002_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [{
			"fileName": "a_test.txt",
			"measurementType": {
				"term": "",
				"termAccessionNumber": "",
				"termSourceRef": "",
			},
			"technologyType": {
				"term": "",
				"termAccessionNumber": "",
				"termSourceRef": "",
			},
			"technologyPlatform": "",
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: study assay file name pattern is valid
# description: study assay file name pattern is valid
test_rule_i_100_340_002_02_no_violation_02 if {
	result := rules.rule_i_100_340_002_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [
			{
				"fileName": "a_test2.txt",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
			{
				"fileName": "a_test.txt",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: One study assay is empty
# description: One study assay is empty
test_rule_i_100_340_002_02_violation_01 if {
	result := rules.rule_i_100_340_002_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [
			{
				"fileName": "x_test.txt",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
			{
				"fileName": "a_test.tsv",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 2
}

#########################################################################################################
# rule_i_100_340_002_03
#########################################################################################################

# METADATA
# title: study assay file name pattern is valid
# description: study assay file name pattern is valid
test_rule_i_100_340_002_03_no_violation_01 if {
	result := rules.rule_i_100_340_002_03 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [{
			"fileName": "a_test01-_..txt",
			"measurementType": {
				"term": "",
				"termAccessionNumber": "",
				"termSourceRef": "",
			},
			"technologyType": {
				"term": "",
				"termAccessionNumber": "",
				"termSourceRef": "",
			},
			"technologyPlatform": "",
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Assay file names have valid characters.
# description: Assay file names have valid characters.
test_rule_i_100_340_002_03_no_violation_02 if {
	result := rules.rule_i_100_340_002_03 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [
			{
				"fileName": "a_test2.txt",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
			{
				"fileName": "a_test-data_value.txt",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Assay file names have invalid characters.
# description: Assay file names have invalid characters.
test_rule_i_100_340_002_03_violation_01 if {
	result := rules.rule_i_100_340_002_03 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [
			{
				"fileName": "x_:test.txt",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
			{
				"fileName": "a_test-$.tsv",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 2
}

#########################################################################################################
# rule_i_100_340_003_01
#########################################################################################################

# METADATA
# title: Study assay measurement type has 12 or more characters
# description: Study assay measurement type has 1 or more characters
test_rule_i_100_340_003_01_no_violation_01 if {
	result := rules.rule_i_100_340_003_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [
			{
				"fileName": "",
				"measurementType": {
					"term": "X",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
			{
				"fileName": "",
				"measurementType": {
					"term": "metabolite profiling",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study assay measurement type has less than 1 characters.
# description: Study assay measurement type has less than 1 characters.
test_rule_i_100_340_003_01_violation_01 if {
	result := rules.rule_i_100_340_003_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
			{
				"fileName": "",
				"measurementType": {
					"term": "metabolite profiling",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

#########################################################################################################
# rule_i_100_340_004_01
#########################################################################################################

# METADATA
# title: Study assay measurement type accession number is not empty.
# description: Study assay measurement type accession number is not empty.
test_rule_i_100_340_004_01_no_violation_01 if {
	result := rules.rule_i_100_340_004_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "http://purl.obolibrary.org/obo/OBI_0000366",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "X",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study assay measurement type accession number is not valid.
# description: Study assay measurement type accession number is not valid.
test_rule_i_100_340_004_01_violation_01 if {
	result := rules.rule_i_100_340_004_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "http://purl.obolibrary.org/obo/OBI_0000366",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

#########################################################################################################
# rule_i_100_340_005_01
#########################################################################################################

# METADATA
# title: Study assay measurement type source ref is equal to or greater than 2.
# description: Study assay measurement type source ref is equal to or greater than 2.
test_rule_i_100_340_005_01_no_violation_01 if {
	result := rules.rule_i_100_340_005_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "EFO",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "MTBLS",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title:  Study assay measurement type source ref is less than 2.
# description: Study assay measurement type source ref is less than 2.
test_rule_i_100_340_005_01_violation_01 if {
	result := rules.rule_i_100_340_005_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "A",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "UA",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 2
}

#########################################################################################################
# rule_i_100_340_005_02
#########################################################################################################

# METADATA
# title: Study assay measurement type source ref is in the Ontology Source Reference section.
# description: Study assay measurement type source ref is in the Ontology Source Reference section.
test_rule_i_100_340_005_02_no_violation_01 if {
	result := rules.rule_i_100_340_005_02 with input as {
		"investigation": {
			"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [
				{
					"fileName": "",
					"measurementType": {
						"term": "",
						"termAccessionNumber": "",
						"termSourceRef": "EFO",
					},
					"technologyType": {
						"term": "",
						"termAccessionNumber": "",
						"termSourceRef": "",
					},
					"technologyPlatform": "",
				},
				{
					"fileName": "",
					"measurementType": {
						"term": "",
						"termAccessionNumber": "",
						"termSourceRef": "MTBLS",
					},
					"technologyType": {
						"term": "",
						"termAccessionNumber": "",
						"termSourceRef": "",
					},
					"technologyPlatform": "",
				},
			]}}],
			"ontologySourceReferences": {"references": [
				{
					"sourceName": "EFO",
					"sourceFile": "https://www.ebi.ac.uk/metabolights/",
					"sourceVersion": "1",
					"sourceDescription": "NCBI",
				},
				{
					"sourceName": "MTBLS",
					"sourceFile": "https://www.ebi.ac.uk/metabolights/",
					"sourceVersion": "1",
					"sourceDescription": "MTBLS",
				},
			]},
		},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title:  One Study assay measurement type source ref is not in the Ontology Source Reference section.
# description: One Study assay measurement type source ref is not in the Ontology Source Reference section.
test_rule_i_100_340_005_02_violation_01 if {
	result := rules.rule_i_100_340_005_02 with input as {
		"investigation": {
			"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [
				{
					"fileName": "",
					"measurementType": {
						"term": "",
						"termAccessionNumber": "",
						"termSourceRef": "EFO",
					},
					"technologyType": {
						"term": "",
						"termAccessionNumber": "",
						"termSourceRef": "",
					},
					"technologyPlatform": "",
				},
				{
					"fileName": "",
					"measurementType": {
						"term": "",
						"termAccessionNumber": "",
						"termSourceRef": "MTBLS",
					},
					"technologyType": {
						"term": "",
						"termAccessionNumber": "",
						"termSourceRef": "",
					},
					"technologyPlatform": "",
				},
			]}}],
			"ontologySourceReferences": {"references": [{
				"sourceName": "MTBLS",
				"sourceFile": "https://www.ebi.ac.uk/metabolights/",
				"sourceVersion": "1",
				"sourceDescription": "MTBLS",
			}]},
		},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

#########################################################################################################
# rule_i_100_340_005_03
#########################################################################################################

# METADATA
# title: Study assay measurement type source ref is in control list.
# description: Study assay measurement type source ref is in control list.
test_rule_i_100_340_005_03_no_violation_01 if {
	result := rules.rule_i_100_340_005_03 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "EFO",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "MTBLS",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
		with data.metabolights.validation.v2.phase1.definitions.CL_STUDY_ASSAY_MEASUREMENT_TYPE_REF_SOURCES as [
			"EFO",
			"MTBLS",
		]
	count(result) == 0
}

# METADATA
# title:  study assay's term source ref is not in control list.
# description: study assay's term source ref is not in control list.
test_rule_i_100_340_005_03_violation_01 if {
	result := rules.rule_i_100_340_005_03 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "EFO",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "MTBLS",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "UO",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
		with data.metabolights.validation.v2.phase1.definitions.CL_STUDY_ASSAY_MEASUREMENT_TYPE_REF_SOURCES as ["EFO"]
	count(result) == 2
}

#########################################################################################################
# rule_i_100_340_006_01
#########################################################################################################

# METADATA
# title: Study assay technology type has 1 or more characters
# description: Study assay technology type has 1 or more characters
test_rule_i_100_340_006_01_no_violation_01 if {
	result := rules.rule_i_100_340_006_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "X",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "UO",
				},
				"technologyType": {
					"term": "metabolite profiling",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study assay technology type has less than 1 characters.
# description: Study assay technology type has less than 1 characters.
test_rule_i_100_340_006_01_violation_01 if {
	result := rules.rule_i_100_340_006_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "UO",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "UO",
				},
				"technologyType": {
					"term": "metabolite profiling",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

#########################################################################################################
# rule_i_100_340_007_01
#########################################################################################################

# METADATA
# title: Study assay technology type accession number is not empty.
# description: Study assay technology type accession number is not empty.
test_rule_i_100_340_007_01_no_violation_01 if {
	result := rules.rule_i_100_340_007_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "UO",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "http://purl.obolibrary.org/obo/OBI_0000366",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "UO",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "X",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study assay technology type accession number is not valid.
# description: Study assay technology type accession number is not valid.
test_rule_i_100_340_007_01_violation_01 if {
	result := rules.rule_i_100_340_007_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "UO",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "UO",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "http://purl.obolibrary.org/obo/OBI_0000366",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

#########################################################################################################
# rule_i_100_340_008_01
#########################################################################################################

# METADATA
# title: Study assay technology type source ref is equal to or greater than 1.
# description: Study assay technology type source ref is equal to or greater than 1.
test_rule_i_100_340_008_01_no_violation_01 if {
	result := rules.rule_i_100_340_008_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "UO",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "EFO",
				},
				"technologyPlatform": "",
			},
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "UO",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "MTBLS",
				},
				"technologyPlatform": "",
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title:  Study assay technology type source ref is less than 2.
# description: Study assay technology type source ref is less than 2.
test_rule_i_100_340_008_01_violation_01 if {
	result := rules.rule_i_100_340_008_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "A",
				},
				"technologyPlatform": "",
			},
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "UA",
				},
				"technologyPlatform": "",
			},
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "UO",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 2
}

#########################################################################################################
# rule_i_100_340_008_02
#########################################################################################################

# METADATA
# title: Study assay technology type source ref is in the Ontology Source Reference section.
# description: Study assay technology type source ref is in the Ontology Source Reference section.
test_rule_i_100_340_008_02_no_violation_01 if {
	result := rules.rule_i_100_340_008_02 with input as {
		"investigation": {
			"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [
				{
					"fileName": "",
					"measurementType": {
						"term": "",
						"termAccessionNumber": "",
						"termSourceRef": "",
					},
					"technologyType": {
						"term": "",
						"termAccessionNumber": "",
						"termSourceRef": "EFO",
					},
					"technologyPlatform": "",
				},
				{
					"fileName": "",
					"measurementType": {
						"term": "",
						"termAccessionNumber": "",
						"termSourceRef": "UO",
					},
					"technologyType": {
						"term": "",
						"termAccessionNumber": "",
						"termSourceRef": "MTBLS",
					},
					"technologyPlatform": "",
				},
			]}}],
			"ontologySourceReferences": {"references": [
				{
					"sourceName": "EFO",
					"sourceFile": "https://www.ebi.ac.uk/metabolights/",
					"sourceVersion": "1",
					"sourceDescription": "NCBI",
				},
				{
					"sourceName": "MTBLS",
					"sourceFile": "https://www.ebi.ac.uk/metabolights/",
					"sourceVersion": "1",
					"sourceDescription": "MTBLS",
				},
			]},
		},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title:  One Study assay technology type source ref is not in the Ontology Source Reference section.
# description: One Study assay technology type source ref is not in the Ontology Source Reference section.
test_rule_i_100_340_008_02_violation_01 if {
	result := rules.rule_i_100_340_008_02 with input as {
		"investigation": {
			"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [
				{
					"fileName": "",
					"measurementType": {
						"term": "",
						"termAccessionNumber": "",
						"termSourceRef": "",
					},
					"technologyType": {
						"term": "",
						"termAccessionNumber": "",
						"termSourceRef": "EFO",
					},
					"technologyPlatform": "",
				},
				{
					"fileName": "",
					"measurementType": {
						"term": "",
						"termAccessionNumber": "",
						"termSourceRef": "",
					},
					"technologyType": {
						"term": "",
						"termAccessionNumber": "",
						"termSourceRef": "MTBLS",
					},
					"technologyPlatform": "",
				},
			]}}],
			"ontologySourceReferences": {"references": [{
				"sourceName": "MTBLS",
				"sourceFile": "https://www.ebi.ac.uk/metabolights/",
				"sourceVersion": "1",
				"sourceDescription": "MTBLS",
			}]},
		},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

#########################################################################################################
# rule_i_100_340_008_03
#########################################################################################################

# METADATA
# title: Study assay technology type source ref is in control list.
# description: Study assay technology type source ref is in control list.
test_rule_i_100_340_008_03_no_violation_01 if {
	result := rules.rule_i_100_340_008_03 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "EFO",
				},
				"technologyPlatform": "",
			},
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "MTBLS",
				},
				"technologyPlatform": "",
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
		with data.metabolights.validation.v2.phase1.definitions.CL_STUDY_ASSAY_TECHNOLOGY_TYPE_REF_SOURCES as [
			"EFO",
			"MTBLS",
		]
	count(result) == 0
}

# METADATA
# title:  study assay's term source ref is not in control list.
# description: study assay's term source ref is not in control list.
test_rule_i_100_340_008_03_violation_01 if {
	result := rules.rule_i_100_340_008_03 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "UO",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "EFO",
				},
				"technologyPlatform": "",
			},
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "UO",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "MTBLS",
				},
				"technologyPlatform": "",
			},
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "UO",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "UO",
				},
				"technologyPlatform": "",
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
		with data.metabolights.validation.v2.phase1.definitions.CL_STUDY_ASSAY_TECHNOLOGY_TYPE_REF_SOURCES as ["EFO"]
	count(result) == 2
}

#########################################################################################################
# rule_i_100_340_009_01
#########################################################################################################

# METADATA
# title: Assay technology platform is valid.
# description: Assay technology platform is valid.
test_rule_i_100_340_009_01_no_violation_01 if {
	result := rules.rule_i_100_340_009_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [{
			"fileName": "",
			"measurementType": {
				"term": "",
				"termAccessionNumber": "",
				"termSourceRef": "",
			},
			"technologyType": {
				"term": "",
				"termAccessionNumber": "",
				"termSourceRef": "",
			},
			"technologyPlatform": "Not empty",
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Assay technology platforms are valid.
# description: Assay technology platforms are valid.
test_rule_i_100_340_009_01_no_violation_02 if {
	result := rules.rule_i_100_340_009_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "Not Empty",
			},
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "X",
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Assay platform is invalid
# description: Assay platform is invalid
test_rule_i_100_340_009_01_violation_01 if {
	result := rules.rule_i_100_340_009_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyAssays": {"assays": [
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "",
			},
			{
				"fileName": "",
				"measurementType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyType": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
				"technologyPlatform": "X",
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

# #########################################################################################################
# # rule_i_100_340_000_01
# #########################################################################################################
# # METADATA
# # title: There is no study assay section error.
# # description: There is no study assay error.
# test_rule_i_100_340_000_01_success_01 if {
# 	result := rules.rule_i_100_340_000_01 with rule_i_100_340_001_01 as []
# 		with rule_i_100_340_002_01 as []
# 		with rule_i_100_340_002_02 as []
# 		with rule_i_100_340_003_01 as []
# 		with rule_i_100_340_004_01 as []
# 		with rule_i_100_340_005_01 as []
# 		with rule_i_100_340_005_02 as []
# 		with rule_i_100_340_006_01 as []
# 		with rule_i_100_340_007_01 as []
# 		with rule_i_100_340_008_01 as []
# 		with rule_i_100_340_008_02 as []
# 		with rule_i_100_340_009_01 as []
# 		with input as {
# 			"parserMessages": {"i_Investigation.txt": []},
# 			"investigationFilePath": "i_Investigation.txt",
# 		}
# 	count(result) == 1
# }
# # METADATA
# # title: There is a study assay error.
# # description: There is a study assay error.
# test_rule_i_100_340_000_01_no_success_01 if {
# 	result := rules.rule_i_100_340_000_01 with rule_i_100_340_001_01 as [f.parser_message("rule_i_100_340_001_01", "i_Investigation.txt", "ERROR")]
# 		with rule_i_100_340_002_01 as []
# 		with rule_i_100_340_002_02 as []
# 		with rule_i_100_340_003_01 as []
# 		with rule_i_100_340_004_01 as []
# 		with rule_i_100_340_005_01 as []
# 		with rule_i_100_340_005_02 as []
# 		with rule_i_100_340_006_01 as []
# 		with rule_i_100_340_007_01 as []
# 		with rule_i_100_340_008_01 as []
# 		with rule_i_100_340_008_02 as []
# 		with rule_i_100_340_009_01 as []
# 		with input as {
# 			"parserMessages": {"i_Investigation.txt": []},
# 			"investigationFilePath": "i_Investigation.txt",
# 		}
# 	count(result) == 0
# }
# # METADATA
# # title: There is a study assay error.
# # description: There is a study assay error.
# test_rule_i_100_340_000_01_no_success_02 if {
# 	result := rules.rule_i_100_340_000_01 with rule_i_100_340_001_01 as []
# 		with rule_i_100_340_002_01 as [f.parser_message("rule_i_100_340_002_01", "i_Investigation.txt", "ERROR")]
# 		with rule_i_100_340_002_02 as []
# 		with rule_i_100_340_003_01 as []
# 		with rule_i_100_340_004_01 as []
# 		with rule_i_100_340_005_01 as []
# 		with rule_i_100_340_005_02 as []
# 		with rule_i_100_340_006_01 as []
# 		with rule_i_100_340_007_01 as []
# 		with rule_i_100_340_008_01 as []
# 		with rule_i_100_340_008_02 as []
# 		with rule_i_100_340_009_01 as []
# 		with input as {
# 			"parserMessages": {"i_Investigation.txt": []},
# 			"investigationFilePath": "i_Investigation.txt",
# 		}
# 	count(result) == 0
# }
# # METADATA
# # title: There is a study assay error.
# # description: There is a study assay error.
# test_rule_i_100_340_000_01_no_success_03 if {
# 	result := rules.rule_i_100_340_000_01 with rule_i_100_340_001_01 as []
# 		with rule_i_100_340_002_01 as []
# 		with rule_i_100_340_002_02 as [f.parser_message("rule_i_100_340_002_02", "i_Investigation.txt", "ERROR")]
# 		with rule_i_100_340_003_01 as []
# 		with rule_i_100_340_004_01 as []
# 		with rule_i_100_340_005_01 as []
# 		with rule_i_100_340_005_02 as []
# 		with rule_i_100_340_006_01 as []
# 		with rule_i_100_340_007_01 as []
# 		with rule_i_100_340_008_01 as []
# 		with rule_i_100_340_008_02 as []
# 		with rule_i_100_340_009_01 as []
# 		with input as {
# 			"parserMessages": {"i_Investigation.txt": []},
# 			"investigationFilePath": "i_Investigation.txt",
# 		}
# 	count(result) == 0
# }
# # METADATA
# # title: There is a study assay error.
# # description: There is a study assay error.
# test_rule_i_100_340_000_01_no_success_04 if {
# 	result := rules.rule_i_100_340_000_01 with rule_i_100_340_001_01 as []
# 		with rule_i_100_340_002_01 as []
# 		with rule_i_100_340_002_02 as []
# 		with rule_i_100_340_003_01 as [f.parser_message("rule_i_100_340_003_01", "i_Investigation.txt", "ERROR")]
# 		with rule_i_100_340_004_01 as []
# 		with rule_i_100_340_005_01 as []
# 		with rule_i_100_340_005_02 as []
# 		with rule_i_100_340_006_01 as []
# 		with rule_i_100_340_007_01 as []
# 		with rule_i_100_340_008_01 as []
# 		with rule_i_100_340_008_02 as []
# 		with rule_i_100_340_009_01 as []
# 		with input as {
# 			"parserMessages": {"i_Investigation.txt": []},
# 			"investigationFilePath": "i_Investigation.txt",
# 		}
# 	count(result) == 0
# }
# # METADATA
# # title: There is a study assay error.
# # description: There is a study assay error.
# test_rule_i_100_340_000_01_no_success_05 if {
# 	result := rules.rule_i_100_340_000_01 with rule_i_100_340_001_01 as []
# 		with rule_i_100_340_002_01 as []
# 		with rule_i_100_340_002_02 as []
# 		with rule_i_100_340_003_01 as []
# 		with rule_i_100_340_004_01 as [f.parser_message("rule_i_100_340_004_01", "i_Investigation.txt", "ERROR")]
# 		with rule_i_100_340_005_01 as []
# 		with rule_i_100_340_005_02 as []
# 		with rule_i_100_340_006_01 as []
# 		with rule_i_100_340_007_01 as []
# 		with rule_i_100_340_008_01 as []
# 		with rule_i_100_340_008_02 as []
# 		with rule_i_100_340_009_01 as []
# 		with input as {
# 			"parserMessages": {"i_Investigation.txt": []},
# 			"investigationFilePath": "i_Investigation.txt",
# 		}
# 	count(result) == 0
# }
# # METADATA
# # title: There is a study assay error.
# # description: There is a study assay error.
# test_rule_i_100_340_000_01_no_success_06 if {
# 	result := rules.rule_i_100_340_000_01 with rule_i_100_340_001_01 as []
# 		with rule_i_100_340_002_01 as []
# 		with rule_i_100_340_002_02 as []
# 		with rule_i_100_340_003_01 as []
# 		with rule_i_100_340_004_01 as []
# 		with rule_i_100_340_005_01 as [f.parser_message("rule_i_100_340_005_01", "i_Investigation.txt", "ERROR")]
# 		with rule_i_100_340_005_02 as []
# 		with rule_i_100_340_006_01 as []
# 		with rule_i_100_340_007_01 as []
# 		with rule_i_100_340_008_01 as []
# 		with rule_i_100_340_008_02 as []
# 		with rule_i_100_340_009_01 as []
# 		with input as {
# 			"parserMessages": {"i_Investigation.txt": []},
# 			"investigationFilePath": "i_Investigation.txt",
# 		}
# 	count(result) == 0
# }
# # METADATA
# # title: There is a study assay error.
# # description: There is a study assay error.
# test_rule_i_100_340_000_01_no_success_07 if {
# 	result := rules.rule_i_100_340_000_01 with rule_i_100_340_001_01 as []
# 		with rule_i_100_340_002_01 as []
# 		with rule_i_100_340_002_02 as []
# 		with rule_i_100_340_003_01 as []
# 		with rule_i_100_340_004_01 as []
# 		with rule_i_100_340_005_01 as []
# 		with rule_i_100_340_006_01 as [f.parser_message("rule_i_100_340_006_01", "i_Investigation.txt", "ERROR")]
# 		with rule_i_100_340_008_01 as []
# 		with rule_i_100_340_007_01 as []
# 		with rule_i_100_340_008_01 as []
# 		with rule_i_100_340_008_02 as []
# 		with rule_i_100_340_009_01 as []
# 		with input as {
# 			"parserMessages": {"i_Investigation.txt": []},
# 			"investigationFilePath": "i_Investigation.txt",
# 		}
# 	count(result) == 0
# }
# # METADATA
# # title: There is a study assay error.
# # description: There is a study assay error.
# test_rule_i_100_340_000_01_no_success_08 if {
# 	result := rules.rule_i_100_340_000_01 with rule_i_100_340_001_01 as []
# 		with rule_i_100_340_002_01 as []
# 		with rule_i_100_340_002_02 as []
# 		with rule_i_100_340_003_01 as []
# 		with rule_i_100_340_004_01 as []
# 		with rule_i_100_340_005_01 as []
# 		with rule_i_100_340_005_02 as []
# 		with rule_i_100_340_006_01 as [f.parser_message("rule_i_100_340_006_01", "i_Investigation.txt", "ERROR")]
# 		with rule_i_100_340_007_01 as []
# 		with rule_i_100_340_008_01 as []
# 		with rule_i_100_340_008_02 as []
# 		with rule_i_100_340_009_01 as []
# 		with input as {
# 			"parserMessages": {"i_Investigation.txt": []},
# 			"investigationFilePath": "i_Investigation.txt",
# 		}
# 	count(result) == 0
# }
# # METADATA
# # title: There is a study assay error.
# # description: There is a study assay error.
# test_rule_i_100_340_000_01_no_success_09 if {
# 	result := rules.rule_i_100_340_000_01 with rule_i_100_340_001_01 as []
# 		with rule_i_100_340_002_01 as []
# 		with rule_i_100_340_002_02 as []
# 		with rule_i_100_340_003_01 as []
# 		with rule_i_100_340_004_01 as []
# 		with rule_i_100_340_005_01 as []
# 		with rule_i_100_340_005_02 as []
# 		with rule_i_100_340_006_01 as []
# 		with rule_i_100_340_007_01 as [f.parser_message("rule_i_100_340_007_01", "i_Investigation.txt", "ERROR")]
# 		with rule_i_100_340_008_01 as []
# 		with rule_i_100_340_008_02 as []
# 		with rule_i_100_340_009_01 as []
# 		with input as {
# 			"parserMessages": {"i_Investigation.txt": []},
# 			"investigationFilePath": "i_Investigation.txt",
# 		}
# 	count(result) == 0
# }
# # METADATA
# # title: There is a study assay error.
# # description: There is a study assay error.
# test_rule_i_100_340_000_01_no_success_10 if {
# 	result := rules.rule_i_100_340_000_01 with rule_i_100_340_001_01 as []
# 		with rule_i_100_340_002_01 as []
# 		with rule_i_100_340_002_02 as []
# 		with rule_i_100_340_003_01 as []
# 		with rule_i_100_340_004_01 as []
# 		with rule_i_100_340_005_01 as []
# 		with rule_i_100_340_005_02 as []
# 		with rule_i_100_340_006_01 as []
# 		with rule_i_100_340_007_01 as []
# 		with rule_i_100_340_008_01 as [f.parser_message("rule_i_100_340_008_01", "i_Investigation.txt", "ERROR")]
# 		with rule_i_100_340_008_02 as []
# 		with rule_i_100_340_009_01 as []
# 		with input as {
# 			"parserMessages": {"i_Investigation.txt": []},
# 			"investigationFilePath": "i_Investigation.txt",
# 		}
# 	count(result) == 0
# }
# # METADATA
# # title: There is a study assay error.
# # description: There is a study assay error.
# test_rule_i_100_340_000_01_no_success_11 if {
# 	result := rules.rule_i_100_340_000_01 with rule_i_100_340_001_01 as []
# 		with rule_i_100_340_002_01 as []
# 		with rule_i_100_340_002_02 as []
# 		with rule_i_100_340_003_01 as []
# 		with rule_i_100_340_004_01 as []
# 		with rule_i_100_340_005_01 as []
# 		with rule_i_100_340_005_02 as []
# 		with rule_i_100_340_006_01 as []
# 		with rule_i_100_340_007_01 as []
# 		with rule_i_100_340_008_01 as []
# 		with rule_i_100_340_008_02 as [f.parser_message("rule_i_100_340_008_02", "i_Investigation.txt", "ERROR")]
# 		with rule_i_100_340_009_01 as []
# 		with input as {
# 			"parserMessages": {"i_Investigation.txt": []},
# 			"investigationFilePath": "i_Investigation.txt",
# 		}
# 	count(result) == 0
# }
# # METADATA
# # title: There is a study assay error.
# # description: There is a study assay error.
# test_rule_i_100_340_000_01_no_success_12 if {
# 	result := rules.rule_i_100_340_000_01 with rule_i_100_340_001_01 as []
# 		with rule_i_100_340_002_01 as []
# 		with rule_i_100_340_002_02 as []
# 		with rule_i_100_340_003_01 as []
# 		with rule_i_100_340_004_01 as []
# 		with rule_i_100_340_005_01 as []
# 		with rule_i_100_340_005_02 as []
# 		with rule_i_100_340_006_01 as []
# 		with rule_i_100_340_007_01 as []
# 		with rule_i_100_340_008_01 as []
# 		with rule_i_100_340_008_02 as []
# 		with rule_i_100_340_009_01 as [f.parser_message("rule_i_100_340_009_01", "i_Investigation.txt", "ERROR")]
# 		with input as {
# 			"parserMessages": {"i_Investigation.txt": []},
# 			"investigationFilePath": "i_Investigation.txt",
# 		}
# 	count(result) == 0
# }
