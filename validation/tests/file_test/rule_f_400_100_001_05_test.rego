# Unit tests for rule_f_400_100_001_05
package tests.file_test
import data.metabolights.validation.v2.rules.phase4.violations as rules

import rego.v1
# import data.<target rules package> as rules
# METADATA
# title: Data files with .aspx extensions within study FILES folder.
# description: Data files with .aspx extensions must not exist within study FILES folder. Check Aspera upload completed successfully.
# custom:
#  rule_id: rule_f_400_100_001_05
#  type: ERROR
#  priority: CRITICAL
#  section: files.general
test_rule_f_400_100_001_05 := true

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
