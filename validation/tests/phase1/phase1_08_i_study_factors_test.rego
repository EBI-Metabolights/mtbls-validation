package metabolights.validation.v2.phase1.tests

import rego.v1
import data.metabolights.validation.v2.phase1.violations as rules

#########################################################################################################
# rule_i_100_330_001_01
#########################################################################################################

# METADATA
# title: There is a study factor
# description: There is one study factor in i_Investigation.txt.
test_rule_i_100_330_001_01_no_violation_01 if {
	result := rules.rule_i_100_330_001_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyFactors": {"factors": [{
			"name": "Disease",
			"type": {
				"term": "",
				"termAccessionNumber": "",
				"termSourceRef": "",
			},
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: There are two study factors
# description: There are two study factors in i_Investigation.txt.
test_rule_i_100_330_001_01_no_violation_02 if {
	result := rules.rule_i_100_330_001_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyFactors": {"factors": [
			{
				"name": "",
				"type": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
			},
			{
				"name": "",
				"type": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: There is no study factor.
# description: There is no study factor in i_Investigation.txt.
test_rule_i_100_330_001_01_violation_01 if {
	result := rules.rule_i_100_330_001_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyFactors": {"factors": []}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

#########################################################################################################
# rule_i_100_330_002_01
#########################################################################################################

# METADATA
# title: study factor name is not empty
# description: study factor  name is not empty.
test_rule_i_100_330_002_01_no_violation_01 if {
	result := rules.rule_i_100_330_002_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyFactors": {"factors": [{
			"name": "disease",
			"type": {
				"term": "",
				"termAccessionNumber": "",
				"termSourceRef": "",
			},
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study factor names are not empty
# description: Study factor names are not empty
test_rule_i_100_330_002_01_no_violation_02 if {
	result := rules.rule_i_100_330_002_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyFactors": {"factors": [
			{
				"name": "X",
				"type": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
			},
			{
				"name": "Disease",
				"type": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: One study factor is empty
# description: One study factor is empty
test_rule_i_100_330_002_01_violation_01 if {
	result := rules.rule_i_100_330_002_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyFactors": {"factors": [
			{
				"name": "",
				"type": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
			},
			{
				"name": "Disease",
				"type": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

#########################################################################################################
# rule_i_100_330_003_01
#########################################################################################################

# METADATA
# title: Study factor type term has 2 or more characters
# description: Study factor type term has 2 or more characters
test_rule_i_100_330_003_01_no_violation_01 if {
	result := rules.rule_i_100_330_003_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyFactors": {"factors": [
			{
				"name": "",
				"type": {
					"term": "Disease",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
			},
			{
				"name": "",
				"type": {
					"term": "AU",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study factor type term has kess than 2 characters.
# description: Study factor type term has kess than 2 characters.
test_rule_i_100_330_003_01_violation_01 if {
	result := rules.rule_i_100_330_003_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyFactors": {"factors": [
			{
				"name": "",
				"type": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
			},
			{
				"name": "",
				"type": {
					"term": "X",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
			},
			{
				"name": "",
				"type": {
					"term": "XY",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 2
}

#########################################################################################################
# rule_i_100_330_004_01
#########################################################################################################

# METADATA
# title: Study factor type term accession number is not empty.
# description: Study factor type term accession number is not empty.
test_rule_i_100_330_004_01_no_violation_01 if {
	result := rules.rule_i_100_330_004_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyFactors": {"factors": [
			{
				"name": "",
				"type": {
					"term": "",
					"termAccessionNumber": "X",
					"termSourceRef": "",
				},
			},
			{
				"name": "",
				"type": {
					"term": "",
					"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000408",
					"termSourceRef": "",
				},
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study factor type term accession number is not valid.
# description: Study factor type term accession number is not valid.
test_rule_i_100_330_004_01_violation_01 if {
	result := rules.rule_i_100_330_004_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyFactors": {"factors": [
			{
				"name": "",
				"type": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
			},
			{
				"name": "",
				"type": {
					"term": "",
					"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000408",
					"termSourceRef": "",
				},
			},
			{
				"name": "",
				"type": {
					"term": "",
					"termAccessionNumber": "X",
					"termSourceRef": "",
				},
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

#########################################################################################################
# rule_i_100_330_005_01
#########################################################################################################

# METADATA
# title: study factor type term source ref is equal to or greater than 2.
# description: study factor type term source ref is equal to or greater than 2.
test_rule_i_100_330_005_01_no_violation_01 if {
	result := rules.rule_i_100_330_005_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyFactors": {"factors": [
			{
				"name": "",
				"type": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "EFO",
				},
			},
			{
				"name": "",
				"type": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "AU",
				},
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title:  study factor type term source ref is less than 2.
# description: study factor type term source ref is less than 2.
test_rule_i_100_330_005_01_violation_01 if {
	result := rules.rule_i_100_330_005_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyFactors": {"factors": [
			{
				"name": "",
				"type": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "",
				},
			},
			{
				"name": "",
				"type": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "X",
				},
			},
			{
				"name": "",
				"type": {
					"term": "",
					"termAccessionNumber": "",
					"termSourceRef": "AU",
				},
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 2
}

#########################################################################################################
# rule_i_100_330_005_02
#########################################################################################################

# METADATA
# title: study factor type term source ref is in the Ontology Source Reference section.
# description: study factor type term source ref is in the Ontology Source Reference section.
test_rule_i_100_330_005_02_no_violation_01 if {
	result := rules.rule_i_100_330_005_02 with input as {
		"investigation": {
			"studies": [{"identifier": "MTBLS1", "studyFactors": {"factors": [
				{
					"name": "",
					"type": {
						"term": "",
						"termAccessionNumber": "",
						"termSourceRef": "MTBLS",
					},
				},
				{
					"name": "",
					"type": {
						"term": "",
						"termAccessionNumber": "",
						"termSourceRef": "EFO",
					},
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
# title:  One study factor type term source ref is not in the Ontology Source Reference section.
# description: One study factor type term source ref is not in the Ontology Source Reference section.
test_rule_i_100_330_005_02_violation_01 if {
	result := rules.rule_i_100_330_005_02 with input as {
		"investigation": {
			"studies": [{"identifier": "MTBLS1", "studyFactors": {"factors": [
				{
					"name": "",
					"type": {
						"term": "",
						"termAccessionNumber": "",
						"termSourceRef": "MTBLS",
					},
				},
				{
					"name": "",
					"type": {
						"term": "",
						"termAccessionNumber": "",
						"termSourceRef": "UO",
					},
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

