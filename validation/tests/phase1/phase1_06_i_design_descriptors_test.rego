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

