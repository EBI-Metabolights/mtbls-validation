# Files Validation Rules

| # |RULE ID  | TYPE  | TITLE  | DESCRIPTION |
|---|---------|-------|--------|-------------|
| 1 | rule\_f\_400\_090\_001\_01 | ERROR | Referenced data files not within study FILES folder\. | Referenced data files must exist within study FILES folder\. Reference data files with format FILES/\(sub folder if exists\)/\(file name\) in assay file\. |
| 2 | rule\_f\_400\_090\_001\_02 | ERROR | Referenced data files do not start with FILES/ prefix\. | Reference data files with format FILES/\(sub folder if exists>>/\(file name>> in assay file\. |
| 3 | rule\_f\_400\_090\_001\_03 | ERROR | Referenced data files contain invalid characters\. There are invalid characters in a referenced file name\. | Use only \.\- \_A\-Za\-z0\-9 characters as a referenced data file name\. |
| 4 | rule\_f\_400\_090\_001\_04 | ERROR | Data files contain zero byte data\. | Check data files and re\-upload\. |
| 5 | rule\_f\_400\_090\_001\_07 | ERROR | Folders are referenced in assay file\. | Folder reference in data file column is not allowed\. If data file type is a folder, compress it with zip utility tool and reference compressed data file\. |
| 6 | rule\_f\_400\_090\_001\_08 | ERROR | A file in NMR raw data folder is referenced in assay file\. | Only \.zip files are allowed in this column\. If data file or its parent is a raw data folder, compress it with zip utility tool and reference only compressed data file \(e\.g\. 0011/fid \-> 0001\.zip, 0001/acqu \-> 0001\.zip\)\. |
| 7 | rule\_f\_400\_090\_001\_09 | ERROR | Uploaded data file names contain invalid characters\. | Use only \.\-\_A\-Za\-z0\-9 characters for data file name\. |
| 8 | rule\_f\_400\_090\_002\_01 | WARNING | Referenced raw data files not within RAW\_FILES folder\. | Referenced raw data files should be located within FILES/RAW\_FILES/\(sub folder if exists>>/\(file name>> and upload your data to appropriate folder\. |
| 9 | rule\_f\_400\_090\_003\_01 | WARNING | Referenced derived data files not within DERIVED\_FILES folder\. | Reference your derived file DERIVED\_FILES/\(sub folder if exists>>/\(file name>> and upload your data to appropriate folder\. |
| 10 | rule\_f\_400\_100\_001\_01 | ERROR | Metadata files within study FILES folder\. | Metadata files must not exist within study FILES folder\. Review and delete/move metadata files\. |
| 11 | rule\_f\_400\_100\_001\_02 | WARNING | Multiple referenced data files with the same name within different folders\. | Review referenced file names and make referenced file names unique\. |
| 12 | rule\_f\_400\_100\_001\_03 | WARNING | Derived data files not referenced in assay file\. | Derived data files should be referenced in assay file\. |
| 13 | rule\_f\_400\_100\_001\_04 | WARNING | Raw data files not referenced in assay file\. | Raw data files should be referenced in assay file\. |
| 14 | rule\_f\_400\_100\_001\_05 | ERROR | Data files with \.aspx extensions within study FILES folder\. | Data files with \.aspx extensions must not exist within study FILES folder\. Check Aspera upload completed successfully\. |
| 15 | rule\_f\_400\_100\_001\_06 | ERROR | Data files with \.wiff extensions but no data files with \.wiff\.scan extensions within study FILES folder\. | Data files with \.wiff\.scan extensions often accompany data files with \.wiff extensions within study FILES folder\. Check referenced data files and re\-upload\. |
| 16 | rule\_f\_400\_100\_001\_07 | ERROR | Unexpected files / folders within study root folder\. | Only reference metadata files and FILES folder are allowed within study root folder\. Sample and assay files must be referenced in i\_Investigation\.txt\. All metabolite Assignment files must be referenced in assay files\. Multiple investigation files and all other files are not allowed\. |
| 17 | rule\_f\_400\_100\_001\_08 | ERROR | Data files with \.imzML extensions but no data files with \.ibd extensions within study FILES folder\. | Data files with \.ibd extensions often accompany data files with \.imzML extensions within study FILES folder\. Check referenced data files and re\-upload\. |
