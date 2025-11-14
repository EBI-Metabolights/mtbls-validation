#########################################################################################################
# Unit tests for rule_f_400_100_001_07
#########################################################################################################
package tests.file_test

import data.metabolights.validation.v2.rules.phase4.violations as rules

import rego.v1

# METADATA
# title: Unexpected files / folders within study root folder.
# description: Only reference metadata files and FILES folder are allowed within study root folder. Sample and assay files must be referenced in i_Investigation.txt. All metabolite Assignment files must be referenced in assay files. Multiple investigation files and all other files are not allowed.
# custom:
#  rule_id: rule_f_400_100_001_07
#  type: ERROR
#  priority: CRITICAL
#  section: files.general
rule_f_400_100_001_07_test_cases := 1

# METADATA
# title: All files are referenced in study root path
# description: All files are referenced in study root path
test_rule_f_400_100_001_07_no_violation_01 if {
	result := rules.rule_f_400_100_001_07 with input as {
		"studyFolderMetadata": {
			"folders": {},
			"files": {
				"m_MTBLS1.tsv": {"sizeInBytes": 100, "baseName": "m_MTBLS1.tsv", "extension": ".tsv"},
				"s_MTBLS1.txt": {"sizeInBytes": 100, "baseName": "s_MTBLS1.txt", "extension": ".txt"},
				"a_MTBLS1.txt": {"sizeInBytes": 100, "baseName": "a_MTBLS1.txt", "extension": ".txt"},
				"i_Investigation.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".txt"},
				"FILES/RAW_FILES1/data1.wiff": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".wiff"},
				"FILES/RAW_FILES1/data1.wiff.scan": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".scan"},
				"FILES/RAW_FILES3/data2.wiff": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".wiff"},
				"FILES/RAW_FILES3/data2.wiff.scan": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".scan"},
				"FILES/derived_data1.raw": {"sizeInBytes": 100, "baseName": "derived_data1.raw", "extension": ".raw"},
				"FILES/derived_data2.raw": {"sizeInBytes": 100, "baseName": "derived_data2.raw", "extension": ".raw"},
				"FILES/derived_data3.raw": {"sizeInBytes": 100, "baseName": "derived_data3.raw", "extension": ".raw"},
				"FILES/derived_data4.raw": {"sizeInBytes": 100, "baseName": "derived_data4.raw", "extension": ".raw"},
				"FILES/derived_data1.mzML": {"sizeInBytes": 100, "baseName": "derived_data1.mzML", "extension": ".mzml"},
				"FILES/derived_data3.mzData": {"sizeInBytes": 100, "baseName": "derived_data1.mzData", "extension": ".mzdata"},
				"FILES/0001/fid": {"sizeInBytes": 100, "baseName": "fid_001.zip", "extension": ""},
				"FILES/0001/acqu": {"sizeInBytes": 100, "baseName": "acqu_001.zip", "extension": ""},
			},
		},
		"investigationFilePath": "i_Investigation.txt",
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"assays": {"a_MTBLS1.txt": {"referencedAssignmentFiles": ["m_MTBLS1.tsv"]}},
		"parserMessages": {"s_MTBLS1.txt": []},
	}

	count(result) == 0
}

# METADATA
# title: Some files are not referenced in study root path
# description: Some files are not referenced in study root path
test_rule_f_400_100_001_07_violation_01 if {
	result := rules.rule_f_400_100_001_07 with input as {
		"studyFolderMetadata": {
			"folders": {},
			"files": {
				"m_MTBLS1.tsv": {"sizeInBytes": 100, "baseName": "m_MTBLS1.tsv", "extension": ".tsv"},
				"s_MTBLS1.txt": {"sizeInBytes": 100, "baseName": "s_MTBLS1.txt", "extension": ".txt"},
				"a_MTBLS1.txt": {"sizeInBytes": 100, "baseName": "a_MTBLS1.txt", "extension": ".txt"},
				"i_investigation.txt": {"sizeInBytes": 100, "baseName": "i_investigation.txt", "extension": ".txt"},
				"m_investigation.txt": {"sizeInBytes": 100, "baseName": "m_investigation.txt", "extension": ".txt"},
				"a_investigation.txt": {"sizeInBytes": 100, "baseName": "a_investigation.txt", "extension": ".txt"},
				"s_investigation.txt": {"sizeInBytes": 100, "baseName": "s_investigation.txt", "extension": ".txt"},
				"investigation.json": {"sizeInBytes": 100, "baseName": "investigation.json", "extension": ".txt"},
				"i_Investigation.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".txt"},
				"DATA/test.txt": {"sizeInBytes": 100, "baseName": "test.txt", "extension": ".txt"},
				"FILES/RAW_FILES1/data1.wiff": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".wiff"},
				"FILES/RAW_FILES1/data1.wiff.scan": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".scan"},
				"FILES/RAW_FILES3/data2.wiff": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".wiff"},
				"FILES/RAW_FILES3/data2.wiff.scan": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".scan"},
				"FILES/derived_data1.raw": {"sizeInBytes": 100, "baseName": "derived_data1.raw", "extension": ".raw"},
				"FILES/derived_data2.raw": {"sizeInBytes": 100, "baseName": "derived_data2.raw", "extension": ".raw"},
				"FILES/derived_data3.raw": {"sizeInBytes": 100, "baseName": "derived_data3.raw", "extension": ".raw"},
				"FILES/derived_data4.raw": {"sizeInBytes": 100, "baseName": "derived_data4.raw", "extension": ".raw"},
				"FILES/derived_data1.mzML": {"sizeInBytes": 100, "baseName": "derived_data1.mzML", "extension": ".mzml"},
				"FILES/derived_data3.mzData": {"sizeInBytes": 100, "baseName": "derived_data1.mzData", "extension": ".mzdata"},
				"FILES/0001/fid": {"sizeInBytes": 100, "baseName": "fid_001.zip", "extension": ""},
				"FILES/0001/acqu": {"sizeInBytes": 100, "baseName": "acqu_001.zip", "extension": ""},
			},
		},
		"investigationFilePath": "i_Investigation.txt",
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": {"assays": [{"fileName": "a_MTBLS1.txt"}]}}]},
		"assays": {"a_MTBLS1.txt": {"referencedAssignmentFiles": ["m_MTBLS1.tsv"]}},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}
