# Metabolites Validation Rules

| # |RULE ID  | TYPE  | TITLE  | DESCRIPTION |
|---|---------|-------|--------|-------------|
| 1 | rule___100_400_001_01 | ERROR | There is a critical file parse error for the metabolite assignment file. | There is a critical file parse error for the metabolite assignment file. |
| 2 | rule___100_400_001_02 | ERROR | There is a file parse error for the metabolite assignment file. | There is a file parse error for the metabolite assignment file. |
| 3 | rule___100_400_001_03 | WARNING | There is a file parse warning for the metabolite assignment file. | There is a file parse warning for the metabolite assignment file. |
| 4 | rule___100_400_001_04 | ERROR | There is no parser information for metabolite assignment file. | Define metabolite assignment file in parserMessages. |
| 5 | rule___100_400_001_05 | ERROR | Technology type not defined for metabolite assignment file. | Assignment file technology type must be defined to execute file type validation rules. |
| 6 | rule___100_400_001_06 | ERROR | Metabolite assignment file is not referenced in assay file(s). | Update assay files to reference the metabolite assignment or delete it. |
| 7 | rule___100_400_001_07 | ERROR | Metabolite assignment file name not correct pattern. | Metabolite assignment file name must start with 'm_' and have extension '.tsv'. |
| 8 | rule___100_400_001_08 | ERROR | Metabolite assignment file name contains invalid characters. | Use only .-_A-Za-z0-9 characters for an metabolite assignment file name. e.g. m_REQ2025010211233_LC-MS_negative_reverse-phase_metabolite_profiling_v2_maf.tsv |
| 9 | rule_m_100_100_001_01 | ERROR | Default columns not in metabolite assignment file. | Default columns must exist in metabolite assignment file. |
| 10 | rule_m_100_100_001_02 | ERROR | Unordered columns in metabolite assignment file. | Unordered columns in metabolite assignment file. |
| 11 | rule_m_100_100_001_03 | ERROR | Empty columns in metabolite assignment file. | Empty columns must not exist in metabolite assignment file. All column headers should be defined. |
| 12 | rule_m_100_100_001_04 | ERROR | Default column header name is not unique in the metabolite assignment file. | Default column header name should be unique in the metabolite assignment file. |
| 13 | rule_m_100_100_002_01 | WARNING | Sample Name columns not in metabolite assignment file. | Sample Name columns must exist in metabolite assignment file. |
| 14 | rule_m_100_100_002_02 | WARNING | MS Assay Name or NMR Assay Name columns not in metabolite assignment file | If Sample Name columns do not exist, MS Assay Name or NMR Assay Name columns should be defined in metabolite assignment file. |
| 15 | rule_m_100_100_004_01 | ERROR | Metabolite assignment file not referenced in assay file. | Metabolite assignment file must be referenced in assay file. |
| 16 | rule_m_100_100_005_01 | ERROR | Metabolite assignment file name not correct pattern. | Metabolite assignment file name must start with 'm_' and have extension '.tsv'. |
| 17 | rule_m_100_100_006_01 | ERROR | There is no row in metabolite assignment file. | No row is defined in metabolite assignment file. Add more than one row (assignment). Please ensure all xxx, including controls, QCs, standards, etc, are referenced. |
| 18 | rule_m_100_100_006_02 | ERROR | There is only one row in metabolite assignment file. | Only one row is defined in metabolite assignment file. Add more than one row (assignment). Please ensure all xxx, including controls, QCs, standards, etc, are referenced. |
| 19 | rule_m_300_090_001_01 | ERROR | Values with trailing or leading spaces in metabolite assignment file. | Values in metabolite assignment file should not start or end with space characters. |
| 20 | rule_m_300_090_005_01 | ERROR | Values for required columns not in metabolite assignment file. | All required column values should be defined in metabolite assignment file. |
| 21 | rule_m_300_090_005_02 | ERROR | Values do not meet minimum length requirement. | Each row must have a value equal or greater than the minimum length. |
| 22 | rule_m_300_090_005_03 | ERROR | Values do not meet maximum length requirement. | Each row must have a value equal or less than the maximum length. |
| 23 | rule_m_300_100_001_01 | ERROR | mass_to_charge column has empty values in metabolite assignment file. | All 'mass_to_charge' column values must be defined in metabolite assignment file. |
| 24 | rule_m_300_100_001_02 | ERROR | retention_time column has empty values in metabolite assignment file. | All 'retention_time' column values must be defined in metabolite assignment file for LC-MS / GC-MS. |
| 25 | rule_m_300_100_001_03 | WARNING | retention_time column values not numeric in metabolite assignment file. | All 'retention_time' column values should be numeric. |
| 26 | rule_m_300_200_001_01 | WARNING | chemical_shift column has empty values in metabolite assignment file. | All 'chemical_shift' column values should be defined in metabolite assignment file. |
| 27 | rule_m_300_200_001_02 | WARNING | chemical_shift column values not numeric in metabolite assignment file. | All 'chemical_shift' column values should be numeric in metabolite assignment file. |
| 28 | rule_m_300_200_001_03 | WARNING | multiplicity column has empty values in metabolite assignment file. | All 'multiplicity' column values should be defined in metabolite assignment file. |
