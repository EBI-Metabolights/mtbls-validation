# METADATA
# scope: subpackages
# schemas:
#   - input: schema["study-model-schema"]
package metabolights.validation.v2.phase4.violations

import rego.v1
import data.metabolights.validation.v2.functions as f
import data.metabolights.validation.v2.templates
import input.samples
import input.assays
import input.studyFolderMetadata
import input.investigationFilePath
import input.foldersInHierarchy
import input.referencedDerivedFiles
import input.referencedRawFiles
import input.referencedAssignmentFiles

# METADATA
# title: Referenced data files not within study FILES folder.
# description: Referenced data files must exist within study FILES folder. Reference data files with format FILES/<<sub folder if exists>>/<<file name>> in assay file.
# custom:
#  rule_id: rule_f_400_090_001_01
#  type: ERROR
#  priority: CRITICAL
#  section: files.general
rule_f_400_090_001_01 contains result if {

	some file_name, sheet in input.assays
	some _, header in sheet.table.headers
    endswith(header.columnHeader, " Data File")
    row_offset = sheet.table.rowOffset
	violated_values := {sprintf("[row: %03v, file name: '%v']", [row, value]) |
		some idx, value in sheet.table.data[header.columnName]
		count(value) > 0
        not input.studyFolderMetadata.files[value]
        not input.studyFolderMetadata.folders[value]
        prefixed_file_name := sprintf("FILES/%v", [value])
        not input.studyFolderMetadata.files[prefixed_file_name]
        not input.studyFolderMetadata.folders[prefixed_file_name]
        row := idx + 1 + row_offset
	}

    count(violated_values) > 0

    result := f.format_with_values(rego.metadata.rule(), file_name, header.columnIndex + 1, header.columnHeader, violated_values)
}


# METADATA
# title: Referenced data files do not start with FILES/ prefix.
# description: Reference data files with format FILES/<<sub folder if exists>>/<<file name>> in assay file.
# custom:
#  rule_id: rule_f_400_090_001_02
#  type: ERROR
#  priority: CRITICAL
#  section: files.general
rule_f_400_090_001_02 contains result if {

	some file_name, sheet in input.assays
	some _, header in sheet.table.headers
    endswith(header.columnHeader, " Data File")
    row_offset = sheet.table.rowOffset
	violated_values := {sprintf("[row: %03v, file name: '%v']", [row, value]) |
		some idx, value in sheet.table.data[header.columnName]
		count(value) > 0
        not input.studyFolderMetadata.files[value]
        prefixed_file_name := sprintf("FILES/%v", [value])
        input.studyFolderMetadata.files[prefixed_file_name]
        row := idx + 1 + row_offset
	}

    count(violated_values) > 0

    result := f.format_with_values(rego.metadata.rule(), file_name, header.columnIndex + 1, header.columnHeader, violated_values)
}


# METADATA
# title: Referenced data files contain invalid characters. There are invalid characters in a referenced file name.
# description: Use only .- _A-Za-z0-9 characters as a referenced data file name.
# custom:
#  rule_id: rule_f_400_090_001_03
#  type: ERROR
#  priority: HIGH
#  section: files.general
rule_f_400_090_001_03 contains result if {

	some file_name, sheet in input.assays
	some _, header in sheet.table.headers
    endswith(header.columnHeader, " Data File")
    row_offset = sheet.table.rowOffset
	violated_values := { sprintf("[row: %03v, file: '%v', unexpected characters: %v]", [row, value, matches_str]) | 
		some idx, value in sheet.table.data[header.columnName]
		count(value) > 0
        matches = regex.find_n("[^A-Za-z0-9/._-]", value, -1)
        matches_set := { match | some match in matches}
        matches_str := concat(" ", matches_set)
        count(matches_str) > 0
        row := idx + 1 + row_offset
	}

    count(violated_values) > 0

    result := f.format_with_values(rego.metadata.rule(), file_name, header.columnIndex + 1, header.columnHeader, violated_values)
}


# METADATA
# title: Referenced data files contain zero byte data.
# description: Check referenced data files and re-upload.
# custom:
#  rule_id: rule_f_400_090_001_04
#  type: ERROR
#  priority: CRITICAL
#  section: files.general
rule_f_400_090_001_04 contains result if {

	some file_name, sheet in input.assays
	some _, header in sheet.table.headers
    endswith(header.columnHeader, " Data File")
    row_offset = sheet.table.rowOffset
	violated_values := { sprintf("[row: %03v, file: '%v']", [row, value]) | 
		some idx, value in sheet.table.data[header.columnName]
		count(value) > 0
        meta := input.studyFolderMetadata.files[value]
        meta.sizeInBytes < 1
        row := idx + 1 + row_offset
	}
    count(violated_values) > 0

    result := f.format_with_values(rego.metadata.rule(), file_name, header.columnIndex + 1, header.columnHeader, violated_values)
}


# METADATA
# title: Folders are referenced in assay file.
# description: Folder reference in data file column is not allowed. If data file type is a folder, compress it with zip utility tool and reference compressed data file.
# custom:
#  rule_id: rule_f_400_090_001_07
#  type: ERROR
#  priority: HIGH
#  section: files.general
rule_f_400_090_001_07 contains result if {
    some file_name, sheet in input.assays
    some _, header in sheet.table.headers
    endswith(header.columnHeader, " Data File")
    violated_values := { value | 
		some idx, value in sheet.table.data[header.columnName]
		count(value) > 0
        not input.studyFolderMetadata.files[value]
        input.studyFolderMetadata.folders[value]
	}

    count(violated_values) > 0
    
    result := f.format_with_values(rego.metadata.rule(), file_name, header.columnIndex + 1, header.columnHeader, violated_values)
}



# METADATA
# title: A file in NMR raw data folder is referenced in assay file.
# description: Only .zip files are allowed in this column. If data file or its parent is a raw data folder, compress it with zip utility tool and reference only compressed data file (e.g. 0011/fid -> 0001.zip, 0001/acqu -> 0001.zip).
# custom:
#  rule_id: rule_f_400_090_001_08
#  type: WARNING
#  priority: CRITICAL
#  section: files.general
rule_f_400_090_001_08 contains result if {
    some file_name, sheet in input.assays
    sheet.assayTechnique.mainTechnique == "NMR"
    some _, header in sheet.table.headers
    target_files := {"Acquisition Parameter Data File", "Free Induction Decay Data File"}
    header.columnHeader in target_files
    violated_values := { value | 
		some idx, value in sheet.table.data[header.columnName]
		count(value) > 0
        input.studyFolderMetadata.files[value]
        not endswith(value, ".zip")
	}
    count(violated_values) > 0
    
    result := f.format_with_values(rego.metadata.rule(), file_name, header.columnIndex + 1, header.columnHeader, violated_values)
}


# METADATA
# title: Uploaded data file names contain invalid characters.
# description: Use only .- _A-Za-z0-9 characters for data file name.
# custom:
#  rule_id: rule_f_400_090_001_09
#  type: ERROR
#  priority: HIGH
#  section: files.general
rule_f_400_090_001_09 contains result if {

    violated_values := { file | 
		some file, _ in input.studyFolderMetadata.files
		matches = regex.find_n("[^A-Za-z0-9/._-]", file, -1)
        count(matches) > 0
	}

	count(violated_values) > 0
	msg := "File names have invalid characters. Use only .-_A-Za-z0-9 characters for file name."
	source := input.investigationFilePath
	result := f.format_with_file_description_and_values(rego.metadata.rule(), "input", msg, violated_values)
}


# METADATA
# title: Referenced raw data files not within RAW_FILES folder.
# description: Referenced raw data files should be located within FILES/RAW_FILES/<<sub folder if exists>>/<<file name>> and upload your data to appropriate folder.
# custom:
#  rule_id: rule_f_400_090_002_01
#  type: WARNING
#  priority: LOW
#  section: files.general
rule_f_400_090_002_01 contains result if {

	some file_name, sheet in input.assays
	some _, header in sheet.table.headers
    header.columnHeader == "Raw Spectral Data File"
    row_offset = sheet.table.rowOffset
	violated_values := {sprintf("[row: %03v, file name: '%v']", [row, value]) |
		some idx, value in sheet.table.data[header.columnName]
        not startswith(value, "FILES/RAW_FILES/")
        row := idx + 1 + row_offset
	}

    count(violated_values) > 0

    result := f.format_with_values(rego.metadata.rule(), file_name, header.columnIndex + 1, header.columnHeader, violated_values)
}

# METADATA
# title: Referenced derived data files not within DERIVED_FILES folder.
# description: Reference your derived file DERIVED_FILES/<<sub folder if exists>>/<<file name>> and upload your data to appropriate folder.
# custom:
#  rule_id: rule_f_400_090_003_01
#  type: WARNING
#  priority: LOW
#  section: files.general
rule_f_400_090_003_01 contains result if {
	some file_name, sheet in input.assays
	some _, header in sheet.table.headers
    header.columnHeader == "Derived Spectral Data File"
    row_offset = sheet.table.rowOffset
	violated_values := {sprintf("[row: %03v, file name: '%v']", [row, value]) |
		some idx, value in sheet.table.data[header.columnName]
        count(value) > 0
        not startswith(value, "FILES/DERIVED_FILES/")
        row := idx + 1 + row_offset
	}

    count(violated_values) > 0

    result := f.format_with_values(rego.metadata.rule(), file_name, header.columnIndex + 1, header.columnHeader, violated_values)
}


# METADATA
# title: Metadata files within study FILES folder.
# description: Metadata files must not exist within study FILES folder. Review and delete/move metadata files.
# custom:
#  rule_id: rule_f_400_100_001_01
#  type: ERROR
#  priority: HIGH
#  section: files.general
rule_f_400_100_001_01 contains result if {
	pattern := `FILES/.*([isa]_.+\.txt|m_.+\.tsv)$`    
    violated_values := { file_name | 
		some file_name, _ in input.studyFolderMetadata.files
        regex.match(pattern, file_name)
	}

    count(violated_values) > 0

    result := f.format_with_file_and_values(rego.metadata.rule(), "FILES", violated_values)
}

# METADATA
# title: Multiple referenced data files with the same name within different folders.
# description: Review referenced file names and make referenced file names unique.
# custom:
#  rule_id: rule_f_400_100_001_02
#  type: WARNING
#  priority: HIGH
#  section: files.general
rule_f_400_100_001_02 contains result if {
    raw_files := { x | some x in input.referencedRawFiles }
    derived_files := { x | some x in input.referencedDerivedFiles }

    all_referenced_files := raw_files |  derived_files

    base_names := { file_meta.baseName |
        some file in all_referenced_files
        file_meta := input.studyFolderMetadata.files[file]
    }
    count(base_names) > 0

    # print(base_names)
    violated_values := { base_name: files |
        some base_name in base_names
        same_base_name_files := { file |
            some file, file_meta in input.studyFolderMetadata.files
            file_meta.baseName == base_name
        }
        count(same_base_name_files) > 1
        files := concat(", ", same_base_name_files)
    }
    count(violated_values) > 0

    result := f.format_with_file_and_values(rego.metadata.rule(), "FILES", violated_values)
}



# METADATA
# title: Derived data files not referenced in assay file.
# description: Derived data files should be referenced in assay file.
# custom:
#  rule_id: rule_f_400_100_001_03
#  type: WARNING
#  priority: CRITICAL
#  section: files.general
rule_f_400_100_001_03 contains result if {

    raw_files := { x | some x in input.referencedRawFiles }
    derived_files := { x | some x in input.referencedDerivedFiles }

    referenced_files := raw_files |  derived_files
    violated_values := [ file_name | 
        some file_name, file_meta in input.studyFolderMetadata.files
        lower(file_meta.extension) in data.metabolights.validation.v2.configuration.derivedFileExtensions
        not file_name in referenced_files
    ]
    count(violated_values) > 0

    result := f.format_with_file_and_values(rego.metadata.rule(), "FILES", violated_values)
}



# METADATA
# title: Raw data files not referenced in assay file.
# description: Raw data files should be referenced in assay file.
# custom:
#  rule_id: rule_f_400_100_001_04
#  type: WARNING
#  priority: CRITICAL
#  section: files.general
rule_f_400_100_001_04 contains result if {



    raw_files := { x | some x in input.referencedRawFiles }
    derived_files := { x | some x in input.referencedDerivedFiles }

    referenced_files := raw_files |  derived_files

    violated_values := [ file_name | 
        some file_name, file_meta in input.studyFolderMetadata.files
        lower(file_meta.extension) in data.metabolights.validation.v2.configuration.rawFileExtensions
        not file_name in referenced_files
    ]
    count(violated_values) > 0

    result := f.format_with_file_and_values(rego.metadata.rule(), "FILES", violated_values)
}



# METADATA
# title: Data files with .aspx extensions within study FILES folder.
# description: Data files with .aspx extensions must not exist within study FILES folder. Check Aspera upload completed successfully.
# custom:
#  rule_id: rule_f_400_100_001_05
#  type: ERROR
#  priority: CRITICAL
#  section: files.general
rule_f_400_100_001_05 contains result if {

    violated_values := { file | 
		some file, file_meta in input.studyFolderMetadata.files
        file_meta.extension == ".aspx"
	}
    count(violated_values) > 0
    
    result := f.format_with_file_and_values(rego.metadata.rule(), "FILES", violated_values)}




# METADATA
# title: Data files with .wiff extensions but no data files with .wiff.scan extensions within study FILES folder.
# description: Data files with .wiff.scan extensions often accompany data files with .wiff extensions within study FILES folder. Check referenced data files and re-upload.
# custom:
#  rule_id: rule_f_400_100_001_06
#  type: ERROR
#  priority: HIGH
#  section: files.general
rule_f_400_100_001_06 contains result if {
    wiff_scan_files := { file | 
		some file, file_meta in input.studyFolderMetadata.files
        endswith(file, ".wiff.scan")
	}
    violated_values := { file | 
		some file, file_meta in input.studyFolderMetadata.files
        endswith(file, ".wiff")
        expected_file_name := sprintf("%v.scan", [file])
        not expected_file_name in wiff_scan_files
	}
    count(violated_values) > 0
    
    result := f.format_with_file_description_and_values(rego.metadata.rule(), "FILES", ".wiff files without wiff.scan pair",violated_values)}

