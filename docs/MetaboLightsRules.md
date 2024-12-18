| # |RULE ID              | TYPE                | TITLE                    | DESCRIPTION                  |
|---|---------------------|---------------------|--------------------------|------------------------------|
| 1 | rule___100_100_001_01 | ERROR | There is no input data. | There is no input. |
| 2 | rule___100_100_001_02 | ERROR | Input data format is not valid. | Input data should have valid schema. |
| 3 | rule___100_100_100_01 | ERROR | There is a critical file parse error for i_Investigation.txt. | Update i_Investigation.txt file considering error messages. |
| 4 | rule___100_100_100_02 | ERROR | There is a file parse error for i_Investigation.txt. | Update i_Investigation.txt file considering error messages. |
| 5 | rule___100_100_100_04 | ERROR | Investigation file name is not i_Investigation.txt | Update investigation name as i_Investigation.txt |
| 6 | rule___100_100_100_05 | ERROR | There is no parser information for i_Investigation.txt. | Define i_Investigation.txt in parserMessages. |
| 7 | rule___100_100_100_06 | ERROR | Unreferenced investigation files. | Delete multiple investigation file within study folder. |
| 8 | rule___100_200_001_01 | ERROR | There is a critical file parse error for the sample file. | There is a critical file parse error in the sample file. |
| 9 | rule___100_200_001_02 | ERROR | There is a file parse error for the sample file. | There is a file parse error for the sample file. |
| 10 | rule___100_200_001_04 | ERROR | There is no parser information for sample file. | Define sample file in parserMessages. |
| 11 | rule___100_200_001_05 | ERROR | There is no sample file for the study. | Define a sample file for the study. |
| 12 | rule___100_200_001_06 | ERROR | There are multiple sample files. | Define only one sample file for the study. |
| 13 | rule___100_200_001_08 | ERROR | Sample file name not correct pattern. | Sample file name must start with 's_', contain study identifer and have extension '.txt'. |
| 14 | rule___100_200_001_09 | ERROR | Sample file is not referenced in i_Investigation.txt file. | Update i_Investigation.txt  file to reference the sample file or delete it. |
| 15 | rule___100_300_001_01 | ERROR | There is a critical file parse error for the assay file. | There is a critical file parse error in the assay file. |
| 16 | rule___100_300_001_02 | ERROR | There is a file parse error for the assay file. | There is a file parse error for the assay file. |
| 17 | rule___100_300_001_04 | ERROR | There is no parser information for assay file. | Define assay file in parserMessages. |
| 18 | rule___100_300_001_05 | ERROR | There is no assay file for the study. | Define an assay file for the study. |
| 19 | rule___100_300_001_06 | ERROR | Technology type not defined for assay file. | Assay file technology type should be defined to execute validation rules. |
| 20 | rule___100_300_001_07 | ERROR | Technology type not supported for assay file. | Assay file technology type is not supported. |
| 21 | rule___100_300_001_08 | ERROR | Assay file name not correct pattern. | Assay file name must start with 'a_' and have extension '.txt'. |
| 22 | rule___100_300_001_09 | ERROR | Assay file is not referenced in i_Investigation.txt file. | Update i_Investigation.txt  file to reference the assay file or delete it. |
| 23 | rule___100_300_001_10 | ERROR | There are invalid characters in assay file name. | Use only .- _A-Za-z0-9 characters for an metabolite assignment file name. |
| 24 | rule___100_400_001_01 | ERROR | There is a critical file parse error for the metabolite assignment file. | There is a critical file parse error in the metabolite assignment file. |
| 25 | rule___100_400_001_02 | ERROR | There is a file parse error for the metabolite assignment file. | There is a file parse error for the metabolite assignment file. |
| 26 | rule___100_400_001_04 | ERROR | There is no parser information for metabolite assignment file. | Define metabolite assignment file in parserMessages. |
| 27 | rule___100_400_001_05 | ERROR | Technology type not defined for metabolite assignment file. | Assignment file technology type should be defined to execute file type validation rules. |
| 28 | rule___100_400_001_06 | ERROR | Metabolite assignment file is not referenced in assay file(s). | Update assay files to reference the metabolite assignement or delete it. |
| 29 | rule___100_400_001_07 | ERROR | Metabolite assignment file name not correct pattern. | Metabolite assignment file name must start with 'm_' and have extension '.tsv'. |
| 30 | rule___100_400_001_08 | ERROR | There are invalid characters in metabolite assignment file name. | Use only .- _A-Za-z0-9 characters for an metabolite assignment file name. |
| 31 | rule_a_100_100_001_01 | ERROR | Invalid multi-column structure in assay file. | There is an invalid multi-column structure in assay file. Check column order. |
| 32 | rule_a_100_100_001_02 | ERROR | Unordered or unlinked column structure in assay file. | There is an unordered or unlinked column in assay file. Check column order. |
| 33 | rule_a_100_100_001_03 | ERROR | Default columns not in assay file. | Default columns must exist in assay file. |
| 34 | rule_a_100_100_001_04 | ERROR | Unexpected column in assay file. | Rename or remove unexpected columns in assay file. |
| 35 | rule_a_100_100_001_05 | ERROR | Unexpected 'Protocol REF' column in assay file. | Unexpected 'Protocol REF' column in assay file. Only one 'Protocol REF' header is allowed in assay file. |
| 36 | rule_a_100_100_001_06 | ERROR | Missing 'Protocol REF' column in assay file. | Add missing Protocol REF column or related protocol section. |
| 37 | rule_a_100_100_001_07 | ERROR | Empty columns in assay file. | Empty columns must not exist in assay file. All column headers should be defined. |
| 38 | rule_a_100_100_001_08 | ERROR | Order of default column header is not correct in assay file. | Order of default column header is not correct in assay file. |
| 39 | rule_a_100_100_001_11 | ERROR | Assay Parameter Values names not in investigation file. | Assay Parameter Value names must be referenced in i_Investigation.txt. |
| 40 | rule_a_100_100_002_01 | ERROR | Assay file not referenced in investigation file. | Assay file must be referenced in i_Investigation.txt. |
| 41 | rule_a_100_100_005_01 | ERROR | There is no row in assay file. | No row is defined in assay file. Add more than one row (run). Please ensure all xxx, including controls, QCs, standards, etc, are referenced. |
| 42 | rule_a_100_100_005_02 | ERROR | There is only one row in assay file. | Only one row is defined in assay file. Add more than one row (run). Please ensure all xxx, including controls, QCs, standards, etc, are referenced. |
| 43 | rule_a_200_090_001_01 | ERROR | Values with trailing or leading spaces in assay file. | Values in assay file should not start or end with space characters. |
| 44 | rule_a_200_090_004_02 | ERROR | Values do not meet minimum length requirement. | Each row should have a value equal or greater than the minimum length. |
| 45 | rule_a_200_090_004_03 | ERROR | Values do not meet maximum length requirement. | Each row should have a value equal or less than the maximum length. |
| 46 | rule_a_200_090_005_01 | ERROR | Values for Protocol REF column not valid in assay file. | All rows should be filled with the same value (case sensitive). |
| 47 | rule_a_200_100_001_01 | ERROR | Values for Sample Name column not in sample file. | All Sample Name column values should be defined in sample file. |
| 48 | rule_a_200_200_001_01 | ERROR | Metabolite assignment file name not correct pattern in assay file. | Metabolite assignment file name must start with 'm_' and have extension '.tsv'. |
| 49 | rule_a_200_200_001_02 | ERROR | There are invalid characters in metabolite assignment file name in assay file. | Use only .- _A-Za-z0-9 characters for an metabolite assignment file name in assay file. |
| 50 | rule_a_200_300_001_01 | ERROR | Both 'Raw Spectral Data File' and 'Derived Spectral Data File' not in assay file. | Raw data files or Derived data files must be defined in assay file. |
| 51 | rule_a_200_300_001_03 | ERROR | Values for Raw Spectral Data File column not correct extension in assay file. | All Raw Spectral Data File column values should have extension found in control list. |
| 52 | rule_a_200_400_001_01 | ERROR | Derived Spectral Data Files, Acquisition Parameter Data File and Free Induction Decay Data File values are empty in NMR assay. | At least one file should be defined in Derived Spectral Data Files, Free Induction Decay Data File or Acquisition Parameter Data File columns. |
| 53 | rule_a_200_500_001_01 | ERROR | Values for Derived Spectral Data File column not correct extension in assay file. | All Derived Spectral Data File column values should have extension found in control list. |
| 54 | rule_f_400_090_001_01 | ERROR | Referenced data files not within study FILES folder. | Referenced data files must exist within study FILES folder. Reference data files with format FILES/<<sub folder if exists>>/<<file name>> in assay file. |
| 55 | rule_f_400_090_001_02 | ERROR | Referenced data files do not start with FILES/ prefix. | Reference data files with format FILES/<<sub folder if exists>>/<<file name>> in assay file. |
| 56 | rule_f_400_090_001_03 | ERROR | Referenced data files contain invalid characters. There are invalid characters in a referenced file name. | Use only .- _A-Za-z0-9 characters as a referenced data file name. |
| 57 | rule_f_400_090_001_04 | ERROR | Referenced data files contain zero byte data. | Check referenced data files and re-upload. |
| 58 | rule_f_400_090_001_07 | ERROR | Folders are referenced in assay file. | Folder reference in data file column is not allowed. If data file type is a folder, compress it with zip utility tool and reference compressed data file. |
| 59 | rule_f_400_090_001_09 | ERROR | Uploaded data file names contain invalid characters. | Use only .- _A-Za-z0-9 characters for data file name. |
| 60 | rule_f_400_100_001_01 | ERROR | Metadata files within study FILES folder. | Metadata files must not exist within study FILES folder. Review and delete/move metadata files. |
| 61 | rule_f_400_100_001_05 | ERROR | Data files with .aspx extensions within study FILES folder. | Data files with .aspx extensions must not exist within study FILES folder. Check Aspera upload completed successfully. |
| 62 | rule_f_400_100_001_06 | ERROR | Data files with .wiff extensions but no data files with .wiff.scan extensions within study FILES folder. | Data files with .wiff.scan extensions often accompany data files with .wiff extensions within study FILES folder. Check referenced data files and re-upload. |
| 63 | rule_i_100_200_002_01 | ERROR | Investigation Identifier not valid. | Investigation Identifier should be valid format (e.g., MTBLS<positive_number> or REQ{datetime}). |
| 64 | rule_i_100_200_003_01 | ERROR | Investigation Submission Date not valid. | Investigation Submission Date should be valid date and ISO8601 format (e.g., 2023-01-01). |
| 65 | rule_i_100_200_004_01 | ERROR | Investigation Public Release Date not valid. | Investigation Public Release Date should be valid date and ISO8601 format (e.g., 2023-01-01). |
| 66 | rule_i_100_300_001_01 | ERROR | No study referenced in investigation file. | Only one study should be defined in i_Investigation.txt. |
| 67 | rule_i_100_300_001_02 | ERROR | More than one study referenced in investigation file. | Only one study should be defined in i_Investigation.txt. |
| 68 | rule_i_100_300_002_01 | ERROR | Study Identifier not valid. | Study Identifier should be valid format (e.g., MTBLS<positive_number> or REQ{datetime}). |
| 69 | rule_i_100_300_003_01 | ERROR | Study Title length less than 25 characters. | Study Title should be defined with length equal or greater than 25 characters. Please use same title as first publication. |
| 70 | rule_i_100_300_003_02 | ERROR | Non-printable characters in Study Title. | Study title should contain only printable characters. |
| 71 | rule_i_100_300_004_01 | ERROR | Study Description length less than 60 characters. | Study Description should be defined with length equal or greater than 60 characters. Please use abstract of first publication. |
| 72 | rule_i_100_300_005_01 | ERROR | Study Submission Date not valid. | Study Submission Date should be valid date and ISO8601 format (e.g., 2023-01-01). |
| 73 | rule_i_100_300_006_01 | ERROR | Study Public Release Date not valid. | Study Public Release Date should be valid date and ISO8601 format (e.g., 2023-01-01). |
| 74 | rule_i_100_310_001_01 | ERROR | There are less than 3 Study Design Descriptors in the Study Design Descriptors section of investigation file. | At least 3 study design descriptors should be defined. |
| 75 | rule_i_100_310_002_01 | ERROR | Study Design Type is empty. | Study Design Type should be defined. |
| 76 | rule_i_100_320_001_01 | ERROR | No study publications referenced in investigation file. | At least one study publications should be defined in i_Investigation.txt. |
| 77 | rule_i_100_320_005_01 | ERROR | Study Publication Title length less than 25 characters. | Study Publication Title should be defined with length equal or greater than 25 characters. |
| 78 | rule_i_100_320_006_01 | ERROR | Study Publication Author List is empty. | Study Publication Author List should be defined. |
| 79 | rule_i_100_320_007_01 | ERROR | Study Publication Status is empty. | Study Publication Status should be defined. |
| 80 | rule_i_100_330_001_01 | ERROR | No study factors referenced in investigation file. | At least one study factors should be defined in i_Investigation.txt. |
| 81 | rule_i_100_330_002_01 | ERROR | Study Factor Name is empty. | Study Factor Name should be defined. |
| 82 | rule_i_100_330_003_01 | ERROR | Study Factor Type length less than 2 characters. | Study Factor Type should be defined with length equal or greater than 2 characters. |
| 83 | rule_i_100_340_001_01 | ERROR | No study assays referenced in investigation file. | At least one study assays should be defined in i_Investigation.txt. |
| 84 | rule_i_100_340_002_01 | ERROR | Study Assay File Name is empty in investigation file. | Assay file name should be set for each study in i_Investigation.txt. |
| 85 | rule_i_100_340_002_02 | ERROR | Study Assay File Name not correct pattern. | Assay file name must start with 'a_' and have extension '.txt'. |
| 86 | rule_i_100_340_003_01 | ERROR | Study Assay Measurement Type is empty. | Study Assay Measurement Type should be defined. |
| 87 | rule_i_100_340_004_01 | ERROR | Study Assay Measurement Type Term Accession Number is empty. | Study Assay Measurement Type Term Accession Number should be defined. |
| 88 | rule_i_100_340_005_01 | ERROR | Study Assay Measurement Type Term Source REF is empty. | Study Assay Measurement Type Term Source REF should be defined. |
| 89 | rule_i_100_340_005_02 | ERROR | Study Assay Measurement Type Term Source REF not referenced in investigation file. | Study Assay Measurement Type Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt. |
| 90 | rule_i_100_340_006_01 | ERROR | Study Assay Technology Type is empty. | Study Assay Technology Type should be defined. |
| 91 | rule_i_100_340_007_01 | ERROR | Study Assay Technology Type Term Accession Number is empty. | Study Assay Technology Type Term Accession Number should be defined. |
| 92 | rule_i_100_340_008_01 | ERROR | Study Assay Technology Type Term Source REF is empty. | Study Assay Technology Type Term Source REF should be defined. |
| 93 | rule_i_100_340_008_02 | ERROR | Study Assay Technology Type Term Source REF not referenced in investigation file. | Study Assay Technology Type Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt. |
| 94 | rule_i_100_340_009_01 | ERROR | Study Assay Technology Platform is empty. | Study Assay Technology Platform should be defined. |
| 95 | rule_i_100_350_001_01 | ERROR | No study protocols referenced in investigation file. | At least one study protocols should be defined in i_Investigation.txt. |
| 96 | rule_i_100_350_001_02 | ERROR | A study protocol is missing in investigation file. | All study protocols should be defined considering assay technologies used in study. |
| 97 | rule_i_100_350_002_01 | ERROR | Study Protocol Name length less than 3 characters. | Study Protocol Name should be defined with length equal or greater than 3 characters. |
| 98 | rule_i_100_350_003_01 | ERROR | Study Protocol Description length less than 40 characters. | Study Protocol Descripton should be defined with length equal or greater than 40 characters. |
| 99 | rule_i_100_350_003_02 | ERROR | Non-printable characters in Study Protocol Description. | Study Protocol Descripton should contain only printable characters. |
| 100 | rule_i_100_350_007_01 | ERROR | Study protocol parameter is missing for a study protocol. | All default study protocol parameters should be defined for study protocol. |
| 101 | rule_i_100_350_008_01 | ERROR | Study Protocol Parameters Name length less than 3 characters. | Study protocol parameters name should be defined with length equal or greater than 3 characters. |
| 102 | rule_i_100_360_001_01 | ERROR | No study contacts referenced in investigation file. | At least one study contacts should be defined in i_Investigation.txt. |
| 103 | rule_i_100_360_002_01 | ERROR | Study Person First Name length less than 2 characters. | Study Person First Name should be defined with length equal or greater than 2 characters. |
| 104 | rule_i_100_360_003_01 | ERROR | Study Person Last Name length less than 2 characters. | Study Person Last Name should be defined with length equal or greater than 2 characters. |
| 105 | rule_i_100_360_004_01 | ERROR | Study contacts have no email address. | At least one study contact must have an email address. |
| 106 | rule_i_100_360_004_02 | ERROR | Study Person Email not valid. | Study Person Email must be valid format. |
| 107 | rule_i_100_360_011_01 | ERROR | There is no study contact with Principal Investigator role. | At least one study contact must have Principal Investigator role. |
| 108 | rule_i_100_360_011_02 | ERROR | Principal Investigator contact details not defined. | Principal Investigator first name, last name and email must be defined. |
| 109 | rule_m_100_100_001_01 | ERROR | Default columns not in metabolite assignment file. | Default columns must exist in metabolite assignment file. |
| 110 | rule_m_100_100_001_02 | ERROR | Unordered columns in metabolite assignment file. | Unordered columns in metabolite assignment file. |
| 111 | rule_m_100_100_001_03 | ERROR | Empty columns in metabolite assignment file. | Empty columns must not exist in metabolite assignment file. All column headers should be defined. |
| 112 | rule_m_100_100_001_04 | ERROR | Default column header name is not unique in the metabolite assignment file. | Default column header name should be unique in the metabolite assignment file. |
| 113 | rule_m_100_100_004_01 | ERROR | Metabolite assignment file not referenced in assay file. | Metabolite assignment file must be referenced in assay file. |
| 114 | rule_m_100_100_005_01 | ERROR | Metabolite assignment file name not correct pattern. | Metabolite assignment file name must start with 'm_' and have extension '.tsv'. |
| 115 | rule_m_100_100_006_01 | ERROR | There is no row in metabolite assignment file. | No row is defined in metabolite assignment file. Add more than one row (assignment). Please ensure all xxx, including controls, QCs, standards, etc, are referenced. |
| 116 | rule_m_100_100_006_02 | ERROR | There is only one row in metabolite assignment file. | Only one row is defined in metabolite assignment file. Add more than one row (assignment). Please ensure all xxx, including controls, QCs, standards, etc, are referenced. |
| 117 | rule_m_300_090_001_01 | ERROR | Values with trailing or leading spaces in metabolite assignment file. | Values in metabolite assignment file should not start or end with space characters. |
| 118 | rule_m_300_090_005_01 | ERROR | Values for required columns not in metabolite assignment file. | All required column values should be defined in metabolite assignment file. |
| 119 | rule_m_300_090_005_02 | ERROR | Values do not meet minimum length requirement. | Each row should have a value equal or greater than the minimum length. |
| 120 | rule_m_300_090_005_03 | ERROR | Values do not meet maximum length requirement. | Each row should have a value equal or less than the maximum length. |
| 121 | rule_m_300_100_001_01 | ERROR | mass_to_charge column has empty values in metabolite assignment file. | All 'mass_to_charge' column values should be defined in metabolite assignment file. |
| 122 | rule_m_300_100_001_02 | ERROR | retention_time column has empty values in metabolite assignment file. | All 'retention_time' column values should be defined in metabolite assignment file for LC-MS / GC-MS. |
| 123 | rule_s_100_100_001_01 | ERROR | Invalid multi-column structure in sample file. | There is an invalid multi-column structure in sample file. Check column order. |
| 124 | rule_s_100_100_001_02 | ERROR | Unordered or unlinked column structure in sample file. | There is an unordered or unlinked column in sample file. Check column order. |
| 125 | rule_s_100_100_001_03 | ERROR | Some default columns are missing in sample file. | All default columns should exist in sample file. |
| 126 | rule_s_100_100_001_04 | ERROR | Unexpected column in sample file. | Unexpected column in sample file. Only factor and characteristics columns can be defined in sample file. |
| 127 | rule_s_100_100_001_05 | ERROR | Unexpected 'Protocol REF' column in sample file. | Unexpected 'Protocol REF' column in sample file. Only one 'Protocol REF' header is allowed in sample file. |
| 128 | rule_s_100_100_001_06 | ERROR | There is no factor column in sample file. | There should be at least one factor column in sample file. |
| 129 | rule_s_100_100_001_07 | ERROR | Empty columns in sample file. | Empty columns must not exist in sample file. All column headers should be defined. |
| 130 | rule_s_100_100_001_08 | ERROR | Order of default column header is not correct in sample file. | Order of default column header is not correct in sample file. |
| 131 | rule_s_100_100_001_09 | ERROR | Order of characteristics column header is not correct in sample file. | Order of characteristics column header is not correct in sample file. All characteristics columns should be defined before Sample collection Protocol REF column. |
| 132 | rule_s_100_100_001_10 | ERROR | Order of factor column header is not correct in sample file. | Order of factor column header is not correct in sample file. All factor columns should be defined after Sample Name column. |
| 133 | rule_s_100_100_001_11 | ERROR | Column header structure is not correct in sample file. | Column header structure is not correct in sample file. Any ontology and unit column should have the leading columns, Term Source REF and Term Accession Number. Single columns must not have leading columns. |
| 134 | rule_s_100_100_001_12 | ERROR | Factor value column structure is not correct in sample file. | Factor value column structure should be ontology (with Term Source REF and Term Accession Number) or a value with unit (and Term Source REF and Term Accession Number) in sample file. |
| 135 | rule_s_100_100_001_13 | ERROR | Additional characteristics column structure is not correct in sample file. | Additional characteristics column structure should be ontology in sample file. |
| 136 | rule_s_100_100_001_14 | ERROR | Multiple Characteristics / Factor Value columns with same header are not allowed in sample file. | Characteristics and Factor Value column headers should be unique in sample file. |
| 137 | rule_s_100_100_001_15 | ERROR | Missing Factor Value columns in sample file. | There should be a Factor Value column in sample file for each study factor. |
| 138 | rule_s_100_100_001_16 | ERROR | Unexpected Factor Value columns in sample file. | There should be a study factor for each Factor Value column in sample file. |
| 139 | rule_s_100_100_002_01 | ERROR | There is no row in sample file. | No row is defined in sample file. Add more than one row (sample). Please ensure all xxx, including controls, QCs, standards, etc, are referenced. |
| 140 | rule_s_100_100_002_02 | ERROR | There is only one row in sample file. | Only one row is defined in sample file. Add more than one row (sample). Please ensure all xxx, including controls, QCs, standards, etc, are referenced. |
| 141 | rule_s_100_100_003_01 | ERROR | Sample file not referenced in investigation file. | Only one sample file is allowed and its name should be 's_<accession number>.txt'. |
| 142 | rule_s_200_090_001_01 | ERROR | Values with trailing or leading spaces in sample file. | Values in sample file should not start or end with space characters. |
| 143 | rule_s_200_090_004_01 | ERROR | Empty value is found in a required column. | Complete all values in required columns. |
| 144 | rule_s_200_090_004_02 | ERROR | Values do not meet minimum length requirement. | Each row should have a value equal or greater than the minimum length. |
| 145 | rule_s_200_090_004_03 | ERROR | Values do not meet maximum length requirement. | Each row should have a value equal or less than the maximum length. |
| 146 | rule_s_200_090_005_01 | ERROR | Values for Protocol REF column not valid in sample file. | All rows should be filled with the same value (case sensitive). |
| 147 | rule_s_200_100_001_01 | ERROR | Organism name not an ontology term. | Organism name in column Characteristics[Organism] should be defined as ontology terms. Choose the 'Homo sapiens' taxonomy term instead of 'human' or 'man'. |
| 148 | rule_s_200_100_001_02 | ERROR | Organism name not an ontology term. | Organism name in column Characteristics[Organism] should be defined as ontology terms. |
| 149 | rule_s_200_100_002_01 | ERROR | User defined Characteristics column is empty. | At least one value should be defined in Characteristics column. |
| 150 | rule_s_200_200_001_01 | ERROR | Sample name values are not unique in sample file. | All sample names should be unique in sample file. |
| 151 | rule_s_200_200_001_02 | ERROR | Values for Sample Name column not in any assay file. | Each sample name should be referenced at least one time in assay files. |
| 152 | rule_s_200_200_002_02 | ERROR | Factor value column is empty. | At least one data should be defined in Factor Value column. |
| 153 | rule___100_100_100_03 | WARNING | There is a file parse warning for i_Investigation.txt. | Update i_Investigation.txt file considering warning messages. |
| 154 | rule___100_200_001_03 | WARNING | There is a file parse warning for the sample file. | There is a file parse warning for the sample file. |
| 155 | rule___100_300_001_03 | WARNING | There is a file parse warning for the assay file. | There is a file parse warning for the assay file. |
| 156 | rule___100_400_001_03 | WARNING | There is a file parse warning for the metabolite assignment file. | There is a file parse warning for the metabolite assignment file. |
| 157 | rule_a_100_100_001_09 | WARNING | Multiple Parameter Value columns with same header are not allowed in assay file. | Parameter Value column headers should be unique in assay file. |
| 158 | rule_a_100_100_001_10 | WARNING | Column header name defined in template is not unique in assay file. | Default column header name (except Data File columns) should be unique in assay file. |
| 159 | rule_a_200_090_002_01 | WARNING | Ontology Term Source REF of ontology terms not in prioritised control list. | Prioritised ontology Term Source REFs should be used for ontology terms in this column if possible. |
| 160 | rule_a_200_090_002_02 | WARNING | Ontology Term Source REF of ontology terms not in prioritised default control list. | Prioritised default ontology Term Source REFs should be used for ontology terms in this column if possible. |
| 161 | rule_a_200_090_002_03 | WARNING | Ontology Term Source REF not referenced in investigation file. | All ontology Term Source REFs should be referenced in ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt. |
| 162 | rule_a_200_090_002_04 | WARNING | Ontology Term Source REF defined for empty ontology terms. | Select ontology terms and/or change ontology Term Source REF. |
| 163 | rule_a_200_090_002_05 | WARNING | Ontology Term Source REF for a unit is defined however Term Source REF is not in prioritised control list. | We highly recommend to use the prioritised ontology Term Source REFs for an unit ontology term. |
| 164 | rule_a_200_090_002_06 | WARNING | Ontology Term Source REF defined for empty unit ontology terms. | Select unit ontology terms and/or change ontology Term Source REF. |
| 165 | rule_a_200_090_002_07 | WARNING | Term Source REF of ontology terms is empty. | Term Source REF of ontology terms should be defined. A prioritised control list is defined. Review and select from the prioritised control list if possible. |
| 166 | rule_a_200_090_002_08 | WARNING | Term Source REF of unit ontology terms is empty. | Term Source REF of unit ontology terms should be defined. A prioritised control list is defined. Review and select from the prioritised control list if possible. |
| 167 | rule_a_200_090_002_09 | WARNING | Term not in prioritised control list. | A prioritised control list is defined. Review and select from the prioritised control list if possible. |
| 168 | rule_a_200_090_002_10 | WARNING | Term Accession Number of the given term is different than accession number in control list. | Use same Term Accession Number for the term in control list. |
| 169 | rule_a_200_090_002_11 | WARNING | Empty term with an accession number in control list. | Fill term value for the given accession number in control list. |
| 170 | rule_a_200_090_002_12 | WARNING | Term Source REF for the given accession is different. | Use correct ontology Term Source REF for the accession number. |
| 171 | rule_a_200_090_003_01 | WARNING | Term Accession Number length of ontology terms less than 3 characters. | Term Accession Number of ontology terms should be defined with length equal or greater than 3 characters. |
| 172 | rule_a_200_090_003_02 | WARNING | Term Accession number length of unit ontology terms less than 3 characters. | Term Accession Number of unit ontology terms should be defined with length equal or greater than 3 characters. |
| 173 | rule_a_200_090_003_03 | WARNING | Term Accession Number defined for empty ontology terms. | Select ontology terms and/or change ontology Term Accession Number. |
| 174 | rule_a_200_090_003_04 | WARNING | Term Accession Number defined for empty unit ontology terms. | Select unit ontology terms and/or change ontology Term Accession Number. |
| 175 | rule_a_200_090_004_01 | WARNING | Required columns has empty values in assay file. | All required column values should be defined in assay file. |
| 176 | rule_a_200_100_001_02 | WARNING | Values for Sample Name column not unique in assay file. | Often Sample Name column values will be unique. |
| 177 | rule_a_200_300_001_02 | WARNING | Derived Spectral Data File' is defined but 'Raw Spectral Data File' is empty in assay file. | Derived Spectral Data File is defined without Raw Spectral Data File. We recommend to upload raw file and reference it. |
| 178 | rule_a_200_300_002_01 | WARNING | Values for MS Assay Name column not unique in assay file. | All MS Assay Name column values should be unique. |
| 179 | rule_a_200_400_002_01 | WARNING | Values for NMR Assay Name column not unique in assay file. | All NMR Assay Name column values should be unique. |
| 180 | rule_a_200_600_001_01 | WARNING | Column Type column values are not same as assay file name | if all values in Column Type are in a control list, technique name defined in control list should be in assay file name. |
| 181 | rule_a_200_600_002_01 | WARNING | Scan Polarity column values are not same as assay file name | Values for Scan Polarity column not same as assay file name |
| 182 | rule_f_400_090_001_08 | WARNING | A file in NMR raw data folder is referenced in assay file. | Only .zip files are allowed in this column. If data file or its parent is a raw data folder, compress it with zip utility tool and reference only compressed data file (e.g. 0011/fid -> 0001.zip, 0001/acqu -> 0001.zip). |
| 183 | rule_f_400_090_002_01 | WARNING | Referenced raw data files not within RAW_FILES folder. | Referenced raw data files should be located within FILES/RAW_FILES/<<sub folder if exists>>/<<file name>> and upload your data to appropriate folder. |
| 184 | rule_f_400_090_003_01 | WARNING | Referenced derived data files not within DERIVED_FILES folder. | Reference your derived file DERIVED_FILES/<<sub folder if exists>>/<<file name>> and upload your data to appropriate folder. |
| 185 | rule_f_400_100_001_02 | WARNING | Multiple referenced data files with the same name within different folders. | Review referenced file names and make referenced file names unique. |
| 186 | rule_f_400_100_001_03 | WARNING | Derived data files not referenced in assay file. | Derived data files should be referenced in assay file. |
| 187 | rule_f_400_100_001_04 | WARNING | Raw data files not referenced in assay file. | Raw data files should be referenced in assay file. |
| 188 | rule_i_100_100_001_01 | WARNING | Term Source Name length less than 2 characters in investigation file. | Term Source Name should be defined with length equal or greater than 2 characters in the ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt. |
| 189 | rule_i_100_100_002_01 | WARNING | Term Source File length less than 2 characters in investigation file. | Term Source File should be defined with length equal or greater than 2 characters in the ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt. |
| 190 | rule_i_100_200_001_01 | WARNING | Investigation Title length less than 10 characters. | Investigation Title should be defined with length equal or greater than 10 characters. Please use same title as first publication. |
| 191 | rule_i_100_310_003_01 | WARNING | Study Design Type Term Accession Number is empty. | Study Design Type Term Accession Number should be defined. |
| 192 | rule_i_100_310_004_01 | WARNING | Study Design Type Term Source REF is empty. | Study Design Type Term Source REF should be defined. |
| 193 | rule_i_100_310_004_02 | WARNING | Study Design Type Term Source REF not referenced in investigation file. | Study Design Type Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt. |
| 194 | rule_i_100_310_004_03 | WARNING | Study Design Type Term Source REF not in prioritised control list. | A prioritised control list is defined. Review and select from the prioritised control list if possible. |
| 195 | rule_i_100_320_002_01 | WARNING | DOI or PubMed ID is not defined for a published study publication. | A published publication should have a valid DOI or PubMed ID. |
| 196 | rule_i_100_320_003_01 | WARNING | DOI is invalid for a published study publication. | A publication in published status should have a valid DOI. |
| 197 | rule_i_100_320_003_02 | WARNING | DOI format is invalid for a study publication. | If DOI is defined, its format should be a valid. |
| 198 | rule_i_100_320_004_01 | WARNING | PubMed ID is invalid for a published study publication. | A published publication should have a valid PubMed ID. Valid PubMed ID contains only digits. |
| 199 | rule_i_100_320_004_02 | WARNING | PubMed ID format is invalid for a study publication. | If PubMed ID is defined, its format should be valid PubMed ID. Valid PubMed ID contains only digits. |
| 200 | rule_i_100_320_007_02 | WARNING | Study Publication Status not in prioritised control list. | A prioritised control list is defined. Review and select from the prioritised control list if possible. |
| 201 | rule_i_100_320_008_01 | WARNING | Study Publication Status Term Accession Number is empty. | Study Publication Status Term Accession Number should be defined. |
| 202 | rule_i_100_320_009_01 | WARNING | Study Publication Status Term Source REF is empty. | Study Publication Status Term Source REF should be defined. |
| 203 | rule_i_100_320_009_02 | WARNING | Study Publication Status Term Source REF not referenced in investigation file. | Study Publication Status Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt. |
| 204 | rule_i_100_320_009_03 | WARNING | Study Publication Status Term Source REF not in prioritised control list. | A prioritised control list is defined. Review and select from the prioritised control list if possible. |
| 205 | rule_i_100_330_004_01 | WARNING | Study Factor Type Term Accession Number is empty. | Study Factor Type Term Accession Number should be defined. |
| 206 | rule_i_100_330_005_01 | WARNING | Study Factor Type Term Source REF is empty. | Study Factor Type Term Source REF should be defined. |
| 207 | rule_i_100_330_005_02 | WARNING | Study Factor Type Term Source REF not referenced in investigation file. | Study Factor Type Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt. |
| 208 | rule_i_100_330_005_03 | WARNING | Study Factor Type Term Source REF not in prioritised control list. | A prioritised control list is defined. Review and select from the prioritised control list if possible. |
| 209 | rule_i_100_340_002_03 | WARNING | There are invalid characters in assay file name. | Use only .-_A-Za-z0-9 characters for an assay file name. |
| 210 | rule_i_100_340_005_03 | WARNING | Study Assay Measurement Type Term Source REF not in prioritised control list. | A prioritised control list is defined. Review and select from the prioritised control list if possible. |
| 211 | rule_i_100_340_008_03 | WARNING | Study Assay Technology Type Term Source REF not in prioritised control list. | A prioritised control list is defined. Review and select from the prioritised control list if possible. |
| 212 | rule_i_100_350_004_01 | WARNING | Study Protocol Type length less than 3 characters. | Study Protocol Type should be defined with length equal or greater than 3 characters. |
| 213 | rule_i_100_360_006_01 | WARNING | First Study Person Affiliation not valid. | First Study Person Affiliation should be valid. |
| 214 | rule_i_100_360_007_01 | WARNING | Study Person Roles is empty. | At least one role should be defined for a study contact. |
| 215 | rule_i_100_360_008_01 | WARNING | Study Person Roles length less than 2 characters. | Study Person Roles should be defined with length equal or greater than 2 characters. |
| 216 | rule_i_100_360_009_01 | WARNING | Study Person Roles Term Accession Number is empty. | Study Person Roles Term Accession Number should be defined. |
| 217 | rule_i_100_360_010_01 | WARNING | Study Person Roles Term Source REF not referenced in investigation file. | Study Person Roles Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt. |
| 218 | rule_i_100_360_010_02 | WARNING | Study Person Roles Term Source REF not in prioritised control list. | A prioritised control list is defined. Review and select from the prioritised control list if possible. |
| 219 | rule_i_100_360_010_03 | WARNING | Study Person Roles Term Source REF is empty. | Study Person Roles Term Source REF should be defined. |
| 220 | rule_m_100_100_002_01 | WARNING | Sample Name columns not in metabolite assignment file. | Sample Name columns must exist in metabolite assignment file. |
| 221 | rule_m_100_100_002_02 | WARNING | MS Assay Name or NMR Assay Name columns not in metabolite assignment file | If Sample Name columns do not exist, MS Assay Name or NMR Assay Name columns should be defined in metabolite assignment file. |
| 222 | rule_m_300_100_001_03 | WARNING | Some retention_time column values are not numeric in metabolite assignment file. | All 'retention_time' column values should be numeric. |
| 223 | rule_m_300_200_001_01 | WARNING | Values for chemical_shift column not in metabolite assignment file. | All 'chemical_shift' column values should be defined in metabolite assignment file. |
| 224 | rule_m_300_200_001_02 | WARNING | Values for chemical_shift column not numeric in metabolite assignment file. | All 'chemical_shift' column values should be numeric. |
| 225 | rule_m_300_200_001_03 | WARNING | Values for multiplicity column not in metabolite assignment file. | All 'multiplicity' column values should be defined in metabolite assignment file. |
| 226 | rule_s_200_090_002_01 | WARNING | Ontology Term Source REF of ontology terms not in prioritised control list. | Prioritised ontology Term Source REFs should be used for ontology terms in this column if possible. |
| 227 | rule_s_200_090_002_02 | WARNING | Ontology Term Source REF of ontology terms not in prioritised default control list. | Prioritised default ontology Term Source REFs should be used for ontology terms in this column if possible. |
| 228 | rule_s_200_090_002_03 | WARNING | Ontology Term Source REF not referenced in investigation file. | All ontology Term Source REFs should be referenced in ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt. |
| 229 | rule_s_200_090_002_04 | WARNING | Ontology Term Source REF defined for empty ontology terms. | Select ontology terms and/or change ontology Term Source REF. |
| 230 | rule_s_200_090_002_05 | WARNING | Ontology Term Source REF for a unit not in prioritised control list. | We highly recommend to use the prioritised ontology Term Source REFs for an unit ontology terms. |
| 231 | rule_s_200_090_002_06 | WARNING | Ontology Term Source REF defined for empty unit ontology terms. | Select unit ontology terms and/or change ontology Term Source REF. |
| 232 | rule_s_200_090_002_07 | WARNING | Term Source REF of ontology terms is empty. | Term Source REF of ontology terms should be defined. A prioritised control list is defined. Review and select from the prioritised control list if possible. |
| 233 | rule_s_200_090_002_08 | WARNING | Term Source REF of unit ontology terms is empty. | Term Source REF of unit ontology terms should be defined. A prioritised control list is defined. Review and select from the prioritised control list if possible. |
| 234 | rule_s_200_090_003_01 | WARNING | Term Accession Number length of ontology terms less than 3 characters. | Term Accession Number of ontology terms should be defined with length equal or greater than 3 characters. |
| 235 | rule_s_200_090_003_02 | WARNING | Term Accession Number length of unit ontology terms less than 3 characters. | Term Accession Number of unit ontology terms should be defined with length equal or greater than 3 characters. |
| 236 | rule_s_200_090_003_03 | WARNING | Term Accession Number defined for empty ontology terms. | Select ontology terms and/or change ontology Term Accession Number. |
| 237 | rule_s_200_090_003_04 | WARNING | Term Accession Number defined for empty unit ontology terms. | Select unit ontology terms and/or change ontology Term Accession Number. |
| 238 | rule_s_200_100_001_03 | WARNING | Organism name should not contain colon (:) characters. | Organism should not contain the actual ontology/taxonomy name, please include just the appropriate taxonomy term. |
| 239 | rule_s_200_100_002_02 | WARNING | Term Source REF of the user defined characteristics ontology term is not in the priotirised control list. | We highly recommend to use the prioritised ontology Source Refs for the characteristics ontology term. |
| 240 | rule_s_200_100_002_03 | WARNING | Term Source REF of the user defined characteristics ontology terms is empty | We highly recommend to use the prioritised Ontology Source Refs for the characteristics ontology term. |
| 241 | rule_s_200_100_002_04 | WARNING | Term Accession Number of the user defined characteristics ontology terms is empty. | We highly recommend to define accession number of the selected term. |
| 242 | rule_s_200_200_002_01 | WARNING | There are empty values in factor column. | Factor values should be set for each row. |
| 243 | rule_s_200_200_003_01 | WARNING | Term Source REFs of the factor ontology term is not in the prioritised control list. | We highly recommend to use the prioritised Ontology Source Refs for the factor ontology term. |
