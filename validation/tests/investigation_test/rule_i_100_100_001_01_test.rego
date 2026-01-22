#########################################################################################################
# Unit tests for rule_i_100_100_001_01
#########################################################################################################
package tests.investigation_test

import data.metabolights.validation.v2.rules.phase1.violations as rules

import rego.v1

# METADATA
# title: Term Source Name length less than 2 characters in investigation file.
# description: Term Source Name should be defined with length equal or greater than 2 characters in the ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt.
# custom:
#  rule_id: rule_i_100_100_001_01
#  type: WARNING
#  priority: HIGH
#  section: investigation.ontologySourceReferences
rule_i_100_100_001_01_test_cases := 1

# METADATA
# title: Ontology Term Source Name is valid
# description: Ontology Term Source Name length is 5.
test_rule_i_100_100_001_01_no_violation_01 if {
	result := rules.rule_i_100_100_001_01 with input as {
		"investigation": {"ontologySourceReferences": {"references": [{
			"sourceName": "MTBLS",
			"sourceFile": "https://www.ebi.ac.uk/metabolights/",
			"sourceVersion": "1",
			"sourceDescription": "Metabolights Ontology",
		}]}},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Ontology Term Source Name is valid
# description: Ontology Term Source Name length is 5.
test_rule_i_100_100_001_01_no_violation_02 if {
	result := rules.rule_i_100_100_001_01 with input as {
		"investigation": {"ontologySourceReferences": {"references": [
			{
				"sourceName": "MTBLS",
				"sourceFile": "https://www.ebi.ac.uk/metabolights/",
				"sourceVersion": "1",
				"sourceDescription": "Metabolights Ontology",
			},
			{
				"sourceName": "DATA",
				"sourceFile": "https://www.ebi.ac.uk/metabolights/",
				"sourceVersion": "1",
				"sourceDescription": "Metabolights Ontology",
			},
		]}},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Ontology Term Source Name is valid
# description: Ontology Term Source Name length is 2
test_rule_i_100_100_001_01_no_violation_03 if {
	result := rules.rule_i_100_100_001_01 with input as {
		"investigation": {"ontologySourceReferences": {"references": [{
			"sourceName": "AU",
			"sourceFile": "https://www.ebi.ac.uk/metabolights/",
			"sourceVersion": "1",
			"sourceDescription": "Metabolights Ontology",
		}]}},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Ontology Term Source Name is not valid
# description: Ontology Term Source Name length is 1
test_rule_i_100_100_001_01_violation_01 if {
	result := rules.rule_i_100_100_001_01 with input as {
		"investigation": {"ontologySourceReferences": {"references": [{
			"sourceName": "A",
			"sourceFile": "https://www.ebi.ac.uk/metabolights/",
			"sourceVersion": "1",
			"sourceDescription": "Metabolights Ontology",
		}]}},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

# METADATA
# title: Ontology Term Source Name is not valid
# description: One Ontology Term Source Name is invalid.
test_rule_i_100_100_001_01_violation_02 if {
	result := rules.rule_i_100_100_001_01 with input as {
		"investigation": {"ontologySourceReferences": {"references": [
			{
				"sourceName": "A",
				"sourceFile": "https://www.ebi.ac.uk/metabolights/",
				"sourceVersion": "1",
				"sourceDescription": "Metabolights Ontology",
			},
			{
				"sourceName": "AU",
				"sourceFile": "https://www.ebi.ac.uk/metabolights/",
				"sourceVersion": "1",
				"sourceDescription": "Metabolights Ontology",
			},
		]}},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

# METADATA
# title: Ontology Term Source Name values are not valid
# description: Two Ontology Term Source Name values are invalid.
test_rule_i_100_100_001_01_violation_03 if {
	result := rules.rule_i_100_100_001_01 with input as {
		"investigation": {"ontologySourceReferences": {"references": [
			{
				"sourceName": "A",
				"sourceFile": "https://www.ebi.ac.uk/metabolights/",
				"sourceVersion": "1",
				"sourceDescription": "Metabolights Ontology",
			},
			{
				"sourceName": "U",
				"sourceFile": "https://www.ebi.ac.uk/metabolights/",
				"sourceVersion": "1",
				"sourceDescription": "Metabolights Ontology",
			},
		]}},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 2
}

# METADATA
# title: Ontology Term Source Name is not valid
# description: One Ontology Term Source Name is empty.
test_rule_i_100_100_001_01_violation_04 if {
	result := rules.rule_i_100_100_001_01 with input as {
		"investigation": {"ontologySourceReferences": {"references": [
			{
				"sourceName": "",
				"sourceFile": "https://www.ebi.ac.uk/metabolights/",
				"sourceVersion": "1",
				"sourceDescription": "Metabolights Ontology",
			},
			{
				"sourceName": "MTBLS",
				"sourceFile": "https://www.ebi.ac.uk/metabolights/",
				"sourceVersion": "1",
				"sourceDescription": "Metabolights Ontology",
			},
		]}},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}
