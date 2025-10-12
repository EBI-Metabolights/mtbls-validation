package metabolights.validation.v2.phase1.tests

import rego.v1
import data.metabolights.validation.v2.phase1.violations as rules
#########################################################################################################
#########################################################################################################
# INVESTIGATION FILE: PARSER MESSAGES
#########################################################################################################
#########################################################################################################

#########################################################################################################
# rule___100_100_001_01
#########################################################################################################

# METADATA
# title: Input data is defined.
# description: Input data is defined.
test_rule___100_100_001_01_not_violation_01 if {
	result := rules.rule___100_100_001_01 with input as {}
	count(result) == 0
}

# METADATA
# title: Input data is defined.
# description: Input data is defined.
test_rule___100_100_001_01_not_violation_02 if {
	result := rules.rule___100_100_001_01 with input as data.tests.data.schemaValidation.valid_01
	count(result) == 0
}


#########################################################################################################
# rule___100_100_001_02
#########################################################################################################

# METADATA
# title: Input data is not compliance with the schema.
# description: Input is invalid for empty input.
test_rule___100_100_001_02_violation_01 if {
	result := rules.rule___100_100_001_02 with input as {}
	count(result) == 1
}

# METADATA
# title: Input data is not compliance with the schema.
# description: Input has missing and additional fields.
test_rule___100_100_001_02_violation_02 if {
	result := rules.rule___100_100_001_02 with input as data.tests.data.schemaValidation.invalid_01
	count(result) == 1
}

# METADATA
# title: Input data is compliance with the schema.
# description: Input has all fields and no extra fields.
test_rule___100_100_001_02_no_violation_01 if {
	result := rules.rule___100_100_001_02 with input as data.tests.data.schemaValidation.valid_01
	count(result) == 0
}

#########################################################################################################
# rule___100_100_100_01
#########################################################################################################

test_rule___100_100_100_01_violation_01 if {
	result := rules.rule___100_100_100_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"parserMessages": {"i_Investigation.txt": [{
			"column": "",
			"detail": "Critical message.",
			"line": "",
			"section": "",
			"short": "test 1",
			"type": "CRITICAL",
		}]},
	}
	count(result) == 1
	some error in result
	error.priority == "CRITICAL"
}

test_rule___100_100_100_01_violation_02 if {
	result := rules.rule___100_100_100_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"parserMessages": {"i_Investigation.txt": [
			{
				"column": "",
				"detail": "Critical message.",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "CRITICAL",
			},
			{
				"column": "",
				"detail": "Critical message.",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "CRITICAL",
			},
		]},
	}
	count(result) == 2
	some error in result
	error.priority == "CRITICAL"
}

# No violation for investigation parser error message
test_rule___100_100_100_01_no_violation_01 if {
	result := rules.rule___100_100_100_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"parserMessages": {"i_Investigation.txt": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "ERROR",
			},
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "WARNING",
			},
		]},
	}
	count(result) == 0
}

# No violation for empty investigation parser message
test_rule___100_100_100_01_no_violation_02 if {
	result := rules.rule___100_100_100_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"parserMessages": {"i_Investigation.txt": []},
	}
	count(result) == 0
}

#########################################################################################################
# rule___100_100_100_02
#########################################################################################################
test_rule___100_100_100_02_violation_01 if {
	result := rules.rule___100_100_100_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"parserMessages": {"i_Investigation.txt": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "ERROR",
			},
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "WARNING",
			},
		]},
	}
	count(result) == 1
	some error in result
	error.type == "ERROR"
}

test_rule___100_100_100_02_violation_02 if {
	result := rules.rule___100_100_100_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"parserMessages": {"i_Investigation.txt": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "ERROR",
			},
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "ERROR",
			},
		]},
	}
	count(result) == 2
	some error in result
	error.type == "ERROR"
}

# No violation for investigation parser warning message
test_rule___100_100_100_02_no_violation_01 if {
	result := rules.rule___100_100_100_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"parserMessages": {"i_Investigation.txt": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "WARNING",
			},
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "WARNING",
			},
		]},
	}
	count(result) == 0
}

# No violation for empty investigation parser message
test_rule___100_100_100_02_no_violation_02 if {
	result := rules.rule___100_100_100_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"parserMessages": {"i_Investigation.txt": []},
	}
	count(result) == 0
}

#########################################################################################################
# rule___100_100_100_03
#########################################################################################################
test_rule___100_100_100_03_violation_01 if {
	result := rules.rule___100_100_100_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"parserMessages": {"i_Investigation.txt": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "ERROR",
			},
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "WARNING",
			},
		]},
	}
	count(result) == 1
	some error in result
	error.type == "WARNING"
}

test_rule___100_100_100_03_violation_02 if {
	result := rules.rule___100_100_100_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"parserMessages": {"i_Investigation.txt": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "WARNING",
			},
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "WARNING",
			},
		]},
	}
	count(result) == 2
	some error in result
	error.type == "WARNING"
}

# No violation for investigation parser warning message
test_rule___100_100_100_03_no_violation_01 if {
	result := rules.rule___100_100_100_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"parserMessages": {"i_Investigation.txt": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "INFO",
			},
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "ERROR",
			},
		]},
	}
	count(result) == 0
}

# No violation for empty investigation parser message
test_rule___100_100_100_03_no_violation_02 if {
	result := rules.rule___100_100_100_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"parserMessages": {"i_Investigation.txt": []},
	}
	count(result) == 0
}

#########################################################################################################
# rule___100_100_100_04
#########################################################################################################

# METADATA
# title: Invalid investigation file name.
# description: File  extension does not match.
test_rule___100_100_100_04_violation_01 if {
	result := rules.rule___100_100_100_04 with input as {"investigationFilePath": "i_Investigation.tsv"}
	count(result) == 1
}

# METADATA
# title: Invalid investigation file name.
# description: i_Investigation.txt file name is case sensitive so other combinations are invalid.
test_rule___100_100_100_04_violation_02 if {
	result := rules.rule___100_100_100_04 with input as {"investigationFilePath": "i_investigation.txt"}
	count(result) == 1
}

# METADATA
# title: Valid investigation file name.
# description: Only i_Investigation.txt file name is valid.
test_rule___100_100_100_04_no_violation_01 if {
	result := rules.rule___100_100_100_04 with input as {
		"parserMessages": {"i_Investigation.txt": []},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

#########################################################################################################
# rule___100_100_100_05
#########################################################################################################

# METADATA
# title: Input data has no parser message list for i_Investigation.txt.
# description: i_Investigation.txt key is missing in parserMessages.
test_rule___100_100_100_05_violation_01 if {
	result := rules.rule___100_100_100_05 with input as {
		"parserMessages": {"s_MTBLS1.txt": []},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

# METADATA
# title: Input data has parser message list for i_Investigation.txt.
# description: There is i_Investigation.txt key in parserMessages.
test_rule___100_100_100_05_no_violation_01 if {
	result := rules.rule___100_100_100_05 with input as {
		"parserMessages": {"i_Investigation.txt": []},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

#########################################################################################################
# rule___100_100_100_06
#########################################################################################################

# METADATA
# title: One i_Investigation.txt.
# description: One i_Investigation.txt.
test_rule___100_100_100_06_no_violation_01 if {
	result := rules.rule___100_100_100_06 with input as {
		"studyFolderMetadata": {"files": { "i_Investigation.txt": {}}},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

# METADATA
# title: Multiple i_Investigation.txt.
# description: There are multiple investigation files.
test_rule___100_100_100_06_violation_01 if {
	result := rules.rule___100_100_100_06 with input as {
		"studyFolderMetadata": {"files":  { "i_Investigation.txt": {}, "i_investigation.txt": {}, "i_investigation2.txt": {}, }},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 2
}


#########################################################################################################
#########################################################################################################
# SAMPLE FILE: PARSER MESSAGES
#########################################################################################################
#########################################################################################################

#########################################################################################################
# rule___100_200_001_01
#########################################################################################################

# METADATA
# title: There is one critical parser error
# description: There is one critical parser error
test_rule___100_200_001_01_violation_01 if {
	result := rules.rule___100_200_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": [{
			"column": "",
			"detail": "Critical message.",
			"line": "",
			"section": "",
			"short": "test 1",
			"type": "CRITICAL",
		}]},
	}
	count(result) == 1
	some error in result
	error.priority == "CRITICAL"
}

# METADATA
# title: There are two critical parser errors
# description: There are two critical parser errors
test_rule___100_200_001_01_violation_02 if {
	result := rules.rule___100_200_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": [
			{
				"column": "",
				"detail": "Critical message.",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "CRITICAL",
			},
			{
				"column": "",
				"detail": "Critical message.",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "CRITICAL",
			},
		]},
	}
	count(result) == 1
	some result_object in result
	count(result_object.values) == 2
	some error in result
	error.priority == "CRITICAL"
}

# METADATA
# title: There is no critical parser error
# description: There is no critical parser error
test_rule___100_200_001_01_no_violation_01 if {
	result := rules.rule___100_200_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "ERROR",
			},
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "WARNING",
			},
		]},
	}
	count(result) == 0
}

# METADATA
# title: There is no critical parser error
# description: There is no critical parser error
test_rule___100_200_001_01_no_violation_02 if {
	result := rules.rule___100_200_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 0
}

#########################################################################################################
# rule___100_200_001_02
#########################################################################################################

# METADATA
# title: There is one  parser error
# description: There is one  parser error
test_rule___100_200_001_02_violation_01 if {
	result := rules.rule___100_200_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "ERROR",
			},
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "WARNING",
			},
		]},
	}
	count(result) == 1
	some error in result
	error.type == "ERROR"
}

# METADATA
# title: There are two  parser errors
# description: There are two  parser errors
test_rule___100_200_001_02_violation_02 if {
	result := rules.rule___100_200_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "ERROR",
			},
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "ERROR",
			},
		]},
	}
	count(result) == 1
	some result_object in result
	count(result_object.values) == 2
	some error in result
	error.type == "ERROR"
}

# METADATA
# title: There is no  parser error
# description: There is no  parser error
test_rule___100_200_001_02_no_violation_01 if {
	result := rules.rule___100_200_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "WARNING",
			},
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "WARNING",
			},
		]},
	}
	count(result) == 0
}

# METADATA
# title: There is no  parser error
# description: There is no  parser error
test_rule___100_200_001_02_no_violation_02 if {
	result := rules.rule___100_200_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 0
}

#########################################################################################################
# rule___100_200_001_03
#########################################################################################################

# METADATA
# title: There is one  parser warning message
# description:  There is one  parser warning message
test_rule___100_200_001_03_violation_01 if {
	result := rules.rule___100_200_001_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "ERROR",
			},
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "WARNING",
			},
		]},
	}
	count(result) == 1
	some error in result
	error.type == "WARNING"
}

# METADATA
# title: There are two  parser warning messages
# description:  There are two  parser warning messages
test_rule___100_200_001_03_violation_02 if {
	result := rules.rule___100_200_001_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "WARNING",
			},
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "WARNING",
			},
		]},
	}
	count(result) == 1
	some result_object in result
	count(result_object.values) == 2
	some error in result
	error.type == "WARNING"
}

# METADATA
# title: There is no  parser warning message
# description:  There is no  parser warning message
test_rule___100_200_001_03_no_violation_01 if {
	result := rules.rule___100_200_001_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "INFO",
			},
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "ERROR",
			},
		]},
	}
	count(result) == 0
}

# METADATA
# title: There is no  parser warning message
# description:  There is no  parser warning message
test_rule___100_200_001_03_no_violation_02 if {
	result := rules.rule___100_200_001_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 0
}

#########################################################################################################
# rule___100_200_001_04
#########################################################################################################

# METADATA
# title: Input data has no parser message list for sample file.
# description: Sample file key is missing in parserMessages.
test_rule___100_200_001_04_violation_01 if {
	result := rules.rule___100_200_001_04 with input as {
		"parserMessages": {"i_Investigation.txt": []},
		"samples": {"s_MTBLS1.txt": []},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

# METADATA
# title: Input data has parser message list for sample file.
# description: There is Sample file key in parserMessages.
test_rule___100_200_001_04_no_violation_01 if {
	result := rules.rule___100_200_001_04 with input as {
		"parserMessages": {"i_Investigation.txt": [], "s_MTBLS1.txt": []},
		"samples": {"s_MTBLS1.txt": []},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

#########################################################################################################
# rule___100_200_001_05
#########################################################################################################

# METADATA
# title: There is a sample file for the study
# description:  There is a sample file for the study
test_rule___100_200_001_05_no_violation_01 if {
	result := rules.rule___100_200_001_05 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: There is no sample file for the study
# description:  There is no sample file for the study
test_rule___100_200_001_05_violation_01 if {
	result := rules.rule___100_200_001_05 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}

#########################################################################################################
# rule___100_200_001_06
#########################################################################################################

# METADATA
# title: There is a sample file for the study
# description:  There is a sample file for the study
test_rule___100_200_001_06_no_violation_01 if {
	result := rules.rule___100_200_001_06 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: There are multiple sample files for the study
# description:  There are multiple sample files for the study
test_rule___100_200_001_06_violation_01 if {
	result := rules.rule___100_200_001_06 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {}, "s_MTBLS1_x.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}


#########################################################################################################
# rule___100_200_001_08
#########################################################################################################

# METADATA
# title: Sample file name is valid.
# description:  Sample file name is valid.
test_rule___100_200_001_08_no_violation_01 if {
	result := rules.rule___100_200_001_08 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {"rowOffset": 0, "totalRowCount": 10}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: Sample file name is valid.
# description:  Sample file name is valid.
test_rule___100_200_001_08_no_violation_02 if {
	result := rules.rule___100_200_001_08 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_REQ1.txt": {"table": {"rowOffset": 0, "totalRowCount": 10}}},
		"investigation": {"studies": [{"fileName": "s_REQ1.txt"}]},
		"parserMessages": {"s_REQ1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: Sample file name is not valid.
# description:  Sample file name is not valid.
test_rule___100_200_001_08_violation_01 if {
	result := rules.rule___100_200_001_08 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS.txt": {"table": {"rowOffset": 0, "totalRowCount": 1}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}

# METADATA
# title: Sample file name is not valid.
# description:  Sample file name is not valid.
test_rule___100_200_001_08_violation_02 if {
	result := rules.rule___100_200_001_08 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1233333333312333333333.txt": {"table": {"rowOffset": 0, "totalRowCount": 1}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}


# METADATA
# title: Sample file name is not valid.
# description:  Sample file name is not valid.
test_rule___100_200_001_08_violation_03 if {
	result := rules.rule___100_200_001_08 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_REX12333333333.txt": {"table": {"rowOffset": 0, "totalRowCount": 1}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}

# METADATA
# title: Sample file name is not valid.
# description:  Sample file name is not valid.
test_rule___100_200_001_08_violation_03 if {
	result := rules.rule___100_200_001_08 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLSREQ12333333333.txt": {"table": {"rowOffset": 0, "totalRowCount": 1}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}

#########################################################################################################
# rule___100_200_001_09
#########################################################################################################

# METADATA
# title: Sample file is referenced in i_Investigation.txt file..
# description:  Sample file is not referenced in i_Investigation.txt file.
test_rule___100_200_001_09_no_violation_01 if {
	result := rules.rule___100_200_001_09 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {"rowOffset": 0, "totalRowCount": 10}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 0
}


# METADATA
# title: Sample file is not referenced in i_Investigation.txt file..
# description:  Sample file is not referenced in i_Investigation.txt file.
test_rule___100_200_001_09_violation_01 if {
	result := rules.rule___100_200_001_09 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"samples": {"s_MTBLS1.txt": {"table": {"rowOffset": 0, "totalRowCount": 10}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS2.txt"}]},
		"parserMessages": {"s_MTBLS2.txt": []},
	}
	count(result) == 1
}



#########################################################################################################
#########################################################################################################
# Assay file: PARSER MESSAGES
#########################################################################################################
#########################################################################################################

#########################################################################################################
# rule___100_300_001_01
#########################################################################################################

# METADATA
# title: There is one critical parser error
# description: There is one critical parser error
test_rule___100_300_001_01_violation_01 if {
	result := rules.rule___100_300_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": [{
			"column": "",
			"detail": "Critical message.",
			"line": "",
			"section": "",
			"short": "test 1",
			"type": "CRITICAL",
		}]},
	}
	count(result) == 1
	some error in result
	error.priority == "CRITICAL"
}

# METADATA
# title: There are two critical parser errors
# description: There are two critical parser errors
test_rule___100_300_001_01_violation_02 if {
	result := rules.rule___100_300_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": [
			{
				"column": "",
				"detail": "Critical message.",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "CRITICAL",
			},
			{
				"column": "",
				"detail": "Critical message.",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "CRITICAL",
			},
		]},
	}
	count(result) == 1
	some result_object in result
	count(result_object.values) == 2
	some error in result
	error.priority == "CRITICAL"
}

# METADATA
# title: There is no critical parser error
# description: There is no critical parser error
test_rule___100_300_001_01_no_violation_01 if {
	result := rules.rule___100_300_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "ERROR",
			},
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "WARNING",
			},
		]},
	}
	count(result) == 0
}

# METADATA
# title: There is no critical parser error
# description: There is no critical parser error
test_rule___100_300_001_01_no_violation_02 if {
	result := rules.rule___100_300_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 0
}

#########################################################################################################
# rule___100_300_001_02
#########################################################################################################

# METADATA
# title: There is one  parser error
# description: There is one  parser error
test_rule___100_300_001_02_violation_01 if {
	result := rules.rule___100_300_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "ERROR",
			},
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "WARNING",
			},
		]},
	}
	count(result) == 1
	some error in result
	error.type == "ERROR"
}

# METADATA
# title: There are two  parser errors
# description: There are two  parser errors
test_rule___100_300_001_02_violation_02 if {
	result := rules.rule___100_300_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "ERROR",
			},
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "ERROR",
			},
		]},
	}
	count(result) == 1
	some result_object in result
	count(result_object.values) == 2
	some error in result
	error.type == "ERROR"
}

# METADATA
# title: There is no  parser error
# description: There is no  parser error
test_rule___100_300_001_02_no_violation_01 if {
	result := rules.rule___100_300_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "WARNING",
			},
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "WARNING",
			},
		]},
	}
	count(result) == 0
}

# METADATA
# title: There is no  parser error
# description: There is no  parser error
test_rule___100_300_001_02_no_violation_02 if {
	result := rules.rule___100_300_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 0
}

#########################################################################################################
# rule___100_300_001_03
#########################################################################################################

# METADATA
# title: There is one  parser warning message
# description:  There is one  parser warning message
test_rule___100_300_001_03_violation_01 if {
	result := rules.rule___100_300_001_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "ERROR",
			},
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "WARNING",
			},
		]},
	}
	count(result) == 1
	some error in result
	error.type == "WARNING"
}

# METADATA
# title: There are two  parser warning messages
# description:  There are two  parser warning messages
test_rule___100_300_001_03_violation_02 if {
	result := rules.rule___100_300_001_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "WARNING",
			},
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "WARNING",
			},
		]},
	}
	count(result) == 1
	some result_object in result
	count(result_object.values) == 2
	some error in result
	error.type == "WARNING"
}

# METADATA
# title: There is no  parser warning message
# description:  There is no  parser warning message
test_rule___100_300_001_03_no_violation_01 if {
	result := rules.rule___100_300_001_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "INFO",
			},
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "ERROR",
			},
		]},
	}
	count(result) == 0
}

# METADATA
# title: There is no  parser warning message
# description:  There is no  parser warning message
test_rule___100_300_001_03_no_violation_02 if {
	result := rules.rule___100_300_001_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 0
}

#########################################################################################################
# rule___100_300_001_04
#########################################################################################################

# METADATA
# title: Input data has no parser message list for assay file.
# description: assay file key is missing in parserMessages.
test_rule___100_300_001_04_violation_01 if {
	result := rules.rule___100_300_001_04 with input as {
		"parserMessages": {"i_Investigation.txt": [], "s_MTBLS1.txt": []},
		"samples": {"s_MTBLS1.txt": []},
		"assays": {"a_MTBLS1.txt": []},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

# METADATA
# title: Input data has parser message list for assay file.
# description: There is an assay file key in parserMessages.
test_rule___100_300_001_04_no_violation_01 if {
	result := rules.rule___100_300_001_04 with input as {
		"parserMessages": {"i_Investigation.txt": [], "s_MTBLS1.txt": [], "a_MTBLS1.txt": []},
		"samples": {"s_MTBLS1.txt": []},
		"assays": {"a_MTBLS1.txt": []},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}

#########################################################################################################
# rule___100_300_001_05
#########################################################################################################

# METADATA
# title: There is a Assay file for the study
# description:  There is a Assay file for the study
test_rule___100_300_001_05_no_violation_01 if {
	result := rules.rule___100_300_001_05 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: There is no Assay file for the study
# description:  There is no Assay file for the study
test_rule___100_300_001_05_violation_01 if {
	result := rules.rule___100_300_001_05 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 1
}



#########################################################################################################
# rule___100_300_001_06
#########################################################################################################

# METADATA
# title: Assay file technology type is defined.
# description:  Assay file technology type is defined.
test_rule___100_300_001_06_no_violation_01 if {
	result := rules.rule___100_300_001_06 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"filePath": "a_MTBLS1.txt", "table": {"rowOffset": 0, "totalRowCount": 1}, "assayTechnique": {
			"name": "LC-MS",
			"mainTechnique": "MS",
			"technique": "LC-MS",
			"subTechnique": "LC",
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.phase1.definitions.__ASSAY_TECHNIQUES as {"a_MTBLS1.txt": "LC-MS"}
	count(result) == 0
}

# METADATA
# title: Assay file technology type is not defined.
# description:  Assay file technology type is not defined.
test_rule___100_300_001_06_violation_01 if {
	result := rules.rule___100_300_001_06 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"filePath": "a_MTBLS1.txt", "table": {"rowOffset": 0, "totalRowCount": 1}, "assayTechnique": {
			"name": "XX-MS",
			"mainTechnique": "MS",
			"technique": "XX-MS",
			"subTechnique": "LC",
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.phase1.definitions.__ASSAY_TECHNIQUES as {"a_MTBLS2.txt": "LC-MS"}

	count(result) == 1
}

#########################################################################################################
# rule___100_300_001_07
#########################################################################################################

# METADATA
# title: Assay file technology type is supported.
# description:  Assay file technology type is defined.
test_rule___100_300_001_07_no_violation_01 if {
	result := rules.rule___100_300_001_07 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"filePath": "a_MTBLS1.txt", "table": {"rowOffset": 0, "totalRowCount": 1}, "assayTechnique": {
			"name": "LC-MS",
			"mainTechnique": "MS",
			"technique": "LC-MS",
			"subTechnique": "LC",
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.phase1.definitions.__ASSAY_TECHNIQUES as {"a_MTBLS1.txt": "LC-MS"}
		with data.metabolights.validation.v2.templates.assayFileHeaderTemplates as {
			"LC-MS": {},
			"GC-MS": {},
		}
	count(result) == 0
}

# METADATA
# title: Assay file technology type is not supported.
# description:  Assay file technology type is not supported.
test_rule___100_300_001_07_violation_01 if {
	result := rules.rule___100_300_001_07 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"filePath": "a_MTBLS1.txt", "table": {"rowOffset": 0, "totalRowCount": 1}, "assayTechnique": {
			"name": "LC-MS",
			"mainTechnique": "MS",
			"technique": "LC-MS",
			"subTechnique": "LC",
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
		with data.metabolights.validation.v2.phase1.definitions.__ASSAY_TECHNIQUES as {"a_MTBLS1.txt": "LC-MS"}
		with data.metabolights.validation.v2.templates.assayFileHeaderTemplates as {"GC-MS": {}}

	count(result) == 1
}


#########################################################################################################
# rule___100_300_001_08
#########################################################################################################

# METADATA
# title: Assay file name is valid.
# description:  Assay file name is valid.
test_rule___100_300_001_08_no_violation_01 if {
	result := rules.rule___100_300_001_08 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"table": {"rowOffset": 0, "totalRowCount": 10}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: Assay file name is not valid.
# description:  Assay file name is not valid.
test_rule___100_300_001_08_violation_01 if {
	result := rules.rule___100_300_001_08 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"x_MTBLS1.txts": {"table": {"rowOffset": 0, "totalRowCount": 1}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 1
}

# METADATA
# title: Assay file name is not valid.
# description:  Assay file name is not valid.
test_rule___100_300_001_08_violation_02 if {
	result := rules.rule___100_300_001_08 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"sample.txt": {"table": {"rowOffset": 0, "totalRowCount": 1}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 1
}




#########################################################################################################
# rule___100_300_001_09
#########################################################################################################

# METADATA
# title: Assay file name is referenced.
# description:  Assay file is referenced.
test_rule___100_300_001_09_no_violation_01 if {
	result := rules.rule___100_300_001_09 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"table": {"rowOffset": 0, "totalRowCount": 10}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: Assay file name is not referenced.
# description:  Assay file is not referenced.
test_rule___100_300_001_09_violation_01 if {
	result := rules.rule___100_300_001_09 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"table": {"rowOffset": 0, "totalRowCount": 10}}, "a_MTBLS13.txt": {"table": {"rowOffset": 0, "totalRowCount": 10}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": [], "a_MTBLS13.txt": []},
	}
	count(result) == 1
}



#########################################################################################################
# rule___100_300_001_10
#########################################################################################################

# METADATA
# title: Assay file name is valid.
# description:  Assay file is referenced.
test_rule___100_300_001_10_no_violation_01 if {
	result := rules.rule___100_300_001_10 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"table": {"rowOffset": 0, "totalRowCount": 10}}, "a_MTBLS13.txt": {"table": {"rowOffset": 0, "totalRowCount": 10}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": []},
	}
	count(result) == 0
}

# METADATA
# title: Assay file names are not valid.
# description:  Assay file names are not valid.
test_rule___100_300_001_10_violation_01 if {
	result := rules.rule___100_300_001_10 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS 1.txt": {"table": {"rowOffset": 0, "totalRowCount": 10}}, "a_MTBLS,13.txt": {"table": {"rowOffset": 0, "totalRowCount": 10}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"a_MTBLS1.txt": [], "a_MTBLS13.txt": []},
	}
	count(result) == 2
}

#########################################################################################################
#########################################################################################################
# Metabolite assignment file: PARSER MESSAGES
#########################################################################################################
#########################################################################################################

#########################################################################################################
# rule___100_400_001_01
#########################################################################################################

# METADATA
# title: There is one critical parser error
# description: There is one critical parser error
test_rule___100_400_001_01_violation_01 if {
	result := rules.rule___100_400_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"m_MTBLS1.tsv": [{
			"column": "",
			"detail": "Critical message.",
			"line": "",
			"section": "",
			"short": "test 1",
			"type": "CRITICAL",
		}]},
	}
	count(result) == 1
	some error in result
	error.priority == "CRITICAL"
}

# METADATA
# title: There are two critical parser errors
# description: There are two critical parser errors
test_rule___100_400_001_01_violation_02 if {
	result := rules.rule___100_400_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"m_MTBLS1.tsv": [
			{
				"column": "",
				"detail": "Critical message.",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "CRITICAL",
			},
			{
				"column": "",
				"detail": "Critical message.",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "CRITICAL",
			},
		]},
	}
	count(result) == 1
	some result_object in result
	count(result_object.values) == 2
	some error in result
	error.priority == "CRITICAL"
}

# METADATA
# title: There is no critical parser error
# description: There is no critical parser error
test_rule___100_400_001_01_no_violation_01 if {
	result := rules.rule___100_400_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"m_MTBLS1.tsv": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "ERROR",
			},
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "WARNING",
			},
		]},
	}
	count(result) == 0
}

# METADATA
# title: There is no critical parser error
# description: There is no critical parser error
test_rule___100_400_001_01_no_violation_02 if {
	result := rules.rule___100_400_001_01 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"m_MTBLS1.tsv": []},
	}
	count(result) == 0
}

#########################################################################################################
# rule___100_400_001_02
#########################################################################################################

# METADATA
# title: There is one  parser error
# description: There is one  parser error
test_rule___100_400_001_02_violation_01 if {
	result := rules.rule___100_400_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"m_MTBLS1.tsv": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "ERROR",
			},
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "WARNING",
			},
		]},
	}
	count(result) == 1
	some error in result
	error.type == "ERROR"
}

# METADATA
# title: There are two  parser errors
# description: There are two  parser errors
test_rule___100_400_001_02_violation_02 if {
	result := rules.rule___100_400_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"m_MTBLS1.tsv": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "ERROR",
			},
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "ERROR",
			},
		]},
	}
	count(result) == 1
	some result_object in result
	count(result_object.values) == 2
	some error in result
	error.type == "ERROR"
}

# METADATA
# title: There is no  parser error
# description: There is no  parser error
test_rule___100_400_001_02_no_violation_01 if {
	result := rules.rule___100_400_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"m_MTBLS1.tsv": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "WARNING",
			},
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "WARNING",
			},
		]},
	}
	count(result) == 0
}

# METADATA
# title: There is no  parser error
# description: There is no  parser error
test_rule___100_400_001_02_no_violation_02 if {
	result := rules.rule___100_400_001_02 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"m_MTBLS1.tsv": []},
	}
	count(result) == 0
}

#########################################################################################################
# rule___100_400_001_03
#########################################################################################################

# METADATA
# title: There is one  parser warning message
# description:  There is one  parser warning message
test_rule___100_400_001_03_violation_01 if {
	result := rules.rule___100_400_001_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"m_MTBLS1.tsv": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "ERROR",
			},
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "WARNING",
			},
		]},
	}
	count(result) == 1
	some error in result
	error.type == "WARNING"
}

# METADATA
# title: There are two  parser warning messages
# description:  There are two  parser warning messages
test_rule___100_400_001_03_violation_02 if {
	result := rules.rule___100_400_001_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"m_MTBLS1.tsv": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "WARNING",
			},
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "WARNING",
			},
		]},
	}
	count(result) == 1
	some result_object in result
	count(result_object.values) == 2
	some error in result
	error.type == "WARNING"
}

# METADATA
# title: There is no  parser warning message
# description:  There is no  parser warning message
test_rule___100_400_001_03_no_violation_01 if {
	result := rules.rule___100_400_001_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"m_MTBLS1.tsv": [
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 1",
				"type": "INFO",
			},
			{
				"column": "",
				"detail": ".",
				"line": "",
				"section": "",
				"short": "test 2",
				"type": "ERROR",
			},
		]},
	}
	count(result) == 0
}

# METADATA
# title: There is no  parser warning message
# description:  There is no  parser warning message
test_rule___100_400_001_03_no_violation_02 if {
	result := rules.rule___100_400_001_03 with input as {
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"parserMessages": {"m_MTBLS1.tsv": []},
	}
	count(result) == 0
}

#########################################################################################################
# rule___100_400_001_04
#########################################################################################################

# METADATA
# title: Input data has no parser message list for metabolite assignment file.
# description: metabolite assignment key is missing in parserMessages.
test_rule___100_400_001_04_violation_01 if {
	result := rules.rule___100_400_001_04 with input as {
		"parserMessages": {"i_Investigation.txt": [], "s_MTBLS1.txt": []},
		"metaboliteAssignments": {"m_MTBLS1.tsv": {}},
		"assays": {"a_MTBLS1.txt": []},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 1
}

# METADATA
# title: Input data has parser message list for metabolite assignment file.
# description: There is an metabolite assignment key in parserMessages.
test_rule___100_400_001_04_no_violation_01 if {
	result := rules.rule___100_400_001_04 with input as {
		"parserMessages": {"i_Investigation.txt": [], "s_MTBLS1.txt": [], "a_MTBLS1.txt": [], "m_MTBLS1.tsv": []},
		"metaboliteAssignments": {"m_MTBLS1.tsv": {}},
		"samples": {"s_MTBLS1.txt": []},
		"assays": {"a_MTBLS1.txt": []},
		"investigationFilePath": "i_Investigation.txt",
	}
	count(result) == 0
}


#########################################################################################################
# rule___100_400_001_05
#########################################################################################################

# METADATA
# title: Metabolite assignment file technology type is defined.
# description: Metabolite assignment file technology type is defined.
test_rule___100_400_001_05_no_violation_01 if {
	result := rules.rule___100_400_001_05 with input as {
		"assays": {
			"a_MTBLS1.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"Sample1",
					"Sample2",
					"Sample3",
				],
			},
			"a_MTBLS1x.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"Sample2",
					"Sample3",
					"Sample4",
				],
			},
		},
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "columnIndex": 1},
				{"columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "chemical_formula", "columnIndex": 2},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "smiles", "columnIndex": 3},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "inchi", "columnIndex": 4},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 4},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Sample1", "columnIndex": 5},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Sample2", "columnIndex": 6},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Sample3", "columnIndex": 7},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Sample4", "columnIndex": 8},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}

	count(result) == 0
}

# METADATA
# title: Metabolite assignment file technology type is not defined.
# description: Metabolite assignment file technology type is not defined.
test_rule___100_400_001_05_violation_01 if {
	result := rules.rule___100_400_001_05 with input as {
		"assays": {
			"a_MTBLS1.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"Sample1",
					"Sample2",
					"Sample3",
				],
			},
			"a_MTBLS1x.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.txt"],
				"sampleNames": [
					"Sample2",
					"Sample3",
					"Sample4",
				],
			},
		},
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.txt": {"assayTechnique": {"name": "", "mainTechnique": ""}, "table": {
			"rowOffset": 0, "totalRowCount": 0,
			"headers": [
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN", "columnHeader": "database_identifier", "columnIndex": 1},
				{"columnPrefix": "", "columnStructure": "ONTOLOGY_COLUMN", "columnHeader": "chemical_formula", "columnIndex": 2},
				{"columnPrefix": "", "columnStructure": "SINGLE_COLUMN_AND_UNIT_ONTOLOGY", "columnHeader": "smiles", "columnIndex": 3},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "inchi", "columnIndex": 4},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "metabolite_identification", "columnIndex": 4},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Sample1", "columnIndex": 5},
				{"columnPrefix": "", "columnStructure": "INVALID_MULTI_COLUMN", "columnHeader": "Sample4", "columnIndex": 8},
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
		# with data.metabolights.validation.v2.phase1.definitions.__ASSIGNMENT_FILE_TYPES as {"m_MTBLS2.txt": "LC-MS"}
	count(result) == 1
}



#########################################################################################################
# rule___100_400_001_06
#########################################################################################################

# METADATA
# title: Metabolite assignment file is referenced in assay file.
# description: Metabolite assignment file is referenced in assay file.
test_rule___100_400_001_06_no_violation_01 if {
	result := rules.rule___100_400_001_06 with input as {
		"assays": {
			"a_MTBLS1.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.tsv"]
		}},
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 0,
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}

	count(result) == 0
}

# METADATA
# title: Metabolite assignment file is not referenced in assay file.
# description: Metabolite assignment file is not referenced in assay file.
test_rule___100_400_001_06_violation_01 if {
	result := rules.rule___100_400_001_06 with input as {
		"assays": {
			"a_MTBLS1.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.tsv"]
		}},
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 0,
		}},
		"m_MTBLS2.tsv": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 0,
		}},
		"m_MTBLS3.tsv": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 0,
		}}
		},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.tsv": []},
	}

	count(result) == 2
}


#########################################################################################################
# rule___100_400_001_07
#########################################################################################################

# METADATA
# title: Metabolite assignment file name is valid.
# description: Metabolite assignment file name is valid.
test_rule___100_400_001_07_no_violation_01 if {
	result := rules.rule___100_400_001_07 with input as {
		"assays": {
			"a_MTBLS1.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.tsv"]
		}},
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 0,
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}

	count(result) == 0
}


# METADATA
# title: Metabolite assignment file name is not valid.
# description: Metabolite assignment file name is not valid.
test_rule___100_400_001_07_violation_01 if {
	result := rules.rule___100_400_001_07 with input as {
		"assays": {
			"a_MTBLS1.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.tsv"]
		}},
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"x_MTBLS1.tsv": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 0,
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}

	count(result) == 1
}


#########################################################################################################
# rule___100_400_001_08
#########################################################################################################

# METADATA
# title: Metabolite assignment file name is valid.
# description: Metabolite assignment file name is valid.
test_rule___100_400_001_08_no_violation_01 if {
	result := rules.rule___100_400_001_08 with input as {
		"assays": {
			"a_MTBLS1.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.tsv"]
		}},
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_MTBLS1.tsv": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 0,
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}

	count(result) == 0
}


# METADATA
# title: Metabolite assignment file name is not valid.
# description: Metabolite assignment file name is not valid.
test_rule___100_400_001_08_violation_01 if {
	result := rules.rule___100_400_001_08 with input as {
		"assays": {
			"a_MTBLS1.txt": {
				"referencedAssignmentFiles": ["m_MTBLS1.tsv"]
		}},
		"investigationFilePath": "i_Investigation.txt",
		"metaboliteAssignments": {"m_M,%'  TBLS1.tsv": {"assayTechnique": {"name": "LC-MS", "mainTechnique": "MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 0,
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}

	count(result) == 1
}