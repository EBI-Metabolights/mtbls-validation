package metabolights.validation.v2.rules.phase1.violations

import data.metabolights.validation.v2.utils.functions as f
import rego.v1

# #########################################################################################################
# #########################################################################################################
# # METABOLITE ASSIGNMENT FILES
# #########################################################################################################
# #########################################################################################################

# METADATA
# title: Default columns not in metabolite assignment file.
# description: Default columns must exist in metabolite assignment file.
# custom:
#  rule_id: rule_m_100_100_001_01
#  type: ERROR
#  priority: CRITICAL
#  section: metabolites.general
rule_m_100_100_001_01 contains result if {
	some file_name, _ in input.metaboliteAssignments

	template_type = input.metaboliteAssignments[file_name].assayTechnique.mainTechnique
	headers := {x | some j; x := input.metaboliteAssignments[file_name].table.headers[j].columnHeader}
	defaults := {x |
		some template in data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates[template_type]
		template.version == data.metabolights.validation.v2.rules.phase1.definitions.STUDY_TEMPLATE_VERSION
		some header in template.headers
		x := header.columnHeader
	}
	missing := defaults - headers
	count(missing) > 0
	missing_fields := concat(", ", missing)
	msg := sprintf("Missing column(s): '%v'  in '%v'.", [missing_fields, file_name])
	result := f.format(rego.metadata.rule(), msg, file_name)
}

# METADATA
# title: Unordered columns in metabolite assignment file.
# description: Unordered columns in metabolite assignment file.
# custom:
#  rule_id: rule_m_100_100_001_02
#  type: ERROR
#  priority: CRITICAL
#  section: metabolites.general
rule_m_100_100_001_02 contains result if {
	some file_name, _ in input.metaboliteAssignments

	template_type = input.metaboliteAssignments[file_name].assayTechnique.mainTechnique
	some template in data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates[template_type]
	template.version == data.metabolights.validation.v2.rules.phase1.definitions.STUDY_TEMPLATE_VERSION
	default_headers := {header.columnHeader: idx |
		some idx, header in template.headers
	}
	maf_headers := [header |
		some header in input.metaboliteAssignments[file_name].table.headers
		not startswith(header.columnHeader, "Comment[")
	]

	violated_values := [sprintf("[Expected column at index %v: '%v' found: '%v']", [x, y, z]) |
		some columnHeader, idx in default_headers
		count(maf_headers[idx].columnHeader) > 0
		columnHeader != maf_headers[idx].columnHeader

		x := maf_headers[idx].columnIndex + 1
		y := columnHeader
		z := maf_headers[idx].columnHeader
	]
	count(violated_values) > 0
	result := f.format_with_file_and_values(rego.metadata.rule(), file_name, violated_values)
}

# METADATA
# title: Empty columns in metabolite assignment file.
# description: Empty columns must not exist in metabolite assignment file. All column headers should be defined.
# custom:
#  rule_id: rule_m_100_100_001_03
#  type: ERROR
#  priority: CRITICAL
#  section: metabolites.general
rule_m_100_100_001_03 contains result if {
	input.metaboliteAssignments[i]
	headers := {sprintf("[column index: %v]", [y]) |
		some j
		header := input.metaboliteAssignments[i].table.headers[j]
		x := trim_space(header.columnHeader)
		count(x) == 0
		y := j + 1
	}
	count(headers) > 0
	source := i
	result := f.format_with_file_and_values(rego.metadata.rule(), source, headers)
}

# METADATA
# title: Default column header name is not unique in the metabolite assignment file.
# description: Default column header name should be unique in the metabolite assignment file.
# custom:
#  rule_id: rule_m_100_100_001_04
#  type: ERROR
#  priority: CRITICAL
#  section: metabolites.general
rule_m_100_100_001_04 contains result if {
	templates := data.metabolights.validation.v2.templates
	def := data.metabolights.validation.v2.rules.phase1.definitions
	some file_name, _ in input.metaboliteAssignments
	template_type = input.metaboliteAssignments[file_name].assayTechnique.mainTechnique
	some template in data.metabolights.validation.v2.templates.assignmentFileHeaderTemplates[template_type]
	template.version == data.metabolights.validation.v2.rules.phase1.definitions.STUDY_TEMPLATE_VERSION
	header_names := {header.columnHeader: same_headers |
		some header in template.headers
		not startswith(header.columnHeader, "Comment[")
		same_headers := [idx |
			some x in input.metaboliteAssignments[file_name].table.headers
			x.columnHeader == header.columnHeader
			idx := x.columnIndex + 1
		]
	}
	matches := {sprintf("[Multiple '%v' columns. Column indices: '%v']", [x1, x2]) |
		some header_name, column_indices in header_names
		count(column_indices) > 1
		x1 := header_name
		x2 := column_indices
	}
	count(matches) > 0
	result := f.format_with_file_and_values(rego.metadata.rule(), file_name, matches)
}

# METADATA
# title: Sample Name columns not in metabolite assignment file.
# description: Sample Name columns must exist in metabolite assignment file.
# custom:
#  rule_id: rule_m_100_100_002_01
#  type: WARNING
#  priority: CRITICAL
#  section: metabolites.general
rule_m_100_100_002_01 contains result if {
	some file_name, assignment in input.metaboliteAssignments

	assignment_headers := {header.columnHeader |
		some header in assignment.table.headers
	}
	assay_names := {assay_name |
		some assay_name, assay in input.assays
		some i, file in assay.referencedAssignmentFiles
		file == file_name
	}
	sample_names := {sample |
		some assay_name in assay_names
		input.assays[assay_name].table.data["Sample Name"]
		some sample in input.assays[assay_name].table.data["Sample Name"]
		count(sample) > 0
	}
	values := {sample_name |
		# some assay_name in assay_names
		some sample_name in sample_names
		not sample_name in assignment_headers
	}
	count(values) > 0
	count(values) < count(sample_names)
	source_file := file_name
	result := f.format_with_file_and_values(rego.metadata.rule(), source_file, values)
}

# METADATA
# title: MS Assay Name or NMR Assay Name columns not in metabolite assignment file
# description: If Sample Name columns do not exist, MS Assay Name or NMR Assay Name columns should be defined in metabolite assignment file.
# custom:
#  rule_id: rule_m_100_100_002_02
#  type: WARNING
#  priority: CRITICAL
#  section: metabolites.general
rule_m_100_100_002_02 contains result if {
	count(rule_m_100_100_002_01) == 0

	some file_name, assignment in input.metaboliteAssignments

	assignment_headers := {header.columnHeader |
		some header in assignment.table.headers
	}
	assay_filenames := {assay_name |
		some assay_name, assay in input.assays
		some i, file in assay.referencedAssignmentFiles
		file == file_name
	}

	sample_names := {sample |
		some assay_name in assay_filenames
		some sample in input.assays[assay_name].sampleNames
		count(sample) > 0
	}
	assay_names := {sample |
		some assay_name in assay_filenames
		some sample in input.assays[assay_name].assayNames
		count(sample) > 0
	}
	missing_samples := {sample_name |
		# some assay_name in assay_names
		some sample_name in sample_names
		not sample_name in assignment_headers
	}
	count(missing_samples) == count(sample_names)

	values := {sample_name |
		# some assay_name in assay_names
		some sample_name in assay_names
		not sample_name in assignment_headers
	}
	source_file := file_name
	result := f.format_with_file_description_and_values(rego.metadata.rule(), source_file, "Missing column(s) in assignment file", values)
}

# METADATA
# title: Metabolite assignment file not referenced in assay file.
# description: Metabolite assignment file must be referenced in assay file.
# custom:
#  rule_id: rule_m_100_100_004_01
#  type: ERROR
#  priority: CRITICAL
#  section: metabolites.general
rule_m_100_100_004_01 contains result if {
	referenced_files := {file_name | some _, file_name in input.assays[_].referencedAssignmentFiles}
	some assignment_file_name, _ in input.metaboliteAssignments
	not assignment_file_name in referenced_files
	files_str := concat(", ", referenced_files)
	msg := sprintf("Metabolite assignment file '%v' is not referenced in an assay file. Referenced assignment files  in assay files: '%v'", [assignment_file_name, files_str])
	source := assignment_file_name
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: Metabolite assignment file name not correct pattern.
# description: Metabolite assignment file name must start with 'm_' and have extension '.tsv'.
# custom:
#  rule_id: rule_m_100_100_005_01
#  type: ERROR
#  priority: CRITICAL
#  section: metabolites.general
rule_m_100_100_005_01 contains result if {
	pattern := `^m_.+\.tsv$`
	count(input.metaboliteAssignments) > 0
	some file_name, _ in input.metaboliteAssignments
	not regex.match(pattern, file_name)
	msg := sprintf("Invalid metabolite assignment file name '%v'.", [file_name])
	source := file_name
	result := f.format(rego.metadata.rule(), msg, source)
}

# METADATA
# title: There is no row in metabolite assignment file.
# description: No row is defined in metabolite assignment file. Add more than one row (assignment). Please ensure all xxx, including controls, QCs, standards, etc, are referenced.
# custom:
#  rule_id: rule_m_100_100_006_01
#  type: ERROR
#  priority: CRITICAL
#  section: metabolites.general
rule_m_100_100_006_01 contains result if {
	some file_name, assignment in input.metaboliteAssignments
	assignment.table.rowOffset == 0
	assignment.table.totalRowCount == 0

	msg := sprintf("There is no row in the file '%v'.", [file_name])
	sourceFile := file_name

	# sourceColumnIndex := ""
	result := f.format(rego.metadata.rule(), msg, sourceFile)
}

# METADATA
# title: There is only one row in metabolite assignment file.
# description: Only one row is defined in metabolite assignment file. Add more than one row (assignment). Please ensure all xxx, including controls, QCs, standards, etc, are referenced.
# custom:
#  rule_id: rule_m_100_100_006_02
#  type: ERROR
#  priority: HIGH
#  section: metabolites.general
rule_m_100_100_006_02 contains result if {
	some file_name, assignment in input.metaboliteAssignments
	assignment.table.rowOffset == 0
	assignment.table.totalRowCount == 1

	msg := sprintf("There is only one row in the file '%v'.", [file_name])
	sourceFile := file_name

	# sourceColumnIndex := ""
	result := f.format(rego.metadata.rule(), msg, sourceFile)
}
