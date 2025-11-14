#########################################################################################################
# Unit tests for rule_f_400_090_001_09
#########################################################################################################
package tests.file_test

import data.metabolights.validation.v2.rules.phase4.violations as rules

import rego.v1

# METADATA
# title: Uploaded data file names contain invalid characters.
# description: Use only .-_A-Za-z0-9 characters for data file name.
# custom:
#  rule_id: rule_f_400_090_001_09
#  type: ERROR
#  priority: HIGH
#  section: files.general
rule_f_400_090_001_09_test_cases := 1

# METADATA
# title: File names are valid
# description: File names are valid
test_rule_f_400_090_001_09_no_violation_01 if {
	result := rules.rule_f_400_090_001_09 with input as {
		"studyFolderMetadata": {
			"folders": {},
			"files": {
				"m_sample.tsv": {"sizeInBytes": 100, "baseName": "m_sample.tsv"},
				"a_sample.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv"},
				"m_sample.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv"},
				"i_Investigation.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv"},
				"FILES/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw"},
				"FILES/data2.raw": {"sizeInBytes": 100, "baseName": "data2.raw"},
				"FILES/data3.raw": {"sizeInBytes": 100, "baseName": "data3.raw"},
				"FILES/data4.raw": {"sizeInBytes": 100, "baseName": "data4.raw"},
				"FILES/derived_data1.raw": {"sizeInBytes": 100, "baseName": "derived_data1.raw"},
				"FILES/derived_data2.raw": {"sizeInBytes": 100, "baseName": "derived_data2.raw"},
				"FILES/derived_data3.raw": {"sizeInBytes": 100, "baseName": "derived_data3.raw"},
				"FILES/derived_data4.raw": {"sizeInBytes": 100, "baseName": "derived_data4.raw"},
				"FILES/fid_001.zip": {"sizeInBytes": 100, "baseName": "fid_001.zip"},
				"FILES/acqu_001.zip": {"sizeInBytes": 100, "baseName": "acqu_001.zip"},
			},
		},
		"investigationFilePath": "i_Investigation.txt",
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}

	count(result) == 0
}

# METADATA
# title: File names are valid
# description: File names are not valid
test_rule_f_400_090_001_09_violation_01 if {
	result := rules.rule_f_400_090_001_09 with input as {
		"studyFolderMetadata": {
			"folders": {},
			"files": {
				"m_sample.tsv": {"sizeInBytes": 100, "baseName": "m_sample.tsv"},
				"a_sample.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv"},
				"m_sample.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv"},
				"i_Investigation.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv"},
				"FILES/data,1.raw": {"sizeInBytes": 100, "baseName": "data1.raw"},
				"FILES/dat:a2.raw": {"sizeInBytes": 100, "baseName": "data2.raw"},
				"FILES/d\"ata3.raw": {"sizeInBytes": 100, "baseName": "data3.raw"},
				"FILES/da?ta4.raw": {"sizeInBytes": 100, "baseName": "data4.raw"},
				"FILES/der*ived_data1.raw": {"sizeInBytes": 100, "baseName": "derived_data1.raw"},
				"FILES/deri&ved_data2.raw": {"sizeInBytes": 100, "baseName": "derived_data2.raw"},
				"FILES/deriv@ed_data3.raw": {"sizeInBytes": 100, "baseName": "derived_data3.raw"},
				"FILES/derive;d_data4.raw": {"sizeInBytes": 100, "baseName": "derived_data4.raw"},
				"FILES/fid_00~1.zip": {"sizeInBytes": 100, "baseName": "fid_001.zip"},
				"FILES/acqu_00!1.zip": {"sizeInBytes": 100, "baseName": "acqu_001.zip"},
				"FILES/acqu_001.zip": {"sizeInBytes": 100, "baseName": "acqu_001.zip"},
			},
		},
		"investigationFilePath": "i_Investigation.txt",
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}

	count(result) == 1
	some item in result
	count(item.values) == 10
}
