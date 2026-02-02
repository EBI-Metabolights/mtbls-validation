# Investigation Validation Rules

| # |RULE ID  | TYPE  | TITLE  | DESCRIPTION |
|---|---------|-------|--------|-------------|
| 1 | rule\_\_\_100\_100\_100\_01 | ERROR | There is a critical file parse error for i\_Investigation\.txt\. | Update i\_Investigation\.txt file considering error messages\. |
| 2 | rule\_\_\_100\_100\_100\_02 | ERROR | There is a file parse error for i\_Investigation\.txt\. | Update i\_Investigation\.txt file considering error messages\. |
| 3 | rule\_\_\_100\_100\_100\_03 | WARNING | There is a file parse warning for i\_Investigation\.txt\. | Update i\_Investigation\.txt file considering warning messages\. |
| 4 | rule\_\_\_100\_100\_100\_04 | ERROR | Investigation file name is not i\_Investigation\.txt | Update investigation name as i\_Investigation\.txt |
| 5 | rule\_\_\_100\_100\_100\_05 | ERROR | There is no parser information for i\_Investigation\.txt\. | Define i\_Investigation\.txt in parserMessages\. |
| 6 | rule\_\_\_100\_100\_100\_06 | ERROR | Unreferenced investigation files\. | Delete multiple investigation file within study folder\. |
| 7 | rule\_i\_100\_100\_001\_01 | WARNING | Term Source Name length less than 2 characters in investigation file\. | Term Source Name should be defined with length equal or greater than 2 characters in the ONTOLOGY SOURCE REFERENCE section in i\_Investigation\.txt\. |
| 8 | rule\_i\_100\_100\_002\_01 | WARNING | Term Source File length less than 2 characters in investigation file\. | Term Source File should be defined with length equal or greater than 2 characters in the ONTOLOGY SOURCE REFERENCE section in i\_Investigation\.txt\. |
| 9 | rule\_i\_100\_300\_001\_01 | ERROR | No study referenced in investigation file\. | Only one study should be defined in i\_Investigation\.txt\. |
| 10 | rule\_i\_100\_300\_001\_02 | ERROR | More than one study referenced in investigation file\. | Only one study should be defined in i\_Investigation\.txt\. |
| 11 | rule\_i\_100\_300\_002\_01 | ERROR | Study Identifier not valid\. | Study Identifier should be valid format \(e\.g\., MTBLS\(positive\_number\) or REQ\(datetime\)\)\. |
| 12 | rule\_i\_100\_300\_003\_01 | ERROR | Study Title length less than 25 characters\. | Study Title should be defined with length equal or greater than 25 characters\. Please use same title as first publication\. |
| 13 | rule\_i\_100\_300\_003\_02 | ERROR | Non\-printable characters in Study Title\. | Study title should contain only printable characters\. |
| 14 | rule\_i\_100\_300\_003\_03 | ERROR | Study Title contains only template message\. | Study title should be updated\. Do not use template message 'Please update the study title'\. |
| 15 | rule\_i\_100\_300\_004\_01 | ERROR | Study Description length less than 60 characters\. | Study Description should be defined with length equal or greater than 60 characters\. Please use abstract of first publication\. |
| 16 | rule\_i\_100\_300\_004\_02 | ERROR | Study abstract/description contains only template message\. | Study abstract/description should be updated\. Do not use template message 'Please update the study abstract/description'\. |
| 17 | rule\_i\_100\_300\_004\_03 | ERROR | Unexpected characters in Study Description\. | Study title should contain only printable characters\. |
| 18 | rule\_i\_100\_300\_005\_01 | WARNING | Study Submission Date not valid\. | Study Submission Date should be valid date and ISO8601 format \(e\.g\., 2023\-01\-01\)\. |
| 19 | rule\_i\_100\_300\_006\_01 | WARNING | Study Public Release Date not valid\. | Study Public Release Date should be valid date and ISO8601 format \(e\.g\., 2023\-01\-01\)\. |
| 20 | rule\_i\_100\_310\_001\_01 | ERROR | There are less than 3 Study Design Descriptors in the Study Design Descriptors section of investigation file\. | At least 3 study design descriptors should be defined\. |
| 21 | rule\_i\_100\_310\_002\_01 | ERROR | Study Design Type is empty\. | Study Design Type should be defined\. |
| 22 | rule\_i\_100\_310\_002\_11 | ERROR | Value is not in the required ontologies or controlled lists associated with this field\. | A term MUST be selected from the required ontologies or controlled lists associated with this field\. |
| 23 | rule\_i\_100\_310\_002\_12 | WARNING | Value is not in the predefined ontologies or controlled lists associated with this field\. | A term SHOULD be selected from the predefined ontologies or controlled lists associated with this field\. |
| 24 | rule\_i\_100\_310\_002\_13 | WARNING | Value is not in the default ontologies or controlled lists | A term SHOULD be selected from the default ontologies or controlled lists\. |
| 25 | rule\_i\_100\_310\_002\_14 | WARNING | Study Design Type Term Source REF not referenced in investigation file\. | Study Design Type Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i\_Investigation\.txt\. |
| 26 | rule\_i\_100\_320\_001\_01 | ERROR | No study publications referenced in investigation file\. | At least one study publications must be defined in i\_Investigation\.txt\. |
| 27 | rule\_i\_100\_320\_003\_01 | ERROR | DOI is required for published study publication\. | A study publication with status published should have valid DOI\. |
| 28 | rule\_i\_100\_320\_003\_02 | ERROR | DOI format invalid for study publication\. | If DOI is defined, its format should be a valid\. |
| 29 | rule\_i\_100\_320\_004\_02 | ERROR | PubMed ID format invalid for study publication\. | If PubMed ID is defined, its format should be valid PubMed ID\. Valid PubMed ID contains only digits\. |
| 30 | rule\_i\_100\_320\_005\_01 | ERROR | Study Publication Title length less than 20 characters\. | Study Publication Title must be defined with length equal or greater than 25 characters\. |
| 31 | rule\_i\_100\_320\_006\_01 | ERROR | Study Publication Author List is empty\. | Study Publication Author List must be defined\. |
| 32 | rule\_i\_100\_320\_007\_01 | ERROR | Study Publication Status Term is empty\. | Study Publication Status Term should be defined |
| 33 | rule\_i\_100\_320\_007\_11 | ERROR | Value is not in the required ontologies or controlled lists associated with this field\. | A term MUST be selected from the required ontologies or controlled lists associated with this field\. |
| 34 | rule\_i\_100\_320\_007\_12 | WARNING | Value is not in the predefined ontologies or controlled lists associated with this field\. | A term SHOULD be selected from the predefined ontologies or controlled lists associated with this field\. |
| 35 | rule\_i\_100\_320\_007\_13 | WARNING | Value is not in the default ontologies or controlled lists | A term SHOULD be selected from the default ontologies or controlled lists\. |
| 36 | rule\_i\_100\_320\_007\_14 | WARNING | Study Publication Status Term Source REF not referenced in investigation file\. | Study Publication Status Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i\_Investigation\.txt\. |
| 37 | rule\_i\_100\_330\_001\_01 | ERROR | No study factors referenced in investigation file\. | At least one study factors must be defined in i\_Investigation\.txt\. |
| 38 | rule\_i\_100\_330\_002\_01 | ERROR | Study Factor Name is empty\. | Study Factor Name must be defined\. |
| 39 | rule\_i\_100\_330\_003\_01 | ERROR | Study Factor Type Term Source REF is empty\. | Study Factor Type Term Source REF should be defined\. |
| 40 | rule\_i\_100\_330\_003\_11 | ERROR | Value is not in the required ontologies or controlled lists associated with this field\. | A term MUST be selected from the required ontologies or controlled lists associated with this field\. |
| 41 | rule\_i\_100\_330\_003\_12 | WARNING | Value is not in the predefined ontologies or controlled lists associated with this field\. | A term SHOULD be selected from the predefined ontologies or controlled lists associated with this field\. |
| 42 | rule\_i\_100\_330\_003\_13 | WARNING | Value is not in the default ontologies or controlled lists | A term SHOULD be selected from the default ontologies or controlled lists\. |
| 43 | rule\_i\_100\_330\_003\_14 | WARNING | Study Factor Type Term Source REF is not referenced in investigation file\. | Study Factor Type Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i\_Investigation\.txt\. |
| 44 | rule\_i\_100\_340\_001\_01 | ERROR | No study assays referenced in investigation file\. | At least one study assays should be defined in i\_Investigation\.txt\. |
| 45 | rule\_i\_100\_340\_002\_01 | ERROR | Study Assay File Name is empty in investigation file\. | Assay file name should be set for each study in i\_Investigation\.txt\. |
| 46 | rule\_i\_100\_340\_002\_02 | ERROR | Study Assay File Name not correct pattern\. | Assay file name must start with 'a\_' and have extension '\.txt'\. |
| 47 | rule\_i\_100\_340\_002\_03 | ERROR | There are invalid characters in assay file name\. | Use only \.\-\_A\-Za\-z0\-9 characters for an assay file name\. |
| 48 | rule\_i\_100\_340\_002\_04 | ERROR | Study Assay File Name must be unique\. | Assay file name must be unique for each study in i\_Investigation\.txt\. |
| 49 | rule\_i\_100\_340\_003\_01 | ERROR | Study Assay Measurement Type is empty\. | Study Assay Measurement Type should be defined\. |
| 50 | rule\_i\_100\_340\_003\_11 | ERROR | Value is not in the required ontologies or controlled lists associated with this field\. | A term MUST be selected from the required ontologies or controlled lists associated with this field\. |
| 51 | rule\_i\_100\_340\_003\_12 | WARNING | Value is not in the predefined ontologies or controlled lists associated with this field\. | A term SHOULD be selected from the predefined ontologies or controlled lists associated with this field\. |
| 52 | rule\_i\_100\_340\_003\_13 | WARNING | Value is not in the default ontologies or controlled lists | A term SHOULD be selected from the default ontologies or controlled lists\. |
| 53 | rule\_i\_100\_340\_003\_14 | ERROR | Study Assay Measurement Type Term Source REF not referenced in investigation file\. | Study Assay Measurement Type Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i\_Investigation\.txt\. |
| 54 | rule\_i\_100\_340\_006\_01 | ERROR | Study Assay Technology Type is empty\. | Study Assay Technology Type should be defined\. |
| 55 | rule\_i\_100\_340\_006\_11 | ERROR | Value is not in the required ontologies or controlled lists associated with this field\. | A term MUST be selected from the required ontologies or controlled lists associated with this field\. |
| 56 | rule\_i\_100\_340\_006\_12 | WARNING | Value is not in the predefined ontologies or controlled lists associated with this field\. | A term SHOULD be selected from the predefined ontologies or controlled lists associated with this field\. |
| 57 | rule\_i\_100\_340\_006\_13 | WARNING | Value is not in the default ontologies or controlled lists | A term SHOULD be selected from the default ontologies or controlled lists\. |
| 58 | rule\_i\_100\_340\_006\_14 | ERROR | Study Assay Technology Type Term Source REF not referenced in investigation file\. | Study Assay Technology Type Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i\_Investigation\.txt\. |
| 59 | rule\_i\_100\_340\_009\_01 | ERROR | Study Assay Technology Platform is empty\. | Study Assay Technology Platform should be defined\. |
| 60 | rule\_i\_100\_350\_001\_01 | ERROR | No study protocols referenced in investigation file\. | At least one study protocols should be defined in i\_Investigation\.txt\. |
| 61 | rule\_i\_100\_350\_001\_02 | ERROR | A study protocol is missing in investigation file\. | All study protocols should be defined considering assay technologies used in study\. |
| 62 | rule\_i\_100\_350\_002\_01 | ERROR | Study Protocol Name length less than 3 characters\. | Study Protocol Name should be defined with length equal or greater than 3 characters\. |
| 63 | rule\_i\_100\_350\_003\_01 | ERROR | Study Protocol Description length less than 40 characters\. | Study Protocol Description should be defined with length equal or greater than 40 characters\. |
| 64 | rule\_i\_100\_350\_003\_02 | ERROR | Non\-printable characters in Study Protocol Description\. | Study Protocol Description should contain only printable characters\. |
| 65 | rule\_i\_100\_350\_003\_03 | ERROR | Study Protocol Description contains only template message\. | Study Protocol Description should be updated\. Do not use template message\. |
| 66 | rule\_i\_100\_350\_004\_01 | WARNING | Study Protocol Type length less than 3 characters\. | Study Protocol Type should be defined with length equal or greater than 3 characters\. |
| 67 | rule\_i\_100\_350\_007\_01 | ERROR | Study protocol parameter is missing for a study protocol\. | All default study protocol parameters should be defined for study protocol\. |
| 68 | rule\_i\_100\_350\_008\_01 | ERROR | Study Protocol Parameters Name length less than 3 characters\. | Study protocol parameters name should be defined with length equal or greater than 3 characters\. |
| 69 | rule\_i\_100\_360\_001\_01 | ERROR | No study contacts referenced in investigation file\. | At least one study contacts should be defined in i\_Investigation\.txt\. |
| 70 | rule\_i\_100\_360\_002\_01 | ERROR | Study Person First Name length less than 2 characters\. | Study Person First Name should be defined with length equal or greater than 2 characters\. |
| 71 | rule\_i\_100\_360\_003\_01 | ERROR | Study Person Last Name length less than 2 characters\. | Study Person Last Name should be defined with length equal or greater than 2 characters\. |
| 72 | rule\_i\_100\_360\_004\_01 | ERROR | Study contacts have no email address\. | At least one study contact must have an email address\. |
| 73 | rule\_i\_100\_360\_004\_02 | ERROR | Study Person Email not valid\. | Study Person Email must have valid format\. |
| 74 | rule\_i\_100\_360\_006\_01 | ERROR | Study Person affiliation length is less than 10 characters\. | Define full name of contact's primary affiliation\. e\.g\. European Bioinformatics Institute |
| 75 | rule\_i\_100\_360\_007\_01 | ERROR | Study Person Roles is empty\. | At least one role should be defined for a study contact\. |
| 76 | rule\_i\_100\_360\_008\_01 | WARNING | Study Person Role value is empty\. | Study Person Role should be defined\. |
| 77 | rule\_i\_100\_360\_008\_11 | ERROR | Value is not in the required ontologies or controlled lists associated with this field\. | A term MUST be selected from the required ontologies or controlled lists associated with this field\. |
| 78 | rule\_i\_100\_360\_008\_12 | WARNING | Value is not in the predefined ontologies or controlled lists associated with this field\. | A term SHOULD be selected from the predefined ontologies or controlled lists associated with this field\. |
| 79 | rule\_i\_100\_360\_008\_13 | WARNING | Value is not in the default ontologies or controlled lists | A term SHOULD be selected from the default ontologies or controlled lists\. |
| 80 | rule\_i\_100\_360\_008\_14 | WARNING | Study Person Roles Term Source REF not referenced in investigation file\. | Study Person Roles Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i\_Investigation\.txt\. |
| 81 | rule\_i\_100\_360\_010\_03 | WARNING | Study Person Roles Term Source REF is empty\. | Study Person Roles Term Source REF should be defined\. |
| 82 | rule\_i\_100\_360\_011\_01 | ERROR | There is no study contact with Principal Investigator role\. | At least one study contact must have Principal Investigator role\. |
| 83 | rule\_i\_100\_360\_011\_02 | ERROR | Principal Investigator contact details not defined\. | Principal Investigator first name, last name, affiliation, and email must be defined\. |
| 84 | rule\_i\_100\_360\_011\_03 | ERROR | Study Person Affiliation ROR ID is not valid\. | Study Person ROR ID must have valid format\. e\.g\., https://ror\.org/02catss52 \. If your affiliation ROR ID is not defined, you may provide wikidata URL of your primary affiliation\. e\.g\., https://www\.wikidata\.org/wiki/Q1341845 |
| 85 | rule\_i\_100\_360\_011\_04 | ERROR | Study Person ORCID is not valid\. | Study Person ORCID must have valid format\. |
| 86 | rule\_i\_100\_360\_011\_05 | ERROR | Study Person Additional Email Address is not valid\. | Study Person Additional Email Address must have valid format\. |
| 87 | rule\_i\_100\_360\_011\_06 | WARNING | Study Person ORCID is not defined for principal investigator\. | Study Person ORCID is not defined for principal investigator\. |
| 88 | rule\_i\_100\_360\_011\_07 | WARNING | Study Person Affiliation ROR ID is not defined for principal investigator\. | Study Person Affiliation ROR ID is not defined for principal investigator\. |
| 89 | rule\_i\_200\_900\_001\_01 | WARNING | Ontology terms are not validated on ontology search service \(e\.g\. OLS\)\. | Ensure ontology terms are valid and accessible on ontology search service\. |
