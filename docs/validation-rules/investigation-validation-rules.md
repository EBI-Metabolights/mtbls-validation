# Investigation Validation Rules

| # |RULE ID  | TYPE  | TITLE  | DESCRIPTION |
|---|---------|-------|--------|-------------|
| 1 | rule___100_100_100_01 | ERROR | There is a critical file parse error for i_Investigation.txt. | Update i_Investigation.txt file considering error messages. |
| 2 | rule___100_100_100_02 | ERROR | There is a file parse error for i_Investigation.txt. | Update i_Investigation.txt file considering error messages. |
| 3 | rule___100_100_100_03 | WARNING | There is a file parse warning for i_Investigation.txt. | Update i_Investigation.txt file considering warning messages. |
| 4 | rule___100_100_100_04 | ERROR | Investigation file name is not i_Investigation.txt | Update investigation name as i_Investigation.txt |
| 5 | rule___100_100_100_05 | ERROR | There is no parser information for i_Investigation.txt. | Define i_Investigation.txt in parserMessages. |
| 6 | rule___100_100_100_06 | ERROR | Unreferenced investigation files. | Delete multiple investigation file within study folder. |
| 7 | rule_i_100_100_001_01 | WARNING | Term Source Name length less than 2 characters in investigation file. | Term Source Name should be defined with length equal or greater than 2 characters in the ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt. |
| 8 | rule_i_100_100_002_01 | WARNING | Term Source File length less than 2 characters in investigation file. | Term Source File should be defined with length equal or greater than 2 characters in the ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt. |
| 9 | rule_i_100_300_001_01 | ERROR | No study referenced in investigation file. | Only one study should be defined in i_Investigation.txt. |
| 10 | rule_i_100_300_001_02 | ERROR | More than one study referenced in investigation file. | Only one study should be defined in i_Investigation.txt. |
| 11 | rule_i_100_300_002_01 | ERROR | Study Identifier not valid. | Study Identifier should be valid format (e.g., MTBLS(positive_number) or REQ(datetime)). |
| 12 | rule_i_100_300_003_01 | ERROR | Study Title length less than 20 characters. | Study Title should be defined with length equal or greater than 20 characters. Please use same title as first publication. |
| 13 | rule_i_100_300_003_02 | ERROR | Non-printable characters in Study Title. | Study title should contain only printable characters. |
| 14 | rule_i_100_300_003_03 | ERROR | Study Title contains only template message. | Study title should be updated. Do not use template message 'Please update the study title'. |
| 15 | rule_i_100_300_004_01 | ERROR | Study Description length less than 60 characters. | Study Description should be defined with length equal or greater than 60 characters. Please use abstract of first publication. |
| 16 | rule_i_100_300_004_02 | ERROR | Study abstract/description contains only template message. | Study abstract/description should be updated. Do not use template message 'Please update the study abstract/description'. |
| 17 | rule_i_100_300_005_01 | WARNING | Study Submission Date not valid. | Study Submission Date should be valid date and ISO8601 format (e.g., 2023-01-01). |
| 18 | rule_i_100_300_006_01 | WARNING | Study Public Release Date not valid. | Study Public Release Date should be valid date and ISO8601 format (e.g., 2023-01-01). |
| 19 | rule_i_100_310_001_01 | ERROR | There are less than 3 Study Design Descriptors in the Study Design Descriptors section of investigation file. | At least 3 study design descriptors should be defined. |
| 20 | rule_i_100_310_002_01 | ERROR | Study Design Type is empty. | Study Design Type should be defined. |
| 21 | rule_i_100_310_003_01 | WARNING | Study Design Type Term Accession Number is empty. | Study Design Type Term Accession Number should be defined. |
| 22 | rule_i_100_310_004_01 | WARNING | Study Design Type Term Source REF is empty. | Study Design Type Term Source REF should be defined. |
| 23 | rule_i_100_310_004_02 | WARNING | Study Design Type Term Source REF not referenced in investigation file. | Study Design Type Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt. |
| 24 | rule_i_100_310_004_03 | WARNING | Study Design Type Term Source REF not in prioritised control list. | A prioritised control list is defined. Review and select from the prioritised control list if possible. |
| 25 | rule_i_100_320_001_01 | ERROR | No study publications referenced in investigation file. | At least one study publications must be defined in i_Investigation.txt. |
| 26 | rule_i_100_320_003_01 | ERROR | DOI is required for published study publication. | A study publication with status published should have valid DOI. |
| 27 | rule_i_100_320_003_02 | ERROR | DOI format invalid for study publication. | If DOI is defined, its format should be a valid. |
| 28 | rule_i_100_320_004_02 | ERROR | PubMed ID format invalid for study publication. | If PubMed ID is defined, its format should be valid PubMed ID. Valid PubMed ID contains only digits. |
| 29 | rule_i_100_320_005_01 | ERROR | Study Publication Title length less than 20 characters. | Study Publication Title must be defined with length equal or greater than 25 characters. |
| 30 | rule_i_100_320_006_01 | ERROR | Study Publication Author List is empty. | Study Publication Author List must be defined. |
| 31 | rule_i_100_320_007_01 | ERROR | Study Publication Status is empty. | Study Publication Status must be defined. |
| 32 | rule_i_100_320_007_02 | WARNING | Study Publication Status not in prioritised control list. | A prioritised control list is defined. Review and select from the prioritised control list if possible. |
| 33 | rule_i_100_320_008_01 | WARNING | Study Publication Status Term Accession Number is empty. | Study Publication Status Term Accession Number should be defined. |
| 34 | rule_i_100_320_009_01 | WARNING | Study Publication Status Term Source REF is empty. | Study Publication Status Term Source REF should be defined. |
| 35 | rule_i_100_320_009_02 | WARNING | Study Publication Status Term Source REF not referenced in investigation file. | Study Publication Status Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt. |
| 36 | rule_i_100_320_009_03 | WARNING | Study Publication Status Term Source REF not in prioritised control list. | A prioritised control list is defined. Review and select from the prioritised control list if possible. |
| 37 | rule_i_100_330_001_01 | ERROR | No study factors referenced in investigation file. | At least one study factors must be defined in i_Investigation.txt. |
| 38 | rule_i_100_330_002_01 | ERROR | Study Factor Name is empty. | Study Factor Name must be defined. |
| 39 | rule_i_100_330_003_01 | ERROR | Study Factor Type length less than 2 characters. | Study Factor Type must be defined with length equal or greater than 2 characters. |
| 40 | rule_i_100_330_004_01 | WARNING | Study Factor Type Term Accession Number is empty. | Study Factor Type Term Accession Number should be defined. |
| 41 | rule_i_100_330_005_01 | WARNING | Study Factor Type Term Source REF is empty. | Study Factor Type Term Source REF should be defined. |
| 42 | rule_i_100_330_005_02 | WARNING | Study Factor Type Term Source REF not referenced in investigation file. | Study Factor Type Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt. |
| 43 | rule_i_100_330_005_03 | WARNING | Study Factor Type Term Source REF not in prioritised control list. | A prioritised control list is defined. Review and select from the prioritised control list if possible. |
| 44 | rule_i_100_340_001_01 | ERROR | No study assays referenced in investigation file. | At least one study assays should be defined in i_Investigation.txt. |
| 45 | rule_i_100_340_002_01 | ERROR | Study Assay File Name is empty in investigation file. | Assay file name should be set for each study in i_Investigation.txt. |
| 46 | rule_i_100_340_002_02 | ERROR | Study Assay File Name not correct pattern. | Assay file name must start with 'a_' and have extension '.txt'. |
| 47 | rule_i_100_340_002_03 | ERROR | There are invalid characters in assay file name. | Use only .-_A-Za-z0-9 characters for an assay file name. |
| 48 | rule_i_100_340_002_04 | ERROR | Study Assay File Name must be unique. | Assay file name must be unique for each study in i_Investigation.txt. |
| 49 | rule_i_100_340_003_01 | ERROR | Study Assay Measurement Type is empty. | Study Assay Measurement Type should be defined. |
| 50 | rule_i_100_340_004_01 | ERROR | Study Assay Measurement Type Term Accession Number is empty. | Study Assay Measurement Type Term Accession Number should be defined. |
| 51 | rule_i_100_340_005_01 | ERROR | Study Assay Measurement Type Term Source REF is empty. | Study Assay Measurement Type Term Source REF should be defined. |
| 52 | rule_i_100_340_005_02 | ERROR | Study Assay Measurement Type Term Source REF not referenced in investigation file. | Study Assay Measurement Type Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt. |
| 53 | rule_i_100_340_005_03 | WARNING | Study Assay Measurement Type Term Source REF not in prioritised control list. | A prioritised control list is defined. Review and select from the prioritised control list if possible. |
| 54 | rule_i_100_340_006_01 | ERROR | Study Assay Technology Type is empty. | Study Assay Technology Type should be defined. |
| 55 | rule_i_100_340_007_01 | ERROR | Study Assay Technology Type Term Accession Number is empty. | Study Assay Technology Type Term Accession Number should be defined. |
| 56 | rule_i_100_340_008_01 | ERROR | Study Assay Technology Type Term Source REF is empty. | Study Assay Technology Type Term Source REF should be defined. |
| 57 | rule_i_100_340_008_02 | ERROR | Study Assay Technology Type Term Source REF not referenced in investigation file. | Study Assay Technology Type Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt. |
| 58 | rule_i_100_340_008_03 | WARNING | Study Assay Technology Type Term Source REF not in prioritised control list. | A prioritised control list is defined. Review and select from the prioritised control list if possible. |
| 59 | rule_i_100_340_009_01 | ERROR | Study Assay Technology Platform is empty. | Study Assay Technology Platform should be defined. |
| 60 | rule_i_100_350_001_01 | ERROR | No study protocols referenced in investigation file. | At least one study protocols should be defined in i_Investigation.txt. |
| 61 | rule_i_100_350_001_02 | ERROR | A study protocol is missing in investigation file. | All study protocols should be defined considering assay technologies used in study. |
| 62 | rule_i_100_350_002_01 | ERROR | Study Protocol Name length less than 3 characters. | Study Protocol Name should be defined with length equal or greater than 3 characters. |
| 63 | rule_i_100_350_003_01 | ERROR | Study Protocol Description length less than 40 characters. | Study Protocol Description should be defined with length equal or greater than 40 characters. |
| 64 | rule_i_100_350_003_02 | ERROR | Non-printable characters in Study Protocol Description. | Study Protocol Description should contain only printable characters. |
| 65 | rule_i_100_350_003_03 | ERROR | Study Protocol Description contains only template message. | Study Protocol Description should be updated. Do not use template message. |
| 66 | rule_i_100_350_004_01 | WARNING | Study Protocol Type length less than 3 characters. | Study Protocol Type should be defined with length equal or greater than 3 characters. |
| 67 | rule_i_100_350_007_01 | ERROR | Study protocol parameter is missing for a study protocol. | All default study protocol parameters should be defined for study protocol. |
| 68 | rule_i_100_350_008_01 | ERROR | Study Protocol Parameters Name length less than 3 characters. | Study protocol parameters name should be defined with length equal or greater than 3 characters. |
| 69 | rule_i_100_360_001_01 | ERROR | No study contacts referenced in investigation file. | At least one study contacts should be defined in i_Investigation.txt. |
| 70 | rule_i_100_360_002_01 | ERROR | Study Person First Name length less than 2 characters. | Study Person First Name should be defined with length equal or greater than 2 characters. |
| 71 | rule_i_100_360_003_01 | ERROR | Study Person Last Name length less than 2 characters. | Study Person Last Name should be defined with length equal or greater than 2 characters. |
| 72 | rule_i_100_360_004_01 | ERROR | Study contacts have no email address. | At least one study contact must have an email address. |
| 73 | rule_i_100_360_004_02 | ERROR | Study Person Email not valid. | Study Person Email must have valid format. |
| 74 | rule_i_100_360_006_01 | ERROR | Study Person affiliation length is less than 10 characters. | Define full name of contact's primary affiliation. e.g. European Bioinformatics Institute |
| 75 | rule_i_100_360_007_01 | ERROR | Study Person Roles is empty. | At least one role should be defined for a study contact. |
| 76 | rule_i_100_360_008_01 | WARNING | Study Person Roles length less than 2 characters. | Study Person Roles should be defined with length equal or greater than 2 characters. |
| 77 | rule_i_100_360_009_01 | WARNING | Study Person Roles Term Accession Number is empty. | Study Person Roles Term Accession Number should be defined. |
| 78 | rule_i_100_360_010_01 | WARNING | Study Person Roles Term Source REF not referenced in investigation file. | Study Person Roles Term Source REFs should be referenced in the ONTOLOGY SOURCE REFERENCE section in i_Investigation.txt. |
| 79 | rule_i_100_360_010_02 | WARNING | Study Person Roles Term Source REF not in prioritised control list. | A prioritised control list is defined. Review and select from the prioritised control list if possible. |
| 80 | rule_i_100_360_010_03 | WARNING | Study Person Roles Term Source REF is empty. | Study Person Roles Term Source REF should be defined. |
| 81 | rule_i_100_360_011_01 | ERROR | There is no study contact with Principal Investigator role. | At least one study contact must have Principal Investigator role. |
| 82 | rule_i_100_360_011_02 | ERROR | Principal Investigator contact details not defined. | Principal Investigator first name, last name, ORCID, affiliation, affiliation ROR id and email must be defined. |
| 83 | rule_i_100_360_011_03 | ERROR | Study Person Affiliation ROR ID is not valid. | Study Person ROR ID must have valid format. e.g., https://ror.org/02catss52 . If your affiliation ROR ID is not defined, you may provide wikidata URL of your primary affiliation. e.g., https://www.wikidata.org/wiki/Q1341845 |
| 84 | rule_i_100_360_011_04 | ERROR | Study Person ORCID is not valid. | Study Person ORCID must have valid format. |
| 85 | rule_i_100_360_011_05 | ERROR | Study Person Additional Email Address is not valid. | Study Person Additional Email Address must have valid format. |
