#########################################################################################################
# Unit tests for rule_f_400_100_001_06
#########################################################################################################
package tests.file_test

import data.metabolights.validation.v2.rules.phase4.violations as rules

import rego.v1

# METADATA
# title: Data files with .wiff extensions but no data files with .wiff.scan extensions within study FILES folder.
# description: Data files with .wiff.scan extensions often accompany data files with .wiff extensions within study FILES folder. Check referenced data files and re-upload.
# custom:
#  rule_id: rule_f_400_100_001_06
#  type: ERROR
#  priority: HIGH
#  section: files.general
rule_f_400_100_001_06_test_cases := 1

# METADATA
# title: wiff files should have wiff.scan files
# description: wiff files should have wiff.scan files
test_rule_f_400_100_001_06_no_violation_01 if {
	result := rules.rule_f_400_100_001_06 with input as {
		"studyFolderMetadata": {
			"folders": {},
			"files": {
				"m_sample.tsv": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".tsv"},
				"a_sample.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".txt"},
				"m_sample.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".txt"},
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
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}

	count(result) == 0
}

# METADATA
# title: wiff files should have wiff.scan files
# description: wiff files should have wiff.scan files
test_rule_f_400_100_001_06_violation_01 if {
	result := rules.rule_f_400_100_001_06 with input as {
		"studyFolderMetadata": {
			"folders": {},
			"files": {
				"m_sample.tsv": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".tsv"},
				"a_sample.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".txt"},
				"m_sample.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".txt"},
				"i_Investigation.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".txt"},
				"FILES/RAW_FILES1/data1.wiff": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".wiff"},
				"FILES/RAW_FILES2/data2.wiff.scan": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".scan"},
				"FILES/RAW_FILES3/data2.wiff": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".wiff"},
				"FILES/RAW_FILES3/d/data2.wiff": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".wiff"},
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
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}
