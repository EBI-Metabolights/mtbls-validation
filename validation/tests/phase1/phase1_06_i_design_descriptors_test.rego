package metabolights.validation.v2.phase1.tests

import rego.v1
import data.metabolights.validation.v2.phase1.violations as rules

#########################################################################################################
# rule_i_100_310_001_01
#########################################################################################################

# METADATA
# title: There is a study design description
# description: There is one study in i_Investigation.txt.
test_rule_i_100_310_001_01_no_violation_01 if {
	result := rules.rule_i_100_310_001_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyDesignDescriptors": {"designTypes": [{
			"term": "test",
			"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
			"termSourceRef": "EFO",
		},
		{
			"term": "test2",
			"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000021",
			"termSourceRef": "EFO",
		},
		{
			"term": "test3",
			"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_00000221",
			"termSourceRef": "EFO",
		}
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: There is a study design descriptor
# description: There is one study in i_Investigation.txt.
test_rule_i_100_310_001_01_no_violation_02 if {
	result := rules.rule_i_100_310_001_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyDesignDescriptors": {"designTypes": [
			{
				"term": "test",
				"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
				"termSourceRef": "EFO",
			},
			{
				"term": "test2",
				"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000002",
				"termSourceRef": "EFO",
			},
			{
				"term": "test3",
				"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000003",
				"termSourceRef": "EFO",
			},
			{
				"term": "test4",
				"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000004",
				"termSourceRef": "EFO",
			},
		]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: There is no study design descriptor.
# description: There is no study design descriptor in i_Investigation.txt.
test_rule_i_100_310_001_01_violation_01 if {
	result := rules.rule_i_100_310_001_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyDesignDescriptors": {"designTypes": []}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

#########################################################################################################
# rule_i_100_310_002_01
#########################################################################################################

# METADATA
# title: Study Design Type term is not empty
# description: Study Design Type term is not empty
test_rule_i_100_310_002_01_no_violation_01 if {
	result := rules.rule_i_100_310_002_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyDesignDescriptors": {"designTypes": [{
			"term": "test",
			"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
			"termSourceRef": "EFO",
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study Design Type term is  empty
# description: Study Design Type term is not empty
test_rule_i_100_310_002_01_violation_01 if {
	result := rules.rule_i_100_310_002_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyDesignDescriptors": {"designTypes": [{
			"term": "",
			"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
			"termSourceRef": "EFO",
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

#########################################################################################################
# rule_i_100_310_003_01
#########################################################################################################

# METADATA
# title: Study Design Type accession number is not empty
# description: Study Design Type accession number is not empty
test_rule_i_100_310_003_01_no_violation_01 if {
	result := rules.rule_i_100_310_003_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyDesignDescriptors": {"designTypes": [{
			"term": "test",
			"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
			"termSourceRef": "EFO",
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study Design Type accession number is  empty
# description: Study Design Type accession number is not empty
test_rule_i_100_310_003_01_violation_01 if {
	result := rules.rule_i_100_310_003_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyDesignDescriptors": {"designTypes": [{
			"term": "Data",
			"termAccessionNumber": "",
			"termSourceRef": "EFO",
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

#########################################################################################################
# rule_i_100_310_004_01
#########################################################################################################

# METADATA
# title: Study Design Type term source ref is not empty
# description: Study Design Type term source ref is not empty
test_rule_i_100_310_004_01_no_violation_01 if {
	result := rules.rule_i_100_310_004_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyDesignDescriptors": {"designTypes": [{
			"term": "test",
			"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
			"termSourceRef": "EFO",
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study Design Type term source ref is  empty
# description: Study Design Type term source ref is not empty
test_rule_i_100_310_004_01_violation_01 if {
	result := rules.rule_i_100_310_004_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "studyDesignDescriptors": {"designTypes": [{
			"term": "Data",
			"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
			"termSourceRef": "",
		}]}}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

#########################################################################################################
# rule_i_100_310_004_02
#########################################################################################################

# METADATA
# title: Study Design Type term source ref is in Ontology Source References section.
# description: Study Design Type term source ref is in Ontology Source References section.
test_rule_i_100_310_004_02_no_violation_01 if {
	result := rules.rule_i_100_310_004_02 with input as {
		"investigation": {
			"studies": [{"identifier": "MTBLS1", "studyDesignDescriptors": {"designTypes": [{
				"term": "test",
				"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
				"termSourceRef": "EFO",
			}]}}],
			"ontologySourceReferences": {"references": [{
				"sourceName": "EFO",
				"sourceFile": "https://www.ebi.ac.uk/metabolights/",
				"sourceVersion": "1",
				"sourceDescription": "EFO",
			}]},
		},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Three Study Design Type term source refs are  in Ontology Source References section.
# description: Three Study Design Type term source refs are in Ontology Source References section.
test_rule_i_100_310_004_02_no_violation_02 if {
	result := rules.rule_i_100_310_004_02 with input as {
		"investigation": {
			"studies": [{"identifier": "MTBLS1", "studyDesignDescriptors": {"designTypes": [
				{
					"term": "test",
					"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
					"termSourceRef": "MTBLS",
				},
				{
					"term": "test",
					"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
					"termSourceRef": "NCBI",
				},
				{
					"term": "test",
					"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
					"termSourceRef": "EFO",
				},
			]}}],
			"ontologySourceReferences": {"references": [
				{
					"sourceName": "EFO",
					"sourceFile": "https://www.ebi.ac.uk/metabolights/",
					"sourceVersion": "1",
					"sourceDescription": "EFO",
				},
				{
					"sourceName": "MTBLS",
					"sourceFile": "https://www.ebi.ac.uk/metabolights/",
					"sourceVersion": "1",
					"sourceDescription": "EFO",
				},
				{
					"sourceName": "NCBI",
					"sourceFile": "https://www.ebi.ac.uk/metabolights/",
					"sourceVersion": "1",
					"sourceDescription": "EFO",
				},
			]},
		},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study Design Type term source ref is not in Ontology Source References section.
# description: Study Design Type term source ref is not in Ontology Source References section.
test_rule_i_100_310_004_02_violation_01 if {
	result := rules.rule_i_100_310_004_02 with input as {
		"investigation": {
			"studies": [{"identifier": "MTBLS1", "studyDesignDescriptors": {"designTypes": [{
				"term": "test",
				"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
				"termSourceRef": "1",
			}]}}],
			"ontologySourceReferences": {"references": [{
				"sourceName": "EFO",
				"sourceFile": "https://www.ebi.ac.uk/metabolights/",
				"sourceVersion": "1",
				"sourceDescription": "EFO",
			}]},
		},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

# METADATA
# title: Two Study Design Type term source refs are not in Ontology Source References section.
# description: Two Study Design Type term source ref sare not in Ontology Source References section.
test_rule_i_100_310_004_02_violation_02 if {
	result := rules.rule_i_100_310_004_02 with input as {
		"investigation": {
			"studies": [{"identifier": "MTBLS1", "studyDesignDescriptors": {"designTypes": [
				{
					"term": "test",
					"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
					"termSourceRef": "1",
				},
				{
					"term": "test",
					"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
					"termSourceRef": "",
				},
				{
					"term": "test",
					"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
					"termSourceRef": "EFO",
				},
			]}}],
			"ontologySourceReferences": {"references": [{
				"sourceName": "EFO",
				"sourceFile": "https://www.ebi.ac.uk/metabolights/",
				"sourceVersion": "1",
				"sourceDescription": "EFO",
			}]},
		},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

#########################################################################################################
# rule_i_100_310_004_03
#########################################################################################################

# METADATA
# title: Study Design Type term source ref is in in prioritised control list.
# description: Study Design Type term source ref is in in prioritised control list.
test_rule_i_100_310_004_03_no_violation_01 if {
	result := rules.rule_i_100_310_004_03 with input as {
		"investigation": {
			"studies": [{"identifier": "MTBLS1", "studyDesignDescriptors": {"designTypes": [{
				"term": "test",
				"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
				"termSourceRef": "EFO",
			}]}}],
			"ontologySourceReferences": {"references": [{
				"sourceName": "EFO",
				"sourceFile": "https://www.ebi.ac.uk/metabolights/",
				"sourceVersion": "1",
				"sourceDescription": "MTBLS",
			}]},
		},
		"investigationFilePath": "i_Investigation.txt",
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.controlLists.investigationFile["Study Design Type"].ontologies as ["EFO"]

	count(result) == 0
}

# METADATA
# title: Three Study Design Type term source refs are  in in prioritised control list.
# description: Three Study Design Type term source refs are in in prioritised control list.
test_rule_i_100_310_004_03_no_violation_02 if {
	result := rules.rule_i_100_310_004_03 with input as {
		"investigation": {
			"studies": [{"identifier": "MTBLS1", "studyDesignDescriptors": {"designTypes": [
				{
					"term": "test",
					"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
					"termSourceRef": "MTBLS",
				},
				{
					"term": "test",
					"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
					"termSourceRef": "NCBI",
				},
				{
					"term": "test",
					"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
					"termSourceRef": "EFO",
				},
			]}}],
			"ontologySourceReferences": {"references": [
				{
					"sourceName": "EFO",
					"sourceFile": "https://www.ebi.ac.uk/metabolights/",
					"sourceVersion": "1",
					"sourceDescription": "EFO",
				},
				{
					"sourceName": "MTBLS",
					"sourceFile": "https://www.ebi.ac.uk/metabolights/",
					"sourceVersion": "1",
					"sourceDescription": "MTBLS",
				},
				{
					"sourceName": "NCBI",
					"sourceFile": "https://www.ebi.ac.uk/metabolights/",
					"sourceVersion": "1",
					"sourceDescription": "NCBI",
				},
			]},
		},
		"investigationFilePath": "i_Investigation.txt",
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.phase1.definitions.CL_STUDY_DESIGN_DESCRIPTOR_REF_SOURCES as ["EFO", "MTBLS", "NCBI"]

	count(result) == 0
}

# METADATA
# title: Study Design Type term source ref is not in in prioritised control list.
# description: Study Design Type term source ref is not in in prioritised control list.
test_rule_i_100_310_004_03_violation_01 if {
	result := rules.rule_i_100_310_004_03 with input as {
		"investigation": {
			"studies": [{"identifier": "MTBLS1", "studyDesignDescriptors": {"designTypes": [{
				"term": "test",
				"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
				"termSourceRef": "MTBLS",
			}]}}],
			"ontologySourceReferences": {"references": [
				{
					"sourceName": "MTBLS",
					"sourceFile": "https://www.ebi.ac.uk/metabolights/",
					"sourceVersion": "1",
					"sourceDescription": "MTBLS",
				},
				{
					"sourceName": "NCBI",
					"sourceFile": "https://www.ebi.ac.uk/metabolights/",
					"sourceVersion": "1",
					"sourceDescription": "NCBI",
				},
			]},
		},
		"investigationFilePath": "i_Investigation.txt",
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.phase1.definitions.CL_STUDY_DESIGN_DESCRIPTOR_REF_SOURCES as ["EFO", "NCBI"]

	count(result) == 1
}

# METADATA
# title: Two Study Design Type term source refs are not in in prioritised control list.
# description: Two Study Design Type term source ref sare not in in prioritised control list.
test_rule_i_100_310_004_03_violation_02 if {
	result := rules.rule_i_100_310_004_03 with input as {
		"investigation": {
			"studies": [{"identifier": "MTBLS1", "studyDesignDescriptors": {"designTypes": [
				{
					"term": "test",
					"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
					"termSourceRef": "NCBI",
				},
				{
					"term": "test",
					"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
					"termSourceRef": "MTBLS",
				},
				{
					"term": "test",
					"termAccessionNumber": "http://www.ebi.ac.uk/efo/EFO_0000001",
					"termSourceRef": "EFO",
				},
			]}}],
			"ontologySourceReferences": {"references": [
				{
					"sourceName": "NCBI",
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
		"studyDbMetadata": {"studyCategory": "other", "sampleTemplate": "minimum",  "templateVersion": "2.0"}
	}
		with data.metabolights.validation.v2.phase1.definitions.CL_STUDY_DESIGN_DESCRIPTOR_REF_SOURCES as ["EFO", "CHEBI"]
	count(result) == 2
}

# #########################################################################################################
# # rule_i_100_310_000_01
# #########################################################################################################
# # METADATA
# # title: There is no design descriptor section error.
# # description: There is no design descriptor error.
# test_rule_i_100_310_000_01_success_01 if {
# 	result := rules.rule_i_100_310_000_01 with rule_i_100_310_001_01 as []
# 		with rule_i_100_310_002_01 as []
# 		with rule_i_100_310_004_02 as []
# 		with input as {
# 			"parserMessages": {"i_Investigation.txt": []},
# 			"investigationFilePath": "i_Investigation.txt",
# 		}
# 	count(result) == 1
# }
# # METADATA
# # title: There is a design descriptor error.
# # description: There is a design descriptor error.
# test_rule_i_100_310_000_01_no_success_01 if {
# 	result := rules.rule_i_100_310_000_01 with rule_i_100_310_001_01 as [f.parser_message("rule_i_100_310_001_01", "i_Investigation.txt", "ERROR")]
# 		with rule_i_100_310_002_01 as []
# 		with rule_i_100_310_004_02 as []
# 		with input as {
# 			"parserMessages": {"i_Investigation.txt": []},
# 			"investigationFilePath": "i_Investigation.txt",
# 		}
# 	count(result) == 0
# }
# # METADATA
# # title: There is a design descriptor error.
# # description: There is a design descriptor error.
# test_rule_i_100_310_000_01_no_success_02 if {
# 	result := rules.rule_i_100_310_000_01 with rule_i_100_310_001_01 as []
# 		with rule_i_100_310_002_01 as [f.parser_message("rule_i_100_310_002_01", "i_Investigation.txt", "ERROR")]
# 		with rule_i_100_310_004_02 as []
# 		with input as {
# 			"parserMessages": {"i_Investigation.txt": []},
# 			"investigationFilePath": "i_Investigation.txt",
# 		}
# 	count(result) == 0
# }
# # METADATA
# # title: There is a design descriptor error.
# # description: There is a design descriptor error.
# test_rule_i_100_310_000_01_no_success_03 if {
# 	result := rules.rule_i_100_310_000_01 with rule_i_100_310_001_01 as []
# 		with rule_i_100_310_002_01 as []
# 		with rule_i_100_310_004_02 as [f.parser_message("rule_i_100_310_004_02", "i_Investigation.txt", "ERROR")]
# 		with input as {
# 			"parserMessages": {"i_Investigation.txt": []},
# 			"investigationFilePath": "i_Investigation.txt",
# 		}
# 	count(result) == 0
# }
