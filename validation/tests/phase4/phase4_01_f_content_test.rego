package metabolights.validation.v2.phase4.tests

import rego.v1
import data.metabolights.validation.v2.phase4.violations as rules


#########################################################################################################
# rule_f_400_090_001_01
#########################################################################################################


# METADATA
# title: All referenced files exist on study folder.
# description: All referenced files exist on study folder.
test_rule_f_400_090_001_01_no_violation_01 if {
	result := rules.rule_f_400_090_001_01 with input as {
        "studyFolderMetadata": {
            "files": {
                "FILES/data1.raw": {},
                "FILES/data2.raw": {},
                "FILES/data3.raw": {},
                "FILES/data4.raw": {},
                "FILES/derived_data1.raw": {},
                "FILES/derived_data2.raw": {},
                "FILES/derived_data3.raw": {},
                "FILES/derived_data4.raw": {},
                "FILES/fid_001.zip": {},
                "FILES/acqu_001.zip": {}
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Sample Name",  "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Raw Spectral Data File", "columnHeader": "Raw Spectral Data File","columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Derived Spectral Data File", "columnHeader": "Derived Spectral Data File","columnIndex": 2},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Free Induction Decay Data File",  "columnHeader": "Free Induction Decay Data File","columnIndex": 3},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Acquisition Parameter Data File", "columnHeader": "Acquisition Parameter Data File","columnIndex": 4},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Parameter Value[Instrument]", "columnHeader": "Parameter Value[Instrument]","columnIndex": 5},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Data Transformation Name", "columnHeader": "Data Transformation Name","columnIndex": 6},
			],
			"columns": [
				"Sample Name",
                "Raw Spectral Data File",
                "Derived Spectral Data File",
                "Free Induction Decay Data File",
                "Acquisition Parameter Data File",
                "Parameter Value[Instrument]",
                "Data Transformation Name"

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
# title: A referenced file does not exist on study folder.
# description: A referenced file does not exist on study folder.
test_rule_f_400_090_001_01_violation_01 if {
result := rules.rule_f_400_090_001_01 with input as {
        "studyFolderMetadata": {
            "files": {
                "FILES/data1.raw": {},
                "FILES/data2.raw": {},
                "FILES/data3.raw": {},
                "FILES/data4.raw": {},
                "FILES/derived_data1.raw": {},
                "FILES/derived_data2.raw": {},
                "FILES/derived_data3.raw": {},
                "FILES/derived_data4.raw": {},
                "FILES/fid_001.zip": {},
                "FILES/acqu_001.zip": {}
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Sample Name",  "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Raw Spectral Data File", "columnHeader": "Raw Spectral Data File","columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Derived Spectral Data File", "columnHeader": "Derived Spectral Data File","columnIndex": 2},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Free Induction Decay Data File",  "columnHeader": "Free Induction Decay Data File","columnIndex": 3},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Acquisition Parameter Data File", "columnHeader": "Acquisition Parameter Data File","columnIndex": 4},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Parameter Value[Instrument]", "columnHeader": "Parameter Value[Instrument]","columnIndex": 5},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Data Transformation Name", "columnHeader": "Data Transformation Name","columnIndex": 6},
			],
			"columns": [
				"Sample Name",
                "Raw Spectral Data File",
                "Derived Spectral Data File",
                "Free Induction Decay Data File",
                "Acquisition Parameter Data File",
                "Parameter Value[Instrument]",
                "Data Transformation Name"

			],
			"data": {
				"Sample Name": ["1", "2", "3", "4"],
				"Raw Spectral Data File": ["FILES/dataX.raw", "FILES/data2.raw", "FILES/data3.raw", "FILES/data4.raw"],
				"Derived Spectral Data File": ["FILES/derived_data1.raw", "FILES/derived_dataX.raw", "FILES/derived_data3.raw", "FILES/derived_data4.raw"],
				"Free Induction Decay Data File": ["FILES/fid_001.zip", "FILES/fid_001.zip", "FILES/fid_00x.zip", "FILES/fid_001.zip"],
				"Acquisition Parameter Data File": ["FILES/acqu_001.zip", "FILES/acqu_001.zip", "FILES/acqu_001.zip", "FILES/acqu_00x.zip"],
				"Parameter Value[Instrument]": ["Metabolite Identification", "Metabolite Identification", "Metabolite Identification", "Metabolite Identification"],
				"Data Transformation Name": ["Metabolite Identification", "Metabolite Identification", "Metabolite Identification", "Metabolite Identification"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}

	count(result) == 4
}



#########################################################################################################
# rule_f_400_090_001_02
#########################################################################################################


# METADATA
# title: Referenced data files start with FILES/ prefix.
# description: Referenced data files start with FILES/ prefix.
test_rule_f_400_090_001_02_no_violation_01 if {
	result := rules.rule_f_400_090_001_02 with input as {
        "studyFolderMetadata": {
            "files": {
                "FILES/data1.raw": {},
                "FILES/data2.raw": {},
                "FILES/data3.raw": {},
                "FILES/data4.raw": {},
                "FILES/derived_data1.raw": {},
                "FILES/derived_data2.raw": {},
                "FILES/derived_data3.raw": {},
                "FILES/derived_data4.raw": {},
                "FILES/fid_001.zip": {},
                "FILES/acqu_001.zip": {}
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Sample Name",  "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Raw Spectral Data File", "columnHeader": "Raw Spectral Data File","columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Derived Spectral Data File", "columnHeader": "Derived Spectral Data File","columnIndex": 2},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Free Induction Decay Data File",  "columnHeader": "Free Induction Decay Data File","columnIndex": 3},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Acquisition Parameter Data File", "columnHeader": "Acquisition Parameter Data File","columnIndex": 4},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Parameter Value[Instrument]", "columnHeader": "Parameter Value[Instrument]","columnIndex": 5},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Data Transformation Name", "columnHeader": "Data Transformation Name","columnIndex": 6},
			],
			"columns": [
				"Sample Name",
                "Raw Spectral Data File",
                "Derived Spectral Data File",
                "Free Induction Decay Data File",
                "Acquisition Parameter Data File",
                "Parameter Value[Instrument]",
                "Data Transformation Name"

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
# title: Referenced data files do not start with FILES/ prefix.
# description: Referenced data files do not start with FILES/ prefix.
test_rule_f_400_090_001_02_violation_01 if {
result := rules.rule_f_400_090_001_02 with input as {
        "studyFolderMetadata": {
            "files": {
                "FILES/data1.raw": {},
                "FILES/data2.raw": {},
                "FILES/data3.raw": {},
                "FILES/data4.raw": {},
                "FILES/derived_data1.raw": {},
                "FILES/derived_data2.raw": {},
                "FILES/derived_data3.raw": {},
                "FILES/derived_data4.raw": {},
                "FILES/fid_001.zip": {},
                "FILES/acqu_001.zip": {}
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Sample Name",  "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Raw Spectral Data File", "columnHeader": "Raw Spectral Data File","columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Derived Spectral Data File", "columnHeader": "Derived Spectral Data File","columnIndex": 2},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Free Induction Decay Data File",  "columnHeader": "Free Induction Decay Data File","columnIndex": 3},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Acquisition Parameter Data File", "columnHeader": "Acquisition Parameter Data File","columnIndex": 4},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Parameter Value[Instrument]", "columnHeader": "Parameter Value[Instrument]","columnIndex": 5},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Data Transformation Name", "columnHeader": "Data Transformation Name","columnIndex": 6},
			],
			"columns": [
				"Sample Name",
                "Raw Spectral Data File",
                "Derived Spectral Data File",
                "Free Induction Decay Data File",
                "Acquisition Parameter Data File",
                "Parameter Value[Instrument]",
                "Data Transformation Name"

			],
			"data": {
				"Sample Name": ["1", "2", "3", "4"],
				"Raw Spectral Data File": ["FILES/dataX.raw", "data2.raw", "FILES/data3.raw", "FILES/data4.raw"],
				"Derived Spectral Data File": ["FILES/derived_data1.raw", "FILES/derived_dataX.raw", "derived_data3.raw", "FILES/derived_data4.raw"],
				"Free Induction Decay Data File": ["FILES/fid_001.zip", "FILES/fid_001.zip", "FILES/fid_00x.zip", "FILES/fid_001.zip"],
				"Acquisition Parameter Data File": ["acqu_001.zip", "FILES/acqu_001.zip", "FILES/acqu_001.zip", "FILES/acqu_00x.zip"],
				"Parameter Value[Instrument]": ["Metabolite Identification", "Metabolite Identification", "Metabolite Identification", "Metabolite Identification"],
				"Data Transformation Name": ["Metabolite Identification", "Metabolite Identification", "Metabolite Identification", "Metabolite Identification"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}

	count(result) == 3
}


#########################################################################################################
# rule_f_400_090_001_03
#########################################################################################################


# METADATA
# title: There are not invalid characters in a referenced file name.
# description: There are not invalid characters in a referenced file name.
test_rule_f_400_090_001_03_no_violation_01 if {
	result := rules.rule_f_400_090_001_03 with input as {
        "studyFolderMetadata": {
            "files": {
                "FILES/data1.raw": {},
                "FILES/data2.raw": {},
                "FILES/data3.raw": {},
                "FILES/data4.raw": {},
                "FILES/derived_data1.raw": {},
                "FILES/derived_data2.raw": {},
                "FILES/derived_data3.raw": {},
                "FILES/derived_data4.raw": {},
                "FILES/fid_001.zip": {},
                "FILES/acqu_001.zip": {}
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Sample Name",  "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Raw Spectral Data File", "columnHeader": "Raw Spectral Data File","columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Derived Spectral Data File", "columnHeader": "Derived Spectral Data File","columnIndex": 2},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Free Induction Decay Data File",  "columnHeader": "Free Induction Decay Data File","columnIndex": 3},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Acquisition Parameter Data File", "columnHeader": "Acquisition Parameter Data File","columnIndex": 4},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Parameter Value[Instrument]", "columnHeader": "Parameter Value[Instrument]","columnIndex": 5},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Data Transformation Name", "columnHeader": "Data Transformation Name","columnIndex": 6},
			],
			"columns": [
				"Sample Name",
                "Raw Spectral Data File",
                "Derived Spectral Data File",
                "Free Induction Decay Data File",
                "Acquisition Parameter Data File",
                "Parameter Value[Instrument]",
                "Data Transformation Name"

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
# title: There are not invalid characters in a referenced file name.
# description: There are not invalid characters in a referenced file name.
test_rule_f_400_090_001_03_violation_01 if {
result := rules.rule_f_400_090_001_03 with input as {
        "studyFolderMetadata": {
            "files": {
                "FILES/data1.raw": {},
                "FILES/data2.raw": {},
                "FILES/data3.raw": {},
                "FILES/data4.raw": {},
                "FILES/derived_data1.raw": {},
                "FILES/derived_data2.raw": {},
                "FILES/derived_data3.raw": {},
                "FILES/derived_data4.raw": {},
                "FILES/fid_001.zip": {},
                "FILES/acqu_001.zip": {}
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Sample Name",  "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Raw Spectral Data File", "columnHeader": "Raw Spectral Data File","columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Derived Spectral Data File", "columnHeader": "Derived Spectral Data File","columnIndex": 2},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Free Induction Decay Data File",  "columnHeader": "Free Induction Decay Data File","columnIndex": 3},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Acquisition Parameter Data File", "columnHeader": "Acquisition Parameter Data File","columnIndex": 4},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Parameter Value[Instrument]", "columnHeader": "Parameter Value[Instrument]","columnIndex": 5},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Data Transformation Name", "columnHeader": "Data Transformation Name","columnIndex": 6},
			],
			"columns": [
				"Sample Name",
                "Raw Spectral Data File",
                "Derived Spectral Data File",
                "Free Induction Decay Data File",
                "Acquisition Parameter Data File",
                "Parameter Value[Instrument]",
                "Data Transformation Name"

			],
			"data": {
				"Sample Name": ["1", "2", "3", "4"],
				"Raw Spectral Data File": ["FILES/dataX.raw", "data2-da.raw", "FILES/da_ta3.raw", "FILES/data5A.raw"],
				"Derived Spectral Data File": ["FILES/deriv,ed_data1.raw", "FILES/de$rived_dataX.raw", "derived_data3.raw", "FILES/derived_data4.raw"],
				"Free Induction Decay Data File": ["FILES/fid_001.zip", "FILES/fid_0:01.zip", "FILES/fid_00x.zip", "FILES/fid_001.zip"],
				"Acquisition Parameter Data File": ["acqu_001.zip", "FILES/acqu+_001.zip", "FILES/acqu_001.zip", "FILES/acqu_00x.zip"],
				"Parameter Value[Instrument]": ["Metabolite Identification", "Metabolite Identification", "Metabolite Identification", "Metabolite Identification"],
				"Data Transformation Name": ["Metabolite Identification", "Metabolite Identification", "Metabolite Identification", "Metabolite Identification"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}

	count(result) == 3
}




#########################################################################################################
# rule_f_400_090_001_04
#########################################################################################################


# METADATA
# title: Referenced files does not contain zero byte data.
# description: Referenced files does not contain zero byte data.
test_rule_f_400_090_001_04_no_violation_01 if {
	result := rules.rule_f_400_090_001_04 with input as {
        "studyFolderMetadata": {
            "files": {
                "FILES/data1.raw": {"sizeInBytes": 100},
                "FILES/data2.raw": {"sizeInBytes": 100},
                "FILES/data3.raw": {"sizeInBytes": 100},
                "FILES/data4.raw": {"sizeInBytes": 100},
                "FILES/derived_data1.raw": {"sizeInBytes": 100},
                "FILES/derived_data2.raw": {"sizeInBytes": 100},
                "FILES/derived_data3.raw": {"sizeInBytes": 100},
                "FILES/derived_data4.raw": {"sizeInBytes": 100},
                "FILES/fid_001.zip": {"sizeInBytes": 100},
                "FILES/acqu_001.zip": {"sizeInBytes": 100},
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Sample Name",  "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Raw Spectral Data File", "columnHeader": "Raw Spectral Data File","columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Derived Spectral Data File", "columnHeader": "Derived Spectral Data File","columnIndex": 2},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Free Induction Decay Data File",  "columnHeader": "Free Induction Decay Data File","columnIndex": 3},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Acquisition Parameter Data File", "columnHeader": "Acquisition Parameter Data File","columnIndex": 4},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Parameter Value[Instrument]", "columnHeader": "Parameter Value[Instrument]","columnIndex": 5},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Data Transformation Name", "columnHeader": "Data Transformation Name","columnIndex": 6},
			],
			"columns": [
				"Sample Name",
                "Raw Spectral Data File",
                "Derived Spectral Data File",
                "Free Induction Decay Data File",
                "Acquisition Parameter Data File",
                "Parameter Value[Instrument]",
                "Data Transformation Name"

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
# title: Referenced file contains zero byte data.
# description: Referenced file contains zero byte data.
test_rule_f_400_090_001_04_violation_01 if {
result := rules.rule_f_400_090_001_04 with input as {
        "studyFolderMetadata": {
            "files": {
                "FILES/data1.raw": {"sizeInBytes": 100},
                "FILES/data2.raw": {"sizeInBytes": 100},
                "FILES/data3.raw": {"sizeInBytes": 100},
                "FILES/data4.raw": {"sizeInBytes": 100},
                "FILES/derived_data1.raw": {"sizeInBytes": 0},
                "FILES/derived_data2.raw": {"sizeInBytes": 100},
                "FILES/derived_data3.raw": {"sizeInBytes": -1},
                "FILES/derived_data4.raw": {"sizeInBytes": 100},
                "FILES/fid_001.zip": {"sizeInBytes": 100},
                "FILES/acqu_001.zip": {"sizeInBytes": 100},
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Sample Name",  "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Raw Spectral Data File", "columnHeader": "Raw Spectral Data File","columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Derived Spectral Data File", "columnHeader": "Derived Spectral Data File","columnIndex": 2},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Free Induction Decay Data File",  "columnHeader": "Free Induction Decay Data File","columnIndex": 3},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Acquisition Parameter Data File", "columnHeader": "Acquisition Parameter Data File","columnIndex": 4},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Parameter Value[Instrument]", "columnHeader": "Parameter Value[Instrument]","columnIndex": 5},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Data Transformation Name", "columnHeader": "Data Transformation Name","columnIndex": 6},
			],
			"columns": [
				"Sample Name",
                "Raw Spectral Data File",
                "Derived Spectral Data File",
                "Free Induction Decay Data File",
                "Acquisition Parameter Data File",
                "Parameter Value[Instrument]",
                "Data Transformation Name"

			],
			"data": {
				"Sample Name": ["1", "2", "3", "4"],
				"Raw Spectral Data File": ["FILES/dataX.raw", "data2-da.raw", "FILES/da_ta3.raw", "FILES/data5A.raw"],
				"Derived Spectral Data File": ["FILES/derived_data1.raw", "FILES/de$rived_dataX.raw", "FILES/derived_data3.raw", "FILES/derived_data4.raw"],
				"Free Induction Decay Data File": ["FILES/fid_001.zip", "FILES/fid_0:01.zip", "FILES/fid_00x.zip", "FILES/fid_001.zip"],
				"Acquisition Parameter Data File": ["acqu_001.zip", "FILES/acqu+_001.zip", "FILES/acqu_001.zip", "FILES/acqu_00x.zip"],
				"Parameter Value[Instrument]": ["Metabolite Identification", "Metabolite Identification", "Metabolite Identification", "Metabolite Identification"],
				"Data Transformation Name": ["Metabolite Identification", "Metabolite Identification", "Metabolite Identification", "Metabolite Identification"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}

	count(result) == 1
}



#########################################################################################################
# rule_f_400_100_001_01
#########################################################################################################


# METADATA
# title: Metadata file is referenced.
# description: Metadata file is referenced.
test_rule_f_400_100_001_01_no_violation_01 if {
	result := rules.rule_f_400_100_001_01 with input as {
        "studyFolderMetadata": {
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
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Sample Name",  "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Raw Spectral Data File", "columnHeader": "Raw Spectral Data File","columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Derived Spectral Data File", "columnHeader": "Derived Spectral Data File","columnIndex": 2},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Free Induction Decay Data File",  "columnHeader": "Free Induction Decay Data File","columnIndex": 3},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Acquisition Parameter Data File", "columnHeader": "Acquisition Parameter Data File","columnIndex": 4},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Parameter Value[Instrument]", "columnHeader": "Parameter Value[Instrument]","columnIndex": 5},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Data Transformation Name", "columnHeader": "Data Transformation Name","columnIndex": 6},
			],
			"columns": [
				"Sample Name",
                "Raw Spectral Data File",
                "Derived Spectral Data File",
                "Free Induction Decay Data File",
                "Acquisition Parameter Data File",
                "Parameter Value[Instrument]",
                "Data Transformation Name"

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
# title: Metadata file is not referenced.
# description: Metadata file is not referenced.
test_rule_f_400_100_001_01_violation_01 if {
result := rules.rule_f_400_100_001_01 with input as {
        "studyFolderMetadata": {
            "files": {
                "FILES/m_sample.tsv": {"sizeInBytes": 100},
                "FILES/a_sample.txt": {"sizeInBytes": 100},
                "FILES/m_sample.txt": {"sizeInBytes": 100},
                "FILES/i_Investigation.txt": {"sizeInBytes": 100},
                "FILES/data1.raw": {"sizeInBytes": 100},
                "FILES/data2.raw": {"sizeInBytes": 100},
                "FILES/data3.raw": {"sizeInBytes": 100},
                "FILES/data4.raw": {"sizeInBytes": 100},
                "FILES/derived_data1.raw": {"sizeInBytes": 0},
                "FILES/derived_data2.raw": {"sizeInBytes": 100},
                "FILES/derived_data3.raw": {"sizeInBytes": -1},
                "FILES/derived_data4.raw": {"sizeInBytes": 100},
                "FILES/fid_001.zip": {"sizeInBytes": 100},
                "FILES/acqu_001.zip": {"sizeInBytes": 100},
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Sample Name",  "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Raw Spectral Data File", "columnHeader": "Raw Spectral Data File","columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Derived Spectral Data File", "columnHeader": "Derived Spectral Data File","columnIndex": 2},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Free Induction Decay Data File",  "columnHeader": "Free Induction Decay Data File","columnIndex": 3},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Acquisition Parameter Data File", "columnHeader": "Acquisition Parameter Data File","columnIndex": 4},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Parameter Value[Instrument]", "columnHeader": "Parameter Value[Instrument]","columnIndex": 5},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Data Transformation Name", "columnHeader": "Data Transformation Name","columnIndex": 6},
			],
			"columns": [
				"Sample Name",
                "Raw Spectral Data File",
                "Derived Spectral Data File",
                "Free Induction Decay Data File",
                "Acquisition Parameter Data File",
                "Parameter Value[Instrument]",
                "Data Transformation Name"

			],
			"data": {
				"Sample Name": ["123", "233", "333", "3332"],
				"Raw Spectral Data File": ["FILES/dataX.raw", "data2-da.raw", "FILES/da_ta3.raw", "FILES/data5A.raw"],
				"Derived Spectral Data File": ["FILES/derived_data1.raw", "FILES/de$rived_dataX.raw", "FILES/derived_data3.raw", "FILES/derived_data4.raw"],
				"Free Induction Decay Data File": ["FILES/fid_001.zip", "FILES/fid_0:01.zip", "FILES/fid_00x.zip", "FILES/fid_001.zip"],
				"Acquisition Parameter Data File": ["acqu_001.zip", "FILES/acqu+_001.zip", "FILES/acqu_001.zip", "FILES/acqu_00x.zip"],
				"Parameter Value[Instrument]": ["Metabolite Identification", "Metabolite Identification", "Metabolite Identification", "Metabolite Identification"],
				"Data Transformation Name": ["Metabolite Identification", "Metabolite Identification", "Metabolite Identification", "Metabolite Identification"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}



#########################################################################################################
# rule_f_400_100_001_02
#########################################################################################################


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
        "studyFolderMetadata": {
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
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Sample Name",  "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Raw Spectral Data File", "columnHeader": "Raw Spectral Data File","columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Derived Spectral Data File", "columnHeader": "Derived Spectral Data File","columnIndex": 2},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Free Induction Decay Data File",  "columnHeader": "Free Induction Decay Data File","columnIndex": 3},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Acquisition Parameter Data File", "columnHeader": "Acquisition Parameter Data File","columnIndex": 4},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Parameter Value[Instrument]", "columnHeader": "Parameter Value[Instrument]","columnIndex": 5},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Data Transformation Name", "columnHeader": "Data Transformation Name","columnIndex": 6},
			],
			"columns": [
				"Sample Name",
                "Raw Spectral Data File",
                "Derived Spectral Data File",
                "Free Induction Decay Data File",
                "Acquisition Parameter Data File",
                "Parameter Value[Instrument]",
                "Data Transformation Name"

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
        "studyFolderMetadata": {
            "files": {
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
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Sample Name",  "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Raw Spectral Data File", "columnHeader": "Raw Spectral Data File","columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Derived Spectral Data File", "columnHeader": "Derived Spectral Data File","columnIndex": 2},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Free Induction Decay Data File",  "columnHeader": "Free Induction Decay Data File","columnIndex": 3},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Acquisition Parameter Data File", "columnHeader": "Acquisition Parameter Data File","columnIndex": 4},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Parameter Value[Instrument]", "columnHeader": "Parameter Value[Instrument]","columnIndex": 5},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Data Transformation Name", "columnHeader": "Data Transformation Name","columnIndex": 6},
			],
			"columns": [
				"Sample Name",
                "Raw Spectral Data File",
                "Derived Spectral Data File",
                "Free Induction Decay Data File",
                "Acquisition Parameter Data File",
                "Parameter Value[Instrument]",
                "Data Transformation Name"

			]
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}

	count(result) == 1
}



#########################################################################################################
# rule_f_400_090_001_07
#########################################################################################################


# METADATA
# title: There are not multiple referenced files with same name on different folders
# description: There are not multiple referenced files with same name on different folders
test_rule_f_400_090_001_07_no_violation_01 if {
	result := rules.rule_f_400_090_001_07 with input as {
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
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Sample Name",  "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Raw Spectral Data File", "columnHeader": "Raw Spectral Data File","columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Derived Spectral Data File", "columnHeader": "Derived Spectral Data File","columnIndex": 2},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Free Induction Decay Data File",  "columnHeader": "Free Induction Decay Data File","columnIndex": 3},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Acquisition Parameter Data File", "columnHeader": "Acquisition Parameter Data File","columnIndex": 4},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Parameter Value[Instrument]", "columnHeader": "Parameter Value[Instrument]","columnIndex": 5},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Data Transformation Name", "columnHeader": "Data Transformation Name","columnIndex": 6},
			],
			"columns": [
				"Sample Name",
                "Raw Spectral Data File",
                "Derived Spectral Data File",
                "Free Induction Decay Data File",
                "Acquisition Parameter Data File",
                "Parameter Value[Instrument]",
                "Data Transformation Name"

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
test_rule_f_400_090_001_07_violation_01 if {
result := rules.rule_f_400_090_001_07 with input as {
        "studyFolderMetadata": {
            "folders": {
                "FILES/RAW_FILES/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw"},
            },
            "files": {
                "m_sample.tsv": {"sizeInBytes": 100, "baseName": "m_sample.tsv"},
                "a_sample.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv"},
                "m_sample.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv"},
                "i_Investigation.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv"},
                "FILES/RAW_FILES1/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw"},
                "FILES/RAW_FILES2/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw"},
                "FILES/RAW_FILES3/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw"},
                "FILES/derived_data1.raw": {"sizeInBytes": 100, "baseName": "derived_data1.raw"},
                "FILES/derived_data2.raw": {"sizeInBytes": 100, "baseName": "derived_data2.raw"},
                "FILES/derived_data3.raw": {"sizeInBytes": 100, "baseName": "derived_data3.raw"},
                "FILES/derived_data4.raw": {"sizeInBytes": 100, "baseName": "derived_data4.raw"},
                "FILES/fid_001.zip": {"sizeInBytes": 100, "baseName": "fid_001.zip"},
                "FILES/acqu_001.zip": {"sizeInBytes": 100, "baseName": "acqu_001.zip"},
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Sample Name",  "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Raw Spectral Data File", "columnHeader": "Raw Spectral Data File","columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Derived Spectral Data File", "columnHeader": "Derived Spectral Data File","columnIndex": 2},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Free Induction Decay Data File",  "columnHeader": "Free Induction Decay Data File","columnIndex": 3},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Acquisition Parameter Data File", "columnHeader": "Acquisition Parameter Data File","columnIndex": 4},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Parameter Value[Instrument]", "columnHeader": "Parameter Value[Instrument]","columnIndex": 5},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Data Transformation Name", "columnHeader": "Data Transformation Name","columnIndex": 6},
			],
			"columns": [
				"Sample Name",
                "Raw Spectral Data File",
                "Derived Spectral Data File",
                "Free Induction Decay Data File",
                "Acquisition Parameter Data File",
                "Parameter Value[Instrument]",
                "Data Transformation Name"

			],
			"data": {
				"Sample Name": ["1", "2", "3", "4"],
				"Raw Spectral Data File": ["FILES/RAW_FILES/data1.raw", "FILES/RAW_FILES1/data1.raw", "FILES/RAW_FILES2/data1.raw", "FILES/RAW_FILES3/data1.raw"],
				"Derived Spectral Data File": ["FILES/derived_data1.raw", "FILES/de$rived_dataX.raw", "FILES/derived_data3.raw", "FILES/derived_data4.raw"],
				"Free Induction Decay Data File": ["FILES/fid_001.zip", "FILES/fid_0:01.zip", "FILES/fid_00x.zip", "FILES/fid_001.zip"],
				"Acquisition Parameter Data File": ["acqu_001.zip", "FILES/acqu+_001.zip", "FILES/acqu_001.zip", "FILES/acqu_00x.zip"],
				"Parameter Value[Instrument]": ["Metabolite Identification", "Metabolite Identification", "Metabolite Identification", "Metabolite Identification"],
				"Data Transformation Name": ["Metabolite Identification", "Metabolite Identification", "Metabolite Identification", "Metabolite Identification"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}

	count(result) == 1
}



#########################################################################################################
# rule_f_400_090_001_08
#########################################################################################################


# METADATA
# title: There are not multiple referenced files with same name on different folders
# description: There are not multiple referenced files with same name on different folders
test_rule_f_400_090_001_08_no_violation_01 if {
	result := rules.rule_f_400_090_001_08 with input as {
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
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "NMR", "mainTechnique": "NMR"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Sample Name",  "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Raw Spectral Data File", "columnHeader": "Raw Spectral Data File","columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Derived Spectral Data File", "columnHeader": "Derived Spectral Data File","columnIndex": 2},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Free Induction Decay Data File",  "columnHeader": "Free Induction Decay Data File","columnIndex": 3},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Acquisition Parameter Data File", "columnHeader": "Acquisition Parameter Data File","columnIndex": 4},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Parameter Value[Instrument]", "columnHeader": "Parameter Value[Instrument]","columnIndex": 5},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Data Transformation Name", "columnHeader": "Data Transformation Name","columnIndex": 6},
			],
			"columns": [
				"Sample Name",
                "Raw Spectral Data File",
                "Derived Spectral Data File",
                "Free Induction Decay Data File",
                "Acquisition Parameter Data File",
                "Parameter Value[Instrument]",
                "Data Transformation Name"

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
test_rule_f_400_090_001_08_violation_01 if {
result := rules.rule_f_400_090_001_08 with input as {
        "studyFolderMetadata": {
            "folders": {
                "FILES/RAW_FILES/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw"},
            },
            "files": {
                "m_sample.tsv": {"sizeInBytes": 100, "baseName": "m_sample.tsv"},
                "a_sample.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv"},
                "m_sample.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv"},
                "i_Investigation.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv"},
                "FILES/RAW_FILES1/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw"},
                "FILES/RAW_FILES2/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw"},
                "FILES/RAW_FILES3/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw"},
                "FILES/derived_data1.raw": {"sizeInBytes": 100, "baseName": "derived_data1.raw"},
                "FILES/derived_data2.raw": {"sizeInBytes": 100, "baseName": "derived_data2.raw"},
                "FILES/derived_data3.raw": {"sizeInBytes": 100, "baseName": "derived_data3.raw"},
                "FILES/derived_data4.raw": {"sizeInBytes": 100, "baseName": "derived_data4.raw"},
                "FILES/0001/fid": {"sizeInBytes": 100, "baseName": "fid_001.zip"},
                "FILES/0001/acqu": {"sizeInBytes": 100, "baseName": "acqu_001.zip"},
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "NMR", "mainTechnique": "NMR"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Sample Name",  "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Raw Spectral Data File", "columnHeader": "Raw Spectral Data File","columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Derived Spectral Data File", "columnHeader": "Derived Spectral Data File","columnIndex": 2},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Free Induction Decay Data File",  "columnHeader": "Free Induction Decay Data File","columnIndex": 3},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Acquisition Parameter Data File", "columnHeader": "Acquisition Parameter Data File","columnIndex": 4},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Parameter Value[Instrument]", "columnHeader": "Parameter Value[Instrument]","columnIndex": 5},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Data Transformation Name", "columnHeader": "Data Transformation Name","columnIndex": 6},
			],
			"columns": [
				"Sample Name",
                "Raw Spectral Data File",
                "Derived Spectral Data File",
                "Free Induction Decay Data File",
                "Acquisition Parameter Data File",
                "Parameter Value[Instrument]",
                "Data Transformation Name"

			],
			"data": {
				"Sample Name": ["1", "2", "3", "4"],
				"Raw Spectral Data File": ["FILES/RAW_FILES/data1.raw", "FILES/RAW_FILES1/data1.raw", "FILES/RAW_FILES2/data1.raw", "FILES/RAW_FILES3/data1.raw"],
				"Derived Spectral Data File": ["FILES/derived_data1.raw", "FILES/de$rived_dataX.raw", "FILES/derived_data3.raw", "FILES/derived_data4.raw"],
				"Free Induction Decay Data File": ["FILES/0001/fid", "FILES/0001/fid", "FILES/0001/fid", "FILES/fid_001.zip"],
				"Acquisition Parameter Data File": ["FILES/0001/acqu", "FILES/0001/acqu", "FILES/0001/acqu", "FILES/0001/acqu"],
				"Parameter Value[Instrument]": ["Metabolite Identification", "Metabolite Identification", "Metabolite Identification", "Metabolite Identification"],
				"Data Transformation Name": ["Metabolite Identification", "Metabolite Identification", "Metabolite Identification", "Metabolite Identification"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}

	count(result) == 2
}




#########################################################################################################
# rule_f_400_090_001_09
#########################################################################################################


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
            }
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
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}

	count(result) == 1
	some item in result
	count(item.values) == 10
}


#########################################################################################################
# rule_f_400_100_001_03
#########################################################################################################


# METADATA
# title: Derived spectral data file is not referenced in any assay sheet.
# description: Derived spectral data file is not referenced in any assay sheet.
test_rule_f_400_100_001_03_no_violation_01 if {
	result := rules.rule_f_400_100_001_03 with input as {
        "studyFolderMetadata": {
            "folders": {},
            "files": {
                "m_sample.tsv": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".tsv"},
                "a_sample.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".txt"},
                "m_sample.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".txt"},
                "i_Investigation.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".txt"},
                "FILES/RAW_FILES1/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".raw"},
                "FILES/RAW_FILES2/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".raw"},
                "FILES/RAW_FILES3/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".raw"},
                "FILES/derived_data1.raw": {"sizeInBytes": 100, "baseName": "derived_data1.raw", "extension": ".raw"},
                "FILES/derived_data2.raw": {"sizeInBytes": 100, "baseName": "derived_data2.raw", "extension": ".raw"},
                "FILES/derived_data3.raw": {"sizeInBytes": 100, "baseName": "derived_data3.raw", "extension": ".raw"},
                "FILES/derived_data4.raw": {"sizeInBytes": 100, "baseName": "derived_data4.raw", "extension": ".raw"},
                "FILES/0001/fid": {"sizeInBytes": 100, "baseName": "fid_001.zip", "extension": ""},
                "FILES/0001/acqu": {"sizeInBytes": 100, "baseName": "acqu_001.zip", "extension": ""},
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "NMR", "mainTechnique": "NMR"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Sample Name",  "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Raw Spectral Data File", "columnHeader": "Raw Spectral Data File","columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Derived Spectral Data File", "columnHeader": "Derived Spectral Data File","columnIndex": 2},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Free Induction Decay Data File",  "columnHeader": "Free Induction Decay Data File","columnIndex": 3},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Acquisition Parameter Data File", "columnHeader": "Acquisition Parameter Data File","columnIndex": 4},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Parameter Value[Instrument]", "columnHeader": "Parameter Value[Instrument]","columnIndex": 5},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Data Transformation Name", "columnHeader": "Data Transformation Name","columnIndex": 6},
			],
			"columns": [
				"Sample Name",
                "Raw Spectral Data File",
                "Derived Spectral Data File",
                "Free Induction Decay Data File",
                "Acquisition Parameter Data File",
                "Parameter Value[Instrument]",
                "Data Transformation Name"

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
# title: Derived spectral data file is not referenced in any assay sheet.
# description: Derived spectral data file is not referenced in any assay sheet.
test_rule_f_400_100_001_03_violation_01 if {
result := rules.rule_f_400_100_001_03 with input as {
        "studyFolderMetadata": {
            "folders": {
                "FILES/RAW_FILES/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw"},
            },
            "files": {
                "m_sample.tsv": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".tsv"},
                "a_sample.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".txt"},
                "m_sample.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".txt"},
                "i_Investigation.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".txt"},
                "FILES/RAW_FILES1/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".raw"},
                "FILES/RAW_FILES2/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".raw"},
                "FILES/RAW_FILES3/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".raw"},
                "FILES/derived_data1.raw": {"sizeInBytes": 100, "baseName": "derived_data1.raw", "extension": ".raw"},
                "FILES/derived_data2.raw": {"sizeInBytes": 100, "baseName": "derived_data2.raw", "extension": ".raw"},
                "FILES/derived_data3.raw": {"sizeInBytes": 100, "baseName": "derived_data3.raw", "extension": ".raw"},
                "FILES/derived_data4.raw": {"sizeInBytes": 100, "baseName": "derived_data4.raw", "extension": ".raw"},
                "FILES/derived_data1.mzML": {"sizeInBytes": 100, "baseName": "derived_data1.mzML", "extension": ".mzml"},
                "FILES/derived_data3.mzData": {"sizeInBytes": 100, "baseName": "derived_data1.mzData", "extension": ".mzdata"},
                "FILES/0001/fid": {"sizeInBytes": 100, "baseName": "fid_001.zip", "extension": ""},
                "FILES/0001/acqu": {"sizeInBytes": 100, "baseName": "acqu_001.zip", "extension": ""},
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "NMR", "mainTechnique": "NMR"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Sample Name",  "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Raw Spectral Data File", "columnHeader": "Raw Spectral Data File","columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Derived Spectral Data File", "columnHeader": "Derived Spectral Data File","columnIndex": 2},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Free Induction Decay Data File",  "columnHeader": "Free Induction Decay Data File","columnIndex": 3},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Acquisition Parameter Data File", "columnHeader": "Acquisition Parameter Data File","columnIndex": 4},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Parameter Value[Instrument]", "columnHeader": "Parameter Value[Instrument]","columnIndex": 5},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Data Transformation Name", "columnHeader": "Data Transformation Name","columnIndex": 6},
			],
			"columns": [
				"Sample Name",
                "Raw Spectral Data File",
                "Derived Spectral Data File",
                "Free Induction Decay Data File",
                "Acquisition Parameter Data File",
                "Parameter Value[Instrument]",
                "Data Transformation Name"

			],
			"data": {
				"Sample Name": ["1", "2", "3", "4"],
				"Raw Spectral Data File": ["FILES/RAW_FILES/data1.raw", "FILES/RAW_FILES1/data1.raw", "FILES/RAW_FILES2/data1.raw", "FILES/RAW_FILES3/data1.raw"],
				"Derived Spectral Data File": ["FILES/derived_data1.raw", "FILES/de$rived_dataX.raw", "FILES/derived_data3.raw", "FILES/derived_data4.raw"],
				"Free Induction Decay Data File": ["FILES/0001/fid", "FILES/0001/fid", "FILES/0001/fid", "FILES/fid_001.zip"],
				"Acquisition Parameter Data File": ["FILES/0001/acqu", "FILES/0001/acqu", "FILES/0001/acqu", "FILES/0001/acqu"],
				"Parameter Value[Instrument]": ["Metabolite Identification", "Metabolite Identification", "Metabolite Identification", "Metabolite Identification"],
				"Data Transformation Name": ["Metabolite Identification", "Metabolite Identification", "Metabolite Identification", "Metabolite Identification"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}

	count(result) == 1
}



#########################################################################################################
# rule_f_400_100_001_04
#########################################################################################################


# METADATA
# title: Raw spectral data file is not referenced in any assay sheet.
# description: Raw spectral data file is not referenced in any assay sheet.
test_rule_f_400_100_001_04_no_violation_01 if {
	result := rules.rule_f_400_100_001_04 with input as {
        "studyFolderMetadata": {
            "folders": {},
            "files": {
            "files": {
                "m_sample.tsv": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".tsv"},
                "a_sample.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".txt"},
                "m_sample.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".txt"},
                "i_Investigation.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".txt"},
                "FILES/RAW_FILES1/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".raw"},
                "FILES/RAW_FILES2/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".raw"},
                "FILES/RAW_FILES3/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".raw"},
                "FILES/RAW_FILES3/data4.raw": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".raw"},
                "FILES/derived_data1.raw": {"sizeInBytes": 100, "baseName": "derived_data1.raw", "extension": ".raw"},
                "FILES/derived_data2.raw": {"sizeInBytes": 100, "baseName": "derived_data2.raw", "extension": ".raw"},
                "FILES/derived_data3.raw": {"sizeInBytes": 100, "baseName": "derived_data3.raw", "extension": ".raw"},
                "FILES/derived_data4.raw": {"sizeInBytes": 100, "baseName": "derived_data4.raw", "extension": ".raw"},
                "FILES/derived_data1.mzML": {"sizeInBytes": 100, "baseName": "derived_data1.mzML", "extension": ".mzml"},
                "FILES/derived_data3.mzData": {"sizeInBytes": 100, "baseName": "derived_data1.mzData", "extension": ".mzdata"},
                "FILES/0001/fid": {"sizeInBytes": 100, "baseName": "fid_001.zip", "extension": ""},
                "FILES/0001/acqu": {"sizeInBytes": 100, "baseName": "acqu_001.zip", "extension": ""},
            }
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "NMR", "mainTechnique": "NMR"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Sample Name",  "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Raw Spectral Data File", "columnHeader": "Raw Spectral Data File","columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Derived Spectral Data File", "columnHeader": "Derived Spectral Data File","columnIndex": 2},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Free Induction Decay Data File",  "columnHeader": "Free Induction Decay Data File","columnIndex": 3},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Acquisition Parameter Data File", "columnHeader": "Acquisition Parameter Data File","columnIndex": 4},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Parameter Value[Instrument]", "columnHeader": "Parameter Value[Instrument]","columnIndex": 5},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Data Transformation Name", "columnHeader": "Data Transformation Name","columnIndex": 6},
			],
			"columns": [
				"Sample Name",
                "Raw Spectral Data File",
                "Derived Spectral Data File",
                "Free Induction Decay Data File",
                "Acquisition Parameter Data File",
                "Parameter Value[Instrument]",
                "Data Transformation Name"

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
# title: Raw spectral data file is not referenced in any assay sheet.
# description: Raw spectral data file is not referenced in any assay sheet.
test_rule_f_400_100_001_04_violation_01 if {
result := rules.rule_f_400_100_001_04 with input as {
        "studyFolderMetadata": {
            "folders": {
                "FILES/RAW_FILES/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw"},
            },
            "files": {
                "m_sample.tsv": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".tsv"},
                "a_sample.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".txt"},
                "m_sample.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".txt"},
                "i_Investigation.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".txt"},
                "FILES/RAW_FILES1/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".raw"},
                "FILES/RAW_FILES2/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".raw"},
                "FILES/RAW_FILES3/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".raw"},
                "FILES/RAW_FILES3/data4.raw": {"sizeInBytes": 100, "baseName": "data4.raw", "extension": ".raw"},
                "FILES/RAW_FILES3/data4.mgf": {"sizeInBytes": 100, "baseName": "data4.raw", "extension": ".mgf"},
                "FILES/RAW_FILES3/data4.cdf": {"sizeInBytes": 100, "baseName": "data4.raw", "extension": ".cdf"},
                "FILES/derived_data1.raw": {"sizeInBytes": 100, "baseName": "derived_data1.raw", "extension": ".raw"},
                "FILES/derived_data2.raw": {"sizeInBytes": 100, "baseName": "derived_data2.raw", "extension": ".raw"},
                "FILES/derived_data3.raw": {"sizeInBytes": 100, "baseName": "derived_data3.raw", "extension": ".raw"},
                "FILES/derived_data4.raw": {"sizeInBytes": 100, "baseName": "derived_data4.raw", "extension": ".raw"},
                "FILES/derived_data1.mzML": {"sizeInBytes": 100, "baseName": "derived_data1.mzML", "extension": ".mzml"},
                "FILES/derived_data3.mzData": {"sizeInBytes": 100, "baseName": "derived_data1.mzData", "extension": ".mzdata"},
                "FILES/0001/fid": {"sizeInBytes": 100, "baseName": "fid_001.zip", "extension": ""},
                "FILES/0001/acqu": {"sizeInBytes": 100, "baseName": "acqu_001.zip", "extension": ""},
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "NMR", "mainTechnique": "NMR"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Sample Name",  "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Raw Spectral Data File", "columnHeader": "Raw Spectral Data File","columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Derived Spectral Data File", "columnHeader": "Derived Spectral Data File","columnIndex": 2},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Free Induction Decay Data File",  "columnHeader": "Free Induction Decay Data File","columnIndex": 3},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Acquisition Parameter Data File", "columnHeader": "Acquisition Parameter Data File","columnIndex": 4},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Parameter Value[Instrument]", "columnHeader": "Parameter Value[Instrument]","columnIndex": 5},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Data Transformation Name", "columnHeader": "Data Transformation Name","columnIndex": 6},
			],
			"columns": [
				"Sample Name",
                "Raw Spectral Data File",
                "Derived Spectral Data File",
                "Free Induction Decay Data File",
                "Acquisition Parameter Data File",
                "Parameter Value[Instrument]",
                "Data Transformation Name"

			],
			"data": {
				"Sample Name": ["1", "2", "3", "4"],
				"Raw Spectral Data File": ["FILES/RAW_FILES/data1.raw", "FILES/RAW_FILES1/data1.raw", "FILES/RAW_FILES2/data1.raw", "FILES/RAW_FILES3/data1.raw"],
				"Derived Spectral Data File": ["FILES/derived_data1.raw", "FILES/de$rived_dataX.raw", "FILES/derived_data3.raw", "FILES/derived_data4.raw"],
				"Free Induction Decay Data File": ["FILES/0001/fid", "FILES/0001/fid", "FILES/0001/fid", "FILES/fid_001.zip"],
				"Acquisition Parameter Data File": ["FILES/0001/acqu", "FILES/0001/acqu", "FILES/0001/acqu", "FILES/0001/acqu"],
				"Parameter Value[Instrument]": ["Metabolite Identification", "Metabolite Identification", "Metabolite Identification", "Metabolite Identification"],
				"Data Transformation Name": ["Metabolite Identification", "Metabolite Identification", "Metabolite Identification", "Metabolite Identification"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}

	count(result) == 1
}


#########################################################################################################
# rule_f_400_090_002_01
#########################################################################################################


# METADATA
# title: All referenced raw file are on RAW_FILES folder.
# description: All referenced raw file are on RAW_FILES folder.
test_rule_f_400_090_002_01_no_violation_01 if {
	result := rules.rule_f_400_090_002_01 with input as {
        "studyFolderMetadata": {
            "files": {
                "FILES/data1.raw": {},
                "FILES/data2.raw": {},
                "FILES/data3.raw": {},
                "FILES/data4.raw": {},
                "FILES/derived_data1.raw": {},
                "FILES/derived_data2.raw": {},
                "FILES/derived_data3.raw": {},
                "FILES/derived_data4.raw": {},
                "FILES/fid_001.zip": {},
                "FILES/acqu_001.zip": {}
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Sample Name",  "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Raw Spectral Data File", "columnHeader": "Raw Spectral Data File","columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Derived Spectral Data File", "columnHeader": "Derived Spectral Data File","columnIndex": 2},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Free Induction Decay Data File",  "columnHeader": "Free Induction Decay Data File","columnIndex": 3},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Acquisition Parameter Data File", "columnHeader": "Acquisition Parameter Data File","columnIndex": 4},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Parameter Value[Instrument]", "columnHeader": "Parameter Value[Instrument]","columnIndex": 5},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Data Transformation Name", "columnHeader": "Data Transformation Name","columnIndex": 6},
			],
			"columns": [
				"Sample Name",
                "Raw Spectral Data File",
                "Derived Spectral Data File",
                "Free Induction Decay Data File",
                "Acquisition Parameter Data File",
                "Parameter Value[Instrument]",
                "Data Transformation Name"

			],
			"data": {
				"Sample Name": ["1", "2", "3", "4"],
				"Raw Spectral Data File": ["FILES/RAW_FILES/data1.raw", "FILES/RAW_FILES/data2.raw", "FILES/RAW_FILES/data3.raw", ""],
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
# title: A referenced raw file is not on RAW_FILES folder.
# description: A referenced raw file is not on RAW_FILES folder.
test_rule_f_400_090_002_01_violation_01 if {
result := rules.rule_f_400_090_002_01 with input as {
        "studyFolderMetadata": {
            "files": {
                "FILES/data1.raw": {},
                "FILES/data2.raw": {},
                "FILES/data3.raw": {},
                "FILES/data4.raw": {},
                "FILES/derived_data1.raw": {},
                "FILES/derived_data2.raw": {},
                "FILES/derived_data3.raw": {},
                "FILES/derived_data4.raw": {},
                "FILES/fid_001.zip": {},
                "FILES/acqu_001.zip": {}
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Sample Name",  "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Raw Spectral Data File", "columnHeader": "Raw Spectral Data File","columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Derived Spectral Data File", "columnHeader": "Derived Spectral Data File","columnIndex": 2},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Free Induction Decay Data File",  "columnHeader": "Free Induction Decay Data File","columnIndex": 3},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Acquisition Parameter Data File", "columnHeader": "Acquisition Parameter Data File","columnIndex": 4},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Parameter Value[Instrument]", "columnHeader": "Parameter Value[Instrument]","columnIndex": 5},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Data Transformation Name", "columnHeader": "Data Transformation Name","columnIndex": 6},
			],
			"columns": [
				"Sample Name",
                "Raw Spectral Data File",
                "Derived Spectral Data File",
                "Free Induction Decay Data File",
                "Acquisition Parameter Data File",
                "Parameter Value[Instrument]",
                "Data Transformation Name"

			],
			"data": {
				"Sample Name": ["1", "2", "3", "4"],
				"Raw Spectral Data File": ["FILES/dataX.raw", "FILES/RAW_FILES/data2.raw", "FILES/data3.raw", "FILES/data4.raw"],
				"Derived Spectral Data File": ["FILES/derived_data1.raw", "FILES/derived_dataX.raw", "FILES/derived_data3.raw", "FILES/derived_data4.raw"],
				"Free Induction Decay Data File": ["FILES/fid_001.zip", "FILES/fid_001.zip", "FILES/fid_00x.zip", "FILES/fid_001.zip"],
				"Acquisition Parameter Data File": ["FILES/acqu_001.zip", "FILES/acqu_001.zip", "FILES/acqu_001.zip", "FILES/acqu_00x.zip"],
				"Parameter Value[Instrument]": ["Metabolite Identification", "Metabolite Identification", "Metabolite Identification", "Metabolite Identification"],
				"Data Transformation Name": ["Metabolite Identification", "Metabolite Identification", "Metabolite Identification", "Metabolite Identification"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}

	count(result) == 1
}




#########################################################################################################
# rule_f_400_090_003_01
#########################################################################################################


# METADATA
# title: All referenced raw file are on DERIVED_FILES folder.
# description: All referenced raw file are on DERIVED_FILES folder.
test_rule_f_400_090_003_01_no_violation_01 if {
	result := rules.rule_f_400_090_003_01 with input as {
        "studyFolderMetadata": {
            "files": {
                "FILES/data1.raw": {},
                "FILES/data2.raw": {},
                "FILES/data3.raw": {},
                "FILES/data4.raw": {},
                "FILES/derived_data1.raw": {},
                "FILES/derived_data2.raw": {},
                "FILES/derived_data3.raw": {},
                "FILES/derived_data4.raw": {},
                "FILES/fid_001.zip": {},
                "FILES/acqu_001.zip": {}
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Sample Name",  "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Raw Spectral Data File", "columnHeader": "Raw Spectral Data File","columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Derived Spectral Data File", "columnHeader": "Derived Spectral Data File","columnIndex": 2},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Free Induction Decay Data File",  "columnHeader": "Free Induction Decay Data File","columnIndex": 3},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Acquisition Parameter Data File", "columnHeader": "Acquisition Parameter Data File","columnIndex": 4},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Parameter Value[Instrument]", "columnHeader": "Parameter Value[Instrument]","columnIndex": 5},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Data Transformation Name", "columnHeader": "Data Transformation Name","columnIndex": 6},
			],
			"columns": [
				"Sample Name",
                "Raw Spectral Data File",
                "Derived Spectral Data File",
                "Free Induction Decay Data File",
                "Acquisition Parameter Data File",
                "Parameter Value[Instrument]",
                "Data Transformation Name"

			],
			"data": {
				"Sample Name": ["1", "2", "3", "4"],
				"Raw Spectral Data File": ["FILES/RAW_FILES/data1.raw", "FILES/RAW_FILES/data2.raw", "FILES/RAW_FILES/data3.raw", "FILES/RAW_FILES/data4.raw"],
				"Derived Spectral Data File": ["FILES/DERIVED_FILES/derived_data1.raw", "FILES/DERIVED_FILES/derived_data2.raw", "FILES/DERIVED_FILES/derived_data3.raw", "FILES/DERIVED_FILES/derived_data4.raw"],
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
# title: A referenced derived file is not on DERIVED_FILES folder.
# description: A referenced derived file is not on DERIVED_FILES folder.
test_rule_f_400_090_003_01_violation_01 if {
result := rules.rule_f_400_090_003_01 with input as {
        "studyFolderMetadata": {
            "files": {
                "FILES/data1.raw": {},
                "FILES/data2.raw": {},
                "FILES/data3.raw": {},
                "FILES/data4.raw": {},
                "FILES/derived_data1.raw": {},
                "FILES/derived_data2.raw": {},
                "FILES/derived_data3.raw": {},
                "FILES/derived_data4.raw": {},
                "FILES/fid_001.zip": {},
                "FILES/acqu_001.zip": {}
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "LC-MS"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Sample Name",  "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Raw Spectral Data File", "columnHeader": "Raw Spectral Data File","columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Derived Spectral Data File", "columnHeader": "Derived Spectral Data File","columnIndex": 2},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Free Induction Decay Data File",  "columnHeader": "Free Induction Decay Data File","columnIndex": 3},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Acquisition Parameter Data File", "columnHeader": "Acquisition Parameter Data File","columnIndex": 4},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Parameter Value[Instrument]", "columnHeader": "Parameter Value[Instrument]","columnIndex": 5},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Data Transformation Name", "columnHeader": "Data Transformation Name","columnIndex": 6},
			],
			"columns": [
				"Sample Name",
                "Raw Spectral Data File",
                "Derived Spectral Data File",
                "Free Induction Decay Data File",
                "Acquisition Parameter Data File",
                "Parameter Value[Instrument]",
                "Data Transformation Name"

			],
			"data": {
				"Sample Name": ["1", "2", "3", "4"],
				"Raw Spectral Data File": ["FILES/dataX.raw", "FILES/RAW_FILES/data2.raw", "FILES/data3.raw", "FILES/data4.raw"],
				"Derived Spectral Data File": ["FILES/derived_data1.raw", "FILES/DERIVED_FILES/derived_dataX.raw", "FILES/DERIVED_FILES/derived_data3.raw", "FILES/derived_data4.raw"],
				"Free Induction Decay Data File": ["FILES/fid_001.zip", "FILES/fid_001.zip", "FILES/fid_00x.zip", "FILES/fid_001.zip"],
				"Acquisition Parameter Data File": ["FILES/acqu_001.zip", "FILES/acqu_001.zip", "FILES/acqu_001.zip", "FILES/acqu_00x.zip"],
				"Parameter Value[Instrument]": ["Metabolite Identification", "Metabolite Identification", "Metabolite Identification", "Metabolite Identification"],
				"Data Transformation Name": ["Metabolite Identification", "Metabolite Identification", "Metabolite Identification", "Metabolite Identification"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}

	count(result) == 1
}


#########################################################################################################
# rule_f_400_100_001_05
#########################################################################################################


# METADATA
# title: Data files without .aspx extensions within study FILES folder.
# description: Data files without .aspx extensions within study FILES folder.
test_rule_f_400_100_001_05_no_violation_01 if {
	result := rules.rule_f_400_100_001_05 with input as {
        "studyFolderMetadata": {
            "folders": {},
            "files": {
            "files": {
                "m_sample.tsv": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".tsv"},
                "a_sample.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".txt"},
                "m_sample.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".txt"},
                "i_Investigation.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".txt"},
                "FILES/RAW_FILES1/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".raw"},
                "FILES/RAW_FILES2/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".raw"},
                "FILES/RAW_FILES3/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".raw"},
                "FILES/RAW_FILES3/data4.raw": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".raw"},
                "FILES/derived_data1.raw": {"sizeInBytes": 100, "baseName": "derived_data1.raw", "extension": ".raw"},
                "FILES/derived_data2.raw": {"sizeInBytes": 100, "baseName": "derived_data2.raw", "extension": ".raw"},
                "FILES/derived_data3.raw": {"sizeInBytes": 100, "baseName": "derived_data3.raw", "extension": ".raw"},
                "FILES/derived_data4.raw": {"sizeInBytes": 100, "baseName": "derived_data4.raw", "extension": ".raw"},
                "FILES/derived_data1.mzML": {"sizeInBytes": 100, "baseName": "derived_data1.mzML", "extension": ".mzml"},
                "FILES/derived_data3.mzData": {"sizeInBytes": 100, "baseName": "derived_data1.mzData", "extension": ".mzdata"},
                "FILES/0001/fid": {"sizeInBytes": 100, "baseName": "fid_001.zip", "extension": ""},
                "FILES/0001/acqu": {"sizeInBytes": 100, "baseName": "acqu_001.zip", "extension": ""},
            }
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "NMR", "mainTechnique": "NMR"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Sample Name",  "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Raw Spectral Data File", "columnHeader": "Raw Spectral Data File","columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Derived Spectral Data File", "columnHeader": "Derived Spectral Data File","columnIndex": 2},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Free Induction Decay Data File",  "columnHeader": "Free Induction Decay Data File","columnIndex": 3},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Acquisition Parameter Data File", "columnHeader": "Acquisition Parameter Data File","columnIndex": 4},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Parameter Value[Instrument]", "columnHeader": "Parameter Value[Instrument]","columnIndex": 5},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Data Transformation Name", "columnHeader": "Data Transformation Name","columnIndex": 6},
			],
			"columns": [
				"Sample Name",
                "Raw Spectral Data File",
                "Derived Spectral Data File",
                "Free Induction Decay Data File",
                "Acquisition Parameter Data File",
                "Parameter Value[Instrument]",
                "Data Transformation Name"

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
# title: Data files with .aspx extensions within study FILES folder.
# description: Data files with .aspx extensions within study FILES folder.
test_rule_f_400_100_001_05_violation_01 if {
result := rules.rule_f_400_100_001_05 with input as {
        "studyFolderMetadata": {
            "folders": {
                "FILES/RAW_FILES/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw"},
            },
            "files": {
                "m_sample.tsv": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".tsv"},
                "a_sample.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".txt"},
                "m_sample.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".txt"},
                "i_Investigation.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".txt"},
                "FILES/RAW_FILES1/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".raw"},
                "FILES/RAW_FILES2/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".raw"},
                "FILES/RAW_FILES3/data1.raw": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".raw"},
                "FILES/RAW_FILES3/data4.raw.aspx": {"sizeInBytes": 100, "baseName": "data4.raw", "extension": ".aspx"},
                "FILES/RAW_FILES3/data4.mgf.aspx": {"sizeInBytes": 100, "baseName": "data4.raw", "extension": ".aspx"},
                "FILES/RAW_FILES3/data4.cdf": {"sizeInBytes": 100, "baseName": "data4.raw", "extension": ".cdf"},
                "FILES/derived_data1.raw": {"sizeInBytes": 100, "baseName": "derived_data1.raw", "extension": ".raw"},
                "FILES/derived_data2.raw": {"sizeInBytes": 100, "baseName": "derived_data2.raw", "extension": ".raw"},
                "FILES/derived_data3.raw": {"sizeInBytes": 100, "baseName": "derived_data3.raw", "extension": ".raw"},
                "FILES/derived_data4.raw": {"sizeInBytes": 100, "baseName": "derived_data4.raw", "extension": ".raw"},
                "FILES/derived_data1.mzML": {"sizeInBytes": 100, "baseName": "derived_data1.mzML", "extension": ".mzml"},
                "FILES/derived_data3.mzData": {"sizeInBytes": 100, "baseName": "derived_data1.mzData", "extension": ".mzdata"},
                "FILES/0001/fid": {"sizeInBytes": 100, "baseName": "fid_001.zip", "extension": ""},
                "FILES/0001/acqu": {"sizeInBytes": 100, "baseName": "acqu_001.zip", "extension": ""},
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"assays": {"a_MTBLS1.txt": {"assayTechnique": {"name": "NMR", "mainTechnique": "NMR"}, "table": {
			"rowOffset": 0, "totalRowCount": 4,
			"headers": [
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Sample Name",  "columnHeader": "Sample Name", "columnIndex": 0},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Raw Spectral Data File", "columnHeader": "Raw Spectral Data File","columnIndex": 1},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Derived Spectral Data File", "columnHeader": "Derived Spectral Data File","columnIndex": 2},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Free Induction Decay Data File",  "columnHeader": "Free Induction Decay Data File","columnIndex": 3},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Acquisition Parameter Data File", "columnHeader": "Acquisition Parameter Data File","columnIndex": 4},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Parameter Value[Instrument]", "columnHeader": "Parameter Value[Instrument]","columnIndex": 5},
				{"columnCategory": "", "columnStructure": "SINGLE_COLUMN", "columnName": "Data Transformation Name", "columnHeader": "Data Transformation Name","columnIndex": 6},
			],
			"columns": [
				"Sample Name",
                "Raw Spectral Data File",
                "Derived Spectral Data File",
                "Free Induction Decay Data File",
                "Acquisition Parameter Data File",
                "Parameter Value[Instrument]",
                "Data Transformation Name"

			],
			"data": {
				"Sample Name": ["1", "2", "3", "4"],
				"Raw Spectral Data File": ["FILES/RAW_FILES/data1.raw", "FILES/RAW_FILES1/data1.raw", "FILES/RAW_FILES2/data1.raw", "FILES/RAW_FILES3/data1.raw"],
				"Derived Spectral Data File": ["FILES/derived_data1.raw", "FILES/de$rived_dataX.raw", "FILES/derived_data3.raw", "FILES/derived_data4.raw"],
				"Free Induction Decay Data File": ["FILES/0001/fid", "FILES/0001/fid", "FILES/0001/fid", "FILES/fid_001.zip"],
				"Acquisition Parameter Data File": ["FILES/0001/acqu", "FILES/0001/acqu", "FILES/0001/acqu", "FILES/0001/acqu"],
				"Parameter Value[Instrument]": ["Metabolite Identification", "Metabolite Identification", "Metabolite Identification", "Metabolite Identification"],
				"Data Transformation Name": ["Metabolite Identification", "Metabolite Identification", "Metabolite Identification", "Metabolite Identification"],
			},
		}}},
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}

	count(result) == 1
}



#########################################################################################################
# rule_f_400_100_001_06
#########################################################################################################


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
            }
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
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}




#########################################################################################################
# rule_f_400_100_001_07
#########################################################################################################


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
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": { "assays": [ { "fileName": "a_MTBLS1.txt"} ]}}]},
		"assays": { "a_MTBLS1.txt": { "referencedAssignmentFiles": ["m_MTBLS1.tsv"]}},
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
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt", "studyAssays": { "assays": [ { "fileName": "a_MTBLS1.txt"} ]}}]},
		"assays": { "a_MTBLS1.txt": { "referencedAssignmentFiles": ["m_MTBLS1.tsv"]}},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	count(result) == 1
}


#########################################################################################################
# rule_f_400_100_001_08
#########################################################################################################


# METADATA
# title: Data files with .imzML extensions but no data files with .ibd extensions within study FILES folder.
# description: Data files with .ibd extensions often accompany data files with .imzML extensions within study FILES folder. Check referenced data files and re-upload.
test_rule_f_400_100_001_08_no_violation_01 if {
	result := rules.rule_f_400_100_001_08 with input as {
        "studyFolderMetadata": {
            "folders": {},
            "files": {
                "m_sample.tsv": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".tsv"},
                "a_sample.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".txt"},
                "m_sample.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".txt"},
                "i_Investigation.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".txt"},
                "FILES/RAW_FILES1/data1.imzML": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".imzML"},
                "FILES/RAW_FILES1/data1.ibd": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".ibd"},
                "FILES/derived_data1.raw": {"sizeInBytes": 100, "baseName": "derived_data1.raw", "extension": ".raw"},
                "FILES/derived_data2.raw": {"sizeInBytes": 100, "baseName": "derived_data2.raw", "extension": ".raw"},
                "FILES/derived_data3.raw": {"sizeInBytes": 100, "baseName": "derived_data3.raw", "extension": ".raw"},
                "FILES/derived_data4.raw": {"sizeInBytes": 100, "baseName": "derived_data4.raw", "extension": ".raw"},
                "FILES/derived_data1.mzML": {"sizeInBytes": 100, "baseName": "derived_data1.mzML", "extension": ".mzml"},
                "FILES/derived_data3.mzData": {"sizeInBytes": 100, "baseName": "derived_data1.mzData", "extension": ".mzdata"},
                "FILES/0001/fid": {"sizeInBytes": 100, "baseName": "fid_001.zip", "extension": ""},
                "FILES/0001/acqu": {"sizeInBytes": 100, "baseName": "acqu_001.zip", "extension": ""},
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	
	count(result) == 0
}


# METADATA
# title: Data files with .imzML extensions but no data files with .ibd extensions within study FILES folder.
# description: Data files with .ibd extensions often accompany data files with .imzML extensions within study FILES folder. Check referenced data files and re-upload.
test_rule_f_400_100_001_08_violation_01 if {
	result := rules.rule_f_400_100_001_08 with input as {
        "studyFolderMetadata": {
            "folders": {},
            "files": {
                "m_sample.tsv": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".tsv"},
                "a_sample.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".txt"},
                "m_sample.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".txt"},
                "i_Investigation.txt": {"sizeInBytes": 100, "baseName": "m_sample.tsv", "extension": ".txt"},
                "FILES/RAW_FILES1/data1.imzML": {"sizeInBytes": 100, "baseName": "data1.raw", "extension": ".imzML"},
                "FILES/derived_data1.raw": {"sizeInBytes": 100, "baseName": "derived_data1.raw", "extension": ".raw"},
                "FILES/derived_data2.raw": {"sizeInBytes": 100, "baseName": "derived_data2.raw", "extension": ".raw"},
                "FILES/derived_data3.raw": {"sizeInBytes": 100, "baseName": "derived_data3.raw", "extension": ".raw"},
                "FILES/derived_data4.raw": {"sizeInBytes": 100, "baseName": "derived_data4.raw", "extension": ".raw"},
                "FILES/derived_data1.mzML": {"sizeInBytes": 100, "baseName": "derived_data1.mzML", "extension": ".mzml"},
                "FILES/derived_data3.mzData": {"sizeInBytes": 100, "baseName": "derived_data1.mzData", "extension": ".mzdata"},
                "FILES/0001/fid": {"sizeInBytes": 100, "baseName": "fid_001.zip", "extension": ""},
                "FILES/0001/acqu": {"sizeInBytes": 100, "baseName": "acqu_001.zip", "extension": ""},
            }
        },
		"investigationFilePath": "i_Investigation.txt",
		"investigation": {"studies": [{"fileName": "s_MTBLS1.txt"}]},
		"parserMessages": {"s_MTBLS1.txt": []},
	}
	
	count(result) == 1
}

