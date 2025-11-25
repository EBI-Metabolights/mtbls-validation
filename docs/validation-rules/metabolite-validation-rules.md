# Metabolites Validation Rules

| # |RULE ID  | TYPE  | TITLE  | DESCRIPTION |
|---|---------|-------|--------|-------------|
| 1 | rule\_\_\_100\_400\_001\_01 | ERROR | There is a critical file parse error for the metabolite assignment file\. | There is a critical file parse error for the metabolite assignment file\. |
| 2 | rule\_\_\_100\_400\_001\_02 | ERROR | There is a file parse error for the metabolite assignment file\. | There is a file parse error for the metabolite assignment file\. |
| 3 | rule\_\_\_100\_400\_001\_03 | WARNING | There is a file parse warning for the metabolite assignment file\. | There is a file parse warning for the metabolite assignment file\. |
| 4 | rule\_\_\_100\_400\_001\_04 | ERROR | There is no parser information for metabolite assignment file\. | Define metabolite assignment file in parserMessages\. |
| 5 | rule\_\_\_100\_400\_001\_05 | ERROR | Technology type not defined for metabolite assignment file\. | Assignment file technology type must be defined to execute file type validation rules\. |
| 6 | rule\_\_\_100\_400\_001\_06 | ERROR | Metabolite assignment file is not referenced in assay file\(s\)\. | Update assay files to reference the metabolite assignment or delete it\. |
| 7 | rule\_\_\_100\_400\_001\_07 | ERROR | Metabolite assignment file name not correct pattern\. | Metabolite assignment file name must start with 'm\_' and have extension '\.tsv'\. |
| 8 | rule\_\_\_100\_400\_001\_08 | ERROR | Metabolite assignment file name contains invalid characters\. | Use only \.\-\_A\-Za\-z0\-9 characters for an metabolite assignment file name\. e\.g\. m\_REQ2025010211233\_LC\-MS\_negative\_reverse\-phase\_metabolite\_profiling\_v2\_maf\.tsv |
| 9 | rule\_m\_100\_100\_001\_01 | ERROR | Default columns not in metabolite assignment file\. | Default columns must exist in metabolite assignment file\. |
| 10 | rule\_m\_100\_100\_001\_02 | ERROR | Unordered columns in metabolite assignment file\. | Unordered columns in metabolite assignment file\. |
| 11 | rule\_m\_100\_100\_001\_03 | ERROR | Empty columns in metabolite assignment file\. | Empty columns must not exist in metabolite assignment file\. All column headers should be defined\. |
| 12 | rule\_m\_100\_100\_001\_04 | ERROR | Default column header name is not unique in the metabolite assignment file\. | Default column header name should be unique in the metabolite assignment file\. |
| 13 | rule\_m\_100\_100\_002\_01 | WARNING | Sample Name columns not in metabolite assignment file\. | Sample Name columns must exist in metabolite assignment file\. |
| 14 | rule\_m\_100\_100\_002\_02 | WARNING | MS Assay Name or NMR Assay Name columns not in metabolite assignment file | If Sample Name columns do not exist, MS Assay Name or NMR Assay Name columns should be defined in metabolite assignment file\. |
| 15 | rule\_m\_100\_100\_004\_01 | ERROR | Metabolite assignment file not referenced in assay file\. | Metabolite assignment file must be referenced in assay file\. |
| 16 | rule\_m\_100\_100\_005\_01 | ERROR | Metabolite assignment file name not correct pattern\. | Metabolite assignment file name must start with 'm\_' and have extension '\.tsv'\. |
| 17 | rule\_m\_100\_100\_006\_01 | ERROR | There is no row in metabolite assignment file\. | No row is defined in metabolite assignment file\. Add more than one row \(assignment\)\. Please ensure all xxx, including controls, QCs, standards, etc, are referenced\. |
| 18 | rule\_m\_100\_100\_006\_02 | ERROR | There is only one row in metabolite assignment file\. | Only one row is defined in metabolite assignment file\. Add more than one row \(assignment\)\. Please ensure all xxx, including controls, QCs, standards, etc, are referenced\. |
| 19 | rule\_m\_300\_090\_001\_01 | ERROR | Values with trailing or leading spaces in metabolite assignment file\. | Values in metabolite assignment file should not start or end with space characters\. |
| 20 | rule\_m\_300\_090\_005\_01 | ERROR | Values for required columns not in metabolite assignment file\. | All required column values should be defined in metabolite assignment file\. |
| 21 | rule\_m\_300\_090\_005\_02 | ERROR | Values do not meet minimum length requirement\. | Each row must have a value equal or greater than the minimum length\. |
| 22 | rule\_m\_300\_090\_005\_03 | ERROR | Values do not meet maximum length requirement\. | Each row must have a value equal or less than the maximum length\. |
| 23 | rule\_m\_300\_100\_001\_01 | ERROR | mass\_to\_charge column has empty values in metabolite assignment file\. | All 'mass\_to\_charge' column values must be defined in metabolite assignment file\. |
| 24 | rule\_m\_300\_100\_001\_02 | ERROR | retention\_time column has empty values in metabolite assignment file\. | All 'retention\_time' column values must be defined in metabolite assignment file for LC\-MS / GC\-MS\. |
| 25 | rule\_m\_300\_100\_001\_03 | WARNING | retention\_time column values not numeric in metabolite assignment file\. | All 'retention\_time' column values should be numeric\. |
| 26 | rule\_m\_300\_200\_001\_01 | WARNING | chemical\_shift column has empty values in metabolite assignment file\. | All 'chemical\_shift' column values should be defined in metabolite assignment file\. |
| 27 | rule\_m\_300\_200\_001\_02 | WARNING | chemical\_shift column values not numeric in metabolite assignment file\. | All 'chemical\_shift' column values should be numeric in metabolite assignment file\. |
| 28 | rule\_m\_300\_200\_001\_03 | WARNING | multiplicity column has empty values in metabolite assignment file\. | All 'multiplicity' column values should be defined in metabolite assignment file\. |
