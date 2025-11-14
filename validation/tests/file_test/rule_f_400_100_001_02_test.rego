#########################################################################################################
# Unit tests for rule_f_400_100_001_02
#########################################################################################################
package tests.file_test

import data.metabolights.validation.v2.rules.phase4.violations as rules

import rego.v1

# METADATA
# title: Multiple referenced data files with the same name within different folders.
# description: Review referenced file names and make referenced file names unique.
# custom:
#  rule_id: rule_f_400_100_001_02
#  type: WARNING
#  priority: HIGH
#  section: files.general
rule_f_400_100_001_02_test_cases := 1

# METADATA
# title: There are not multiple referenced files with same name on different folders
# description: There are not multiple referenced files with same name on different folders
test_rule_f_400_100_001_02_no_violation_01 if {
	result := rules.rule_f_400_100_001_02 with input as {
		"referencedRawFiles": [
			"FILES/RAW_FILES/data1.raw",
			"FILES/RAW_FILES/data2.raw",
			"FILES/RAW_FILES/data3.raw",
			"FILES/RAW_FILES/data4.raw",
		],
		"referencedDerivedFiles": [
			"FILES/derived_data1.raw",
			"FILES/derived_data2.raw",
			"FILES/derived_data3.raw",
			"FILES/derived_data4.raw",
		],
		"studyFolderMetadata": {"files": {
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
		}},
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Sample Name", "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Raw Spectral Data File", "columnHeader": "Raw Spectral Data File", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Derived Spectral Data File", "columnHeader": "Derived Spectral Data File", "columnIndex": 2},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Free Induction Decay Data File", "columnHeader": "Free Induction Decay Data File", "columnIndex": 3},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Acquisition Parameter Data File", "columnHeader": "Acquisition Parameter Data File", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Parameter Value[Instrument]", "columnHeader": "Parameter Value[Instrument]", "columnIndex": 5},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Data Transformation Name", "columnHeader": "Data Transformation Name", "columnIndex": 6},
			],
			"columns": [
				"Sample Name",
				"Raw Spectral Data File",
				"Derived Spectral Data File",
				"Free Induction Decay Data File",
				"Acquisition Parameter Data File",
				"Parameter Value[Instrument]",
				"Data Transformation Name",
			],
			"data": {
				"Sample Name": ["1", "2", "3", "4"],
				"Raw Spectral Data File": ["FILES/data1.raw", "FILES/data2.raw", "FILES/data3.raw", "FILES/data4.raw"],
				"Derived Spectral Data File": ["FILES/derived_data1.raw", "FILES/derived_data2.raw", "FILES/derived_data3.raw", "FILES/derived_data4.raw"],
				"Free Induction Decay Data File": ["FILES/fid_001.zip", "FILES/fid_001.zip", "FILES/fid_001.zip", "FILES/fid_001.zip"],
				"Acquisition Parameter Data File": ["FILES/acqu_001.zip", "FILES/acqu_001.zip", "FILES/acqu_001.zip", "FILES/acqu_001.zip"],
				"Parameter Value[Instrument]": ["Metabolite Identification", "Metabolite Identification", "Metabolite Identification", "Metabolite Identification"],
				"Data Transformation Name": ["Metabolite Identification", "Metabolite Identification", "Metabolite Identification", "Metabolite Identification"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}

	count(result) == 0
}

# METADATA
# title: There are multiple referenced files with same name on different folders
# description: There are multiple referenced files with same name on different folders
test_rule_f_400_100_001_02_violation_01 if {
	result := rules.rule_f_400_100_001_02 with input as {
		"referencedRawFiles": [
			"FILES/RAW_FILES/data1.raw",
			"FILES/RAW_FILES1/data1.raw",
			"FILES/RAW_FILES2/data1.raw",
			"FILES/RAW_FILES3/data1.raw",
		],
		"referencedDerivedFiles": [
			"FILES/derived_data1.raw",
			"FILES/derived_data2.raw",
			"FILES/derived_data3.raw",
			"FILES/derived_data4.raw",
		],
		"studyFolderMetadata": {"files": {
			"m_sample.tsv": {"sizeInBytes": 100, "baseName": "m_sample.tsv"},
			"a_sample.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv"},
			"m_sample.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv"},
			"i_Investigation.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv"},
			"FILES/RAW_FILES/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw"},
			"FILES/RAW_FILES1/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw"},
			"FILES/RAW_FILES2/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw"},
			"FILES/RAW_FILES3/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw"},
			"FILES/derived_data1.raw": {"sizeInBytes": 100, "baseName": "derived_data1.raw"},
			"FILES/derived_data2.raw": {"sizeInBytes": 100, "baseName": "derived_data2.raw"},
			"FILES/derived_data3.raw": {"sizeInBytes": 100, "baseName": "derived_data3.raw"},
			"FILES/derived_data4.raw": {"sizeInBytes": 100, "baseName": "derived_data4.raw"},
			"FILES/fid_001.zip": {"sizeInBytes": 100, "baseName": "fid_001.zip"},
			"FILES/acqu_001.zip": {"sizeInBytes": 100, "baseName": "acqu_001.zip"},
		}},
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Sample Name", "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Raw Spectral Data File", "columnHeader": "Raw Spectral Data File", "columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Derived Spectral Data File", "columnHeader": "Derived Spectral Data File", "columnIndex": 2},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Free Induction Decay Data File", "columnHeader": "Free Induction Decay Data File", "columnIndex": 3},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Acquisition Parameter Data File", "columnHeader": "Acquisition Parameter Data File", "columnIndex": 4},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Parameter Value[Instrument]", "columnHeader": "Parameter Value[Instrument]", "columnIndex": 5},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Data Transformation Name", "columnHeader": "Data Transformation Name", "columnIndex": 6},
			],
			"columns": [
				"Sample Name",
				"Raw Spectral Data File",
				"Derived Spectral Data File",
				"Free Induction Decay Data File",
				"Acquisition Parameter Data File",
				"Parameter Value[Instrument]",
				"Data Transformation Name",
			],
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}

	count(result) == 1
}
