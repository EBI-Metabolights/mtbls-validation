| # |RULE ID  | TYPE  | TITLE   | DESCRIPTION  |
|---|---------|-------|---------|--------------|
| 1 | rule___100_100_001_01 | ERROR | There is no input data\. | There is no input\. |
| 2 | rule___100_100_001_02 | ERROR | Input data format is not valid\. | Input data must have valid schema\. |
| 3 | rule___100_100_100_01 | ERROR | There is a critical file parse error for i\_Investigation\.txt\. | Update i\_Investigation\.txt file considering error messages\. |
| 4 | rule___100_100_100_02 | ERROR | There is a file parse error for i\_Investigation\.txt\. | Update i\_Investigation\.txt file considering error messages\. |
| 5 | rule___100_100_100_03 | WARNING | There is a file parse warning for i\_Investigation\.txt\. | Update i\_Investigation\.txt file considering warning messages\. |
| 6 | rule___100_100_100_04 | ERROR | Investigation file name is not i\_Investigation\.txt | Update investigation name as i\_Investigation\.txt |
| 7 | rule___100_100_100_05 | ERROR | There is no parser information for i\_Investigation\.txt\. | Define i\_Investigation\.txt in parserMessages\. |
| 8 | rule___100_100_100_06 | ERROR | Unreferenced investigation files\. | Delete multiple investigation file within study folder\. |
| 9 | rule___100_200_001_01 | ERROR | There is a critical file parse error for the sample file\. | There is a critical file parse error for the sample file\. |
| 10 | rule___100_200_001_02 | ERROR | There is a file parse error for the sample file\. | There is a file parse error for the sample file\. |
| 11 | rule___100_200_001_03 | WARNING | There is a file parse warning for the sample file\. | There is a file parse warning for the sample file\. |
| 12 | rule___100_200_001_04 | ERROR | There is no parser information for sample file\. | Define sample file in parserMessages\. |
| 13 | rule___100_200_001_05 | ERROR | There is no sample file for the study\. | Define a sample file for the study\. |
| 14 | rule___100_200_001_06 | ERROR | There are multiple sample files\. | Define only one sample file for the study\. |
| 15 | rule___100_200_001_08 | ERROR | Sample file name pattern is not correct\. | Sample file name must start with 's\_', contain study identifier and have extension '\.txt'\. |
| 16 | rule___100_200_001_09 | ERROR | Sample file is not referenced in i\_Investigation\.txt file\. | Update i\_Investigation\.txt  file to reference the sample file or delete it\. |
| 17 | rule___100_300_001_01 | ERROR | There is a critical file parse error for the assay file\. | There is a critical file parse error for the assay file\. |
| 18 | rule___100_300_001_02 | ERROR | There is a file parse error for the assay file\. | There is a file parse error for the assay file\. |
| 19 | rule___100_300_001_03 | WARNING | There is a file parse warning for the assay file\. | There is a file parse warning for the assay file\. |
| 20 | rule___100_300_001_04 | ERROR | There is no parser information for assay file\. | Define assay file in parserMessages\. |
| 21 | rule___100_300_001_05 | ERROR | There is no assay file for the study\. | Define an assay file for the study\. |
| 22 | rule___100_300_001_06 | ERROR | Technology type not defined for assay file\. | Assay file technology type must be defined to execute validation rules\. |
| 23 | rule___100_300_001_07 | ERROR | Technology type not supported for assay file\. | Assay file technology type not supported\. |
| 24 | rule___100_300_001_08 | ERROR | Assay file name not correct pattern\. | Assay file name must start with 'a\_' and have extension '\.txt'\. |
| 25 | rule___100_300_001_09 | ERROR | Assay file is not referenced in i\_Investigation\.txt file\. | Update i\_Investigation\.txt  file to reference the assay file or delete it\. |
| 26 | rule___100_300_001_10 | ERROR | Assay file name contains invalid characters\. | Use only \.\-\_A\-Za\-z0\-9 characters for an assay file name\. e\.g\. a\_REQ2025010211233\_LC\-MS\_negative\_reverse\-phase\_metabolite\_profiling\.txt |
| 27 | rule___100_400_001_01 | ERROR | There is a critical file parse error for the metabolite assignment file\. | There is a critical file parse error for the metabolite assignment file\. |
| 28 | rule___100_400_001_02 | ERROR | There is a file parse error for the metabolite assignment file\. | There is a file parse error for the metabolite assignment file\. |
| 29 | rule___100_400_001_03 | WARNING | There is a file parse warning for the metabolite assignment file\. | There is a file parse warning for the metabolite assignment file\. |
| 30 | rule___100_400_001_04 | ERROR | There is no parser information for metabolite assignment file\. | Define metabolite assignment file in parserMessages\. |
| 31 | rule___100_400_001_05 | ERROR | Technology type not defined for metabolite assignment file\. | Assignment file technology type must be defined to execute file type validation rules\. |
| 32 | rule___100_400_001_06 | ERROR | Metabolite assignment file is not referenced in assay file\(s\)\. | Update assay files to reference the metabolite assignment or delete it\. |
| 33 | rule___100_400_001_07 | ERROR | Metabolite assignment file name not correct pattern\. | Metabolite assignment file name must start with 'm\_' and have extension '\.tsv'\. |
| 34 | rule___100_400_001_08 | ERROR | Metabolite assignment file name contains invalid characters\. | Use only \.\-\_A\-Za\-z0\-9 characters for an metabolite assignment file name\. e\.g\. m\_REQ2025010211233\_LC\-MS\_negative\_reverse\-phase\_metabolite\_profiling\_v2\_maf\.tsv |
| 35 | rule_a_100_100_001_01 | ERROR | Invalid multi\-column structure in assay file\. | There is an invalid multi\-column structure in assay file\. Check column order\. |
| 36 | rule_a_100_100_001_02 | ERROR | Unordered or unlinked column structure in assay file\. | There is an unordered or unlinked column in assay file\. Check column order\. |
| 37 | rule_a_100_100_001_03 | ERROR | Default columns not in assay file\. | Default columns must exist in assay file\. |
| 38 | rule_a_100_100_001_04 | ERROR | Unexpected column in assay file\. | Rename or remove unexpected columns in assay file\. |
| 39 | rule_a_100_100_001_05 | ERROR | Unexpected 'Protocol REF' column in assay file\. | Unexpected 'Protocol REF' column in assay file\. Only one 'Protocol REF' header is allowed in assay file\. |
| 40 | rule_a_100_100_001_06 | ERROR | Missing 'Protocol REF' column in assay file\. | Add missing 'Protocol REF' column or related protocol section in assay file\. |
| 41 | rule_a_100_100_001_07 | ERROR | Empty columns in assay file\. | Empty columns must not exist in assay file\. All column headers must be defined\. |
| 42 | rule_a_100_100_001_08 | ERROR | Order of default column header is not correct in assay file\. | Order of default column header is not correct in assay file\. |
| 43 | rule_a_100_100_001_09 | WARNING | Multiple Parameter Value columns with same header are not allowed in assay file\. | Parameter Value column headers should be unique in assay file\. |
| 44 | rule_a_100_100_001_10 | WARNING | Column header name defined in template is not unique in assay file\. | Default column header name \(except Data File and Protocol REF columns\) should be unique in assay file\. |
| 45 | rule_a_100_100_001_11 | ERROR | Assay Parameter Value names not in investigation file\. | Assay Parameter Value names must be referenced in i\_Investigation\.txt\. |
| 46 | rule_a_100_100_001_12 | ERROR | Column name defined in MetaboLights template does not exist in assay file\. | Add all missing columns defined in MetaboLights assay template\. |
| 47 | rule_a_100_100_001_13 | ERROR | Column header structure is not correct in assay file\. | Column header structure is not correct in assay file\. Any ontology and unit column should have the leading columns, Term Source REF and Term Accession Number\. Single columns must not have leading columns\. |
| 48 | rule_a_100_100_002_01 | ERROR | Assay file not referenced in investigation file\. | Assay file must be referenced in i\_Investigation\.txt\. |
| 49 | rule_a_100_100_005_01 | ERROR | There is no row in assay file\. | No row is defined in assay file\. Add more than one row \(run\)\. Please ensure all samples, including controls, QCs, standards, etc, are referenced\. |
| 50 | rule_a_100_100_005_02 | ERROR | There is only one row in assay file\. | Only one row is defined in assay file\. Add more than one row \(run\)\. Please ensure all sample, including controls, QCs, standards, etc, are referenced\. |
| 51 | rule_a_200_090_001_01 | ERROR | Values with trailing or leading spaces in assay file\. | Values in assay file should not start or end with space characters\. |
| 52 | rule_a_200_090_002_03 | WARNING | Ontology Term Source REF not referenced in investigation file\. | All ontology Term Source REFs should be referenced in ONTOLOGY SOURCE REFERENCE section in i\_Investigation\.txt\. |
| 53 | rule_a_200_090_002_04 | WARNING | Ontology Term Source REF defined for empty ontology terms\. | Select ontology terms and/or change ontology Term Source REF\. |
| 54 | rule_a_200_090_002_06 | WARNING | Ontology Term Source REF defined for empty unit ontology terms\. | Select unit ontology terms and/or change ontology Term Source REF\. |
| 55 | rule_a_200_090_002_21 | ERROR | Value is not in the required ontologies or controlled lists associated with this column | A term MUST be selected from the required ontologies or controlled lists associated with this column\. |
| 56 | rule_a_200_090_002_22 | WARNING | Value is not in the predefined ontologies or controlled lists associated with this column | A term SHOULD be selected from the predefined ontologies or controlled lists associated with this column\. |
| 57 | rule_a_200_090_002_23 | WARNING | Value is not in the default ontologies or controlled lists | A term SHOULD be selected from the default ontologies or controlled lists\. |
| 58 | rule_a_200_090_002_24 | ERROR | The value does not match the required pattern\. | The column value MUST have a valid pattern value\. |
| 59 | rule_a_200_090_002_25 | WARNING | The value does not match the recommended pattern\. | The column value SHOULD have a valid pattern value\. |
| 60 | rule_a_200_090_002_26 | ERROR | The value appears in the list of unexpected values for this column\. | Select an alternative term or value that meets the requirement\. |
| 61 | rule_a_200_090_002_27 | WARNING | The value appears in the list of not\-recommended values for this column\. | Select an alternative value that meets the requirement or leave it empty \(if it is not required\)\. |
| 62 | rule_a_200_090_002_28 | ERROR | The value appears in the list of default unexpected values\. | Select an alternative term or value that meets the requirement\. |
| 63 | rule_a_200_090_002_29 | WARNING | The value appears in the list of default not\-recommended values\. | Select an alternative value that meets the requirement or leave it empty \(if it is not required\)\. |
| 64 | rule_a_200_090_003_01 | WARNING | Term Accession Number length of ontology terms less than 3 characters\. | Term Accession Number of ontology terms should be defined with length equal or greater than 3 characters\. |
| 65 | rule_a_200_090_003_02 | WARNING | Term Accession number length of unit ontology terms less than 3 characters\. | Term Accession Number of unit ontology terms should be defined with length equal or greater than 3 characters\. |
| 66 | rule_a_200_090_003_03 | WARNING | Term Accession Number defined for empty ontology terms\. | Select ontology terms and/or change ontology Term Accession Number\. |
| 67 | rule_a_200_090_003_04 | WARNING | Term Accession Number defined for empty unit ontology terms\. | Select unit ontology terms and/or change ontology Term Accession Number\. |
| 68 | rule_a_200_090_004_01 | ERROR | Required columns have empty values in assay file\. | All required column values should be defined in assay file\. |
| 69 | rule_a_200_090_004_02 | ERROR | Values do not meet minimum length requirement\. | Each row should have a value equal or greater than the minimum length\. |
| 70 | rule_a_200_090_004_03 | ERROR | Values do not meet maximum length requirement\. | Each row should have a value equal or less than the maximum length\. |
| 71 | rule_a_200_090_005_01 | ERROR | Values for Protocol REF column not valid in assay file\. | All rows should be filled with the same value \(case sensitive\)\. |
| 72 | rule_a_200_100_001_01 | ERROR | Values for Sample Name column not in sample file\. | All Sample Name column values should be defined in sample file\. |
| 73 | rule_a_200_100_001_02 | WARNING | Values for Sample Name column not unique in assay file\. | Often Sample Name column values will be unique\. |
| 74 | rule_a_200_200_001_01 | ERROR | Metabolite assignment file name not correct pattern in assay file\. | Metabolite assignment file name must start with 'm\_' and have extension '\.tsv'\. |
| 75 | rule_a_200_200_001_02 | ERROR | Metabolite assignment file name contains invalid characters in assay file\. | Use only \.\-\_A\-Za\-z0\-9 characters for an metabolite assignment file name in assay file\. |
| 76 | rule_a_200_300_001_01 | ERROR | Both 'Raw Spectral Data File' and 'Derived Spectral Data File' not in assay file\. | Raw data files or Derived data files must be defined in assay file\. |
| 77 | rule_a_200_300_001_02 | WARNING | Derived Spectral Data File' is defined but 'Raw Spectral Data File' is empty in assay file\. | Derived Spectral Data File is defined without Raw Spectral Data File\. We recommend to upload raw file and reference it\. |
| 78 | rule_a_200_300_001_03 | ERROR | Values for Raw Spectral Data File column not correct extension in assay file\. | All Raw Spectral Data File column values should have extension found in control list\. |
| 79 | rule_a_200_300_002_01 | WARNING | Values for MS Assay Name column not unique in assay file\. | All MS Assay Name column values should be unique\. |
| 80 | rule_a_200_300_003_01 | WARNING | Scan Polarity column values are not same as assay file name\. | Values for Scan Polarity column is not same as assay file name\. |
| 81 | rule_a_200_300_003_02 | ERROR | Scan Polarity column values are not unique\. | Define only one scan polarity value in each assay file\. |
| 82 | rule_a_200_400_001_01 | ERROR | Derived Spectral Data Files, Acquisition Parameter Data File and Free Induction Decay Data File values are empty in NMR assays\. | At least one file should be defined in Derived Spectral Data Files, Free Induction Decay Data File or Acquisition Parameter Data File columns\. |
| 83 | rule_a_200_400_002_01 | WARNING | Values for NMR Assay Name column not unique in assay file\. | All NMR Assay Name column values should be unique\. |
| 84 | rule_a_200_500_001_01 | ERROR | Values for Derived Spectral Data File column not correct extension in assay file\. | All Derived Spectral Data File column values should have extension found in control list\. |
| 85 | rule_a_200_600_001_01 | WARNING | Column Type column values are not same as assay file name\. | if all values in Column Type are in a control list, technique name defined in control list should be in assay file name\. |
| 86 | rule_a_200_900_001_01 | WARNING | Ontology terms are not validated on Ontology Search Service \(e\.g\. OLS\)\. | Ensure ontology terms are valid\. |
| 87 | rule_f_400_090_001_01 | ERROR | Referenced data files not within study FILES folder\. | Referenced data files must exist within study FILES folder\. Reference data files with format FILES/\(sub folder if exists\)/\(file name\) in assay file\. |
| 88 | rule_f_400_090_001_02 | ERROR | Referenced data files do not start with FILES/ prefix\. | Reference data files with format FILES/\(sub folder if exists>>/\(file name>> in assay file\. |
| 89 | rule_f_400_090_001_03 | ERROR | Referenced data files contain invalid characters\. There are invalid characters in a referenced file name\. | Use only \.\- \_A\-Za\-z0\-9 characters as a referenced data file name\. |
| 90 | rule_f_400_090_001_04 | ERROR | Data files contain zero byte data\. | Check data files and re\-upload\. |
| 91 | rule_f_400_090_001_07 | ERROR | Folders are referenced in assay file\. | Folder reference in data file column is not allowed\. If data file type is a folder, compress it with zip utility tool and reference compressed data file\. |
| 92 | rule_f_400_090_001_08 | ERROR | A file in NMR raw data folder is referenced in assay file\. | Only \.zip files are allowed in this column\. If data file or its parent is a raw data folder, compress it with zip utility tool and reference only compressed data file \(e\.g\. 0011/fid \-> 0001\.zip, 0001/acqu \-> 0001\.zip\)\. |
| 93 | rule_f_400_090_001_09 | ERROR | Uploaded data file names contain invalid characters\. | Use only \.\-\_A\-Za\-z0\-9 characters for data file name\. |
| 94 | rule_f_400_090_002_01 | WARNING | Referenced raw data files not within RAW\_FILES folder\. | Referenced raw data files should be located within FILES/RAW\_FILES/\(sub folder if exists>>/\(file name>> and upload your data to appropriate folder\. |
| 95 | rule_f_400_090_003_01 | WARNING | Referenced derived data files not within DERIVED\_FILES folder\. | Reference your derived file DERIVED\_FILES/\(sub folder if exists>>/\(file name>> and upload your data to appropriate folder\. |
| 96 | rule_f_400_100_001_01 | ERROR | Metadata files within study FILES folder\. | Metadata files must not exist within study FILES folder\. Review and delete/move metadata files\. |
| 97 | rule_f_400_100_001_02 | WARNING | Multiple referenced data files with the same name within different folders\. | Review referenced file names and make referenced file names unique\. |
| 98 | rule_f_400_100_001_03 | WARNING | Derived data files not referenced in assay file\. | Derived data files should be referenced in assay file\. |
| 99 | rule_f_400_100_001_04 | WARNING | Raw data files not referenced in assay file\. | Raw data files should be referenced in assay file\. |
| 100 | rule_f_400_100_001_05 | ERROR | Data files with \.aspx extensions within study FILES folder\. | Data files with \.aspx extensions must not exist within study FILES folder\. Check Aspera upload completed successfully\. |
| 101 | rule_f_400_100_001_06 | ERROR | Data files with \.wiff extensions but no data files with \.wiff\.scan extensions within study FILES folder\. | Data files with \.wiff\.scan extensions often accompany data files with \.wiff extensions within study FILES folder\. Check referenced data files and re\-upload\. |
| 102 | rule_f_400_100_001_07 | ERROR | Unexpected files / folders within study root folder\. | Only reference metadata files and FILES folder are allowed within study root folder\. Sample and assay files must be referenced in i\_Investigation\.txt\. All metabolite Assignment files must be referenced in assay files\. Multiple investigation files and all other files are not allowed\. |
| 103 | rule_f_400_100_001_08 | ERROR | Data files with \.imzML extensions but no data files with \.ibd extensions within study FILES folder\. | Data files with \.ibd extensions often accompany data files with \.imzML extensions within study FILES folder\. Check referenced data files and re\-upload\. |
| 104 | rule_i_100_100_001_01 | WARNING | Term Source Name length less than 2 characters in investigation file\. | Term Source Name should be defined with length equal or greater than 2 characters in the ONTOLOGY SOURCE REFERENCE section in i\_Investigation\.txt\. |
| 105 | rule_i_100_100_002_01 | WARNING | Term Source File length less than 2 characters in investigation file\. | Term Source File should be defined with length equal or greater than 2 characters in the ONTOLOGY SOURCE REFERENCE section in i\_Investigation\.txt\. |
| 106 | rule_i_100_300_001_01 | ERROR | No study referenced in investigation file\. | Only one study should be defined in i\_Investigation\.txt\. |
| 107 | rule_i_100_300_001_02 | ERROR | More than one study referenced in investigation file\. | Only one study should be defined in i\_Investigation\.txt\. |
| 108 | rule_i_100_300_002_01 | ERROR | Study Identifier not valid\. | Study Identifier should be valid format \(e\.g\., MTBLS\(positive\_number\) or REQ\(datetime\)\)\. |
| 109 | rule_i_100_300_003_01 | ERROR | Study Title length less than 25 characters\. | Study Title should be defined with length equal or greater than 25 characters\. Please use same title as first publication\. |
| 110 | rule_i_100_300_003_02 | ERROR | Non\-printable characters in Study Title\. | Study title should contain only printable characters\. |
| 111 | rule_i_100_300_003_03 | ERROR | Study Title contains only template message\. | Study title should be updated\. Do not use template message 'Please update the study title'\. |
| 112 | rule_i_100_300_004_01 | ERROR | Study Description length less than 60 characters\. | Study Description should be defined with length equal or greater than 60 characters\. Please use abstract of first publication\. |
| 113 | rule_i_100_300_004_02 | ERROR | Study abstract/description contains only template message\. | Study abstract/description should be updated\. Do not use template message 'Please update the study abstract/description'\. |
| 114 | rule_i_100_300_005_01 | WARNING | Study Submission Date not valid\. | Study Submission Date should be valid date and ISO8601 format \(e\.g\., 2023\-01\-01\)\. |
| 115 | rule_i_100_300_006_01 | WARNING | Study Public Release Date not valid\. | Study Public Release Date should be valid date and ISO8601 format \(e\.g\., 2023\-01\-01\)\. |
| 116 | rule_i_100_310_001_01 | ERROR | There are less than 3 Study Design Descriptors in the Study Design Descriptors section of investigation file\. | At least 3 study design descriptors should be defined\. |
| 117 | rule_i_100_310_002_01 | ERROR | Study Design Type is empty\. | Study Design Type should be defined\. |
| 118 | rule_i_100_310_002_11 | ERROR | Value is not in the required ontologies or controlled lists associated with this field\. | A term MUST be selected from the required ontologies or controlled lists associated with this field\. |
| 119 | rule_i_100_310_002_12 | WARNING | Value is not in the predefined ontologies or controlled lists associated with this field\. | A term SHOULD be selected from the predefined ontologies or controlled lists associated with this field\. |
| 120 | rule_i_100_310_002_13 | WARNING | Value is not in the default ontologies or controlled lists | A term SHOULD be selected from the default ontologies or controlled lists\. |
| 121 | rule_i_100_310_002_14 | WARNING | Study Design Type Term Source REF not referenced in investigation file\. | Study Design Type Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i\_Investigation\.txt\. |
| 122 | rule_i_100_320_001_01 | ERROR | No study publications referenced in investigation file\. | At least one study publications must be defined in i\_Investigation\.txt\. |
| 123 | rule_i_100_320_003_01 | ERROR | DOI is required for published study publication\. | A study publication with status published should have valid DOI\. |
| 124 | rule_i_100_320_003_02 | ERROR | DOI format invalid for study publication\. | If DOI is defined, its format should be a valid\. |
| 125 | rule_i_100_320_004_02 | ERROR | PubMed ID format invalid for study publication\. | If PubMed ID is defined, its format should be valid PubMed ID\. Valid PubMed ID contains only digits\. |
| 126 | rule_i_100_320_005_01 | ERROR | Study Publication Title length less than 20 characters\. | Study Publication Title must be defined with length equal or greater than 25 characters\. |
| 127 | rule_i_100_320_006_01 | ERROR | Study Publication Author List is empty\. | Study Publication Author List must be defined\. |
| 128 | rule_i_100_320_007_01 | ERROR | Study Publication Status Term is empty\. | Study Publication Status Term should be defined |
| 129 | rule_i_100_320_007_11 | ERROR | Value is not in the required ontologies or controlled lists associated with this field\. | A term MUST be selected from the required ontologies or controlled lists associated with this field\. |
| 130 | rule_i_100_320_007_12 | WARNING | Value is not in the predefined ontologies or controlled lists associated with this field\. | A term SHOULD be selected from the predefined ontologies or controlled lists associated with this field\. |
| 131 | rule_i_100_320_007_13 | WARNING | Value is not in the default ontologies or controlled lists | A term SHOULD be selected from the default ontologies or controlled lists\. |
| 132 | rule_i_100_320_007_14 | WARNING | Study Publication Status Term Source REF not referenced in investigation file\. | Study Publication Status Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i\_Investigation\.txt\. |
| 133 | rule_i_100_330_001_01 | ERROR | No study factors referenced in investigation file\. | At least one study factors must be defined in i\_Investigation\.txt\. |
| 134 | rule_i_100_330_002_01 | ERROR | Study Factor Name is empty\. | Study Factor Name must be defined\. |
| 135 | rule_i_100_330_003_01 | ERROR | Study Factor Type Term Source REF is empty\. | Study Factor Type Term Source REF should be defined\. |
| 136 | rule_i_100_330_003_11 | ERROR | Value is not in the required ontologies or controlled lists associated with this field\. | A term MUST be selected from the required ontologies or controlled lists associated with this field\. |
| 137 | rule_i_100_330_003_12 | WARNING | Value is not in the predefined ontologies or controlled lists associated with this field\. | A term SHOULD be selected from the predefined ontologies or controlled lists associated with this field\. |
| 138 | rule_i_100_330_003_13 | WARNING | Value is not in the default ontologies or controlled lists | A term SHOULD be selected from the default ontologies or controlled lists\. |
| 139 | rule_i_100_330_003_14 | WARNING | Study Factor Type Term Source REF is not referenced in investigation file\. | Study Factor Type Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i\_Investigation\.txt\. |
| 140 | rule_i_100_340_001_01 | ERROR | No study assays referenced in investigation file\. | At least one study assays should be defined in i\_Investigation\.txt\. |
| 141 | rule_i_100_340_002_01 | ERROR | Study Assay File Name is empty in investigation file\. | Assay file name should be set for each study in i\_Investigation\.txt\. |
| 142 | rule_i_100_340_002_02 | ERROR | Study Assay File Name not correct pattern\. | Assay file name must start with 'a\_' and have extension '\.txt'\. |
| 143 | rule_i_100_340_002_03 | ERROR | There are invalid characters in assay file name\. | Use only \.\-\_A\-Za\-z0\-9 characters for an assay file name\. |
| 144 | rule_i_100_340_002_04 | ERROR | Study Assay File Name must be unique\. | Assay file name must be unique for each study in i\_Investigation\.txt\. |
| 145 | rule_i_100_340_003_01 | ERROR | Study Assay Measurement Type is empty\. | Study Assay Measurement Type should be defined\. |
| 146 | rule_i_100_340_003_11 | ERROR | Value is not in the required ontologies or controlled lists associated with this field\. | A term MUST be selected from the required ontologies or controlled lists associated with this field\. |
| 147 | rule_i_100_340_003_12 | WARNING | Value is not in the predefined ontologies or controlled lists associated with this field\. | A term SHOULD be selected from the predefined ontologies or controlled lists associated with this field\. |
| 148 | rule_i_100_340_003_13 | WARNING | Value is not in the default ontologies or controlled lists | A term SHOULD be selected from the default ontologies or controlled lists\. |
| 149 | rule_i_100_340_003_14 | ERROR | Study Assay Measurement Type Term Source REF not referenced in investigation file\. | Study Assay Measurement Type Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i\_Investigation\.txt\. |
| 150 | rule_i_100_340_006_01 | ERROR | Study Assay Technology Type is empty\. | Study Assay Technology Type should be defined\. |
| 151 | rule_i_100_340_006_11 | ERROR | Value is not in the required ontologies or controlled lists associated with this field\. | A term MUST be selected from the required ontologies or controlled lists associated with this field\. |
| 152 | rule_i_100_340_006_12 | WARNING | Value is not in the predefined ontologies or controlled lists associated with this field\. | A term SHOULD be selected from the predefined ontologies or controlled lists associated with this field\. |
| 153 | rule_i_100_340_006_13 | WARNING | Value is not in the default ontologies or controlled lists | A term SHOULD be selected from the default ontologies or controlled lists\. |
| 154 | rule_i_100_340_006_14 | ERROR | Study Assay Technology Type Term Source REF not referenced in investigation file\. | Study Assay Technology Type Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i\_Investigation\.txt\. |
| 155 | rule_i_100_340_009_01 | ERROR | Study Assay Technology Platform is empty\. | Study Assay Technology Platform should be defined\. |
| 156 | rule_i_100_350_001_01 | ERROR | No study protocols referenced in investigation file\. | At least one study protocols should be defined in i\_Investigation\.txt\. |
| 157 | rule_i_100_350_001_02 | ERROR | A study protocol is missing in investigation file\. | All study protocols should be defined considering assay technologies used in study\. |
| 158 | rule_i_100_350_002_01 | ERROR | Study Protocol Name length less than 3 characters\. | Study Protocol Name should be defined with length equal or greater than 3 characters\. |
| 159 | rule_i_100_350_003_01 | ERROR | Study Protocol Description length less than 40 characters\. | Study Protocol Description should be defined with length equal or greater than 40 characters\. |
| 160 | rule_i_100_350_003_02 | ERROR | Non\-printable characters in Study Protocol Description\. | Study Protocol Description should contain only printable characters\. |
| 161 | rule_i_100_350_003_03 | ERROR | Study Protocol Description contains only template message\. | Study Protocol Description should be updated\. Do not use template message\. |
| 162 | rule_i_100_350_004_01 | WARNING | Study Protocol Type length less than 3 characters\. | Study Protocol Type should be defined with length equal or greater than 3 characters\. |
| 163 | rule_i_100_350_007_01 | ERROR | Study protocol parameter is missing for a study protocol\. | All default study protocol parameters should be defined for study protocol\. |
| 164 | rule_i_100_350_008_01 | ERROR | Study Protocol Parameters Name length less than 3 characters\. | Study protocol parameters name should be defined with length equal or greater than 3 characters\. |
| 165 | rule_i_100_360_001_01 | ERROR | No study contacts referenced in investigation file\. | At least one study contacts should be defined in i\_Investigation\.txt\. |
| 166 | rule_i_100_360_002_01 | ERROR | Study Person First Name length less than 2 characters\. | Study Person First Name should be defined with length equal or greater than 2 characters\. |
| 167 | rule_i_100_360_003_01 | ERROR | Study Person Last Name length less than 2 characters\. | Study Person Last Name should be defined with length equal or greater than 2 characters\. |
| 168 | rule_i_100_360_004_01 | ERROR | Study contacts have no email address\. | At least one study contact must have an email address\. |
| 169 | rule_i_100_360_004_02 | ERROR | Study Person Email not valid\. | Study Person Email must have valid format\. |
| 170 | rule_i_100_360_006_01 | ERROR | Study Person affiliation length is less than 10 characters\. | Define full name of contact's primary affiliation\. e\.g\. European Bioinformatics Institute |
| 171 | rule_i_100_360_007_01 | ERROR | Study Person Roles is empty\. | At least one role should be defined for a study contact\. |
| 172 | rule_i_100_360_008_01 | WARNING | Study Person Role value is empty\. | Study Person Role should be defined\. |
| 173 | rule_i_100_360_008_11 | ERROR | Value is not in the required ontologies or controlled lists associated with this field\. | A term MUST be selected from the required ontologies or controlled lists associated with this field\. |
| 174 | rule_i_100_360_008_12 | WARNING | Value is not in the predefined ontologies or controlled lists associated with this field\. | A term SHOULD be selected from the predefined ontologies or controlled lists associated with this field\. |
| 175 | rule_i_100_360_008_13 | WARNING | Value is not in the default ontologies or controlled lists | A term SHOULD be selected from the default ontologies or controlled lists\. |
| 176 | rule_i_100_360_008_14 | WARNING | Study Person Roles Term Source REF not referenced in investigation file\. | Study Person Roles Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i\_Investigation\.txt\. |
| 177 | rule_i_100_360_010_03 | WARNING | Study Person Roles Term Source REF is empty\. | Study Person Roles Term Source REF should be defined\. |
| 178 | rule_i_100_360_011_01 | ERROR | There is no study contact with Principal Investigator role\. | At least one study contact must have Principal Investigator role\. |
| 179 | rule_i_100_360_011_02 | ERROR | Principal Investigator contact details not defined\. | Principal Investigator first name, last name, affiliation, and email must be defined\. |
| 180 | rule_i_100_360_011_03 | ERROR | Study Person Affiliation ROR ID is not valid\. | Study Person ROR ID must have valid format\. e\.g\., https://ror\.org/02catss52 \. If your affiliation ROR ID is not defined, you may provide wikidata URL of your primary affiliation\. e\.g\., https://www\.wikidata\.org/wiki/Q1341845 |
| 181 | rule_i_100_360_011_04 | ERROR | Study Person ORCID is not valid\. | Study Person ORCID must have valid format\. |
| 182 | rule_i_100_360_011_05 | ERROR | Study Person Additional Email Address is not valid\. | Study Person Additional Email Address must have valid format\. |
| 183 | rule_i_100_360_011_06 | WARNING | Study Person ORCID is not defined for principal investigator\. | Study Person ORCID is not defined for principal investigator\. |
| 184 | rule_i_100_360_011_07 | WARNING | Study Person Affiliation ROR ID is not defined for principal investigator\. | Study Person Affiliation ROR ID is not defined for principal investigator\. |
| 185 | rule_i_200_900_001_01 | WARNING | Ontology term is not validated on Ontology Search Service \(e\.g\. OLS\)\. | Ensure ontology term is valid\. |
| 186 | rule_m_100_100_001_01 | ERROR | Default columns not in metabolite assignment file\. | Default columns must exist in metabolite assignment file\. |
| 187 | rule_m_100_100_001_02 | ERROR | Unordered columns in metabolite assignment file\. | Unordered columns in metabolite assignment file\. |
| 188 | rule_m_100_100_001_03 | ERROR | Empty columns in metabolite assignment file\. | Empty columns must not exist in metabolite assignment file\. All column headers should be defined\. |
| 189 | rule_m_100_100_001_04 | ERROR | Default column header name is not unique in the metabolite assignment file\. | Default column header name should be unique in the metabolite assignment file\. |
| 190 | rule_m_100_100_002_01 | WARNING | Sample Name columns not in metabolite assignment file\. | Sample Name columns must exist in metabolite assignment file\. |
| 191 | rule_m_100_100_002_02 | WARNING | MS Assay Name or NMR Assay Name columns not in metabolite assignment file | If Sample Name columns do not exist, MS Assay Name or NMR Assay Name columns should be defined in metabolite assignment file\. |
| 192 | rule_m_100_100_004_01 | ERROR | Metabolite assignment file not referenced in assay file\. | Metabolite assignment file must be referenced in assay file\. |
| 193 | rule_m_100_100_005_01 | ERROR | Metabolite assignment file name not correct pattern\. | Metabolite assignment file name must start with 'm\_' and have extension '\.tsv'\. |
| 194 | rule_m_100_100_006_01 | ERROR | There is no row in metabolite assignment file\. | No row is defined in metabolite assignment file\. Add more than one row \(assignment\)\. Please ensure all xxx, including controls, QCs, standards, etc, are referenced\. |
| 195 | rule_m_100_100_006_02 | ERROR | There is only one row in metabolite assignment file\. | Only one row is defined in metabolite assignment file\. Add more than one row \(assignment\)\. Please ensure all xxx, including controls, QCs, standards, etc, are referenced\. |
| 196 | rule_m_300_090_001_01 | ERROR | Values with trailing or leading spaces in metabolite assignment file\. | Values in metabolite assignment file should not start or end with space characters\. |
| 197 | rule_m_300_090_005_01 | ERROR | Values for required columns not in metabolite assignment file\. | All required column values should be defined in metabolite assignment file\. |
| 198 | rule_m_300_090_005_02 | ERROR | Values do not meet minimum length requirement\. | Each row must have a value equal or greater than the minimum length\. |
| 199 | rule_m_300_090_005_03 | ERROR | Values do not meet maximum length requirement\. | Each row must have a value equal or less than the maximum length\. |
| 200 | rule_m_300_100_001_01 | ERROR | mass\_to\_charge column has empty values in metabolite assignment file\. | All 'mass\_to\_charge' column values must be defined in metabolite assignment file\. |
| 201 | rule_m_300_100_001_02 | ERROR | retention\_time column has empty values in metabolite assignment file\. | All 'retention\_time' column values must be defined in metabolite assignment file for LC\-MS / GC\-MS\. |
| 202 | rule_m_300_100_001_03 | WARNING | retention\_time column values not numeric in metabolite assignment file\. | All 'retention\_time' column values should be numeric\. |
| 203 | rule_m_300_200_001_01 | WARNING | chemical\_shift column has empty values in metabolite assignment file\. | All 'chemical\_shift' column values should be defined in metabolite assignment file\. |
| 204 | rule_m_300_200_001_02 | WARNING | chemical\_shift column values not numeric in metabolite assignment file\. | All 'chemical\_shift' column values should be numeric in metabolite assignment file\. |
| 205 | rule_m_300_200_001_03 | WARNING | multiplicity column has empty values in metabolite assignment file\. | All 'multiplicity' column values should be defined in metabolite assignment file\. |
| 206 | rule_s_100_100_001_01 | ERROR | Invalid multi\-column structure in sample file\. | There is an invalid multi\-column structure in sample file\. Check column order\. |
| 207 | rule_s_100_100_001_02 | ERROR | Unordered or unlinked column structure in sample file\. | There is an unordered or unlinked column in sample file\. Check column order\. |
| 208 | rule_s_100_100_001_03 | ERROR | Some default columns are missing in sample file\. | All default columns should exist in sample file\. |
| 209 | rule_s_100_100_001_04 | ERROR | Unexpected column in sample file\. | Unexpected column in sample file\. Only factor and characteristics columns can be defined in sample file\. |
| 210 | rule_s_100_100_001_05 | ERROR | Unexpected 'Protocol REF' column in sample file\. | Unexpected 'Protocol REF' column in sample file\. Only one 'Protocol REF' header is allowed in sample file\. |
| 211 | rule_s_100_100_001_06 | ERROR | There is no Factor Value column in sample file\. | There should be at least one Factor Value column in sample file\. |
| 212 | rule_s_100_100_001_07 | ERROR | Empty columns in sample file\. | Empty columns must not exist in sample file\. All column headers should be defined\. |
| 213 | rule_s_100_100_001_08 | ERROR | Order of default column header is not correct in sample file\. | Order of default column header is not correct in sample file\. |
| 214 | rule_s_100_100_001_09 | ERROR | Order of characteristics column header is not correct in sample file\. | Order of characteristics column header is not correct in sample file\. All characteristics columns should be defined before Sample collection Protocol REF column\. |
| 215 | rule_s_100_100_001_10 | ERROR | Order of factor column header is not correct in sample file\. | Order of factor column header is not correct in sample file\. All factor columns should be defined after Sample Name column\. |
| 216 | rule_s_100_100_001_11 | ERROR | Column header structure is not correct in sample file\. | Column header structure is not correct in sample file\. Any ontology and unit column should have the leading columns, Term Source REF and Term Accession Number\. Single columns must not have leading columns\. |
| 217 | rule_s_100_100_001_12 | ERROR | Factor Value column structure is not correct in sample file\. | Factor Value column structure should be ontology \(with Term Source REF and Term Accession Number\) or a value with unit \(and Term Source REF and Term Accession Number\) in sample file\. |
| 218 | rule_s_100_100_001_13 | ERROR | Additional characteristics column structure is not correct in sample file\. | Additional characteristics column structure should be ontology \(with Term Source REF and Term Accession Number\) or a value with unit \(and Term Source REF and Term Accession Number\) in sample file\. |
| 219 | rule_s_100_100_001_14 | ERROR | Multiple Characteristics / Factor Value columns with same header are not allowed in sample file\. | Characteristics and Factor Value column headers should be unique in sample file\. |
| 220 | rule_s_100_100_001_15 | ERROR | Missing Factor Value columns in sample file\. | There should be a Factor Value column in sample file for each study factor\. |
| 221 | rule_s_100_100_001_16 | ERROR | Unexpected Factor Value columns in sample file\. | There should be a study factor for each Factor Value column in sample file\. |
| 222 | rule_s_100_100_002_01 | ERROR | There is no row in sample file\. | No row is defined in sample file\. Add more than one row \(sample\)\. Please ensure all xxx, including controls, QCs, standards, etc, are referenced\. |
| 223 | rule_s_100_100_002_02 | ERROR | There is only one row in sample file\. | Only one row is defined in sample file\. Add more than one row \(sample\)\. Please ensure all xxx, including controls, QCs, standards, etc, are referenced\. |
| 224 | rule_s_100_100_003_01 | ERROR | Sample file not referenced in investigation file\. | Only one sample file is allowed and its name should be 's\_\(accession number\)\.txt'\. |
| 225 | rule_s_200_090_001_01 | ERROR | Values with trailing or leading spaces in sample file\. | Values in sample file should not start or end with space characters\. |
| 226 | rule_s_200_090_002_03 | WARNING | Ontology Term Source REF not referenced in investigation file\. | All ontology Term Source REFs should be referenced in ONTOLOGY SOURCE REFERENCE section in i\_Investigation\.txt\. |
| 227 | rule_s_200_090_002_04 | ERROR | Ontology Term Source REF defined for empty ontology terms\. | Select ontology terms and/or change ontology Term Source REF\. |
| 228 | rule_s_200_090_002_06 | WARNING | Ontology Term Source REF defined for empty unit ontology terms\. | Select unit ontology terms and/or change ontology Term Source REF\. |
| 229 | rule_s_200_090_002_09 | ERROR | Value is not in the required ontologies or controlled lists associated with this column | A term MUST be selected from the required ontologies or controlled lists associated with this column\. |
| 230 | rule_s_200_090_002_10 | WARNING | Value is not in the predefined ontologies or controlled lists associated with this column | A term SHOULD be selected from the predefined ontologies or controlled lists associated with this column\. |
| 231 | rule_s_200_090_002_11 | WARNING | Factor value is not in the predefined ontologies or controlled lists associated with this column | A term SHOULD be selected from the predefined ontologies or controlled lists associated with this column\. |
| 232 | rule_s_200_090_002_12 | WARNING | Characteristic value is not in the predefined ontologies or controlled lists associated with this column | A term SHOULD be selected from the predefined ontologies or controlled lists associated with this column\. |
| 233 | rule_s_200_090_002_13 | ERROR | The value does not match the required pattern\. | The column value MUST have a valid pattern value\. |
| 234 | rule_s_200_090_002_14 | WARNING | The value does not match the recommended pattern\. | The column value SHOULD have a valid pattern value\. |
| 235 | rule_s_200_090_003_01 | WARNING | Term Accession Number length of ontology terms less than 3 characters\. | Term Accession Number of ontology terms should be defined with length equal or greater than 3 characters\. |
| 236 | rule_s_200_090_003_02 | WARNING | Term Accession Number length of unit ontology terms less than 3 characters\. | Term Accession Number of unit ontology terms should be defined with length equal or greater than 3 characters\. |
| 237 | rule_s_200_090_003_03 | WARNING | Term Accession Number defined for empty ontology terms\. | Select ontology terms and/or change ontology Term Accession Number\. |
| 238 | rule_s_200_090_003_04 | WARNING | Term Accession Number defined for empty unit ontology terms\. | Select unit ontology terms and/or change ontology Term Accession Number\. |
| 239 | rule_s_200_090_004_01 | ERROR | Empty value is found in a required column\. | Complete all values in required columns\. |
| 240 | rule_s_200_090_004_02 | ERROR | Values do not meet minimum length requirement\. | Each row should have a value equal or greater than the minimum length\. |
| 241 | rule_s_200_090_004_03 | ERROR | Values do not meet maximum length requirement\. | Each row should have a value equal or less than the maximum length\. |
| 242 | rule_s_200_090_005_01 | ERROR | Values for Protocol REF column not valid in sample file\. | All rows should be filled with the same value \(case sensitive\)\. |
| 243 | rule_s_200_090_007_01 | ERROR | The value appears in the list of unexpected values for this column\. | Select an alternative term or value that meets the requirement\. |
| 244 | rule_s_200_090_007_02 | WARNING | The value appears in the list of not\-recommended values for this column\. | Select an alternative value that meets the requirement or leave it empty \(if it is not required\)\. |
| 245 | rule_s_200_090_007_03 | ERROR | The value appears in the list of default unexpected values\. | Select an alternative term or value that meets the requirement\. |
| 246 | rule_s_200_090_007_04 | WARNING | The value appears in the list of default not\-recommended values\. | Select an alternative value that meets the requirement or leave it empty \(if it is not required\)\. |
| 247 | rule_s_200_100_002_01 | ERROR | User defined Characteristics column is empty\. | At least one value should be defined in Characteristics column\. |
| 248 | rule_s_200_100_002_04 | WARNING | Term Accession Number of the user defined characteristics ontology terms is empty\. | We highly recommend to define accession number of the selected term\. |
| 249 | rule_s_200_200_001_01 | ERROR | Sample name values are not unique in sample file\. | All sample names should be unique in sample file\. |
| 250 | rule_s_200_200_001_02 | ERROR | Values for Sample Name column not in any assay file\. | Each sample name should be referenced at least one time in assay files\. |
| 251 | rule_s_200_200_002_01 | WARNING | There are empty values in Factor Value column\. | Factor values should be defined for each row\. |
| 252 | rule_s_200_200_002_02 | ERROR | Factor Value column not complete\. | At least two values must be defined in Factor Value column\. |
| 253 | rule_s_200_900_001_01 | WARNING | Ontology terms are not validated on Ontology Search Service \(e\.g\. OLS\)\. | Ensure ontology terms are valid\. |
