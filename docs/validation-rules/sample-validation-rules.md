# Samples Validation Rules

| # |RULE ID  | TYPE  | TITLE  | DESCRIPTION |
|---|---------|-------|--------|-------------|
| 1 | rule___100_200_001_01 | ERROR | There is a critical file parse error for the sample file. | There is a critical file parse error for the sample file. |
| 2 | rule___100_200_001_02 | ERROR | There is a file parse error for the sample file. | There is a file parse error for the sample file. |
| 3 | rule___100_200_001_03 | WARNING | There is a file parse warning for the sample file. | There is a file parse warning for the sample file. |
| 4 | rule___100_200_001_04 | ERROR | There is no parser information for sample file. | Define sample file in parserMessages. |
| 5 | rule___100_200_001_05 | ERROR | There is no sample file for the study. | Define a sample file for the study. |
| 6 | rule___100_200_001_06 | ERROR | There are multiple sample files. | Define only one sample file for the study. |
| 7 | rule___100_200_001_08 | ERROR | Sample file name pattern is not correct. | Sample file name must start with 's_', contain study identifier and have extension '.txt'. |
| 8 | rule___100_200_001_09 | ERROR | Sample file is not referenced in i_Investigation.txt file. | Update i_Investigation.txt  file to reference the sample file or delete it. |
| 9 | rule_s_100_100_001_01 | ERROR | Invalid multi-column structure in sample file. | There is an invalid multi-column structure in sample file. Check column order. |
| 10 | rule_s_100_100_001_02 | ERROR | Unordered or unlinked column structure in sample file. | There is an unordered or unlinked column in sample file. Check column order. |
| 11 | rule_s_100_100_001_03 | ERROR | Some default columns are missing in sample file. | All default columns should exist in sample file. |
| 12 | rule_s_100_100_001_04 | ERROR | Unexpected column in sample file. | Unexpected column in sample file. Only factor and characteristics columns can be defined in sample file. |
| 13 | rule_s_100_100_001_05 | ERROR | Unexpected 'Protocol REF' column in sample file. | Unexpected 'Protocol REF' column in sample file. Only one 'Protocol REF' header is allowed in sample file. |
| 14 | rule_s_100_100_001_06 | ERROR | There is no Factor Value column in sample file. | There should be at least one Factor Value column in sample file. |
| 15 | rule_s_100_100_001_07 | ERROR | Empty columns in sample file. | Empty columns must not exist in sample file. All column headers should be defined. |
| 16 | rule_s_100_100_001_08 | ERROR | Order of default column header is not correct in sample file. | Order of default column header is not correct in sample file. |
| 17 | rule_s_100_100_001_09 | ERROR | Order of characteristics column header is not correct in sample file. | Order of characteristics column header is not correct in sample file. All characteristics columns should be defined before Sample collection Protocol REF column. |
| 18 | rule_s_100_100_001_10 | ERROR | Order of factor column header is not correct in sample file. | Order of factor column header is not correct in sample file. All factor columns should be defined after Sample Name column. |
| 19 | rule_s_100_100_001_11 | ERROR | Column header structure is not correct in sample file. | Column header structure is not correct in sample file. Any ontology and unit column should have the leading columns, Term Source REF and Term Accession Number. Single columns must not have leading columns. |
| 20 | rule_s_100_100_001_12 | ERROR | Factor Value column structure is not correct in sample file. | Factor Value column structure should be ontology (with Term Source REF and Term Accession Number) or a value with unit (and Term Source REF and Term Accession Number) in sample file. |
| 21 | rule_s_100_100_001_13 | ERROR | Additional characteristics column structure is not correct in sample file. | Additional characteristics column structure should be ontology (with Term Source REF and Term Accession Number) or a value with unit (and Term Source REF and Term Accession Number) in sample file. |
| 22 | rule_s_100_100_001_14 | ERROR | Multiple Characteristics / Factor Value columns with same header are not allowed in sample file. | Characteristics and Factor Value column headers should be unique in sample file. |
| 23 | rule_s_100_100_001_15 | ERROR | Missing Factor Value columns in sample file. | There should be a Factor Value column in sample file for each study factor. |
| 24 | rule_s_100_100_001_16 | ERROR | Unexpected Factor Value columns in sample file. | There should be a study factor for each Factor Value column in sample file. |
| 25 | rule_s_100_100_002_01 | ERROR | There is no row in sample file. | No row is defined in sample file. Add more than one row (sample). Please ensure all xxx, including controls, QCs, standards, etc, are referenced. |
| 26 | rule_s_100_100_002_02 | ERROR | There is only one row in sample file. | Only one row is defined in sample file. Add more than one row (sample). Please ensure all xxx, including controls, QCs, standards, etc, are referenced. |
| 27 | rule_s_100_100_003_01 | ERROR | Sample file not referenced in investigation file. | Only one sample file is allowed and its name should be 's_(accession number).txt'. |
| 28 | rule_s_200_090_001_01 | ERROR | Values with trailing or leading spaces in sample file. | Values in sample file should not start or end with space characters. |
| 29 | rule_s_200_090_002_01 | WARNING | Ontology Term Source REF is not selected from the prioritised ontologies. | The term is not in the control list or selected ontologies. |
| 30 | rule_s_200_090_002_03 | WARNING | Ontology Term Source REF not referenced in investigation file. | All ontology Term Source REFs should be referenced in ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt. |
| 31 | rule_s_200_090_002_04 | ERROR | Ontology Term Source REF defined for empty ontology terms. | Select ontology terms and/or change ontology Term Source REF. |
| 32 | rule_s_200_090_002_05 | WARNING | Ontology Term Source REF of Unit is not selected from the prioritised ontologies. | Select a unit term from one of the prioritised sources where possible. |
| 33 | rule_s_200_090_002_06 | WARNING | Ontology Term Source REF defined for empty unit ontology terms. | Select unit ontology terms and/or change ontology Term Source REF. |
| 34 | rule_s_200_090_002_09 | ERROR | Value is not in the required ontologies or controlled lists associated with this column | A term MUST be selected from the required ontologies or controlled lists associated with this column. |
| 35 | rule_s_200_090_002_10 | WARNING | Value is not in the predefined ontologies or controlled lists associated with this column | A term SHOULD be selected from the predefined ontologies or controlled lists associated with this column. |
| 36 | rule_s_200_090_002_11 | WARNING | Factor value is not in the predefined ontologies or controlled lists associated with this column | A term SHOULD be selected from the predefined ontologies or controlled lists associated with this column. |
| 37 | rule_s_200_090_002_12 | WARNING | Characteristic value is not in the predefined ontologies or controlled lists associated with this column | A term SHOULD be selected from the predefined ontologies or controlled lists associated with this column. |
| 38 | rule_s_200_090_002_13 | ERROR | The value does not match the required pattern. | The column value MUST have a valid pattern value. |
| 39 | rule_s_200_090_002_14 | WARNING | The value does not match the recommended pattern. | The column value SHOULD have a valid pattern value. |
| 40 | rule_s_200_090_003_01 | WARNING | Term Accession Number length of ontology terms less than 3 characters. | Term Accession Number of ontology terms should be defined with length equal or greater than 3 characters. |
| 41 | rule_s_200_090_003_02 | WARNING | Term Accession Number length of unit ontology terms less than 3 characters. | Term Accession Number of unit ontology terms should be defined with length equal or greater than 3 characters. |
| 42 | rule_s_200_090_003_03 | WARNING | Term Accession Number defined for empty ontology terms. | Select ontology terms and/or change ontology Term Accession Number. |
| 43 | rule_s_200_090_003_04 | WARNING | Term Accession Number defined for empty unit ontology terms. | Select unit ontology terms and/or change ontology Term Accession Number. |
| 44 | rule_s_200_090_004_01 | ERROR | Empty value is found in a required column. | Complete all values in required columns. |
| 45 | rule_s_200_090_004_02 | ERROR | Values do not meet minimum length requirement. | Each row should have a value equal or greater than the minimum length. |
| 46 | rule_s_200_090_004_03 | ERROR | Values do not meet maximum length requirement. | Each row should have a value equal or less than the maximum length. |
| 47 | rule_s_200_090_005_01 | ERROR | Values for Protocol REF column not valid in sample file. | All rows should be filled with the same value (case sensitive). |
| 48 | rule_s_200_090_007_01 | ERROR | The value appears in the list of unexpected values for this column. | Select an alternative term or value that meets the requirement. |
| 49 | rule_s_200_090_007_02 | WARNING | The value appears in the list of not-recommended values for this column. | Select an alternative value that meets the requirement or leave it empty (if it is not required). |
| 50 | rule_s_200_090_007_03 | ERROR | The value appears in the list of default unexpected values. | Select an alternative term or value that meets the requirement. |
| 51 | rule_s_200_090_007_04 | WARNING | The value appears in the list of default not-recommended values. | Select an alternative value that meets the requirement or leave it empty (if it is not required). |
| 52 | rule_s_200_100_002_01 | ERROR | User defined Characteristics column is empty. | At least one value should be defined in Characteristics column. |
| 53 | rule_s_200_100_002_02 | WARNING | Term Source REF of the user defined characteristics ontology term is not in the priotirised control list. | We highly recommend to use the prioritised ontologies for the characteristics ontology term. |
| 54 | rule_s_200_100_002_04 | WARNING | Term Accession Number of the user defined characteristics ontology terms is empty. | We highly recommend to define accession number of the selected term. |
| 55 | rule_s_200_200_001_01 | ERROR | Sample name values are not unique in sample file. | All sample names should be unique in sample file. |
| 56 | rule_s_200_200_001_02 | ERROR | Values for Sample Name column not in any assay file. | Each sample name should be referenced at least one time in assay files. |
| 57 | rule_s_200_200_002_01 | WARNING | There are empty values in Factor Value column. | Factor values should be defined for each row. |
| 58 | rule_s_200_200_002_02 | ERROR | Factor Value column not complete. | At least two values must be defined in Factor Value column. |
| 59 | rule_s_200_200_003_01 | WARNING | Term Source REF of the factor value ontology term is not in the priotirised control list. | We highly recommend to use the prioritised Ontology Source Refs for the factor ontology term. |
