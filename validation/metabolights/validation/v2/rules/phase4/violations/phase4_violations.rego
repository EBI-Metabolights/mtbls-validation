# METADATA
# scope: subpackages
# schemas:
#   - input: schema["study-model-schema"]
package metabolights.validation.v2.rules.phase4.violations

import data.metabolights.validation.v2.templates
import data.metabolights.validation.v2.utils.functions as f
import input.assays
import input.foldersInHierarchy
import input.investigationFilePath
import input.referencedAssignmentFiles
import input.referencedDerivedFiles
import input.referencedRawFiles
import input.samples
import input.studyFolderMetadata
import rego.v1

# METADATA
# title: Referenced data files not within study FILES folder.
# description: Referenced data files must exist within study FILES folder. Reference data files with format FILES/(sub folder if exists)/(file name) in assay file.
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
		row := (idx + 1) + row_offset
	}

	count(violated_values) > 0

	result := f.format_with_values(rego.metadata.rule(), file_name, header.columnIndex + 1, header.columnHeader, violated_values)
}

# METADATA
# title: Referenced data files do not start with FILES/ prefix.
# description: Reference data files with format FILES/(sub folder if exists}/(file name} in assay file.
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
		row := (idx + 1) + row_offset
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
	violated_values := {sprintf("[row: %03v, file: '%v', unexpected characters: %v]", [row, value, matches_str]) |
		some idx, value in sheet.table.data[header.columnName]
		count(value) > 0
		matches = regex.find_n("[^A-Za-z0-9/._-]", value, -1)
		matches_set := {match | some match in matches}
		matches_str := concat(" ", matches_set)
		count(matches_str) > 0
		row := (idx + 1) + row_offset
	}

	count(violated_values) > 0

	result := f.format_with_values(rego.metadata.rule(), file_name, header.columnIndex + 1, header.columnHeader, violated_values)
}

# METADATA
# title: Data files contain zero byte data.
# description: Check data files and re-upload.
# custom:
#  rule_id: rule_f_400_090_001_04
#  type: ERROR
#  priority: CRITICAL
#  section: files.general
rule_f_400_090_001_04 contains result if {
	violated_values := {
	sprintf("file: '%v', sizeInBytes: %v", [file_name, meta.sizeInBytes]) |
		some file_name
		meta := input.studyFolderMetadata.files[file_name]
		meta.sizeInBytes < 1
	}
	count(violated_values) > 0
	result := f.format_with_file_description_and_values(rego.metadata.rule(), "FILES", "Files with zero byte size", violated_values)
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
	violated_values := {value |
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
#  type: ERROR
#  priority: HIGH
#  section: files.general
rule_f_400_090_001_08 contains result if {
	some file_name, sheet in input.assays
	sheet.assayTechnique.mainTechnique == "NMR"
	some _, header in sheet.table.headers
	target_files := {"Acquisition Parameter Data File", "Free Induction Decay Data File"}
	header.columnHeader in target_files
	violated_values := {value |
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
# description: Use only .-_A-Za-z0-9 characters for data file name.
# custom:
#  rule_id: rule_f_400_090_001_09
#  type: ERROR
#  priority: HIGH
#  section: files.general
rule_f_400_090_001_09 contains result if {
	violated_values := {file |
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
# description: Referenced raw data files should be located within FILES/RAW_FILES/(sub folder if exists}/(file name} and upload your data to appropriate folder.
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
		count(value) > 0
		not startswith(value, "FILES/RAW_FILES/")
		row := (idx + 1) + row_offset
	}

	count(violated_values) > 0

	result := f.format_with_values(rego.metadata.rule(), file_name, header.columnIndex + 1, header.columnHeader, violated_values)
}

# METADATA
# title: Referenced derived data files not within DERIVED_FILES folder.
# description: Reference your derived file DERIVED_FILES/(sub folder if exists}/(file name} and upload your data to appropriate folder.
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
		row := (idx + 1) + row_offset
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
#  priority: zero
#  section: files.general
rule_f_400_100_001_01 contains result if {
	pattern := `FILES/(.+/)?([isa]_.+\.txt|m_.+\.tsv)$`
	violated_values := {file_name |
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
	raw_files := {x | some x in input.referencedRawFiles}
	derived_files := {x | some x in input.referencedDerivedFiles}

	all_referenced_files := raw_files | derived_files

	base_names := {file_meta.baseName |
		some file in all_referenced_files
		file_meta := input.studyFolderMetadata.files[file]
	}
	count(base_names) > 0

	violated_values := {base_name: files |
		some base_name in base_names
		same_base_name_files := [file |
			some file, file_meta in input.studyFolderMetadata.files
			not file_meta.baseName in {"fid", "ser", "acqus", "acqus2s"}
			file_meta.baseName == base_name
		]
		count(same_base_name_files) > 1
		sliced_same_basename_files := array.slice(same_base_name_files, 0, 10)
		files := concat(", ", sliced_same_basename_files)
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
	raw_files := {x | some x in input.referencedRawFiles}
	derived_files := {x | some x in input.referencedDerivedFiles}

	referenced_files := raw_files | derived_files
	violated_values := [file_name |
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
	raw_files := {x | some x in input.referencedRawFiles}
	derived_files := {x | some x in input.referencedDerivedFiles}

	referenced_files := raw_files | derived_files

	violated_values := [file_name |
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
	violated_values := {file |
		some file, file_meta in input.studyFolderMetadata.files
		file_meta.extension == ".aspx"
	}
	count(violated_values) > 0

	result := f.format_with_file_and_values(rego.metadata.rule(), "FILES", violated_values)
}

# METADATA
# title: Data files with .wiff extensions but no data files with .wiff.scan extensions within study FILES folder.
# description: Data files with .wiff.scan extensions often accompany data files with .wiff extensions within study FILES folder. Check referenced data files and re-upload.
# custom:
#  rule_id: rule_f_400_100_001_06
#  type: ERROR
#  priority: HIGH
#  section: files.general
rule_f_400_100_001_06 contains result if {
	wiff_scan_files := {file |
		some file, file_meta in input.studyFolderMetadata.files
		endswith(file, ".wiff.scan")
	}
	violated_values := {file |
		some file, file_meta in input.studyFolderMetadata.files
		endswith(file, ".wiff")
		expected_file_name := sprintf("%v.scan", [file])
		not expected_file_name in wiff_scan_files
	}
	count(violated_values) > 0

	result := f.format_with_file_description_and_values(rego.metadata.rule(), "FILES", ".wiff files without wiff.scan pair", violated_values)
}

# METADATA
# title: Unexpected files / folders within study root folder.
# description: Only reference metadata files and FILES folder are allowed within study root folder. Sample and assay files must be referenced in i_Investigation.txt. All metabolite Assignment files must be referenced in assay files. Multiple investigation files and all other files are not allowed.
# custom:
#  rule_id: rule_f_400_100_001_07
#  type: ERROR
#  priority: CRITICAL
#  section: files.general
rule_f_400_100_001_07 contains result if {
	metadata_files := {file_name |
		some file_name, _ in input.studyFolderMetadata.files
		not startswith(file_name, "FILES")
	}
	study_folders := {file_name |
		some file_name, _ in input.studyFolderMetadata.folders
		not startswith(file_name, "FILES")
	}
	referenced_sample_files := {x |
		some _, study in input.investigation.studies
		x := study.fileName
	}
	referenced_assay_files := {x |
		some _, study in input.investigation.studies
		some _, assay in study.studyAssays.assays
		x := assay.fileName
	}
	referenced_maf_files := {x |
		some _, assay in input.assays
		some x in assay.referencedAssignmentFiles
	}
	investigation_files = {input.investigationFilePath}
	all_referenced_files = ((referenced_sample_files | referenced_assay_files) | referenced_maf_files) | investigation_files
	all_files = metadata_files | study_folders
	extra_files = all_files - all_referenced_files

	count(extra_files) > 0

	result := f.format_with_file_and_values(rego.metadata.rule(), "FILES", extra_files)
}

# METADATA
# title: Data files with .imzML extensions but no data files with .ibd extensions within study FILES folder.
# description: Data files with .ibd extensions often accompany data files with .imzML extensions within study FILES folder. Check referenced data files and re-upload.
# custom:
#  rule_id: rule_f_400_100_001_08
#  type: ERROR
#  priority: HIGH
#  section: files.general
rule_f_400_100_001_08 contains result if {
	ibd_files := {file |
		some file, file_meta in input.studyFolderMetadata.files
		endswith(file, ".ibd")
	}
	violated_values := {file |
		some file, file_meta in input.studyFolderMetadata.files
		endswith(file, ".imzML")
		expected_file_name := sprintf("%v.ibd", [trim_suffix(file, ".imzML")])
		not expected_file_name in ibd_files
	}
	count(violated_values) > 0

	result := f.format_with_file_description_and_values(rego.metadata.rule(), "FILES", ".imzML files without .ibd pair", violated_values)
}
