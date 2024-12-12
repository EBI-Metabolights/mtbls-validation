package metabolights.validation.v2.phase1.tests

import rego.v1
import data.metabolights.validation.v2.phase1.violations as rules


#########################################################################################################
# rule_i_100_100_001_01
#########################################################################################################

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

#########################################################################################################
# rule_i_100_100_001_02
#########################################################################################################

# METADATA
# title: Ontology Term Source File is valid
# description: Ontology Term Source File length is greater than 2.
test_rule_i_100_100_002_01_no_violation_01 if {
	result := rules.rule_i_100_100_002_01 with input as {
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
# title: Ontology Term Source File is valid
# description: Ontology Term Source File length is 2.
test_rule_i_100_100_002_01_no_violation_02 if {
	result := rules.rule_i_100_100_002_01 with input as {
		"investigation": {"ontologySourceReferences": {"references": [
			{
				"sourceName": "MTBLS",
				"sourceFile": "https://www.ebi.ac.uk/metabolights/",
				"sourceVersion": "1",
				"sourceDescription": "Metabolights Ontology",
			},
			{
				"sourceName": "DATA",
				"sourceFile": "ht",
				"sourceVersion": "1",
				"sourceDescription": "Metabolights Ontology",
			},
		]}},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Ontology Term Source File is valid
# description: Ontology Term Source File length is 2
test_rule_i_100_100_002_01_no_violation_03 if {
	result := rules.rule_i_100_100_002_01 with input as {
		"investigation": {"ontologySourceReferences": {"references": [{
			"sourceName": "MTBLS",
			"sourceFile": "MT",
			"sourceVersion": "1",
			"sourceDescription": "Metabolights Ontology",
		}]}},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Ontology Term Source File is not valid
# description: Ontology Term Source File length is 1
test_rule_i_100_100_002_01_violation_01 if {
	result := rules.rule_i_100_100_002_01 with input as {
		"investigation": {"ontologySourceReferences": {"references": [{
			"sourceName": "MTBLS",
			"sourceFile": "V",
			"sourceVersion": "1",
			"sourceDescription": "Metabolights Ontology",
		}]}},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

# METADATA
# title: Ontology Term Source File is not valid
# description: One Ontology Term Source File is invalid.
test_rule_i_100_100_002_01_violation_02 if {
	result := rules.rule_i_100_100_002_01 with input as {
		"investigation": {"ontologySourceReferences": {"references": [
			{
				"sourceName": "MTBLS",
				"sourceFile": "U",
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

# METADATA
# title: Ontology Term Source File is not valid
# description: Two Ontology Term Source File values are invalid.
test_rule_i_100_100_002_01_violation_03 if {
	result := rules.rule_i_100_100_002_01 with input as {
		"investigation": {"ontologySourceReferences": {"references": [
			{
				"sourceName": "MTBLS",
				"sourceFile": "",
				"sourceVersion": "1",
				"sourceDescription": "Metabolights Ontology",
			},
			{
				"sourceName": "MTBLS",
				"sourceFile": "H",
				"sourceVersion": "1",
				"sourceDescription": "Metabolights Ontology",
			},
		]}},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 2
}

# METADATA
# title: Ontology Term Source File is not valid
# description: One Ontology Term Source File is empty.
test_rule_i_100_100_002_01_violation_04 if {
	result := rules.rule_i_100_100_002_01 with input as {
		"investigation": {"ontologySourceReferences": {"references": [
			{
				"sourceName": "MTBLS",
				"sourceFile": "",
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

# #########################################################################################################
# # rule_i_100_100_000_01
# #########################################################################################################
# # METADATA
# # title: There is no ontology source reference error.
# # description: Input has valid ontology source reference definitions.
# test_rule_i_100_100_000_01_success_01 if {
# 	result := rules.rule_i_100_100_000_01 with rule_i_100_100_001_01 as []
# 		with rule_i_100_100_002_01 as []
# 		with input as {
# 			"parserMessages": {"i_Investigation.txt": []},
# 			"investigationFilePath": "i_Investigation.txt",
# 		}
# 	count(result) == 1
# }
# # METADATA
# # title: There is an ontology source reference error.
# # description: Input has not valid ontology source reference definitions.
# test_rule_i_100_100_000_01_no_success_01 if {
# 	result := rules.rule_i_100_100_000_01 with rule_i_100_100_001_01 as [f.parser_message("rule_i_100_100_001_01", "i_Investigation.txt", "ERROR")]
# 		with rule_i_100_100_002_01 as []
# 		with input as {
# 			"parserMessages": {"i_Investigation.txt": []},
# 			"investigationFilePath": "i_Investigation.txt",
# 		}
# 	count(result) == 0
# }
# # METADATA
# # title: There is an ontology source reference error.
# # description: Input has not valid ontology source reference definitions.
# test_rule_i_100_100_000_01_no_success_02 if {
# 	result := rules.rule_i_100_100_000_01 with rule_i_100_100_001_01 as []
# 		with rule_i_100_100_002_01 as [f.parser_message("rule_i_100_100_002_01", "i_Investigation.txt", "ERROR")]
# 		with input as {
# 			"parserMessages": {"i_Investigation.txt": []},
# 			"investigationFilePath": "i_Investigation.txt",
# 		}
# 	count(result) == 0
# }
# # METADATA
# # title: There are two an ontology source reference errors.
# # description: Input has not valid ontology source reference definitions.
# test_rule_i_100_100_000_01_no_success_03 if {
# 	result := rules.rule_i_100_100_000_01 with rule_i_100_100_001_01 as [f.parser_message("rule_i_100_100_002_01", "i_Investigation.txt", "ERROR")]
# 		with rule_i_100_100_002_01 as [f.parser_message("rule_i_100_100_002_01", "i_Investigation.txt", "ERROR")]
# 		with input as {
# 			"parserMessages": {"i_Investigation.txt": []},
# 			"investigationFilePath": "i_Investigation.txt",
# 		}
# 	count(result) == 0
# }
