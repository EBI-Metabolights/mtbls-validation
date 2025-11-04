package metabolights.validation.v2.rules.phase1.tests

import rego.v1
import data.metabolights.validation.v2.rules.phase1.violations as rules


#########################################################################################################
# rule_i_100_300_001_01
#########################################################################################################

# METADATA
# title: There is a study in i_Investigation.txt.
# description: There is one study in i_Investigation.txt.
test_rule_i_100_300_001_01_no_violation_01 if {
	result := rules.rule_i_100_300_001_01 with input as {
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: There is no study in i_Investigation.txt.
# description: Define one study in i_Investigation.txt.
test_rule_i_100_300_001_01_violation_01 if {
	result := rules.rule_i_100_300_001_01 with input as {
		"investigation": {"studies": []},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

#########################################################################################################
# rule_i_100_300_001_02
#########################################################################################################

# METADATA
# title: There is a study in i_Investigation.txt.
# description: There is one study in i_Investigation.txt.
test_rule_i_100_300_001_02_no_violation_01 if {
	result := rules.rule_i_100_300_001_02 with input as {
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: There is more than one study in i_Investigation.txt.
# description: Define one study in i_Investigation.txt.
test_rule_i_100_300_001_02_violation_01 if {
	result := rules.rule_i_100_300_001_02 with input as {
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}, {"fileName": "s_MTBLS1.txt"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

#########################################################################################################
# rule_i_100_300_002_01
#########################################################################################################

# METADATA
# title: Investigation identifier is valid.
# description: Investigation identifier is valid.
test_rule_i_100_300_002_01_no_violation_01 if {
	result := rules.rule_i_100_300_002_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Investigation identifier is valid.
# description: Investigation identifier is valid.
test_rule_i_100_300_002_01_no_violation_02 if {
	result := rules.rule_i_100_300_002_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS111112"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}


# METADATA
# title: Investigation identifier is valid.
# description: Investigation identifier is valid.
test_rule_i_100_300_002_01_no_violation_03 if {
	result := rules.rule_i_100_300_002_01 with input as {
		"investigation": {"studies": [{"identifier": "REQ20250101111112"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}


# METADATA
# title: Investigation identifier is not valid.
# description: Investigation identifier is lowercase.
test_rule_i_100_300_002_01_violation_01 if {
	result := rules.rule_i_100_300_002_01 with input as {
		"investigation": {"studies": [{"identifier": "mtbls1"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

# METADATA
# title: Investigation identifier is not valid.
# description: Investigation identifier is not valid format.
test_rule_i_100_300_002_01_violation_02 if {
	result := rules.rule_i_100_300_002_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLSI1"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

# METADATA
# title: Investigation identifier is not valid.
# description: Investigation identifier is not valid format.
test_rule_i_100_300_002_01_violation_03 if {
	result := rules.rule_i_100_300_002_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1A"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

#########################################################################################################
# rule_i_100_300_003_01
#########################################################################################################

# METADATA
# title: Study title is defined.
# description: Study title length is greater than 25.
test_rule_i_100_300_003_01_no_violation_01 if {
	result := rules.rule_i_100_300_003_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "title": "Study title is greater than 25"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study title is defined.
# description: Study title length is 25.
test_rule_i_100_300_003_01_no_violation_02 if {
	result := rules.rule_i_100_300_003_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "title": "Study title length is 25."}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study title is empty.
# description: Study title is empty.
test_rule_i_100_300_003_01_violation_01 if {
	result := rules.rule_i_100_300_003_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "title": ""}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

# METADATA
# title: Study title is not valid.
# description: Study title length is less than 25.
test_rule_i_100_300_003_01_violation_02 if {
	result := rules.rule_i_100_300_003_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "title": "Short"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

#########################################################################################################
# rule_i_100_300_003_02
#########################################################################################################

# METADATA
# title: Study title has no unprintable characters.
# description: Study title has no unprintable characters.
test_rule_i_100_300_003_02_no_violation_01 if {
	result := rules.rule_i_100_300_003_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "title": "Short"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study title has unprintable characters.
# description: Study title contains tab and carriage return characters.
test_rule_i_100_300_003_02_violation_01 if {
	result := rules.rule_i_100_300_003_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "title": "\u3000\u007f\u0000 \tShort\n\t\n\u205f\u009f\u000e"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}


#########################################################################################################
# rule_i_100_300_003_03
#########################################################################################################

# METADATA
# title: Study title is valid.
# description: Study title is valid.
test_rule_i_100_300_003_03_no_violation_01 if {
	result := rules.rule_i_100_300_003_03 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "title": "Valid study title"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study title has template message.
# description: Study title contains template message.
test_rule_i_100_300_003_03_violation_01 if {
	result := rules.rule_i_100_300_003_03 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "title": "Please update"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}


#########################################################################################################
# rule_i_100_300_004_01
#########################################################################################################

# METADATA
# title: Study description is defined.
# description: Study description length is greater than 60.
test_rule_i_100_300_004_01_no_violation_01 if {
	result := rules.rule_i_100_300_004_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "description": "Study description is greater than 60. Study description is greater than 60. Study description is greater than 60."}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study description is defined.
# description: Study description length is 60.
test_rule_i_100_300_004_01_no_violation_02 if {
	result := rules.rule_i_100_300_004_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "description": "Study description is about 60,study description is about 60."}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study description is empty.
# description: Study description is empty.
test_rule_i_100_300_004_01_violation_01 if {
	result := rules.rule_i_100_300_004_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "description": ""}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

# METADATA
# title: Study description is not valid.
# description: Study description length is less than 60.
test_rule_i_100_300_004_01_violation_02 if {
	result := rules.rule_i_100_300_004_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "description": "Short"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}



#########################################################################################################
# rule_i_100_300_004_02
#########################################################################################################

# METADATA
# title: Study title is valid.
# description: Study title is valid.
test_rule_i_100_300_004_02_no_violation_01 if {
	result := rules.rule_i_100_300_004_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "description": "Valid study title with long content and valid description."}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study title has template message.
# description: Study title contains template message.
test_rule_i_100_300_004_02_violation_01 if {
	result := rules.rule_i_100_300_004_02 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "description": "Please update"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}


#########################################################################################################
# rule_i_100_300_005_01
#########################################################################################################

# METADATA
# title: Study submission date is valid.
# description: Study submission date is valid format.
test_rule_i_100_300_005_01_no_violation_01 if {
	result := rules.rule_i_100_300_005_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "submissionDate": "2024-01-02"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study submission date is valid.
# description: Study submission date is valid.
test_rule_i_100_300_005_01_no_violation_02 if {
	result := rules.rule_i_100_300_005_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "submissionDate": "2012-01-02"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study submission date is invalid.
# description: Study submission date is empty.
test_rule_i_100_300_005_01_violation_01 if {
	result := rules.rule_i_100_300_005_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "submissionDate": ""}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

# METADATA
# title: Study submission date is invalid.
# description: Study submission date format is not ISO8601.
test_rule_i_100_300_005_01_violation_02 if {
	result := rules.rule_i_100_300_005_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "submissionDate": "2024/01/02"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

# METADATA
# title: Study submission date is invalid.
# description: Study submission date format is not ISO8601.
test_rule_i_100_300_005_01_violation_03 if {
	result := rules.rule_i_100_300_005_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "submissionDate": "12/01/2024"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

#########################################################################################################
# rule_i_100_300_006_01
#########################################################################################################

# METADATA
# title: Study public release date is valid.
# description: Study public release date is valid format.
test_rule_i_100_300_006_01_no_violation_01 if {
	result := rules.rule_i_100_300_006_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "publicReleaseDate": "2024-01-02"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study public release date is valid.
# description: Study public release date is valid.
test_rule_i_100_300_006_01_no_violation_02 if {
	result := rules.rule_i_100_300_006_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "publicReleaseDate": "2012-01-02"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Study public release date is invalid.
# description: Study public release date is empty.
test_rule_i_100_300_006_01_violation_01 if {
	result := rules.rule_i_100_300_006_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "publicReleaseDate": ""}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

# METADATA
# title: Study public release date is invalid.
# description: Study public release date format is not ISO8601.
test_rule_i_100_300_006_01_violation_02 if {
	result := rules.rule_i_100_300_006_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "publicReleaseDate": "2024/01/02"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

# METADATA
# title: Study public release date is invalid.
# description: Study public release date format is not ISO8601.
test_rule_i_100_300_006_01_violation_03 if {
	result := rules.rule_i_100_300_006_01 with input as {
		"investigation": {"studies": [{"identifier": "MTBLS1", "publicReleaseDate": "12/01/2024"}]},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}
