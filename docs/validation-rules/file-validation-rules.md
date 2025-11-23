# Files Validation Rules

| # |RULE ID  | TYPE  | TITLE  | DESCRIPTION |
|---|---------|-------|--------|-------------|
| 1 | rule_f_400_090_001_01 | ERROR | Referenced data files not within study FILES folder\. | Referenced data files must exist within study FILES folder\. Reference data files with format FILES/\(sub folder if exists\)/\(file name\) in assay file\. |
| 2 | rule_f_400_090_001_02 | ERROR | Referenced data files do not start with FILES/ prefix\. | Reference data files with format FILES/\(sub folder if exists>>/\(file name>> in assay file\. |
| 3 | rule_f_400_090_001_03 | ERROR | Referenced data files contain invalid characters\. There are invalid characters in a referenced file name\. | Use only \.\- \_A\-Za\-z0\-9 characters as a referenced data file name\. |
| 4 | rule_f_400_090_001_04 | ERROR | Data files contain zero byte data\. | Check data files and re\-upload\. |
| 5 | rule_f_400_090_001_07 | ERROR | Folders are referenced in assay file\. | Folder reference in data file column is not allowed\. If data file type is a folder, compress it with zip utility tool and reference compressed data file\. |
| 6 | rule_f_400_090_001_08 | ERROR | A file in NMR raw data folder is referenced in assay file\. | Only \.zip files are allowed in this column\. If data file or its parent is a raw data folder, compress it with zip utility tool and reference only compressed data file \(e\.g\. 0011/fid \-> 0001\.zip, 0001/acqu \-> 0001\.zip\)\. |
| 7 | rule_f_400_090_001_09 | ERROR | Uploaded data file names contain invalid characters\. | Use only \.\-\_A\-Za\-z0\-9 characters for data file name\. |
| 8 | rule_f_400_090_002_01 | WARNING | Referenced raw data files not within RAW\_FILES folder\. | Referenced raw data files should be located within FILES/RAW\_FILES/\(sub folder if exists>>/\(file name>> and upload your data to appropriate folder\. |
| 9 | rule_f_400_090_003_01 | WARNING | Referenced derived data files not within DERIVED\_FILES folder\. | Reference your derived file DERIVED\_FILES/\(sub folder if exists>>/\(file name>> and upload your data to appropriate folder\. |
| 10 | rule_f_400_100_001_01 | ERROR | Metadata files within study FILES folder\. | Metadata files must not exist within study FILES folder\. Review and delete/move metadata files\. |
| 11 | rule_f_400_100_001_02 | WARNING | Multiple referenced data files with the same name within different folders\. | Review referenced file names and make referenced file names unique\. |
| 12 | rule_f_400_100_001_03 | WARNING | Derived data files not referenced in assay file\. | Derived data files should be referenced in assay file\. |
| 13 | rule_f_400_100_001_04 | WARNING | Raw data files not referenced in assay file\. | Raw data files should be referenced in assay file\. |
| 14 | rule_f_400_100_001_05 | ERROR | Data files with \.aspx extensions within study FILES folder\. | Data files with \.aspx extensions must not exist within study FILES folder\. Check Aspera upload completed successfully\. |
| 15 | rule_f_400_100_001_06 | ERROR | Data files with \.wiff extensions but no data files with \.wiff\.scan extensions within study FILES folder\. | Data files with \.wiff\.scan extensions often accompany data files with \.wiff extensions within study FILES folder\. Check referenced data files and re\-upload\. |
| 16 | rule_f_400_100_001_07 | ERROR | Unexpected files / folders within study root folder\. | Only reference metadata files and FILES folder are allowed within study root folder\. Sample and assay files must be referenced in i\_Investigation\.txt\. All metabolite Assignment files must be referenced in assay files\. Multiple investigation files and all other files are not allowed\. |
| 17 | rule_f_400_100_001_08 | ERROR | Data files with \.imzML extensions but no data files with \.ibd extensions within study FILES folder\. | Data files with \.ibd extensions often accompany data files with \.imzML extensions within study FILES folder\. Check referenced data files and re\-upload\. |
