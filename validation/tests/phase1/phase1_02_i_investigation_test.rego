package metabolights.validation.v2.rules.phase1.tests

import rego.v1
import data.metabolights.validation.v2.rules.phase1.violations as rules


# #########################################################################################################
# # rule_i_100_200_001_01
# #########################################################################################################

# # METADATA
# # title: Investigation title is defined.
# # description: Investigation title length is greater than 25.
# test_rule_i_100_200_001_01_no_violation_01 if {
# 	result := rules.rule_i_100_200_001_01 with input as {
# 		"investigation": {"title": "Investigation title is greater than 25"},
# 		"investigationFilePath": "i_Investigation.txt",
# 	}
# 	count(result) == 0
# }

# # METADATA
# # title: Investigation title is defined.
# # description: Investigation title length is 25.
# test_rule_i_100_200_001_01_no_violation_02 if {
# 	result := rules.rule_i_100_200_001_01 with input as {
# 		"investigation": {"title": "Investigation short title"},
# 		"investigationFilePath": "i_Investigation.txt",
# 	}
# 	count(result) == 0
# }

# # METADATA
# # title: Investigation title is empty.
# # description: Investigation title is empty.
# test_rule_i_100_200_001_01_violation_01 if {
# 	result := rules.rule_i_100_200_001_01 with input as {
# 		"investigation": {"title": ""},
# 		"investigationFilePath": "i_Investigation.txt",
# 	}
# 	count(result) == 1
# }

# # METADATA
# # title: Investigation title is not valid.
# # description: Investigation title length is less than 25.
# test_rule_i_100_200_001_01_violation_02 if {
# 	result := rules.rule_i_100_200_001_01 with input as {
# 		"investigation": {"title": "Short"},
# 		"investigationFilePath": "i_Investigation.txt",
# 	}
# 	count(result) == 1
# }

# #########################################################################################################
# # rule_i_100_200_002_01
# #########################################################################################################

# # METADATA
# # title: Investigation identifier is valid.
# # description: Investigation identifier is valid.
# test_rule_i_100_200_002_01_no_violation_01 if {
# 	result := rules.rule_i_100_200_002_01 with input as {
# 		"investigation": {"studies": [{"identifier": "MTBLS1"}]},
# 		"investigationFilePath": "i_Investigation.txt",
# 	}
# 	count(result) == 0
# }

# # METADATA
# # title: Investigation identifier is valid.
# # description: Investigation identifier is valid.
# test_rule_i_100_200_002_01_no_violation_02 if {
# 	result := rules.rule_i_100_200_002_01 with input as {
# 		"investigation": {"identifier": "MTBLS111112"},
# 		"investigationFilePath": "i_Investigation.txt",
# 	}
# 	count(result) == 0
# }

# # METADATA
# # title: Investigation identifier is valid.
# # description: Investigation identifier is valid.
# test_rule_i_100_200_002_01_no_violation_03 if {
# 	result := rules.rule_i_100_200_002_01 with input as {
# 		"investigation": {"identifier": "REQ20250101111112"},
# 		"investigationFilePath": "i_Investigation.txt",
# 	}
# 	count(result) == 0
# }


# # METADATA
# # title: Investigation identifier is not valid.
# # description: Investigation identifier is lowercase.
# test_rule_i_100_200_002_01_violation_01 if {
# 	result := rules.rule_i_100_200_002_01 with input as {
# 		"investigation": {"identifier": "mtbls1"},
# 		"investigationFilePath": "i_Investigation.txt",
# 	}
# 	count(result) == 1
# }

# # METADATA
# # title: Investigation identifier is not valid.
# # description: Investigation identifier is not valid format.
# test_rule_i_100_200_002_01_violation_02 if {
# 	result := rules.rule_i_100_200_002_01 with input as {
# 		"investigation": {"identifier": "MTBLSI1"},
# 		"investigationFilePath": "i_Investigation.txt",
# 	}
# 	count(result) == 1
# }

# # METADATA
# # title: Investigation identifier is not valid.
# # description: Investigation identifier is not valid format.
# test_rule_i_100_200_002_01_violation_03 if {
# 	result := rules.rule_i_100_200_002_01 with input as {
# 		"investigation": {"identifier": "MTBLS1A"},
# 		"investigationFilePath": "i_Investigation.txt",
# 	}
# 	count(result) == 1
# }

# # METADATA
# # title: Investigation identifier is not valid.
# # description: Investigation identifier is not valid format.
# test_rule_i_100_200_002_01_violation_04 if {
# 	result := rules.rule_i_100_200_002_01 with input as {
# 		"investigation": {"identifier": "REQ1A"},
# 		"investigationFilePath": "i_Investigation.txt",
# 	}
# 	count(result) == 1
# }

# #########################################################################################################
# # rule_i_100_200_003_01
# #########################################################################################################

# # METADATA
# # title: Investigation submission date is valid.
# # description: Investigation submission date is valid format.
# test_rule_i_100_200_003_01_no_violation_01 if {
# 	result := rules.rule_i_100_200_003_01 with input as {
# 		"investigation": {"identifier": "MTBLS1", "submissionDate": "2024-01-02"},
# 		"investigationFilePath": "i_Investigation.txt",
# 	}
# 	count(result) == 0
# }

# # METADATA
# # title: Investigation submission date is valid.
# # description: Investigation submission date is valid.
# test_rule_i_100_200_003_01_no_violation_02 if {
# 	result := rules.rule_i_100_200_003_01 with input as {
# 		"investigation": {"identifier": "MTBLS1", "submissionDate": "2012-01-02"},
# 		"investigationFilePath": "i_Investigation.txt",
# 	}
# 	count(result) == 0
# }

# # METADATA
# # title: Investigation submission date is invalid.
# # description: Investigation submission date is empty.
# test_rule_i_100_200_003_01_violation_01 if {
# 	result := rules.rule_i_100_200_003_01 with input as {
# 		"investigation": {"identifier": "MTBLS1", "submissionDate": ""},
# 		"investigationFilePath": "i_Investigation.txt",
# 	}
# 	count(result) == 1
# }

# # METADATA
# # title: Investigation submission date is invalid.
# # description: Investigation submission date format is not ISO8601.
# test_rule_i_100_200_003_01_violation_02 if {
# 	result := rules.rule_i_100_200_003_01 with input as {
# 		"investigation": {"identifier": "MTBLS1", "submissionDate": "2024/01/02"},
# 		"investigationFilePath": "i_Investigation.txt",
# 	}
# 	count(result) == 1
# }

# # METADATA
# # title: Investigation submission date is invalid.
# # description: Investigation submission date format is not ISO8601.
# test_rule_i_100_200_003_01_violation_03 if {
# 	result := rules.rule_i_100_200_003_01 with input as {
# 		"investigation": {"identifier": "MTBLS1", "submissionDate": "12/01/2024"},
# 		"investigationFilePath": "i_Investigation.txt",
# 	}
# 	count(result) == 1
# }

# #########################################################################################################
# # rule_i_100_200_004_01
# #########################################################################################################

# # METADATA
# # title: Investigation public release date is valid.
# # description: Investigation public release date is valid format.
# test_rule_i_100_200_004_01_no_violation_01 if {
# 	result := rules.rule_i_100_200_004_01 with input as {
# 		"investigation": {"identifier": "MTBLS1", "publicReleaseDate": "2024-01-02"},
# 		"investigationFilePath": "i_Investigation.txt",
# 	}
# 	count(result) == 0
# }

# # METADATA
# # title: Investigation public release date is valid.
# # description: Investigation public release date is valid.
# test_rule_i_100_200_004_01_no_violation_02 if {
# 	result := rules.rule_i_100_200_004_01 with input as {
# 		"investigation": {"identifier": "MTBLS1", "publicReleaseDate": "2012-01-02"},
# 		"investigationFilePath": "i_Investigation.txt",
# 	}
# 	count(result) == 0
# }

# # METADATA
# # title: Investigation public release date is invalid.
# # description: Investigation public release date is empty.
# test_rule_i_100_200_004_01_violation_01 if {
# 	result := rules.rule_i_100_200_004_01 with input as {
# 		"investigation": {"identifier": "MTBLS1", "publicReleaseDate": ""},
# 		"investigationFilePath": "i_Investigation.txt",
# 	}
# 	count(result) == 1
# }

# # METADATA
# # title: Investigation public release date is invalid.
# # description: Investigation public release date format is not ISO8601.
# test_rule_i_100_200_004_01_violation_02 if {
# 	result := rules.rule_i_100_200_004_01 with input as {
# 		"investigation": {"identifier": "MTBLS1", "publicReleaseDate": "2024/01/02"},
# 		"investigationFilePath": "i_Investigation.txt",
# 	}
# 	count(result) == 1
# }

# # METADATA
# # title: Investigation public release date is invalid.
# # description: Investigation public release date format is not ISO8601.
# test_rule_i_100_200_004_01_violation_03 if {
# 	result := rules.rule_i_100_200_004_01 with input as {
# 		"investigation": {"identifier": "MTBLS1", "publicReleaseDate": "12/01/2024"},
# 		"investigationFilePath": "i_Investigation.txt",
# 	}
# 	count(result) == 1
# }
