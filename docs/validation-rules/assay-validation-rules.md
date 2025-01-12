| # |RULE ID  | TYPE  | TITLE  | DESCRIPTION |
|---|---------|-------|--------|-------------|
| 1 | rule___100_300_001_01 | ERROR | There is a critical file parse error for the assay file. | There is a critical file parse error in the assay file. |
| 2 | rule___100_300_001_02 | ERROR | There is a file parse error for the assay file. | There is a file parse error for the assay file. |
| 3 | rule___100_300_001_03 | WARNING | There is a file parse warning for the assay file. | There is a file parse warning for the assay file. |
| 4 | rule___100_300_001_04 | ERROR | There is no parser information for assay file. | Define assay file in parserMessages. |
| 5 | rule___100_300_001_05 | ERROR | There is no assay file for the study. | Define an assay file for the study. |
| 6 | rule___100_300_001_06 | ERROR | Technology type not defined for assay file. | Assay file technology type should be defined to execute validation rules. |
| 7 | rule___100_300_001_07 | ERROR | Technology type not supported for assay file. | Assay file technology type is not supported. |
| 8 | rule___100_300_001_08 | ERROR | Assay file name not correct pattern. | Assay file name must start with 'a_' and have extension '.txt'. |
| 9 | rule___100_300_001_09 | ERROR | Assay file is not referenced in i_Investigation.txt file. | Update i_Investigation.txt  file to reference the assay file or delete it. |
| 10 | rule___100_300_001_10 | ERROR | Assay file name contains invalid characters. | Use only .-_A-Za-z0-9 characters for an assay file name. e.g. a_REQ2025010211233_LC-MS_negative_reverse-phase_metabolite_profiling.txt |
| 11 | rule_a_100_100_001_01 | ERROR | Invalid multi-column structure in assay file. | There is an invalid multi-column structure in assay file. Check column order. |
| 12 | rule_a_100_100_001_02 | ERROR | Unordered or unlinked column structure in assay file. | There is an unordered or unlinked column in assay file. Check column order. |
| 13 | rule_a_100_100_001_03 | ERROR | Default columns not in assay file. | Default columns must exist in assay file. |
| 14 | rule_a_100_100_001_04 | ERROR | Unexpected column in assay file. | Rename or remove unexpected columns in assay file. |
| 15 | rule_a_100_100_001_05 | ERROR | Unexpected 'Protocol REF' column in assay file. | Unexpected 'Protocol REF' column in assay file. Only one 'Protocol REF' header is allowed in assay file. |
| 16 | rule_a_100_100_001_06 | ERROR | Missing 'Protocol REF' column in assay file. | Add missing Protocol REF column or related protocol section. |
| 17 | rule_a_100_100_001_07 | ERROR | Empty columns in assay file. | Empty columns must not exist in assay file. All column headers should be defined. |
| 18 | rule_a_100_100_001_08 | ERROR | Order of default column header is not correct in assay file. | Order of default column header is not correct in assay file. |
| 19 | rule_a_100_100_001_09 | WARNING | Multiple Parameter Value columns with same header are not allowed in assay file. | Parameter Value column headers should be unique in assay file. |
| 20 | rule_a_100_100_001_10 | WARNING | Column header name defined in template is not unique in assay file. | Default column header name (except Data File columns) should be unique in assay file. |
| 21 | rule_a_100_100_001_11 | ERROR | Assay Parameter Values names not in investigation file. | Assay Parameter Value names must be referenced in i_Investigation.txt. |
| 22 | rule_a_100_100_002_01 | ERROR | Assay file not referenced in investigation file. | Assay file must be referenced in i_Investigation.txt. |
| 23 | rule_a_100_100_005_01 | ERROR | There is no row in assay file. | No row is defined in assay file. Add more than one row (run). Please ensure all xxx, including controls, QCs, standards, etc, are referenced. |
| 24 | rule_a_100_100_005_02 | ERROR | There is only one row in assay file. | Only one row is defined in assay file. Add more than one row (run). Please ensure all xxx, including controls, QCs, standards, etc, are referenced. |
| 25 | rule_a_200_090_001_01 | ERROR | Values with trailing or leading spaces in assay file. | Values in assay file should not start or end with space characters. |
| 26 | rule_a_200_090_002_01 | WARNING | Ontology Term Source REF of ontology terms not in prioritised control list. | Prioritised ontology Term Source REFs should be used for ontology terms in this column if possible. |
| 27 | rule_a_200_090_002_02 | WARNING | Ontology Term Source REF of ontology terms not in prioritised default control list. | Prioritised default ontology Term Source REFs should be used for ontology terms in this column if possible. |
| 28 | rule_a_200_090_002_03 | WARNING | Ontology Term Source REF not referenced in investigation file. | All ontology Term Source REFs should be referenced in ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt. |
| 29 | rule_a_200_090_002_04 | WARNING | Ontology Term Source REF defined for empty ontology terms. | Select ontology terms and/or change ontology Term Source REF. |
| 30 | rule_a_200_090_002_05 | WARNING | Ontology Term Source REF for a unit is defined however Term Source REF is not in prioritised control list. | We highly recommend to use the prioritised ontology Term Source REFs for an unit ontology term. |
| 31 | rule_a_200_090_002_06 | WARNING | Ontology Term Source REF defined for empty unit ontology terms. | Select unit ontology terms and/or change ontology Term Source REF. |
| 32 | rule_a_200_090_002_07 | WARNING | Term Source REF of ontology terms is empty. | Term Source REF of ontology terms should be defined. A prioritised control list is defined. Review and select from the prioritised control list if possible. |
| 33 | rule_a_200_090_002_08 | WARNING | Term Source REF of unit ontology terms is empty. | Term Source REF of unit ontology terms should be defined. A prioritised control list is defined. Review and select from the prioritised control list if possible. |
| 34 | rule_a_200_090_002_09 | WARNING | Term not in prioritised control list. | A prioritised control list is defined. Review and select from the prioritised control list if possible. |
| 35 | rule_a_200_090_002_10 | WARNING | Term Accession Number of the given term is different than accession number in control list. | Use same Term Accession Number for the term in control list. |
| 36 | rule_a_200_090_002_11 | WARNING | Empty term with an accession number in control list. | Fill term value for the given accession number in control list. |
| 37 | rule_a_200_090_002_12 | WARNING | Term Source REF for the given accession is different. | Use correct ontology Term Source REF for the accession number. |
| 38 | rule_a_200_090_003_01 | WARNING | Term Accession Number length of ontology terms less than 3 characters. | Term Accession Number of ontology terms should be defined with length equal or greater than 3 characters. |
| 39 | rule_a_200_090_003_02 | WARNING | Term Accession number length of unit ontology terms less than 3 characters. | Term Accession Number of unit ontology terms should be defined with length equal or greater than 3 characters. |
| 40 | rule_a_200_090_003_03 | WARNING | Term Accession Number defined for empty ontology terms. | Select ontology terms and/or change ontology Term Accession Number. |
| 41 | rule_a_200_090_003_04 | WARNING | Term Accession Number defined for empty unit ontology terms. | Select unit ontology terms and/or change ontology Term Accession Number. |
| 42 | rule_a_200_090_004_01 | ERROR | Required columns have empty values in assay file. | All required column values should be defined in assay file. |
| 43 | rule_a_200_090_004_02 | ERROR | Values do not meet minimum length requirement. | Each row should have a value equal or greater than the minimum length. |
| 44 | rule_a_200_090_004_03 | ERROR | Values do not meet maximum length requirement. | Each row should have a value equal or less than the maximum length. |
| 45 | rule_a_200_090_005_01 | ERROR | Values for Protocol REF column not valid in assay file. | All rows should be filled with the same value (case sensitive). |
| 46 | rule_a_200_100_001_01 | ERROR | Values for Sample Name column not in sample file. | All Sample Name column values should be defined in sample file. |
| 47 | rule_a_200_100_001_02 | WARNING | Values for Sample Name column not unique in assay file. | Often Sample Name column values will be unique. |
| 48 | rule_a_200_200_001_01 | ERROR | Metabolite assignment file name not correct pattern in assay file. | Metabolite assignment file name must start with 'm_' and have extension '.tsv'. |
| 49 | rule_a_200_200_001_02 | ERROR | Metabolite assignment file name contains invalid characters in assay file. | Use only .-_A-Za-z0-9 characters for an metabolite assignment file name in assay file. |
| 50 | rule_a_200_300_001_01 | ERROR | Both 'Raw Spectral Data File' and 'Derived Spectral Data File' not in assay file. | Raw data files or Derived data files must be defined in assay file. |
| 51 | rule_a_200_300_001_02 | WARNING | Derived Spectral Data File' is defined but 'Raw Spectral Data File' is empty in assay file. | Derived Spectral Data File is defined without Raw Spectral Data File. We recommend to upload raw file and reference it. |
| 52 | rule_a_200_300_001_03 | ERROR | Values for Raw Spectral Data File column not correct extension in assay file. | All Raw Spectral Data File column values should have extension found in control list. |
| 53 | rule_a_200_300_002_01 | WARNING | Values for MS Assay Name column not unique in assay file. | All MS Assay Name column values should be unique. |
| 54 | rule_a_200_400_001_01 | ERROR | Derived Spectral Data Files, Acquisition Parameter Data File and Free Induction Decay Data File values are empty in NMR assays. | At least one file should be defined in Derived Spectral Data Files, Free Induction Decay Data File or Acquisition Parameter Data File columns. |
| 55 | rule_a_200_400_002_01 | WARNING | Values for NMR Assay Name column not unique in assay file. | All NMR Assay Name column values should be unique. |
| 56 | rule_a_200_500_001_01 | ERROR | Values for Derived Spectral Data File column not correct extension in assay file. | All Derived Spectral Data File column values should have extension found in control list. |
| 57 | rule_a_200_600_001_01 | WARNING | Column Type column values are not same as assay file name | if all values in Column Type are in a control list, technique name defined in control list should be in assay file name. |
| 58 | rule_a_200_600_002_01 | WARNING | Scan Polarity column values are not same as assay file name | Values for Scan Polarity column not same as assay file name |
