# Assays Validation Rules

| # |RULE ID  | TYPE  | TITLE  | DESCRIPTION |
|---|---------|-------|--------|-------------|
| 1 | rule___100_300_001_01 | ERROR | There is a critical file parse error for the assay file. | There is a critical file parse error for the assay file. |
| 2 | rule___100_300_001_02 | ERROR | There is a file parse error for the assay file. | There is a file parse error for the assay file. |
| 3 | rule___100_300_001_03 | WARNING | There is a file parse warning for the assay file. | There is a file parse warning for the assay file. |
| 4 | rule___100_300_001_04 | ERROR | There is no parser information for assay file. | Define assay file in parserMessages. |
| 5 | rule___100_300_001_05 | ERROR | There is no assay file for the study. | Define an assay file for the study. |
| 6 | rule___100_300_001_06 | ERROR | Technology type not defined for assay file. | Assay file technology type must be defined to execute validation rules. |
| 7 | rule___100_300_001_07 | ERROR | Technology type not supported for assay file. | Assay file technology type not supported. |
| 8 | rule___100_300_001_08 | ERROR | Assay file name not correct pattern. | Assay file name must start with 'a_' and have extension '.txt'. |
| 9 | rule___100_300_001_09 | ERROR | Assay file is not referenced in i_Investigation.txt file. | Update i_Investigation.txt  file to reference the assay file or delete it. |
| 10 | rule___100_300_001_10 | ERROR | Assay file name contains invalid characters. | Use only .-_A-Za-z0-9 characters for an assay file name. e.g. a_REQ2025010211233_LC-MS_negative_reverse-phase_metabolite_profiling.txt |
| 11 | rule_a_100_100_001_01 | ERROR | Invalid multi-column structure in assay file. | There is an invalid multi-column structure in assay file. Check column order. |
| 12 | rule_a_100_100_001_02 | ERROR | Unordered or unlinked column structure in assay file. | There is an unordered or unlinked column in assay file. Check column order. |
| 13 | rule_a_100_100_001_03 | ERROR | Default columns not in assay file. | Default columns must exist in assay file. |
| 14 | rule_a_100_100_001_04 | ERROR | Unexpected column in assay file. | Rename or remove unexpected columns in assay file. |
| 15 | rule_a_100_100_001_05 | ERROR | Unexpected 'Protocol REF' column in assay file. | Unexpected 'Protocol REF' column in assay file. Only one 'Protocol REF' header is allowed in assay file. |
| 16 | rule_a_100_100_001_06 | ERROR | Missing 'Protocol REF' column in assay file. | Add missing 'Protocol REF' column or related protocol section in assay file. |
| 17 | rule_a_100_100_001_07 | ERROR | Empty columns in assay file. | Empty columns must not exist in assay file. All column headers must be defined. |
| 18 | rule_a_100_100_001_08 | ERROR | Order of default column header is not correct in assay file. | Order of default column header is not correct in assay file. |
| 19 | rule_a_100_100_001_09 | WARNING | Multiple Parameter Value columns with same header are not allowed in assay file. | Parameter Value column headers should be unique in assay file. |
| 20 | rule_a_100_100_001_10 | WARNING | Column header name defined in template is not unique in assay file. | Default column header name (except Data File and Protocol REF columns) should be unique in assay file. |
| 21 | rule_a_100_100_001_11 | ERROR | Assay Parameter Value names not in investigation file. | Assay Parameter Value names must be referenced in i_Investigation.txt. |
| 22 | rule_a_100_100_001_12 | ERROR | Column name defined in MetaboLights template does not exist in assay file. | Add all missing columns defined in MetaboLights assay template. |
| 23 | rule_a_100_100_001_13 | ERROR | Column header structure is not correct in assay file. | Column header structure is not correct in assay file. Any ontology and unit column should have the leading columns, Term Source REF and Term Accession Number. Single columns must not have leading columns. |
| 24 | rule_a_100_100_002_01 | ERROR | Assay file not referenced in investigation file. | Assay file must be referenced in i_Investigation.txt. |
| 25 | rule_a_100_100_005_01 | ERROR | There is no row in assay file. | No row is defined in assay file. Add more than one row (run). Please ensure all samples, including controls, QCs, standards, etc, are referenced. |
| 26 | rule_a_100_100_005_02 | ERROR | There is only one row in assay file. | Only one row is defined in assay file. Add more than one row (run). Please ensure all sample, including controls, QCs, standards, etc, are referenced. |
| 27 | rule_a_200_090_001_01 | ERROR | Values with trailing or leading spaces in assay file. | Values in assay file should not start or end with space characters. |
| 28 | rule_a_200_090_002_01 | ERROR | Ontology Term Source REF is not selected from the prioritised ontologies. | Select a term from one of the prioritised sources where possible. |
| 29 | rule_a_200_090_002_02 | WARNING | Ontology Term Source REF is not selected from the default prioritised ontologies. | Select a term from one of the prioritised sources where possible. |
| 30 | rule_a_200_090_002_03 | WARNING | Ontology Term Source REF not referenced in investigation file. | All ontology Term Source REFs should be referenced in ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt. |
| 31 | rule_a_200_090_002_04 | WARNING | Ontology Term Source REF defined for empty ontology terms. | Select ontology terms and/or change ontology Term Source REF. |
| 32 | rule_a_200_090_002_05 | WARNING | Ontology Term Source REF of Unit is not selected from the prioritised ontologies. | Select a unit term from one of the prioritised sources where possible. |
| 33 | rule_a_200_090_002_06 | WARNING | Ontology Term Source REF defined for empty unit ontology terms. | Select unit ontology terms and/or change ontology Term Source REF. |
| 34 | rule_a_200_090_002_09 | ERROR | Term is not in the control list. | The term MUST be in the selected ontology terms. |
| 35 | rule_a_200_090_002_10 | ERROR | Value is not in the control list. | The value MUST be in the selected values. |
| 36 | rule_a_200_090_002_13 | ERROR | Term is not in the selected ontologies. | The term MUST be defined in the the selected ontologies. |
| 37 | rule_a_200_090_002_14 | ERROR | Term is not a child of of the selected ontology terms. | The term MUST be a child of the selected ontology terms. |
| 38 | rule_a_200_090_002_15 | ERROR | Value has not a valid pattern. | The column value must have a valid pattern value. |
| 39 | rule_a_200_090_003_01 | WARNING | Term Accession Number length of ontology terms less than 3 characters. | Term Accession Number of ontology terms should be defined with length equal or greater than 3 characters. |
| 40 | rule_a_200_090_003_02 | WARNING | Term Accession number length of unit ontology terms less than 3 characters. | Term Accession Number of unit ontology terms should be defined with length equal or greater than 3 characters. |
| 41 | rule_a_200_090_003_03 | WARNING | Term Accession Number defined for empty ontology terms. | Select ontology terms and/or change ontology Term Accession Number. |
| 42 | rule_a_200_090_003_04 | WARNING | Term Accession Number defined for empty unit ontology terms. | Select unit ontology terms and/or change ontology Term Accession Number. |
| 43 | rule_a_200_090_004_01 | ERROR | Required columns have empty values in assay file. | All required column values should be defined in assay file. |
| 44 | rule_a_200_090_004_02 | ERROR | Values do not meet minimum length requirement. | Each row should have a value equal or greater than the minimum length. |
| 45 | rule_a_200_090_004_03 | ERROR | Values do not meet maximum length requirement. | Each row should have a value equal or less than the maximum length. |
| 46 | rule_a_200_090_005_01 | ERROR | Values for Protocol REF column not valid in assay file. | All rows should be filled with the same value (case sensitive). |
| 47 | rule_a_200_100_001_01 | ERROR | Values for Sample Name column not in sample file. | All Sample Name column values should be defined in sample file. |
| 48 | rule_a_200_100_001_02 | WARNING | Values for Sample Name column not unique in assay file. | Often Sample Name column values will be unique. |
| 49 | rule_a_200_200_001_01 | ERROR | Metabolite assignment file name not correct pattern in assay file. | Metabolite assignment file name must start with 'm_' and have extension '.tsv'. |
| 50 | rule_a_200_200_001_02 | ERROR | Metabolite assignment file name contains invalid characters in assay file. | Use only .-_A-Za-z0-9 characters for an metabolite assignment file name in assay file. |
| 51 | rule_a_200_300_001_01 | ERROR | Both 'Raw Spectral Data File' and 'Derived Spectral Data File' not in assay file. | Raw data files or Derived data files must be defined in assay file. |
| 52 | rule_a_200_300_001_02 | WARNING | Derived Spectral Data File' is defined but 'Raw Spectral Data File' is empty in assay file. | Derived Spectral Data File is defined without Raw Spectral Data File. We recommend to upload raw file and reference it. |
| 53 | rule_a_200_300_001_03 | ERROR | Values for Raw Spectral Data File column not correct extension in assay file. | All Raw Spectral Data File column values should have extension found in control list. |
| 54 | rule_a_200_300_002_01 | WARNING | Values for MS Assay Name column not unique in assay file. | All MS Assay Name column values should be unique. |
| 55 | rule_a_200_300_003_01 | WARNING | Scan Polarity column values are not same as assay file name. | Values for Scan Polarity column is not same as assay file name. |
| 56 | rule_a_200_300_003_02 | ERROR | Scan Polarity column values are not unique. | Define only one scan polarity value in each assay file. |
| 57 | rule_a_200_400_001_01 | ERROR | Derived Spectral Data Files, Acquisition Parameter Data File and Free Induction Decay Data File values are empty in NMR assays. | At least one file should be defined in Derived Spectral Data Files, Free Induction Decay Data File or Acquisition Parameter Data File columns. |
| 58 | rule_a_200_400_002_01 | WARNING | Values for NMR Assay Name column not unique in assay file. | All NMR Assay Name column values should be unique. |
| 59 | rule_a_200_500_001_01 | ERROR | Values for Derived Spectral Data File column not correct extension in assay file. | All Derived Spectral Data File column values should have extension found in control list. |
| 60 | rule_a_200_600_001_01 | WARNING | Column Type column values are not same as assay file name. | if all values in Column Type are in a control list, technique name defined in control list should be in assay file name. |
